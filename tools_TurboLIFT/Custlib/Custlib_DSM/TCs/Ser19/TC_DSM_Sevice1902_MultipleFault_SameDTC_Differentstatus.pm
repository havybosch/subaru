#### TEST CASE MODULE
package TC_DSM_Sevice1902_MultipleFault_SameDTC_Differentstatus;

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

TC_DSM_Sevice1902_MultipleFault_SameDTC_Differentstatus

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Create <Fault1>

3. Wait for <WaitTime1>

4. Create <Condition1> for <Fault1> and wait for <WaitTime2>

5. Do ECU reset

6. Create <Fault2>

7. Wait for <WaitTime3>

8. Send <Req_ReadDTC> followed by <StatusMask>

9. Create <Condition2> for <Fault2> and wait for <WaitTime4>

10. Send <Req_ReadDTC> followed by <StatusMask>

11. Do ECU reset

12. Send <Req_ReadDTC> followed by <StatusMask>


I<B<Evaluation>>

1. 

2. 

3. <Fault1> should be in active state

4. <Fault1> should be in active state

5. <Fault1> should be in <State1>

6. 

7. <Fault2> should be in active state and  <Fault1> should be in <State1>

8. Response <Resp_DTC1> should be observed

9. <Fault2> should be in <State3> and  <Fault1> should be in <State1>

10. Response <Resp_DTC2> should be observed

11. <Fault2> should be in <State2> and <Fault1> should be in <State1>

12. Response <Resp_DTC3> should be observed


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'State1' => 
	SCALAR 'State2' => 
	SCALAR 'State3' => 
	SCALAR 'Resp_DTC1' => 
	SCALAR 'Resp_DTC2' => 
	SCALAR 'Resp_DTC3' => 
	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'WaitTime1' => 
	SCALAR 'WaitTime2' => 
	SCALAR 'WaitTime3' => 
	SCALAR 'WaitTime4' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'StatusMask' => 
	SCALAR 'Condition1' => 
	SCALAR 'Condition2' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of service 19 02 when multiple fault with same DTC is in Qualified state'
	# input parameters
	Session =@('default','extended')
	WaitTime1 = '4000' #ms
	WaitTime2 = '8000' #ms
	WaitTime3 = '4000' #ms
	WaitTime4 = '8000' #ms
	Fault1 = 'rb_coa_BIURxMsgChecksumError_flt'
	Fault2 = 'rb_coa_BIURxMsgCounterError_flt'
	Req_ReadDTC = 'REQ_<Fetch {Service description}>'  
	StatusMask = 'FF'
	# output parameters
	Condition1 = '<Test Heading 1>'
	Condition2 = '<Test Heading 2>'
	State1 = 'Stored'
	State2 = 'Stored'
	State3 = 'Latched/Stored'
	
	Resp_DTC1 = '59 02 0A C4 22 00 0A'
	Resp_DTC2 = '59 02 0A C4 22 00 0A'
	Resp_DTC3 = '59 02 0A C4 22 00 08'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Session;
my $tcpar_WaitTime1;
my $tcpar_WaitTime2;
my $tcpar_WaitTime3;
my $tcpar_WaitTime4;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Req_ReadDTC;
my $tcpar_StatusMask;
my $tcpar_Condition1;
my $tcpar_Condition2;
my $tcpar_State1;
my $tcpar_State2;
my $tcpar_State3;
my $tcpar_Resp_DTC1;
my $tcpar_Resp_DTC2;
my $tcpar_Resp_DTC3;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my %res3;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime1 =  GEN_Read_mandatory_testcase_parameter( 'WaitTime1' );
	$tcpar_WaitTime2 =  GEN_Read_mandatory_testcase_parameter( 'WaitTime2' );
	$tcpar_WaitTime3 =  GEN_Read_mandatory_testcase_parameter( 'WaitTime3' );
	$tcpar_WaitTime4 =  GEN_Read_mandatory_testcase_parameter( 'WaitTime4' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_StatusMask =  GEN_Read_mandatory_testcase_parameter( 'StatusMask' );
	$tcpar_Condition1 =  GEN_Read_mandatory_testcase_parameter( 'Condition1' );
	$tcpar_Condition2 =  GEN_Read_mandatory_testcase_parameter( 'Condition2' );
	$tcpar_State1 =  GEN_Read_mandatory_testcase_parameter( 'State1' );
	$tcpar_State2 =  GEN_Read_mandatory_testcase_parameter( 'State2' );
	$tcpar_State3 =  GEN_Read_mandatory_testcase_parameter( 'State3' );
	$tcpar_Resp_DTC1 =  GEN_Read_mandatory_testcase_parameter( 'Resp_DTC1' );
	$tcpar_Resp_DTC2 =  GEN_Read_mandatory_testcase_parameter( 'Resp_DTC2' );
	$tcpar_Resp_DTC3 =  GEN_Read_mandatory_testcase_parameter( 'Resp_DTC3' );

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
	
		S_teststep("Create '$tcpar_Fault1'", 'AUTO_NBR');
		_faultcreation($tcpar_Fault1);
		
		S_teststep("Wait for '$tcpar_WaitTime1'", 'AUTO_NBR', "wait_for_waittime1_$ses");			#measurement 1
		S_wait_ms($tcpar_WaitTime1);
		
		S_teststep("Create '$tcpar_Condition1' for '$tcpar_Fault1' and wait for '$tcpar_WaitTime2'", 'AUTO_NBR', "create_condition1_for_$ses");			#measurement 2
		_condition($tcpar_Condition1,$tcpar_Fault1);
		S_wait_ms($tcpar_WaitTime2);
		
		S_teststep("Do ECU reset", 'AUTO_NBR', "do_ecu_reset_A_$ses");			#measurement 3
		LC_ECU_Reset();
		
		S_teststep("Create '$tcpar_Fault2'", 'AUTO_NBR');
		_faultcreation($tcpar_Fault2);
		
		S_teststep("Wait for '$tcpar_WaitTime3'", 'AUTO_NBR', "wait_for_waittime3_$ses");			#measurement 4
		S_wait_ms($tcpar_WaitTime3);
		
		S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask'", 'AUTO_NBR', "send_req_readdtc_A_$ses");			#measurement 5
		$res1{$ses}= GDCOM_request_general( $tcpar_Req_ReadDTC, 'PR_ReadDTCInformation_ReportDTCByStatusMask', { 'StatusMask' => $tcpar_StatusMask } );
		
		S_teststep("Create '$tcpar_Condition2' for '$tcpar_Fault2' and wait for '$tcpar_WaitTime4'", 'AUTO_NBR', "create_condition2_for_$ses");			#measurement 6
		_condition($tcpar_Condition2,$tcpar_Fault2);
		S_wait_ms($tcpar_WaitTime4);
		
		S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask'", 'AUTO_NBR', "send_req_readdtc_B_$ses");			#measurement 7
		$res2{$ses}= GDCOM_request_general( $tcpar_Req_ReadDTC, 'PR_ReadDTCInformation_ReportDTCByStatusMask', { 'StatusMask' => $tcpar_StatusMask } );
		
		S_teststep("Do ECU reset", 'AUTO_NBR', "do_ecu_reset_B_$ses");			#measurement 8
		LC_ECU_Reset();
		
		S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask'", 'AUTO_NBR', "send_req_readdtc_C_$ses");			#measurement 9
		$res3{$ses}= GDCOM_request_general( $tcpar_Req_ReadDTC, 'PR_ReadDTCInformation_ReportDTCByStatusMask', { 'StatusMask' => $tcpar_StatusMask } );
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - '$tcpar_Fault1' should be in active state", "wait_for_waittime1_$ses");			#evaluation 1
		S_teststep_detected("$ses - ", "wait_for_waittime1_$ses");
	
		S_teststep_expected("$ses - '$tcpar_Fault1' should be in active state", "create_condition1_for_$ses");			#evaluation 2
		S_teststep_detected("$ses - ", "create_condition1_for_$ses");
	
		S_teststep_expected("$ses - '$tcpar_Fault1' should be in '$tcpar_State1'", "do_ecu_reset_A_$ses");			#evaluation 3
		S_teststep_detected("$ses - ", "do_ecu_reset_A_$ses");
	
		S_teststep_expected("$ses - '$tcpar_Fault2' should be in active state and  '$tcpar_Fault1' should be in '$tcpar_State1'", "wait_for_waittime3_$ses");			#evaluation 4
		S_teststep_detected("$ses - ", "wait_for_waittime3_$ses");
	
		S_teststep_expected("$ses - Response '$tcpar_Resp_DTC1' should be observed", "send_req_readdtc_A_$ses");			#evaluation 5
		S_teststep_detected("$ses - response is obsered $res1{$ses}","send_req_readdtc_A_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_Resp_DTC1 ,$res1{$ses});
		
		S_teststep_expected("$ses - '$tcpar_Fault2' should be in '$tcpar_State3' and  '$tcpar_Fault1' should be in '$tcpar_State1'","create_condition2_for_$ses");			#evaluation 6
		S_teststep_detected("$ses - ", "create_condition2_for_$ses");
	
		S_teststep_expected("$ses - Response '$tcpar_Resp_DTC2' should be observed", "send_req_readdtc_B_$ses");			#evaluation 7
		S_teststep_detected("$ses - response is obsered $res2{$ses}", "send_req_readdtc_B_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_Resp_DTC2 ,$res2{$ses});
		
		S_teststep_expected("$ses - '$tcpar_Fault2' should be in '$tcpar_State2' and '$tcpar_Fault1' should be in '$tcpar_State1'", "do_ecu_reset_B_$ses");			#evaluation 8
		S_teststep_detected("$ses - ", "do_ecu_reset_B_$ses");
	
		S_teststep_expected("$ses - Response '$tcpar_Resp_DTC3' should be observed","send_req_readdtc_C_$ses");			#evaluation 9
		S_teststep_detected("$ses - response is obsered $res3{$ses}", "send_req_readdtc_C_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_Resp_DTC3 ,$res3{$ses});
	}
	return 1;
}

sub TC_finalization {

	return 1;
}

sub _faultcreation{
	 my $sub_faultname = shift;
	 my $CAN_Mapping;
	 $CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	 if($sub_faultname eq 'rb_coa_BIURxMsgCounterError_flt')
	 {
		my $cntVarName = $CAN_Mapping->{'CAN_MESSAGES'}{'BIU3AC'}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName ,1);
	 }
	 elsif($sub_faultname eq 'rb_coa_BIURxMsgChecksumError_flt')
	 {
		my $csVarName = $CAN_Mapping->{'CAN_MESSAGES'}{'BIU3AC'}{'CANOE_CS'};
		CA_set_EnvVar_value($csVarName ,1);
	}	
return 1;	
}

sub _condition{
	my $sub_condition =shift;
	my $sub_fltName = shift;
	my $CAN_Mapping1;
	$CAN_Mapping1 = S_get_contents_of_hash( ['Mapping_CAN'] );
	if($sub_condition eq 'RemoveFault')
	{
		if ($sub_fltName eq 'rb_coa_BIURxMsgChecksumError_flt')
	 	{
			my $csVarName1 = $CAN_Mapping1->{'CAN_MESSAGES'}{'BIU3AC'}{'CANOE_CS'};
			CA_set_EnvVar_value($csVarName1 ,0);		
	 	}elsif ($sub_fltName eq 'rb_coa_BIURxMsgCounterError_flt'){
			my $cntVarName1 = $CAN_Mapping1->{'CAN_MESSAGES'}{'BIU3AC'}{'CANOE_CNT'};
			CA_set_EnvVar_value($cntVarName1 ,0);
		}
	}elsif($sub_condition eq 'KeepFaultActive')
	{
		S_w2rep("Keep $sub_fltName", 'Purple');
	}
return 1;	
}
1;
