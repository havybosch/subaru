#### TEST CASE MODULE
package TC_DSM_Service14Check_NRC31;

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

our $PURPOSE = "To check response of Clear DTC when Request is Out of Range";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service14Check_NRC31

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Send <Req1_ClearDTC>

3.  Send <Req2_ClearDTC>

4.  Send <Req3_ClearDTC>


I<B<Evaluation>>

1. 

2. <NRC_31> should be obtained.

3. <NRC_31> should be obtained.

4. <NRC_31> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req1_ClearDTC' => 
	SCALAR 'Req2_ClearDTC' => 
	SCALAR 'Req3_ClearDTC' => 
	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'NRC_31' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of Clear DTC when Request is Out of Range'
	
	# input parameters
	Session = '<Test Heading>'
	
	# output parameters
	NRC_31 = 'NR_requestOutOfRange'
	Req1_ClearDTC = '14 00 FF FF '  
	Req2_ClearDTC = '14 00 55 FF' 
	Req3_ClearDTC = '14 00 11 22' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_NRC_31;
my $tcpar_Req1_ClearDTC;
my $tcpar_Req2_ClearDTC;
my $tcpar_Req3_ClearDTC;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
my $res3;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_NRC_31 =  GEN_Read_mandatory_testcase_parameter( 'NRC_31' );
	$tcpar_Req1_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req1_ClearDTC' );
	$tcpar_Req2_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req2_ClearDTC' );
	$tcpar_Req3_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req3_ClearDTC' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');
	GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	S_teststep("Send '$tcpar_Req1_ClearDTC'", 'AUTO_NBR', 'send_req1_cleardtc');			#measurement 1
	$res1 = GDCOM_request($tcpar_Req1_ClearDTC,'7F 14 31','strict');
	S_teststep("Send '$tcpar_Req2_ClearDTC'", 'AUTO_NBR', 'send_req2_cleardtc');			#measurement 2
	$res2 = GDCOM_request($tcpar_Req2_ClearDTC,'7F 14 31','strict');
	S_teststep("Send '$tcpar_Req3_ClearDTC'", 'AUTO_NBR', 'send_req3_cleardtc');			#measurement 3
	$res3 = GDCOM_request($tcpar_Req3_ClearDTC,'7F 14 31','strict');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NRC_31' should be obtained.", 'send_req1_cleardtc');			#evaluation 1
	S_teststep_detected("NRC31 is observed $res1", 'send_req1_cleardtc');
	EVAL_evaluate_string("Evaluating response",'7F 14 31',$res1);
	
	S_teststep_expected("'$tcpar_NRC_31' should be obtained.", 'send_req2_cleardtc');			#evaluation 2
	S_teststep_detected("NRC31 is observed $res2", 'send_req2_cleardtc');
	EVAL_evaluate_string("Evaluating response",'7F 14 31',$res2);
	
	S_teststep_expected("'$tcpar_NRC_31' should be obtained.", 'send_req3_cleardtc');			#evaluation 3
	S_teststep_detected("NRC31 is observed $res3", 'send_req3_cleardtc');
	EVAL_evaluate_string("Evaluating response",'7F 14 31',$res3);
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
