#### TEST CASE MODULE
package TC_DSM_Service27_PositiveResponseCheck;

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

our $PURPOSE = "To test the request and response format of Security Access service";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service27_PositiveResponseCheck

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>.

2. Enter <Session>

3. Send <Req_Seed> as <level> security access

4. Send <Req_Key>  followed by key calculated from seed as <level> security access.


I<B<Evaluation>>

1.

2.

3. <Res_Seed> should be obtained within 100ms.

4. <Res_Key> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req_Seed' => 
	SCALAR 'Req_Key' => 
	SCALAR 'Res_Seed' => 
	SCALAR 'Res_Key' => 
	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'level' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To test the request and response format of Security Access service'
	
	# input parameters
	AddressingMode = 'Physical'
	Protocol = 'UDS'
	Session = 'Extended'
	level = '<Test Heading 2>'
	Req_Seed = '27 01' 
	Req_Key = '27 02 K1 K2 K3 K4'
	Res_Seed = '67 01 S1 S2 S3 S4'
	Res_Key = '67 02 00 00 00 00'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_level;
my $tcpar_Req_Seed;
my $tcpar_Req_Key;
my $tcpar_Res_Seed;
my $tcpar_Res_Key;

################ global parameter declaration ###################
#add any global variables here
my $res_seed;
my $res_key;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_level =  GEN_Read_mandatory_testcase_parameter( 'level' );
	$tcpar_Req_Seed =  GEN_Read_mandatory_testcase_parameter( 'Req_Seed' );
	$tcpar_Req_Key =  GEN_Read_mandatory_testcase_parameter( 'Req_Key' );
	$tcpar_Res_Seed =  GEN_Read_mandatory_testcase_parameter( 'Res_Seed' );
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
	
	S_teststep("Enter '$tcpar_Session'", 'AUTO_NBR');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	
	S_teststep("Send '$tcpar_Req_Seed' as '$tcpar_level' security access", 'AUTO_NBR', 'send_req_seed');			#measurement 1
	$res_seed = _reqres_seed($tcpar_level);
	
	S_teststep("Send '$tcpar_Req_Key'  followed by key calculated from seed as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_key');			#measurement 2
	$res_key= _reqres_key($tcpar_level);

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Res_Seed' should be obtained within 100ms.", 'send_req_seed');			#evaluation 1
	S_teststep_detected("positive response should be $res_seed", 'send_req_seed');
	my @resseed = split(/ /,$res_seed);
	if ($tcpar_Res_Seed eq '0x67 0x1 S1 S2 S3 S4'){
		EVAL_evaluate_value("Checking value of byte 1", @resseed[0],'==',0x67);
		EVAL_evaluate_value("Checking value of byte 2", @resseed[1],'==',0x1);
	}elsif($tcpar_Res_Seed eq '0x67 0x3 S1 S2 S3 S4'){
		EVAL_evaluate_value("Checking value of byte 1", @resseed[0],'==',0x67);
		EVAL_evaluate_value("Checking value of byte 2", @resseed[1],'==',0x3);
	}elsif($tcpar_Res_Seed eq '0x67 0x5 S1 S2 S3 S4'){
		EVAL_evaluate_value("Checking value of byte 1", @resseed[0],'==',0x67);
		EVAL_evaluate_value("Checking value of byte 2", @resseed[1],'==',0x5);
	}
	EVAL_evaluate_value("Checking value of byte 3", @resseed[2],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 4", @resseed[3],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 5", @resseed[4],'!=',0x00);
	EVAL_evaluate_value("Checking value of byte 6", @resseed[5],'!=',0x00);
		
	S_teststep_expected("'$tcpar_Res_Key' should be obtained.", 'send_req_key');			#evaluation 2
	S_teststep_detected("positive response should be $res_key", 'send_req_key');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_Key,$res_key);
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
1;
