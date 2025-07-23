#### TEST CASE MODULE
package TC_DHSWIM_Disable_Status;

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
use FuncLib_Project_EOL;
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_Disable_Status

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Disable EPP via EOL


I<B<Stimulation and Measurement>>

1. Set The voltage to <Voltage> and set ECU ON.

2. Set ECU to <Mode>, reset ECU and check ECU mode.

3. Check <DHSWL_signal> from IGN ON till steady state.

4. Create <Fault> condition wailt for <t_Qual> then reset ECU.

5. Check <DHSWL_signal> from IGN ON till steady state.

6. Enable EPP via EOL then reset ECU and wait for <Proveout_time>.

7. Check <DHSWL_signal>

8. Disable EPP via EOL then reset ECU.

9. Check <DHSWL_signal> from IGN ON till steady state.


I<B<Evaluation>>

1.

2. ECU is in <Mode>.

3. <DHSWL_signal> shall be 0x00.

4. <Fault> is in <Fault_state_1>

5. <DHSWL_signal> shall be 0x00.

6. <Fault> is in <Fault_state_2>

7. <DHSWL_signal> shall be 0x03.

8. <Fault> is in <Fault_state_3>

9. <DHSWL_signal> shall be 0x00.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'DHSWL_signal' => 
	SCALAR 'Voltage' => 
	SCALAR 'Mode' => 
	SCALAR 'Fault' => 
	SCALAR 't_Qual' => 
	SCALAR 'Fault_state_1' => 
	SCALAR 'Fault_state_2' => 
	SCALAR 'Fault_state_3' => 
	SCALAR 'Proveout_time' => 


=head2 PARAMETER EXAMPLES

	purpose = 'Check behavior of DHSWL when EPP is disabled'
	
	DHSWL_signal = 'RCMStatusMessage_MAC::DHS_RILReq'
	Voltage = '<Test Heading 1>'
	Mode = '<Test Heading 2>'
	Fault = 'rb_psem_Short2GndPCS1D_flt'
	t_Qual = '2700' #ms
	Fault_state_1 = 'Not qualified'
	Fault_state_2 = 'Qualified'
	Fault_state_3 = 'Dequalified'
	Proveout_time = '8000' #ms  (+/-300ms)

=cut

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_DHSWL_signal;
my $tcpar_Voltage;
my $tcpar_Mode;
my $tcpar_Fault;
my $tcpar_t_Qual;
my $tcpar_Fault_state_1;
my $tcpar_Fault_state_2;
my $tcpar_Fault_state_3;
my $tcpar_Proveout_time;

################ global parameter declaration ###################
#add any global variables here
my ( $fault_status, $fault_status_1, $fault_status_2 );
my ( $fault_struct, $fault_struct_1, $fault_struct_2 );
my $Provetime_Obt_0_8;
my @Provetime_Obt_0_8_arr;
my $Provetime_Obt_0_8_resetfault;
my @Provetime_Obt_0_8_resetfault_arr;
my $Provetime_Obt_8;
my @Provetime_Obt_8_arr;
my $Provetime_Obt_0_8_resetfault_disable2;
my @Provetime_Obt_0_8_resetfault_disable2_arr;
my ( $checkECUMode, $CheckValue );
###############################################################

sub TC_set_parameters {

	$tcpar_purpose       = S_read_mandatory_testcase_parameter('purpose');
	$tcpar_DHSWL_signal  = S_read_mandatory_testcase_parameter('DHSWL_signal');
	$tcpar_Voltage       = S_read_mandatory_testcase_parameter('Voltage');
	$tcpar_Mode          = S_read_mandatory_testcase_parameter('Mode');
	$tcpar_Fault         = S_read_mandatory_testcase_parameter('Fault');
	$tcpar_t_Qual        = S_read_mandatory_testcase_parameter('t_Qual');
	$tcpar_Fault_state_1 = S_read_mandatory_testcase_parameter('Fault_state_1');
	$tcpar_Fault_state_2 = S_read_mandatory_testcase_parameter('Fault_state_2');
	$tcpar_Fault_state_3 = S_read_mandatory_testcase_parameter('Fault_state_3');
	$tcpar_Proveout_time = S_read_mandatory_testcase_parameter('Proveout_time');

	return 1;
}

sub TC_initialization {

	S_teststep( "StandardPrepNoFault", 'AUTO_NBR' );
	CA_trace_start();
	GEN_StandardPrepNoFault();

	S_teststep( "Disable EPP via EOL", 'AUTO_NBR' );
	S_w2rep("Disable EPP feature\n ");
	EOL_deconfigure( ['EPP'] );    # Deconfig
	S_wait_ms(2000);
	LC_ECU_Reset();
	PD_get_device_config('CustIsEPPSupported');
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep( "Set The voltage to '$tcpar_Voltage' and set ECU ON.", 'AUTO_NBR' );
	if ( $tcpar_Voltage eq 'HighVoltage' ) {
		LC_SetVoltage('HighVoltage');
	}
	elsif ( $tcpar_Voltage eq 'LowVoltage' ) {
		LC_SetVoltage('LowVoltage');
	}
	else {
		LC_SetVoltage('NormalVoltage');
	}
#	LC_ECU_On(); #ECU ON covered by step above 
	S_wait_ms(500);

	S_teststep( "Set ECU to '$tcpar_Mode', reset ECU and check ECU mode.", 'AUTO_NBR', 'set_ecu_to' );    #measurement 1
	if ( $tcpar_Mode eq 'BoschPlantMode' ) {
		S_w2rep("Set ECU to Bosch Plant Mode");
		PD_ECUlogin();
		PD_WriteMemoryByName( 'rb_sycg_PlantModes_dfst.rb_sycg_ActivePlantModes_au8(0)', [0b00010000] ); # set Bosch Plant Mode 5
		LC_ECU_Reset();
		$checkECUMode = PD_ReadMemoryByName('rb_sycg_PlantModes_dfst.rb_sycg_ActivePlantModes_au8(0)');
		$CheckValue = S_aref2dec( $checkECUMode, 'U8' );
	}
	else {
		S_w2rep("ECU is Normal Mode");
	}

	S_teststep( "Check '$tcpar_DHSWL_signal' from IGN ON till steady state.", 'AUTO_NBR', 'check_dhswl_signal_A' );    #measurement 2
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	if ( $tcpar_Voltage eq 'HighVoltage' ) {
		LC_ECU_On('HighVoltage');
	}
	elsif ( $tcpar_Voltage eq 'LowVoltage' ) {
		LC_ECU_On('LowVoltage');
	}
	else {
		LC_ECU_On();
	}
	foreach ( 1 .. 16 ) {
		S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n", 'blue' );
		($Provetime_Obt_0_8) = CA_read_can_signal( $tcpar_DHSWL_signal, 'hex' );
		$Provetime_Obt_0_8 =~ s/0x//;
		push( @Provetime_Obt_0_8_arr, hex($Provetime_Obt_0_8) );
		S_wait_ms(500);
	}
	S_teststep( "Create '$tcpar_Fault' condition wait for '$tcpar_t_Qual' then reset ECU.", 'AUTO_NBR', 'create_fault_condition' );    #measurement 3
	FM_createFault($tcpar_Fault);
	S_wait_ms($tcpar_t_Qual);
	$fault_struct = PD_ReadFaultMemory();
	S_wait_ms(500);
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	if ( $tcpar_Voltage eq 'HighVoltage' ) {
		LC_ECU_On('HighVoltage');
	}
	elsif ( $tcpar_Voltage eq 'LowVoltage' ) {
		LC_ECU_On('LowVoltage');
	}
	else {
		LC_ECU_On();
	}
	S_teststep( "Check '$tcpar_DHSWL_signal' from IGN ON till steady state.", 'AUTO_NBR', 'check_dhswl_signal_B' );    #measurement 4
	foreach ( 1 .. 16 ) {
		S_w2rep( "Get the '$tcpar_DHSWL_signal' from IGN ON till steady stat in step $_\n", 'blue' );
		($Provetime_Obt_0_8_resetfault) = CA_read_can_signal( $tcpar_DHSWL_signal, 'hex' );
		$Provetime_Obt_0_8_resetfault =~ s/0x//;
		push( @Provetime_Obt_0_8_resetfault_arr, hex($Provetime_Obt_0_8_resetfault) );
		S_wait_ms(500);
	}
	S_teststep( "Enable EPP via EOL then reset ECU and wait for '$tcpar_Proveout_time'.", 'AUTO_NBR', 'enable_epp_via' );    #measurement 5
	if ( $tcpar_Mode eq 'BoschPlantMode' ) { #Exit Bosch plant mode to write EOL
		PD_ECUlogin();
		PD_WriteMemoryByName( 'rb_sycg_PlantModes_dfst.rb_sycg_ActivePlantModes_au8(0)', [0b00000000] );
		LC_ECU_Reset();
		S_wait_ms('TIMER_ECU_READY');
	}
	LC_SetVoltage('NormalVoltage');
	EOL_configure( ['EPP'] );
	S_wait_ms(5000);
	LC_ECU_Reset();
	PD_get_device_config('CustIsEPPSupported');
	S_wait_ms(500);
	$fault_struct_1 = PD_ReadFaultMemory();
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');

	if ( $tcpar_Voltage eq 'HighVoltage' ) {
		LC_ECU_On('HighVoltage');
	}
	elsif ( $tcpar_Voltage eq 'LowVoltage' ) {
		LC_ECU_On('LowVoltage');
	}
	else {
		LC_ECU_On();
	}    # config
	S_wait_ms( $tcpar_Proveout_time + 300 );
	S_teststep( "Check '$tcpar_DHSWL_signal'", 'AUTO_NBR', 'check_dhswl_signal_C' );    #measurement 6
	foreach ( 1 .. 4 ) {
		S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n", 'blue' );
		($Provetime_Obt_8) = CA_read_can_signal( $tcpar_DHSWL_signal, 'hex' );
		$Provetime_Obt_8 =~ s/0x//;
		push( @Provetime_Obt_8_arr, hex($Provetime_Obt_8) );
		S_wait_ms(500);
	}
	S_teststep( "Disable EPP via EOL then reset ECU.", 'AUTO_NBR', 'disable_epp_via' );    #measurement 7
	LC_SetVoltage('NormalVoltage');
	EOL_deconfigure( ['EPP'] );                                                            #deconfig
	S_wait_ms(5000);
	LC_ECU_Reset();
	PD_get_device_config('CustIsEPPSupported');
	S_wait_ms(500);                                                                       # PD_get_device_config('CustIsEPPSupported');
	$fault_struct_2 = PD_ReadFaultMemory();
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');

	if ( $tcpar_Voltage eq 'HighVoltage' ) {
		LC_ECU_On('HighVoltage');
	}
	elsif ( $tcpar_Voltage eq 'LowVoltage' ) {
		LC_ECU_On('LowVoltage');
	}
	else {
		LC_ECU_On();
	}
	S_teststep( "Check '$tcpar_DHSWL_signal' from IGN ON till steady state.", 'AUTO_NBR', 'check_dhswl_signal_D' );    #measurement 8
	foreach ( 1 .. 16 ) {
		S_w2rep( "Get the '$tcpar_DHSWL_signal' from IGN ON till steady state\n", 'blue' );
		($Provetime_Obt_0_8_resetfault_disable2) = CA_read_can_signal( $tcpar_DHSWL_signal, 'hex' );
		$Provetime_Obt_0_8_resetfault_disable2 =~ s/0x//;
		push( @Provetime_Obt_0_8_resetfault_disable2_arr, hex($Provetime_Obt_0_8_resetfault_disable2) );
		S_wait_ms(500);
	}
	return 1;
}

sub TC_evaluation {

	S_teststep_expected( "ECU is in '$tcpar_Mode'.", 'set_ecu_to' );    #evaluation 1

	if ( $tcpar_Mode eq 'BoschPlantMode' ) {                            #Bosch Plant Mode
		S_w2rep("ECU check mode variable value:  '$CheckValue' ");
		if ( $CheckValue == 16 ) {
			S_set_verdict('VERDICT_PASS');
			S_teststep_detected( "ECU is in Bosch Plant mode", 'set_ecu_to' );
		}
		else {
			S_set_verdict('VERDICT_FAIL');
			S_teststep_detected( "ECU is not in Bosch Plant mode", 'set_ecu_to' );
		}
	}
	else {
		S_teststep_detected( "ECU is in Normal Mode", 'set_ecu_to' );
	}
	S_teststep_expected( "'$tcpar_DHSWL_signal' shall be 0x00.", 'check_dhswl_signal_A' );    #evaluation 2

	foreach (@Provetime_Obt_0_8_arr) {
		EVAL_evaluate_value( "Observed '$tcpar_DHSWL_signal' shall be :", $_, "==", '0x00' );
		S_teststep_detected( "Observed '$tcpar_DHSWL_signal' after each 500ms: '$_' ", 'check_dhswl_signal_A' );
	}

	S_teststep_expected( "'$tcpar_Fault' is in '$tcpar_Fault_state_1'", 'create_fault_condition' );    #evaluation 3

	$fault_status = sprintf( "0b%08b", hex( PD_get_fault_status( $fault_struct, $tcpar_Fault ) ) );
	PD_check_fault_status( $fault_struct, $tcpar_Fault, '0bxxxx0x00' );
	S_teststep_detected( "'$tcpar_Fault' fault status byte is '$fault_status'", 'create_fault_condition' );

	S_teststep_expected( "'$tcpar_DHSWL_signal' shall be 0x00.", 'check_dhswl_signal_B' );             #evaluation 4

	foreach (@Provetime_Obt_0_8_resetfault_arr) {
		EVAL_evaluate_value( "Observed '$tcpar_DHSWL_signal' shall be :", $_, "==", '0x00' );
		S_teststep_detected( "Observed '$tcpar_DHSWL_signal' after each 500ms: '$_' ", 'check_dhswl_signal_B' );
	}

	S_teststep_expected( "'$tcpar_Fault' is in '$tcpar_Fault_state_2'", 'enable_epp_via' );            #evaluation 5

	$fault_status_1 = sprintf( "0b%08b", hex( PD_get_fault_status( $fault_struct_1, $tcpar_Fault ) ) );
	PD_check_fault_status( $fault_struct_1, $tcpar_Fault, '0bxxxx1x11' );
	S_teststep_detected( "'$tcpar_Fault' fault status byte is '$fault_status_1'", 'enable_epp_via' );

	S_teststep_expected( "'$tcpar_DHSWL_signal' shall be 0x03.", 'check_dhswl_signal_C' );             #evaluation 6

	foreach (@Provetime_Obt_8_arr) {
		EVAL_evaluate_value( "Observed '$tcpar_DHSWL_signal' shall be :", $_, "==", '0x03' );
		S_teststep_detected( "Observed '$tcpar_DHSWL_signal' after each 500ms: '$_' ", 'check_dhswl_signal_C' );
	}

	S_teststep_expected( "'$tcpar_Fault' is in '$tcpar_Fault_state_3'", 'disable_epp_via' );           #evaluation 7
	$fault_status_2 = sprintf( "0b%08b", hex( PD_get_fault_status( $fault_struct_2, $tcpar_Fault ) ) );
	PD_check_fault_status( $fault_struct_1, $tcpar_Fault, '0bxxxx1x10' );
	S_teststep_detected( "'$tcpar_Fault' fault status byte is '$fault_status_2'", 'disable_epp_via' );

	S_teststep_expected( "'$tcpar_DHSWL_signal' shall be 0x00.", 'check_dhswl_signal_D' );             #evaluation 8

	foreach (@Provetime_Obt_0_8_resetfault_disable2_arr) {
		EVAL_evaluate_value( "Observed '$tcpar_DHSWL_signal' from IGN ON shall be :", $_, "==", '0x00' );
		S_teststep_detected( "Observed '$tcpar_DHSWL_signal' after each 500ms: '$_' ", 'check_dhswl_signal_D' );
	}

	return 1;
}

sub TC_finalization {
	FM_removeFault($tcpar_Fault);
	LC_SetVoltage('NormalVoltage');
	S_wait_ms(5000);
	EOL_configure( ['EPP'] );
	LC_ECU_Reset();
	PD_get_device_config('CustIsEPPSupported');
	S_wait_ms(500);
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	PD_ReadFaultMemory();
	return 1;
}

1;
