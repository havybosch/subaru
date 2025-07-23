#### TEST CASE MODULE
package TC_DSM_Service85_FltCheck_Sess_ECUreset;

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
use INCLUDES_Project;
use LIFT_can_access;
use LIFT_CANoe;
use LIFT_CD_CAN;
use LIFT_POWER;
use LIFT_PD;
use LIFT_evaluation;
use FuncLib_TNT_COM;
use LIFT_DCOM;    #necessary

#include further modules here
use GENERIC_DCOM;
use LIFT_labcar;    #necessary

#include further modules here
use FuncLib_Project_FM;
use LIFT_ProdDiag;
#include further modules here
use GENERIC_DCOM;
use LIFT_PRITT;
##################################

our $PURPOSE = "to check service85 when session changed and fault happend";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service85_FltCheck_Sess_ECUreset

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <Addressing_Mode>.	

2. Enter <Session>.

3. Qualify  <Fault> and disqualify <Fault>.

4. Send request <REQ_OFF>.

5.Apply the <Condition> on ECU.

6. Again qualify <Fault>.


I<B<Evaluation>>

1. 

2.Session entry should be successful.

3.- 

4. Positive response <PR_OFF> shall be obtained.

5.

6. <Fault> should qualify.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'Session' => 
	SCALAR 'REQ_OFF' => 
	SCALAR 'PR_OFF' => 
	SCALAR 'Condition' => 
	SCALAR 'Fault' => 


=head2 PARAMETER EXAMPLES

	purpose =  'To test request and response format of CDS OFF.'
	#input parameter
	Addressing_Mode = @('Physical','Functional')
	Session = 'ExtendedSession'
	REQ_OFF = '85 02'
	PR_OFF = 'C5 02'
	
	Condition = '<Test Heading>'
	Fault = 'rb_coa_METRxMsgTimeout_flt'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Addressing_Mode;
my $tcpar_Session;
my $tcpar_REQ_OFF;
my $tcpar_PR_OFF;
my $tcpar_Condition;
my $tcpar_Fault;

################ global parameter declaration ###################
#add any global variables here
my %res;
my %res_sess;
my %res_DTC;
my %flt_mem_struct_pd1;
my %flt_mem_struct_pd2;
my %flt_mem_struct_pd3;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_REQ_OFF =  GEN_Read_mandatory_testcase_parameter( 'REQ_OFF' );
	$tcpar_PR_OFF =  GEN_Read_mandatory_testcase_parameter( 'PR_OFF' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	#GEN_StandardPrepNoFault();
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
	
	GDCOM_start_CyclicTesterPresent();
	S_wait_ms(500);
	return 1;
}

sub TC_stimulation_and_measurement {
foreach my $add(@tcpar_Addressing_Mode)
{
		S_teststep("Set $add Addressing Mode", 'AUTO_NBR');
		GDCOM_set_addressing_mode($add);
		
		S_teststep("Enter '$tcpar_Session'.", 'AUTO_NBR', 'enter_session'."_$add");			#measurement 1
		$res_sess{$add} = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
		
		S_teststep("Qualify  '$tcpar_Fault' and disqualify '$tcpar_Fault'.", 'AUTO_NBR');
		CA_set_EnvVar_value('_enV_MET390_StartStop',0);
		S_teststep("Wait until the fault $tcpar_Fault is qualified", 'AUTO_NBR');
		S_wait_ms(5000);
		$flt_mem_struct_pd1{$add} = PD_ReadFaultMemory();
		PD_check_fault_status($flt_mem_struct_pd1{$add},$tcpar_Fault, 0xAF);
		
		#dequalified
		CA_set_EnvVar_value('_enV_MET390_StartStop',1);
		S_teststep("Wait until the fault $tcpar_Fault is dequalified", 'AUTO_NBR');
		S_wait_ms(10000);
		$flt_mem_struct_pd2{$add} = PD_ReadFaultMemory();
		PD_check_fault_status($flt_mem_struct_pd2{$add},$tcpar_Fault, 0xAE);
		
		S_teststep("Send request '$tcpar_REQ_OFF'.", 'AUTO_NBR', 'send_request_req'."_$add");			#measurement 2
		#GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
		$res{$add} = GDCOM_request($tcpar_REQ_OFF,'','relax');
		
		S_teststep("Apply the '$tcpar_Condition' on ECU.", 'AUTO_NBR');
		if ($tcpar_Condition eq 'Defaultsession')
		{
			GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
		}elsif ($tcpar_Condition eq 'ECUReset')
		{
			LC_ECU_Reset();
			S_wait_ms(500);
		}elsif ($tcpar_Condition eq 'LowVoltage')
		{
			LC_SetVoltage('7');
			S_wait_ms(1000);
		}elsif ($tcpar_Condition eq 'HighVoltage')
		{
			LC_SetVoltage('19');
			S_wait_ms(1000);
		}
		GDCOM_request('22 10 1B','','relax');
		S_wait_ms(500);
		
		S_teststep("Again qualify '$tcpar_Fault'.", 'AUTO_NBR', 'again_qualify_fault'."_$add");			#measurement 3
		CA_set_EnvVar_value('_enV_MET390_StartStop',0);
		S_teststep("Wait until the fault $tcpar_Fault is qualified", 'AUTO_NBR');
		
		LC_SetVoltage(12);
		S_wait_ms(5000);
				
		#GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
		if ($add eq 'physical'){
			$res_DTC{$add} = GDCOM_request('19 02 FF','','relax');
		}else{
			$res_DTC{$add} = GDCOM_request('19 02 FF','', 'quiet' );
		}	
		S_wait_ms(5000);
		$flt_mem_struct_pd3{$add} = PD_ReadFaultMemory();	
		
		CA_set_EnvVar_value('_enV_MET390_StartStop',1);
		S_wait_ms(10000);
		LC_ECU_Reset();		
		S_w2rep("Sending AllClear Request\n",'Purple');
		GDCOM_request('31 01 AC AC','','relax');
}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_Addressing_Mode)
{
	S_teststep_expected("$add - Session entry should be successful.", 'enter_session'."_$add");			#evaluation 1
	S_teststep_detected("$add - response is observed $res_sess{$add}", 'enter_session'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4',$res_sess{$add});
	
	S_teststep_expected("$add - Positive response '$tcpar_PR_OFF' shall be obtained.", 'send_request_req'."_$add");			#evaluation 2
	S_teststep_detected("$add - response is observed $res{$add}", 'send_request_req'."_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_OFF, $res{$add});
	
	S_teststep_expected("$add - '$tcpar_Fault' should qualify.", 'again_qualify_fault'."_$add");			#evaluation 3
	S_teststep_detected("$add - Fault response is $flt_mem_struct_pd3{$add}", 'again_qualify_fault'."_$add");
	PD_check_fault_status($flt_mem_struct_pd3{$add},$tcpar_Fault, 0xAF);	
	if ($add eq 'physical'){
		EVAL_evaluate_string("Evaluating DTC response",'59 02 0A C1 55 00 0A', $res_DTC{$add});
	}else{
		S_w2rep("No need to check DTC",'green');
	}
	
}
	return 1;
}

sub TC_finalization {
	LC_SetVoltage(12);
	# stop tester present
	GDCOM_stop_CyclicTesterPresent();
	S_wait_ms(500);
	return 1;
}


1;
