#### TEST CASE MODULE
package TC_DSM_service22_EngineRPM;

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

our $PURPOSE = "To verify the response when different ranges of Engine RPM is given to the EGI040 Signal";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_service22_EngineRPM

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set supported <Addressing_Mode>.

2. Enter supported <Session>.

3. Send <DataValue> in <Signal>.

4. Send request <REQ_EngineRPM>.


I<B<Evaluation>>

1. 

2. Session Entery Successful

3. 

4.Positive Response <PR_EngineRPM> shall be obtained along with <Data_Length> 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'PR_EngineRPM' => 
	SCALAR 'Data_Length' => 
	SCALAR 'purpose' => 
	LIST 'Session' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'DataValue' => 
	SCALAR 'Signal' => 
	SCALAR 'REQ_EngineRPM' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To verify the response when different ranges of Engine RPM is given to the EGI040 Signal'
	#input parameter
	Session = @('default','extended')
	Addressing_Mode =@('Physical','Functional')
	DataValue = '0' #rpm
	Signal = 'EGI040_2_0_ENG_RPM'
	REQ_EngineRPM = '22 10 19'
	PR_EngineRPM = '62 10 19 00 00'
	Data_Length = '2'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Session;
my @tcpar_Addressing_Mode;
my $tcpar_DataValue;
my $tcpar_Signal;
my $tcpar_REQ_EngineRPM;
my $tcpar_PR_EngineRPM;
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
	$tcpar_DataValue =  GEN_Read_mandatory_testcase_parameter( 'DataValue' );
	$tcpar_Signal =  GEN_Read_mandatory_testcase_parameter( 'Signal' );
	$tcpar_REQ_EngineRPM =  GEN_Read_mandatory_testcase_parameter( 'REQ_EngineRPM' );
	$tcpar_PR_EngineRPM =  GEN_Read_mandatory_testcase_parameter( 'PR_EngineRPM' );
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

			S_teststep("Send '$tcpar_DataValue' in '$tcpar_Signal'.", 'AUTO_NBR');
			CA_write_can_signal ($tcpar_Signal, $tcpar_DataValue , 'phys');
			S_wait_ms(5000);
			
			S_teststep("Send request '$tcpar_REQ_EngineRPM'.", 'AUTO_NBR', 'send_request_req'."_$add"."_$ses");			#measurement 2
			$res1{$add}{$ses} = GDCOM_request($tcpar_REQ_EngineRPM,$tcpar_PR_EngineRPM,'strict');
		}
	}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_Addressing_Mode)
{	
	foreach my $ses (@tcpar_Session)
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
		
		S_teststep_expected("$ses - Positive Response '$tcpar_PR_EngineRPM' shall be obtained along with '$tcpar_Data_Length' ", 'send_request_req'."_$add"."_$ses");			#evaluation 2
		S_teststep_detected("$ses - response is obsered $res1{$add}{$ses}", 'send_request_req'."_$add"."_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_EngineRPM,$res1{$add}{$ses});
		$databyte= _CountNoByteData($res1{$add}{$ses});
		EVAL_evaluate_value("Data byte should be: ",$databyte,'==',$tcpar_Data_Length);
	}
}
	return 1;
}

sub TC_finalization {
	CA_write_can_signal ($tcpar_Signal, '0', 'phys');
	PRD_Clear_Fault_Memory();
	S_wait_ms(5000);
	return 1;
}

sub _CountNoByteData{
	my $data = shift;
	my $x = " ";
	my $c = () = $data =~ /$x/g;
	return $c -2;
}
1;
