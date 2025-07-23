#### TEST CASE MODULE
package TC_DSM_Ser10_ActiveSessionCheck;

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

our $PURPOSE = "to check active session at once time";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Ser10_ActiveSessionCheck

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode>

2. Enter to <Session>

3. Send <Req_ReadSession> 


I<B<Evaluation>>

1.

2.

3. <PR_ReadSession> should be obtained within <P2ServerTime>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'PR_ReadSession' => 
	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Session' => 
	SCALAR 'Req_ReadSession' => 
	SCALAR 'P2ServerTime' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check no.of Sessions active at a time'
	
	# input parameters
	AddressingMode = 'Physical'
	Session = '<Test Heading>'
	Req_ReadSession = '22 F1 86'
	
	# output parameters
	P2ServerTime = '50' #ms
	PR_ReadSession = '62 F1 86 01'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Session;
my $tcpar_Req_ReadSession;
my $tcpar_P2ServerTime;
my $tcpar_PR_ReadSession;

################ global parameter declaration ###################
#add any global variables here
my $sess_res;
my $read_session;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ReadSession =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadSession' );
	$tcpar_P2ServerTime =  GEN_Read_mandatory_testcase_parameter( 'P2ServerTime' );
	$tcpar_PR_ReadSession =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadSession' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');
	if ($tcpar_Session eq 'DefaultSession')
	{
		S_w2rep("Enter default session", 'Purple');
		$sess_res = GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	}
	elsif($tcpar_Session eq 'ExtendedSession')
	{
		S_w2rep("Enter Extended session", 'Purple');
		$sess_res = GDCOM_request_general('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	}
	elsif($tcpar_Session eq 'Programming')
	{
		$sess_res = GDCOM_request_general('REQ_DiagnosticSessionControl_ProgrammingSession', 'PR_DiagnosticSessionControl_ProgrammingSession');
	}
	
	S_teststep("Send '$tcpar_Req_ReadSession' ", 'AUTO_NBR', 'send_req_readsession');			#measurement 1
	$read_session= _readsession($tcpar_Req_ReadSession,$tcpar_Session);
	S_wait_ms($tcpar_P2ServerTime);
	
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReadSession' should be obtained within '$tcpar_P2ServerTime'", 'send_req_readsession');			#evaluation 1
	S_teststep_detected("Session activated is $tcpar_PR_ReadSession", 'send_req_readsession');
	_evalSession($tcpar_Session,$read_session);
	return 1;
}

sub TC_finalization {

	return 1;
}

sub _readsession{
	my $sub_req=shift;
	my $sub_session=shift;
	my $sub_res;
	if($sub_session eq 'DefaultSession')
	{
		$sub_res= GDCOM_request($sub_req,'62 F1 86 01','strict');
	}
	elsif($sub_session eq 'ExtendedSession')
	{
		$sub_res= GDCOM_request($sub_req,'62 F1 86 03','strict');
	}
	elsif($tcpar_Session eq 'Programming')
	{
		$sub_res= GDCOM_request($sub_req,'62 F1 86 02','strict');
	}
   return $sub_res;
}
sub _evalSession{
	my $sub_session=shift;
	my $sub_sessionRead =shift;
	if($sub_session eq 'DefaultSession')
	{
		EVAL_evaluate_string("Evaluating Session active response",$sub_sessionRead,'62 F1 86 01');
	}
	elsif($sub_session eq 'ExtendedSession')
	{
		EVAL_evaluate_string("Evaluating Session active response",$sub_sessionRead,'62 F1 86 03');
	}
return 1;
}
1;
