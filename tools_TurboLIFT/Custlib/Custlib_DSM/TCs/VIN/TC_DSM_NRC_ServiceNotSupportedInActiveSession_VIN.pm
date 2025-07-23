#### TEST CASE MODULE
package TC_DSM_NRC_ServiceNotSupportedInActiveSession_VIN;

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
use GENERIC_DCOM;
use LIFT_DCOM;
use LIFT_PD;
use LIFT_CD_CAN;
use Data::Dumper;   
use LIFT_labcar;
use LIFT_PRITT;
use LIFT_evaluation;
use LIFT_CANoe;
use LIFT_can_access;
use FuncLib_TNT_DEVICE;
use FuncLib_TNT_FM;
use FuncLib_TNT_COM;
##################################

our $PURPOSE = "check NRC7F for VIN request";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_NRC_ServiceNotSupportedInActiveSession_VIN

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter session in which the service is not supported: <NotSupportedSessions>

2. Send <Request> in physical addressing mode with data value is <Value>

3. Send <Request> in functional addressing mode with data value is <Value>

4. Repeat the above steps for all sessions in which the service is not supported


I<B<Evaluation>>

1. -

2. <Response> is received

3. <Response> is received if <SUPPRESS_NRC_7F> is 'no'. Else no response is received

4. Same as above steps


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Request' => 
	SCALAR 'Value' => 
	SCALAR 'Purpose' => 
	SCALAR 'NotSupportedSessions' => 
	SCALAR 'Response' => 
	SCALAR 'SUPPRESS_NRC_7F' => 


=head2 PARAMETER EXAMPLES

	Purpose = 'To check for NRC $7F or no response if service is not supported in active session'
	NotSupportedSessions = 'DefaultSession'
	Response = '0x7F 0x2E 0x7F'
	SUPPRESS_NRC_7F = 'yes' #or 'no' (See HLD Notes)
	Request = 'WriteDataByIdentifier_VIN'
	Value = '01 02 03 04 05 06 07 08 58 10 11 12 13 14 15 16 17'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Purpose;
my $tcpar_NotSupportedSessions;
my $tcpar_Response;
my $tcpar_SUPPRESS_NRC_7F;
my $tcpar_Request;
my $tcpar_Value;

################ global parameter declaration ###################
#add any global variables here
my $dataVIN;
my ($status, $time_aref, $response_aref);
my $NRC_phy;
my $NRC_func;
###############################################################

sub TC_set_parameters {

	$tcpar_Purpose =  GEN_Read_mandatory_testcase_parameter( 'Purpose' );
	$tcpar_NotSupportedSessions =  GEN_Read_mandatory_testcase_parameter( 'NotSupportedSessions' );
	$tcpar_Response =  GEN_Read_mandatory_testcase_parameter( 'Response' );
	$tcpar_SUPPRESS_NRC_7F =  GEN_Read_mandatory_testcase_parameter( 'SUPPRESS_NRC_7F' );
	$tcpar_Request =  GEN_Read_mandatory_testcase_parameter( 'Request' );
	$tcpar_Value =  GEN_Read_mandatory_testcase_parameter( 'Value' );

	return 1;
}

sub TC_initialization {
	_ClearNVMforVIN();
	LC_ECU_Reset();
		
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter session in which the service is not supported: '$tcpar_NotSupportedSessions'", 'AUTO_NBR');
	S_w2rep("Enter default session", 'Purple');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	
	S_teststep("Send '$tcpar_Request' in physical addressing mode with data value is '$tcpar_Value'", 'AUTO_NBR', 'send_request_in_A');			#measurement 1
	GDCOM_set_addressing_mode('Physical');
	$NRC_phy = _Evaluation_response($tcpar_Request,$tcpar_Value);
	S_w2rep ("response $NRC_phy");
	
	S_teststep("Send '$tcpar_Request' in functional addressing mode with data value is '$tcpar_Value'", 'AUTO_NBR', 'send_request_in_B');			#measurement 2
	GDCOM_set_addressing_mode('Functional');
	if ($tcpar_SUPPRESS_NRC_7F eq 'no'){
		$NRC_func = _Evaluation_response($tcpar_Request,$tcpar_Value);
		S_w2rep ("response $NRC_func");
	}else{
		if ($tcpar_Request eq 'WriteDataByIdentifier_VIN')
		{
			$NRC_func = GDCOM_request ('2E F1 90 01 02 03 04 05 06 07 08 58 10 11 12 13 14 15 16 17',"",'quiet');
		}elsif($tcpar_Request eq 'WriteDataByIdentifier_VINLockFlag')
		{
			if($tcpar_Value eq '00'){
				$NRC_func = GDCOM_request ('2E 10 5E 00',"",'quiet');
			}elsif($tcpar_Value eq 'FF'){
				$NRC_func = GDCOM_request ('2E 10 5E FF',"",'quiet');
			}
		}
	}
	S_teststep("Repeat the above steps for all sessions in which the service is not supported", 'AUTO_NBR', 'repeat_the_above');			#measurement 3

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Response' is received", 'send_request_in_A');			#evaluation 1
	S_teststep_detected("NRC7F is observed $NRC_phy", 'send_request_in_A');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Response,$NRC_phy);
	
	S_teststep_expected("'$tcpar_Response' is received if '$tcpar_SUPPRESS_NRC_7F' is 'no'. Else no response is received", 'send_request_in_B');			#evaluation 2
	if ($tcpar_SUPPRESS_NRC_7F eq 'no')
	{
		S_teststep_detected("NRC7F is observed $NRC_func", 'send_request_in_B');
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_Response,$NRC_func);
	}
	else
	{
		S_teststep_detected("No response for functional mode", 'send_request_in_B');
	}
	S_teststep_expected("Same as above steps", 'repeat_the_above');			#evaluation 3
	S_teststep_detected("Same as above steps", 'repeat_the_above');

	return 1;
}

sub TC_finalization {

	return 1;
}

sub _ClearNVMforVIN {

	foreach my $i (0..16){
		PD_WriteMemoryByName( "rb_dwdi_VINData_dfau8($i)", [ 0x00 ] );
		}
	
	PD_WriteMemoryByName( "rb_dwdi_VINLockFlag_dfu8(0)", [ 0x00 ] );
	S_wait_ms(100);

	return 1;	
}

sub  _Evaluation_response{
	my $sub_request = shift;
	my $sub_datavalue = shift;
	my $subdataVIN;
	my $sub_response;
	my @Sub_arrResponse;
	$subdataVIN->{'Data'} = $sub_datavalue;
	my $requestBytes = GDCOM_getRequestLabelValue( "REQ_" . $sub_request,$subdataVIN);
	my ($status, $time_aref, $Sub_arrayRespone) = CD_CAN_send_request_wait_response ( GEN_byteString2hexaref($requestBytes) ); 
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
