#### TEST CASE MODULE
package TC_DSM_service85_NRC7F;

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

our $PURPOSE = "to check NRC7F for service85";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_service85_NRC7F

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1.Set <Addressing_Mode> and <Protocol>

2. Send Request to enter <Session1>

3. Send <REQ_OFF>.


I<B<Evaluation>>

1.

2. Session entry should be successful.

3. <NRC_7F> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session1' => 
	SCALAR 'REQ_OFF' => 
	SCALAR 'NRC_7F' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To verify that NRC 7F is received when service request is sent which is not supported in Active Session'
	
	Addressing_Mode = @('Physical','Functional')
	
	Protocol = 'UDS' 
	
	Session1 = 'DefaultSession' 
	
	
	REQ_OFF = '85 02'
	
	NRC_7F= '7F 85 7F'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Addressing_Mode;
my $tcpar_Protocol;
my $tcpar_Session1;
my $tcpar_REQ_OFF;
my $tcpar_NRC_7F;

################ global parameter declaration ###################
#add any global variables here
my %res_sess;
my %res;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session1 =  GEN_Read_mandatory_testcase_parameter( 'Session1' );
	$tcpar_REQ_OFF =  GEN_Read_mandatory_testcase_parameter( 'REQ_OFF' );
	$tcpar_NRC_7F =  GEN_Read_mandatory_testcase_parameter( 'NRC_7F' );

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
		S_teststep("Set supported $add Addressing Mode", 'AUTO_NBR');
		GDCOM_set_addressing_mode($add);

		S_teststep("Send Request to enter '$tcpar_Session1'", 'AUTO_NBR', 'send_request_to'."_$add");			#measurement 1
		S_w2rep("Enter default session", 'Purple');
		$res_sess{$add} = GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
		
		S_teststep("Send '$tcpar_REQ_OFF'.", 'AUTO_NBR', 'send_req_off'."_$add");			#measurement 2
		$res{$add} = GDCOM_request($tcpar_REQ_OFF,$tcpar_NRC_7F,'strict' );
	}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_Addressing_Mode)
{
	S_teststep_expected("Session entry should be successful.", 'send_request_to'."_$add");			#evaluation 1
	S_teststep_detected("$add - response is obsered $res_sess{$add}", 'send_request_to'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",'50 01 00 32 01 F4', $res_sess{$add});
	
	S_teststep_expected("$add - '$tcpar_NRC_7F' should be obtained.", 'send_req_off'."_$add");			#evaluation 2
	S_teststep_detected("$add - response is obsered $res{$add}", 'send_req_off'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_7F,$res{$add});
}
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
