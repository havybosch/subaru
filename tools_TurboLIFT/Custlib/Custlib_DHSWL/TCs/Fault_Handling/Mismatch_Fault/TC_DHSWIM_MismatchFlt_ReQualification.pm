#### TEST CASE MODULE
package TC_DHSWIM_MismatchFlt_ReQualification;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.2 $;
our $HEADER = q$Header: TCs/TCs_Project/DHSWL/Fault_Handling/Mismatch_Fault/TC_DHSWIM_MismatchFlt_ReQualification.pm 1.2 2018/08/28 13:11:28ICT UUL1HC develop  $;

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

our $PURPOSE = "Check fault re-qualified";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_MismatchFlt_ReQualification

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Create <PreCondition> to ECU send message <Tx_Msg_name> at CAN ID: <Tx_Msg_ID> with signal <Tx_Sig_name>  is  <Tx_Sig_value > and wait <T_time>.

2.Create Fault <Fault> by Send message <Rx_Msg_name> at CAN ID: <Rx_Msg_ID> with conflict signal <Rx_Sig_name> is  <Rx_Sig_value_1> for <cycles_1> cycles.

3.Check Fault recorder.

4. Send message <Rx_Msg_name> at CAN ID: <Rx_Msg_ID> with valid signal <Rx_Sig_name> is  <Rx_Sig_value_2> for <cycles_2>.

5. Check Fault recorder.

6. Send message <Rx_Msg_name> at CAN ID: <Rx_Msg_ID> with conflict signal <Rx_Sig_name> is  <Rx_Sig_value_3> for <cycles_3>.

7. Check Fault recorder.


I<B<Evaluation>>

1.

2.

3. <Fault> is <Flt_status_1>

4.

5. <Fault> is <Flt_status_2>

6. 

7.<Fault> is <Flt_status_3>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'PreCondition' => 
	SCALAR 'T_time' => 
	SCALAR 'Tx_Sig_value' => 
	SCALAR 'Rx_Sig_value_2' => 
	SCALAR 'purpose' => 
	SCALAR 'Rx_msg_name' => 
	SCALAR 'Rx_msg_ID' => 
	SCALAR 'Rx_Sig_name' => 
	SCALAR 'Rx_Sig_value_1' => 
	SCALAR 'Rx_Sig_value_3' => 
	SCALAR 'Tx_Msg_name' => 
	SCALAR 'Tx_Msg_ID' => 
	SCALAR 'Tx_Sig_name' => 
	SCALAR 'Fault' => 
	SCALAR 'cycles_1' => 
	SCALAR 'cycles_2' => 
	SCALAR 'cycles_3' => 
	SCALAR 'Flt_status_1' => 
	SCALAR 'Flt_status_2' => 
	SCALAR 'Flt_status_3' => 


=head2 PARAMETER EXAMPLES

	purpose = 'check behavior of DHSWL Mismatch fault pending Disqualified when receive faulty signal'
	
	Rx_msg_name = '_HEC_IllumStatus'
	Rx_msg_ID = '0x9F'
	Rx_Sig_name = 'DHS_RIL_STAT'
	Rx_Sig_value_1 = '6'#RxInvalid1
	#Rx_Sig_value_2 = '<Test Heading 1>'
	Rx_Sig_value_3 = '4'#RxUnknown
	
	Tx_Msg_name = '_RCMStatusMessage '
	Tx_Msg_ID = '0x340'
	Tx_Sig_name = 'DHS_RILReq'
	
	
	Fault = 'rb_wifh_DHSWLMismatch_flt'
	cycles_1 = '10'
	cycles_2 = '1'
	cycles_3 = '10'
	
	Flt_status_1 = 'Qualified'#0xxxxx1x11
	Flt_status_2 = 'Disqualified'#0xxxxx1x10
	Flt_status_3 =  'Qualified'#0xxxxx1x11
	PreCondition = 'IGN off/on'
	T_time = '6000'#ms
	Tx_Sig_value = '0'
	Rx_Sig_value_2 = '0'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Rx_Msg_name;
my $tcpar_Rx_Msg_ID;
my $tcpar_Rx_Sig_name;
my $tcpar_Rx_Sig_value_1;
my $tcpar_Rx_Sig_value_3;
my $tcpar_Tx_Msg_name;
my $tcpar_Tx_Msg_ID;
my $tcpar_Tx_Sig_name;
my $tcpar_Fault;
my $tcpar_cycles_1;
my $tcpar_cycles_2;
my $tcpar_cycles_3;
my $tcpar_Flt_status_1;
my $tcpar_Flt_status_2;
my $tcpar_Flt_status_3;
my $tcpar_PreCondition;
my $tcpar_T_time;
my $tcpar_Tx_Sig_value;
my $tcpar_Rx_Sig_value_2;

################ global parameter declaration ###################
#add any global variables here
my $TxRILReqSignal;
my $RxMsgCyclicTime = 200;    #ms
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
	$tcpar_Rx_Sig_value_3 =  GEN_Read_mandatory_testcase_parameter( 'Rx_Sig_value_3' );
	$tcpar_Tx_Msg_name =  GEN_Read_mandatory_testcase_parameter( 'Tx_Msg_name' );
	$tcpar_Tx_Msg_ID =  GEN_Read_mandatory_testcase_parameter( 'Tx_Msg_ID' );
	$tcpar_Tx_Sig_name =  GEN_Read_mandatory_testcase_parameter( 'Tx_Sig_name' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_cycles_1 =  GEN_Read_mandatory_testcase_parameter( 'cycles_1' );
	$tcpar_cycles_2 =  GEN_Read_mandatory_testcase_parameter( 'cycles_2' );
	$tcpar_cycles_3 =  GEN_Read_mandatory_testcase_parameter( 'cycles_3' );
	$tcpar_Flt_status_1 =  GEN_Read_mandatory_testcase_parameter( 'Flt_status_1' );
	$tcpar_Flt_status_2 =  GEN_Read_mandatory_testcase_parameter( 'Flt_status_2' );
	$tcpar_Flt_status_3 =  GEN_Read_mandatory_testcase_parameter( 'Flt_status_3' );
	$tcpar_PreCondition =  GEN_Read_mandatory_testcase_parameter( 'PreCondition' );
	$tcpar_T_time =  GEN_Read_mandatory_testcase_parameter( 'T_time' );
	$tcpar_Tx_Sig_value =  GEN_Read_mandatory_testcase_parameter( 'Tx_Sig_value' );
	$tcpar_Rx_Sig_value_2 =  GEN_Read_mandatory_testcase_parameter( 'Rx_Sig_value_2' );
	
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
	# Fault Free check
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	S_teststep("Make ECU in steady state", 'AUTO_NBR');
	CA_trace_start();
	LC_ECU_On();
	S_wait_ms(10000);
	return 1;
}

sub TC_stimulation_and_measurement {
	#1 Create condition to ECU send signal RILReq
	S_teststep("Create '$tcpar_PreCondition' to ECU send message '$tcpar_Tx_Msg_name' at CAN ID: '$tcpar_Tx_Msg_ID' with signal '$tcpar_Tx_Sig_name'  is  '$tcpar_Tx_Sig_value ' and wait '$tcpar_T_time' ms.", 'AUTO_NBR');
		if ( $tcpar_PreCondition eq 'IGN off/on' ) {
			LC_ECU_Off();
			S_wait_ms('TIMER_ECU_OFF');
			LC_ECU_On();
		}
		elsif ( $tcpar_PreCondition =~/Plantmode/ ) {
			enter_MazdaPlantmode();
			#TBD
		}
		elsif ( $tcpar_PreCondition =~ /rb_psem/ ) {
			FM_createFault($tcpar_PreCondition);
			S_wait_ms(500);#make sure flt is qualified
		}
		if ($tcpar_T_time eq '6000'){S_wait_ms($tcpar_T_time + 150);}
		else{S_wait_ms($tcpar_T_time);}
		
		#Read value of signal RILReq
		($TxRILReqSignal) = CA_read_can_signal( $tcpar_Tx_Msg_name.'::'.$tcpar_Tx_Sig_name, 'hex' );
		$TxRILReqSignal =~ s/0x//;
		
	#2 Send message _HEC with invalid signal RIL_STAT		
	S_teststep("Create Fault '$tcpar_Fault' by Send message '$tcpar_Rx_Msg_name' at CAN ID: '$tcpar_Rx_Msg_ID' with conflict signal '$tcpar_Rx_Sig_name' is  '$tcpar_Rx_Sig_value_1' for '$tcpar_cycles_1' cycles.", 'AUTO_NBR');
		COM_setSignalState($tcpar_Rx_Sig_name, $RxLampState{$tcpar_Rx_Sig_value_1});
		S_wait_ms( $tcpar_cycles_1 * $RxMsgCyclicTime );
		
	#3 check flt		
	S_teststep("Check Fault recorder.", 'AUTO_NBR', 'check_fault_recorder_A');			#measurement 1
		$flt_struct_1 = PD_ReadFaultMemory();
	
	#4 Send message _HEC with valid signal RIL_STAT	
	S_teststep("Send message '$tcpar_Rx_Msg_name' at CAN ID: '$tcpar_Rx_Msg_ID' with valid signal '$tcpar_Rx_Sig_name' is  '$tcpar_Rx_Sig_value_2' for '$tcpar_cycles_2' cycles.", 'AUTO_NBR');
		COM_setSignalState($tcpar_Rx_Sig_name, $RxLampState{$tcpar_Rx_Sig_value_2});
		S_wait_ms( $tcpar_cycles_2 * $RxMsgCyclicTime );
	
	#5 check flt			
	S_teststep("Check Fault recorder.", 'AUTO_NBR', 'check_fault_recorder_B');			#measurement 2
		$flt_struct_2 = PD_ReadFaultMemory();
	
	#6 Send message _HEC with invalid signal RIL_STAT		
	S_teststep("Send message '$tcpar_Rx_Msg_name' at CAN ID: '$tcpar_Rx_Msg_ID' with conflict signal '$tcpar_Rx_Sig_name' is  '$tcpar_Rx_Sig_value_3' for '$tcpar_cycles_3' cycles.", 'AUTO_NBR');
		COM_setSignalState($tcpar_Rx_Sig_name, $RxLampState{$tcpar_Rx_Sig_value_3});
		S_wait_ms( $tcpar_cycles_3 * $RxMsgCyclicTime );
		
	#7 check flt		
	S_teststep("Check Fault recorder.", 'AUTO_NBR', 'check_fault_recorder_C');			#measurement 3
		$flt_struct_3 = PD_ReadFaultMemory();
	#Verify Flt
	S_wait_ms(1000);
	PD_ReadFaultMemory();
	S_wait_ms(500);
	CA_trace_stop();	
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault' is status '$tcpar_Flt_status_1'('$FltStatusMask{$tcpar_Flt_status_1}').", 'check_fault_recorder_A');			#evaluation 1
		$faultStatus_1 = PD_get_fault_status( $flt_struct_1, $tcpar_Fault );
		my $temp1 = sprintf( "0b%08b", hex($faultStatus_1) ); 
	S_teststep_detected("'$tcpar_Fault' status is '$temp1'", 'check_fault_recorder_A');
		PD_check_fault_status( $flt_struct_1, $tcpar_Fault, $FltStatusMask{$tcpar_Flt_status_1} );
		
		
	S_teststep_expected("'$tcpar_Fault' is status '$tcpar_Flt_status_2' ('$FltStatusMask{$tcpar_Flt_status_2}').", 'check_fault_recorder_B');			#evaluation 2
		$faultStatus_2 = PD_get_fault_status( $flt_struct_2, $tcpar_Fault );
		my $temp2 = sprintf( "0b%08b", hex($faultStatus_2) ); 
	S_teststep_detected("'$tcpar_Fault' status is '$temp2'", 'check_fault_recorder_B');
		PD_check_fault_status( $flt_struct_2, $tcpar_Fault, $FltStatusMask{$tcpar_Flt_status_2} );
		
	S_teststep_expected("'$tcpar_Fault' is status '$tcpar_Flt_status_3'('$FltStatusMask{$tcpar_Flt_status_3}').", 'check_fault_recorder_C');			#evaluation 3
		$faultStatus_3 = PD_get_fault_status( $flt_struct_3, $tcpar_Fault );
		my $temp3 = sprintf( "0b%08b", hex($faultStatus_3) ); 
	S_teststep_detected("'$tcpar_Fault' status is '$temp3'", 'check_fault_recorder_C');
		PD_check_fault_status( $flt_struct_3, $tcpar_Fault, $FltStatusMask{$tcpar_Flt_status_3} );
		
	
	return 1;
}

sub TC_finalization {
	if ( $tcpar_PreCondition =~/Plantmode/ ) {	
			exit_MazdaPlantmode();
	}
	elsif ( $tcpar_PreCondition =~ /rb_psem/ ) {
			FM_removeFault($tcpar_PreCondition);
	}
	
	#return DHS_RIL_STAT Signal default value
	COM_setSignalState($tcpar_Rx_Sig_name, '0');
	S_wait_ms(1000);
	PD_ClearFaultMemory();
	S_wait_ms(1000)	;
	PD_ReadFaultMemory();
	S_wait_ms(1000);	
	return 1;
}
sub enter_MazdaPlantmode{
#	 PD_Device_configuration( 'set', ['CustMazdaPlantMode'] );
#	 S_wait_ms(200);
#	 PD_ECUreset('Soft_reset');
	S_user_action("Please, set Mazda Plantmode manually - Reset ECU");
	 return 1;
}

sub exit_MazdaPlantmode{
#	 PD_Device_configuration( 'clear', ['CustMazdaPlantMode'] );
#	 S_wait_ms(200);
#	 PD_ECUreset('Soft_reset');
	S_user_action("Please, remove Mazda Plantmode manually - Reset ECU");
	 return 1;
}

1;
