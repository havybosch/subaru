#### TEST CASE MODULE
package TC_DSM_Service3E_NRC13;

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

our $PURPOSE = "Check NRC13 for service31";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service3E_NRC13

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter into <Session> .

2. Send <Req_TesterPresent1> with wrong length.

3. Send <Req_TesterPresent2> with wrong length.


I<B<Evaluation>>

1. Enter to <Session> is successful

2. <NRC_13> should be obtained.

3. <NRC_13> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Req_TesterPresent1' => 
	SCALAR 'Req_TesterPresent2' => 
	SCALAR 'Session' => 
	SCALAR 'NRC_13' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response when Invalid message length is provided'
	
	# input parameters
	Req_TesterPresent1 = '01 3E 00' #length : 01
	Req_TesterPresent2 = '03 3E 00' #length : 03
	Session = '<Test Heading>'
	
	# output parameters
	NRC_13 = '0x7F 0x3E 0x13'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Req_TesterPresent1;
my $tcpar_Req_TesterPresent2;
my $tcpar_Session;
my $tcpar_NRC_13;

################ global parameter declaration ###################
#add any global variables here
my $res;
my $res1;
my $res2;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Req_TesterPresent1 =  GEN_Read_mandatory_testcase_parameter( 'Req_TesterPresent1' );
	$tcpar_Req_TesterPresent2 =  GEN_Read_mandatory_testcase_parameter( 'Req_TesterPresent2' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_NRC_13 =  GEN_Read_mandatory_testcase_parameter( 'NRC_13' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter into '$tcpar_Session' .", 'AUTO_NBR', 'enter_into_session');			#measurement 1
	GDCOM_set_addressing_mode('Physical');
	if($tcpar_Session eq 'DefaultSession')
	{
		S_w2rep("Enter default session", 'Purple');
		$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	}				
	elsif($tcpar_Session eq 'ExtendedSession')
	{
		S_w2rep("Enter Extended session", 'Purple');
		$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	}
	S_teststep("Send '$tcpar_Req_TesterPresent1' with wrong length.", 'AUTO_NBR', 'send_req_testerpresent1');			#measurement 2
	$res1= _ReqRes($tcpar_Req_TesterPresent1);
	
	S_teststep("Send '$tcpar_Req_TesterPresent2' with wrong length.", 'AUTO_NBR', 'send_req_testerpresent2');			#measurement 3
	$res2= _ReqRes($tcpar_Req_TesterPresent2);
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Enter to '$tcpar_Session' is successful", 'enter_into_session');			#evaluation 1
	S_teststep_detected("session response is $res", 'enter_into_session');

	S_teststep_expected("'$tcpar_NRC_13' should be obtained.", 'send_req_testerpresent1');			#evaluation 2
	S_teststep_detected("NRC response should be $res1", 'send_req_testerpresent1');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res1);
	
	S_teststep_expected("'$tcpar_NRC_13' should be obtained.", 'send_req_testerpresent2');			#evaluation 3
	S_teststep_detected("NRC response should be $res2", 'send_req_testerpresent2');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res2);
	return 1;
}

sub TC_finalization {

	return 1;
}

sub _ReqRes
{
	my $sub_request =shift;
	my $options_href;
	my $sub_response;
	my @sub_length =split(/ /,$sub_request,2);
	$options_href->{'Manipulated_length'} = $sub_length[0];
	my @sub_data= split(/ /,$sub_length[1]);
	for(my $i =0; $i<@sub_data; $i++)
	{
		$sub_data[$i] = '0x'.$sub_data[$i];
	}
	my ($sub_status, $Sub_arrayRespone, @Sub_arrResponse);
	($sub_status, $Sub_arrayRespone)=CD_send_request_wait_response(\@sub_data, $options_href);	
	for (my $i = 0; $i< @$Sub_arrayRespone; $i++){
		@Sub_arrResponse[$i] = @$Sub_arrayRespone[$i];
	}
	$sub_response = '';
	for(my $i=0;$i<@Sub_arrResponse;$i++)
	{
		$Sub_arrResponse[$i] = S_dec2hex($Sub_arrResponse[$i]);			
		$sub_response = $sub_response .$Sub_arrResponse[$i] ;
		if ( $i < ( @Sub_arrResponse - 1 ))
		{
			$sub_response = $sub_response . ' ';
		}
	}
	return $sub_response;	
}
1;
