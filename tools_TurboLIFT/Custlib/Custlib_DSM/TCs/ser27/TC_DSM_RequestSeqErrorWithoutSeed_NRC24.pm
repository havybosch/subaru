#### TEST CASE MODULE
package TC_DSM_RequestSeqErrorWithoutSeed_NRC24;

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

our $PURPOSE = "To check NRC24 for service27 when security access without seed";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_RequestSeqErrorWithoutSeed_NRC24

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> and <Protocol>

2. Enter <Session>

3. Send <Request_SendKey> as without sending Seed Request in <level> security access.


I<B<Evaluation>>

1.  

2. 

3. <NRC> shall be obtained


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Request_SendKey' => 
	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'level' => 
	SCALAR 'NRC' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To verify that NRC24 shall be sent if the SendKey sub-function is received without first receiving a RequestSeed request message'
	# input parameters
	AddressingMode = 'Physical'
	Protocol = 'UDS'
	Session = 'Extended'
	level = '<Test Heading 2>'
	# output parameters
	NRC  = '7F 27 24'
	Request_SendKey = '27 02'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_level;
my $tcpar_NRC;
my $tcpar_Request_SendKey;

################ global parameter declaration ###################
#add any global variables here
my $res;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_level =  GEN_Read_mandatory_testcase_parameter( 'level' );
	$tcpar_NRC =  GEN_Read_mandatory_testcase_parameter( 'NRC' );
	$tcpar_Request_SendKey =  GEN_Read_mandatory_testcase_parameter( 'Request_SendKey' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' and '$tcpar_Protocol'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Enter '$tcpar_Session'", 'AUTO_NBR');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	
	S_teststep("Send '$tcpar_Request_SendKey' as without sending Seed Request in '$tcpar_level' security access.", 'AUTO_NBR', 'send_request_sendkey');			#measurement 1
	$res = GDCOM_request($tcpar_Request_SendKey,$tcpar_NRC,'strict');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NRC' shall be obtained", 'send_request_sendkey');			#evaluation 1
	S_teststep_detected("NRC24 should be observed is $res", 'send_request_sendkey');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC,$res);
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
