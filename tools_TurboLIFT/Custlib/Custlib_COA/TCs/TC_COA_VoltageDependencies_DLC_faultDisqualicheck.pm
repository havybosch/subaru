#### TEST CASE MODULE
package TC_COA_VoltageDependencies_DLC_faultDisqualicheck;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs/TCs_Project/CAN/TC_COA_VoltageDependencies_DLC_faultDisqualicheck.pm 1.1 2016/08/26 16:14:33ICT pnv5kor develop  $;

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
use LIFT_evaluation;
use FuncLib_TNT_COM;
use LIFT_DCOM; #necessary
#include further modules here
use GENERIC_DCOM;
use LIFT_labcar;
use LIFT_ProdDiag;
#include further modules here

##################################

our $PURPOSE = "To check the fault diasqualification diagnosis dependency on predefined threshold voltage";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_VoltageDependencies_DLC_faultDisqualicheck

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

5.Send <Req_readDTC> with <Status_Mask>

6.Set IGN Voltage <v_highIGN> volts.

7.Wait for 1000 msec.

8.Send <Req_readDTC> with StatusMask is FF

9.Wait for <t_DisQuali> msec.

10.Send <Req_readDTC> with StatusMask is FF

11.Check Warning lamp signal <WL_Signal> of ABG0x33A MSGID


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.<ReadDTCResp> should be observed

6.-

7.

8.<ReadDTCResp>  should be observed.

9.-

10.<ReadDTCResp1>  should be observed.

11.<WL_Signal> of ABG0x33A  should be <WL_value>. 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 't_Quali' => 
	SCALAR 't_DisQuali' => 
	SCALAR 'ReadDTCResp1' => 
	SCALAR 'ReadDTCResp' => 
	SCALAR 'purpose' => 
	SCALAR 'MSGID' => 
	SCALAR 'v_lowIGN' => 
	SCALAR 'v_highIGN' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'Fault' => 
	SCALAR 'WL_Signal' => 
	SCALAR 'WL_value' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the fault diasqualification diagnosis dependency on predefined threshold voltage' 
	# input parameters
	MSGID='<Test Heading 2>'
	v_lowIGN='8' #volts
	v_highIGN='10' #volts
	Req_readDTC ='Req_<Fetch {Service description}>'
	Fault='rb_coa_<Test Heading 1>RxMsgTimeout_flt'
	WL_Signal='ABG33A_2_0_IND_WARN_ABG'
	WL_value='0'
	#output parameters
	
	t_Quali='400' #msec
	t_DisQuali ='800' #msec
	
	
	ReadDTCResp1 = '59 02 0A C4 01 00 0A'#fault qualified
	ReadDTCResp = '59 02 0A C4 01 00 0A'#fault qualified

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_MSGID;
my $tcpar_v_lowIGN;
my $tcpar_v_highIGN;
my $tcpar_Req_readDTC;
my $tcpar_Fault;
my $tcpar_WL_Signal;
my $tcpar_WL_value;
my $tcpar_t_Quali;
my $tcpar_t_DisQuali;
my $tcpar_ReadDTCResp1;
my $tcpar_ReadDTCResp;


################ global parameter declaration ###################
#add any global variables here
my $Request_sent;
my $Response_obtained;
my $Response_obtained1;
my $Response_obtained2;
my $WL_Signalvalue;
my $V_Requestsent;
my ($WarningLamp_Status,$unit);
my $CAN_Mapping;
my $DLCVarName;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_MSGID =  GEN_Read_mandatory_testcase_parameter( 'MSGID' );
	$tcpar_v_lowIGN =  GEN_Read_mandatory_testcase_parameter( 'v_lowIGN' );
	$tcpar_v_highIGN =  GEN_Read_mandatory_testcase_parameter( 'v_highIGN' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_WL_Signal =  GEN_Read_mandatory_testcase_parameter( 'WL_Signal' );
	$tcpar_WL_value =  GEN_Read_mandatory_testcase_parameter( 'WL_value' );
	$tcpar_t_Quali =  GEN_Read_mandatory_testcase_parameter( 't_Quali' );
	$tcpar_t_DisQuali =  GEN_Read_mandatory_testcase_parameter( 't_DisQuali' );
	$tcpar_ReadDTCResp1 =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp1' );
	$tcpar_ReadDTCResp =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp' );	

	return 1;
}

sub TC_initialization {
		
	S_teststep("1.Standard Preparation.", 'AUTO_NBR');
	#GEN_StandardPrepNoFault();
	# Initialize equipment
    
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
	
	S_teststep("2.Send reprogramming bit as below for Msg id", 'AUTO_NBR');
	#comment
	S_teststep("EGI040,TCU048,VDC139", 'AUTO_NBR');
	#comment
	S_teststep("EGI040_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal('EGI040_1_7_REPROGRAMING' , '0', 'phys');
	
	S_teststep("TCU048_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal('TCU048_1_7_REPROGRAMING' , '0', 'phys');	
	
	S_teststep("VDC139_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal('VDC139_1_7_REPROGRAMING' , '0', 'phys');

	S_teststep("3.Switch ON ECU.", 'AUTO_NBR');
	LC_ECU_On();
	return 1;
}

sub TC_stimulation_and_measurement {
	
	S_teststep("Create '$tcpar_Fault' and wait for '$tcpar_t_Quali' msec.", 'AUTO_NBR');
    $CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	$DLCVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_DLC'};
	CA_set_EnvVar_value($DLCVarName,0);     
	S_wait_ms($tcpar_t_Quali);
	#forBIU,MET,VDC328,EPB
	S_wait_ms(1000);
	PD_ReadFaultMemory();
	
	S_teststep("Set IGN Voltage '$tcpar_v_lowIGN' volts.", 'AUTO_NBR');
	LC_SetVoltage(9);
	GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	GDCOM_request('22 10 1B', '', 'relax' );
	#S_wait_ms(500);
	
	S_teststep("Remove '$tcpar_Fault' on '$tcpar_MSGID'", 'AUTO_NBR');
	CA_set_EnvVar_value($DLCVarName,8);   
		
	S_teststep("Wait for '$tcpar_t_DisQuali' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_DisQuali);	
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_readDTC' with StatusMask is FF", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 1
	$Response_obtained = GDCOM_request($tcpar_Req_readDTC,$tcpar_ReadDTCResp, 'strict' );
	
	S_teststep("Set IGN Voltage '$tcpar_v_highIGN' volts.", 'AUTO_NBR');
	LC_SetVoltage(11);
	GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	GDCOM_request('22 10 1B', '', 'relax' );
	
	S_teststep("Wait for 1000 msec.", 'AUTO_NBR');
	S_wait_ms(1000);
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_readDTC' with StatusMask is FF", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 2
	$Response_obtained1 = GDCOM_request($tcpar_Req_readDTC,$tcpar_ReadDTCResp, 'strict' );
	
	S_teststep("Wait for '$tcpar_t_DisQuali' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_DisQuali);
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_readDTC' with StatusMask is FF", 'AUTO_NBR', 'send_req_readdtc_C');			#measurement 3
	$Response_obtained2 = GDCOM_request($tcpar_Req_readDTC,$tcpar_ReadDTCResp1, 'strict' );
	
	S_teststep("Check Warning lamp signal '$tcpar_WL_Signal' of ABG0x33A MSGID", 'AUTO_NBR', 'check_warning_lamp');			#measurement 4
    ($WarningLamp_Status,$unit) = CA_read_can_signal($tcpar_WL_Signal,'phys' );
	S_teststep("Warning lamp = '$WarningLamp_Status'", 'AUTO_NBR');	
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed", 'send_req_readdtc_A');			#evaluation 1
	S_teststep_detected("DTC response is obtained $Response_obtained", 'send_req_readdtc_A');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $Response_obtained);
	
	S_teststep_expected("'$tcpar_ReadDTCResp'  should be observed.", 'send_req_readdtc_B');			#evaluation 2
	S_teststep_detected("DTC response is obtained $Response_obtained1", 'send_req_readdtc_B');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $Response_obtained1);
	
	S_teststep_expected("'$tcpar_ReadDTCResp1'  should be observed.", 'send_req_readdtc_C');			#evaluation 3
	S_teststep_detected("DTC response is obtained $Response_obtained2", 'send_req_readdtc_C');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp1, $Response_obtained2);
	
	S_teststep_expected("'$tcpar_WL_Signal' of ABG0x33A  should be '$tcpar_WL_value'. ", 'check_warning_lamp');			#evaluation 4
	S_teststep_detected("Value of warning lamp is $WarningLamp_Status", 'check_warning_lamp');
	EVAL_evaluate_value ("WarningLamp Status Check" , $tcpar_WL_value ,'==', $WarningLamp_Status);
	return 1;
}

sub TC_finalization {
	
	CA_set_EnvVar_value($DLCVarName,8);  
	LC_ECU_Reset();
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request('31 01 AC AC','71 01 AC AC','strict');
    S_wait_ms(5000);
	return 1;
}

1;
