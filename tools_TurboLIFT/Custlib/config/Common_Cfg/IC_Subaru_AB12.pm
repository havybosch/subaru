#### TEST CASE MODULE
package IC_Subaru_AB12;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;
###-------------------------------
my $VERSION = q$Revision: 1.3 $;
my $HEADER  = q$Header: config/IC_Subaru_AB12.pm 1.3 2018/04/24 14:08:30ICT Rohit Raj (RBEI/ESA-PE2) (RJO6KOR) develop  $;
##################################
use File::Basename;
use File::Copy;
use Cwd 'abs_path';
#### INCLUDE ENGINE MODULES ####
use LIFT_general;
use LIFT_evaluation;
use LIFT_CANoe;
use LIFT_TSG4;
use LIFT_POWER;
use LIFT_CD;
use FuncLib_Project_SPI;
use LIFT_CANoe;
use LIFT_equipment;
use LIFT_QuaTe;
use LIFT_can_access;
use LIFT_labcar;
use GENERIC_DCOM;
use LIFT_PRITT;
use LIFT_manitoo;
use FuncLib_DeviceManipulation;
use FuncLib_SPILC_Framework;
##################################
use LIFT_PD;
require LIFT_PD2ProdDiag;
import LIFT_PD2ProdDiag;
use LIFT_ProdDiag;
## Config for Manitoo set up ####
if ( $LIFT_Testbenches::Testbench->{$LIFT_Testbenches::hostname}->{'Functions'}->{'Labcar'}->{'line'} =~ /SPILC/i ) {
	require FuncLib_LC2SPILC;
	import FuncLib_LC2SPILC;
}

## other local vars

our $PURPOSE = "LIFT INIT CAMPAIGN for AB12 tests";

##################################
####  TESTCASE STARTS HERE    ####
##################################

sub TC_set_parameters {

	###-----------------------------------------------------------------------
	### Reading Testcase Parameter from Testcase Parameter File
	###-----------------------------------------------------------------------
	if ( $LIFT_config::EDR_variant_name =~ /Custlib/i ) {
		S_set_warning("custlib is not a project can be tested for EDR Please check project in bat file if you test EDR \n");
	}
	S_w2rep("parameters for init campaign\n");
	S_w2rep( "project $LIFT_config::EDR_variant_name is running\n", 'green' );
	S_w2rep( "setup $LIFT_Testbenches::setup is using\n",           'green' );
	return 1;

}

#### INITIALIZE TC #####
sub TC_initialization {

	##### manitoo configure
	if ( $LIFT_Testbenches::setup =~ /Manitoo/i ) {
		S_log_testbenchconfig();
		EQUIP_init_testbench();
		S_teststep("Turn ON ECU before starting SPILC_init ");    #SPILC_init require ECU has to be turned ON
		MANITOO_init();

		FuncLib_Project_SPI::LCSPI_init();

		SPILC_fill_device_details();
		MANITOO_cmd_FET_control( 0, { '1' => 'ON' } );
		S_wait_ms(2000);
		GDCOM_init();
		CA_simulation_start();
		S_wait_ms(2000);
	}
	else {                                                        ##### pbox + tsg4 configure
		S_log_testbenchconfig();
		EQUIP_init_testbench();
		S_wait_ms(2000);

		# COMPATIBILITY FOR ALL TESTCASES:
		GDCOM_init();
		CA_simulation_start();
		S_wait_ms(2000);
	}
	return 1;
}
### STIMULATION AND MEASUREMENT ###
sub TC_stimulation_and_measurement {
	
	if($LIFT_config::CANoe =~ m/CANoeCfg_R00r.cfg/i ){
		S_w2rep("CANoe not support for SecOC");
		PRD_Set_Device_Configuration({'EnableSecOC' => 'clear_Configure'});
		
	}elsif($LIFT_config::CANoe =~ m/CANoeCfg_R03j.cfg/i){
		S_w2rep("CANoe support for SecOC");
		PRD_Set_Device_Configuration({'EnableSecOC' => 'set_Configure'});
	}
	
	
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');

	# COMPATIBILITY FOR ALL TESTCASES:

	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');

	# connect devices congfigured and disconnect devices not configured
	my $device_href   = PD_DumpDeviceConfiguration();
	my @switch_device = TSG4_get_names('BELT_LOCKS');
	my @pas_device    = TSG4_get_names('PAS_LINES');
	my @squib_device  = TSG4_get_names('SQUIBS');

	# foreach my $device_name ( keys %{ $device_href->{'squib'}->{'Prog'} } ) {

		# if ( ( $device_href->{'squib'}->{'Mon'}->{$device_name} = 1 ) and ( grep { $_ eq $device_name } @squib_device ) ) {
			# LC_ConnectLine($device_name)    if $device_href->{'squib'}->{'Prog'}->{$device_name} == 1;
			# LC_DisconnectLine($device_name) if $device_href->{'squib'}->{'Prog'}->{$device_name} == 0;
		# }
		# else {
			# S_w2log( 4, " $device_name is not monitor or not defined in TSG4 mapping - do nothing" );
		# }
	# }
	# foreach my $device_name ( keys %{ $device_href->{'pases'}->{'Prog'} } ) {
		# if ( ( $device_href->{'pases'}->{'Mon'}->{$device_name} = 1 ) and ( grep { $_ eq $device_name } @pas_device ) ) {

			# LC_ConnectLine($device_name)    if $device_href->{'pases'}->{'Prog'}->{$device_name} == 1;
			# LC_DisconnectLine($device_name) if $device_href->{'pases'}->{'Prog'}->{$device_name} == 0;
		# }
		# else {
			# S_w2log( 4, " $device_name is not monitor or not defined in TSG4 mapping - do nothing" );
		# }
	# }
	# foreach my $device_name ( keys %{ $device_href->{'switches'}->{'Prog'} } ) {
		# if ( ( $device_href->{'switches'}->{'Mon'}->{$device_name} = 1 ) and ( grep { $_ eq $device_name } @switch_device ) ) {
			# unless ( $device_name =~ /connector/i or $device_name =~ /BLFD/i ) {
				# LC_ConnectLine($device_name)    if $device_href->{'switches'}->{'Prog'}->{$device_name} == 1;
				# LC_DisconnectLine($device_name) if $device_href->{'switches'}->{'Prog'}->{$device_name} == 0;
				# LC_SetLogicalState( $device_name, 'Default' ) if ( $device_name =~ m/PAD/i && $device_href->{'switches'}->{'Prog'}->{$device_name} == 1 );
			# }
		# }
		# else {
			# S_w2log( 4, " $device_name is not monitor or not defined in TSG4 mapping - do nothing" );
		# }
	# }
	PD_ClearFaultMemory();
	S_wait_ms(5000);

	#check fault in IC
	LC_ECU_Reset();
	PD_ReadFaultMemory();
	S_wait_ms(5000);

	return 1;
}

#### EVALUATE TC #####
sub TC_evaluation {

	S_w2rep(" IC -> set verdict PASS to finish init campaign\n");
	S_set_verdict(VERDICT_PASS);

	return 1;
}

#### TC FINALIZATION #####
#-- set system in original state --##
sub TC_finalization {

	#Add step to clone *.pm files from funclib_Customer into _snapshot_
	my $snapshot_funclib = "$main::REPORT_PATH/_snapshot_/funclib_Customer";
	my $source_funclib   = "$LIFT_config::PATH_funclib";
	clone_files( $source_funclib, $snapshot_funclib, '\.(pm)$' );

	#Add step to clone *.can/cin files from CANoe_Conf/nodes into _snapshot_
	mkdir("$main::REPORT_PATH/_snapshot_/CANoe_Conf");
	my $PATH_CANoe     = $LIFT_config::LIFT_Testbench->{'Devices'}{'CANoe'}{'Online_Config'};
	my $snapshot_nodes = "$main::REPORT_PATH/_snapshot_/CANoe_Conf/nodes";
	my $source_nodes   = "$PATH_CANoe/../nodes";
	clone_files( $source_nodes, $snapshot_nodes, '\.(can|cin)$' );

	#Add step to clone *.dbc files from CANoe_Conf/db into _snapshot_
	my $snapshot_dbc = "$main::REPORT_PATH/_snapshot_/CANoe_Conf/db";
	my $source_dbc   = "$PATH_CANoe/../db";
	clone_files( $source_dbc, $snapshot_dbc, '\.(dbc)$' );

	#Add step to clone *.vsysvar files from CANoe_Conf/sysvar into _snapshot_
	my $snapshot_sysvar = "$main::REPORT_PATH/_snapshot_/CANoe_Conf/sysvar";
	my $source_sysvar   = "$PATH_CANoe/../sysvar";
	clone_files( $source_sysvar, $snapshot_sysvar, '\.(vsysvar)$' );

	return 1;
}

sub clone_files {

	# Example usage:
	#clone_files('/path/to/folder/A', '/path/to/folder/B', '\.(txt|jpg)$');

	my ( $source_folder, $target_folder, $file_types ) = @_;
	$source_folder = abs_path($source_folder);
	mkdir($target_folder);

	opendir my $dir, $source_folder or die "Can't open $source_folder: $!";
	my @files = readdir $dir;
	closedir $dir;

	foreach my $file (@files) {
		next if ( $file eq '.' or $file eq '..' );
		my $source_file = "$source_folder/$file";
		my $target_file = "$target_folder/$file";
		if ( -f $source_file && $source_file =~ /$file_types/ ) {
			copy( $source_file, $target_file ) or die "Failed to copy $source_file: $!";
		}
	}
	return;
}

1;
