#### TEST CASE MODULE
package TC_DSM_NRC_ResponsePending_VIN;

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

our $PURPOSE = "Check NRC78 with P2Server Timer for VIN request";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_NRC_ResponsePending_VIN

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Using Physical addressing mode to enter <Session> session supported by the service. Get security access  <Security>  if required

2. Send <Request>  with data is <VINdata>  and measure the time for ECU to send first response frame


I<B<Evaluation>>

1. Positive response is observed.

2. If the first frame of the response (positive/negative) is not sent within <P2serverTime> P2CAN_Server time then NRC78 <NRC78> is received. This NRC can be received multiple times till the final response (positive/negative) is sent.

After NRC78, final response is received (positive/negative)


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Session' => 
	SCALAR 'Security' => 
	SCALAR 'Request' => 
	SCALAR 'VINdata' => 
	SCALAR 'NRC78' => 
	SCALAR 'P2serverTime' => 
	SCALAR 'Purpose' => 


=head2 PARAMETER EXAMPLES

	Purpose = 'To check that NRC $78 is sent if a request was correctly received but the response is not possible within P2CAN_Server time'
	Session = 'Extended'
	Security = 'Level2'
	Request = 'WriteDataByIdentifier_VIN'
	VINdata = '01 02 03 04 05 06 07 08 58 10 11 12 13 14 15 16 17'
	NRC78 = '7F 2E 78'
	P2serverTime = '50' #dec(ms)

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Purpose;
my $tcpar_Session;
my $tcpar_Security;
my $tcpar_Request;
my $tcpar_VINdata;
my $tcpar_NRC78;
my $tcpar_P2serverTime;

################ global parameter declaration ###################
#add any global variables here
my $res_sess;
my %DataValue;
my $reqresp_href;
my ($status, $time_aref, $response_aref);
my $P2CAN_Server_time;
my $res_key;
my $dataVIN;
###############################################################

sub TC_set_parameters {

	$tcpar_Purpose =  GEN_Read_mandatory_testcase_parameter( 'Purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Security =  GEN_Read_mandatory_testcase_parameter( 'Security' );
	$tcpar_Request =  GEN_Read_mandatory_testcase_parameter( 'Request' );
	$tcpar_VINdata =  GEN_Read_mandatory_testcase_parameter( 'VINdata' );
	$tcpar_NRC78 =  GEN_Read_mandatory_testcase_parameter( 'NRC78' );
	$tcpar_P2serverTime =  GEN_Read_mandatory_testcase_parameter( 'P2serverTime' );

	return 1;
}

sub TC_initialization {
	#Clear NVM memory of VIN
	_ClearNVMforVIN();
	LC_ECU_Reset();		
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Using Physical addressing mode to enter '$tcpar_Session' session supported by the service. Get security access  '$tcpar_Security'  if required", 'AUTO_NBR', 'using_physical_addressing');			#measurement 1
	GDCOM_set_addressing_mode('Physical');
	S_wait_ms(100);
	S_w2rep("Enter Extended session", 'Purple');
	$res_sess = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	my $session_resp_aref = GEN_byteString2hexaref($res_sess);
    $P2CAN_Server_time = hex(@$session_resp_aref[3]);
    S_w2rep( "P2CAN_Server time = $P2CAN_Server_time ms" );
    
	S_w2rep("Request security level2.", 'Purple');
	$res_key = _reqres_key();
	my @reskey = split(/ /,$res_key);
	EVAL_evaluate_value("Checking value of byte 1", @reskey[0],'==',0x67);
	EVAL_evaluate_value("Checking value of byte 2", @reskey[1],'==',0x4);
	
	S_teststep("Send '$tcpar_Request'  with data is '$tcpar_VINdata'  and measure the time for ECU to send first response frame", 'AUTO_NBR', 'send_request__with');			#measurement 2
	$dataVIN->{'Data'} = $tcpar_VINdata;
	my $requestBytes = GDCOM_getRequestLabelValue( "REQ_" . $tcpar_Request, $dataVIN);
	GDCOM_CA_trace_stop();
	GDCOM_CA_trace_start();
	($status, $time_aref, $response_aref) = CD_CAN_send_request_wait_response ( GEN_byteString2hexaref($requestBytes) ); 
	S_w2rep ("response status: $status");
	S_w2rep ("response times: @$time_aref");
	S_w2rep ("response bytes: @$response_aref");
	
	# store the request and reponse from the can log file
    my $Trace_StoredfilePath = GEN_printLink ( GEN_generateUniqueTraceName() );
    GDCOM_CA_trace_stop($Trace_StoredfilePath);
    
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Positive response is observed.", 'using_physical_addressing');			#evaluation 1
	S_teststep_detected("Enter extended session successful is obsered $res_sess", 'using_physical_addressing');
	EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4', $res_sess);
			
	S_teststep_expected("If the first frame of the response (positive/negative) is not sent within '$tcpar_P2serverTime' P2CAN_Server time then NRC78 '$tcpar_NRC78' is received. This NRC can be received multiple times till the final response (positive/negative) is sent.", 'send_request__with');			#evaluation 2
	if(not defined $status or $status == 3){
		S_teststep_detected("No response received", 'send_request__with');
	}
	elsif($status == 0){
		S_teststep_detected("Positive response received (without NRC78). First frame of positive response received after @$time_aref[0] ms", 'send_request__with');
	}
	elsif($status == 1){
		S_teststep_detected("Response received after NRC78. NRC78 received after @$time_aref[0] ms", 'send_request__with');
	}
	elsif($status == 2){
		S_teststep_detected("Negative response (without NRC78) received after @$time_aref[0] ms", 'send_request__with');
	}
	
	
	if (not defined $status or $status == 3){
		S_teststep_detected("No evaluation possible since no response is received.");
		S_set_verdict ( 'VERDICT_PASS' );
	}
	else{
		if( @$time_aref[0] > $P2CAN_Server_time){ #in all cases (status 0 to 2), first response frame should be received within P2CAN_Server time
			S_teststep_detected("NRC78 or first response frame is NOT received within P2CAN_Server ($P2CAN_Server_time) ms");
			S_set_verdict ( 'VERDICT_FAIL' );
		}
		else{
			S_teststep_detected("NRC78 or first response frame is received within P2CAN_Server ($P2CAN_Server_time) ms");
			S_set_verdict ( 'VERDICT_PASS' );
		}
	}
	return 1;
}

sub TC_finalization {
	GDCOM_CA_trace_start();
	
	#Clear NVM memory of VIN
	_ClearNVMforVIN();
	LC_ECU_Reset();	
	CA_set_EnvVar_value('Security03', 0);
	S_wait_ms(1000);
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

sub _reqres_key{
	my $sub_res;
	my $sub_response;
	my @Sub_arrResponse;
	CA_set_EnvVar_value('Security03', 1);
	S_wait_ms(1000);
	$sub_res = CA_get_EnvVar_value('EvRxMesgBox');
	for (my $i = 0; $i< @$sub_res; $i++){
		@Sub_arrResponse[$i] = @$sub_res[$i];
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
