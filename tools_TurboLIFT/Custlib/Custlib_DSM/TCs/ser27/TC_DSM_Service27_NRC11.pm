#### TEST CASE MODULE
package TC_DSM_Service27_NRC11;

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

our $PURPOSE = "to check NRC11 for service27";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service27_NRC11

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode>

2. Enter <Session>

3. Send <Req_WrongSeed> 

4. Ign Reset

5. Enter <Session>

6. Send <Req_Seed> 

7. Send <Req_WrongKey>


I<B<Evaluation>>

1.  

2. 

3. <Response > should be obtained.

4.

5.

6. <Res_Seed> should be obtained within 100ms.

7. <Response > should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Response' => 
	SCALAR 'Res_Seed' => 
	SCALAR 'purpose' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Req_WrongSeed' => 
	SCALAR 'Req_WrongKey' => 
	SCALAR 'Req_Seed' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To verify the condition for NRC 11'
	# input parameters
	Protocol = 'UDS'
	Session = 'Extended'
	AddressingMode = '<Test Heading 2>'
	Req_WrongSeed = '26 05'
	Req_WrongKey  = '26 06 11 22 33 44'
	Req_Seed = '27 05'
	Response = '7F 26 11'
	Res_Seed = '0x67 0x5 S1 S2 S3 S4'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_AddressingMode;
my $tcpar_Req_WrongSeed;
my $tcpar_Req_WrongKey;
my $tcpar_Req_Seed;
my $tcpar_Response;
my $tcpar_Res_Seed;

################ global parameter declaration ###################
#add any global variables here
my $res_seedbyte;
my $res1;
my $res_key;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Req_WrongSeed =  GEN_Read_mandatory_testcase_parameter( 'Req_WrongSeed' );
	$tcpar_Req_WrongKey =  GEN_Read_mandatory_testcase_parameter( 'Req_WrongKey' );
	$tcpar_Req_Seed =  GEN_Read_mandatory_testcase_parameter( 'Req_Seed' );
	$tcpar_Response =  GEN_Read_mandatory_testcase_parameter( 'Response' );
	$tcpar_Res_Seed =  GEN_Read_mandatory_testcase_parameter( 'Res_Seed' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Enter '$tcpar_Session'", 'AUTO_NBR');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	
	S_teststep("Send '$tcpar_Req_WrongSeed' ", 'AUTO_NBR', 'send_req_wrongseed');			#measurement 1
	$res1 = GDCOM_request($tcpar_Req_WrongSeed,$tcpar_Response,'strict');
	
	S_teststep("Ign Reset", 'AUTO_NBR');
	LC_ECU_Reset();
	S_wait_ms(1000);
	
	S_teststep("Enter '$tcpar_Session'", 'AUTO_NBR');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	
	S_teststep("Send '$tcpar_Req_Seed' ", 'AUTO_NBR', 'send_req_seed');			#measurement 2
	$res_seedbyte = _reqseed($tcpar_Req_Seed);
	
	S_teststep("Send '$tcpar_Req_WrongKey'", 'AUTO_NBR', 'send_req_wrongkey');			#measurement 3
	$res_key = GDCOM_request($tcpar_Req_WrongKey,$tcpar_Response,'strict');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Response ' should be obtained.", 'send_req_wrongseed');			#evaluation 1
	S_teststep_detected("Response should be observed is $res1", 'send_req_wrongseed');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Response,$res1);
	
	S_teststep_expected("'$tcpar_Res_Seed' should be obtained within 100ms.", 'send_req_seed');			#evaluation 2
	S_teststep_detected("positive response should be $res_seedbyte", 'send_req_seed');
	my @resseed = split(/ /,$res_seedbyte);
	EVAL_evaluate_value("Checking value of byte 1", @resseed[0],'==',0x67);
	EVAL_evaluate_value("Checking value of byte 2", @resseed[1],'==',0x5);
	EVAL_evaluate_value("Checking value of byte 3", @resseed[2],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 4", @resseed[3],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 5", @resseed[4],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 6", @resseed[5],'!=',0x00);
	
	S_teststep_expected("'$tcpar_Response ' should be obtained.", 'send_req_wrongkey');			#evaluation 3
	S_teststep_detected("Response should be observed is $res_key", 'send_req_wrongkey');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Response,$res_key);
	return 1;
}

sub TC_finalization {

	return 1;
}

sub _reqseed{
	my $subreqseed = shift;
	my $res_seedbyte;
	my $sub_response1;
	my @Sub_arrResponse1;	
	GDCOM_request($subreqseed,'67 05','relax');
	S_wait_ms(100);
	$res_seedbyte = CA_get_EnvVar_value('EvRxMesgBox');
	for (my $i = 0; $i< @$res_seedbyte; $i++){
		@Sub_arrResponse1[$i] = @$res_seedbyte[$i];
	}
	$sub_response1 = '';
	for(my $i=0;$i<@Sub_arrResponse1;$i++)
	{
		$Sub_arrResponse1[$i] = S_dec2hex($Sub_arrResponse1[$i]);			
		$sub_response1 = $sub_response1 .$Sub_arrResponse1[$i] ;
		if ( $i < ( @Sub_arrResponse1 - 1 ))
		{
			$sub_response1 = $sub_response1 . ' ';
		}
	}
	return $sub_response1;
	
}
1;
