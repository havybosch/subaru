#### TEST CASE MODULE
package TC_DSM_Service31_NRC22check;

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

our $PURPOSE = "check NRC22 for service31";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service31_NRC22check

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Send <Req_StartRoutine> 

3. Simultaneously without waiting for any time Send again <Req_StartRoutine> .


I<B<Evaluation>>

1.

2. <PR_StartRoutine> should be obtained

3.  <NRC_22> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'Req_StartRoutine' => 
	SCALAR 'NRC_22' => 
	SCALAR 'PR_StartRoutine' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $31 service when All Clear request is sent during memory clear execution is in process'
	
	# input parameters
	Session =@('default','extended')
	Req_StartRoutine = '31 01 AC AC'
	
	# output parameters
	NRC_22 = '7F 31 22'
	PR_StartRoutine = '71 01 AC AC'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Session;
my $tcpar_Req_StartRoutine;
my $tcpar_NRC_22;
my $tcpar_PR_StartRoutine;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_StartRoutine =  GEN_Read_mandatory_testcase_parameter( 'Req_StartRoutine' );
	$tcpar_NRC_22 =  GEN_Read_mandatory_testcase_parameter( 'NRC_22' );
	$tcpar_PR_StartRoutine =  GEN_Read_mandatory_testcase_parameter( 'PR_StartRoutine' );

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
	
		S_teststep("Send '$tcpar_Req_StartRoutine' ", 'AUTO_NBR', "send_req_startroutine_$ses");			#measurement 1
		$res1{$ses}= GDCOM_request($tcpar_Req_StartRoutine,$tcpar_PR_StartRoutine,'strict');
		
		S_teststep("Simultaneously without waiting for any time Send again '$tcpar_Req_StartRoutine' .", 'AUTO_NBR', "simultaneously_without_waiting_$ses");			#measurement 2
		$res2{$ses}= GDCOM_request($tcpar_Req_StartRoutine,$tcpar_NRC_22,'strict');
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses- '$tcpar_PR_StartRoutine' should be obtained", "send_req_startroutine_$ses");			#evaluation 1
		S_teststep_detected("$ses - PR response should be $res1{$ses}", "send_req_startroutine_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_StartRoutine,$res1{$ses});
		
		S_teststep_expected("$ses - '$tcpar_NRC_22' should be obtained.", "simultaneously_without_waiting_$ses");			#evaluation 2
		S_teststep_detected("$ses - NRC response should be $res2{$ses}", "simultaneously_without_waiting_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_22,$res2{$ses});
	}
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
