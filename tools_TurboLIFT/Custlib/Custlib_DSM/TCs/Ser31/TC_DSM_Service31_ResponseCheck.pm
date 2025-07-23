#### TEST CASE MODULE
package TC_DSM_Service31_ResponseCheck;

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

our $PURPOSE = "To check Response of $31 service in different Sessions for subroutine $01 and $03";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service31_ResponseCheck

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session> in <Addressing_Mode>

2. Send <Req_StartRoutine>

3. Wait for <WaitTime>

4. Send <Req_RequestResult>


I<B<Evaluation>>

1.<Sess_PR> should be obtained.

2. <Res_StartRoutine> should be obtained.

4. <Res_RequestResult> should be obtained followed by <RoutineStatusRecord>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Sess_PR' => 
	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'WaitTime' => 
	SCALAR 'Req_StartRoutine' => 
	SCALAR 'Req_RequestResult' => 
	SCALAR 'RoutineStatusRecord' => 
	SCALAR 'Res_StartRoutine' => 
	SCALAR 'Res_RequestResult' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check Response of $31 service in different Sessions for subroutine $01 and $03'
	
	# input parameters
	Session = '<Test Heading 1>'
	Addressing_Mode =@('Physical','Functional')
	WaitTime = '1000' #msecs
	Req_StartRoutine = '31 01 AC AC'
	Req_RequestResult = '31 03 AC AC'
	RoutineStatusRecord = '2' #represented in 4ytes of data
	# output parameters
	Res_StartRoutine = '71 01 AC AC'
	Res_RequestResult = '71 03 AC AC 00 02'
	Sess_PR ='50 01'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my @tcpar_Addressing_Mode;
my $tcpar_WaitTime;
my $tcpar_Req_StartRoutine;
my $tcpar_Req_RequestResult;
my $tcpar_RoutineStatusRecord;
my $tcpar_Res_StartRoutine;
my $tcpar_Res_RequestResult;
my $tcpar_Sess_PR;

################ global parameter declaration ###################
#add any global variables here
my %res;
my %res1;
my %res2;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_Req_StartRoutine =  GEN_Read_mandatory_testcase_parameter( 'Req_StartRoutine' );
	$tcpar_Req_RequestResult =  GEN_Read_mandatory_testcase_parameter( 'Req_RequestResult' );
	$tcpar_RoutineStatusRecord =  GEN_Read_mandatory_testcase_parameter( 'RoutineStatusRecord' );
	$tcpar_Res_StartRoutine =  GEN_Read_mandatory_testcase_parameter( 'Res_StartRoutine' );
	$tcpar_Res_RequestResult =  GEN_Read_mandatory_testcase_parameter( 'Res_RequestResult' );
	$tcpar_Sess_PR =  GEN_Read_mandatory_testcase_parameter( 'Sess_PR' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {
	foreach my $add(@tcpar_Addressing_Mode)
	{	
		S_teststep("Enter to '$tcpar_Session' in $add addressing mode", 'AUTO_NBR', "enter_to_session_$add");			#measurement 1
		GDCOM_set_addressing_mode($add);
		$res{$add}=	_ReqSession($tcpar_Session);		
	
		S_teststep("Send '$tcpar_Req_StartRoutine'", 'AUTO_NBR', "send_req_startroutine_$add");			#measurement 2
		$res1{$add} = GDCOM_request($tcpar_Req_StartRoutine,$tcpar_Res_StartRoutine,'strict' );
		
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Req_RequestResult'", 'AUTO_NBR', "send_req_requestresult_$add");			#measurement 3
		$res2{$add} = GDCOM_request($tcpar_Req_RequestResult,$tcpar_Res_RequestResult,'strict' );
	}
	return 1;
}

sub TC_evaluation {
	foreach my $add (@tcpar_Addressing_Mode)
	{
		S_teststep_expected("$add - '$tcpar_Sess_PR' should be obtained.", "enter_to_session_$add");			#evaluation 1
		S_teststep_detected("$add - session response is $res{$add} ","enter_to_session_$add");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_Sess_PR,$res{$add});
		
		S_teststep_expected("$add - '$tcpar_Res_StartRoutine' should be obtained.", "send_req_startroutine_$add");			#evaluation 2
		S_teststep_detected("$add - start routine response should be $res1{$add}", "send_req_startroutine_$add");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_StartRoutine,$res1{$add});
		
		S_teststep_expected("$add -'$tcpar_Res_RequestResult' should be obtained followed by '$tcpar_RoutineStatusRecord'", "send_req_requestresult_$add");			#evaluation 3
		S_teststep_detected("$add - request result routine response should be $res2{$add}", "send_req_requestresult_$add");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_RequestResult,$res2{$add});
	}
	return 1;
}

sub TC_finalization {

	return 1;
}

sub _ReqSession{
	my $sub_req =shift;
	my $sub_res;
	if($sub_req eq 'DefaultSession')
	{
		S_w2rep("Enter default session", 'Purple');
		$sub_res= GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	}				
	elsif($sub_req eq 'ExtendedSession')
	{
		S_w2rep("Enter Extended session", 'Purple');
		$sub_res = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	}
	return 	 $sub_res;
}
1;
