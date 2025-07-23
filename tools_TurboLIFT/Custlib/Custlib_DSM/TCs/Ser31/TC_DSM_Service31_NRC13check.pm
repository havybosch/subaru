#### TEST CASE MODULE
package TC_DSM_Service31_NRC13check;

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

our $PURPOSE = "Check NRC13 for service31";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service31_NRC13check

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Send <WrongReq1_StartRoutine> 

3. Send <WrongReq2_StartRoutine> 

4. Send <WrongReq3_RequestResult> 

5. Send <WrongReq4_RequestResult> 


I<B<Evaluation>>

1. 

2. Response <NRC_13> should be obtained

3. Response <NRC_13> should be obtained

4. Response <NRC_13> should be obtained

5. Response <NRC_13> should be obtained	


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'WrongReq1_StartRoutine' => 
	SCALAR 'WrongReq2_StartRoutine' => 
	SCALAR 'WrongReq3_RequestResult' => 
	SCALAR 'WrongReq4_RequestResult' => 
	SCALAR 'NRC_13' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check Response of $31 service when wrong msg length is provided'
	
	# input parameters
	Session = @('default','extended')
	WrongReq1_StartRoutine = '03 31 01 AC AC'  #length=3
	WrongReq2_StartRoutine = '05 31 01 AC AC'  #length=5
	WrongReq3_RequestResult = '03 31 03 AC AC' #length =3
	WrongReq4_RequestResult = '05 31 03 AC AC' #length =5
	
	# output parameters
	NRC_13= '0x7F 0x31 0x13'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Session;
my $tcpar_WrongReq1_StartRoutine;
my $tcpar_WrongReq2_StartRoutine;
my $tcpar_WrongReq3_RequestResult;
my $tcpar_WrongReq4_RequestResult;
my $tcpar_NRC_13;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my %res3;
my %res4;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WrongReq1_StartRoutine =  GEN_Read_mandatory_testcase_parameter( 'WrongReq1_StartRoutine' );
	$tcpar_WrongReq2_StartRoutine =  GEN_Read_mandatory_testcase_parameter( 'WrongReq2_StartRoutine' );
	$tcpar_WrongReq3_RequestResult =  GEN_Read_mandatory_testcase_parameter( 'WrongReq3_RequestResult' );
	$tcpar_WrongReq4_RequestResult =  GEN_Read_mandatory_testcase_parameter( 'WrongReq4_RequestResult' );
	$tcpar_NRC_13 =  GEN_Read_mandatory_testcase_parameter( 'NRC_13' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {
	foreach my $ses(@tcpar_Session)
	{			
		my $res;
		S_teststep("Enter to $ses session ", 'AUTO_NBR',"enter_supported_session_$ses");
		if ($ses =~/default/)
		{
			S_w2rep("Enter default session", 'Purple');
			$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
		}				
		elsif($ses =~ /extended/)
		{
			S_w2rep("Enter Extended session", 'Purple');
			$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
		}		
			
		S_teststep("Send '$tcpar_WrongReq1_StartRoutine' ", 'AUTO_NBR', "send_wrongreq1_startroutine_$ses");			#measurement 1
		$res1{$ses}= _ReqRes($tcpar_WrongReq1_StartRoutine);
		S_teststep("Send '$tcpar_WrongReq2_StartRoutine' ", 'AUTO_NBR', "send_wrongreq2_startroutine_$ses");			#measurement 2
		$res2{$ses}= _ReqRes($tcpar_WrongReq2_StartRoutine);
		S_teststep("Send '$tcpar_WrongReq3_RequestResult' ", 'AUTO_NBR', "send_wrongreq3_requestresult_$ses");			#measurement 3
		$res3{$ses}= _ReqRes($tcpar_WrongReq3_RequestResult);
		S_teststep("Send '$tcpar_WrongReq4_RequestResult' ", 'AUTO_NBR', "send_wrongreq4_requestresult_$ses");			#measurement 4
		$res4{$ses}= _ReqRes($tcpar_WrongReq4_RequestResult);
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - Response '$tcpar_NRC_13' should be obtained", "send_wrongreq1_startroutine_$ses");			#evaluation 1
		S_teststep_detected("$ses - NRC response should be $res1{$ses}", "send_wrongreq1_startroutine_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res1{$ses});
		
		S_teststep_expected("$ses -Response '$tcpar_NRC_13' should be obtained", "send_wrongreq2_startroutine_$ses");			#evaluation 2
		S_teststep_detected("$ses - NRC response should be $res2{$ses}", "send_wrongreq2_startroutine_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res2{$ses});
		
		S_teststep_expected("$ses - Response '$tcpar_NRC_13' should be obtained", "send_wrongreq3_requestresult_$ses");			#evaluation 3
		S_teststep_detected("$ses - NRC response should be $res3{$ses}", "send_wrongreq3_requestresult_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res3{$ses});
		
		S_teststep_expected("$ses - Response '$tcpar_NRC_13' should be obtained", "send_wrongreq4_requestresult_$ses");			#evaluation 4
		S_teststep_detected("$ses - NRC response should be $res4{$ses}", "send_wrongreq4_requestresult_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res4{$ses});
	}
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
