#### TEST CASE MODULE
package TC_DSM_Service27_NRC36andNRC37;

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

our $PURPOSE = "to check NRC36 and NRC37 for service27";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service27_NRC36andNRC37

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode>.

2. Enter <Session>.

3. Send <Req_Seed> as <level> security access.

4. Send <Req_WrongKey> as <level> security access.

5. Send <Req_Seed> for <time> as <level> security access.

6.Send <Req_SendKey> as <level> security access.

7. Make IGN Reset and repeat Step2 to Step5.

8.Enter <Session>.

9.Send <Req_Seed> as <level> security access.

10.Send <Req_WrongKey> as <level> security access.

11.Send <Req_Seed> for <time> as <level> security access.

12. Send <Req_SendKey> as <level> security access.


I<B<Evaluation>>

1.

2.

3. <Res_Seed> should be obtained within 100ms.

4. <NRC_36> shall be obtained.

5. <NRC_37> shall be obtained till <time> and after that <Res_Seed> should be obtained.

6. <Res_Key> should be obtained.

7. Same response from Step3 to Step5 should be observed.

8.

9.<NRC_37> should be obtained within 100ms.

10.<NRC_24> shall be obtained.

11.<NRC_37> shall be obtained till <time> and after that <Res_Seed> should be obtained. 

12. <Res_Key> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req_Seed' => 
	SCALAR 'Res_Seed' => 
	SCALAR 'Req_WrongKey' => 
	SCALAR 'Req_SendKey' => 
	SCALAR 'Res_Key' => 
	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Session' => 
	SCALAR 'level' => 
	SCALAR 'time' => 
	SCALAR 'NRC_36' => 
	SCALAR 'NRC_37' => 
	SCALAR 'NRC_24' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To verify the condition for NRC36 and NRC37'
	# input parameters
	AddressingMode = 'Physical'
	Session = 'Extended'
	level = '<Test Heading 2>'
	time = '10000' #ms
	# output parameters
	NRC_36  = '7F 27 36'
	NRC_37 = '7F 27 37'
	NRC_24 = '7F 27 24'
	Req_Seed ='27 01'
	Res_Seed = '0x67 0x1 S1 S2 S3 S4'
	Req_WrongKey  = '27 02 11 22 33 44'
	Req_SendKey = '27 02 K1 K2 K3 K4'
	Res_Key = '67 02'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Session;
my $tcpar_level;
my $tcpar_time;
my $tcpar_NRC_36;
my $tcpar_NRC_37;
my $tcpar_NRC_24;
my $tcpar_Req_Seed;
my $tcpar_Res_Seed;
my $tcpar_Req_WrongKey;
my $tcpar_Req_SendKey;
my $tcpar_Res_Key;

################ global parameter declaration ###################
#add any global variables here
my $resseed1;
my $reskey1;
my $resseed2;
my $resseed2_Positive;
my $reskey2;
my $resseed3;
my $reskey3;
my $resseed4;
my $resseed4_Positive;
my $reskey4;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_level =  GEN_Read_mandatory_testcase_parameter( 'level' );
	$tcpar_time =  GEN_Read_mandatory_testcase_parameter( 'time' );
	$tcpar_NRC_36 =  GEN_Read_mandatory_testcase_parameter( 'NRC_36' );
	$tcpar_NRC_37 =  GEN_Read_mandatory_testcase_parameter( 'NRC_37' );
	$tcpar_NRC_24 =  GEN_Read_mandatory_testcase_parameter( 'NRC_24' );
	$tcpar_Req_Seed =  GEN_Read_mandatory_testcase_parameter( 'Req_Seed' );
	$tcpar_Res_Seed =  GEN_Read_mandatory_testcase_parameter( 'Res_Seed' );
	$tcpar_Req_WrongKey =  GEN_Read_mandatory_testcase_parameter( 'Req_WrongKey' );
	$tcpar_Req_SendKey =  GEN_Read_mandatory_testcase_parameter( 'Req_SendKey' );
	$tcpar_Res_Key =  GEN_Read_mandatory_testcase_parameter( 'Res_Key' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
		
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode'.", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Enter '$tcpar_Session'.", 'AUTO_NBR');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	
	S_teststep("Send '$tcpar_Req_Seed' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_seed_A');			#measurement 1
	$resseed1 = _reqseed1($tcpar_level,$tcpar_Req_Seed);
	
	S_teststep("Send '$tcpar_Req_WrongKey' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_wrongkeyas_A');			#measurement 2
	$reskey1 = GDCOM_request($tcpar_Req_WrongKey,$tcpar_NRC_36,'strict');
	
	S_teststep("Send '$tcpar_Req_Seed' for '$tcpar_time' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_seed_B');			#measurement 3
	$resseed2 = GDCOM_request($tcpar_Req_Seed,$tcpar_NRC_37,'strict');
	S_wait_ms($tcpar_time);
	#$resseed2_Positive = _reqseed2($tcpar_level,$tcpar_time);
	
	S_teststep("Send '$tcpar_Req_SendKey' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_sendkeyas');			#measurement 4
	$reskey2 = _reqres_key($tcpar_level);
	
	S_teststep("Make IGN Reset and repeat Step2 to Step5.", 'AUTO_NBR', 'make_ign_reset');			#measurement 5
	_clearsecurity($tcpar_level);
	LC_ECU_Reset();
	
	S_teststep("Enter '$tcpar_Session'.", 'AUTO_NBR');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	
	S_teststep("Send '$tcpar_Req_Seed' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_seed_C');			#measurement 6
	$resseed3 = GDCOM_request($tcpar_Req_Seed,$tcpar_NRC_37,'strict');
	
	S_teststep("Send '$tcpar_Req_WrongKey' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_wrongkeyas_B');			#measurement 7
	$reskey3 = GDCOM_request($tcpar_Req_WrongKey,$tcpar_NRC_24,'strict');
	
	S_teststep("Send '$tcpar_Req_Seed' for '$tcpar_time' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_seed_D');			#measurement 8
	$resseed4 = GDCOM_request($tcpar_Req_Seed,$tcpar_NRC_37,'strict');
	$resseed4_Positive = _reqseed2($tcpar_level,$tcpar_time);
	
	S_teststep("Send '$tcpar_Req_SendKey' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_sendkey');			#measurement 9
	$reskey4 = _reqres_key($tcpar_level);
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Res_Seed' should be obtained within 100ms.", 'send_req_seed_A');			#evaluation 1
	S_teststep_detected("Response seed is observed $resseed1", 'send_req_seed_A');
	_evalseed($tcpar_level,$resseed1);
	
	S_teststep_expected("'$tcpar_NRC_36' shall be obtained.", 'send_req_wrongkeyas_A');			#evaluation 2
	S_teststep_detected("Response is observed $reskey1", 'send_req_wrongkeyas_A');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_36,$reskey1);
	
	S_teststep_expected("'$tcpar_NRC_37' shall be obtained till '$tcpar_time' and after that '$tcpar_Res_Seed' should be obtained.", 'send_req_seed_B');			#evaluation 3
	S_teststep_detected("Before timer NRC37 should be observed is $resseed2", 'send_req_seed_B');
	S_teststep_detected("After timer response seed should be observed is $resseed2_Positive", 'send_req_seed_B');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_37,$resseed2);
	_evalseed($tcpar_level,$resseed2_Positive);
	
	S_teststep_expected("'$tcpar_Res_Key' should be obtained.", 'send_req_sendkeyas');			#evaluation 4
	S_teststep_detected("Response key access shoule be $reskey2", 'send_req_sendkeyas');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_Key,$reskey2);
	
	S_teststep_expected("Same response from Step3 to Step5 should be observed.", 'make_ign_reset');			#evaluation 5
	S_teststep_detected("Same response from Step3 to Step5 should be observed", 'make_ign_reset');

	S_teststep_expected("'$tcpar_NRC_37' should be obtained within 100ms.", 'send_req_seed_C');			#evaluation 6
	S_teststep_detected("NRC37 should be observed is $resseed3", 'send_req_seed_C');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_37,$resseed3);
	
	S_teststep_expected("'$tcpar_NRC_24' shall be obtained.", 'send_req_wrongkeyas_B');			#evaluation 7
	S_teststep_detected("NRC37 should be observed is $reskey3", 'send_req_wrongkeyas_B');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_24,$reskey3);
	
	S_teststep_expected("'$tcpar_NRC_37' shall be obtained till '$tcpar_time' and after that '$tcpar_Res_Seed' should be obtained. ", 'send_req_seed_D');			#evaluation 8
	S_teststep_detected("Before timer NRC37 should be observed is $resseed4", 'send_req_seed_D');
	S_teststep_detected("After timer response seed should be observed is $resseed4_Positive", 'send_req_seed_D');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_37,$resseed4);
	_evalseed($tcpar_level,$resseed4_Positive);
	
	S_teststep_expected("'$tcpar_Res_Key' should be obtained.", 'send_req_sendkey');			#evaluation 9
	S_teststep_detected("Response key access shoule be $reskey4", 'send_req_sendkey');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_Key,$reskey4);
	return 1;
}

sub TC_finalization {
	_clearsecurity($tcpar_level);
	return 1;
}

sub _reqseed2{
	my $sub_level1 = shift;
	my $sub_timer = shift;
	my $sub_res1;
	my $sub_response1;
	my @Sub_arrResponse1;
	if ($sub_level1 eq 'Level1')
	{
		CA_set_EnvVar_value('Security01', 1);
	}
	elsif ($sub_level1 eq 'Level2')
	{
		CA_set_EnvVar_value('Security03', 1);
	}
	elsif ($sub_level1 eq 'Level3')
	{
		CA_set_EnvVar_value('Security05', 1);
	}
	S_wait_ms($sub_timer);
	$sub_res1 = CA_get_EnvVar_value('EvRxMesgBox');
	for (my $i = 0; $i< @$sub_res1; $i++){
		@Sub_arrResponse1[$i] = @$sub_res1[$i];
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

sub _reqseed1{
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

sub _evalseed{
	my $sublevel = shift;
	my $sub_resrandom = shift;
	my $sub_Res_Seed = shift;
	my @resseed = split(/ /,$sub_resrandom);
	EVAL_evaluate_value("Checking value of byte 1", @resseed[0],'==',0x67);
	if($sublevel eq 'Level1')
	{
		EVAL_evaluate_value("Checking value of byte 2", @resseed[1],'==',0x1);
	}elsif($sublevel eq 'Level2')
	{
		EVAL_evaluate_value("Checking value of byte 2", @resseed[1],'==',0x3);
	}elsif($sublevel eq 'Level3')
	{
		EVAL_evaluate_value("Checking value of byte 2", @resseed[1],'==',0x5);
	}
	EVAL_evaluate_value("Checking value of byte 3", @resseed[2],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 4", @resseed[3],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 5", @resseed[4],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 6", @resseed[5],'!=',0x00);
}

sub _reqres_key{
	my $sub_level = shift;
	my $sub_res;
	my $sub_response;
	my @Sub_arrResponse;
	if ($sub_level eq 'Level1')
	{
		CA_set_EnvVar_value('Security01', 1);
	}
	elsif ($sub_level eq 'Level2')
	{
		CA_set_EnvVar_value('Security03', 1);
	}
	elsif ($sub_level eq 'Level3')
	{
		CA_set_EnvVar_value('Security05', 1);
	}
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

sub _clearsecurity{
	my $sub_levelsecu = shift;
	if ($sub_levelsecu eq 'Level1')
	{
		CA_set_EnvVar_value('Security01', 0);
	}
	elsif ($sub_levelsecu eq 'Level2')
	{
		CA_set_EnvVar_value('Security03', 0);
	}
	elsif ($sub_levelsecu eq 'Level3')
	{
		CA_set_EnvVar_value('Security05', 0);
	}
	S_wait_ms(1000);
	return 1;
}
1;
