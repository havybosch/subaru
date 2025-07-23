#### TEST CASE MODULE
package TC_DSM_service19_NRC11;

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
use LIFT_evaluation;
use LIFT_PD;
use LIFT_CD;
use LIFT_CD_CAN;
use LIFT_labcar;
use LIFT_CANoe;
use GENERIC_DCOM;
use LIFT_can_access;
use FuncLib_TNT_DEVICE;
use FuncLib_TNT_FM;
use FuncLib_TNT_COM;
use LIFT_DCOM;
##################################

our $PURPOSE = "To check response of $19 service wrong service is provided";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_service19_NRC11

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session> in  <Addressing_Mode>

2. Send <Wrong_Req1>

3. Wait for <WaitTime>

4. Send <Wrong_Req2>


I<B<Evaluation>>

1.

2. <NRC_11_1> should be obtained.

3. 

4. <NRC_11_2> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'Addressing_Mode' => 
	SCALAR 'WaitTime' => 
	SCALAR 'Wrong_Req1' => 
	SCALAR 'Wrong_Req2' => 
	SCALAR 'NRC_11_1' => 
	SCALAR 'NRC_11_2' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $19 service wrong service is provided'
	
	# input parameters
	Session = 'default'
	Addressing_Mode = 'Physical'
	WaitTime = '1000' #ms
	Wrong_Req1 = '20 01 2E'  #length = 03
	Wrong_Req2 = '21 02 FF'  #length = 03
	
	# output parameters
	NRC_11_1 = '7F 20 11'
	NRC_11_2 = '7F 21 11'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Addressing_Mode;
my $tcpar_WaitTime;
my $tcpar_Wrong_Req1;
my $tcpar_Wrong_Req2;
my $tcpar_NRC_11_1;
my $tcpar_NRC_11_2;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_Wrong_Req1 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req1' );
	$tcpar_Wrong_Req2 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req2' );
	$tcpar_NRC_11_1 =  GEN_Read_mandatory_testcase_parameter( 'NRC_11_1' );
	$tcpar_NRC_11_2 =  GEN_Read_mandatory_testcase_parameter( 'NRC_11_2' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session' session in '$tcpar_Addressing_Mode'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_Addressing_Mode);
	GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	
	S_teststep("Send '$tcpar_Wrong_Req1'", 'AUTO_NBR', 'send_wrong_req1');			#measurement 1
	$res1 = GDCOM_request($tcpar_Wrong_Req1,$tcpar_NRC_11_1,'strict');
	
	S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
	S_wait_ms($tcpar_WaitTime);
	
	S_teststep("Send '$tcpar_Wrong_Req2'", 'AUTO_NBR', 'send_wrong_req2');			#measurement 2
	$res2 = GDCOM_request($tcpar_Wrong_Req2,$tcpar_NRC_11_2,'strict');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NRC_11_1' should be obtained.", 'send_wrong_req1');			#evaluation 1
	S_teststep_detected("NRC response should be $res1 ", 'send_wrong_req1');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_11_1,$res1);
	
	S_teststep_expected("'$tcpar_NRC_11_2' should be obtained.", 'send_wrong_req2');			#evaluation 2
	S_teststep_detected("NRC response should be $res2", 'send_wrong_req2');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_11_2,$res2);
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
