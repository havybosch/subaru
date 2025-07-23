#### TEST CASE MODULE
package TC_DSM_service1902_MultipleFault_SameDTC;

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

our $PURPOSE = "To check response of service 19 02 when multiple fault with same DTC is in Qualified state";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_service1902_MultipleFault_SameDTC

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Create <Fault1>,<Fault2>.

3. Wait for <WaitTime>

4. Send <Req_ReadDTC> followed by <StatusMask>

5. Disqualify all Faults and do IGN reset.

6. Wait for <WaitTime>

7. Send <Req_ReadDTC> followed by <StatusMask>


I<B<Evaluation>>

1.

2. <Fault1> and <Fault2> should be in <ActiveState>

3.

4. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Current>

5. <Fault1> and <Fault2> should be in <InactiveState>

6.

7. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Past>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'WaitTime' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'StatusMask' => 
	SCALAR 'PR_ReadDTC' => 
	SCALAR 'ActiveState' => 
	SCALAR 'InactiveState' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'DTC1_Current' => 
	SCALAR 'DTC1_Past' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of service 19 02 when multiple fault with same DTC is in Qualified state'
	
	# input parameters
	Session = @('default','extended')
	WaitTime = '3000' #ms
	Fault1 = 'rb_coa_BIURxMsgChecksumError_flt'
	Fault2 = 'rb_coa_BIURxMsgCounterError_flt'
	Req_ReadDTC = 'REQ_<Fetch {Service description}>'  
	StatusMask = 'FF'
	
	# output parameters
	PR_ReadDTC = 'PR_ReadDTCInformation_ReportDTCByStatusMask' 
	ActiveState ='FilteredState' 
	InactiveState ='StoredState' 
	AvalibilityMask = '0A'
	DTC1_Current = 'C4 22 00 0A'
	DTC1_Past = 'C4 22 00 08' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Session;
my $tcpar_WaitTime;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Req_ReadDTC;
my $tcpar_StatusMask;
my $tcpar_PR_ReadDTC;
my $tcpar_ActiveState;
my $tcpar_InactiveState;
my $tcpar_AvalibilityMask;
my $tcpar_DTC1_Current;
my $tcpar_DTC1_Past;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my $CAN_Mapping;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_StatusMask =  GEN_Read_mandatory_testcase_parameter( 'StatusMask' );
	$tcpar_PR_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_InactiveState =  GEN_Read_mandatory_testcase_parameter( 'InactiveState' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_DTC1_Current =  GEN_Read_mandatory_testcase_parameter( 'DTC1_Current' );
	$tcpar_DTC1_Past =  GEN_Read_mandatory_testcase_parameter( 'DTC1_Past' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {
	foreach my $ses(@tcpar_Session)
	{			
		my $res;
		S_teststep("Enter to $ses session ", 'AUTO_NBR',"enter_supported_session_$ses");		
		if ($ses =~/default/)
		{
			S_w2rep("Enter default session", 'Purple');
			$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
		}				
		elsif($ses =~ /extended/)
		{
			S_w2rep("Enter Extended session", 'Purple');
			$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
		}	
			
		S_teststep("Create '$tcpar_Fault1','$tcpar_Fault2'.", 'AUTO_NBR', "create_fault1fault2_$ses");			#measurement 1
		$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
		S_w2rep("Create $tcpar_Fault1", 'Purple');
		my $csVarName = $CAN_Mapping->{'CAN_MESSAGES'}{'BIU3AC'}{'CANOE_CS'};
		CA_set_EnvVar_value($csVarName ,1);
		S_w2rep("Create $tcpar_Fault2", 'Purple');
		my $cntVarName = $CAN_Mapping->{'CAN_MESSAGES'}{'BIU3AC'}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName ,1);
		
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask'", 'AUTO_NBR', "send_req_readdtc_A_$ses");			#measurement 2
		$res1{$ses}= GDCOM_request_general( $tcpar_Req_ReadDTC, $tcpar_PR_ReadDTC, { 'StatusMask' => $tcpar_StatusMask } );
		
		S_teststep("Disqualify all Faults and do IGN reset.", 'AUTO_NBR', "disqualify_all_faults_$ses");			#measurement 3
		my $csVarName1 = $CAN_Mapping->{'CAN_MESSAGES'}{'BIU3AC'}{'CANOE_CS'};
		CA_set_EnvVar_value($csVarName1 ,0);
		my $cntVarName1 = $CAN_Mapping->{'CAN_MESSAGES'}{'BIU3AC'}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName1 ,0);
		LC_ECU_Reset();
		
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask'", 'AUTO_NBR', "send_req_readdtc_B_$ses");			#measurement 4
		$res2{$ses}= GDCOM_request_general( $tcpar_Req_ReadDTC, $tcpar_PR_ReadDTC, { 'StatusMask' => $tcpar_StatusMask } );
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - '$tcpar_Fault1' and '$tcpar_Fault2' should be in '$tcpar_ActiveState'", "create_fault1fault2_$ses");			#evaluation 1
		S_teststep_detected("$ses - ", "create_fault1fault2_$ses");
	
		S_teststep_expected("$ses - '$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Current'", "send_req_readdtc_A_$ses");			#evaluation 2
		S_teststep_detected("$ses - response is $res1{$ses}", "send_req_readdtc_A_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 02 0A C4 22 00 0A',$res1{$ses});
		
		S_teststep_expected("$ses - '$tcpar_Fault1' and '$tcpar_Fault2' should be in '$tcpar_InactiveState'", "disqualify_all_faults_$ses");			#evaluation 3
		S_teststep_detected("$ses - ", "disqualify_all_faults_$ses");
	
		S_teststep_expected("$ses - '$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Past'",  "send_req_readdtc_B_$ses");			#evaluation 4
		S_teststep_detected("$ses - response is $res2{$ses} ",  "send_req_readdtc_B_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 02 0A C4 22 00 08',$res2{$ses});
	}
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
