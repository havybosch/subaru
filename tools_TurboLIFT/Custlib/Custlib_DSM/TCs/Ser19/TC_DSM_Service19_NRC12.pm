#### TEST CASE MODULE
package TC_DSM_Service19_NRC12;

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

our $PURPOSE = "To check response of $19 service wrong sub-function is provided";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service19_NRC12

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Send <Wrong_Req>.


I<B<Evaluation>>

1.

2. <NRC_12> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'Wrong_Req' => 
	SCALAR 'NRC_12' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $19 service wrong service is provided'
	
	# input parameters
	Session = '<Test Heading>'
	Wrong_Req = '19 03 FF'  
	# output parameters
	NRC_12 = '7F 19 12'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Wrong_Req;
my $tcpar_NRC_12;

################ global parameter declaration ###################
#add any global variables here
my $res;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Wrong_Req =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req' );
	$tcpar_NRC_12 =  GEN_Read_mandatory_testcase_parameter( 'NRC_12' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');
	GDCOM_set_addressing_mode('Physical');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	
	S_teststep("Send '$tcpar_Wrong_Req'.", 'AUTO_NBR', 'send_wrong_req');			#measurement 1
	$res = GDCOM_request($tcpar_Wrong_Req,$tcpar_NRC_12,'strict');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NRC_12' should be obtained.", 'send_wrong_req');			#evaluation 1
	S_teststep_detected("NRC response should be $res", 'send_wrong_req');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_12,$res);
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
