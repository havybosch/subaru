#### TEST CASE MODULE
package TC_DSM_Service1902_BitCombinations;

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

our $PURPOSE = "To check response of service 1902 with different bit combinations";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service1902_BitCombinations

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>

2. Enter to <Session>

3. Send <Req_ReadDTC> followed by <StatusMask1>

4. Send <Req_ReadDTC> followed by <StatusMask2>

5. Send <Req_ReadDTC> followed by <StatusMask3>

6. Send <Req_ReadDTC> followed by <StatusMask4>


I<B<Evaluation>>

1.

2. 

3. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTCbyte> <DTCStatus>

4. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTCbyte> <DTCStatus>

5. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTCbyte> <DTCStatus>

6. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTCbyte> <DTCStatus>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	LIST 'Session' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'StatusMask1' => 
	SCALAR 'StatusMask2' => 
	SCALAR 'StatusMask3' => 
	SCALAR 'StatusMask4' => 
	SCALAR 'PR_ReadDTC' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'DTCbyte' => 
	SCALAR 'DTCStatus' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of service 1902 with different bit combinations'
	
	# input parameters
	AddressingMode = '<Fetch {Addressing Mode}>'
	Protocol = '<Fetch {Protocol}>'
	Session =@('default','extended')
	Req_ReadDTC = 'REQ_<Fetch {Service description}>' 
	StatusMask1 = '02'
	StatusMask2 = '04'
	StatusMask3 = '28'
	StatusMask4 = '2E'
	
	# output parameters
	PR_ReadDTC = 'PR_ReadDTCInformation_ReportDTCByStatusMask' 
	AvalibilityMask = '0A'
	DTCbyte = '0' #Expected 3bytes
	DTCStatus = '0'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my @tcpar_Session;
my $tcpar_Req_ReadDTC;
my $tcpar_StatusMask1;
my $tcpar_StatusMask2;
my $tcpar_StatusMask3;
my $tcpar_StatusMask4;
my $tcpar_PR_ReadDTC;
my $tcpar_AvalibilityMask;
my $tcpar_DTCbyte;
my $tcpar_DTCStatus;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my %res3;
my %res4;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_StatusMask1 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask1' );
	$tcpar_StatusMask2 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask2' );
	$tcpar_StatusMask3 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask3' );
	$tcpar_StatusMask4 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask4' );
	$tcpar_PR_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_DTCbyte =  GEN_Read_mandatory_testcase_parameter( 'DTCbyte' );
	$tcpar_DTCStatus =  GEN_Read_mandatory_testcase_parameter( 'DTCStatus' );

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
	
		S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask1'", 'AUTO_NBR', "send_req_readdtc_A_$ses");			#measurement 1
		$res1{$ses}= GDCOM_request_general( $tcpar_Req_ReadDTC, $tcpar_PR_ReadDTC, { 'StatusMask' => $tcpar_StatusMask1 } );
		
		S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask2'", 'AUTO_NBR', "send_req_readdtc_B_$ses");			#measurement 2
		$res2{$ses}= GDCOM_request_general( $tcpar_Req_ReadDTC, $tcpar_PR_ReadDTC, { 'StatusMask' => $tcpar_StatusMask2 } );
		
		S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask3'", 'AUTO_NBR', "send_req_readdtc_C_$ses");			#measurement 3
		$res3{$ses}= GDCOM_request_general( $tcpar_Req_ReadDTC, $tcpar_PR_ReadDTC, { 'StatusMask' => $tcpar_StatusMask3 } );
		
		S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask4'", 'AUTO_NBR', "send_req_readdtc_D_$ses");			#measurement 4
		$res4{$ses}= GDCOM_request_general( $tcpar_Req_ReadDTC, $tcpar_PR_ReadDTC, { 'StatusMask' => $tcpar_StatusMask4 } );
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - '$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTCbyte' '$tcpar_DTCStatus'", "send_req_readdtc_A_$ses");			#evaluation 1
		S_teststep_detected("$ses - response is obsered $res1{$ses}", "send_req_readdtc_A_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 02 0A 00 00 00 00',$res1{$ses});
		
		S_teststep_expected("$ses - '$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTCbyte' '$tcpar_DTCStatus'", "send_req_readdtc_B_$ses");			#evaluation 2
		S_teststep_detected("$ses - response is obsered $res2{$ses}", "send_req_readdtc_B_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 02 0A 00 00 00 00',$res2{$ses});
		
		S_teststep_expected("$ses -'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTCbyte' '$tcpar_DTCStatus'", "send_req_readdtc_C_$ses");			#evaluation 3
		S_teststep_detected("$ses - response is obsered $res3{$ses}", "send_req_readdtc_C_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 02 0A 00 00 00 00',$res3{$ses});
		
		S_teststep_expected("$ses - '$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTCbyte' '$tcpar_DTCStatus'", "send_req_readdtc_D_$ses");			#evaluation 4
		S_teststep_detected("$ses - response is obsered $res4{$ses}", "send_req_readdtc_D_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 02 0A 00 00 00 00',$res4{$ses});
	}
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
