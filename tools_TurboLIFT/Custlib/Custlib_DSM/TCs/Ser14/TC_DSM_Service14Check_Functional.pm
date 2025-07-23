#### TEST CASE MODULE
package TC_DSM_Service14Check_Functional;

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

our $PURPOSE = "to check response of $14 in functional addressing mode with a fault condition";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service14Check_Functional

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session> and <Addressing_Mode>.

2.Qualify one <Fault>.

3. Send <Req_ClearDTC> in <Addressing_Mode>.


I<B<Evaluation>>

1.-

2.- <Fault> should be in filtered state.

3. <Res_ClearDTC> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Res_ClearDTC' => 
	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'Fault' => 
	SCALAR 'Addressing_Mode' => 
	SCALAR 'Req_ClearDTC' => 


=head2 PARAMETER EXAMPLES

	purpose= 'to check response of $14 in functional addressing mode with a fault condition'
	
	# input parameters
	Session = 'Extended'
	Fault = 'BIU timeout'
	Addressing_Mode= '<Test Heading>'
	Req_ClearDTC =  'REQ_<Fetch {Service description}>' 
	#linked to Diag Mapping
	
	# output parameters
	Res_ClearDTC = 'NRC31'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Fault;
my $tcpar_Addressing_Mode;
my $tcpar_Req_ClearDTC;
my $tcpar_Res_ClearDTC;

################ global parameter declaration ###################
#add any global variables here
my $res;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
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

	S_teststep("Enter to '$tcpar_Session' and '$tcpar_Addressing_Mode'.", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_Addressing_Mode);
	if ($tcpar_Session eq 'Default')
	{
		S_w2rep("Enter default session", 'Purple');
		GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	}
	elsif($tcpar_Session eq 'Extended')
	{
		S_w2rep("Enter Extended session", 'Purple');
		GDCOM_request_general('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	}
	S_teststep("Qualify one '$tcpar_Fault'.", 'AUTO_NBR', 'qualify_one_fault');			#measurement 1
	COM_stopMessages('BIU3AC');
	S_teststep("Send '$tcpar_Req_ClearDTC' in '$tcpar_Addressing_Mode'.", 'AUTO_NBR', 'send_req_cleardtc');			#measurement 2
	$res= GDCOM_request ('14 FF FF FF', '7F 14 31', 'strict');
    S_wait_ms(5000);
	return 1;
}
	

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault' should be in filtered state.", 'qualify_one_fault');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'qualify_one_fault');

	S_teststep_expected("'$tcpar_Res_ClearDTC' should be obtained.", 'send_req_cleardtc');			#evaluation 2
	S_teststep_detected("DTC response is $res", 'send_req_cleardtc');
	EVAL_evaluate_string( "DTC response Check", '7F 14 31', $res);
	return 1;
}

sub TC_finalization {
	COM_startMessages('BIU3AC');
	S_wait_ms(2000);
	return 1;
}


1;
