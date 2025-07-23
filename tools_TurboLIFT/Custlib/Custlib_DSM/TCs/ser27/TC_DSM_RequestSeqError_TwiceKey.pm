#### TEST CASE MODULE
package TC_DSM_RequestSeqError_TwiceKey;

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

our $PURPOSE = "to check NRC24 for service27 when key sent 2 times";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_RequestSeqError_TwiceKey

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> and <Protocol>

2. Enter <Session>

3. Send <Req_Seed> as <level> security access.

4. Send 1st request key <Req_Key> as <level> security access.

5. Send 2nd request key <Req_Key> as <level> security access.


I<B<Evaluation>>

1.  

2. 

3. <Res_Seed> should be obtained within 100ms.

4.

5. <NRC> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req_Seed' => 
	SCALAR 'Req_Key' => 
	SCALAR 'Res_Seed' => 
	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'level' => 
	SCALAR 'NRC' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To verify that NRC24 shall be sent Send Key is sent twice times after sending Request Seed'
	# input parameters
	AddressingMode = 'Physical'
	Protocol = 'UDS'
	Session = 'Extended'
	level = '<Test Heading 2>'
	# output parameters
	NRC  = '0x7F 0x27 0x24'
	Req_Seed = '27 01'
	Req_Key = '27 02 K1 K2 K3 K4'
	Res_Seed = '0x67 0x1 S1 S2 S3 S4'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_level;
my $tcpar_NRC;
my $tcpar_Req_Seed;
my $tcpar_Req_Key;
my $tcpar_Res_Seed;

################ global parameter declaration ###################
#add any global variables here
my $res_seed;
my $res_key1;
my $res_key2;
my $reskey_monitor;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_level =  GEN_Read_mandatory_testcase_parameter( 'level' );
	$tcpar_NRC =  GEN_Read_mandatory_testcase_parameter( 'NRC' );
	$tcpar_Req_Seed =  GEN_Read_mandatory_testcase_parameter( 'Req_Seed' );
	$tcpar_Req_Key =  GEN_Read_mandatory_testcase_parameter( 'Req_Key' );
	$tcpar_Res_Seed =  GEN_Read_mandatory_testcase_parameter( 'Res_Seed' );

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
	$res_seed = _reqseed($tcpar_level,$tcpar_Req_Seed);
	
	S_teststep("Send 1st request key '$tcpar_Req_Key' as '$tcpar_level' security access.", 'AUTO_NBR');
	$res_key1 =  _reqres_key($tcpar_level);
	S_w2rep("print $res_key1", 'green');
		
	S_teststep("Send 2nd request key '$tcpar_Req_Key' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_2nd_request');			#measurement 2
	$res_key2 = _reqres_key($tcpar_level);	
	S_w2rep("print $res_key2", 'green');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Res_Seed' should be obtained within 100ms.", 'send_req_seed');			#evaluation 1
	S_teststep_detected("positive seed response should be $res_seed ", 'send_req_seed');
	_evalseed($tcpar_level,$res_seed,$tcpar_Res_Seed);
	
	S_teststep_expected("'$tcpar_NRC' should be obtained.", 'send_2nd_request');			#evaluation 2
	S_teststep_detected("NRC24 should be observed is ", 'send_2nd_request');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC,$res_key2);
	return 1;
}

sub TC_finalization {
	if ($tcpar_level eq 'Level1')
	{
		CA_set_EnvVar_value('Security01', 0);
	}
	elsif ($tcpar_level eq 'Level2')
	{
		CA_set_EnvVar_value('Security03', 0);
	}
	elsif ($tcpar_level eq 'Level3')
	{
		CA_set_EnvVar_value('Security05', 0);
	}
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
1;
