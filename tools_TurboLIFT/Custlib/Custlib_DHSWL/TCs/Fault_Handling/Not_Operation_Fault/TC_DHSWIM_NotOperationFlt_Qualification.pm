#### TEST CASE MODULE
package TC_DHSWIM_NotOperationFlt_Qualification;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.5 $;
our $HEADER  = q$Header: TCs/TCs_Project/DHSWL/Fault_Handling/Not_Operation_Fault/TC_DHSWIM_NotOperationFlt_Qualification.pm 1.5 2018/09/21 11:08:28ICT UUL1HC develop  $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS name> (e.g. TS_SWM_SwitchMgt)
#TS version in DOORS: <TS version based on which this script is written/updated> (e.g. 3.30)
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project;    #necessary

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

our $PURPOSE = "Check fault qualified ";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_NotOperationFlt_Qualification

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Create <Condition> to ECU send message <Tx_Msg_name> at CAN ID: <Tx_Msg_ID> with signal <Tx_Sig_name>  is  <Tx_Sig_value > and wait <T_time>.

2. Send message <Rx_Msg_name> at <Rx_Msg_ID> with <Rx_Sig_name> is  <Rx_Sig_value>.

3. Check Fault recorder after <Rx_Msg_name> transmitted for <cycles_1> cycles after step 3.

4.Check Fault recorder after <Rx_Msg_name> transmitted for <cycles_2> cycles after step 4.


I<B<Evaluation>>

1.<Tx_msg_name> transmitted at ID <Tx_Msg_ID> with signal <Tx_Sig_value>.

2.

3. <Fault> is in <Flt_status_1>.

4. <Fault> is in <Flt_status_2>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Condition' => 
	SCALAR 'T_time' => 
	SCALAR 'Flt_status_1' => 
	SCALAR 'Flt_status_2' => 
	SCALAR 'purpose' => 
	SCALAR 'Rx_Msg_name' => 
	SCALAR 'Rx_Msg_ID' => 
	SCALAR 'Rx_Sig_name' => 
	SCALAR 'Rx_Sig_value' => 
	SCALAR 'Tx_Msg_name' => 
	SCALAR 'Tx_Msg_ID' => 
	SCALAR 'Tx_Sig_name' => 
	SCALAR 'Tx_Sig_value' => 
	SCALAR 'Fault' => 
	SCALAR 'cycles_1' => 
	SCALAR 'cycles_2' => 


=head2 PARAMETER EXAMPLES

	purpose = 'check behavior of DHSWL not Operation fault qualified'
	
	Rx_Msg_name = '_HEC_IllumStatus'
	Rx_Msg_ID = '0x9F'
	Rx_Sig_name = 'DHS_RIL_STAT'
	Rx_Sig_value = '$3'
	
	Tx_Msg_name = '_RCMStatusMessage '
	Tx_Msg_ID = '0x340'
	Tx_Sig_name = 'DHS_RILReq'
	Tx_Sig_value = '<Text Heading 1>'
	
	Fault = 'rb_wifh_DHSWLNotOperation_flt'
	cycles_1 = '9';
	cycles_2 = '1';
	Condition = 'IGN off/on'
	T_time = '6000'#ms
	Flt_status_1 = 'Not Qualified'
	Flt_status_2 = 'Qualified'#0xxxxx1x11
	#Note: checking with RILReq value = $0 during 6s-8s after IGN on.

=cut

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Rx_Msg_name;
my $tcpar_Rx_Msg_ID;
my $tcpar_Rx_Sig_name;
my $tcpar_Rx_Sig_value;
my $tcpar_Tx_Msg_name;
my $tcpar_Tx_Msg_ID;
my $tcpar_Tx_Sig_name;
my $tcpar_Tx_Sig_value;
my $tcpar_Fault;
my $tcpar_cycles_1;
my $tcpar_cycles_2;
my $tcpar_Condition;
my $tcpar_T_time;
my $tcpar_Flt_status_1;
my $tcpar_Flt_status_2;

################ global parameter declaration ###################
#add any global variables here
my $TxRILReqSignal;
my $RxMsgCyclicTime = 200;    #ms
my $flt_struct_1;
my $faultStatus_1;
my $flt_struct_2;
my $faultStatus_2;
my %RxLampState;
my %FltStatusMask;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose      = GEN_Read_mandatory_testcase_parameter('purpose');
	$tcpar_Rx_Msg_name  = GEN_Read_mandatory_testcase_parameter('Rx_Msg_name');
	$tcpar_Rx_Msg_ID    = GEN_Read_mandatory_testcase_parameter('Rx_Msg_ID');
	$tcpar_Rx_Sig_name  = GEN_Read_mandatory_testcase_parameter('Rx_Sig_name');
	$tcpar_Rx_Sig_value = GEN_Read_mandatory_testcase_parameter('Rx_Sig_value');
	$tcpar_Tx_Msg_name  = GEN_Read_mandatory_testcase_parameter('Tx_Msg_name');
	$tcpar_Tx_Msg_ID    = GEN_Read_mandatory_testcase_parameter('Tx_Msg_ID');
	$tcpar_Tx_Sig_name  = GEN_Read_mandatory_testcase_parameter('Tx_Sig_name');
	$tcpar_Tx_Sig_value = GEN_Read_mandatory_testcase_parameter('Tx_Sig_value');
	$tcpar_Fault        = GEN_Read_mandatory_testcase_parameter('Fault');
	$tcpar_cycles_1     = GEN_Read_mandatory_testcase_parameter('cycles_1');
	$tcpar_cycles_2     = GEN_Read_mandatory_testcase_parameter('cycles_2');
	$tcpar_Condition    = GEN_Read_mandatory_testcase_parameter('Condition');
	$tcpar_T_time       = GEN_Read_mandatory_testcase_parameter('T_time');
	$tcpar_Flt_status_1 = GEN_Read_mandatory_testcase_parameter('Flt_status_1');
	$tcpar_Flt_status_2 = GEN_Read_mandatory_testcase_parameter('Flt_status_2');
			
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
	S_teststep( "StandardPrepNoFault", 'AUTO_NBR' );
	GEN_StandardPrepNoFault();
	CA_trace_start();
	return 1;
}

sub TC_stimulation_and_measurement {
	#1 ECU in staedy state
	S_teststep( "IGN on and wait for ECU in steady state.", 'AUTO_NBR' );
		LC_ECU_On();
		S_wait_ms('TIMER_ECU_READY');
	#2 Create condition to ECU send signal RILReq
	S_teststep( "Create '$tcpar_Condition' to ECU send message '$tcpar_Tx_Msg_name' at CAN ID: '$tcpar_Tx_Msg_ID' with signal '$tcpar_Tx_Sig_name'  is  '$tcpar_Tx_Sig_value ' and wait '$tcpar_T_time' ms.", 'AUTO_NBR', 'create_condition_to' );    #measurement 1
	if ( $tcpar_Condition eq 'IGN off/on' ) {
		LC_ECU_Off();
		S_wait_ms('TIMER_ECU_OFF');
		LC_ECU_On();
	}
	elsif ( $tcpar_Condition =~/Plantmode/ ) {
		#TBD
		enter_MazdaPlantmode();
	}
	elsif ( $tcpar_Condition =~ /rb_psem/) {
		FM_createFault($tcpar_Condition);
		S_wait_ms(500);#make sure flt is qualified
	}
	if ($tcpar_T_time eq '6000'){S_wait_ms($tcpar_T_time + 180);}
	else{S_wait_ms($tcpar_T_time);}

	#Read value of signal RILReq
	#($TxRILReqSignal) = CA_read_can_signal( $tcpar_Tx_Msg_name.'::'.$tcpar_Tx_Sig_name, 'hex' );

	($TxRILReqSignal) = CA_read_can_signal( $tcpar_Tx_Msg_name.'::'.$tcpar_Tx_Sig_name, 'hex' );
	$TxRILReqSignal =~ s/0x//;

	#3 Send message _HEC with signal RIL_STAT faulty value to create OpenFlt
	S_teststep( "Send message '$tcpar_Rx_Msg_name' at '$tcpar_Rx_Msg_ID' with '$tcpar_Rx_Sig_name' is  '$tcpar_Rx_Sig_value'.", 'AUTO_NBR' );
		COM_setSignalState($tcpar_Rx_Sig_name, $RxLampState{$tcpar_Rx_Sig_value});
		#S_user_action("Check CAN signal manually");#for debug
	
	#4 Check Fault status
	S_teststep( "Check Fault recorder after '$tcpar_Rx_Msg_name' transmitted for '$tcpar_cycles_1' cycles after step 3.", 'AUTO_NBR', 'check_fault_recorder_A' );    #measurement 2
		S_wait_ms( $tcpar_cycles_1 * $RxMsgCyclicTime - 180);
		COM_stopMessages($tcpar_Rx_Msg_name);
		$flt_struct_1 = PD_ReadFaultMemory();
	
	#5 Check Fault status
	S_teststep( "Check Fault recorder after '$tcpar_Rx_Msg_name' transmitted for '$tcpar_cycles_2' cycles after step 4.", 'AUTO_NBR', 'check_fault_recorder_B' );    #measurement 3
		COM_startMessages($tcpar_Rx_Msg_name);
		S_wait_ms( $tcpar_cycles_2 * $RxMsgCyclicTime + 50 );
		$flt_struct_2 = PD_ReadFaultMemory();
		
	#Verify Flt
	S_wait_ms(500);
	PD_ReadFaultMemory();
	S_wait_ms(500);
	CA_trace_stop();
	return 1;
}

sub TC_evaluation {

	S_teststep_expected( "'$tcpar_Tx_Msg_name' transmitted with '$tcpar_Tx_Sig_name' is '$tcpar_Tx_Sig_value'.", 'create_condition_to' );                            #evaluation 1
	S_teststep_detected( "'$tcpar_Tx_Sig_name' is '$TxRILReqSignal'", 'create_condition_to' );
		EVAL_evaluate_value( "DHS_RILReq", $TxRILReqSignal, '==', $tcpar_Tx_Sig_value );

	S_teststep_expected( "'$tcpar_Fault' is in status: '$tcpar_Flt_status_1' ('$FltStatusMask{$tcpar_Flt_status_1}').", 'check_fault_recorder_A' );                                                                  #evaluation 2
		$faultStatus_1 = PD_get_fault_status( $flt_struct_1, $tcpar_Fault );
		my $temp1 = sprintf( "0b%08b", hex($faultStatus_1) ); 		
	S_teststep_detected( "'$tcpar_Fault' status is in status: '$temp1'", 'check_fault_recorder_A' );
		PD_check_fault_status( $flt_struct_1, $tcpar_Fault, $FltStatusMask{$tcpar_Flt_status_1} );

	S_teststep_expected( "'$tcpar_Fault' is in status: '$tcpar_Flt_status_2' ('$FltStatusMask{$tcpar_Flt_status_2}').", 'check_fault_recorder_B' );    #evaluation 3
		$faultStatus_2 = PD_get_fault_status( $flt_struct_2, $tcpar_Fault );
		my $temp2 = sprintf( "0b%08b", hex($faultStatus_2) ); 
	S_teststep_detected( "'$tcpar_Fault' status is '$temp2' ", 'check_fault_recorder_B' );
		PD_check_fault_status( $flt_struct_2, $tcpar_Fault, $FltStatusMask{$tcpar_Flt_status_2} );
	
	
	return 1;
}

sub TC_finalization {
	if ( $tcpar_Condition =~/Plantmode/ ) {	
			#TBD
			exit_MazdaPlantmode();
	}
	elsif ( $tcpar_Condition =~ /rb_psem/ ) {
			FM_removeFault($tcpar_Condition);
	}
	#return DHS_RIL_STAT Signal default value
	COM_setSignalState($tcpar_Rx_Sig_name, '5');
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
	S_user_action("Please, set Mazda Plantmode manually - Reset ECU");
	 return 1;
}

1;
