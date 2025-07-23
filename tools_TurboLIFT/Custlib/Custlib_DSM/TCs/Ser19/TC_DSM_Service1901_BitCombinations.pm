#### TEST CASE MODULE
package TC_DSM_Service1901_BitCombinations;

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

our $PURPOSE = "To check response of Clear DTC when maximum no.of external fault is present in filtered state";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service1901_BitCombinations

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session> in <AddressingMode>

2. Send <Req_ReadNoofDTC> followed by <StatusMask1>

3. Send <Req_ReadNoofDTC> followed by <StatusMask2>


I<B<Evaluation>>

1. 

2. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount>.

3. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Protocol' => 
	SCALAR 'Req_ReadNoofDTC' => 
	SCALAR 'StatusMask1' => 
	SCALAR 'StatusMask2' => 
	LIST 'Session' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'PR_ReadNoofDTC' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'FormatIdentifier' => 
	SCALAR 'DTCCount' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of Clear DTC when maximum no.of external fault is present in filtered state'
	
	# input parameters
	Protocol = '<Fetch {Protocol}>'
	Req_ReadNoofDTC = 'REQ_<Fetch {Service description}>'
	StatusMask1 = '02'
	StatusMask2 = 'FF'
	Session =@('default','extended')
	AddressingMode = '<Fetch {Addressing Mode}>'
	
	# output parameters
	PR_ReadNoofDTC = 'PR_ReadDTCInformation_ReportNumberOfDTCByStatusMask' 
	AvalibilityMask = '0A'
	FormatIdentifier = '01'
	DTCCount = '0'    #expressed in two bytes of data

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Protocol;
my $tcpar_Req_ReadNoofDTC;
my $tcpar_StatusMask1;
my $tcpar_StatusMask2;
my @tcpar_Session;
my $tcpar_AddressingMode;
my $tcpar_PR_ReadNoofDTC;
my $tcpar_AvalibilityMask;
my $tcpar_FormatIdentifier;
my $tcpar_DTCCount;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Req_ReadNoofDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadNoofDTC' );
	$tcpar_StatusMask1 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask1' );
	$tcpar_StatusMask2 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask2' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_PR_ReadNoofDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadNoofDTC' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_FormatIdentifier =  GEN_Read_mandatory_testcase_parameter( 'FormatIdentifier' );
	$tcpar_DTCCount =  GEN_Read_mandatory_testcase_parameter( 'DTCCount' );

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
		S_teststep("Enter to $ses session in '$tcpar_AddressingMode'", 'AUTO_NBR',"enter_supported_session_$ses");
		GDCOM_set_addressing_mode($tcpar_AddressingMode);
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
		
		S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask1'", 'AUTO_NBR', "send_req_readnoofdtc_A_$ses");			#measurement 1
		$res1{$ses}= GDCOM_request_general( $tcpar_Req_ReadNoofDTC, $tcpar_PR_ReadNoofDTC, { 'StatusMask' => $tcpar_StatusMask1 } );
		
		S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask2'", 'AUTO_NBR', "send_req_readnoofdtc_B_$ses");			#measurement 2
		$res2{$ses}= GDCOM_request_general( $tcpar_Req_ReadNoofDTC, $tcpar_PR_ReadNoofDTC, { 'StatusMask' => $tcpar_StatusMask2 } );
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - '$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount'.", "send_req_readnoofdtc_A_$ses");			#evaluation 1
		S_teststep_detected("$ses - response is obsered $res1{$ses}","send_req_readnoofdtc_A_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 01 0A 01 00 00',$res1{$ses});
	
		S_teststep_expected("$ses - '$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount'.", "send_req_readnoofdtc_B_$ses");			#evaluation 2
		S_teststep_detected("$ses - response is obsered $res2{$ses}","send_req_readnoofdtc_B_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 01 0A 01 00 00',$res2{$ses});
	}
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
