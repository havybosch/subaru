#### TEST CASE MODULE
package TC_DSM_Service31_FilteredFaultState;

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

our $PURPOSE = "Check behavior of service31 when Fault in Filtered state";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service31_FilteredFaultState

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>.

2. Enter to <Session>

3. Create <Fault1>,<Fault2>,<Fault3>

4. Wait for <WaitTime>

5. Send <Req_StartRoutine> 

6. Continously Send <Req_RequestResult>

7. Disqualify all faults and do IGN Reset.

8. Wait for <WaitTime>

9. Send <Req_StartRoutine> 

10. Wait for <WaitTime>

11. Send <Req_RequestResult>


I<B<Evaluation>>

1.

2. 

3. All faults should be in <ActiveState>

4.

5. <PR_StartRoutine> should be obtained and again Fault qualifies.

6.<PR_RequestResult1> should be obtained followed by <RoutineStatusRecord_progress>

7. Fault should be in <InactiveState>

8.

9. <PR_StartRoutine> should be obtained and Faults are erased.

10.

11.<PR_RequestResult2> should be obtained followed by <RoutineStatusRecord_successful>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'Protocol' => 
	SCALAR 'WaitTime' => 
	SCALAR 'ActiveState' => 
	SCALAR 'InactiveState' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Fault3' => 
	SCALAR 'Req_StartRoutine' => 
	SCALAR 'Req_RequestResult' => 
	SCALAR 'RoutineStatusRecord_progress' => 
	SCALAR 'RoutineStatusRecord_successful' => 
	SCALAR 'PR_StartRoutine' => 
	SCALAR 'PR_RequestResult1' => 
	SCALAR 'PR_RequestResult2' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check Response of $31 service when fault is in Filtered State'
	
	# input parameters
	Session = '<Test Heading>'
	Addressing_Mode =@('Physical','Functional')
	Protocol = 'UDS'
	WaitTime = '1000' #ms
	ActiveState = 'FilteredState'
	InactiveState = 'StoredState'
	Fault1 = 'rb_coa_BIURxMsgCounterError_flt'
	Fault2 =  'rb_psem_Short2BatPASFL_flt'
	Fault3 = 'rb_psem_Short2BatPTSL_flt'
	Req_StartRoutine = '31 01 AC AC'
	Req_RequestResult = '31 03 AC AC'
	RoutineStatusRecord_progress = '1' #represented in 4ytes of data
	RoutineStatusRecord_successful = '2'
	PR_StartRoutine = '71 01 AC AC'
	PR_RequestResult1 = '71 03 AC AC 00 01'
	PR_RequestResult2 = '71 03 AC AC 00 02'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my @tcpar_Addressing_Mode;
my $tcpar_Protocol;
my $tcpar_WaitTime;
my $tcpar_ActiveState;
my $tcpar_InactiveState;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Fault3;
my $tcpar_Req_StartRoutine;
my $tcpar_Req_RequestResult;
my $tcpar_RoutineStatusRecord_progress;
my $tcpar_RoutineStatusRecord_successful;
my $tcpar_PR_StartRoutine;
my $tcpar_PR_RequestResult1;
my $tcpar_PR_RequestResult2;

################ global parameter declaration ###################
#add any global variables here
my %res;
my $CAN_Mapping;
my %res1;
my %res2;
my %res3;
my %res4;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_InactiveState =  GEN_Read_mandatory_testcase_parameter( 'InactiveState' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Fault3 =  GEN_Read_mandatory_testcase_parameter( 'Fault3' );
	$tcpar_Req_StartRoutine =  GEN_Read_mandatory_testcase_parameter( 'Req_StartRoutine' );
	$tcpar_Req_RequestResult =  GEN_Read_mandatory_testcase_parameter( 'Req_RequestResult' );
	$tcpar_RoutineStatusRecord_progress =  GEN_Read_mandatory_testcase_parameter( 'RoutineStatusRecord_progress' );
	$tcpar_RoutineStatusRecord_successful =  GEN_Read_mandatory_testcase_parameter( 'RoutineStatusRecord_successful' );
	$tcpar_PR_StartRoutine =  GEN_Read_mandatory_testcase_parameter( 'PR_StartRoutine' );
	$tcpar_PR_RequestResult1 =  GEN_Read_mandatory_testcase_parameter( 'PR_RequestResult1' );
	$tcpar_PR_RequestResult2 =  GEN_Read_mandatory_testcase_parameter( 'PR_RequestResult2' );

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
		S_teststep("Set $add addressing mode for '$tcpar_Protocol'.", 'AUTO_NBR', "enter_to_session_$add");			
		GDCOM_set_addressing_mode($add);
	

		S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');
		$res{$add}=	_ReqSession($tcpar_Session);
		
		S_teststep("Create '$tcpar_Fault1','$tcpar_Fault2','$tcpar_Fault3'", 'AUTO_NBR', "create_fault1fault2fault3_$add");			#measurement 1
		S_w2rep("Create $tcpar_Fault1'", 'Purple');
		$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
		my $cntVarName = $CAN_Mapping->{'CAN_MESSAGES'}{'BIU3AC'}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName ,1);
		
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Req_StartRoutine' ", 'AUTO_NBR', "send_req_startroutine_A_$add");			#measurement 2
		$res1{$add} = GDCOM_request($tcpar_Req_StartRoutine,$tcpar_PR_StartRoutine,'strict' );

		S_teststep("Continously Send '$tcpar_Req_RequestResult'", 'AUTO_NBR', "continously_send_req_$add");			#measurement 3
		$res2{$add} = GDCOM_request($tcpar_Req_RequestResult,$tcpar_PR_RequestResult1,'strict' );
		
		S_teststep("Disqualify all faults and do IGN Reset.", 'AUTO_NBR', "disqualify_all_faults_$add");			#measurement 4
		S_w2rep("Disqualify $tcpar_Fault1'", 'Purple');
		$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
		my $cntVarName1 = $CAN_Mapping->{'CAN_MESSAGES'}{'BIU3AC'}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName1 ,0);
		LC_ECU_Reset();
		
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Req_StartRoutine' ", 'AUTO_NBR', "send_req_startroutine_B_$add");			#measurement 5
		$res3{$add} = GDCOM_request($tcpar_Req_StartRoutine,$tcpar_PR_StartRoutine,'strict' );
		
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Req_RequestResult'", 'AUTO_NBR', "send_req_requestresult_$add");			#measurement 6
		$res4{$add} = GDCOM_request($tcpar_Req_RequestResult,$tcpar_PR_RequestResult2,'strict' );
	}
	return 1;
}

sub TC_evaluation {
	foreach my $add (@tcpar_Addressing_Mode)
	{
	
		S_teststep_expected("$add - All faults should be in '$tcpar_ActiveState'", "create_fault1fault2fault3_$add");			#evaluation 1
		S_teststep_detected("$add - ", "create_fault1fault2fault3_$add");
	
		S_teststep_expected("$add - '$tcpar_PR_StartRoutine' should be obtained and again Fault qualifies.", "send_req_startroutine_A_$add");			#evaluation 2
		S_teststep_detected("$add - start routine response should be $res1{$add}", "send_req_startroutine_A_$add");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_StartRoutine,$res1{$add});
		
		S_teststep_expected("$add - '$tcpar_PR_RequestResult1' should be obtained followed by '$tcpar_RoutineStatusRecord_progress'", "continously_send_req_$add");			#evaluation 3
		S_teststep_detected("$add - result routine response should be $res2{$add}","continously_send_req_$add");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_RequestResult1,$res2{$add});
		
		S_teststep_expected("$add - Fault should be in '$tcpar_InactiveState'","disqualify_all_faults_$add");			#evaluation 4
		S_teststep_detected("$add - ","disqualify_all_faults_$add");
	
		S_teststep_expected("$add - '$tcpar_PR_StartRoutine' should be obtained and Faults are erased.", "send_req_startroutine_B_$add");			#evaluation 5
		S_teststep_detected("$add - start routine response should be $res3{$add}", "send_req_startroutine_B_$add");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_StartRoutine,$res3{$add});
		
		S_teststep_expected("$add - '$tcpar_PR_RequestResult2' should be obtained followed by '$tcpar_RoutineStatusRecord_successful'", "send_req_requestresult_$add");			#evaluation 6
		S_teststep_detected("$add - result routine response should be $res4{$add}","send_req_requestresult_$add");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_RequestResult2,$res4{$add});
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
