#### TEST CASE MODULE
package TC_DSM_service27_NRC13;

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

our $PURPOSE = "check NRC13 for service27";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_service27_NRC13

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> in <Protocol>

2. Enter <Session>.

3. Send <Req_WrongSeed1> as <level> security access.

4. Send <Req_WrongSeed2> as <level> security access.


I<B<Evaluation>>

1.

2.

3. <NRC13> shall be obtained.

4. <NRC13> shall be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req_WrongSeed1' => 
	SCALAR 'Req_WrongSeed2' => 
	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'level' => 
	SCALAR 'NRC13' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To verify the condition for NRC13'
	# input parameters
	AddressingMode = 'Physical'
	Protocol = 'UDS'
	Session = 'Extended'
	level = '<Test Heading 2>'
	# output parameters
	NRC13  = '0x7F 0x27 0x13'
	Req_WrongSeed1 = '01 27 01'
	Req_WrongSeed2 = '03 27 01 03'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_level;
my $tcpar_NRC13;
my $tcpar_Req_WrongSeed1;
my $tcpar_Req_WrongSeed2;

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
	$tcpar_level =  GEN_Read_mandatory_testcase_parameter( 'level' );
	$tcpar_NRC13 =  GEN_Read_mandatory_testcase_parameter( 'NRC13' );
	$tcpar_Req_WrongSeed1 =  GEN_Read_mandatory_testcase_parameter( 'Req_WrongSeed1' );
	$tcpar_Req_WrongSeed2 =  GEN_Read_mandatory_testcase_parameter( 'Req_WrongSeed2' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' in '$tcpar_Protocol'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Enter '$tcpar_Session'.", 'AUTO_NBR');
	GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
	
	S_teststep("Send '$tcpar_Req_WrongSeed1' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_wrongseed1');			#measurement 1
	$res1 = _ReqRes($tcpar_Req_WrongSeed1);
	
	S_teststep("Send '$tcpar_Req_WrongSeed2' as '$tcpar_level' security access.", 'AUTO_NBR', 'send_req_wrongseed2');			#measurement 2
	$res2 = _ReqRes($tcpar_Req_WrongSeed2);
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NRC13' shall be obtained.", 'send_req_wrongseed1');			#evaluation 1
	S_teststep_detected("Negative response should be observed is $res1", 'send_req_wrongseed1');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC13,$res1);
	
	S_teststep_expected("'$tcpar_NRC13' shall be obtained.", 'send_req_wrongseed2');			#evaluation 2
	S_teststep_detected("Negative response should be observed is $res2", 'send_req_wrongseed2');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC13,$res2);
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
