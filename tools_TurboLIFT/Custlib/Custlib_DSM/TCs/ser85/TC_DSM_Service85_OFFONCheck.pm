#### TEST CASE MODULE
package TC_DSM_Service85_OFFONCheck;

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
use LIFT_crash_simulation;
use LIFT_CD;
use LIFT_CD_CAN;
use LIFT_equipment;
use LIFT_MDSRESULT;
use LIFT_labcar;
use LIFT_CANoe;
use GENERIC_DCOM;
use LIFT_can_access;
use FuncLib_TNT_DEVICE;
use FuncLib_TNT_FM;
use FuncLib_TNT_COM;
use LIFT_DCOM;
use LIFT_ProdDiag;
# use INCLUDES_Project;
use File::Basename;
use Data::Dumper;
use FuncLib_EDR_Framework;
use FuncLib_SYC_INTERFACE;
use LIFT_QuaTe;
use LIFT_numerics;
use FuncLib_TNT_EDR;
require LIFT_PD2ProdDiag; 
import LIFT_PD2ProdDiag; 
# use LIFT_CD;            # use STEPS_diag;
use  FuncLib_TNT_GEN;
use constant MILLISEC_TO_SECOND => 0.001;
use constant SECOND_TO_MILLISEC => 1000;
##################################

our $PURPOSE = "To check ControlDTCSetting OFF when fault happended";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service85_OFFONCheck

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <Addressing_Mode>.	

2. Enter <Session>.

3. Send request <REQ_OFF>.

4. Create any external <Fault>.

5. Send request <REQ_Read_DTC>.

6. Send request <REQ_CountOf_DTC>.

7. IGN Reset.

8. Send request <REQ_Read_DTC>.


I<B<Evaluation>>

1. 

2. Session entry should be successful.

3. Positive response <PR_OFF> shall be obtained.

4. The fault <Fault> should be observed.

5. Positive response <PR_Read_DTC> shall be obtained.

6.Positive response <PR_Countof_DTC> shall be obtained.

7.

8.Positive response <PR_Read_DTC1> should in response with DTC status mask is <DTCMask>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Fault' => 
	SCALAR 'DTCMask' => 
	SCALAR 'PR_Read_DTC1' => 
	SCALAR 'purpose' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'Session' => 
	SCALAR 'REQ_OFF' => 
	SCALAR 'PR_OFF' => 
	SCALAR 'REQ_Read_DTC' => 
	SCALAR 'REQ_CountOf_DTC' => 
	SCALAR 'PR_Countof_DTC' => 
	SCALAR 'PR_Read_DTC' => 


=head2 PARAMETER EXAMPLES

	purpose =  'To verify fault handling when ControlDTCSetting is set to OFF'
	#input parameter
	Addressing_Mode = @('Physical','Functional')
	Session = 'Extended'
	REQ_OFF = '85 02'
	PR_OFF	= 'C5 02'
	REQ_Read_DTC = '19 02 FF'
	REQ_CountOf_DTC = '19 01 FF'
	PR_Countof_DTC = '59 01 0A 01 00 00'
	#output parameter
	PR_Read_DTC = '59 02 0A'
	
	Fault = 'rb_sqm_SquibResistanceOpenAB1FD_flt'
	DTCMask = '98 01 00'
	PR_Read_DTC1 = '59 02 0A 98 01 00 0A'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Addressing_Mode;
my $tcpar_Session;
my $tcpar_REQ_OFF;
my $tcpar_PR_OFF;
my $tcpar_REQ_Read_DTC;
my $tcpar_REQ_CountOf_DTC;
my $tcpar_PR_Countof_DTC;
my $tcpar_PR_Read_DTC;
my $tcpar_Fault;
my $tcpar_DTCMask;
my $tcpar_PR_Read_DTC1;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my %res3;
my %res4;
my %res_sess;
my (
		$record_handler,
		$crash_handler,
		$comSignalLabelMapping_href,
		$mappingEDR,
		$crashSettings,
		$crashDetails_href,
		$crashInfo_href,
		$ChinaEDR_diagType,
		$currentTestCaseIteration,
	);
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_REQ_OFF =  GEN_Read_mandatory_testcase_parameter( 'REQ_OFF' );
	$tcpar_PR_OFF =  GEN_Read_mandatory_testcase_parameter( 'PR_OFF' );
	$tcpar_REQ_Read_DTC =  GEN_Read_mandatory_testcase_parameter( 'REQ_Read_DTC' );
	$tcpar_REQ_CountOf_DTC =  GEN_Read_mandatory_testcase_parameter( 'REQ_CountOf_DTC' );
	$tcpar_PR_Countof_DTC =  GEN_Read_mandatory_testcase_parameter( 'PR_Countof_DTC' );
	$tcpar_PR_Read_DTC =  GEN_Read_mandatory_testcase_parameter( 'PR_Read_DTC' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_DTCMask =  GEN_Read_mandatory_testcase_parameter( 'DTCMask' );
	$tcpar_PR_Read_DTC1 =  GEN_Read_mandatory_testcase_parameter( 'PR_Read_DTC1' );
	$mappingEDR = S_get_contents_of_hash(['Mapping_EDR']) unless defined $mappingEDR;
	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	#GEN_StandardPrepNoFault();
	# Read fault memory after crash
    PD_ReadFaultMemory();
    S_wait_ms(2000);

	# Erase EDR
    PD_ClearCrashRecorder();
    S_wait_ms(2000);
	
	# Erase Fault memory
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	# Reset ECU    
    PD_ECUreset();
    S_wait_ms('TIMER_ECU_READY');

	# Read fault memory after clearing and erasing EDR
    PD_ReadFaultMemory();
	# INITIALIZE RECORD AND CRASH HANDLER
    #    
	S_w2rep("Initialize Record and Crash Handler");
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;
	
	return 1;
}

sub TC_stimulation_and_measurement {
	S_w2rep("Start the CANOe Measurement and CAN trace\n",'Purple');
	CA_trace_start();
	PRD_Clear_Fault_Memory();
	S_wait_ms(500);
	foreach my $add(@tcpar_Addressing_Mode)
	{
		S_teststep("Set $add Addressing Mode", 'AUTO_NBR');
		GDCOM_set_addressing_mode($add);
		
		S_teststep("Enter '$tcpar_Session'.", 'AUTO_NBR', 'enter_session'."_$add");			#measurement 1
		$res_sess{$add} = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
		
		S_teststep("Send request '$tcpar_REQ_OFF'.", 'AUTO_NBR', 'send_request_req_A'."_$add");			#measurement 2
		$res1{$add} = GDCOM_request($tcpar_REQ_OFF,$tcpar_PR_OFF,'strict');
		
		S_teststep("Create any external '$tcpar_Fault'.", 'AUTO_NBR', 'create_any_external'."_$add");			#measurement 3

		S_teststep("Send request '$tcpar_REQ_Read_DTC'.", 'AUTO_NBR', 'send_request_req_B'."_$add");			#measurement 4
		$res2{$add} = GDCOM_request($tcpar_REQ_Read_DTC,$tcpar_PR_Read_DTC,'strict');
		
		S_teststep("Send request '$tcpar_REQ_CountOf_DTC'.", 'AUTO_NBR', 'send_request_req_C'."_$add");			#measurement 5
		$res3{$add} = GDCOM_request($tcpar_REQ_CountOf_DTC,$tcpar_PR_Countof_DTC,'strict');
		
		S_teststep("IGN Reset.", 'AUTO_NBR');
		LC_ECU_Reset();
		
		S_teststep("Send request '$tcpar_REQ_Read_DTC'.", 'AUTO_NBR', 'send_request_req_D'."_$add");			#measurement 6
		$res4{$add} = GDCOM_request($tcpar_REQ_Read_DTC,$tcpar_PR_Read_DTC1,'strict');
	}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_Addressing_Mode)
{
	S_teststep_expected("$add - Session entry should be successful.", 'enter_session'."_$add");			#evaluation 1
	S_teststep_detected("$add - response is observed $res_sess{$add}", 'enter_session'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4',$res_sess{$add});
	
	S_teststep_expected("$add - Positive response '$tcpar_PR_OFF' shall be obtained.", 'send_request_req_A'."_$add");			#evaluation 2
	S_teststep_detected("$add - response is observed $res1{$add}", 'send_request_req_A'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_OFF,$res1{$add});
	
	S_teststep_expected("$add - The fault '$tcpar_Fault' should be observed.", 'create_any_external'."_$add");			#evaluation 3
	S_teststep_detected("$add - ", 'create_any_external'."_$add");

	S_teststep_expected("$add - Positive response '$tcpar_PR_Read_DTC' shall be obtained.", 'send_request_req_B'."_$add");			#evaluation 4
	S_teststep_detected("$add - response is observed $res2{$add}", 'send_request_req_B'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_Read_DTC,$res2{$add});
	
	S_teststep_expected("$add - Positive response '$tcpar_PR_Countof_DTC' shall be obtained.", 'send_request_req_C'."_$add");			#evaluation 5
	S_teststep_detected("$add - response is observed $res3{$add}", 'send_request_req_C'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_Countof_DTC,$res3{$add});
	
	S_teststep_expected("$add - Positive response '$tcpar_PR_Read_DTC1' should in response with DTC status mask is '$tcpar_DTCMask'.", 'send_request_req_D'."_$add");			#evaluation 6
	S_teststep_detected("$add - response is observed $res4{$add}", 'send_request_req_D'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_Read_DTC1,$res4{$add});
}
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
