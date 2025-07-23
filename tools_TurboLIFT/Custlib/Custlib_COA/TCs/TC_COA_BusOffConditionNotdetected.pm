#### TEST CASE MODULE
package TC_COA_BusOffConditionNotdetected;

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
use LIFT_can_access;
use LIFT_CANoe;
use LIFT_CD_CAN;
use LIFT_POWER;
use LIFT_PD;
use LIFT_evaluation;
use FuncLib_TNT_COM;
use LIFT_DCOM;    #necessary
use FuncLib_Project_FM;
use LIFT_ProdDiag;
#include further modules here
use GENERIC_DCOM;
use LIFT_PRITT;
use LIFT_labcar;    #necessary
##################################

our $PURPOSE = "To Check when bus-off condition is not detected for 5000ms continuosly";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_BusOffConditionNotdetected

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Monitor CAN Bus line in oscilloscope.


I<B<Stimulation and Measurement>>

1. Create <Fault_Condition> for less than <Time1>.

2. Remove <Fault_Condition> and wait <Wait_Time>.

3. Create <Fault_Condition> for <Time1>

4. Send <Req_DTCstatus>.


I<B<Evaluation>>

4. Response <PR_ReadDTC> should be obtained


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Wait_Time' => 
	SCALAR 'PR_ReadDTC' => 
	SCALAR 'purpose' => 
	SCALAR 'Fault_Condition' => 
	SCALAR 'Time1' => 
	SCALAR 'Req_DTCstatus' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To Check when bus-off condition is not detected for 5000ms continuosly'
	
	# input parameters
	Fault_Condition = 'Busoff'
	Time1 = '300' #ms
	Req_DTCstatus = '19 02 FF'
	
	#output parameters
	Wait_Time = '2000' #ms
	PR_ReadDTC = '59 02 0A C0 73 00 0A'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Fault_Condition;
my $tcpar_Time1;
my $tcpar_Req_DTCstatus;
my $tcpar_Wait_Time;
my $tcpar_PR_ReadDTC;

################ global parameter declaration ###################
#add any global variables here
my $res;
my $busoffDetect;
my $NoBusoff;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Fault_Condition =  GEN_Read_mandatory_testcase_parameter( 'Fault_Condition' );
	$tcpar_Time1 =  GEN_Read_mandatory_testcase_parameter( 'Time1' );
	$tcpar_Req_DTCstatus =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCstatus' );
	$tcpar_Wait_Time =  GEN_Read_mandatory_testcase_parameter( 'Wait_Time' );
	$tcpar_PR_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC' );

	return 1;
}

sub TC_initialization {
	
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	#GEN_StandardPrepNoFault();
	# Initialize equipment
    #

	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
    CA_trace_start();
    GDCOM_init() ; # To fetch info for CD from mapping_diag
	S_wait_ms(2000);
  
    PD_ClearCrashRecorder();
    S_wait_ms(2000);
 
    # erase FltMem
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	# read fault memory
    my $faultsBeforeStimulation = PD_ReadFaultMemory();
	
	#Fault memory must be empty
    my $faultsVerdict = PD_evaluate_faults( $faultsBeforeStimulation, []);
 	return 0 unless ($faultsVerdict eq 'VERDICT_PASS');
	S_teststep("Monitor CAN Bus line in oscilloscope.", 'AUTO_NBR');
	$busoffDetect= S_aref2hex(PD_ReadMemoryByName('rb_cfh_BusOffDetectionCounter_u8'));
	$NoBusoff = S_aref2hex(PD_ReadMemoryByName('rb_cfh_NoBusOffDetectionCounter_u16'));
	GEN_printComment("$busoffDetect");
	GEN_printComment("$NoBusoff");
	#not request
	return 1;
}

sub TC_stimulation_and_measurement {
	GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	GDCOM_request('22 10 1B', '', 'relax' );
	
	S_teststep("Create '$tcpar_Fault_Condition' for less than '$tcpar_Time1'.", 'AUTO_NBR');
	LC_ShortLines(['CAN1+','CAN1-']);
	S_wait_ms(250);	
		
	S_teststep("Remove '$tcpar_Fault_Condition' and wait '$tcpar_Wait_Time'.", 'AUTO_NBR');
	LC_UndoShortLines( );
	#read variable
	$busoffDetect= S_aref2hex(PD_ReadMemoryByName('rb_cfh_BusOffDetectionCounter_u8'));
	$NoBusoff = S_aref2hex(PD_ReadMemoryByName('rb_cfh_NoBusOffDetectionCounter_u16'));
	GEN_printComment("$busoffDetect");
	GEN_printComment("$NoBusoff");
	S_wait_ms($tcpar_Wait_Time);
	PD_ReadFaultMemory();
	
	S_teststep("Create '$tcpar_Fault_Condition' for '$tcpar_Time1'", 'AUTO_NBR');
	LC_ShortLines(['CAN1+','CAN1-']);
	S_wait_ms($tcpar_Time1);
	#S_wait_ms(200);
	LC_UndoShortLines( );
	#read variable
	$busoffDetect= S_aref2hex(PD_ReadMemoryByName('rb_cfh_BusOffDetectionCounter_u8'));
	$NoBusoff = S_aref2hex(PD_ReadMemoryByName('rb_cfh_NoBusOffDetectionCounter_u16'));
	GEN_printComment("$busoffDetect");
	GEN_printComment("$NoBusoff");
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_DTCstatus'.", 'AUTO_NBR', 'send_req_dtcstatus');			#measurement 1
	$res = GDCOM_request($tcpar_Req_DTCstatus, '$tcpar_PR_ReadDTC', 'strict');
	#read variable
	$busoffDetect= S_aref2hex(PD_ReadMemoryByName('rb_cfh_BusOffDetectionCounter_u8'));
	$NoBusoff = S_aref2hex(PD_ReadMemoryByName('rb_cfh_NoBusOffDetectionCounter_u16'));
	GEN_printComment("$busoffDetect");
	GEN_printComment("$NoBusoff");
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Response '$tcpar_PR_ReadDTC' should be obtained", 'send_req_dtcstatus');			#evaluation 1
	S_teststep_detected("DTC response is $res", 'send_req_dtcstatus');
	EVAL_evaluate_string("DTC response Check", $tcpar_PR_ReadDTC,$res);
	return 1;
}

sub TC_finalization {
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request('31 01 AC AC','71 01 AC AC','strict');
    S_wait_ms(5000);
	return 1;
}


1;
