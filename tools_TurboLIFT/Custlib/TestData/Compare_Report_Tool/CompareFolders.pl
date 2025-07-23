#!/usr/bin/perl

use strict;
use warnings;
use Tk;
use File::Compare;
use File::Find;
use File::Basename;

my $mw = MainWindow->new;
$mw->title("Compare Folders");

my $default_dir1 = "C:/Users/Reports/Report_Custlib";
my $default_dir2 = "C:/sandboxes/ma12_CustLib_Testing";
my $bcompare_path = "C:/Program Files/Beyond Compare 4/BCompare.exe";

my ($dir1, $dir2, $extensions, $compare_checked);
my ($file_count, $diff_count, $miss_count, $duplicate_cnt);
my (@diff_files, @miss_files, @duplicate_files);
my %files_seen;
my $dir1_label = $mw->Label(-text => "Folder1: ")->grid(-row => 0, -column => 0, -sticky => "w", -padx => 5);
my $dir1_entry = $mw->Entry(-width => 70, -text => $default_dir1 )->grid(-row => 0, -column => 1);
my $dir1_button = $mw->Button(
    -text => "Browse",
    -command => sub {
        $dir1 = $mw->chooseDirectory();
        $dir1_entry->delete(0, "end");
        $dir1_entry->insert(0, $dir1);
    }
)->grid(-row => 0, -column => 2);

my $dir2_label = $mw->Label(-text => "Folder2: ")->grid(-row => 1, -column => 0, -sticky => "w", -padx => 5);
my $dir2_entry = $mw->Entry(-width => 70, -text => $default_dir2 )->grid(-row => 1, -column => 1);
my $dir2_button = $mw->Button(
    -text => "Browse",
    -command => sub {
        $dir2 = $mw->chooseDirectory();
        $dir2_entry->delete(0, "end");
        $dir2_entry->insert(0, $dir2);
    }
)->grid(-row => 1, -column => 2);

my $exts_label = $mw->Label(-text => "Extensions: ")->grid(-row => 2, -column => 0, -sticky => "w", -padx => 5);
my $exts_entry = $mw->Entry(-text => "pm,can", -width => 70)->grid(-row => 2, -column => 1);

my $compare_checkbox = $mw->Checkbutton(
    -text => "Open Beyond Compare 4 when detect diferent files",
    -variable => \$compare_checked,
)->grid(-row => 3, -column => 1, -sticky => "w", -padx => 5);

my $compare_button = $mw->Button(
    -text => "Compare",
    -command => sub {
        $dir1 = $dir1_entry->get();
        $dir2 = $dir2_entry->get();
        $extensions = $exts_entry->get();

        if (not defined $dir1 or not defined $dir2) {
            $mw->messageBox(-message => "Please provide both directories");
            return;
        }

        $file_count = 0;
        $diff_count = 0;
		$miss_count = 0;
		$duplicate_cnt = 0;
		@diff_files = ();
		@miss_files = ();
		@duplicate_files = ();
        %files_seen = ();
		
		print "-------------------------------------------------------\n";
		print "START COMPARATION BETWEEN: \n";
		print "Folder1: '$dir1' AND\n";
		print "Folder2: '$dir2'\n";
		print "-------------------------------------------------------\n";

        find(\&compare_files, $dir1);
		
		if ($diff_count > 0) {
			print "------\n";
			print "$diff_count files which have different content between Folder1 and Folder2:\n";
			foreach my $file (@diff_files){
				print "		$file\n";
			}
		}
		if ($miss_count > 0) {
			print "------\n";
			print "$miss_count files which exist in Folder1 but don't exist in Folder2:\n";
			foreach my $file (@miss_files){
				print "		$file\n";
			}
		}
		if ($duplicate_cnt > 0) {
			print "------\n";
			print "$duplicate_cnt files which occur more than once in Folder2:\n";
			foreach my $file (@duplicate_files){
				print "		$file\n";
			}
		}

        $mw->messageBox(
            -message => "Total: $file_count files.\n Different: $diff_count files.\n Missing: $miss_count files.\n Duplicate: $duplicate_cnt files",
            -title => "Comparison Results"
        );
    }
)->grid(-row => 4, -column => 1);

$compare_checked = 1;  # set initial state to compare_checked

MainLoop();

sub compare_files {
    my $file1 = $File::Find::name;
	my $file1_name = basename($file1);
	my $file1_state;

    if (-f $file1) {
        if (file_has_ext($file1, $extensions)) {
            my $file2_arr = find_matching_file($file1_name, $dir2);
			
			if (scalar @$file2_arr == 0) {
                push(@miss_files, $file1_name);
                $miss_count++;
				$file1_state = 'missing';				
			}
			elsif (scalar @$file2_arr > 1){
                push(@duplicate_files, $file1_name);
				$duplicate_cnt++;
				$file1_state = 'duplicate';
				print "	Duplicate locations of $file1_name:\n";
				my $i = 1;
				foreach my $file2 (@$file2_arr) {
					my $sub_state = compare_result($file1, $file2);
					print "	$i. $file2: [$sub_state]\n";
					$i++;
				}
			}
            else {
				my $file2 = $file2_arr->[0];
				$file1_state = compare_result($file1, $file2);
				if($file1_state eq 'different'){
					push(@diff_files, $file1_name);
					$diff_count++;
				}					
			}
			print "Checking completed for $file1_name: [$file1_state].\n";
			$file_count++;
        }
    }
}

sub find_matching_file {
    my ($file1, $dir2) = @_;

    my @subdirs = get_subdirs($dir2);
	my @file2_arr;

    foreach my $subdir (@subdirs) {
        my $file2 = "$subdir/$file1";
        push(@file2_arr, $file2) if (-f $file2);
    }

    return \@file2_arr;
}

sub get_subdirs {
    my $dir = shift;
    my @subdirs;

    find(
        {
            wanted => sub {
                push @subdirs, $File::Find::name if (-d $_);
            },
            follow => 1,
        },
        $dir
    );

    return @subdirs;
}

sub file_has_ext {
    my $file = shift;
    my $exts = shift;

	if ($exts eq "") {
		return 1;
	}
	else {
		my @ext_list = split(/,/, $exts);
		foreach my $ext (@ext_list) {
			return 1 if ($file =~ /\.$ext$/i);
		}
		return 0;
	}
    
}

sub compare_result {
	my ($file_a, $file_b) = @_;
	my $result = compare($file_a, $file_b);
	my $state;

	if ($result != 0) {
		$state = 'different';
		if ($compare_checked) {
			my $cmd = "start \"\" \"$bcompare_path\" \"$file_a\" \"$file_b\"";
			system($cmd);
		}
	}
	else {
		$state = 'same';
	}
	return $state;
}
