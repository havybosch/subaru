#### TEST CASE MODULE
package TC_COA_CANSuspendCancellation;

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

##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_CANSuspendCancellation

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard Preparation.


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.Send below mentioned reprogramming sequences,

EGI040_1_7_REPROGRAMING signal with  value <EGIReprogValue> on MSG ID EGI040 cyclically.

TCU048_1_7_REPROGRAMING signal with value <TCUReprogValue>on MSG ID TCU048 cyclically.

'VDC139_1_7_REPROGRAMING signal with <VDCReprogValue> on MSG ID VDC139 cyclically.

3.Wait for <Wait_time>msec.

4.Change the reprogaming bit value of below reprogramming sequences,

EGI040_1_7_REPROGRAMING signal with  value <EGIReprogValue1> on MSG ID EGI040 cyclically.

TCU048_1_7_REPROGRAMING signal with value <TCUReprogValue2>on MSG ID TCU048 cyclically.

'VDC139_1_7_REPROGRAMING signal with <VDCReprogValue3> on MSG ID VDC139 cyclically.

5.Create <Fault> condition on Rx Msg EGI040

6.Send request <Req_readDTC> with <Status_Mask>.

7.Check the <Message>transmission state.

8.Reset the ECU.

9.Send request <Req_readDTC>.

10.Check the <Message>transmission state


I<B<Evaluation>>

1.-

2.-

3.-

4.

5.

6.<PR_ReadDTC_reponse> should be recorded

7.<Message> transmission state is<trans_state>

8.-

9.<PR_ReadDTC_reponse1> should be recorded

10.<Message> transmission state is<trans_state1>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'EGIReprogValue' => 
	SCALAR 'EGIReprogValue1' => 
	SCALAR 'TCUReprogValue' => 
	SCALAR 'TCUReprogValue2' => 
	SCALAR 'VDCReprogValue' => 
	SCALAR 'VDCReprogValue3' => 
	SCALAR 'Wait_time' => 
	SCALAR 'Fault' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'Message' => 
	SCALAR 'PR_ReadDTC_reponse' => 
	SCALAR 'PR_ReadDTC_reponse1' => 
	SCALAR 'trans_state' => 
	SCALAR 'trans_state1' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the cancellation of CAN suspend condition and its impact on fault diagnosis and tranmission of messages' # description of test case
	
	# input parameters
	EGIReprogValue=1
	EGIReprogValue1=0
	TCUReprogValue=1
	TCUReprogValue2=0
	VDCReprogValue=1
	VDCReprogValue3=0
	
	Wait_time=3#sec
	Fault='Checksum'# CAN fault on EGI040
	Req_readDTC ='19 02 FF'
	
	
	
	#output parameters
	Message='ABG33A'
	PR_ReadDTC_reponse = '59 02 0A'
	PR_ReadDTC_reponse1 = '59 02 0A C4 01 00 0A'
	trans_state='Stopped'
	trans_state1='Transmits'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EGIReprogValue;
my $tcpar_EGIReprogValue1;
my $tcpar_TCUReprogValue;
my $tcpar_TCUReprogValue2;
my $tcpar_VDCReprogValue;
my $tcpar_VDCReprogValue3;
my $tcpar_Wait_time;
my $tcpar_Fault;
my $tcpar_Req_readDTC;
my $tcpar_Message;
my $tcpar_PR_ReadDTC_reponse;
my $tcpar_PR_ReadDTC_reponse1;
my $tcpar_trans_state;
my $tcpar_trans_state1;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EGIReprogValue =  GEN_Read_mandatory_testcase_parameter( 'EGIReprogValue' );
	$tcpar_EGIReprogValue1 =  GEN_Read_mandatory_testcase_parameter( 'EGIReprogValue1' );
	$tcpar_TCUReprogValue =  GEN_Read_mandatory_testcase_parameter( 'TCUReprogValue' );
	$tcpar_TCUReprogValue2 =  GEN_Read_mandatory_testcase_parameter( 'TCUReprogValue2' );
	$tcpar_VDCReprogValue =  GEN_Read_mandatory_testcase_parameter( 'VDCReprogValue' );
	$tcpar_VDCReprogValue3 =  GEN_Read_mandatory_testcase_parameter( 'VDCReprogValue3' );
	$tcpar_Wait_time =  GEN_Read_mandatory_testcase_parameter( 'Wait_time' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_PR_ReadDTC_reponse =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC_reponse' );
	$tcpar_PR_ReadDTC_reponse1 =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC_reponse1' );
	$tcpar_trans_state =  GEN_Read_mandatory_testcase_parameter( 'trans_state' );
	$tcpar_trans_state1 =  GEN_Read_mandatory_testcase_parameter( 'trans_state1' );

	return 1;
}

sub TC_initialization {

	S_teststep("1.Standard Preparation.", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN.", 'AUTO_NBR');

	S_teststep("Send below mentioned reprogramming sequences,", 'AUTO_NBR');

	S_teststep("EGI040_1_7_REPROGRAMING signal with  value '$tcpar_EGIReprogValue' on MSG ID EGI040 cyclically.", 'AUTO_NBR');

	S_teststep("TCU048_1_7_REPROGRAMING signal with value '$tcpar_TCUReprogValue'on MSG ID TCU048 cyclically.", 'AUTO_NBR');

	S_teststep("'VDC139_1_7_REPROGRAMING signal with '$tcpar_VDCReprogValue' on MSG ID VDC139 cyclically.", 'AUTO_NBR');

	S_teststep("Wait for '$tcpar_Wait_time'msec.", 'AUTO_NBR');

	S_teststep("Change the reprogaming bit value of below reprogramming sequences,", 'AUTO_NBR');

	S_teststep("EGI040_1_7_REPROGRAMING signal with  value '$tcpar_EGIReprogValue1' on MSG ID EGI040 cyclically.", 'AUTO_NBR');

	S_teststep("TCU048_1_7_REPROGRAMING signal with value '$tcpar_TCUReprogValue2'on MSG ID TCU048 cyclically.", 'AUTO_NBR');

	S_teststep("'VDC139_1_7_REPROGRAMING signal with '$tcpar_VDCReprogValue3' on MSG ID VDC139 cyclically.", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Fault' condition on Rx Msg EGI040", 'AUTO_NBR');

	S_teststep("Send request '$tcpar_Req_readDTC' with '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_request_req_A');			#measurement 1

	S_teststep("Check the '$tcpar_Message'transmission state.", 'AUTO_NBR', 'check_the_messagetransmission_A');			#measurement 2

	S_teststep("Reset the ECU.", 'AUTO_NBR');

	S_teststep("Send request '$tcpar_Req_readDTC'.", 'AUTO_NBR', 'send_request_req_B');			#measurement 3

	S_teststep("Check the '$tcpar_Message'transmission state", 'AUTO_NBR', 'check_the_messagetransmission_B');			#measurement 4

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReadDTC_reponse' should be recorded", 'send_request_req_A');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send_request_req_A');

	S_teststep_expected("'$tcpar_Message' transmission state is'$tcpar_trans_state'", 'check_the_messagetransmission_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'check_the_messagetransmission_A');

	S_teststep_expected("'$tcpar_PR_ReadDTC_reponse1' should be recorded", 'send_request_req_B');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_request_req_B');

	S_teststep_expected("'$tcpar_Message' transmission state is'$tcpar_trans_state1'", 'check_the_messagetransmission_B');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'check_the_messagetransmission_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
