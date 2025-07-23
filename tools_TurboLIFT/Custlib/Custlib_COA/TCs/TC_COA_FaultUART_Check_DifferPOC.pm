#### TEST CASE MODULE
package TC_COA_FaultUART_Check_DifferPOC;

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
use LIFT_can_access;
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
use LIFT_PRITT;
use LIFT_labcar;    #necessary
##################################

our $PURPOSE = "To check the qualification and dequalification of UART fault in diffrent POC";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_FaultUART_Check_DifferPOC

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard Preparation No Fault

2.Send reprogramming bit as below for Msg id

EGI040,TCU048,VDC139

EGI040_1_7_REPROGRAMING=0

TCU048_1_7_REPROGRAMING=0

VDC139_1_7_REPROGRAMING=0


I<B<Stimulation and Measurement>>

1. IGN on

2. Wait for 7 sec

3. Send <Tr_Signal> to <Value1> 

4. Wait for <t_Qual1 > ms + <tolerance>

5. Change the <Tr_Signal> of <MSG_ID> to <Value2>

6. Wait for <t_Qual2> - <t_Frame>  msec

7. Reset ECU

8. Send the <Tr_Signal> of <MSG_ID> to <Value2>

9. Wait for <t_Frame> msec

10. Send <Req_readDTC> 


I<B<Evaluation>>

1.

2.

3.

4.

5.

6.

7. 

8. 

9.

10. <Resp_readDTC> should be observed


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Resp_readDTC' => 
	SCALAR 'purpose' => 
	SCALAR 'Tr_Signal' => 
	SCALAR 'MSG_ID' => 
	SCALAR 't_Qual1' => 
	SCALAR 't_Qual2' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'Value1' => 
	SCALAR 'Value2' => 
	SCALAR 'Fault' => 
	SCALAR 't_Frame' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the qualification and dequalification of UART fault in diffrent POC'
	# input parameters
	Tr_Signal = 'MET390_6_5_FAIL_UART_WA_BOX'
	MSG_ID = 'MET390'
	t_Qual1 = '300' #ms
	t_Qual2 = '300' #ms
	Req_readDTC ='19 02 FF'
	Value1 = '<Test Heading 1>' #b
	Value2 = '<Test Heading 2>' #b
	Fault = 'rb_coa_METRxMsgFailUARTLine_flt'
	t_Frame = '100' #ms
	tolerance = '100' #ms
	Resp_readDTC = '59 02 0A 96 61 00 08'
	
	#Fault UART is dequalified in Init phase; After 100 ms after Init phase will also dequalified the fault

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Tr_Signal;
my $tcpar_MSG_ID;
my $tcpar_t_Qual1;
my $tcpar_t_Qual2;
my $tcpar_Req_readDTC;
my $tcpar_Value1;
my $tcpar_Value2;
my $tcpar_Fault;
my $tcpar_tolerance;
my $tcpar_t_Frame;
my $tcpar_Resp_readDTC;

################ global parameter declaration ###################
#add any global variables here
my $res;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Tr_Signal =  GEN_Read_mandatory_testcase_parameter( 'Tr_Signal' );
	$tcpar_MSG_ID =  GEN_Read_mandatory_testcase_parameter( 'MSG_ID' );
	$tcpar_t_Qual1 =  GEN_Read_mandatory_testcase_parameter( 't_Qual1' );
	$tcpar_t_Qual2 =  GEN_Read_mandatory_testcase_parameter( 't_Qual2' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_Value1 =  GEN_Read_mandatory_testcase_parameter( 'Value1' );
	$tcpar_Value2 =  GEN_Read_mandatory_testcase_parameter( 'Value2' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_tolerance =  GEN_Read_mandatory_testcase_parameter( 'tolerance' );
	$tcpar_t_Frame =  GEN_Read_mandatory_testcase_parameter( 't_Frame' );
	$tcpar_Resp_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Resp_readDTC' );

	return 1;
}

sub TC_initialization {

	S_teststep("1.Standard Preparation No Fault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("2.Send reprogramming bit as below for Msg id", 'AUTO_NBR');

	S_teststep("EGI040,TCU048,VDC139", 'AUTO_NBR');

	S_teststep("EGI040_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('EGI040_1_7_REPROGRAMING' , '0', 'phys');
	S_teststep("TCU048_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('TCU048_1_7_REPROGRAMING' , '0', 'phys');	
	S_teststep("VDC139_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('VDC139_1_7_REPROGRAMING' , '0', 'phys');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("IGN on", 'AUTO_NBR');
	LC_ECU_On(12);
	S_teststep("Wait for 7 sec", 'AUTO_NBR');
	S_wait_ms(7000);
	S_teststep("Send '$tcpar_Tr_Signal' to '$tcpar_Value1' ", 'AUTO_NBR');
	CA_write_can_signal ($tcpar_Tr_Signal , $tcpar_Value1);
	S_teststep("Wait for '$tcpar_t_Qual1 ' ms + '$tcpar_tolerance'", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual1 + $tcpar_tolerance);
	S_teststep("Change the '$tcpar_Tr_Signal' of '$tcpar_MSG_ID' to '$tcpar_Value2'", 'AUTO_NBR');
	CA_write_can_signal ($tcpar_Tr_Signal , $tcpar_Value2);
	S_teststep("Wait for '$tcpar_t_Qual2' - '$tcpar_t_Frame'  msec", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual2 - $tcpar_t_Frame);
	S_teststep("Reset ECU", 'AUTO_NBR');
	LC_ECU_Reset();
	S_teststep("Send the '$tcpar_Tr_Signal' of '$tcpar_MSG_ID' to '$tcpar_Value2'", 'AUTO_NBR');
	CA_write_can_signal ($tcpar_Tr_Signal , $tcpar_Value2);
	S_teststep("Wait for '$tcpar_t_Frame' msec", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Frame);
	S_teststep("Send '$tcpar_Req_readDTC' ", 'AUTO_NBR', 'send_req_readdtc');			#measurement 1
	$res = GDCOM_request( $tcpar_Req_readDTC, $tcpar_Resp_readDTC, 'strict' );
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Resp_readDTC' should be observed", 'send_req_readdtc');			#evaluation 1
	S_teststep_detected("DTC response Check is $res", 'send_req_readdtc');
	EVAL_evaluate_string( "DTC response Check", $tcpar_Resp_readDTC, $res);
	return 1;
}

sub TC_finalization {
	CA_write_can_signal ('MET390_6_5_FAIL_UART_WA_BOX' , '0', 'phys');
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request_general('REQ_ClearDTCInformation_all', 'PR_ClearDTCInformation_all','strict');
    S_wait_ms(5000);
	return 1;
}


1;
