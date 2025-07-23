#### TEST CASE MODULE
package TC_DSM_SecurityAccess_SeedRandom;

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

our $PURPOSE = "check random of seed bytes when request seed 4 times";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_SecurityAccess_SeedRandom

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>.

2. Enter  <Session>

3. Send 1st <Req_Seed> as <level> security access.

4.Send 2nd <Req_Seed> as <level> security access.

5.Send 3rd <Req_Seed> as <level> security access.

6.Send 4rd <Req_Seed> as <level> security access.

7. Send <Req_Key>  followed by key calculated from 4rd seed bytes.


I<B<Evaluation>>

1.

2.

3. Positive response <Res_Seed1>  should be obtained.

4.Positive response <Res_Seed2>  should be obtained.

5.Positive response <Res_Seed3>  should be obtained.

6.Positive response <Res_Seed4>  should be obtained.

7.Positive response for access key <Res_Key> should be obtained as <level>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req_Seed' => 
	SCALAR 'Res_Seed1' => 
	SCALAR 'Res_Seed2' => 
	SCALAR 'Res_Seed3' => 
	SCALAR 'Res_Seed4' => 
	SCALAR 'Req_Key' => 
	SCALAR 'Res_Key' => 
	SCALAR 'Purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'level' => 


=head2 PARAMETER EXAMPLES

	Purpose = 'To check whether Seed is a random value for each request'
	
	# input parameters
	AddressingMode = 'Physical'
	Protocol = 'UDS'
	Session = 'Extended'
	level = '<Test Heading 2>'
	Req_Seed = '27 01'
	Res_Seed1 = '0x67 0x1 S11 S21 S31 S41'
	Res_Seed2 = '0x67 0x1 S12 S22 S32 S42'
	Res_Seed3 = '0x67 0x1 S13 S23 S33 S43'
	Res_Seed4 = '0x67 0x1 S14 S24 S34 S44'
	Req_Key = '27 02 K14 K24 K34 K44'
	Res_Key = '0x67 0x2'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_level;
my $tcpar_Req_Seed;
my $tcpar_Res_Seed1;
my $tcpar_Res_Seed2;
my $tcpar_Res_Seed3;
my $tcpar_Res_Seed4;
my $tcpar_Req_Key;
my $tcpar_Res_Key;

################ global parameter declaration ###################
#add any global variables here
my $res_seed1;
my $res_seed2;
my $res_seed3;
my $res_seed4;
my $res_key;
###############################################################

sub TC_set_parameters {

	$tcpar_Purpose =  GEN_Read_mandatory_testcase_parameter( 'Purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_level =  GEN_Read_mandatory_testcase_parameter( 'level' );
	$tcpar_Req_Seed =  GEN_Read_mandatory_testcase_parameter( 'Req_Seed' );
	$tcpar_Res_Seed1 =  GEN_Read_mandatory_testcase_parameter( 'Res_Seed1' );
	$tcpar_Res_Seed2 =  GEN_Read_mandatory_testcase_parameter( 'Res_Seed2' );
	$tcpar_Res_Seed3 =  GEN_Read_mandatory_testcase_parameter( 'Res_Seed3' );
	$tcpar_Res_Seed4 =  GEN_Read_mandatory_testcase_parameter( 'Res_Seed4' );
	$tcpar_Req_Key =  GEN_Read_mandatory_testcase_parameter( 'Req_Key' );
	$tcpar_Res_Key =  GEN_Read_mandatory_testcase_parameter( 'Res_Key' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' for '$tcpar_Protocol'.", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Enter  '$tcpar_Session'", 'AUTO_NBR');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	
	S_teststep("Send 1st '$tcpar_Req_Seed' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_1st_req');			#measurement 1
	$res_seed1 = _reqseed123($tcpar_level,$tcpar_Req_Seed);
	S_w2rep("print $res_seed1", 'green');
	
	S_teststep("Send 2nd '$tcpar_Req_Seed' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_2nd_req');			#measurement 2
	$res_seed2 = _reqseed123($tcpar_level,$tcpar_Req_Seed);
	S_w2rep("print $res_seed2", 'green');
	
	S_teststep("Send 3rd '$tcpar_Req_Seed' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_3rd_req');			#measurement 3
	$res_seed3 = _reqseed123($tcpar_level,$tcpar_Req_Seed);
	S_w2rep("print $res_seed3", 'green');
	
	S_teststep("Send 4rd '$tcpar_Req_Seed' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_4rd_req');			#measurement 4
	$res_seed4 = _reqres_seed($tcpar_level);
	S_w2rep("print $res_seed4", 'green');
	
	S_teststep("Send '$tcpar_Req_Key'  followed by key calculated from 4rd seed bytes.", 'AUTO_NBR', 'send_req_key');			#measurement 5
	$res_key = _reqres_key($tcpar_level);
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Positive response '$tcpar_Res_Seed1'  should be obtained.", 'send_1st_req');			#evaluation 1
	S_teststep_detected("positive response should be $res_seed1", 'send_1st_req');
	_evalseed($tcpar_level,$res_seed1,$tcpar_Res_Seed1);
	
	S_teststep_expected("Positive response '$tcpar_Res_Seed2'  should be obtained.", 'send_2nd_req');			#evaluation 2
	S_teststep_detected("positive response should be $res_seed2", 'send_2nd_req');
	_evalseed($tcpar_level,$res_seed2,$tcpar_Res_Seed2);
	
	S_teststep_expected("Positive response '$tcpar_Res_Seed3'  should be obtained.", 'send_3rd_req');			#evaluation 3
	S_teststep_detected("positive response should be $res_seed3", 'send_3rd_req');
	_evalseed($tcpar_level,$res_seed3,$tcpar_Res_Seed3);
	
	S_teststep_expected("Positive response '$tcpar_Res_Seed4'  should be obtained.", 'send_4rd_req');			#evaluation 4
	S_teststep_detected("positive response should be $res_seed4", 'send_4rd_req');
	_evalseed($tcpar_level,$res_seed4,$tcpar_Res_Seed4);
	
	S_teststep_expected("Positive response for access key '$tcpar_Res_Key' should be obtained as '$tcpar_level'.", 'send_req_key');			#evaluation 5
	S_teststep_detected("positive response should be $res_key", 'send_req_key');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_Key,$res_key);

	return 1;
}

sub TC_finalization {
	_clearsecurity($tcpar_level);
	return 1;
}

sub _reqres_seed{
	my $sub_level1 = shift;
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
	S_wait_ms(100);
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

sub _reqseed123{
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
