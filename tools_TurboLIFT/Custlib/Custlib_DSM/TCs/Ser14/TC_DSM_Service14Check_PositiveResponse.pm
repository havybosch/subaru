#### TEST CASE MODULE
package TC_DSM_Service14Check_PositiveResponse;

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

our $PURPOSE = "To check $14 Service in different Sessions";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service14Check_PositiveResponse

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Send <Req_ClearDTC>


I<B<Evaluation>>

1. 

2. <Res_ClearDTC> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Res_ClearDTC' => 
	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'Req_ClearDTC' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check $14 Service in different Sessions'
	
	# input parameters
	Session = '<Test Heading>'
	Req_ClearDTC =  'REQ_<Fetch {Service description}>' 
	#linked to Diag Mapping
	
	# output parameters
	Res_ClearDTC = 'PR_ClearDTCInformation_all' 
	#also consider Functional

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Req_ClearDTC;
my $tcpar_Res_ClearDTC;

################ global parameter declaration ###################
#add any global variables here
my $res;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ClearDTC' );
	$tcpar_Res_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Res_ClearDTC' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');
	if ($tcpar_Session eq 'DefaultSession')
	{
		S_w2rep("Enter default session", 'Purple');
		GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	}
	elsif($tcpar_Session eq 'ExtendedSession')
	{
		S_w2rep("Enter Extended session", 'Purple');
		 GDCOM_request_general('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	}
	elsif($tcpar_Session eq 'ProgrammingSession')
	{
		S_w2rep("Enter Programming Session", 'Purple');
		GDCOM_request_general('REQ_DiagnosticSessionControl_ProgrammingSession', 'PR_DiagnosticSessionControl_ProgrammingSession');
	}
	elsif($tcpar_Session eq 'SafetySession')
	{
		S_w2rep("Enter Safety Session", 'Purple');
		GDCOM_request('10 04','50 04','relax');
	}
	S_teststep("Send '$tcpar_Req_ClearDTC'", 'AUTO_NBR', 'send_req_cleardtc');			#measurement 1
	$res= GDCOM_request_general($tcpar_Req_ClearDTC,$tcpar_Res_ClearDTC);
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Res_ClearDTC' should be obtained.", 'send_req_cleardtc');			#evaluation 1
	S_teststep_detected("Response is observed $res", 'send_req_cleardtc');
	EVAL_evaluate_string("Evaluating response",'54',$res);
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
