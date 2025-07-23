#### TEST CASE MODULE
package TC_DSM_Service19_NRC13;

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

our $PURPOSE = "To check response of $19 service wrong msg length is provided";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service19_NRC13

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session> in <Addressing_Mode>

2. Send <WrongLength_Req1>

3.  Send <WrongLength_Req2>

4.  Send <WrongLength_Req3>

5.  Send <WrongLength_Req4>

6. Send <WrongLength_Req5>

7.  Send <WrongLength_Req6>


I<B<Evaluation>>

1.

2. <NRC_13> should be obtained.

3. <NRC_13> should be obtained.

4.<NRC_13> should be obtained.

5. <NRC_13> should be obtained.

6.<NRC_13> should be obtained.

7. <NRC_13> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'Addressing_Mode' => 
	SCALAR 'WrongLength_Req1' => 
	SCALAR 'WrongLength_Req2' => 
	SCALAR 'WrongLength_Req3' => 
	SCALAR 'WrongLength_Req4' => 
	SCALAR 'WrongLength_Req5' => 
	SCALAR 'WrongLength_Req6' => 
	SCALAR 'NRC_13' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $19 service wrong msg length is provided'
	
	# input parameters
	Session =@('default','extended')
	Addressing_Mode ='<Fetch {Addressing Mode}>'
	WrongLength_Req1 = '02 19 01'  #length = 02
	WrongLength_Req2 = '02 19 02'  #length = 02
	WrongLength_Req3 = '02 19 05'  #length = 02
	WrongLength_Req4 = '04 19 05 03 01'  #length = 04
	WrongLength_Req5 = '01 19 15'  #length = 01
	WrongLength_Req6 = '03 19 15 01'  #length = 03
	
	# output parameters
	NRC_13 = '0x7F 0x19 0x13'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Session;
my $tcpar_Addressing_Mode;
my $tcpar_WrongLength_Req1;
my $tcpar_WrongLength_Req2;
my $tcpar_WrongLength_Req3;
my $tcpar_WrongLength_Req4;
my $tcpar_WrongLength_Req5;
my $tcpar_WrongLength_Req6;
my $tcpar_NRC_13;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my %res3;
my %res4;
my %res5;
my %res6;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_WrongLength_Req1 =  GEN_Read_mandatory_testcase_parameter( 'WrongLength_Req1' );
	$tcpar_WrongLength_Req2 =  GEN_Read_mandatory_testcase_parameter( 'WrongLength_Req2' );
	$tcpar_WrongLength_Req3 =  GEN_Read_mandatory_testcase_parameter( 'WrongLength_Req3' );
	$tcpar_WrongLength_Req4 =  GEN_Read_mandatory_testcase_parameter( 'WrongLength_Req4' );
	$tcpar_WrongLength_Req5 =  GEN_Read_mandatory_testcase_parameter( 'WrongLength_Req5' );
	$tcpar_WrongLength_Req6 =  GEN_Read_mandatory_testcase_parameter( 'WrongLength_Req6' );
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
		S_teststep("Enter to $ses session in '$tcpar_Addressing_Mode'", 'AUTO_NBR',"enter_supported_session_$ses");
		GDCOM_set_addressing_mode($tcpar_Addressing_Mode);
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
		
		S_teststep("Send '$tcpar_WrongLength_Req1'", 'AUTO_NBR', "send_wronglength_req1_$ses");			#measurement 1
		$res1{$ses} = _ReqRes($tcpar_WrongLength_Req1);
		
		S_teststep("Send '$tcpar_WrongLength_Req2'", 'AUTO_NBR', "send_wronglength_req2_$ses");			#measurement 2
		$res2{$ses} = _ReqRes($tcpar_WrongLength_Req2);
		
		S_teststep("Send '$tcpar_WrongLength_Req3'", 'AUTO_NBR', "send_wronglength_req3_$ses");			#measurement 3
		$res3{$ses} = _ReqRes($tcpar_WrongLength_Req3);
		
		S_teststep("Send '$tcpar_WrongLength_Req4'", 'AUTO_NBR', "send_wronglength_req4_$ses");			#measurement 4
		$res4{$ses} = _ReqRes($tcpar_WrongLength_Req4);
		
		S_teststep("Send '$tcpar_WrongLength_Req5'", 'AUTO_NBR', "send_wronglength_req5_$ses");			#measurement 5
		$res5{$ses} = _ReqRes($tcpar_WrongLength_Req5);
		
		S_teststep("Send '$tcpar_WrongLength_Req6'", 'AUTO_NBR', "send_wronglength_req6_$ses");			#measurement 6
		$res6{$ses} = _ReqRes($tcpar_WrongLength_Req6);
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - '$tcpar_NRC_13' should be obtained.", "send_wronglength_req1_$ses");			#evaluation 1
		S_teststep_detected("$ses - response should be observed $res1{$ses} ", "send_wronglength_req1_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res1{$ses});
		
		S_teststep_expected("$ses -'$tcpar_NRC_13' should be obtained.", "send_wronglength_req2_$ses");			#evaluation 2
		S_teststep_detected("$ses - response should be observed $res2{$ses}", "send_wronglength_req2_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res2{$ses});
		
		S_teststep_expected("$ses -'$tcpar_NRC_13' should be obtained.", "send_wronglength_req3_$ses");			#evaluation 3
		S_teststep_detected("$ses - response should be observed $res3{$ses}", "send_wronglength_req3_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res3{$ses});
		
		S_teststep_expected("$ses -'$tcpar_NRC_13' should be obtained.", "send_wronglength_req4_$ses");			#evaluation 4
		S_teststep_detected("$ses - response should be observed $res4{$ses}","send_wronglength_req4_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res4{$ses});
		
		S_teststep_expected("$ses -'$tcpar_NRC_13' should be obtained.", "send_wronglength_req5_$ses");			#evaluation 5
		S_teststep_detected("$ses - response should be observed $res5{$ses}", "send_wronglength_req5_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res5{$ses});
		
		S_teststep_expected("$ses -'$tcpar_NRC_13' should be obtained.", "send_wronglength_req6_$ses");			#evaluation 6
		S_teststep_detected("$ses - response should be observed $res6{$ses}", "send_wronglength_req6_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res6{$ses});
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
