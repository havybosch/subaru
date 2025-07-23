#### TEST CASE MODULE
package TC_DSM_service22_TimeStamp;

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

our $PURPOSE = "check counter trip and counter time response of BIU660Msg";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_service22_TimeStamp

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set supported <Addressing_Mode>.

2. Create <Condition>

2. Enter supported <Session>.

3. Send <Value1> in <BIU660_TripSignal> and <Value2> in <BIU660_TimeSignal>.

4. Send request <REQ_TimeStamp>.


I<B<Evaluation>>

1. 

2. Session Entery Successful

3. 

4.Positive Response <PR_TimeStamp> shall be obtained along with <Data_Length> 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Condition' => 
	SCALAR 'Value1' => 
	SCALAR 'Value2' => 
	SCALAR 'PR_TimeStamp' => 
	SCALAR 'Data_Length' => 
	SCALAR 'purpose' => 
	LIST 'Session' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'REQ_TimeStamp' => 
	SCALAR 'BIU660_TripSignal' => 
	SCALAR 'BIU660_TimeSignal' => 


=head2 PARAMETER EXAMPLES

	purpose =  'To verify the response when different ranges of Counter trip and counter time is given to BIU660 Signal'
	#input parameter
	Session = @('default','extended')
	Addressing_Mode =@('Physical','Functional')
	REQ_TimeStamp = '0x03 0x22 0x10 0x1E'
	BIU660_TripSignal = 'BIU660_3_0_COUNT_TRIP'
	BIU660_TimeSignal = 'BIU660_7_0_COUNT_TIME'
	Condition = 'None'
	Value1 = '0x00'
	Value2 = '0x00' 
	PR_TimeStamp = '0x62 0x10 0x1E 0x0 0x0 0x0 0x0 0x0 0xX'
	Data_Length = '6'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Session;
my @tcpar_Addressing_Mode;
my $tcpar_REQ_TimeStamp;
my $tcpar_BIU660_TripSignal;
my $tcpar_BIU660_TimeSignal;
my $tcpar_Condition;
my $tcpar_Value1;
my $tcpar_Value2;
my $tcpar_PR_TimeStamp;
my $tcpar_Data_Length;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res_sess;
my $databyte;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_REQ_TimeStamp =  GEN_Read_mandatory_testcase_parameter( 'REQ_TimeStamp' );
	$tcpar_BIU660_TripSignal =  GEN_Read_mandatory_testcase_parameter( 'BIU660_TripSignal' );
	$tcpar_BIU660_TimeSignal =  GEN_Read_mandatory_testcase_parameter( 'BIU660_TimeSignal' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_Value1 =  GEN_Read_mandatory_testcase_parameter( 'Value1' );
	$tcpar_Value2 =  GEN_Read_mandatory_testcase_parameter( 'Value2' );
	$tcpar_PR_TimeStamp =  GEN_Read_mandatory_testcase_parameter( 'PR_TimeStamp' );
	$tcpar_Data_Length =  GEN_Read_mandatory_testcase_parameter( 'Data_Length' );

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
	S_wait_ms(5000);
	foreach my $add(@tcpar_Addressing_Mode)
	{	
		S_teststep("Set supported $add Addressing Mode", 'AUTO_NBR');
		GDCOM_set_addressing_mode($add);
		foreach my $ses(@tcpar_Session)
		{			
			my $res;
			S_teststep("Enter to $ses Session'. ", 'AUTO_NBR', 'enter_supported_session'."_$add"."_$ses");			#measurement 1
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
			$res_sess{$add}{$ses} = $res;	

			S_teststep("Send '$tcpar_Value1' in '$tcpar_BIU660_TripSignal' and '$tcpar_Value2' in '$tcpar_BIU660_TimeSignal'.", 'AUTO_NBR');
			CA_write_can_signal ($tcpar_BIU660_TripSignal, $tcpar_Value1, 'Hex');
			CA_write_can_signal ($tcpar_BIU660_TimeSignal, $tcpar_Value2, 'Hex');
			S_wait_ms(5000);
			
			S_teststep("Send request '$tcpar_REQ_TimeStamp'.", 'AUTO_NBR', 'send_request_req'."_$add"."_$ses");			#measurement 3
			$res1{$add}{$ses} = _reqres($tcpar_REQ_TimeStamp); 
		}
	}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_Addressing_Mode)
{	
	foreach my $ses(@tcpar_Session)
	{
		S_teststep_expected("$ses - Session Entery Successful", 'enter_supported_session'."_$add"."_$ses");			#evaluation 1
		S_teststep_detected("$ses - response is obsered $res_sess{$add}{$ses}", 'enter_supported_session'."_$add"."_$ses");
		if ($ses =~/default/)
		{
			S_w2rep("Enter default session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 01 00 32 01 F4', $res_sess{$add}{$ses});
		}elsif($ses =~ /extended/)
		{
			S_w2rep("Enter extended session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4', $res_sess{$add}{$ses});
		}
		S_teststep_expected("$ses - Positive Response '$tcpar_PR_TimeStamp' shall be obtained along with '$tcpar_Data_Length' ", 'send_request_req'."_$add"."_$ses");			#evaluation 2
		S_teststep_detected("$ses - response is obsered $res1{$add}{$ses}", 'send_request_req'."_$add"."_$ses");
		my @rsp = split(/ /,$res1{$add}{$ses});
		if( $tcpar_PR_TimeStamp =~/0xX/ )
		{
			for ( my $i = 3; $i<8; $i++)
			{
				EVAL_evaluate_value("Checking vaue of byte $i", @rsp[$i],'==',0x00);
			}
			EVAL_evaluate_value("Checking vaue of byte 0", @rsp[0],'==',0x62);
			EVAL_evaluate_value("Checking vaue of byte 1", @rsp[1],'==',0x10);
			EVAL_evaluate_value("Checking vaue of byte 2", @rsp[2],'==',0x1E);
			EVAL_evaluate_value("Checking vaue of byte 8", @rsp[8],'!=',0x00);
		}else
		{
			EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_TimeStamp, $res1{$add}{$ses});
		}
		$databyte= _CountNoByteData($res1{$add}{$ses});
		EVAL_evaluate_value("Data byte should be: ",$databyte,'==',$tcpar_Data_Length);
	}
}
	return 1;
}

sub TC_finalization {
	CA_write_can_signal ($tcpar_BIU660_TripSignal, '0x00', 'Hex');
	CA_write_can_signal ($tcpar_BIU660_TimeSignal, '0x00', 'Hex');
	S_wait_ms(5000);
	PRD_Clear_Fault_Memory();
	return 1;
}

sub _CountNoByteData{
	my $data = shift;
	my $x = " ";
	my $c = () = $data =~ /$x/g;
	return $c -2;
}

sub _reqres{
	my $sub_req = shift;
	my $options_href;
	my $Sub_data_string;
	my @sub_length = split(/ /, $sub_req, 2);
	$options_href->{'Manipulated_length'} = $sub_length[0];
	my ($sub_status, $Sub_arrayRespone,@Sub_arrResponse);
	my @sub_data = split(/ /,$sub_length[1]);
	($sub_status, $Sub_arrayRespone)=CD_send_request_wait_response (\@sub_data,$options_href);
	for (my $i = 0; $i< @$Sub_arrayRespone; $i++){
		@Sub_arrResponse[$i] = @$Sub_arrayRespone[$i];
	}
	$Sub_data_string = '';
	for(my $i=0;$i<@Sub_arrResponse;$i++)
	{
		$Sub_arrResponse[$i] = S_dec2hex($Sub_arrResponse[$i]);			
		$Sub_data_string = $Sub_data_string .$Sub_arrResponse[$i] ;
		if ( $i < ( @Sub_arrResponse - 1 ))
		{
			$Sub_data_string = $Sub_data_string . ' ';
		}
	}
	return $Sub_data_string;
}
1;
