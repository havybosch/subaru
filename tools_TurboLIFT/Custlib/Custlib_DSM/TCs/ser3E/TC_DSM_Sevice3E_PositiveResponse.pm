#### TEST CASE MODULE
package TC_DSM_Sevice3E_PositiveResponse;

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

our $PURPOSE = "check positive response of service3E";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Sevice3E_PositiveResponse

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>.

2. Enter into <Session>

3. Send <Req_TesterPresent1>

4. Send <Req_TesterPresent2>


I<B<Evaluation>>

1.

2.

3. <PR_TesterPresent1> should be obtained.

4.<PR_TesterPresent2> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'Req_TesterPresent1' => 
	SCALAR 'Req_TesterPresent2' => 
	SCALAR 'PR_TesterPresent1' => 
	SCALAR 'PR_TesterPresent2' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check Positive Response of $3E service'
	
	# input parameters
	AddressingMode = 'Physical'
	Protocol = 'UDS'
	Session = '<Test Heading>'
	Req_TesterPresent1 = '3E 00'
	Req_TesterPresent2 = '3E 80'
	
	# output parameters
	PR_TesterPresent1='7E 00' 
	PR_TesterPresent2='No Response' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_Req_TesterPresent1;
my $tcpar_Req_TesterPresent2;
my $tcpar_PR_TesterPresent1;
my $tcpar_PR_TesterPresent2;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_TesterPresent1 =  GEN_Read_mandatory_testcase_parameter( 'Req_TesterPresent1' );
	$tcpar_Req_TesterPresent2 =  GEN_Read_mandatory_testcase_parameter( 'Req_TesterPresent2' );
	$tcpar_PR_TesterPresent1 =  GEN_Read_mandatory_testcase_parameter( 'PR_TesterPresent1' );
	$tcpar_PR_TesterPresent2 =  GEN_Read_mandatory_testcase_parameter( 'PR_TesterPresent2' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	CD_init();
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' for '$tcpar_Protocol'.", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Enter into '$tcpar_Session'", 'AUTO_NBR');
	if($tcpar_Session eq 'DefaultSession')
	{
		S_w2rep("Enter default session", 'Purple');
		GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	}				
	elsif($tcpar_Session eq 'ExtendedSession')
	{
		S_w2rep("Enter Extended session", 'Purple');
		 GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	}
	S_teststep("Send '$tcpar_Req_TesterPresent1'", 'AUTO_NBR', 'send_req_testerpresent1');			#measurement 1
	$res1 = GDCOM_request($tcpar_Req_TesterPresent1,$tcpar_PR_TesterPresent1,'strict');
	
	S_teststep("Send '$tcpar_Req_TesterPresent2'", 'AUTO_NBR', 'send_req_testerpresent2');			#measurement 2
	$res1 = GDCOM_request($tcpar_Req_TesterPresent2,$tcpar_PR_TesterPresent2,'quiet');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_TesterPresent1' should be obtained.", 'send_req_testerpresent1');			#evaluation 1
	S_teststep_detected("response should be $res1", 'send_req_testerpresent1');

	S_teststep_expected("'$tcpar_PR_TesterPresent2' should be obtained.", 'send_req_testerpresent2');			#evaluation 2
	S_teststep_detected("response should be $res2", 'send_req_testerpresent2');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
