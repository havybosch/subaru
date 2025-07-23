#### TEST CASE MODULE
package TC_DSM_Ser10_SessionTransition;

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
use LIFT_FaultMemory;
use LIFT_ProdDiag;
##################################

our $PURPOSE = "To Check session transition";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Ser10_SessionTransition

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> .

2.  Enter to <Session1>.

3. <ResetECU>.

4.  Enter to <Session2>.


I<B<Evaluation>>

1.

2. <Session1_Response> should be obtained.

3.-

4.<Session2_Response> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'ResetECU' => 
	SCALAR 'Session2_Response' => 
	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Session1' => 
	SCALAR 'Session2' => 
	SCALAR 'Session1_Response' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To Check session transition.'
	
	# input parameters
	AddressingMode = 'Physical'
	Session1 = '<Test Heading 1>' 
	Session2 = '<Test Heading 2>' 
	
	#output parameters
	Session1_Response = 'PR_Seesion1'
	ResetECU = 'Not Applicable'
	Session2_Response = 'NRC11'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Session1;
my $tcpar_Session2;
my $tcpar_Session1_Response;
my $tcpar_ResetECU;
my $tcpar_Session2_Response;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Session1 =  GEN_Read_mandatory_testcase_parameter( 'Session1' );
	$tcpar_Session2 =  GEN_Read_mandatory_testcase_parameter( 'Session2' );
	$tcpar_Session1_Response =  GEN_Read_mandatory_testcase_parameter( 'Session1_Response' );
	$tcpar_ResetECU =  GEN_Read_mandatory_testcase_parameter( 'ResetECU' );
	$tcpar_Session2_Response =  GEN_Read_mandatory_testcase_parameter( 'Session2_Response' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' .", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Enter to '$tcpar_Session1'.", 'AUTO_NBR', 'enter_to_session1');			#measurement 1
	$res1= _enterSession($tcpar_Session1);
	S_teststep("'$tcpar_ResetECU'.", 'AUTO_NBR');
	if ($tcpar_ResetECU eq 'Applicable')
	{
		LC_ECU_Reset();
	}else
	{
		S_w2rep("Reset ECU not request", 'Purple');
	}
	S_teststep("Enter to '$tcpar_Session2'.", 'AUTO_NBR', 'enter_to_session2');			#measurement 2
	$res2= _enterSession($tcpar_Session2);
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Session1_Response' should be obtained.", 'enter_to_session1');			#evaluation 1
	S_teststep_detected("session response is $tcpar_Session1_Response", 'enter_to_session1');
	_evalSession($tcpar_Session1,$res1);
	S_teststep_expected("'$tcpar_Session2_Response' should be obtained.", 'enter_to_session2');			#evaluation 2
	S_teststep_detected("session response is $tcpar_Session2_Response", 'enter_to_session2');
	_evalSession($tcpar_Session2,$res2);
	return 1;
}

sub TC_finalization {

	return 1;
}

sub _enterSession{
	my $sub_entersess=shift;
	my $sub_SessRes;
	if ($sub_entersess eq 'Default')
	{
		S_w2rep("Enter default session", 'Purple');
		$sub_SessRes = GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	}
	elsif($sub_entersess eq 'Extended')
	{
		S_w2rep("Enter Extended session", 'Purple');
		$sub_SessRes = GDCOM_request_general('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	}
	elsif($sub_entersess eq 'Programming')
	{
		my $securityLevelsForRequest = _getSecurityLevelsForRequest('WriteDataByIdentifier_OriginalVIN');
		DIAG_getSecurityAccess( @$securityLevelsForRequest[0] );
		$sub_SessRes = GDCOM_request_general('REQ_DiagnosticSessionControl_ProgrammingSession', 'PR_DiagnosticSessionControl_ProgrammingSession');
	}
	
	return $sub_SessRes;
}

sub _evalSession{
	my $sub_ses=shift;
	my $sub_res=shift;
	if($sub_ses eq 'Default')
	{
		EVAL_evaluate_string("Evaluating Session active response",'50 01 00 32 01 F4',$sub_res);
	}
	elsif($sub_ses eq 'Extended')
	{
		EVAL_evaluate_string("Evaluating Session active response",'50 03 00 32 01 F4',$sub_res);
	}
	elsif($sub_ses eq 'Programming')
	{
		EVAL_evaluate_string("Evaluating Session active response",'50 02 00 32 01 F4',$sub_res);
	}
return 1;
	
}
sub _getSecurityLevelsForRequest {
	my $reqLabel = shift;

	return GDCOM_getRequestInfofromMapping($reqLabel)->{'allowed_in_securitylevels'};
}
1;
