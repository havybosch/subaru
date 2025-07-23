#### TEST CASE MODULE
package TC_DSM_Service14Check_IGN_reset;

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

our $PURPOSE = "to check response of $14 in functional addressing mode with a fault condition";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service14Check_IGN_reset

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session> in <Addressing_Mode>

2.Qualify and disqualify <Fault>. 

3. Do IGN reset.

4. Send <Req_ClearDTC>.

5.Check Fault recorder.


I<B<Evaluation>>

1.-

2.- <Fault> should be in latched and stored state.

3.

4. <Res_ClearDTC> should be obtained.

5.No fault should be observed in fault recorder.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Res_ClearDTC' => 
	SCALAR 'purpose' => 
	SCALAR 'Fault' => 
	SCALAR 'Addressing_Mode' => 
	SCALAR 'Req_ClearDTC' => 
	SCALAR 'Session'  => 

=head2 PARAMETER EXAMPLES

	purpose= 'to check response of $14 in functional addressing mode with a fault condition'
	
	# input parameters
	Fault = 'EGI timeout'
	Addressing_Mode= '<Test Heading>'
	Session = @('Default','Extended')
	Req_ClearDTC =  'REQ_<Fetch {Service description}>' 
	#linked to Diag Mapping
	
	# output parameters
	Res_ClearDTC = 'PR_ClearDTCInformation_all' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Fault;
my $tcpar_Addressing_Mode;
my $tcpar_Req_ClearDTC;
my $tcpar_Res_ClearDTC;
my @tcpar_Session;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my %DTCmemory;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_Req_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ClearDTC' );
	$tcpar_Res_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Res_ClearDTC' );
	@tcpar_Session = GEN_Read_mandatory_testcase_parameter('Session');
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
		S_teststep("Enter supported in to $ses session in '$tcpar_Addressing_Mode'.", 'AUTO_NBR', "enter_supported_session_$ses");				
		#S_teststep("Enter to '@tcpar_Session' in 'tcpar_Addressing_Mode'", 'AUTO_NBR');
		GDCOM_set_addressing_mode($tcpar_Addressing_Mode);
		if ($ses =~/Default/)
		{
			S_w2rep("Enter default session", 'Purple');
			$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
		}				
		elsif($ses =~ /Extended/)
		{
			S_w2rep("Enter Extended session", 'Purple');
			$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
		}		
	
		S_teststep("Qualify and disqualify '$tcpar_Fault'. ", 'AUTO_NBR', "qualify_and_disqualify_$ses");			#measurement 1
		COM_stopMessages('EGI040');
		S_wait_ms(200);
		COM_startMessages('EGI040');
		S_wait_ms(10000);
		$res1{$ses} = GDCOM_request('19 02 FF','59 02 0A C1 00 00 0A','strict');
		
		S_teststep("Do IGN reset.", 'AUTO_NBR');
		LC_ECU_Reset();
		
		S_teststep("Send '$tcpar_Req_ClearDTC'.", 'AUTO_NBR', "send_req_cleardtc_$ses");			#measurement 2
		$res2{$ses} = GDCOM_request_general($tcpar_Req_ClearDTC,$tcpar_Res_ClearDTC);
		
		S_teststep("Check Fault recorder.", 'AUTO_NBR', "check_fault_recorder_$ses");			#measurement 3
		PD_ReadFaultMemory();
	    $DTCmemory{$ses} = FM_CD_readFaultMemory(0x09);
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - '$tcpar_Fault' should be in latched and stored state.", "qualify_and_disqualify_$ses");			#evaluation 1
		S_teststep_detected("$ses - $res1{$ses}",  "qualify_and_disqualify_$ses");
		EVAL_evaluate_string("Evaluating DTC response",'59 02 0A C1 00 00 0A',$res1{$ses});
				
		S_teststep_expected("$ses - '$tcpar_Res_ClearDTC' should be obtained.", "send_req_cleardtc_$ses");			#evaluation 2
		S_teststep_detected("$ses - Response is obsered is $res2{$ses}", "send_req_cleardtc_$ses");
	    EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_ClearDTC,$res2{$ses});
	    
		S_teststep_expected("$ses - No fault should be observed in fault recorder.", "check_fault_recorder_$ses");			#evaluation 3
		S_teststep_detected("$ses - $DTCmemory{$ses} ",  "check_fault_recorder_$ses");
		EVAL_evaluate_value("DTC memory should be",$DTCmemory{$ses},'==','0');
	
	}
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
