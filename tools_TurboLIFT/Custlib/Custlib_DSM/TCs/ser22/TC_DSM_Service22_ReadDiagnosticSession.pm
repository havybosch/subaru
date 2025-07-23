#### TEST CASE MODULE
package TC_DSM_Service22_ReadDiagnosticSession;

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
use LIFT_ProdDiag;
##################################

our $PURPOSE = "To Read the Active Session";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service22_ReadDiagnosticSession

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set supported <Addressing_Mode>.

2. Enter into <Session>.

3. Send request <REQ_ReadSession>.


I<B<Evaluation>>

1. 

2. Session Entery Successful

3.Positive Response <Res_ReadSession> shall be obtained along with <Data_Length> 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Res_ReadSession' => 
	SCALAR 'Data_Length' => 
	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'REQ_ReadSession' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To Read the Active Session'
	#input parameter
	Session = '<Test Heading>'
	Addressing_Mode =@('Physical','Functional')
	REQ_ReadSession = '22 F1 86'
	Res_ReadSession = '62 F1 86 01'
	Data_Length = '1'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my @tcpar_Addressing_Mode;
my $tcpar_REQ_ReadSession;
my $tcpar_Res_ReadSession;
my $tcpar_Data_Length;

################ global parameter declaration ###################
#add any global variables here
my %res;
my %res_sess;
my $databyte;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_REQ_ReadSession =  GEN_Read_mandatory_testcase_parameter( 'REQ_ReadSession' );
	$tcpar_Res_ReadSession =  GEN_Read_mandatory_testcase_parameter( 'Res_ReadSession' );
	$tcpar_Data_Length =  GEN_Read_mandatory_testcase_parameter( 'Data_Length' );

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
		S_teststep("Set supported $add Addressing Mode'.", 'AUTO_NBR');
		GDCOM_set_addressing_mode($add);
			
		S_teststep("Enter into '$tcpar_Session'.", 'AUTO_NBR', "enter_into_session_$add");			#measurement 1
		$res_sess{$add} = _ReqSession($tcpar_Session);	
		
		S_teststep("Send request '$tcpar_REQ_ReadSession'.", 'AUTO_NBR', "send_request_req_$add");			#measurement 2
		$res{$add} = GDCOM_request($tcpar_REQ_ReadSession,$tcpar_Res_ReadSession,'strict');
	}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_Addressing_Mode)
{
	S_teststep_expected("$add - Session Entery Successful", "enter_into_session_$add");			#evaluation 1
	S_teststep_detected("$add - response is obsered $res_sess{$add}", "enter_into_session_$add");
	if ($tcpar_Session eq 'DefaultSession')
		{
			S_w2rep("Enter default session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 01 00 32 01 F4', $res_sess{$add});
		}elsif($tcpar_Session eq 'ExtendedSession')
		{
			S_w2rep("Enter extended session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4', $res_sess{$add});
		}
	S_teststep_expected("$add - Positive Response '$tcpar_Res_ReadSession' shall be obtained along with '$tcpar_Data_Length' ", "send_request_req_$add");			#evaluation 2
	S_teststep_detected("$add - Active session response is $res{$add}", "send_request_req_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_ReadSession,$res{$add});
	$databyte= _CountNoByteData($res{$add});
	EVAL_evaluate_value("Data byte should be: ",$databyte,'==',$tcpar_Data_Length);
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

sub _CountNoByteData{
	my $data = shift;
	my $x = " ";
	my $c = () = $data =~ /$x/g;
	return $c -2;
}
1;
