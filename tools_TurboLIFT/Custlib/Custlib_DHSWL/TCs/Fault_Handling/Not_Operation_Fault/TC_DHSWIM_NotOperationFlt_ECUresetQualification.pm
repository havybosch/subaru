#### TEST CASE MODULE
package TC_DHSWIM_NotOperationFlt_ECUresetQualification;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.2 $;
our $HEADER = q$Header: TCs/TCs_Project/DHSWL/Fault_Handling/Not_Operation_Fault/TC_DHSWIM_NotOperationFlt_ECUresetQualification.pm 1.2 2018/08/28 13:11:28ICT UUL1HC develop  $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS name> (e.g. TS_SWM_SwitchMgt)
#TS version in DOORS: <TS version based on which this script is written/updated> (e.g. 3.30)
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here
use FuncLib_TNT_COM;
use LIFT_can_access;
use LIFT_labcar;
use GENERIC_DCOM;
use LIFT_CD;
use LIFT_PD;
use LIFT_evaluation;
use LIFT_DCOM;

##################################

our $PURPOSE = "Check fault qulified after ECU reset";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_NotOperationFlt_ECUresetQualification

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. IGN on and wait for <Proveout_time> completed.

2.Create Fault <Fault> condition by Send message <Rx_Msg_name> at CAN ID: <Rx_Msg_ID> with <Rx_Sig_name> is  <Rx_Sig_value_1> for <cycles_1> cycles .

3.Check <Fault> recorder.

4. Reset ECU with <Reset_type>.

5. Check <Fault> recorder after reset ECU.


I<B<Evaluation>>

1.

2.

3. <Fault> is <Flt_status_1>.

4.

5. <Fault> is <Flt_status_2>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'cycles_1' => 
	SCALAR 'Flt_status_1' => 
	SCALAR 'Flt_status_2' => 
	SCALAR 'purpose' => 
	SCALAR 'Rx_Msg_name' => 
	SCALAR 'Rx_Msg_ID' => 
	SCALAR 'Rx_Sig_name' => 
	SCALAR 'Rx_Sig_value_1' => 
	SCALAR 'Reset_type' => 
	SCALAR 'Proveout_time' => 
	SCALAR 'T_time' => 
	SCALAR 'Fault' => 
	SCALAR 'Flt_status_3' => 


=head2 PARAMETER EXAMPLES

	purpose = 'check behavior of DHSWL not Operation fault qualification with ECU reset condition'
	
	Rx_Msg_name = '_HEC_IllumStatus'
	Rx_Msg_ID = '0x9F'
	Rx_Sig_name = 'DHS_RIL_STAT'
	Rx_Sig_value_1 = '$3'
	
	Reset_type = '<Text Heading 1>'
	
	Proveout_time = '8000'#ms
	T_time = '2000';
	
	Fault = 'rb_wifh_DHSWLNotOperation_flt'
	
	Flt_status_3 = 'Disqualified'#0xxxxx1x10
	cycles_1 = '10'
	Flt_status_1 = 'Qualified'#0xxxxx1x11
	Flt_status_2 = 'Qualified'#0xxxxx1x11

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Rx_Msg_name;
my $tcpar_Rx_Msg_ID;
my $tcpar_Rx_Sig_name;
my $tcpar_Rx_Sig_value_1;
my $tcpar_Reset_type;
my $tcpar_Proveout_time;
my $tcpar_T_time;
my $tcpar_Fault;
my $tcpar_Flt_status_3;
my $tcpar_cycles_1;
my $tcpar_Flt_status_1;
my $tcpar_Flt_status_2;

################ global parameter declaration ###################
#add any global variables here
my $TxRILReqSignal;
my $RxMsgCyclicTime = 200;#ms
my $flt_struct_1;
my $faultStatus_1;
my $flt_struct_2;
my $faultStatus_2;
my $flt_struct_3;
my $faultStatus_3;
my %RxLampState;
my %FltStatusMask;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Rx_Msg_name =  GEN_Read_mandatory_testcase_parameter( 'Rx_Msg_name' );
	$tcpar_Rx_Msg_ID =  GEN_Read_mandatory_testcase_parameter( 'Rx_Msg_ID' );
	$tcpar_Rx_Sig_name =  GEN_Read_mandatory_testcase_parameter( 'Rx_Sig_name' );
	$tcpar_Rx_Sig_value_1 =  GEN_Read_mandatory_testcase_parameter( 'Rx_Sig_value_1' );
	$tcpar_Reset_type =  GEN_Read_mandatory_testcase_parameter( 'Reset_type' );
	$tcpar_Proveout_time =  GEN_Read_mandatory_testcase_parameter( 'Proveout_time' );
	$tcpar_T_time =  GEN_Read_mandatory_testcase_parameter( 'T_time' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Flt_status_3 =  GEN_Read_mandatory_testcase_parameter( 'Flt_status_3' );
	$tcpar_cycles_1 =  GEN_Read_mandatory_testcase_parameter( 'cycles_1' );
	$tcpar_Flt_status_1 =  GEN_Read_mandatory_testcase_parameter( 'Flt_status_1' );
	$tcpar_Flt_status_2 =  GEN_Read_mandatory_testcase_parameter( 'Flt_status_2' );
	
	%RxLampState =(
			'0' => '0',
			'1' => '1',
			'2' => '2',
			'3' => '3',
			'4' => '4',
			'5' => '5',
			'6' => '6',
			'7' => '7',
	);
	%FltStatusMask =(
			'Not Qualified'   => '0bxxxxx000',
			'Qualified'		  => '0bxxxx1x11',
			'Disqualified'    => '0bxxxx1x10',
	);
	
	return 1;
}

sub TC_initialization {
	#set init value of DHS_Ril_stat for Fault free
	COM_setSignalState($tcpar_Rx_Sig_name, '5');
	S_wait_ms(500);
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	CA_trace_start();
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("IGN on and wait for '$tcpar_Proveout_time' ms completed.", 'AUTO_NBR');
		LC_ECU_On();
		S_wait_ms('TIMER_ECU_READY');
		
	S_teststep("Create Fault '$tcpar_Fault' condition by Send message '$tcpar_Rx_Msg_name' at CAN ID: '$tcpar_Rx_Msg_ID' with '$tcpar_Rx_Sig_name' is  '$tcpar_Rx_Sig_value_1' for '$tcpar_cycles_1' cycles .", 'AUTO_NBR');
		COM_setSignalState($tcpar_Rx_Sig_name, $RxLampState{$tcpar_Rx_Sig_value_1});
		S_wait_ms($tcpar_cycles_1*$RxMsgCyclicTime);
		
	S_teststep("Check '$tcpar_Fault' recorder.", 'AUTO_NBR', 'check_fault_recorder_A');			#measurement 1
		$flt_struct_1 = PD_ReadFaultMemory();
		
	S_teststep("Reset ECU with '$tcpar_Reset_type'.", 'AUTO_NBR');
		if ($tcpar_Reset_type =~ /Hard/){
			PD_ECUreset( 'Hard_reset');
		}
		elsif ($tcpar_Reset_type =~ /Soft/){
			PD_ECUreset( 'Soft_reset');
		}
		elsif($tcpar_Reset_type =~ /Customer/){
			GDCOM_request ('11 01', '51 01', 'relax', 'Send request to CD reset ECU');
		}
		
	S_teststep("Check '$tcpar_Fault' recorder after reset ECU.", 'AUTO_NBR', 'check_fault_recorder_B');			#measurement 2
		S_wait_ms(6000);
		$flt_struct_2 = PD_ReadFaultMemory();
	#Verify Flt
	S_wait_ms(1000);
	PD_ReadFaultMemory();
	S_wait_ms(500);
	CA_trace_stop();	
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault' is in status: '$tcpar_Flt_status_1' ('$FltStatusMask{$tcpar_Flt_status_1}').", 'check_fault_recorder_A');			#evaluation 1
		$faultStatus_1 = PD_get_fault_status( $flt_struct_1, $tcpar_Fault);
		my $temp1 = sprintf( "0b%08b", hex($faultStatus_1) ); 
	S_teststep_detected("'$tcpar_Fault' status is '$temp1'", 'check_fault_recorder_A');
		PD_check_fault_status( $flt_struct_1, $tcpar_Fault, $FltStatusMask{$tcpar_Flt_status_1} );
		
	S_teststep_expected("'$tcpar_Fault' is in status: '$tcpar_Flt_status_2' ('$FltStatusMask{$tcpar_Flt_status_2}').", 'check_fault_recorder_B');			#evaluation 2
		$faultStatus_2 = PD_get_fault_status( $flt_struct_2, $tcpar_Fault);
		my $temp2 = sprintf( "0b%08b", hex($faultStatus_2) ); 
	S_teststep_detected("'$tcpar_Fault' status is '$temp2'", 'check_fault_recorder_B');
		PD_check_fault_status( $flt_struct_2, $tcpar_Fault, $FltStatusMask{$tcpar_Flt_status_2} );
	
	
	return 1;
}

sub TC_finalization {
	#return DHS_RIL_STAT Signal default value
	COM_setSignalState($tcpar_Rx_Sig_name, '0');
	S_wait_ms(1000);
	PD_ClearFaultMemory();
	S_wait_ms(1000)	;
	PD_ReadFaultMemory();
	S_wait_ms(1000);
	return 1;
}


1;
