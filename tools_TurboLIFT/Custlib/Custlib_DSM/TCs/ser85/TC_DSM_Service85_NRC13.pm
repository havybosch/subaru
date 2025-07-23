#### TEST CASE MODULE
package TC_DSM_Service85_NRC13;

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
use LIFT_ProdDiag;
##################################

our $PURPOSE = "to check NRC13 for service85";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service85_NRC13

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <Addressing_Mode>  in <Protocol>

2. Send Request to enter <Session>

3. Send <REQ_CDS1> with <Invalid_Length1>

4. Send <REQ_CDS2> with <Invalid_Length2>


I<B<Evaluation>>

1.

2. Session entry should be successful.

3. <NRC_13> should be obtained.

4. <NRC_13> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'Session' => 
	SCALAR 'Protocol' => 
	SCALAR 'REQ_CDS1' => 
	SCALAR 'REQ_CDS2' => 
	SCALAR 'Invalid_Length1' => 
	SCALAR 'Invalid_Length2' => 
	SCALAR 'NRC_13' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To verify that NRC 13 is received when service request is send with incorrect message length or format.'
	#input parameter
	Addressing_Mode = @('Physical','Functional')
	Session = 'Extended'
	Protocol = 'UDS' 
	REQ_CDS1 = '01 85'
	REQ_CDS2 = '03 85 00 FF'
	Invalid_Length1 = '1'
	Invalid_Length2 = '3'
	#output parameter
	NRC_13= '0x7F 0x85 0x13'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Addressing_Mode;
my $tcpar_Session;
my $tcpar_Protocol;
my $tcpar_REQ_CDS1;
my $tcpar_REQ_CDS2;
my $tcpar_Invalid_Length1;
my $tcpar_Invalid_Length2;
my $tcpar_NRC_13;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my %res_sess;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_REQ_CDS1 =  GEN_Read_mandatory_testcase_parameter( 'REQ_CDS1' );
	$tcpar_REQ_CDS2 =  GEN_Read_mandatory_testcase_parameter( 'REQ_CDS2' );
	$tcpar_Invalid_Length1 =  GEN_Read_mandatory_testcase_parameter( 'Invalid_Length1' );
	$tcpar_Invalid_Length2 =  GEN_Read_mandatory_testcase_parameter( 'Invalid_Length2' );
	$tcpar_NRC_13 =  GEN_Read_mandatory_testcase_parameter( 'NRC_13' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {
	S_w2rep("Start the CANOe Measurement and CAN trace\n",'Purple');
	CA_trace_start();
	PRD_Clear_Fault_Memory();
	S_wait_ms(500);
	foreach my $add(@tcpar_Addressing_Mode)
	{	
		S_teststep("Set supported $add Addressing Mode", 'AUTO_NBR');
		GDCOM_set_addressing_mode($add);

		S_teststep("Send Request to enter '$tcpar_Session'", 'AUTO_NBR', 'send_request_to'."_$add");			#measurement 1
		S_w2rep("Enter Extended session", 'Purple');
		$res_sess{$add} = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
		
		S_teststep("Send '$tcpar_REQ_CDS1' with '$tcpar_Invalid_Length1'", 'AUTO_NBR', 'send_req_cds1'."_$add");			#measurement 2
		$res1{$add} = _ReqRes($tcpar_REQ_CDS1);
		
		S_teststep("Send '$tcpar_REQ_CDS2' with '$tcpar_Invalid_Length2'", 'AUTO_NBR', 'send_req_cds2'."_$add");			#measurement 3
		$res2{$add} = _ReqRes($tcpar_REQ_CDS2);
	}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_Addressing_Mode)
{
	S_teststep_expected("$add - Session entry should be successful.", 'send_request_to'."_$add");			#evaluation 1
	S_teststep_detected("$add - response is obsered $res_sess{$add}", 'send_request_to'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4', $res_sess{$add});
	
	S_teststep_expected("$add - '$tcpar_NRC_13' should be obtained.", 'send_req_cds1'."_$add");			#evaluation 2
	S_teststep_detected("$add - response is obsered $res1{$add}", 'send_req_cds1'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res1{$add});
	
	S_teststep_expected("$add - '$tcpar_NRC_13' should be obtained.", 'send_req_cds2'."_$add");			#evaluation 3
	S_teststep_detected("$add - response is obsered $res2{$add}", 'send_req_cds2'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_13,$res2{$add});
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
