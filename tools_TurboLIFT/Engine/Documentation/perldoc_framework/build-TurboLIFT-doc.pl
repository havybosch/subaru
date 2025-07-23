#! /usr/bin/perl

use strict;
use warnings;
use Config;
use Data::Dumper;
use File::Basename;
use File::Find;
use File::Path;
use File::Spec::Functions;
use FindBin qw/$Bin/;
use Getopt::Long;
use Shell qw/cp/;
use Template;

use lib "$Bin/lib";
use Perldoc::Config_pd;
use XML::Simple;
use Graphviz::DSL;

use constant TRUE  => 1;
use constant FALSE => 0;

my %architectureGraph;

#--Set options for Template::Toolkit---------------------------------------

use constant TT_INCLUDE_PATH => "$Bin/templates";

#--Set config options------------------------------------------------------
print "$Bin\n";

my %specifiers = (
  'output-path|o' => '=s',
  'architecture|a'   => '!',
);                  
my %options;
GetOptions( \%options, optionspec(%specifiers) );

my $path = $options{output_path};
$path = File::Spec->rel2abs( $path );
$options{output_path} = $path;

#--Check mandatory options have been given---------------------------------

my @mandatory_options = qw/ output-path /;

foreach (@mandatory_options) {
  (my $option = $_) =~ tr/-/_/;
  unless ($options{$option}) {
    die "Option '$_' must be specified!\n";
  }
}

#--Check the output path exists--------------------------------------------

unless (-d $options{output_path}) {
  die "Output path '$options{output_path}' does not exist!\n";
}

%Perldoc::Config_pd::option = (%Perldoc::Config_pd::option, %options);

#--Set start directory for modules--------------------------------------------
# does not work yet !?

my $startDir = '../../modules';
$startDir = File::Spec->rel2abs( $startDir );
$Perldoc::Config_pd::option{'module_start_dir1'} = $startDir;

$startDir = '../../funclib_generic';
$startDir = File::Spec->rel2abs( $startDir );
$Perldoc::Config_pd::option{'module_start_dir2'} = $startDir;

unshift @INC, $startDir;

eval <<EOT;
use Perldoc::Convert::html;
use Perldoc::Function;
use Perldoc::Function::Category;
use Perldoc::Page;
use Perldoc::Page::Convert;
use Perldoc::Section;  
EOT

die $@ if $@;







#
# main part start
#
print("Building static pages ...\n");
build_static();

print("Building html pages for modules and functions ...\n");
build_html();

print("Building js modules ...\n");
build_js();

print("Building specific pages for selected modules ...\n");
build_specific();

print("READY.\n");

#
# main part end
#








sub build_static{
	#--Set update timestamp---------------------------------------------------
	
	my $date         = sprintf("%02d",(localtime(time))[3]);
	my $month        = qw/ January
	                       February
	                       March
	                       April
	                       May
	                       June
	                       July
	                       August
	                       September
	                       October
	                       November
	                       December /[(localtime(time))[4]];
	my $year         = (localtime(time))[5] + 1900;
	
	$Perldoc::Config_pd::option{last_update} = "$date $month $year";
	
	WriteHtmlFromPod('../LIFT_description.pm', 'TurboLIFT documentation', './static-html/index.html');
	
	WriteArchitectureHtml('../LIFT_SW_Architecture.mm', './static-html/index-architecture.html') if $options{architecture};
	
	#--Copy static files------------------------------------------------------
	
	my $static_path = catdir($Perldoc::Config_pd::option{output_path},'static');
	mkpath($static_path) unless -d $static_path;
	
	cp('-r', "$Bin/static/*",     $static_path);
	cp('-r', "$Bin/javascript/*", $static_path);
	
#	my $pics_path = catdir($Perldoc::Config_pd::option{output_path},'pics');
#	mkpath($pics_path) unless -d $pics_path;
#	
#	cp('-r', "$Bin/pics/*",     $pics_path);
	
	#--Process static html files with template--------------------------------
	
	my @module_az_links;
	foreach my $module_index ('A'..'Z') {
		my $link;
		if (grep {/^$module_index/ } Perldoc::Page::list()) {
	    	$link = "index-modules-$module_index.html";
	  	} 
	  	push @module_az_links, {letter=>$module_index, link=>$link};
	}
	
	#my $templatefile = "$Bin/templates/html.template";
	
	my $process = create_template_function(
	  #templatefile => $templatefile,
	  variables    => { module_az => \@module_az_links, %options },
	);
	
	#die("Cannot chdir to static-html directory: $!\n") unless (chdir "$Bin/static-html");
	warn "Searcning in $Bin/static-html";
	find( {wanted=>$process, no_chdir=>0}, "$Bin/static-html" );
	
}


#-------------------------------------------------------------------------

sub create_template_function {
	my %args = @_;
	return sub {
	    warn "Process called: $_";
	    return unless (/(\w+)\.html$/);
	    my $page = $1;
	    local $/ = undef;
        my $template = Template->new(INCLUDE_PATH => TT_INCLUDE_PATH,
                                   ABSOLUTE     => 1);
        my $depth    = () = m/\//g;
      
        my %titles = (
	        index       => "TurboLIFT documentation",
	        search      => 'Search results',
	        preferences => 'Preferences',
	        architecture => 'Module architecture',
        );
      
        my %breadcrumbs = (
	        index       => 'Home',
	        search      => '<a href="index.html">Home</a> &gt; Search results',
	        preferences => '<a href="index.html">Home</a> &gt; Preferences',
	        architecture => '<a href="index.html">Home</a> &gt; Module architecture',
        );
      
	    my %variables          = %{$args{variables}};
	    $variables{path}       = '../' x ($depth - 1);
	    $variables{pagedepth}  = $depth - 1;
	    $variables{pagename}   = $titles{$page} || $page;
	    $variables{breadcrumb} = $breadcrumbs{$page} || $page;
	    $variables{content_tt} = $File::Find::name;
	      
	    my $output_filename = catfile($Perldoc::Config_pd::option{output_path},$_);
	    warn "Writing $output_filename";
	    $template->process('default.tt',{%Perldoc::Config_pd::option, %variables},$output_filename) || die "Failed processing $page\n".$template->error;
	}
}

sub optionspec {
  my %option_specs = @_;
  my @getopt_list;
  while (my ($option_name,$spec) = each %option_specs) {
    (my $variable_name = $option_name) =~ tr/-/_/;
    (my $nospace_name  = $option_name) =~ s/-//g;
    my $getopt_name = ($variable_name ne $option_name) ? "$variable_name|$option_name|$nospace_name" : $option_name;
    push @getopt_list,"$getopt_name$spec";
  }
  return @getopt_list;
}


# ------------------------------------------------------------
sub WriteHtmlFromPod{
	my $podFilenameIn = shift;
	my $title = shift;
	my $htmlFilenameOut = shift;
	
    open POD,'<',$podFilenameIn or confess("Cannot open POD for $podFilenameIn");
    my @podLines = (<POD>);
    close POD;

	my $pod = join('', @podLines);
    $pod =~ s/\r//g;

	my $html = Perldoc::Convert::html::convert($htmlFilenameOut,$pod);
	
    open HTML,'>',$htmlFilenameOut or confess("Cannot write HTML for $htmlFilenameOut");
	print(HTML "<h1>$title</h1>");
    print(HTML $html);
    close HTML;
	
}

# ------------------------------------------------------------
sub WriteArchitectureHtml {
	my $architectureFilenameIn = shift;
	my $architectureHtmlOut = shift;

    my $archDir = $path."/architecture";
    mkpath $archDir unless (-d $archDir);

	open (ARCHOUT, ">$architectureHtmlOut") or die "Error: couldn't write architecture file '$architectureHtmlOut': $!\n";

    print ARCHOUT qq~
<div class="basetop"><a onclick="expandAll(document.getElementById('base'))" href="#">Expand</a> -
<a onclick="collapseAll(document.getElementById('base'))" href="#">Collapse</a></div><div class="basetext" id="base">
<h1>TurboLIFT module architecture</h1>
<ul class="myUnselectableText" unselectable="on">
    ~;

	# read Freemind file with architecture (*.mm, which is an XML file)
	my $LIFT_architecture = XMLin($architectureFilenameIn);
	my $startNode = $LIFT_architecture->{'node'}{'node'};
	ProcessArchitectureLayer( $startNode );

	print ARCHOUT '</ul></div>'."\n";
	close (ARCHOUT);
} # WriteArchitectureHtml


# ------------------------------------------------------------
sub ProcessArchitectureLayer{
	my $node = shift;
	my $parentNodeName = shift;

	# check if node is an array reference
	my @elements;
	if( ref $node eq 'ARRAY'){
		@elements = @{$node};
	}
	else{
		@elements = ($node);
	}

	# loop over all elements of the node
	foreach my $element (@elements){
		next if( not defined $element->{'TEXT'} );  # without the key 'TEXT' no further processing is useful for the element

		# if the element text is not *.pm then it is a headline with further sub-nodes
		if( $element->{'TEXT'} !~ /\.pm\s*$/i ){
			my $note1 = ''; 
			my $note2 = '';
			# with {'richcontent'}{'html'}{'body'}{'p'} defined there is a comment that must be displayed as a box
			if( defined $element->{'richcontent'}{'html'}{'body'}{'p'} ){
				$note1 = '<div class="boxed">';
				$note2 = '<div class="note-and-attributes"><span class="note"><p>'.$element->{'richcontent'}{'html'}{'body'}{'p'}.'</p></span></div></div>';
			}
			# if 'node' is defined the continue processing this node (recursive call)
			if( defined $element->{'node'} ){
    			print ARCHOUT '<li class="exp">'.$note1.'<div class="nodecontent">'.$element->{'TEXT'}.'</div>'.$note2."\n";
    			print ARCHOUT '<ul class="sub">'."\n";
    			$architectureGraph{'function'} = $element->{'TEXT'};
				ProcessArchitectureLayer( $element->{'node'}, $element->{'TEXT'} );
    			print ARCHOUT '</ul></li>'."\n";
			}
			# if there is no more node below then find an architecture graph or just print the node
			else{
			    my $device = $element->{'TEXT'};
			    my $graph = "architecture/".$architectureGraph{'funcLib'}.'_'.$architectureGraph{'function'}.'_'.$device.'.png';
			    if( -e $path.'/'.$graph ){
                    print ARCHOUT '<li class="basic"><div class="nodecontent"><a href="'.$graph.'"  target="blank">'.$element->{'TEXT'}.'</a></div></li>'."\n";			    
			    }
			    else{
                    print ARCHOUT '<li class="basic"><div class="nodecontent">'.$element->{'TEXT'}.'</div></li>'."\n";			    			        
			    }
			}
		}
		# if the element text is *.pm then it is a perl module where we have to include the link to the documentation
		else{
		    CreateArchitectureGraphs( $element->{'TEXT'} ) if $parentNodeName eq 'Functional Layer';
    		my $docuPath = GetHtmlPath( $element->{'TEXT'} );
            # if there are no more nodes below then just print the module with the proper link
			if( not defined $element->{'node'} ){
    			print ARCHOUT '<li class="basic"><div class="nodecontent"><a href="'.$docuPath.'">'.$element->{'TEXT'}.'</a></div></li>'."\n";
			}
			# if there are nodes below then print the module with the proper link and process further
			else{
    			print ARCHOUT '<li class="exp"><div class="nodecontent"><a href="'.$docuPath.'">'.$element->{'TEXT'}.'</a></div>'."\n";			    
                print ARCHOUT '<ul class="sub">'."\n";
                my $funcLib = $element->{'TEXT'};
                $funcLib =~ s/\.pm//;
                $architectureGraph{'funcLib'} = $funcLib;
				ProcessArchitectureLayer( $element->{'node'}, $element->{'TEXT'} );
                print ARCHOUT '</ul></li>'."\n";
			}
		}
		
	}

	return 1;
	
}



sub GetHtmlPath{
	my $module = shift;
	
	$module =~ s/\.pm//;
	
	my @pathElements;
	foreach my $page (Perldoc::Page::list()){
		@pathElements = split(/::/, $page);
		my $lastElement = pop @pathElements;
		if( $module eq $lastElement ){
			push @pathElements, $lastElement;
			last;
		}
	}
	
	
	my $modulePath = 'modules/'.join('/', @pathElements).'.html';
	return $modulePath;
	
}



sub build_html{

	#--Compute link addresses for modules -----------------------
	
	foreach my $module (grep {/^[A-Z]/ } Perldoc::Page::list()) {
	  my $link = $module;
	  $link =~ s!::!/!g;
	  $link .= '.html';
	  #$core_modules{$module} = $link;
	}
	
	my @module_az_links;
	foreach my $module_index ('A'..'Z') {
		my $link;
		if (grep {/^$module_index/ } Perldoc::Page::list()) {
	    	$link = "index-modules-$module_index.html";
		} 
		push @module_az_links, {letter=>$module_index, link=>$link};
	}
	
	
	
	
	#--------------------------------------------------------------------------
	#--TurboLIFT modules-------------------------------------------------------
	#--------------------------------------------------------------------------
	
	foreach my $module_index ('A'..'Z') {
		my %page_data;
		my $template            = Template->new(INCLUDE_PATH => TT_INCLUDE_PATH);
		$page_data{pagedepth}   = 0;
		$page_data{path}        = '../' x $page_data{pagedepth};
		$page_data{pagename}    = qq{TurboLIFT modules ($module_index)};
		$page_data{pageaddress} = "index-modules-$module_index.html";
		$page_data{breadcrumbs} = [ ];
		$page_data{content_tt}  = 'module_index.tt';
		$page_data{module_az}   = \@module_az_links;
	  
		foreach my $module (grep {/^$module_index/i } sort {uc $a cmp uc $b} Perldoc::Page::list()) {
		    (my $module_link = $module) =~ s/::/\//g;
		    $module_link .= '.html';
		    $module_link = 'modules/'.$module_link;
		    push @{$page_data{module_links}}, {name=>$module, title=>Perldoc::Page::title($module), url=>$module_link};
	    }
	  
	    my $filename = catfile($Perldoc::Config_pd::option{output_path},$page_data{pageaddress});
	    check_filepath($filename);
	  
	    $template->process('default.tt',{%Perldoc::Config_pd::option, %page_data},$filename) || die $template->error;
	  
	    foreach my $module (grep {/^$module_index/i } Perldoc::Page::list()) {
		    my %module_data;
		    (my $module_link = $module) =~ s/::/\//g;
		    $module_data{pageaddress} = "$module_link.html";
		    $module_data{contentpage} = 1;
		    $module_data{pagename}    = $module;
		    $module_data{pagedepth}   = 1 + $module =~ s/::/::/g;
		    $module_data{path}        = '../' x $module_data{pagedepth};
		    $module_data{breadcrumbs} = [ 
		                                  {name=>"TurboLIFT modules ($module_index)", url=>"index-modules-$module_index.html"} ];
		    $module_data{content_tt}  = 'page.tt';
		    $module_data{pdf_link}    = "$module_link.pdf";
		    $module_data{module_az}   = \@module_az_links;
		    $module_data{pod_html}    = Perldoc::Page::Convert::html($module);
		    $module_data{page_index}  = Perldoc::Page::Convert::index($module);
		                                
		    my $filename = catfile($Perldoc::Config_pd::option{output_path}.'/modules',$module_data{pageaddress});
		    check_filepath($filename);
		    
		    $template->process('default.tt',{%Perldoc::Config_pd::option, %module_data},$filename) || die "Failed processing $module\n".$template->error;
	
			#RewriteHtmlFile( $module, $filename );
	    }
	}
	
	
	#--------------------------------------------------------------------------
	#--functions---------------------------------------------------------------
	#--------------------------------------------------------------------------
	
	#--Generic variables-------------------------------------------------------
	
	my %function_data;
	my $function_template = Template->new(INCLUDE_PATH => TT_INCLUDE_PATH);
	
	
	#--Index variables---------------------------------------------------------
	
	$function_data{pagedepth}   = 0;
	$function_data{path}        = '../' x $function_data{pagedepth};
	
	
	#--Create A-Z index page---------------------------------------------------
	
	$function_data{pageaddress} = 'index-functions.html';
	$function_data{pagename}    = 'TurboLIFT functions A-Z';
	$function_data{breadcrumbs} = [ {name=>'Language reference', url=>'index-language.html'} ];
	$function_data{content_tt}  = 'function_index.tt';
	$function_data{module_az}   = \@module_az_links;
	
	foreach my $letter ('A'..'Z') {
	    my ($link,@functions);
	    if (my @function_list = grep {/^[^a-z]*$letter/i} sort (Perldoc::Function::list())) {
		    $link = "#$letter";
		    foreach my $function (@function_list) {
				my $module = Perldoc::Function::module($function);
				$module =~ s/::/\//g;
				my $url = 'modules/'.$module.'.html#'.$function;
				my $description = Perldoc::Function::description($function);
				push @functions,{name=>$function, url=>$url, description=>$description};
	        }
	    } 
	    push @{$function_data{function_az}}, {letter=>$letter, link=>$link, functions=>\@functions};
	}
	
	my $filename = catfile($Perldoc::Config_pd::option{output_path},$function_data{pageaddress});
	check_filepath($filename);
	
	$function_template->process('default.tt',{%Perldoc::Config_pd::option, %function_data},$filename) || die "Failed processing function A-Z\n".$function_template->error;
	
	
	#--Function variables------------------------------------------------------
	
	undef $function_data{pdf_link};
	$function_data{pagedepth}   = 1;
	$function_data{path}        = '../' x $function_data{pagedepth};

}

#--------------------------------------------------------------------------

sub check_filepath {
  my $filename  = shift;
  my $directory = dirname($filename);
  mkpath $directory unless (-d $directory);
}


# ------------------------------------------------------------
sub CreateArchitectureGraphs{
    my $module = shift;
    
    #my $modulePath = "$startDir\\$module";
    
    my $package = $module;
    $package =~ s/\.pm//;

    my $architectureFunction = $package."::CreateArchitectureStructure";

    my $architecture_href;
    if( exists &$architectureFunction ){
        no strict 'refs';
        $architecture_href = &$architectureFunction();
        print("Creating architecture graphs for package $package...\n");
    }
    else{
        print("Function 'CreateArchitectureStructure' in package $package not found. No architecture graphs will be created for this package.\n");
        return 0;
    }
    
    # create output files from $architecture_href
    # get a list of all functions in the funcLib
    my @functions = ();
    foreach my $lfunction ( sort keys %{ $architecture_href } ) {
        push( @functions, $lfunction );
    }

    # create a graph with all apis of all functions of a funcLib
    my $graphName = $package;
    my $graph     = graph {
        name $graphName;
        edges arrowhead => 'onormal', color       => 'magenta4';
        global center   => 'true',    outputorder => 'nodefirst';

        subgraph {
            global label => 'Functional_Layer';
            foreach my $lfunction ( @functions ) {
                route( $package, $lfunction );
                my @ldevices = sort keys %{ $architecture_href->{$lfunction} };
                foreach my $lapi ( sort keys %{ $architecture_href->{$lfunction}{ $ldevices[0] } } ) {
                    route( $lfunction, $lapi );
                }
            }
        };
    };
    $graph->save( path => $path."/architecture/".$graphName, type => 'png', encoding => 'utf-8' );

    # loop over all functions
    foreach my $lfunction ( @functions ) {
        my @ldevices = sort keys %{ $architecture_href->{$lfunction} };

        # get a list of all apis of a function
        my @apis = ();
        foreach my $lapi ( sort keys %{ $architecture_href->{$lfunction}{ $ldevices[0] } } ) {
            push( @apis, $lapi );
        }
        
        # loop over all devices of the function
        foreach my $ldevice ( sort keys %{ $architecture_href->{$lfunction} } ) {

            # create a graph for all apis of each function and each device
            $graphName = $package . '_' . $lfunction . '_' . $ldevice;
            $graph     = graph {
                name $graphName;
                edges arrowhead => 'onormal', color       => 'magenta4';
                global center   => 'true',    outputorder => 'nodefirst';

                subgraph {
                    global label => 'Functional_Layer';
                    foreach my $lfunction (@functions) {
                        route( $package, $lfunction );
                    }
                    foreach my $lapi (@apis) {
                        route( $lfunction, $lapi );
                    }
                };

                subgraph {
                    global label => 'Device_Layer';
                    subgraph {
                        global label => $ldevice;
                        foreach my $lapi ( sort keys %{ $architecture_href->{$lfunction}{$ldevice} } ) {
                            my $ldeviceAPI = $architecture_href->{$lfunction}{$ldevice}{$lapi};
                            route( $lapi, $ldeviceAPI );
                        }
                    };

                };

            };

            $graph->save( path => $path."/architecture/".$graphName, type => 'png', encoding => 'utf-8' );

        }
    }
    
    return 1;
}


sub build_js{
	#--Create indexPod.js------------------------------------------------------
	
	my @pods;
	foreach my $section (Perldoc::Section::list()) {
	  next if $section eq 'pragmas';
	  foreach my $page (Perldoc::Section::pages($section)) {
	    my $title = Perldoc::Page::title($page) || warn "no title for $page";
	    $title =~ s/\\/\\\\/g;
	    $title =~ s/"/\\"/g;
	    $title =~ s/C<(.*?)>/$1/g;
	    $title =~ s/\n//sg;
	    
	    push @pods,{name=>$page, description=>$title};
	  }
	}
	
	my $jsfile   = catfile($Perldoc::Config_pd::option{output_path},'static','indexPod.js');
	my $template = Template->new(INCLUDE_PATH => TT_INCLUDE_PATH);
	$template->process('indexpod-js.tt',{%Perldoc::Config_pd::option, pods=>\@pods},$jsfile) || die $template->error;
	
	
	#--Create indexModules.js--------------------------------------------------
	
	my @modules;
	foreach my $page (Perldoc::Section::pages('pragmas'), grep {/^[A-Z]/} (Perldoc::Page::list())) {
	  #next unless exists($Perldoc::Page::CoreList{$page});
	  if (my $title = Perldoc::Page::title($page)) {
	    $title =~ s/\\/\\\\/g;
	    $title =~ s/"/\\"/g;
	    $title =~ s/C<(.*?)>/$1/g;
	    $title =~ s/\n//sg;
	
	    push @modules,{name=>$page, description=>$title};
	  }
	}
	
	$jsfile = catfile($Perldoc::Config_pd::option{output_path},'static','indexModules.js');
	$template->process('indexmodules-js.tt',{%Perldoc::Config_pd::option, modules=>\@modules},$jsfile) || die $template->error;
	
	
	#--Create indexFunctions.js------------------------------------------------
	
	my @functions;
	foreach my $function (Perldoc::Function::list()) {
	  my $description = Perldoc::Function::description($function) || warn "No description for $function";
	  $description =~ s/\\/\\\\/g;
	  $description =~ s/"/\\"/g;
	  $description =~ s/C<(.*?)>/$1/g;
	  $description =~ s/\n//sg;
	  
	  push @functions,{name=>$function, description=>$description};
	}
	
	$jsfile = catfile($Perldoc::Config_pd::option{output_path},'static','indexFunctions.js');
	$template->process('indexfunctions-js.tt',{%Perldoc::Config_pd::option, functions=>\@functions},$jsfile) || die $template->error;
	
}

sub build_specific{
    # create LIFT_PSI5_access docu page for INIT2 data
    eval "use LIFT_PSI5_access";
    PSI5_print_docu();
}
