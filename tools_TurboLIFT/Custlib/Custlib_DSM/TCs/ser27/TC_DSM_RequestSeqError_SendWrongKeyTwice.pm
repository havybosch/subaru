#### TEST CASE MODULE
package TC_DSM_RequestSeqError_SendWrongKeyTwice;

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

our $PURPOSE = "to check NRC24 for service27 when wrong key sent 2 times";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_RequestSeqError_SendWrongKeyTwice

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> and <Protocol>

2. Enter <Session>

3. Send <Req_Seed> as <level> security access.

4. Send <Req_WrongKey1> as <level> security access.

5. Send <Req_WrongKey2> as <level> security access.


I<B<Evaluation>>

1.  

2. 

3. <Res_Seed> should be obtained within 100ms.

4. <NRC36> should be obtained.

5. <NRC24> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req_Seed' => 
	SCALAR 'Res_Seed' => 
	SCALAR 'Req_WrongKey1' => 
	SCALAR 'Req_WrongKey2' => 
	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'level' => 
	SCALAR 'NRC36' => 
	SCALAR 'NRC24' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To verify that NRC24 shall be sent Wrong Send Key is sent more than Once when Delay timer is Active'
	# input parameters
	AddressingMode = 'Physical'
	Protocol = 'UDS'
	Session = 'Extended'
	level = '<Test Heading 2>'
	# output parameters
	NRC36  = '7F 27 36'
	NRC24 = '7F 27 24'
	Req_Seed = '27 01'
	Res_Seed =  '0x67 0x1 S1 S2 S3 S4'
	Req_WrongKey1= '27 02 11 22 33 44' 
	Req_WrongKey2 = '27 02 55 66 77 88'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_level;
my $tcpar_NRC36;
my $tcpar_NRC24;
my $tcpar_Req_Seed;
my $tcpar_Res_Seed;
my $tcpar_Req_WrongKey1;
my $tcpar_Req_WrongKey2;

################ global parameter declaration ###################
#add any global variables here
my $resSeed;
my $reskey1;
my $reskey2;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_level =  GEN_Read_mandatory_testcase_parameter( 'level' );
	$tcpar_NRC36 =  GEN_Read_mandatory_testcase_parameter( 'NRC36' );
	$tcpar_NRC24 =  GEN_Read_mandatory_testcase_parameter( 'NRC24' );
	$tcpar_Req_Seed =  GEN_Read_mandatory_testcase_parameter( 'Req_Seed' );
	$tcpar_Res_Seed =  GEN_Read_mandatory_testcase_parameter( 'Res_Seed' );
	$tcpar_Req_WrongKey1 =  GEN_Read_mandatory_testcase_parameter( 'Req_WrongKey1' );
	$tcpar_Req_WrongKey2 =  GEN_Read_mandatory_testcase_parameter( 'Req_WrongKey2' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' and '$tcpar_Protocol'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Enter '$tcpar_Session'", 'AUTO_NBR');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	
	S_teststep("Send '$tcpar_Req_Seed' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_seed');			#measurement 1
	$resSeed = _reqseed($tcpar_level,$tcpar_Req_Seed);
	
	S_teststep("Send '$tcpar_Req_WrongKey1' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_wrongkey1');			#measurement 2
	$reskey1 = GDCOM_request($tcpar_Req_WrongKey1,$tcpar_NRC36,'strict');
	
	S_teststep("Send '$tcpar_Req_WrongKey2' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_wrongkey2');			#measurement 3
	$reskey2 = GDCOM_request($tcpar_Req_WrongKey2,$tcpar_NRC24,'strict');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Res_Seed' should be obtained within 100ms.", 'send_req_seed');			#evaluation 1
	S_teststep_detected("positive sedd response is $resSeed ", 'send_req_seed');
	my @resseed = split(/ /,$resSeed);
	EVAL_evaluate_value("Checking value of byte 1", @resseed[0],'==',0x67);
	if($tcpar_level eq 'Level1')
	{
		EVAL_evaluate_value("Checking value of byte 2", @resseed[1],'==',0x1);
	}elsif($tcpar_level eq 'Level2')
	{
		EVAL_evaluate_value("Checking value of byte 2", @resseed[1],'==',0x3);
	}elsif($tcpar_level eq 'Level3')
	{
		EVAL_evaluate_value("Checking value of byte 2", @resseed[1],'==',0x5);
	}
	EVAL_evaluate_value("Checking value of byte 3", @resseed[2],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 4", @resseed[3],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 5", @resseed[4],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 6", @resseed[5],'!=',0x00);
	
	S_teststep_expected("'$tcpar_NRC36' should be obtained.", 'send_req_wrongkey1');			#evaluation 2
	S_teststep_detected("NRC36 should be observed is $reskey1", 'send_req_wrongkey1');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC36,$reskey1);
	
	S_teststep_expected("'$tcpar_NRC24' should be obtained.", 'send_req_wrongkey2');			#evaluation 3
	S_teststep_detected("NRC24 should be observed is $reskey2", 'send_req_wrongkey2');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC24,$reskey2);
	return 1;
}

sub TC_finalization {
	
	S_wait_ms(1000);
	return 1;
}

sub _reqseed{
	my $sublevel = shift;
	my $subreqseed = shift;
	my $res_seedbyte;
	my $response;
	if ($sublevel eq 'Level1')
	{
		$res_seedbyte = GDCOM_request($subreqseed,'67 01','relax');
	}elsif($sublevel eq 'Level2'){
		$res_seedbyte = GDCOM_request($subreqseed,'67 03','relax');
	}elsif($sublevel eq 'Level3'){
		$res_seedbyte = GDCOM_request($subreqseed,'67 05','relax');
	}
	my @sub_random= split(/ /,$res_seedbyte);
	$response = '';
	for(my $i =0; $i<@sub_random; $i++)
	{
		$sub_random[$i] = '0x'.$sub_random[$i];
		$response = $response. $sub_random[$i];
		if ($i < (@sub_random - 1))
		{
			$response = $response. ' ';	
		}

	}
	
	return $response;
}

1;
