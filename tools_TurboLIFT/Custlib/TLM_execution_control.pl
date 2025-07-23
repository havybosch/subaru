# *****************************************************************************************************
#
#  Copyright (c)       Robert Bosch GmbH
#                      Germany
#                      All rights reserved
#
#******************************************************************************************************
package TLM_execution_control;

use strict;
use warnings;
use File::Find;
use File::Copy;
use File::Basename;

=head1 NAME

TLM_execution_control

#COMMENT-START

=head1 SYNOPSIS

    TLM_execution_control <TestAreasString> <TestBenchLabel> <TestType> <CustlibPath>

    E.g. 

    TLM_execution_control "EDR" "Crash && RT4" "full" "C:\sandboxes\TurboLIFT_Testarea_development_RT4\USER\tools_TurboLIFT\Custlib"
    TLM_execution_control "CSEM, FaultList" "Manitoo && RT4" "develop" "C:\sandboxes\TurboLIFT_Testarea_development_RT4\USER\tools_TurboLIFT\Custlib"
    TLM_execution_control "all" "Labcar && RT4" "regression" "C:\sandboxes\TurboLIFT_Testarea_development_RT4\USER\tools_TurboLIFT\Custlib"

=head1 DESCRIPTION

Searches batch files or test lists in <CustlibPath> and sub-folders that follow one of the following naming convention:

    TLM_<TestArea>_<TestBench>_<TestType>_<...>.bat
    TL_<TestArea>_<TestBench>_<TestType>_<...>.txt
    TLM_<TestArea>_<TestBench>_template.bat
    TLM_<TestArea>_template.bat
    
The suffix _<...> is always optional, <...> stands for any combination of characters.

If TLM_<TestArea>_<TestBench>_<TestType>_<#>.bat is found then it is copied to sub-folder "Jenkins_batch" of <CustlibPath>.
If TL_<TestArea>_<TestBench>_<TestType>_<#>.txt and TLM_<TestArea>_<TestBench>_template.bat or TLM_<TestArea>_template.bat are found
then the *template.bat file is copied to sub-folder "Jenkins_batch" of <CustlibPath> and the path to TL_<TestArea>_<TestBench>_<TestType>_<#>.txt
is inserted into the batch file.

=head1 ARGUMENTS

=over

=item <TestAreasString>

String containing either a single test area name, a list of test area names (comma separated) or "all".
"all" will be replaced internally by a list of names of all test areas that are present in the current stream.

=item <TestBenchLabel>

Label of a Jenkins test execution build. Typically a combination of test bench type and ECU type, e.g. "Crash && RT4".
Allowed test bench types are: Crash, Labcar, Manitoo.

=item <TestType>

String with name of test type. Convention is to have the following test types:
full, regression, quick, develop, ASIL

=item <CustlibPath>

Path to Custlib in the sandbox.

=back

#COMMENT-END

=cut

#STEP get arguments
my $testAreasString = shift;
my $testBenchLabel  = shift;
my $testType        = shift;
my $custlibPath     = shift;

my $searchPath  = $custlibPath;
my $destination = $custlibPath . '/Jenkins_batch';

print("---TLM_execution_control---\n");

my @testAreas;
$testAreasString =~ s/^\s*(.+)\s*$/$1/;

#IF TestAreasString is 'all'?
if ( $testAreasString eq 'all' ) {

    #IF-YES-START
    #CALL GetAllTestAreas
    @testAreas = GetAllTestAreas();

    #IF-YES-END
}
else {
    #IF-NO-START
    #STEP get test areas from TestAreasString
    @testAreas = split( /\s*,\s*/, $testAreasString );

    #IF-NO-END
}

#CALL GetTestBench
my $testBench = GetTestBench();

print("Running TLM_execution_control with   TestType = $testType   TestBench = $testBench   TestAreas = @testAreas\n");
print("Copy destination is $destination.\n");

#LOOP-START loop over all files in Custlib
#CALL FindBatchOrLists
my $batchLists_href;
find( { wanted => \&FindBatchOrLists }, $searchPath );

#LOOP-END last file?

#CALL CreateAndCopyFiles
CreateAndCopyFiles();

#END end
print("TLM_execution_control finished.\n");

=head2 GetAllTestAreas

    @allTestAreas = GetAllTestAreas();

Returns a list with the names of all test areas ("TestArea_<name>") in Platform folder of the sandbox.

=cut

sub GetAllTestAreas {

    #STEP open Platform folder
    my $platformPath = $custlibPath . '/../Platform';
    my @allTestAreas;
    my $success = opendir( my $DIR, $platformPath );
    if ( not $success ) {
        print "--ERROR--: Read directory failed: $!";
        return ();
    }

    #LOOP-START loop over all folder entries (files/subfolders)
    while ( my $entry = readdir $DIR ) {

        #STEP ignore entry if it is not a folder
        next unless -d $platformPath . '/' . $entry;

        #STEP ignore entry if it is . or ..
        next if $entry eq '.' or $entry eq '..';

        #STEP add entry to @allTestAreas if it has the form TestArea_<name>
        if ( $entry =~ /^TestArea_(\w+)$/ ) {
            push( @allTestAreas, $1 );
        }
    }

    #LOOP-END last folder entry?
    closedir $DIR;

    #END return @allTestAreas
    return @allTestAreas;
}

=head2 GetTestBench

    $chosenTestBench = GetTestBench();

Returns the test bench type name from TestBenchLabel

=cut

sub GetTestBench {
    my @allTestBenches = qw(
      Crash
      LabcarManitoo
      Labcar
      Manitoo
    );

    #LOOP-START loop over all known test bench types
    my $chosenTestBench = '';
    foreach my $testBench (@allTestBenches) {

        #STEP set $chosenTestBench to test bench type if TestBenchLabel contains test bench type
        if ( $testBenchLabel =~ /$testBench/ ) {
            $chosenTestBench = $testBench;
            last;
        }
    }

    #LOOP-END last test bench type?

    #STEP error if $chosenTestBench is empty string
    if ( $chosenTestBench eq '' ) {
        print "--ERROR--: None of the known test benches (@allTestBenches) found in given testBenchLabel = $testBenchLabel.\n";
    }

    #END return $chosenTestBench
    return $chosenTestBench;
}

=head2 FindBatchOrLists

    FindBatchOrLists();

Function for find command. Adds the full path of the current file to $batchLists_href if it has the following form:

    TLM_<TestArea>_<TestBench>_<TestType>_<...>.bat
        path added to $batchLists_href->{TestArea}{batch}{...}

    TL_<TestArea>_<TestBench>_<TestType>_<...>.txt
        path added to $batchLists_href->{TestArea}{list}{...}

    TLM_<TestArea>_<TestBench>_template.bat
        path added to $batchLists_href->{TestArea}{batchBenchTemplate}
        
    TLM_<TestArea>_template.bat
        path added to $batchLists_href->{TestArea}{batchTemplate}

If _<...> is missing then ... is set to 0.

=cut

sub FindBatchOrLists {
    my $currentFileName = $_;
    my $currentFilePath = $File::Find::name;

    #STEP return if current folder is same as copy destination
    if ( $File::Find::dir eq $destination ) {
        return;
    }

    #LOOP-START loop over all test areas
    foreach my $testArea (@testAreas) {

        #STEP if file is TLM_<TestArea>_<TestBench>_<TestType>_<...>.bat then add path to $batchLists_href->{TestArea}{batch}{...}
        if ( $currentFileName =~ /^TLM_($testArea)(-[0-9a-zA-Z]+)?_($testBench)_($testType)(_.+)?.bat$/ ) {
            my $hexFile = $2 // '-Default';
            $hexFile = substr( $hexFile, 1 );
            my $suffix = $5 // 0;
            $batchLists_href->{$testArea}{batch}{$hexFile}{$suffix} = $currentFilePath;
        }

        #STEP if file is TLM_<TestArea>_<TestBench>_template.bat then add path to $batchLists_href->{TestArea}{batchBenchTemplate}
        elsif ( $currentFileName =~ /^TLM_($testArea)_($testBench)_template.bat$/ ) {
            $batchLists_href->{$testArea}{batchBenchTemplate} = $currentFilePath;
        }

        #STEP if file is TLM_<TestArea>_template.bat then add path to $batchLists_href->{TestArea}{batchTemplate}
        elsif ( $currentFileName =~ /^TLM_($testArea)_template.bat$/ ) {
            $batchLists_href->{$testArea}{batchTemplate} = $currentFilePath;
        }

        #STEP if file is TL_<TestArea>_<TestBench>_<TestType>_<...>.txt then add path to $batchLists_href->{TestArea}{list}{...}
        elsif ( $currentFileName =~ /^TL_($testArea)(-[0-9a-zA-Z]+)?_($testBench)_($testType)(_.+)?.txt$/ ) {
            my $hexFile = $2 // '-Default';
            $hexFile = substr( $hexFile, 1 );
            my $suffix = $5 // 0;
            $batchLists_href->{$testArea}{list}{$hexFile}{$suffix} = $currentFilePath;
        }
    }

    #LOOP-END last test area?

    #END return
    return 1;
}

=head2 CreateAndCopyFiles

    CreateAndCopyFiles();

For all test areas:
From $batchLists_href->{TestArea}{batch} copies all batch files to destination folder.
From $batchLists_href->{TestArea}{list} creates for each test list a batch file in destination folder 
using $batchLists_href->{TestArea}{batchBenchTemplate} or $batchLists_href->{TestArea}{batchTemplate}.

=cut

sub CreateAndCopyFiles {
    my $copyCount = 0;

    #LOOP-START loop over all test areas
    foreach my $testArea (@testAreas) {

        #STEP next test area if $batchLists_href->{$testArea} does not exist
        if ( not exists $batchLists_href->{$testArea} ) {
            print("---INFO---: No batch file or test list found according to naming conventions for TestArea $testArea.\n");
            next;
        }

        #IF $batchLists_href->{$testArea}{batch} exists?
        if ( exists $batchLists_href->{$testArea}{batch} ) {

            #IF-YES-START
            #STEP copy all batch files to destination folder
            foreach my $hexFile ( keys %{ $batchLists_href->{$testArea}{batch} } ) {
                foreach my $suffix ( keys %{ $batchLists_href->{$testArea}{batch}{$hexFile} } ) {
                    my $batchName = basename($batchLists_href->{$testArea}{batch}{$hexFile}{$suffix});
                    $batchName = $hexFile . '_' . $batchName;
                    my $newBatchPath = $destination . '/' . $batchName;
                    my $success = copy( $batchLists_href->{$testArea}{batch}{$hexFile}{$suffix}, $newBatchPath );
                    if ( not $success ) {
                        print "--ERROR--: Copy of $batchLists_href->{$testArea}{batch}{$hexFile}{$suffix} failed: $!\n";
                        next;
                    }
                    $copyCount++;
                    print("Copied $batchLists_href->{$testArea}{batch}{$hexFile}{$suffix}\n");
                }
            }

            #IF-YES-END
        }

        #IF-NO-START
        #IF $batchLists_href->{$testArea}{list} exists and $batchLists_href->{$testArea}{batchBenchTemplate} exists?
        elsif ( exists $batchLists_href->{$testArea}{list} and exists $batchLists_href->{$testArea}{batchBenchTemplate} ) {

            #IF-YES-START
            #CALL CreateBatch for each test list using batchBenchTemplate
            foreach my $hexFile ( keys %{ $batchLists_href->{$testArea}{list} } ) {
                foreach my $suffix ( keys %{ $batchLists_href->{$testArea}{list}{$hexFile} } ) {
                    my $success = CreateBatch( $batchLists_href->{$testArea}{list}{$hexFile}{$suffix}, $batchLists_href->{$testArea}{batchBenchTemplate}, $hexFile );
                    next if not $success;
                    $copyCount++;
                }
            }

            #IF-YES-END
        }

        #IF-NO-START
        #IF $batchLists_href->{$testArea}{list} exists and $batchLists_href->{$testArea}{batchTemplate} exists?
        elsif ( exists $batchLists_href->{$testArea}{list} and exists $batchLists_href->{$testArea}{batchTemplate} ) {

            #IF-YES-START
            #CALL CreateBatch for each test list using batchTemplate
            foreach my $hexFile ( keys %{ $batchLists_href->{$testArea}{list} } ) {
                foreach my $suffix ( keys %{ $batchLists_href->{$testArea}{list}{$hexFile} } ) {
                    my $success = CreateBatch( $batchLists_href->{$testArea}{list}{$hexFile}{$suffix}, $batchLists_href->{$testArea}{batchTemplate}, $hexFile );
                    next if not $success;
                    $copyCount++;
                }
            }

            #IF-YES-END
        }
        elsif ( exists $batchLists_href->{$testArea}{list} ) {

            #IF-NO-START
            #STEP warning if $batchLists_href->{$testArea}{list} exists
            print "--WARNING--: Test list(s) found for TestArea $testArea but no corresponding template batch file.\n";
        }

        #IF-NO-END
        #IF-NO-END
        #IF-NO-END
    }

    #LOOP-END last test area?

    #STEP warning if no file was copied or created
    if ( $copyCount == 0 ) {
        print("---WARNING---: No batch files found according to naming conventions. Nothing will be executed.\n");
    }
    else {
        print("$copyCount batch files were copied/created and will be executed.\n");
    }

    #END return
    return 1;
}

=head2 CreateBatch

    CreateBatch( $testListPath, $batchTemplatePath );

Creates in destination folder a batch file using the batch file of $batchTemplatePath as template
but replacing the test list path in the batch file with $testListPath.
The name of the batch file is TLM_<TestArea>_<TestBench>_<TestType>_<...>.bat

=cut

sub CreateBatch {
    my $testListPath      = shift;
    my $batchTemplatePath = shift;
    my $hexFile           = shift;

    #STEP read all lines of batch template file
    my $success = open( my $fh_in, "<", $batchTemplatePath );
    if ( not $success ) {
        print "--ERROR--: Could not open $batchTemplatePath $!\n";
        return;
    }
    my @linesIn = <$fh_in>;
    close($fh_in);

    #LOOP-START loop over all lines
    my $stringOut = '';
    foreach my $line (@linesIn) {

        #STEP replace test list path with $testListPath if line contains -testlist
        if ( $line =~ /^(.*-testlist\s+)(\S+)(.*)/ ) {
            $line = $1 . $testListPath . $3 . "\n";
        }
        $stringOut .= $line;
    }

    #LOOP-END last line?

    #STEP set the batch file name as TLM_<TestArea>_<TestBench>_<TestType>_<...>.bat in the destination folder
    my $batchName = basename($testListPath);
    $batchName =~ s/TL_/TLM_/;
    $batchName =~ s/\.txt$/.bat/;
    $batchName = $hexFile . '_' . $batchName;
    my $newBatchPath = $destination . '/' . $batchName;

    #STEP create the batch file and write the lines to it
    $success = open( my $fh_out, ">", $newBatchPath );
    if ( not $success ) {
        print "--ERROR--: Could not open $newBatchPath $!\n";
        return;
    }
    print( $fh_out $stringOut );
    close($fh_out);

    #END return
    print("Created $batchName from $testListPath and $batchTemplatePath\n");
    return 1;
}

=head2 SetArguments

    SetArguments( $testAreasString, $testBenchLabel, $testType, $custlibPath );

Sets script arguments for unit testing.

=cut

sub SetArguments {
    $testAreasString = shift;
    $testBenchLabel  = shift;
    $testType        = shift;
    $custlibPath     = shift;
    return 1;
}

1;
