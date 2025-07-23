#### TEST CASE MODULE
package TC_DSM_Service31_CheckInternalFault;

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

our $PURPOSE = "Check behavior of service31 when internal fault creation";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service31_CheckInternalFault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>.

2. Enter to <Session>

3. Create <InternalFault>

4. Wait for <WaitTime>

5. Send <Req_StartRoutine> 

6. Disqualify the fault .

7. Send <Req_StartRoutine> 


I<B<Evaluation>>

1.

2. 

3. Fault should be in <ActiveState>

4.

5. <PR_StartRoutine> should be obtained and again Fault qualifies.

6. Fault should be in <InactiveState>

7. <PR_StartRoutine> should be obtained but fault is cleared from PS Diag.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'Protocol' => 
	SCALAR 'WaitTime' => 
	SCALAR 'InternalFault' => 
	SCALAR 'Req_StartRoutine' => 
	SCALAR 'ActiveState' => 
	SCALAR 'InactiveState' => 
	SCALAR 'PR_StartRoutine' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check Response of $31 service when Internal Fault is present'
	
	# input parameters
	Session = '<Test Heading>'
	Addressing_Mode =@('Physical','Functional')
	Protocol = 'UDS'
	WaitTime = '1000' #ms
	InternalFault = 'rb_pom_VbatHigh_flt'
	Req_StartRoutine = '31 01 AC AC'
	
	# output parameters
	ActiveState = 'FilteredState'
	InactiveState = 'StoredState'
	PR_StartRoutine = '71 01 AC AC'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my @tcpar_Addressing_Mode;
my $tcpar_Protocol;
my $tcpar_WaitTime;
my $tcpar_InternalFault;
my $tcpar_Req_StartRoutine;
my $tcpar_ActiveState;
my $tcpar_InactiveState;
my $tcpar_PR_StartRoutine;

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
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_InternalFault =  GEN_Read_mandatory_testcase_parameter( 'InternalFault' );
	$tcpar_Req_StartRoutine =  GEN_Read_mandatory_testcase_parameter( 'Req_StartRoutine' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_InactiveState =  GEN_Read_mandatory_testcase_parameter( 'InactiveState' );
	$tcpar_PR_StartRoutine =  GEN_Read_mandatory_testcase_parameter( 'PR_StartRoutine' );

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
		
		S_teststep("Create '$tcpar_InternalFault'", 'AUTO_NBR', "create_internalfault_$add");			#measurement 1
	
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Req_StartRoutine' ", 'AUTO_NBR', "send_req_startroutine_A_$add");			#measurement 2
		$res1{$add} = GDCOM_request($tcpar_Req_StartRoutine,$tcpar_PR_StartRoutine,'strict' );
		
		S_teststep("Disqualify the fault .", 'AUTO_NBR', "disqualify_the_fault_$add");			#measurement 3
	
		S_teststep("Send '$tcpar_Req_StartRoutine' ", 'AUTO_NBR', "send_req_startroutine_B_$add");			#measurement 4
		$res2{$add} = GDCOM_request($tcpar_Req_StartRoutine,$tcpar_PR_StartRoutine,'strict' );
	}
	return 1;
}

sub TC_evaluation {
	foreach my $add (@tcpar_Addressing_Mode)
	{
		S_teststep_expected("$add - Fault should be in '$tcpar_ActiveState'", "create_internalfault_$add");			#evaluation 1
		S_teststep_detected("$add - ","create_internalfault_$add");
	
		S_teststep_expected("$add - '$tcpar_PR_StartRoutine' should be obtained and again Fault qualifies.", "send_req_startroutine_A_$add");			#evaluation 2
		S_teststep_detected("$add - start routine response should be $res1{$add}", "send_req_startroutine_A_$add");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_StartRoutine,$res1{$add});
		
		S_teststep_expected("$add - Fault should be in '$tcpar_InactiveState'","disqualify_the_fault_$add");			#evaluation 3
		S_teststep_detected("$add - ", "disqualify_the_fault_$add");
	
		S_teststep_expected("$add - '$tcpar_PR_StartRoutine' should be obtained but fault is cleared from PS Diag.", "send_req_startroutine_B_$add");			#evaluation 4
		S_teststep_detected("$add - start routine response should be $res2{$add}","send_req_startroutine_B_$add");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_StartRoutine,$res2{$add});
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
