#### TEST CASE MODULE
package TC_DSM_Service1901_FilteredStateFaults;

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

our $PURPOSE = "To check response of service 19 01 when 4 external faults are present in filtered state";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service1901_FilteredStateFaults

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>

2. Enter to <Session>

3. Create <Fault1> ,<Fault2> ,<Fault3> ,<Fault4>

4. Send <Req_ReadNoofDTC> followed by <StatusMask1>

5. Send <Req_ReadNoofDTC> followed by <StatusMask2>

6. Send <Req_ReadNoofDTC> followed by <StatusMask3>

7. Send <Req_ReadNoofDTC> followed by <StatusMask4>

8. Send <Req_ReadNoofDTC> followed by <StatusMask5>

9. Send <Req_ReadNoofDTC> followed by <StatusMask6>


I<B<Evaluation>>

1.

2. 

3. All Faults should be in <ActiveState>

4. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount_Filtered>.

5. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount_Filtered>.

6. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount_Filtered>.

7. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount_Filtered>.

8. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount_Invalid>.

9. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount_Filtered>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	LIST 'Session' => 
	SCALAR 'Req_ReadNoofDTC' => 
	SCALAR 'StatusMask1' => 
	SCALAR 'StatusMask2' => 
	SCALAR 'StatusMask3' => 
	SCALAR 'StatusMask4' => 
	SCALAR 'StatusMask5' => 
	SCALAR 'StatusMask6' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Fault3' => 
	SCALAR 'Fault4' => 
	SCALAR 'PR_ReadNoofDTC' => 
	SCALAR 'ActiveState' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'FormatIdentifier' => 
	SCALAR 'DTCCount_Invalid' => 
	SCALAR 'DTCCount_Filtered' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of service 19 01 when 4 external faults are present in filtered state'
	
	# input parameters
	AddressingMode = '<Fetch {Addressing Mode}>'
	Protocol = '<Fetch {Protocol}>'
	Session =@('default','extended')
	Req_ReadNoofDTC = 'REQ_<Fetch {Service description}>' 
	StatusMask1 = '02'
	StatusMask2 = '04'
	StatusMask3 = '06'
	StatusMask4 = '28'
	StatusMask5 = '09'
	StatusMask6 = '05'
	Fault1 = 'rb_coa_BIURxMsgCounterError_flt'
	Fault2 =  'rb_psem_Short2BatPASFL_flt'
	Fault3 = 'rb_psem_Short2BatPTSL_flt'
	Fault4 = 'rb_psem_Short2GndPTSR_flt'
	
	# output parameters
	PR_ReadNoofDTC = 'PR_ReadDTCInformation_ReportNumberOfDTCByStatusMask' 
	ActiveState = 'FilteredState'
	AvalibilityMask = '0A'
	FormatIdentifier = '01'
	DTCCount_Invalid = '0'    #expressed in two bytes of data
	DTCCount_Filtered = '4'  #expressed in two bytes of data

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my @tcpar_Session;
my $tcpar_Req_ReadNoofDTC;
my $tcpar_StatusMask1;
my $tcpar_StatusMask2;
my $tcpar_StatusMask3;
my $tcpar_StatusMask4;
my $tcpar_StatusMask5;
my $tcpar_StatusMask6;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Fault3;
my $tcpar_Fault4;
my $tcpar_PR_ReadNoofDTC;
my $tcpar_ActiveState;
my $tcpar_AvalibilityMask;
my $tcpar_FormatIdentifier;
my $tcpar_DTCCount_Invalid;
my $tcpar_DTCCount_Filtered;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my %res3;
my %res4;
my %res5;
my %res6;
my $CAN_Mapping;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ReadNoofDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadNoofDTC' );
	$tcpar_StatusMask1 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask1' );
	$tcpar_StatusMask2 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask2' );
	$tcpar_StatusMask3 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask3' );
	$tcpar_StatusMask4 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask4' );
	$tcpar_StatusMask5 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask5' );
	$tcpar_StatusMask6 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask6' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Fault3 =  GEN_Read_mandatory_testcase_parameter( 'Fault3' );
	$tcpar_Fault4 =  GEN_Read_mandatory_testcase_parameter( 'Fault4' );
	$tcpar_PR_ReadNoofDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadNoofDTC' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_FormatIdentifier =  GEN_Read_mandatory_testcase_parameter( 'FormatIdentifier' );
	$tcpar_DTCCount_Invalid =  GEN_Read_mandatory_testcase_parameter( 'DTCCount_Invalid' );
	$tcpar_DTCCount_Filtered =  GEN_Read_mandatory_testcase_parameter( 'DTCCount_Filtered' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' for '$tcpar_Protocol'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
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

		S_teststep("Create '$tcpar_Fault1' ,'$tcpar_Fault2' ,'$tcpar_Fault3' ,'$tcpar_Fault4'", 'AUTO_NBR', "create_fault1_fault2_$ses");			#measurement 1
		S_w2rep("Create '$tcpar_Fault1", 'Purple');
		$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
		my $cntVarName = $CAN_Mapping->{'CAN_MESSAGES'}{ 'BIU3AC'}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName ,1);
		
		S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask1'", 'AUTO_NBR', "send_req_readnoofdtc_A_$ses");			#measurement 2
		$res1{$ses}= GDCOM_request_general( $tcpar_Req_ReadNoofDTC, $tcpar_PR_ReadNoofDTC, { 'StatusMask' => $tcpar_StatusMask1 } );
		
		S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask2'", 'AUTO_NBR', "send_req_readnoofdtc_B_$ses");			#measurement 3
		$res2{$ses}= GDCOM_request_general( $tcpar_Req_ReadNoofDTC, $tcpar_PR_ReadNoofDTC, { 'StatusMask' => $tcpar_StatusMask2 } );
		
		S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask3'", 'AUTO_NBR', "send_req_readnoofdtc_C_$ses");			#measurement 4
		$res3{$ses}= GDCOM_request_general( $tcpar_Req_ReadNoofDTC, $tcpar_PR_ReadNoofDTC, { 'StatusMask' => $tcpar_StatusMask3 } );
		
		S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask4'", 'AUTO_NBR', "send_req_readnoofdtc_D_$ses");			#measurement 5
		$res4{$ses}= GDCOM_request_general( $tcpar_Req_ReadNoofDTC, $tcpar_PR_ReadNoofDTC, { 'StatusMask' => $tcpar_StatusMask4 } );
		
		S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask5'", 'AUTO_NBR', "send_req_readnoofdtc_E_$ses");			#measurement 6
		$res5{$ses}= GDCOM_request_general( $tcpar_Req_ReadNoofDTC, $tcpar_PR_ReadNoofDTC, { 'StatusMask' => $tcpar_StatusMask5 } );
		
		S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask6'", 'AUTO_NBR', "send_req_readnoofdtc_F_$ses");			#measurement 7
		$res6{$ses}= GDCOM_request_general( $tcpar_Req_ReadNoofDTC, $tcpar_PR_ReadNoofDTC, { 'StatusMask' => $tcpar_StatusMask6 } );
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - All Faults should be in '$tcpar_ActiveState'", "create_fault1_fault2_$ses");			#evaluation 1
		S_teststep_detected("$ses -", "create_fault1_fault2_$ses");
	
		S_teststep_expected("$ses -'$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount_Filtered'.", "send_req_readnoofdtc_A_$ses");			#evaluation 2
		S_teststep_detected("$ses - response should be observed $res1{$ses}", "send_req_readnoofdtc_A_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 01 0A 01 00 04',$res1{$ses});
		
		S_teststep_expected("$ses -'$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount_Filtered'.", "send_req_readnoofdtc_B_$ses");			#evaluation 3
		S_teststep_detected("$ses - response should be observed $res2{$ses}", "send_req_readnoofdtc_B_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 01 0A 01 00 04',$res2{$ses});
		
		S_teststep_expected("$ses -'$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount_Filtered'.", "send_req_readnoofdtc_C_$ses");			#evaluation 4
		S_teststep_detected("$ses - response should be observed $res3{$ses}", "send_req_readnoofdtc_C_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 01 0A 01 00 04',$res3{$ses});
		
		S_teststep_expected("$ses -'$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount_Filtered'.","send_req_readnoofdtc_D_$ses");			#evaluation 5
		S_teststep_detected("$ses - response should be observed $res4{$ses}","send_req_readnoofdtc_D_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 01 0A 01 00 04',$res4{$ses});
		
		S_teststep_expected("$ses -'$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount_Invalid'.", "send_req_readnoofdtc_E_$ses");			#evaluation 6
		S_teststep_detected("$ses - response should be observed $res5{$ses}","send_req_readnoofdtc_E_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 01 0A 01 00 00',$res5{$ses});
			
		S_teststep_expected("$ses -'$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount_Filtered'.",  "send_req_readnoofdtc_F_$ses");			#evaluation 7
		S_teststep_detected("$ses - response should be observed $res6{$ses}",  "send_req_readnoofdtc_F_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 01 0A 01 00 04',$res6{$ses});
	}
	return 1;
}

sub TC_finalization {
		$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
		my $cntVarName1 = $CAN_Mapping->{'CAN_MESSAGES'}{ 'BIU3AC'}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName1 ,0);
		S_wait_ms(10000);	
	return 1;
}


1;
