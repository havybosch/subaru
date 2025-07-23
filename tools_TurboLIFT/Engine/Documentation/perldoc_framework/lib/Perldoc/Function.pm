package Perldoc::Function;

use strict;
use warnings;
use Perldoc::Page;
use Perldoc::Config_pd;
use Pod::Functions;
use File::Basename;
use File::Find;

our $VERSION = '0.01';


#--------------------------------------------------------------------------

our %function_pod;

my(%callStruct, %folderStructure, %functionStruct);



#--------------------------------------------------------------------------

my @modulesList = Perldoc::Page::list();

my @incDirs;
my ($filename, $dirname, $modulesDirFound);

# search for a module with a dirname that has "\modules\"; then we have found the base directory to find all INC directories 
foreach my $module ( @modulesList ) {
    $filename = Perldoc::Page::filename($module);
    $dirname = dirname($filename);
    if( $dirname =~ /^(.+\\modules)\\/ ) {
        $dirname = $1;
        last;
    }
}

find( \&findIncDirs , $dirname );

my $incCode = createIncCode();

foreach my $module (sort @modulesList){
	my $moduleFilename = Perldoc::Page::filename($module);
	if( $Perldoc::Config_pd::option{architecture} ){
    	print("Getting all functions for module $module\n");
		functions_per_module_quick($module, $moduleFilename);
	}
	else{
	    # do nothing
	}
}

foreach my $function (keys %functionStruct){
    my $pod = "=over\n\n";
    $pod   .= "\n=item $function";
    $pod   .= "\n''=back\n\n";
    $function_pod{$function} = $pod;
}


sub createIncCode{
	my $codeString;

	$codeString .= "BEGIN{\n";
	$codeString .= "	my \$path;\n";
	
	foreach my $dir (@incDirs){
		$codeString .= "	\$path = '$dir';\n";
		$codeString .= "	unshift \@INC, \$path;\n";		
	}
	return $codeString;
}


sub findIncDirs{
	my $file = $File::Find::name;
	my $dir = $File::Find::dir;
	my @found = grep { $_ eq $dir} @incDirs;
	return if @found;
	if( ($file =~ /\.pm$/ or $file =~ /\.dll$/) and $file !~ /Win64/ ){
		push( @incDirs, $dir );
		return;
	}
	return;
}



sub list {
  #return keys %Flavor;
  return keys %function_pod;
}


#--------------------------------------------------------------------------

sub description {
  my $function = shift;
  return $functionStruct{$function}{'module'};
}


#--------------------------------------------------------------------------

sub pod {
  my $function = shift;
  return $function_pod{$function};
}


#--------------------------------------------------------------------------

sub exists {
  my $function = shift;
  return exists $function_pod{$function};
}



#--------------------------------------------------------------------------
sub functions_per_module_quick {
	my $moduleFull = shift;
    my $filename = shift;
	my $dirname = dirname($filename);

	foreach my $path (@incDirs){
		unshift @INC, $path;
	}
    my $module = basename($filename);
    $module =~ s/\.pm//;

    # build the fully qualified name of the EXPORT variable of the module
    my $exportVar = "$module\::EXPORT";

    # build an expression that uses the module and returns the EXPORT variable
    # Note: "require" does no work anymore here, because of lines like: Readonly our $OVERLOAD_CH_NAME_PREFIX => ...
    my $expression = "use $module; no strict 'refs'; return \@{$exportVar};";

    # get the EXPORT variable of the module via eval of the expression
    my @exports = eval $expression;

	foreach my $path (@incDirs){
		shift @INC; # undo addition of INC paths because those are always the same paths
	}
	foreach my $function (@exports){
		$functionStruct{$function}{'module'} = $moduleFull;
	}

}

sub module {
	my $function = shift;
	return $functionStruct{$function}{'module'};	
}

sub callsFunctions {
	my $function = shift;
	my @callsList;
	foreach my $callFunction (keys %{$functionStruct{$function}{'calls'}}){
		push( @callsList, $callFunction );
	}
	return @callsList;	
}


1;
