#### TEST CASE MODULE
package TC_DSM_Service3E_TimingCheck;

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

our $PURPOSE = "to check the timing  for service3E";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service3E_TimingCheck

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>.

2. Send <Req_TesterPresent> at every <S3server_Time>.

3. Enter into <Session> .

4. Wait for <IdleTime>

5. Send <Req_ReadSession> to read Active Session.

6. Stop sending <Req_TesterPresent>.

7. Wait for <IdleTime>

8. Send <Req_ReadSession> to read Active Session.


I<B<Evaluation>>

1.

2. <PR_TesterPresent> should be obtained.

3. <Session> entry successful.

4. 

5. <ActiveSession> should be obtained.

6.

7.

8. <DefaultSession> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'ActiveSession' => 
	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'Req_TesterPresent' => 
	SCALAR 'S3server_Time' => 
	SCALAR 'IdleTime' => 
	SCALAR 'Req_ReadSession' => 
	SCALAR 'PR_TesterPresent' => 
	SCALAR 'DefaultSession' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check for Active Session when 3E service is stopped'
	
	# input parameters
	AddressingMode = 'Physical'
	Protocol = 'UDS'
	Session = '<Test Heading>'
	Req_TesterPresent = '3E 00'
	S3server_Time = '5000' #mswith tolerance +/- 200ms
	IdleTime = '9000' #ms
	Req_ReadSession  = '22 F1 86'
	
	# output parameters
	PR_TesterPresent = '7E 00'
	DefaultSession = '62 F1 86 01'
	ActiveSession = '62 F1 86 01'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_Req_TesterPresent;
my $tcpar_S3server_Time;
my $tcpar_IdleTime;
my $tcpar_Req_ReadSession;
my $tcpar_PR_TesterPresent;
my $tcpar_DefaultSession;
my $tcpar_ActiveSession;

################ global parameter declaration ###################
#add any global variables here
my $msg_aref = [ 0x02, 0x3E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ];
my $msg_ID_phy;
my $TP_handle;
my $res;
my $res1;
my $res2;
my $res_tester;
my $tester_present;
my @Sub_arrResponse1;
my $sub_response1;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_TesterPresent =  GEN_Read_mandatory_testcase_parameter( 'Req_TesterPresent' );
	$tcpar_S3server_Time =  GEN_Read_mandatory_testcase_parameter( 'S3server_Time' );
	$tcpar_IdleTime =  GEN_Read_mandatory_testcase_parameter( 'IdleTime' );
	$tcpar_Req_ReadSession =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadSession' );
	$tcpar_PR_TesterPresent =  GEN_Read_mandatory_testcase_parameter( 'PR_TesterPresent' );
	$tcpar_DefaultSession =  GEN_Read_mandatory_testcase_parameter( 'DefaultSession' );
	$tcpar_ActiveSession =  GEN_Read_mandatory_testcase_parameter( 'ActiveSession' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	$msg_ID_phy  = $LIFT_PROJECT::Defaults->{"CUSTOMER_DIAGNOSIS"}{'RequestID_physical'};
	
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' for '$tcpar_Protocol'.", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Send '$tcpar_Req_TesterPresent' at every '$tcpar_S3server_Time'.", 'AUTO_NBR', 'send_req_testerpresent');			#measurement 1
	$TP_handle = GDCOM_start_CyclicTesterPresent( $msg_aref, $msg_ID_phy, $tcpar_S3server_Time );
	S_wait_ms(100);
	$res_tester = _reqres();
	
	S_teststep("Enter into '$tcpar_Session' .", 'AUTO_NBR', 'enter_into_session');			#measurement 2
	if($tcpar_Session eq 'DefaultSession')
	{
		S_w2rep("Enter default session", 'Purple');
		$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	}				
	elsif($tcpar_Session eq 'ExtendedSession')
	{
		S_w2rep("Enter Extended session", 'Purple');
		$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	}
	
	S_teststep("Wait for '$tcpar_IdleTime'", 'AUTO_NBR');
	S_wait_ms($tcpar_IdleTime);
	
	S_teststep("Send '$tcpar_Req_ReadSession' to read Active Session.", 'AUTO_NBR', 'send_req_readsession_A');			#measurement 3
	$res1 = GDCOM_request($tcpar_Req_ReadSession,$tcpar_ActiveSession,'strict');
	
	S_teststep("Stop sending '$tcpar_Req_TesterPresent'.", 'AUTO_NBR');
	GDCOM_stop_CyclicTesterPresent($TP_handle);
	
	S_teststep("Wait for '$tcpar_IdleTime'", 'AUTO_NBR');
	S_wait_ms($tcpar_IdleTime);
	
	S_teststep("Send '$tcpar_Req_ReadSession' to read Active Session.", 'AUTO_NBR', 'send_req_readsession_B');			#measurement 4
	$res2 = GDCOM_request($tcpar_Req_ReadSession,$tcpar_DefaultSession,'strict');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_TesterPresent' should be obtained.", 'send_req_testerpresent');			#evaluation 1
	S_teststep_detected("tester response is $res_tester ", 'send_req_testerpresent');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_TesterPresent,$res_tester);
	
	S_teststep_expected("'$tcpar_Session' entry successful.", 'enter_into_session');			#evaluation 2
	S_teststep_detected("positive session response is $res", 'enter_into_session');
	if($tcpar_Session eq 'DefaultSession')
	{
		S_w2rep("Enter default session successful.", 'Purple');
		EVAL_evaluate_string("Evaluating DTC response",'50 01 00 32 01 F4',$res);
	}				
	elsif($tcpar_Session eq 'ExtendedSession')
	{
		S_w2rep("Enter Extended session successful.", 'Purple');
		EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4',$res);
	}
	
	S_teststep_expected("'$tcpar_ActiveSession' should be obtained.", 'send_req_readsession_A');			#evaluation 3
	S_teststep_detected("Active session response is $res1", 'send_req_readsession_A');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_ActiveSession,$res1);

	S_teststep_expected("'$tcpar_DefaultSession' should be obtained.", 'send_req_readsession_B');			#evaluation 4
	S_teststep_detected("Active session response is $res2", 'send_req_readsession_B');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_DefaultSession,$res2);
	return 1;
}

sub TC_finalization {

	return 1;
}

sub _reqres{	
	my $sub_res1;
	my $sub_response1;
	my @Sub_arrResponse1;
	$sub_res1 = CA_get_EnvVar_value('EvRxMesgBox');
	for (my $i = 0; $i< @$sub_res1; $i++){
		@Sub_arrResponse1[$i] = @$sub_res1[$i];
	}
	$sub_response1 = '';
	for(my $i=0;$i<@Sub_arrResponse1;$i++)
	{
		$Sub_arrResponse1[$i] = S_dec2hex($Sub_arrResponse1[$i]);			
		$sub_response1 = $sub_response1 .$Sub_arrResponse1[$i] ;
		if ( $i < ( @Sub_arrResponse1 - 1 ))
		{
			$sub_response1 = $sub_response1 . ' ';
		}
	}
	return $sub_response1;
}

1;
