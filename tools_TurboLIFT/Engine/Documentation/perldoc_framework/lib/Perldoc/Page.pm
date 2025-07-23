package Perldoc::Page;

use strict;
use warnings;
use Carp;
use Module::CoreList;
use Perldoc::Config_pd;
use Pod::Simple::Search;

use constant TRUE  => 1;
use constant FALSE => 0;

our $VERSION = '0.01';


#--------------------------------------------------------------------------

my $search = Pod::Simple::Search->new->inc(FALSE)->laborious(TRUE);
my $n2p    = $search->survey(
					#'../../modules',
					$Perldoc::Config_pd::option{'module_start_dir1'},
					$Perldoc::Config_pd::option{'module_start_dir2'},
                );

if(0){ # for testing purposes use only the first n modules
	my @temp = %{$n2p};
	splice(@temp, 8);
	my %temp = @temp;
	$n2p = \%temp;
	#$n2p = undef;
	#$n2p->{'LIFT_general'} = 'C:\Users\phc2si\Documents\LIFT\TSG4\Engine\modules\LIFT_general.pm';
}

                
our %name2path = map {
                   my $path = $n2p->{$_};
                   s/^pods:://;
                   ($_,$path) 
                 } grep {
		   $_ !~ /perltoc|perlcn|perljp|perlko|perltw/
		 } keys %$n2p;
                 
our %name2title;
our %name2pod;


#--------------------------------------------------------------------------

sub list {
  return keys %name2path;
}


#--------------------------------------------------------------------------

sub exists {
  my $page = shift;
  return exists $name2path{$page};
}


#--------------------------------------------------------------------------

sub pod {
  my $page = shift;
  unless (exists $name2pod{$page}) {
    local $/ = undef;
    open POD,'<',Perldoc::Page::filename($page) or confess("Cannot open POD for $page");
    my $pod = (<POD>);
    $pod =~ s/\r//g;
    $name2pod{$page} = $pod;
    close POD;
  }
  return $name2pod{$page};
}


#--------------------------------------------------------------------------

sub filename {
  my $page = shift;
  return $name2path{$page};
}


#--------------------------------------------------------------------------

sub title {
  my $page = shift;
  unless (exists $name2title{$page}) {
    local $_ = Perldoc::Page::pod($page);
    if (/=head1 NAME\s*?[\n|\r](\S.*?)[\n|\r]\s*[\n|\r]/si or 
        /=head1 TITLE\s*?[\n|\r](\S.*?)[\n|\r]\s*[\n|\r]/si) {
      my $title = $1;
      if (defined $title) {
        $title =~ s/E<(.*?)>/&$1;/g;
        $title =~ s/[A-DF-Z]<(.*?)>/$1/g;
        $title =~ s/.*? -+\s+//;
        $title =~ s/\(\$.*?\$\)//;
        $name2title{$page} = $title;
      }
    }
  }
  return $name2title{$page};
}


#--------------------------------------------------------------------------

sub expand {
  my @dirs = @_;
  map { s/^~/$ENV{HOME}/ } @dirs;
  return @dirs;
}


#--------------------------------------------------------------------------

1;
