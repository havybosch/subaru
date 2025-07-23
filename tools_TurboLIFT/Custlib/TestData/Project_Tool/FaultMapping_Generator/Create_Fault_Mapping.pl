#!perl -w
#****************************************************************************************************
#                                                                           						*
# Copyright (c) 2013 Robert Bosch GmbH, Germany                             						*
#               All rights reserved                                         						*
#                                                                           						*
#****************************************************************************************************
use strict;
use warnings;
use Tk;
use Tk::Frame;
use Win32::File;
use File::Copy;
use File::Basename;
use Win32::OLE;
use Win32::OLE::Const;
use File::Find;
use File::Path;
use Getopt::Long;
use File::Glob ':glob';
use Cwd;
use Tk::LabFrame;

sub Creatre_About_Window
{
	my $mw = MainWindow->new( "-background" => "#888888" );
	$mw->minsize( 100, 25 );
	$mw->title("Help");

	#Making a text area
	my $txt = $mw->Scrolled( 'Text', -width => 100, -scrollbars => 'e' )->pack();
	$txt->delete( '1.0', 'end' );
	$txt->insert(
		'end', '
DESCRIPTION:
This tool will generate a fault mapping file from an exported excel sheet of Fault list SRS

FOLLOW THESE STEPS:
1. Export Rqmts to excel sheet: Fault list SRS->File->Export->Microsoft Office->Excel..
2. Check for these mandatory columns in excel sheet
Bosch Fault Name e.g. FltAB1FDConfiguration
DTC e.g. 0x900001
DeviceType e.g. Squib, Switch , PAS, Lamp etc..
System Warning Lamp  e.g. Filtered/Latched/Stored
CyclicQualificationtime #in ms
CyclicDequalificationtime #in ms
InitQualificationtime #Init or time in ms
initDequalificationtime #Init or time in ms
FaultType  e.g. cyclic, init, initcyclic

3. Add the missing columns/values if not present

REMARKS:
1. TurboLIFT/Tools/Engine should be sunced from MKS
2. TurboLIFT-Perl should have been installed using the _run_once.bat file
'
	);
	return 1;
}
my ( $main,             $end_frame,           $path_frame_xls,         $path_frame_template, $entry, );
my ( $Designation_path, $ExcelFile_Name_Path, $templateFile_Name_Path, @File_Select_Arr,     $status, );
my ( $input_excel_File_Name, $input_template_File_Name, );

# Default Designation Path
$Designation_path = 'C:';
my $TK_ERROR_INDICATION_FLAG_i = 0;
my $project_name               = "";
$main = MainWindow->new( "-background" => "#888888" );

# Size to the TK window
$main->minsize( 450, 100 );
$main->title("Fault Mapping file Generator ");

# Get the current path
my $pwd = cwd();

#print "$pwd","\n";
my @path_structure;
@path_structure = split( /\//, $pwd );

# Remove the last Folder
#pop(@path_structure);
# Add the string with \\ to get the complete path
my $File_With_Path = join( "\\", @path_structure );
print "File_With_Path =$File_With_Path", "\n";
$pwd =~ s/\//\\/g;
$pwd =~ s/\//\\/;

#Remove the files if is already present in the canoe folder
#Declare that there is a menu
my $mbar = $main->Menu();
$main->configure( -menu => $mbar );

#The Main Buttons
my $file = $mbar->cascade( -label => "File", -underline => 0, -tearoff => 0 );
my $help = $mbar->cascade( -label => "Help", -underline => 0, -tearoff => 0 );
## File Menu ##
$file->command(
				-label     => "Exit",
				-underline => 1,
				-command   => sub { exit }
);

#********************************************************************************************
$help->command( -label => "ReadMe", -command => sub { Creatre_About_Window() } );
$main->Label(
			  -text       => 'Fault Mapping file Generator  ',
			  -font       => '{Segoe UI} 15 bold',
			  -background => '#888888',
			  -foreground => 'white',
			  -height     => '001'
)->pack( -side => 'top', -pady => '003' );
my $labeled_frame1 = $main->Frame(
								   -borderwidth => 2,
								   -relief      => 'groove',
								   -background  => "#888888",
)->pack( -side => "top", -padx => '150', -anchor => 'nw' );

#my $shot = $main->Photo(-file => "$File_With_Path\\logo\\AUDI.gif");
#$main->Label(-image => $shot)->pack(-side => 'top');
$main->Label(
			  -text       => 'NOTE: Select .xls file exported from the FaultList SRS',
			  -font       => '{Segoe UI Semibold} 8 bold',
			  -background => "#888888",
			  -foreground => "white",
)->pack( -side => 'left', -padx => '75', -pady => '02', -side => 'top', -anchor => 'w' );
$path_frame_xls      = $main->Frame( "-background" => "#888888" )->pack( -pady => '1', -padx => '05', -anchor => 'nw' );
$path_frame_template = $main->Frame( "-background" => "#888888" )->pack( -pady => '1', -padx => '05', -anchor => 'nw' );
$path_frame_xls->Label(
						-text       => 'Excel File:',
						-background => "#888888",
						-foreground => "blue1",
						-font       => '{Segoe UI} 12 '
)->pack( -side => 'left' );
$status = ' Not Started ';
$entry = $path_frame_xls->Entry(
								 -width        => '50',
								 -textvariable => \$ExcelFile_Name_Path,
								 -background   => "white",
								 -foreground   => "black",
  )->pack( -side => 'left',
		   -pady => '0' );
$path_frame_xls->Button(
	-text       => "Browse",
	-width      => '8',
	-relief     => 'groove',
	-background => "#333366",
	-foreground => "white",
	-font       => '{Segoe UI Semibold} 12 ',
	-command    => sub {
		$ExcelFile_Name_Path = $main->getOpenFile( -filetypes => [ [ "xls xlsx files", [ '.xlsx', '.xls' ] ], [ "xls xlsx files", [ '.xlsx', '.xls' ] ], ],
												   -title => "Choose the xls file ", );
		if ($ExcelFile_Name_Path)
		{
			@File_Select_Arr = split( /\[/, $ExcelFile_Name_Path );
			$input_excel_File_Name = $File_Select_Arr[-1];
			print "Excel File Name =$input_excel_File_Name";
			$Designation_path = dirname($ExcelFile_Name_Path);
			$Designation_path = $Designation_path . "/";
		}
	}
)->pack( -side => "right", -padx => '05', -pady => '03' );
$path_frame_template->Label(
							 -text       => 'Template:',
							 -background => "#888888",
							 -foreground => "blue1",
							 -font       => '{Segoe UI} 12 '
)->pack( -side => 'left' );
$entry = $path_frame_template->Entry(
									  -width        => '50',
									  -textvariable => \$templateFile_Name_Path,
									  -background   => "white",
									  -foreground   => "black",
  )->pack( -side => 'left',
		   -pady => '1' );
$path_frame_template->Button(
	-text       => "Browse",
	-width      => '8',
	-relief     => 'groove',
	-background => "#333366",
	-foreground => "white",
	-font       => '{Segoe UI Semibold} 12 ',
	-command    => sub {
		$templateFile_Name_Path = $main->getOpenFile( -filetypes => [ [ "pm files", ['.pm'] ], [ "pm files", ['.pm'] ], ],
													  -title => "Choose the pm file ", );
		if ($templateFile_Name_Path)
		{
			@File_Select_Arr = split( /\[/, $templateFile_Name_Path );
			$input_template_File_Name = $File_Select_Arr[-1];
			print "Template File Name =$input_template_File_Name";
			$Designation_path = dirname($templateFile_Name_Path);
			$Designation_path = $Designation_path . "/";
		}
	}
)->pack( -side => "top", -padx => '06' );

#check button
# my $checkbutton = $main->Frame("-background" => "#888888")->pack(-ipadx=>'10', -padx=>'1');;
# $checkbutton->Checkbutton(
# -text => 'Supported Suppression Fault',
# -variable => \$Cb_Selected,
# # -command  => \&check_state,
# -font=>'{Segoe UI Semibold} 10 bold ',
# -indicatoron => 'true',
# -selectcolor => 'gray',
# -activeforeground => "black",
# -foreground  => "white",
# -activebackground => "#888888",
# -background => "#888888",
# -width=>'23',)
# ->pack(-side => "left",-padx=>'50',-pady=>'12',-anchor=>'nw');
#------------------
$end_frame = $main->Frame( "-background" => "#888888" )->pack( -ipadx => '10', -padx => '1' );
$end_frame->Button(
					-text       => 'Exit',
					-width      => '8',
					-font       => '{Segoe UI Semibold} 12 ',
					-background => "Red4",
					-foreground => "white",
					-relief     => 'groove',
					-command    => [ $main => 'destroy' ]
)->pack( -pady => 10, -side => 'right' );
$end_frame->Button(
					-text       => 'Generate',
					-width      => '8',
					-font       => '{Segoe UI Semibold} 12 ',
					-foreground => "white",
					-relief     => 'groove',
					-background => "ForestGreen",
					-command    => sub { Generate_File() }
)->pack( -pady => 10, -padx => 10, -side => 'right' );

# create label in window 'main'
$main->Label(
			  -textvariable => \$status,                        #reference to display the status
			  -font         => '{Segoe UI Semibold} 12 bold',
			  -background   => "#888888",
			  -foreground   => "white",
)->pack( "-pady" => 6, -side => 'top' );
MainLoop;

sub Generate_File
{

	#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	#            Error Handling from the GUI
	#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	if ( !$input_excel_File_Name )
	{
		$main->messageBox(
						   '-icon'    => "error",                     #qw/error info question warning/
						   '-type'    => "OK",                        #qw/AbortRetryIgnore OK OKCancel RetryCancel YesNo YesNoCancel/
						   '-title'   => 'Attention',
						   '-title'   => 'Attention',
						   '-message' => "Select the *.xls files !"
		);
		$TK_ERROR_INDICATION_FLAG_i = 1;
		$main->update();
	} else
	{
		$status = ' Not Started ';
		$main->update();

		#SheetName of the Exported Decoder sheet
		my %input_data_Sheet = ( 'in_Data' => "Sheet1", );
		require 'FaultMapping_Lookuptable.pm';
		my $SRS_Map = $MAP_SRS_LOOKUPTABLE::TABLE;
		unless ( open( TEMPLATE, $input_template_File_Name ) )
		{
			$status = "Select the template file !!";
			$main->update();
			die("template file $input_template_File_Name is not found!\n");
		}
		open( TEMPWRITE, ">temp_Fault_mappings.txt" ) || die(">temp_Fault_mappings.txt could not be created \n $_!");
		open( FAULTMAP,  ">Mapping_FAULT.pm" )        || die("Mapping_FAULT.pm could not be created!\n");
		open( ERRORLOG,  ">ErrorLog.txt" )            || die("ErrorLog.txt could not be created \n $_!");
		print TEMPWRITE "#### This file is generated by the Fault mapping tool #### \n";
		print TEMPWRITE "#### Can be edited manually! #### \n\n";
		print TEMPWRITE "\n\n";
		my ( @error_messages, @warning_messages );
		my $excel;
		my $input_WorkBook;
		my $input_WorkSheet;
		my $Xls_Number_column;
		my $Xls_DTC_column;
		my $First_Bosch_Fault_Read_column;
		my $Xls_Internal_Fault_column;
		my $Xls_System_Warning_Lamp_column;
		my $Xls_Fault_Priority_column;
		my $Xls_Qualification_Group_column;
		my $Xls_CyclicQualificationtime_column;
		my $Xls_CyclicDequalificationtime_column;
		my $Xls_InitQualificationtime_column;
		my $Xls_InitDequalificationtime_column;
		my $Xls_unlearn_column;
		my $Xls_devicetype_column;
		my $Xls_FaultType_column;
		my $Xls_Tolerance_column;
		my $Xls_Suppression_column;
		my $Xls_SupportProjects_column_href;
		my $SupportProjects_aref;

		# Open the xls using the WIN OLE package
		use Win32::OLE qw(in with);

		#		use Win32::OLE::Const 'Microsoft Excel';  # does not work anymore with Office 365
		$Win32::OLE::Warn = 3;

		# get already active Excel application or open new
		$excel = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new( 'Excel.Application', 'Quit' );

		#$excel->{DisplayAlerts}=0;
		$excel->{Visible} = 1;

		# Updates for supporting the tool in Office 365 environment
		my $xlConst     = Win32::OLE::Const->Load($excel);
		my $xlPrevious  = $xlConst->{xlPrevious};
		my $xlByRows    = $xlConst->{xlByRows};
		my $xlByColumns = $xlConst->{xlByColumns};

		# open Excel file which comtain  the decoder information
		$input_WorkBook = $excel->Workbooks->Open("$input_excel_File_Name");

		# select workSheet number 1 (you can also select a workSheet by name)
		#$input_WorkSheet = $input_WorkBook->WorkSheets("$input_data_Sheet{'in_Data'}");
		$input_WorkSheet = $input_WorkBook->Worksheets(1);

		#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Finding the Last Row and Coloumn of the doors Document ^^^^^^^^^^^^^^^^^^^^^^^^
		my $LastRow_input_data = $input_WorkSheet->UsedRange->Find(
																	{
																	  What            => "*",
																	  SearchDirection => $xlPrevious,
																	  SearchOrder     => $xlByRows
																	}
		)->{Row};
		print "\nLast Row of input file =", $LastRow_input_data, "\n";
		my $LastColoumn_input_data = $input_WorkSheet->UsedRange->Find(
																		{
																		  What            => "*",
																		  SearchDirection => $xlPrevious,
																		  SearchOrder     => $xlByColumns
																		}
		)->{Column};
		print "\nLast Coloumn of input file =", $LastColoumn_input_data, "\n";

		#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Declaration for  the coloumn cells of doors doccuments  ^^^^^^^^^^^^^^^^^^^^^^^^
		#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Status update in the GUI Window ^^^^^^^^^^^^^^^^^^^^^^^^
		$status = "Conversion in progress!!!.";
		$main->update();

		#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Assigning the coloumn attrributes for  the column cells of doors doccuments  ^^^^^^^^^^^^^^^^^^^^^^^^
		my $Header_Filter_Row = 1;
		my $column_Read;
		$SupportProjects_aref = $SRS_Map->{'COLUMN_NAMES'}{'States'};
		foreach my $column ( 1 .. $LastColoumn_input_data )
		{
			$column_Read = "";                                                                  # clear the old data
			                                                                                    # Read the bit byte cell value from xls File
			$column_Read = $input_WorkSheet->Cells( $Header_Filter_Row, $column )->{'Value'};
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'ID'} )
			{
				$Xls_Number_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'DTC'} )
			{
				$Xls_DTC_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Bosch Fault Name'} )
			{
				$First_Bosch_Fault_Read_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Internal Fault'} )
			{
				$Xls_Internal_Fault_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'System Warning Lamp'} )
			{
				$Xls_System_Warning_Lamp_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Fault Priority'} )
			{
				$Xls_Fault_Priority_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Qualification Group'} )
			{
				$Xls_Qualification_Group_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Cyclic Qualification Time'} )
			{
				$Xls_CyclicQualificationtime_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Cyclic Dequalification Time'} )
			{
				$Xls_CyclicDequalificationtime_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Init Qualification Time'} )
			{
				$Xls_InitQualificationtime_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Init Dequalification Time'} )
			{
				$Xls_InitDequalificationtime_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'DeviceType'} )
			{
				$Xls_devicetype_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Unlearning'} )
			{
				$Xls_unlearn_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'FaultType'} )
			{
				$Xls_FaultType_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Tolerance'} )
			{
				$Xls_Tolerance_column = $column;
			}
			if ( $column_Read eq $SRS_Map->{'COLUMN_NAMES'}{'Suppression'} )
			{
				$Xls_Suppression_column = $column;
			}
			foreach my $state (@$SupportProjects_aref)
			{
				if ( $column_Read eq $state )
				{
					$Xls_SupportProjects_column_href->{$column} = $state;
					print "key: $column , value: $state";
				}
			}
		}

		#++++++++++++++++++++++++++++++++++++++++++++++++++++++
		# check if all expected columns are present in map file
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'Bosch Fault Name'} )
		{
			push( @error_messages, "'Bosch Fault Name' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
		}
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'DTC'} )
		{
			push( @error_messages, "'DTC' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
		}
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'System Warning Lamp'} )
		{
			push( @error_messages, "'System Warning Lamp' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
		}
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'Cyclic Qualification Time'} )
		{
			push( @error_messages, "'Cyclic Qualification Time' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
		}
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'Cyclic Dequalification Time'} )
		{
			push( @error_messages, "'Cyclic Dequalification Time' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
		}
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'Init Qualification Time'} )
		{
			push( @error_messages, "'Init Qualification Time' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
		}
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'Init Dequalification Time'} )
		{
			push( @error_messages, "'Init Dequalification Time' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
		}
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'DeviceType'} )
		{
			push( @error_messages, "'DeviceType' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
		}
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'FaultType'} )
		{
			push( @error_messages, "'FaultType' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
		}
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'Tolerance'} )
		{
			push( @warning_messages, "'Tolerance' definition is missing in MAP_SRS.pm file. Please add if required\n" );
		}
		unless ( defined $SRS_Map->{'COLUMN_NAMES'}{'Suppression'} )
		{
			push( @error_messages, "'Suppression' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
		}
		foreach my $state (@$SupportProjects_aref)
		{
			unless ( defined $state )
			{
				push( @error_messages, "'Approve States' definition is missing in MAP_SRS.pm file. Please add this detail\n" );
			}
		}

		# check if all expected columns are present in excel sheet
		unless ( defined $First_Bosch_Fault_Read_column )
		{
			push( @error_messages, "$SRS_Map->{'COLUMN_NAMES'}{'Bosch Fault Name'} (Bosch Fault Name) column is missing. Please add this to the excel sheet\n" );
		}
		unless ( defined $Xls_DTC_column )
		{
			push( @error_messages, "$SRS_Map->{'COLUMN_NAMES'}{'DTC'} (DTC) column is missing. Please add this to the excel sheet\n" );
		}
		unless ( defined $Xls_System_Warning_Lamp_column )
		{
			push( @error_messages, "$SRS_Map->{'COLUMN_NAMES'}{'System Warning Lamp'} (System Warning Lamp) column is missing. Please add this to the excel sheet\n" );
		}
		unless ( defined $Xls_CyclicQualificationtime_column )
		{
			push( @error_messages, "$SRS_Map->{'COLUMN_NAMES'}{'Cyclic Qualification Time'} (Cyclic Qualification Time) column is missing. Please add this to the excel sheet\n" );
		}
		unless ( defined $Xls_CyclicDequalificationtime_column )
		{
			push( @error_messages, "$SRS_Map->{'COLUMN_NAMES'}{'Cyclic Dequalification Time'} (Cyclic Dequalification Time) column is missing. Please add this to the excel sheet\n" );
		}
		unless ( defined $Xls_InitQualificationtime_column )
		{
			push( @error_messages, "$SRS_Map->{'COLUMN_NAMES'}{'Init Qualification Time'} (Init Qualification Time) column is missing. Please add this to the excel sheet\n" );
		}
		unless ( defined $Xls_InitDequalificationtime_column )
		{
			push( @error_messages, "$SRS_Map->{'COLUMN_NAMES'}{'Init Dequalification Time'} (Init Dequalification Time) column is missing. Please add this to the excel sheet\n" );
		}
		unless ( defined $Xls_devicetype_column )
		{
			push( @error_messages, "$SRS_Map->{'COLUMN_NAMES'}{'DeviceType'} (DeviceType) column is missing. Please add this to the excel sheet\n" );
		}
		unless ( defined $Xls_FaultType_column )
		{
			push( @error_messages, "$SRS_Map->{'COLUMN_NAMES'}{'FaultType'} (FaultType) column is missing. Please add this to the excel sheet\n" );
		}
		unless ( defined $Xls_Tolerance_column )
		{
			push( @warning_messages, "$SRS_Map->{'COLUMN_NAMES'}{'Tolerance'} (Tolerance) column is missing in excel sheet. Please add if required\n" );
		}
		unless ( defined $Xls_Suppression_column )
		{
			push( @error_messages, "$SRS_Map->{'COLUMN_NAMES'}{'Suppression'} (Suppression) column is missing. Please add this to the excel sheet\n" );
		}

		#++++++++++++++++++++++++++++++++++++++++++++++++++++++
		#++++++++++++++++++++++++++++create the fault list HASH+++++++++++++++++++++++++++++++++++++++
		print TEMPWRITE "'FAULTLIST'=>{";
		print TEMPWRITE "\n";
		my $count;
		foreach my $row ( 2 .. $LastRow_input_data )
		{
			my $Bosch_Fault_Name_Read = $input_WorkSheet->Cells( $row, $First_Bosch_Fault_Read_column )->{'Value'};
			if ( defined $Bosch_Fault_Name_Read )
			{
				++$count;
				print TEMPWRITE "\t\t\t" . "'" . $count . "'" . "=>" . "'$Bosch_Fault_Name_Read'" . ',' . "\n";
			}
		}
		print TEMPWRITE "},";
		print TEMPWRITE "\n\n";
		print TEMPWRITE "#----------------------------------------------------------------------------------#" . "\n";
		my (
			 $number_Read,                      $DTC_Read,                           $Bosch_Fault_Name_Read,          $Internal_Fault_Read,              $System_Warning_Lamp_Read, $Priority_Read,       $Quali_Group_Read,
			 $Xls_CyclicQualificationtime_Read, $Xls_CyclicDequalificationtime_Read, $Xls_InitQualificationtime_Read, $Xls_InitDequalificationtime_Read, $Xls_unlearn_Read,         $Xls_devicetype_Read, $Xls_FaultType_Read,
			 $Xls_Tolerance_Read,               $Xls_Suppression_Read,               $Xls_SystemReaction_Read,        $Xls_SupportProjects_Read,             @Xls_SupportProjects_Read_arr, $SupportProjects_Read_str
		);
		foreach my $row ( 2 .. $LastRow_input_data )
		{
			$Bosch_Fault_Name_Read = $input_WorkSheet->Cells( $row, $First_Bosch_Fault_Read_column )->{'Value'} if defined $First_Bosch_Fault_Read_column;
			chomp($Bosch_Fault_Name_Read);
			if ( defined $First_Bosch_Fault_Read_column and defined $Bosch_Fault_Name_Read )
			{
				$number_Read = $input_WorkSheet->Cells( $row, $Xls_Number_column )->{'Value'} if defined $Xls_Number_column;
				chomp($number_Read);
				$DTC_Read = $input_WorkSheet->Cells( $row, $Xls_DTC_column )->{'Value'} if defined $Xls_DTC_column;
				chomp($DTC_Read);
				$Internal_Fault_Read = $input_WorkSheet->Cells( $row, $Xls_Internal_Fault_column )->{'Value'} if defined $Xls_Internal_Fault_column;
				chomp($Internal_Fault_Read);
				$System_Warning_Lamp_Read = $input_WorkSheet->Cells( $row, $Xls_System_Warning_Lamp_column )->{'Value'} if defined $Xls_System_Warning_Lamp_column;
				chomp($System_Warning_Lamp_Read);
				$Priority_Read = $input_WorkSheet->Cells( $row, $Xls_Fault_Priority_column )->{'Value'} if defined $Xls_Fault_Priority_column;
				chomp($Priority_Read);
				$Quali_Group_Read = $input_WorkSheet->Cells( $row, $Xls_Qualification_Group_column )->{'Value'} if defined $Xls_Qualification_Group_column;
				chomp($Quali_Group_Read);
				$Xls_CyclicQualificationtime_Read = $input_WorkSheet->Cells( $row, $Xls_CyclicQualificationtime_column )->{'Value'} if defined $Xls_CyclicQualificationtime_column;
				chomp($Xls_CyclicQualificationtime_Read);
				$Xls_CyclicDequalificationtime_Read = $input_WorkSheet->Cells( $row, $Xls_CyclicDequalificationtime_column )->{'Value'} if defined $Xls_CyclicDequalificationtime_column;
				chomp($Xls_CyclicDequalificationtime_Read);
				$Xls_InitQualificationtime_Read = $input_WorkSheet->Cells( $row, $Xls_InitQualificationtime_column )->{'Value'} if defined $Xls_InitQualificationtime_column;
				chomp($Xls_InitQualificationtime_Read);
				$Xls_InitDequalificationtime_Read = $input_WorkSheet->Cells( $row, $Xls_InitDequalificationtime_column )->{'Value'} if defined $Xls_InitDequalificationtime_column;
				chomp($Xls_InitDequalificationtime_Read);
				$Xls_unlearn_Read = $input_WorkSheet->Cells( $row, $Xls_unlearn_column )->{'Value'} if defined $Xls_unlearn_column;
				chomp($Xls_unlearn_Read);
				$Xls_devicetype_Read = $input_WorkSheet->Cells( $row, $Xls_devicetype_column )->{'Value'} if defined $Xls_devicetype_column;
				chomp($Xls_devicetype_Read);
				$Xls_FaultType_Read = $input_WorkSheet->Cells( $row, $Xls_FaultType_column )->{'Value'} if defined $Xls_FaultType_column;
				chomp($Xls_FaultType_Read);
				$Xls_Tolerance_Read = $input_WorkSheet->Cells( $row, $Xls_Tolerance_column )->{'Value'} if defined $Xls_Tolerance_column;
				chomp($Xls_Tolerance_Read);
				$Xls_Suppression_Read = $input_WorkSheet->Cells( $row, $Xls_Suppression_column )->{'Value'} if defined $Xls_Suppression_column;
				print("DEBUG row = $row column = $Xls_DTC_column \n");

				if ( !$Xls_Suppression_Read )
				{
					$Xls_Suppression_Read = 'True';
				} else
				{
					$Xls_Suppression_Read = 'False';
				}
				chomp($Xls_Suppression_Read);
				@Xls_SupportProjects_Read_arr = ();
				foreach my $column_key ( keys %$Xls_SupportProjects_column_href )
				{
					print("DEBUG2 row = $row column = $column_key \n");
					$Xls_SupportProjects_Read = $input_WorkSheet->Cells( $row, int($column_key) )->{'Value'} if defined $column_key;
					if ( ( $Xls_SupportProjects_Read eq 'implemented' ) or ( $Xls_SupportProjects_Read eq 'approved' ) )
					{
						$Xls_SupportProjects_column_href->{$column_key} =~ s/^State_//;
						push( @Xls_SupportProjects_Read_arr, $Xls_SupportProjects_column_href->{$column_key} );
					}
				}
				$SupportProjects_Read_str = "['" . join( "','", @Xls_SupportProjects_Read_arr ) . "']";

				#check MAP file - overwrite read values with mapped values if present
				$DTC_Read                 = $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'DTC'} }{$DTC_Read}                                 if defined $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'DTC'} }{$DTC_Read};
				$System_Warning_Lamp_Read = $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'System Warning Lamp'} }{$System_Warning_Lamp_Read} if defined $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'System Warning Lamp'} }{$System_Warning_Lamp_Read};
				$Internal_Fault_Read      = $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'Internal Fault'} }{$Internal_Fault_Read}           if defined $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'Internal Fault'} }{$Internal_Fault_Read};
				$Priority_Read            = $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'Fault Priority'} }{$Priority_Read}                 if defined $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'Fault Priority'} }{$Priority_Read};
				$Xls_unlearn_Read         = $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'Unlearning'} }{$Xls_unlearn_Read}                  if defined $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'Unlearning'} }{$Xls_unlearn_Read};
				$Xls_devicetype_Read      = $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'DeviceType'} }{$Xls_devicetype_Read}               if defined $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'DeviceType'} }{$Xls_devicetype_Read};
				$Xls_FaultType_Read       = $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'FaultType'} }{$Xls_FaultType_Read}                 if defined $SRS_Map->{ $SRS_Map->{'COLUMN_NAMES'}{'FaultType'} }{$Xls_FaultType_Read};
				my $Q_DQ_time_replacements = $SRS_Map->{'Q_DQ_time_replacements'};

				foreach my $key ( keys %$Q_DQ_time_replacements )
				{
					if ( $Xls_CyclicQualificationtime_Read =~ m/\Q$key\E/i )
					{
						my $value = $SRS_Map->{'Q_DQ_time_replacements'}{$key};
						$Xls_CyclicQualificationtime_Read = _return_CyclicQualificationTime_mapping( $Xls_CyclicQualificationtime_Read, $value, $key );
					}
					if ( $Xls_CyclicDequalificationtime_Read =~ m/\Q$key\E/i )
					{
						my $value = $SRS_Map->{'Q_DQ_time_replacements'}{$key};
						$Xls_CyclicDequalificationtime_Read = _return_CyclicDequalificationTime_mapping( $Xls_CyclicDequalificationtime_Read, $value, $key );
					}
				}
				my $tolerance_replacements = $SRS_Map->{'tolerance_replacements'};
				foreach my $key ( keys %$tolerance_replacements )
				{
					if ( $Xls_Tolerance_Read =~ m/\Q$key\E/i )
					{
						my $value = $SRS_Map->{'tolerance_replacements'}{$key};
						$Xls_Tolerance_Read = _return_Tolerance_mapping( $Xls_Tolerance_Read, $value, $key );
					}
				}

				#check for any empty fields!
				unless ( defined $DTC_Read )
				{
					push( @error_messages, "DTC is not defined for fault $Bosch_Fault_Name_Read. Please add this\n" );
				}

				#check for allowed values!
				if ( $System_Warning_Lamp_Read ne '' and $System_Warning_Lamp_Read ne 'Filtered/Latched/Stored' and $System_Warning_Lamp_Read ne 'Filtered/Latched' and $System_Warning_Lamp_Read ne 'Filtered' and $System_Warning_Lamp_Read ne 'Off' )
				{
					push( @error_messages, "System Warning Lamp property : $System_Warning_Lamp_Read is invalid for $Bosch_Fault_Name_Read\n" );
				}
				if ( $Xls_devicetype_Read ne '' and $Xls_devicetype_Read ne 'Squib' and $Xls_devicetype_Read ne 'Switch' and $Xls_devicetype_Read ne 'PAS' and $Xls_devicetype_Read ne 'Lamp' )
				{
					push( @error_messages, "Device type property: $Xls_devicetype_Read is expected for $Bosch_Fault_Name_Read?\n" );
				}
				if ( $Xls_FaultType_Read ne '' and $Xls_FaultType_Read ne 'cyclic' and $Xls_FaultType_Read ne 'init' and $Xls_FaultType_Read ne 'init/cyclic' )
				{
					push( @error_messages, "Fault type property: $Xls_FaultType_Read is expected for $Bosch_Fault_Name_Read?\n" );
				}
				my $DeviceName;
				my $condition;

				#-----------------------Detect Fault condition and Device name---------------------------#
				my $FaultCondition = $SRS_Map->{'FaultCondition'};
				foreach my $key ( keys %$FaultCondition )
				{
					my $value = $SRS_Map->{'FaultCondition'}{$key};
					if ( $Bosch_Fault_Name_Read =~ m/^FltSwitch(.*?)\Q$key\E$/i )
					{    #FltSwitchBLFDShortLine (lookup table replacement:  ShortLine => Shortline)
						$condition           = $value;
						$DeviceName          = $1;
						$Xls_devicetype_Read = 'Switch';
					} elsif ( $Bosch_Fault_Name_Read =~ m/^FltAdapt(.*?)$/i )
					{    #FltAdaptSAFD
						$DeviceName          = $1;
						$condition           = 'Adaptation';
						$Xls_devicetype_Read = 'Squib';
					} elsif ( $Bosch_Fault_Name_Read =~ m/^Flt(.*?)\Q$key\E$/i )
					{    #FltAB1FDResistanceOpen (lookup table replacement:  ResistanceOpen => Openline)
						$condition  = $value;
						$DeviceName = $1;
					} elsif ( $Bosch_Fault_Name_Read =~ m/^rb_(.*?)_\Q$key\E(.*?)_flt$/i )
					{    #AB12 fault enums - e.g. rb_sqm_CrosscouplingSA1RD_flt
						$condition = $value;
						my $type = $1;
						$DeviceName          = $2;
						$Xls_devicetype_Read = _get_devicetype($type);
					} elsif ( $Bosch_Fault_Name_Read =~ m/^(.*?)\Q$key\E(.*?)$/i )
					{    #IndicatorShort2Bat (lookup table replacement:  IndicatorShort2Bat => Short2Bat)
						$condition = $value;
					} else
					{    #too many warnings. So commented out!!
						    #push(@warning_messages,  "fault 'condtion' is not detected for $Bosch_Fault_Name_Read . Please fill this manually\n");
					}
					if ( $Bosch_Fault_Name_Read =~ m/^rb_psem_Init(.*?)_flt$/i )
					{
						$DeviceName = $1;
						$condition  = 'InitOrType';
					}
					if ( $Bosch_Fault_Name_Read =~ m/rb_pom_VbatLow_flt|rb_pom_VbatHigh_flt/i )
					{
						$DeviceName          = 'Vbat';
						$Xls_devicetype_Read = 'Vbat';
					}
				}

				#-----------------------Detect Device name---------------------------#
				if ( defined $SRS_Map->{'Device'} )
				{
					my $deviceNames = $SRS_Map->{'Device'};
					foreach my $key ( keys %$deviceNames )
					{
						my $value = $SRS_Map->{'Device'}{$key};
						$DeviceName = _return_DeviceName_mapping( $Bosch_Fault_Name_Read, $DeviceName, $key, $value );
					}
				}

				#-----------------------Detect Device type---------------------------#
				if ( defined $SRS_Map->{'DeviceType'} )
				{
					my $deviceTypes = $SRS_Map->{'DeviceType'};
					foreach my $key ( keys %$deviceTypes )
					{
						my $value = $SRS_Map->{'DeviceType'}{$key};
						$Xls_devicetype_Read = _return_DeviceType_mapping( $Bosch_Fault_Name_Read, $Xls_devicetype_Read, $key, $value );
					}
				}
				$DeviceName          = 'n/a' if $DeviceName          eq '';
				$condition           = 'n/a' if $condition           eq '';
				$Xls_devicetype_Read = 'n/a' if $Xls_devicetype_Read eq '';

				#---------------------------------------------------------------------------------------------------#
				#---------------------------------------------------------------------------------------------------#
				if ( defined $Bosch_Fault_Name_Read )
				{
					print TEMPWRITE "'$Bosch_Fault_Name_Read'=>{\n";
					print TEMPWRITE "\t\t\t'DTC'=>'$DTC_Read',\n ";
					print TEMPWRITE "\t\t\t'Device'=>'$DeviceName',\n";
					print TEMPWRITE "\t\t\t'DeviceType'=>'$Xls_devicetype_Read',\n";
					print TEMPWRITE "\t\t\t'Condition'=>'$condition',\n";
					print TEMPWRITE "\t\t\t'Unlearn'=>'$Xls_unlearn_Read',\n";
					print TEMPWRITE "\t\t\t'Faultpriority'=>'$Priority_Read',\n";
					print TEMPWRITE "\t\t\t'WarningLamp'=>'$System_Warning_Lamp_Read',\n";
					print TEMPWRITE "\t\t\t'CyclicQualificationtime'=>'$Xls_CyclicQualificationtime_Read', #in ms\n";
					print TEMPWRITE "\t\t\t'CyclicDequalificationtime'=>'$Xls_CyclicDequalificationtime_Read', #in ms\n";
					print TEMPWRITE "\t\t\t'InitQualificationtime'=>'$Xls_InitQualificationtime_Read', #in ms\n";
					print TEMPWRITE "\t\t\t'InitDequalificationtime'=>'$Xls_InitDequalificationtime_Read', #in ms\n";
					print TEMPWRITE "\t\t\t'FaultType'=>'$Xls_FaultType_Read',\n";
					print TEMPWRITE "\t\t\t'Tolerance'=>'$Xls_Tolerance_Read', #in ms\n";
					print TEMPWRITE "\t\t\t'Suppression'=> '$Xls_Suppression_Read', \n";
					print TEMPWRITE "\t\t\t'AdditionalFaults'=> [],\n";
					print TEMPWRITE "\t\t\t'OptionalFault'=> [],\n";
					print TEMPWRITE "\t\t\t'SupportProject'=> $SupportProjects_Read_str,\n";
					print TEMPWRITE "\t\t\t},\n";
					print TEMPWRITE "#----------------------------------------------------------------------------------#" . "\n";
				}

				#print "==========================================================","\n";
				undef $Xls_devicetype_Read;
				undef $DTC_Read;
				undef $DeviceName;
				undef $condition;
				undef $Xls_unlearn_Read;
				undef $Priority_Read;
				undef $System_Warning_Lamp_Read;
				undef $Quali_Group_Read;
				undef $Xls_CyclicQualificationtime_Read;
				undef $Xls_CyclicDequalificationtime_Read;
				undef $Xls_InitQualificationtime_Read;
				undef $Xls_InitDequalificationtime_Read;
				undef $Xls_FaultType_Read;
				undef $Xls_Tolerance_Read;
				undef $Xls_Suppression_Read;
				undef $SupportProjects_Read_str;
			}
		}
		close TEMPWRITE;
		$input_WorkBook->Close();
		open( TEMPWRITE, "temp_Fault_mappings.txt" ) || die("temp_Fault_mappings.txt could not be opened \n!");
		while ( my $line_template = <TEMPLATE> )
		{
			print FAULTMAP $line_template;
			if ( $line_template =~ m/COPY THE GENERATED FAULT MAPPINGS HERE/i )
			{
				while ( my $line_temp = <TEMPWRITE> )
				{
					print FAULTMAP $line_temp;
				}
			}
		}
		close TEMPWRITE;
		close FAULTMAP;
		unlink "temp_Fault_mappings.txt" or warn "Could not delete file temp_Fault_mappings.txt!";
		my $errorcount = 0;
		print ERRORLOG "!!!!!!!!!!!!!!!!!!!!!!!!ERRORS!!!!!!!!!!!!!!!!!!!!!!!!\n\n";
		foreach my $error (@error_messages)
		{
			$errorcount++;
			print ERRORLOG "$errorcount. $error";
		}
		my $warningcount = 0;
		print ERRORLOG "\n\n!!!!!!!!!!!!!!!!!!!!!!!!WARNINGS!!!!!!!!!!!!!!!!!!!!!!\n\n";
		foreach my $warning (@warning_messages)
		{
			$warningcount++;
			print ERRORLOG "$warningcount. $warning";
		}
		print ERRORLOG "\n\n!!!!!!!!!!!!!!!!!!!!!!!!NOTES!!!!!!!!!!!!!!!!!!!!!!!!!\n";
		print ERRORLOG "\n1. Allowed values (mandatory) for 'WarningLamp' property are 'Filtered/Latched/Stored', 'Filtered/Latched', 'Filtered' or 'off'\n";
		print ERRORLOG "2. Allowed values (currently) for 'DeviceType' are 'Squib', 'Switch', 'PAS' or 'Lamp'\n";
		print ERRORLOG "3. Allowed values (currently) for 'FaultType' are 'cyclic', 'init', 'initcyclic'\n";
		print ERRORLOG "\n\n!!!!!!!!!!!!!!!!!!!!!!!INFO!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
		print ERRORLOG "\nPerform the below steps:\n";
		print ERRORLOG "1. Make sure this new mapping file is declared in the CFG file for your project. Insert the below statement\n";
		print ERRORLOG 'require "$LIFT_PRJCFG_path/Mapping_FAULT.pm";';
		print ERRORLOG "\n";

		#print ERRORLOG '$LIFT_PROJECT::Defaults->{"Mapping_FAULT"};';
		close ERRORLOG;
		##################  Save File is completed ###############################
	}
	$status = "Completed Press Exit! \nHave a look at ErrorLog.txt file for Errors and Warnings";
	$main->update();    # sub
	return 1;
}

sub _get_devicetype
{
	my $type = shift;
	my $Xls_devicetype_Read;
	if ( $type eq 'sqm' )
	{
		$Xls_devicetype_Read = 'Squib';
	} elsif ( $type eq 'swm' )
	{
		$Xls_devicetype_Read = 'Switch';
	}
	return $Xls_devicetype_Read;
}

sub _return_DeviceName_mapping
{
	my $Bosch_Fault_Name_Read = shift;
	my $DeviceName            = shift;
	my $key                   = shift;
	my $value                 = shift;
	if ( $Bosch_Fault_Name_Read =~ m/^Flt(.*?)\Q$key\E(.*?)$/i )
	{    #FltBAOnAShort2Bat (lookup table replacement:  BAOnA => BAOnA)
		$DeviceName = $value;
	} elsif ( $Bosch_Fault_Name_Read =~ m/^Flt(.*?)\Q$key\E$/i )
	{    #FltBAOnAShort2Bat (lookup table replacement:  BAOnA => BAOnA)
		$DeviceName = $value;
	} elsif ( $Bosch_Fault_Name_Read =~ m/^\Q$key\E$/i )
	{    #FltAdaptABFD (lookup table replacement:  FltAdaptABFD => FrontDriverFirstStage)
		$DeviceName = $value;
	} elsif ( $Bosch_Fault_Name_Read =~ m/^(.*?)\Q$key\E(.*?)$/i )
	{    #FltAdaptABFD (lookup table replacement:  FltAdaptABFD => FrontDriverFirstStage)
		$DeviceName = $value;
	} else
	{    #too many warnings. So commented out!!
		    #push(@warning_messages,  "fault 'condtion' is not detected for $Bosch_Fault_Name_Read . Please fill this manually\n");
	}
	return $DeviceName;
}

sub _return_DeviceType_mapping
{
	my $Bosch_Fault_Name_Read = shift;
	my $Xls_devicetype_Read   = shift;
	my $key                   = shift;
	my $value                 = shift;
	if ( $Bosch_Fault_Name_Read =~ m/^Flt(.*?)\Q$key\E(.*?)$/i )
	{       #TimeOutError (lookup table replacement:  TimeOutError => Message)
		$Xls_devicetype_Read = $value;
	} elsif ( $Bosch_Fault_Name_Read =~ m/^Flt(.*?)\Q$key\E$/i )
	{       #AdaptSAFD
		$Xls_devicetype_Read = $value;
	} elsif ( $Bosch_Fault_Name_Read =~ m/^rb_(.*?)\Q$key\E/i )
	{       #rb_sqm_
		$Xls_devicetype_Read = $value;
	} elsif ( $Bosch_Fault_Name_Read =~ m/^\Q$key\E$/i )
	{       #FltESP21TachoVelError (lookup table replacement:  FltESP21TachoVelError => Signal)
		$Xls_devicetype_Read = $value;
	} else
	{       #too many warnings. So commented out!!
		    #push(@warning_messages,  "fault 'condtion' is not detected for $Bosch_Fault_Name_Read . Please fill this manually\n");
	}
	return $Xls_devicetype_Read;
}

sub _return_CyclicQualificationTime_mapping
{
	my $Xls_CyclicQualificationtime_Read = shift;
	my $value                            = shift;
	my $key                              = shift;
	if ( $value =~ m/\*/ )
	{
		$value                            =~ s/\*//;
		$Xls_CyclicQualificationtime_Read =~ s/\Q$key\E//;
		$Xls_CyclicQualificationtime_Read = $Xls_CyclicQualificationtime_Read * $value;
	} else
	{
		$Xls_CyclicQualificationtime_Read =~ s/\Q$key\E/\Q$value\E/;
	}
	return $Xls_CyclicQualificationtime_Read;
}

sub _return_CyclicDequalificationTime_mapping
{
	my $Xls_CyclicDequalificationtime_Read = shift;
	my $value                              = shift;
	my $key                                = shift;
	if ( $value =~ m/\*/ )
	{
		$value                              =~ s/\*//;
		$Xls_CyclicDequalificationtime_Read =~ s/\Q$key\E//;
		$Xls_CyclicDequalificationtime_Read = $Xls_CyclicDequalificationtime_Read * $value;
	} else
	{
		$Xls_CyclicDequalificationtime_Read =~ s/\Q$key\E/\Q$value\E/;
	}
	return $Xls_CyclicDequalificationtime_Read;
}

sub _return_Tolerance_mapping
{
	my $Xls_Tolerance_Read = shift;
	my $value              = shift;
	my $key                = shift;
	if ( $value =~ m/\*/ )
	{
		$value              =~ s/\*//;
		$Xls_Tolerance_Read =~ s/\Q$key\E//;
		$Xls_Tolerance_Read = $Xls_Tolerance_Read * $value;
	} else
	{
		$Xls_Tolerance_Read =~ s/\Q$key\E/\Q$value\E/;
	}
	return $Xls_Tolerance_Read;
}
__END__
