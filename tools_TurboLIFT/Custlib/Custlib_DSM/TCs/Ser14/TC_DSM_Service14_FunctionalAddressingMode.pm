#### TEST CASE MODULE
package TC_DSM_Service14_FunctionalAddressingMode;

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

our $PURPOSE = "To check Response of Clear DTC in Functional Addressing Mode";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service14_FunctionalAddressingMode

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session> into <AddressingMode>

2. Send <Req1_ClearDTC>

3. Send <Req2_ClearDTC>


I<B<Evaluation>>

1. 

2. <NoResponse> should be obtained.

3. <NoResponse> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'Req1_ClearDTC' => 
	SCALAR 'Req2_ClearDTC' => 
	SCALAR 'NoResponse' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check Response of Clear DTC in Functional Addressing Mode'
	
	# input parameters
	AddressingMode = 'Functional'
	Protocol = 'UDS'
	Session = '<Test Heading>'
	Req1_ClearDTC = '03 14 FF FF FF' # length = 03
	Req2_ClearDTC = '04 13 FF FF FF'# length = 04
	# output parameters
	NoResponse = 'No_Response'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_Req1_ClearDTC;
my $tcpar_Req2_ClearDTC;
my $tcpar_NoResponse;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req1_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req1_ClearDTC' );
	$tcpar_Req2_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req2_ClearDTC' );
	$tcpar_NoResponse =  GEN_Read_mandatory_testcase_parameter( 'NoResponse' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session' into '$tcpar_AddressingMode'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
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
		
	S_teststep("Send '$tcpar_Req1_ClearDTC'", 'AUTO_NBR', 'send_req1_cleardtc');			#measurement 1
	$res1=_reqClearDTC($tcpar_Req1_ClearDTC);
	
	S_teststep("Send '$tcpar_Req2_ClearDTC'", 'AUTO_NBR', 'send_req2_cleardtc');			#measurement 2
	$res2=_reqClearDTC($tcpar_Req2_ClearDTC);
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NoResponse' should be obtained.", 'send_req1_cleardtc');			#evaluation 1
	S_teststep_detected("Response is observed $res1", 'send_req1_cleardtc');
	EVAL_evaluate_string("Evaluating response",$res1,$tcpar_NoResponse);
	
	S_teststep_expected("'$tcpar_NoResponse' should be obtained.", 'send_req2_cleardtc');			#evaluation 2
	S_teststep_detected("Response is observed $res2", 'send_req2_cleardtc');
	EVAL_evaluate_string("Evaluating response",$res2,$tcpar_NoResponse);
	return 1;
}

sub TC_finalization {

	return 1;
}

sub _reqClearDTC{
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
