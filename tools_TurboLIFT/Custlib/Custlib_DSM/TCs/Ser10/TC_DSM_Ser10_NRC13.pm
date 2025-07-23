#### TEST CASE MODULE
package TC_DSM_Ser10_NRC13;

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

our $PURPOSE = "To check behavior of NRC13 in session control";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Ser10_NRC13

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Send <Req1_DefaultSession>

2. Send <Req2_DefaultSession>

3. Send <Req1_ExtendedSession>

4. Send <Req2_ExtendedSession>


I<B<Evaluation>>

1. <NRC_13> should be obtained.

2. <NRC_13> should be obtained.

3. <NRC_13> should be obtained.

4. <NRC_13> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req1_DefaultSession' => 
	SCALAR 'Req2_DefaultSession' => 
	SCALAR 'Req1_ExtendedSession' => 
	SCALAR 'Req2_ExtendedSession' => 
	SCALAR 'purpose' => 
	SCALAR 'NRC_13' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response when Invalid length is provided'
	
	# input parameters
	
	# output parameters
	NRC_13 = '0x7F 0x10 0x13'
	Req1_DefaultSession = '01 10 01' #length = 1
	Req2_DefaultSession = '03 10 01' #length = 3
	Req1_ExtendedSession = '01 10 03' #length = 1
	Req2_ExtendedSession = '05 10 03 00 00' #length = 5

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_NRC_13;
my $tcpar_Req1_DefaultSession;
my $tcpar_Req2_DefaultSession;
my $tcpar_Req1_ExtendedSession;
my $tcpar_Req2_ExtendedSession;

################ global parameter declaration ###################
#add any global variables here
my $default_dlc1;
my $default_dlc3;
my $extent_dlc1;
my $extent_dlc5;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_NRC_13 =  GEN_Read_mandatory_testcase_parameter( 'NRC_13' );
	$tcpar_Req1_DefaultSession =  GEN_Read_mandatory_testcase_parameter( 'Req1_DefaultSession' );
	$tcpar_Req2_DefaultSession =  GEN_Read_mandatory_testcase_parameter( 'Req2_DefaultSession' );
	$tcpar_Req1_ExtendedSession =  GEN_Read_mandatory_testcase_parameter( 'Req1_ExtendedSession' );
	$tcpar_Req2_ExtendedSession =  GEN_Read_mandatory_testcase_parameter( 'Req2_ExtendedSession' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Send '$tcpar_Req1_DefaultSession'", 'AUTO_NBR', 'send_req1_defaultsession');			#measurement 1
	$default_dlc1=_ReqRes($tcpar_Req1_DefaultSession);
	S_teststep("Send '$tcpar_Req2_DefaultSession'", 'AUTO_NBR', 'send_req2_defaultsession');			#measurement 2
	$default_dlc3=_ReqRes($tcpar_Req2_DefaultSession);
	S_teststep("Send '$tcpar_Req1_ExtendedSession'", 'AUTO_NBR', 'send_req1_extendedsession');			#measurement 3
	$extent_dlc1 =_ReqRes($tcpar_Req1_ExtendedSession);
	S_teststep("Send '$tcpar_Req2_ExtendedSession'", 'AUTO_NBR', 'send_req2_extendedsession');			#measurement 4
	$extent_dlc5 =_ReqRes($tcpar_Req2_ExtendedSession);
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NRC_13' should be obtained.", 'send_req1_defaultsession');			#evaluation 1
	S_teststep_detected("Response is $default_dlc1 ", 'send_req1_defaultsession');
	EVAL_evaluate_string("Evaluating response",$tcpar_NRC_13,$default_dlc1);
	
	S_teststep_expected("'$tcpar_NRC_13' should be obtained.", 'send_req2_defaultsession');			#evaluation 2
	S_teststep_detected("Response is $default_dlc3 ", 'send_req2_defaultsession');
	EVAL_evaluate_string("Evaluating response",$tcpar_NRC_13,$default_dlc3);
	
	S_teststep_expected("'$tcpar_NRC_13' should be obtained.", 'send_req1_extendedsession');			#evaluation 3
	S_teststep_detected("Response is $extent_dlc1 ", 'send_req1_extendedsession');
	EVAL_evaluate_string("Evaluating response",$tcpar_NRC_13,$extent_dlc1);
	
	S_teststep_expected("'$tcpar_NRC_13' should be obtained.", 'send_req2_extendedsession');			#evaluation 4
	S_teststep_detected("Response is $extent_dlc5 ", 'send_req2_extendedsession');
	EVAL_evaluate_string("Evaluating response",$tcpar_NRC_13,$extent_dlc5);
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
