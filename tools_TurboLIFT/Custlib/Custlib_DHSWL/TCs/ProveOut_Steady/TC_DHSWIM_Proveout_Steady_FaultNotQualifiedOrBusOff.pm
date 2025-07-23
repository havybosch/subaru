#### TEST CASE MODULE
package TC_DHSWIM_Proveout_Steady_FaultNotQualifiedOrBusOff;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER  = q$Header: Include/TCpmGenerator/Create_TCpm.pl 1.1 2015/01/21 16:00:45MEZ Geisler Martin (CC-PS/EPS2) (gem1si) develop  $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS name> (e.g. TS_SWM_SwitchMgt)
#TS version in DOORS: <TS version based on which this script is written/updated> (e.g. 3.30)
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project;    #necessary

#include further modules here
use LIFT_labcar;
use LIFT_can_access;
use FuncLib_TNT_FM;
use LIFT_evaluation;
use LIFT_PD;
use GENERIC_DCOM;
use LIFT_PRITT;

##################################

our $PURPOSE = "Check behavior of DHSWL in Prove out in condition that Fault condition is created and removed before fault qualified, Or in condition that Bus-off is created";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_Proveout_Steady_FaultNotQualified_BusOff

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. ECU ON and wait for <t_Pre>.

2. Create <Fault> condition and remove the condition after <t_wait>.

3. Check fault recorder and Reset ECU.

4. Wait 4s since IGN On and chek state of <DHSWL_signal>.  

5. Check <DHSWL_signal> for 2s after 6s from IGN ON.  

6. Check <DHSWL_signal> after 8s from IGN ON with updated expected value..


I<B<Evaluation>>

1.

2.  

3. <Fault> is in <Fault_state>.

4. <DHSWL_signal> shall be in <ON_State> for <ON_time_ms> from IGN ON.

5.<DHSWL_signal> shall be <OFF_State> for <OFF_time_ms>.

6. <DHSWL_signal> is in <Real_State> after <ProveOut_Time> from IGN ON.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 't_Pre' => 
	SCALAR 't_wait' => 
	SCALAR 'Fault_state' => 
	SCALAR 'Real_State' => 
	SCALAR 'Fault' => 
	SCALAR 'purpose' => 
	SCALAR 'ON_time_ms' => 
	SCALAR 'OFF_time_ms' => 
	SCALAR 'ProveOut_Time' => 
	SCALAR 'ON_State' => 
	SCALAR 'OFF_State' => 
	SCALAR 'DHSWL_signal' => 


=head2 PARAMETER EXAMPLES

	purpose = 'Check behavior of DHSWL in Prove out in condition that Fault condition is created and removed before fault qualified, and in condition that Bus-off is created' 
	
	ON_time_ms = '6000' #ms (+/-150ms)
	OFF_time_ms = '2000' #ms (+/-150ms)
	ProveOut_Time = '8000' #ms  (+/-300ms)
	ON_State = '1'
	OFF_State = '0'
	
	DHSWL_signal = 'DHS_RILReq'
	t_Pre = 4000 #ms
	t_wait = '1000' #ms
	Fault_state = 'Empty'
	Real_State = '0'
	Fault = 'No fault'

=cut

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_ON_time_ms;
my $tcpar_OFF_time_ms;
my $tcpar_ProveOut_Time;
my $tcpar_ON_State;
my $tcpar_OFF_State;
my $tcpar_DHSWL_signal;
my $tcpar_t_Pre;
my $tcpar_t_wait;
my $tcpar_Fault_state;
my $tcpar_Real_State;
my $tcpar_Fault;
my $tcpar_TypeCheck;
my $tcpar_t_wait2;

################ global parameter declaration ###################
#add any global variables here
my $fault_struct;
my $Provetime_Obt_0_6;
my $Provetime_Obt_6_8;
my $Provetime_Obt_8;
my @Provetime_Obt_0_6_arr;
my @Provetime_Obt_8_arr;
my @Provetime_Obt_6_8_arr;

#my $DTC;
my ( $real_default,       $monitored_id_default,       $prog_default );
my ( $real_after_setting, $monitored_id_after_setting, $prog_after_setting );

###############################################################

sub TC_set_parameters {

	$tcpar_purpose       = GEN_Read_mandatory_testcase_parameter('purpose');
	$tcpar_ON_time_ms    = GEN_Read_mandatory_testcase_parameter('ON_time_ms');
	$tcpar_OFF_time_ms   = GEN_Read_mandatory_testcase_parameter('OFF_time_ms');
	$tcpar_ProveOut_Time = GEN_Read_mandatory_testcase_parameter('ProveOut_Time');
	$tcpar_ON_State      = GEN_Read_mandatory_testcase_parameter('ON_State');
	$tcpar_OFF_State     = GEN_Read_mandatory_testcase_parameter('OFF_State');
	$tcpar_DHSWL_signal  = GEN_Read_mandatory_testcase_parameter('DHSWL_signal');
	$tcpar_t_Pre         = GEN_Read_mandatory_testcase_parameter('t_Pre');
	$tcpar_t_wait        = GEN_Read_mandatory_testcase_parameter('t_wait');
	$tcpar_Fault_state   = GEN_Read_mandatory_testcase_parameter('Fault_state');
	$tcpar_Real_State    = GEN_Read_mandatory_testcase_parameter('Real_State');
	$tcpar_Fault         = GEN_Read_mandatory_testcase_parameter('Fault');
	$tcpar_TypeCheck     = GEN_Read_mandatory_testcase_parameter('TypeCheck');
	$tcpar_t_wait2       = GEN_Read_mandatory_testcase_parameter('t_wait2');

	return 1;
}

sub TC_initialization {

	S_teststep( "StandardPrepNoFault", 'AUTO_NBR' );
	CA_trace_start();
	GEN_StandardPrepNoFault();
	( $real_default, $monitored_id_default, $prog_default ) = PD_get_device_config('CustIsEPPSupported');
	S_w2rep( "Default EPP feature configuration status: Presense - '$real_default', Monitor - '$monitored_id_default', Configure - '$prog_default'\n", 'blue' );
	EVAL_evaluate_value( "Default EPP feature configuration status:", $prog_default, "==", 1 );
	if ( $prog_default == 1 ) {
		S_w2rep( "EPP feature is already configured\n", 'blue' );
	}
	else {
		S_w2rep( "EPP feature is deconfigured\n", 'blue' );
	}

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep( "ECU ON and wait for '$tcpar_t_Pre'.", 'AUTO_NBR' );
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	LC_ECU_On();
	S_wait_ms($tcpar_t_Pre);
	S_teststep( "Create '$tcpar_Fault' condition and remove the condition after '$tcpar_t_wait'.", 'AUTO_NBR' );

	if ( $tcpar_TypeCheck eq 'FaultNotQualified' ) {
		FM_createFault($tcpar_Fault);    #used for TSG4
		S_wait_ms($tcpar_t_wait);
		FM_removeFault($tcpar_Fault);    #used for TSG4
		S_wait_ms($tcpar_t_wait2);       # afer qualification time, fault still not qualified
	}
	else {
		#S_user_action("Set BusOff Fault");
		create_busoffCondtion();
		S_wait_ms( $tcpar_t_wait + 5000 );

		#S_user_action("Remove BusOff Fault");
		remove_busoffCondtion();
		S_wait_ms( $tcpar_t_wait2 + 5000 );    # BusOff fault dequalified
	}

	S_teststep( "Check fault recorder and Reset ECU.", 'AUTO_NBR', 'check_fault_recorder' );    #measurement 1
	$fault_struct = PD_ReadFaultMemory(1);
	S_wait_ms(2000);
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	LC_ECU_On();

	S_teststep( "Check state of '$tcpar_DHSWL_signal' from first message transmit from IGN on for 6s ", 'AUTO_NBR', 'wait_6s_since' );    #measurement 2
	GEN_printComment("-----Measuring the lamp signal within 6s from IGN ON -----");
	S_wait_ms(250);
	foreach ( 1 .. 9 ) {
		S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n", 'blue' );
		($Provetime_Obt_0_6) = CA_read_can_signal( $tcpar_DHSWL_signal, 'hex' );
		$Provetime_Obt_0_6 =~ s/0x//;
		push( @Provetime_Obt_0_6_arr, hex($Provetime_Obt_0_6) );
		S_wait_ms(600);
	}

	S_teststep( "Check '$tcpar_DHSWL_signal' for 2s after 6s from IGN ON", 'AUTO_NBR', 'wait_2s_and' );                                   #measurement 3
	GEN_printComment("-----Measuring the lamp signal within 2s from 6s -> 8s from IGN ON -----");
	S_wait_ms(500);
	foreach ( 1 .. 3 ) {
		S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n", 'blue' );
		($Provetime_Obt_6_8) = CA_read_can_signal( $tcpar_DHSWL_signal, 'hex' );
		$Provetime_Obt_6_8 =~ s/0x//;
		push( @Provetime_Obt_6_8_arr, hex($Provetime_Obt_6_8) );
		S_wait_ms(500);
	}

	S_teststep( "Check '$tcpar_DHSWL_signal' after 8s from IGN ON with updated expected value.", 'AUTO_NBR', 'waits_05s_and' );           #measurement 4

	S_wait_ms(650);
	foreach ( 1 .. 8 ) {
		S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n", 'blue' );
		($Provetime_Obt_8) = CA_read_can_signal( $tcpar_DHSWL_signal, 'hex' );
		$Provetime_Obt_8 =~ s/0x//;
		push( @Provetime_Obt_8_arr, hex($Provetime_Obt_8) );
		S_wait_ms(500);
	}

	#Store CAN Trace
	GEN_printLink( CA_trace_store( GEN_generateUniqueTraceName() ) );
	return 1;
}

sub TC_evaluation {

	S_teststep_expected( "'$tcpar_Fault' is in state '$tcpar_Fault_state'.", 'check_fault_recorder' );    #evaluation 1
	if ( $tcpar_TypeCheck eq 'FaultNotQualified' ) {
		PD_check_fault_status( $fault_struct, $tcpar_Fault, '0' );
	}
	else {
		PD_check_fault_status( $fault_struct, $tcpar_Fault, '0bxxxx1x10' );
	}

	push( my @state, @{ $fault_struct->{'state'} } );
	push( my @flt,   @{ $fault_struct->{'fault_text'} } );
	my $len = scalar(@flt);
	if ( $len == 0 ) {
		S_teststep_detected( "No Fault is Qualified ", 'check_fault_recorder' );
	}
	else {
		S_teststep_detected( "Fault '@flt' is in state '@state' ", 'check_fault_recorder' );
	}

	S_teststep_expected( "'$tcpar_DHSWL_signal' shall be in '$tcpar_ON_State' for '$tcpar_ON_time_ms' ms from IGN ON.", 'wait_6s_since' );    #evaluation 2
	foreach (@Provetime_Obt_0_6_arr) {
		EVAL_evaluate_value( "Observed value in '$tcpar_ON_time_ms' from IGN ON :", $_, "==", $tcpar_ON_State );
		S_teststep_detected( "Observed value after each 600ms: '$_' ", 'wait_6s_since' );
	}

	S_teststep_expected( "'$tcpar_DHSWL_signal' shall be '$tcpar_OFF_State' for '$tcpar_OFF_time_ms' ms.", 'wait_2s_and' );                   #evaluation 3
	foreach (@Provetime_Obt_6_8_arr) {
		EVAL_evaluate_value( "Observed value in '$tcpar_OFF_State' from from 6s -> 8s from IGN ON :", $_, "==", $tcpar_OFF_State );
		S_teststep_detected( "Observed value after each 500ms: '$_' ", 'wait_2s_and' );
	}

	S_teststep_expected( "'$tcpar_DHSWL_signal' is in '$tcpar_Real_State' after '$tcpar_ProveOut_Time' ms from IGN ON.", 'waits_05s_and' );    #evaluation 4
	foreach (@Provetime_Obt_8_arr) {
		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
		S_teststep_detected( "Observed value after each 500ms: '$_' ", 'waits_05s_and' );
	}

	return 1;
}

sub create_busoffCondtion {

	#using ""power Switch"" on Pritt tool to short CAN bus on TSG4 -> create Bus off
	# PRT_power_connect();
	LC_ShortLines( [ 'CAN1+', 'CAN1-' ] );
	return 1;
}

sub remove_busoffCondtion {

	#using Pritt tool to de-short CAN bus on TSG4 -> -> remove Bus off
	# PRT_power_disconnect();
	LC_UndoShortLines();
	return 1;
}

sub TC_finalization {
	S_wait_ms(2000);
	if ( $tcpar_TypeCheck eq 'FaultNotQualified' ) {
		FM_removeFault($tcpar_Fault);    #used for TSG4
		S_wait_ms(5000);                 # afer qualification time, fault still not qualified
	}
	else { }
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}

1;
