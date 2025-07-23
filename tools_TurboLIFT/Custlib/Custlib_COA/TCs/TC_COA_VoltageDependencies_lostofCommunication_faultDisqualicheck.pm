#### TEST CASE MODULE
package TC_COA_VoltageDependencies_lostofCommunication_faultDisqualicheck;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs/TCs_Project/CAN/TC_COA_VoltageDependencies_lostofCommunication_faultDisqualicheck.pm 1.1 2016/08/26 16:14:34ICT pnv5kor develop  $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: TS_COA_SubaruTR8COMApplicationlayer 
#TS version in DOORS: 0.4
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project;
use LIFT_can_access;
use LIFT_CANoe;
use LIFT_CD_CAN;
use LIFT_POWER;
use LIFT_PD;
use LIFT_DCOM; #necessary
#include further modules here
use GENERIC_DCOM;
use FuncLib_TNT_COM;
use LIFT_evaluation;
use LIFT_labcar; #necessary
#include further modules here
##################################

our $PURPOSE = "To check the fault diasqualification diagnosis dependency on predefined threshold voltage";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_VoltageDependencies_lostofCommunication_faultDisqualicheck

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard Preparation.

2.Send reprogramming bit as below for Msg id

EGI040,TCU048,VDC139

EGI040_1_7_REPROGRAMING=0

TCU048_1_7_REPROGRAMING=0

VDC139_1_7_REPROGRAMING=0

3.Switch ON ECU.


I<B<Stimulation and Measurement>>

1.Create <Fault> and wait for <t_Quali> msec.

2.Set IGN Voltage <v_lowIGN> volts.

3.Remove <Fault> on <MSGID>

4.Wait for <t_DisQuali> msec.

5.Send <Req_readDTC> with StatusMask is FF

6.Set IGN Voltage <v_highIGN> volts.

7.Wait for 1000 msec.

8.Send <Req_readDTC> with StatusMask is FF

9.Wait for <t_DisQuali> msec with <tolerance>.

10.Send <Req_readDTC> with StatusMask is FF

11. Check the <LampIndSignal> Status on <MSGID1>

 


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.<ReadDTCResp> should be observed

6.-

7.

8.<ReadDTCResp>  should be observed.

9.

10.<ReadDTCResp1> should be observed.

11. The value of <LampIndSignal> is set to <OFF>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 't_Quali' => 
	SCALAR 't_DisQuali' => 
	SCALAR 'tolerance' => 
	SCALAR 'ReadDTCResp' => 
	SCALAR 'ReadDTCResp1' =>
	SCALAR 'purpose' => 
	SCALAR 'MSGID' => 
	SCALAR 'v_lowIGN' => 
	SCALAR 'v_highIGN' => 
	SCALAR 'LampIndSignal' => 
	SCALAR 'MSGID1' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'Fault' => 
	SCALAR 'OFF' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the fault diasqualification diagnosis dependency on predefined threshold voltage' 
	# input parameters
	MSGID='<Test Heading 2>'
	v_lowIGN= '8'#volts
	v_highIGN= '10' #volts
	LampIndSignal =  'ABG33A_2_0_IND_WARN_ABG'
	MSGID1 = 'ABG33A'
	Req_readDTC ='Req_<Fetch {Service description}>'
	Fault='rb_coa_<Test Heading 1>RxMsgTimeout_flt'
	OFF = '0'
	#output parameters
	
	t_Quali='400' #msec
	t_DisQuali ='800' #msec
	tolerance ='10'
	
	ReadDTCResp = '59 02 0A C1 00 00 0A'#fault qualified
	ReadDTCResp1 = '59 02 0A C1 00 00 08'#fault dequalified
=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_MSGID;
my $tcpar_v_lowIGN;
my $tcpar_v_highIGN;
my $tcpar_LampIndSignal;
my $tcpar_MSGID1;
my $tcpar_Req_readDTC;
my $tcpar_Fault;
my $tcpar_OFF;
my $tcpar_t_Quali;
my $tcpar_t_DisQuali;
my $tcpar_tolerance;
my $tcpar_ReadDTCResp;
my $tcpar_ReadDTCResp1;
################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
my $res3;
my ($WarningLamp_Status,$unit);
my $CAN_Mapping;
my $startMsg;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_MSGID =  GEN_Read_mandatory_testcase_parameter( 'MSGID' );
	$tcpar_v_lowIGN =  GEN_Read_mandatory_testcase_parameter( 'v_lowIGN' );
	$tcpar_v_highIGN =  GEN_Read_mandatory_testcase_parameter( 'v_highIGN' );
	$tcpar_LampIndSignal =  GEN_Read_mandatory_testcase_parameter( 'LampIndSignal' );
	$tcpar_MSGID1 =  GEN_Read_mandatory_testcase_parameter( 'MSGID1' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_OFF =  GEN_Read_mandatory_testcase_parameter( 'OFF' );
	$tcpar_t_Quali =  GEN_Read_mandatory_testcase_parameter( 't_Quali' );
	$tcpar_t_DisQuali =  GEN_Read_mandatory_testcase_parameter( 't_DisQuali' );
	$tcpar_tolerance =  GEN_Read_mandatory_testcase_parameter( 'tolerance' );
	$tcpar_ReadDTCResp =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp' );
	$tcpar_ReadDTCResp1 =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp1' );
	return 1;
}

sub TC_initialization {
	
	S_teststep("1.Standard Preparation.", 'AUTO_NBR');
	#GEN_StandardPrepNoFault();
	
     #--------------------------------------------------------------
    # Initialize equipment
    #
	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
    CA_trace_start();
    GDCOM_init() ; # To fetch info for CD from mapping_diags	
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
	 
	S_teststep("2.Send reprogramming bit as below for Msg id", 'AUTO_NBR');
	#comment
	S_teststep("EGI040,TCU048,VDC139", 'AUTO_NBR');
	#comment
	S_teststep("EGI040_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('EGI040_1_7_REPROGRAMING' , '0', 'phys');
	
	S_teststep("TCU048_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('TCU048_1_7_REPROGRAMING' , '0', 'phys');	
	
	S_teststep("VDC139_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('VDC139_1_7_REPROGRAMING' , '0', 'phys');
	
	S_teststep("3.Switch ON ECU.", 'AUTO_NBR');
	LC_ECU_On();
	S_wait_ms(5000);
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Create '$tcpar_Fault' and wait for '$tcpar_t_Quali' msec.", 'AUTO_NBR');
	$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	$startMsg = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_DISABLE'};
	CA_set_EnvVar_value($startMsg,0);	
	if (($tcpar_MSGID eq 'BIU3AC') or ($tcpar_MSGID eq 'EGI345') or ($tcpar_MSGID eq 'MET390')or ($tcpar_MSGID eq 'EPB32B'))
	{
		S_wait_ms(1000);
		S_wait_ms($tcpar_t_Quali);
	}else{
		S_wait_ms($tcpar_t_Quali);
	}
	PD_ReadFaultMemory();
	
	S_teststep("Set IGN Voltage '$tcpar_v_lowIGN' volts.", 'AUTO_NBR');
	LC_SetVoltage(9);
	GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	GDCOM_request('22 10 1B', '', 'relax' );
		
	S_teststep("Remove '$tcpar_Fault' on '$tcpar_MSGID'", 'AUTO_NBR');
	CA_set_EnvVar_value($startMsg,1);	
	
	S_teststep("Wait for '$tcpar_t_DisQuali' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_DisQuali);
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_readDTC' with StatusMask is FF", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 1
	$res1 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp, 'strict' );
	
	S_teststep("Set IGN Voltage '$tcpar_v_highIGN' volts.", 'AUTO_NBR');
	LC_SetVoltage(11);
	GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	GDCOM_request('22 10 1B', '', 'relax' );
	
	S_teststep("Wait for 1000 msec.", 'AUTO_NBR');
	S_wait_ms(1000);
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_readDTC' with StatusMask is FF", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 2
	$res2 = GDCOM_request($tcpar_Req_readDTC,$tcpar_ReadDTCResp, 'strict' );

	S_teststep("Wait for '$tcpar_t_DisQuali' msec with '$tcpar_tolerance'.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_DisQuali + $tcpar_tolerance);
	if($tcpar_MSGID eq 'BIU660'){
		S_wait_ms(10000);
	}else{
		S_wait_ms(1000);
	}
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_readDTC' with StatusMask is FF", 'AUTO_NBR', 'send_req_readdtc_C');			#measurement 3
	$res3 = GDCOM_request($tcpar_Req_readDTC,$tcpar_ReadDTCResp1, 'strict' );
	S_wait_ms(500);
	
	S_teststep("Check the '$tcpar_LampIndSignal' Status on '$tcpar_MSGID1'", 'AUTO_NBR', 'check_the_lampindsignal');			#measurement 4
	($WarningLamp_Status,$unit)= CA_read_can_signal('ABG33A_2_0_IND_WARN_ABG','phys');
	S_w2rep("Warning lamp = '$WarningLamp_Status'", 'AUTO_NBR');
	
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed", 'send_req_readdtc_A');			#evaluation 1
	S_teststep_detected("DTC response is obtained $res1", 'send_req_readdtc_A');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res1);
	
	S_teststep_expected("'$tcpar_ReadDTCResp'  should be observed.", 'send_req_readdtc_B');			#evaluation 2
	S_teststep_detected("DTC response is obtained $res2", 'send_req_readdtc_B');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res2);
	
	S_teststep_expected("'$tcpar_ReadDTCResp1' should be observed.", 'send_req_readdtc_C');			#evaluation 3
	S_teststep_detected("DTC response is obtained $res3", 'send_req_readdtc_C');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp1, $res3);
	
	S_teststep_expected("The value of '$tcpar_LampIndSignal' is set to '$tcpar_OFF'", 'check_the_lampindsignal');			#evaluation 4
	S_teststep_detected("The status of  warning lamp is $WarningLamp_Status", 'check_the_lampindsignal');
	EVAL_evaluate_value( "WarningLamp Status Check" , $tcpar_OFF ,'==', $WarningLamp_Status);
	return 1;
}

sub TC_finalization {
	LC_ECU_On(12);
	LC_ECU_Reset();		
	if($tcpar_MSGID eq 'BIU660')  
	{
		S_wait_ms(20000);
	}else{
		S_wait_ms(5000);
	}
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request('31 01 AC AC','71 01 AC AC','strict'); 
	return 1;
}


1;
