#### TEST CASE MODULE
package TC_COA_faultdiagnosisdisable_BusOfffault;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: Include/TCpmGenerator/Create_TCpm.pl 1.1 2015/01/21 16:00:45MEZ Geisler Martin (CC-PS/EPS2) (gem1si) develop  $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS name> (e.g. TS_SWM_SwitchMgt)
#TS version in DOORS: <TS version based on which this script is written/updated> (e.g. 3.30)
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here
use LIFT_equipment;
use LIFT_can_access;
use LIFT_flexray_access;
use FuncLib_SYC_INTERFACE;
use LIFT_QuaTe;
use LIFT_numerics;
use LIFT_CANoe;
use LIFT_CD_CAN;
use LIFT_POWER;
use LIFT_PD;
use LIFT_CD;
use LIFT_evaluation;
use FuncLib_TNT_COM;
use LIFT_DCOM;    #necessary
use FuncLib_Project_FM;
use GENERIC_DCOM;
use LIFT_ProdDiag;
require LIFT_PD2ProdDiag; 
import LIFT_PD2ProdDiag; 
use LIFT_PRITT;
use LIFT_labcar;    #necessary
##################################

our $PURPOSE = "To check the CAN suspend condition impact on BusOFF fault diagnosis";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_faultdiagnosisdisable_BusOfffault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard Preparation.

2.Start transmitting following Message ID's

EGI40

TCU048

VDC139


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.Send below mentioned reprogramming sequences,

 EGI040_1_7_REPROGRAMING signal with  value <EGIReprogValue> on MSG ID EGI040 cyclically.

TCU048_1_7_REPROGRAMING signal with value <TCUReprogValue> on MSG ID TCU048 cyclically.

VDC139_1_7_REPROGRAMING signal with <VDCReprogValue> on MSG ID VDC139 cyclically.

3.Wait for <Wait_time> sec.

4.Create <Fault> condition.

5.Wait for <t_wait> sec.

6.Remove <Fault> condition

7.Send request <Req_readDTC> with Status Mask is FF.

8.Check the <Message> transmission state.


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.-

6-

7.<PR_ReadDTC_reponse> should be recorded

8.<Message> transmission state is <trans_state>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'EGIReprogValue' => 
	SCALAR 'TCUReprogValue' => 
	SCALAR 'VDCReprogValue' => 
	SCALAR 'Wait_time' => 
	SCALAR 'Fault' => 
	SCALAR 't_wait' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'Message' => 
	SCALAR 'trans_state' => 
	SCALAR 'PR_ReadDTC_reponse' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the CAN suspend condition impact on BusOFF fault diagnosis' # description of test case
	
	# input parameters
	EGIReprogValue='1'
	TCUReprogValue='1'
	VDCReprogValue='1'
	Wait_time='3'#sec
	Fault= '<Test Heading>'# CAN faults
	t_wait='5'#sec 
	Req_readDTC ='19 02 FF'
	
	
	
	#output parameters
	Message='ABG33A'
	trans_state= 'Stopped' #No transmission happens
	PR_ReadDTC_reponse= '59 02 0A'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EGIReprogValue;
my $tcpar_TCUReprogValue;
my $tcpar_VDCReprogValue;
my $tcpar_Wait_time;
my $tcpar_Fault;
my $tcpar_t_wait;
my $tcpar_Req_readDTC;
my $tcpar_Message;
my $tcpar_trans_state;
my $tcpar_PR_ReadDTC_reponse;

################ global parameter declaration ###################
#add any global variables here
my $res;
my $Transmission_State_Observed;
my ($chkSum_value,$unit);
my ($msgCount_value,$unit);
my ($chkSum_value1,$unit);
my ($msgCount_value1,$unit);
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EGIReprogValue =  GEN_Read_mandatory_testcase_parameter( 'EGIReprogValue' );
	$tcpar_TCUReprogValue =  GEN_Read_mandatory_testcase_parameter( 'TCUReprogValue' );
	$tcpar_VDCReprogValue =  GEN_Read_mandatory_testcase_parameter( 'VDCReprogValue' );
	$tcpar_Wait_time =  GEN_Read_mandatory_testcase_parameter( 'Wait_time' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_t_wait =  GEN_Read_mandatory_testcase_parameter( 't_wait' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_trans_state =  GEN_Read_mandatory_testcase_parameter( 'trans_state' );
	$tcpar_PR_ReadDTC_reponse =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC_reponse' );

	return 1;
}

sub TC_initialization {
	LC_ECU_Reset();
	S_wait_ms(500);
	S_w2rep("Start the CANOe Measurement and CAN trace\n",'Purple');
	CA_trace_start();
	
	S_w2rep("Fetch the DIAG Mapping and CAN Mapping Info\n",'Purple');
	GDCOM_init(); 
	
	S_teststep("1.Standard Preparation.", 'AUTO_NBR');
	#GEN_StandardPrepNoFault();
	PD_ClearFaultMemory();	
	PD_ReadFaultMemory();
	
	S_teststep("2.Start transmitting following Message ID's", 'AUTO_NBR');
	#comment
	S_teststep("EGI40", 'AUTO_NBR');
	COM_setSignalState( 'EGI040_1_7_REPROGRAMING', 0,'CAN' );
		
	S_teststep("TCU048", 'AUTO_NBR');
	COM_setSignalState( 'TCU048_1_7_REPROGRAMING', 0,'CAN' );
	
	S_teststep("VDC139", 'AUTO_NBR');
	COM_setSignalState( 'VDC139_1_7_REPROGRAMING', 0,'CAN' );
	S_wait_ms(500);
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN.", 'AUTO_NBR');
	#TC_initialization [LC_ECU_Reset()]
	S_teststep("Send below mentioned reprogramming sequences,", 'AUTO_NBR');
	#comment
	S_teststep("EGI040_1_7_REPROGRAMING signal with  value '$tcpar_EGIReprogValue' on MSG ID EGI040 cyclically.", 'AUTO_NBR');
	CA_write_can_signal ('EGI040_1_7_REPROGRAMING' , $tcpar_EGIReprogValue, 'phys');
	
	S_teststep("TCU048_1_7_REPROGRAMING signal with value '$tcpar_TCUReprogValue' on MSG ID TCU048 cyclically.", 'AUTO_NBR');
	CA_write_can_signal ('TCU048_1_7_REPROGRAMING' , $tcpar_TCUReprogValue, 'phys');
	
	S_teststep("VDC139_1_7_REPROGRAMING signal with '$tcpar_VDCReprogValue' on MSG ID VDC139 cyclically.", 'AUTO_NBR');
	CA_write_can_signal ('VDC139_1_7_REPROGRAMING' , $tcpar_VDCReprogValue, 'phys');
	
	S_teststep("Wait for '$tcpar_Wait_time' sec.", 'AUTO_NBR');
	S_wait_ms($tcpar_Wait_time);
	
	S_teststep("Create '$tcpar_Fault' condition.", 'AUTO_NBR');
	LC_ShortLines(['CAN1+','CAN1-']);
	
	S_teststep("Wait for '$tcpar_t_wait' sec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_wait);
		
	S_teststep("Remove '$tcpar_Fault' condition", 'AUTO_NBR');
	LC_UndoShortLines( );
	my $flt_mem_struct_pd = PD_ReadFaultMemory();
	PD_check_fault_status($flt_mem_struct_pd,'rb_coa_CANBusOff_flt', 0x2F);
	
	S_teststep("Send request '$tcpar_Req_readDTC' with Status Mask is FF.", 'AUTO_NBR', 'send_request_req');			#measurement 1
	$res = GDCOM_request($tcpar_Req_readDTC, $tcpar_PR_ReadDTC_reponse, 'strict' );
	S_wait_ms(10);
	
	($chkSum_value,$unit)= CA_read_can_signal('ABG33A_0_0_CHECK_SUM','phys');
	S_w2rep( "CheckSum = $chkSum_value", 'AUTO_NBR' );	
	($msgCount_value,$unit)= CA_read_can_signal('ABG33A_1_0_MSG_COUNTER','phys');
	S_w2rep( "MsgCounter = $msgCount_value", 'AUTO_NBR' );

	S_wait_ms(3000);
	
	($chkSum_value1,$unit)= CA_read_can_signal('ABG33A_0_0_CHECK_SUM','phys');
	S_w2rep( "CheckSum = $chkSum_value1", 'AUTO_NBR' );
	($msgCount_value1,$unit)= CA_read_can_signal('ABG33A_1_0_MSG_COUNTER','phys');
	S_w2rep( "MsgCounter = $msgCount_value1", 'AUTO_NBR' );
	
	S_teststep("Check the '$tcpar_Message' transmission state.", 'AUTO_NBR', 'check_the_message');			#measurement 2
	if(( $chkSum_value == $chkSum_value1) and ($msgCount_value == $msgCount_value1 )) {
		$Transmission_State_Observed = 'Stopped';
	}
	else {
		$Transmission_State_Observed = 'Transmit';
	}
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReadDTC_reponse' should be recorded", 'send_request_req');			#evaluation 1
	S_teststep_detected("DTC response is observed as $res", 'send_request_req');
	EVAL_evaluate_string( "Transmissin Status Check", $tcpar_PR_ReadDTC_reponse, $res);
	
	S_teststep_expected("'$tcpar_Message' transmission state is '$tcpar_trans_state'", 'check_the_message');			#evaluation 2
	S_teststep_detected("Transmission state of $tcpar_Message is $Transmission_State_Observed", 'check_the_message');
	EVAL_evaluate_string( "Transmissin Status Check", $tcpar_trans_state, $Transmission_State_Observed);
	return 1;
}

sub TC_finalization {
	COM_setSignalState( 'EGI040_1_7_REPROGRAMING', 0,'CAN' );
	COM_setSignalState( 'TCU048_1_7_REPROGRAMING', 0,'CAN' );
	COM_setSignalState( 'VDC139_1_7_REPROGRAMING', 0,'CAN' );
	LC_ECU_Reset();
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request_general('REQ_ClearDTCInformation_all', 'PR_ClearDTCInformation_all','strict');
	PRD_Clear_Fault_Memory();
    S_wait_ms(3000);
	return 1;
}


1;
