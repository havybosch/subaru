#### TEST CASE MODULE
package TC_COA_FaultPriority_Masking;

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
use LIFT_equipment;
use LIFT_can_access;
use LIFT_flexray_access;
use FuncLib_SYC_INTERFACE;
use LIFT_QuaTe;
use LIFT_numerics;
use LIFT_CANoe;
use LIFT_CD_CAN;
use LIFT_POWER;
use LIFT_PD;
use LIFT_evaluation;
use FuncLib_TNT_COM;
use FuncLib_TNT_GEN;
use LIFT_DCOM;    #necessary
use FuncLib_Project_FM;
use LIFT_ProdDiag;
#use LIFT_PD2ProdDiag;
#include further modules here
use GENERIC_DCOM;
use LIFT_PRITT;
use LIFT_labcar;    #necessary
use LIFT_crash_simulation;
use LIFT_equipment;
use LIFT_MDSRESULT;
use GENERIC_DCOM;
require LIFT_PD2ProdDiag; 
import LIFT_PD2ProdDiag; 
##################################

our $PURPOSE = "Check fault from high to low priority";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_FaultPriority_Masking

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


I<B<Stimulation and Measurement>>

1.Switch ON ECU.

2.Wait for 7secs.

3.Create <Faults> on <MsgID>

4.Wait for <t_BusoffQual> msec.

5.Send <Req_readDTC> with Status Mask is FF.

6.Remove <Fault1>  condition.

7.Wait for <t_LOCQual> msec.

8.Send <Req_readDTC> with Status Mask is FF.

9.Remove <Fault2> condition.

10.Wait for <t_LOCDQual> msec.

11.Send <Req_readDTC> with Status Mask is FF.

12.Remove <Fault3> condition.

13.Wait for <t_DLCDQual>

14.Send <Req_readDTC> with Status Mask is FF.

15. Remove <Fault4> condition and wait for <t_CRCDequa>

16. Send <Req_readDTC> with Status Mask is FF.


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.

6.-

7.-

8.<ReadDTCResp1> should be observed

9.-

10.-

11.<ReadDTCResp1> should be observed

12.-

13.-

14.<ReadDTCResp2> should be observed

15.

16. <ReadDTCResp2> should be observed


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 't_LOCQual' => 
	SCALAR 't_LOCDQual' => 
	SCALAR 't_DLCDQual' => 
	SCALAR 'ReadDTCResp1' => 
	SCALAR 'ReadDTCResp2' => 
	SCALAR 'purpose' => 
	LIST 'Faults' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Fault3' => 
	SCALAR 'Fault4' => 
	SCALAR 'MSGID' => 
	SCALAR 't_BusoffQual' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 't_CRCDequa' => 
	SCALAR 'ReadDTCResp' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the masking of higher priority faults over the lower priority of faults .
	# input parameters
	Faults = @('rb_coa_CANBusOff_flt','rb_coa_<Test Heading 1>RxMsgTimeout_flt','rb_coa_<Test Heading 1>RxMsgDLCError_flt','rb_coa_<Test Heading 1>RxMsgChecksumError_flt','rb_coa_<Test Heading 1>RxMsgCounterError_flt')
	Fault1='rb_coa_CANBusOff_flt'
	Fault2='rb_coa_<Test Heading 1>RxMsgTimeout_flt'
	Fault3='rb_coa_<Test Heading 1>RxMsgDLCError_flt'
	Fault4 ='rb_coa_<Test Heading 1>RxMsgChecksumError_flt'
	MSGID='<Test Heading 2>'
	t_BusoffQual='500'
	Req_readDTC ='19 02 FF'
	t_CRCDequa = '1000'
	#output parameters
	ReadDTCResp='No Msg transmission'
	t_LOCQual='400'
	t_LOCDQual='800'
	t_DLCDQual ='400'
	ReadDTCResp1 = '59 02 0A C0 73 00 0A C1 00 00 0A'#BusoFF and LOC fault qualified
	
	ReadDTCResp2 = '59 02 0A C0 73 00 0A C1 00 00 0A C4 01 00 0A'#LOC and DLC fault disqulaified ,Checkusm and Messagecounter fault qualified

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Faults;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Fault3;
my $tcpar_Fault4;
my $tcpar_MSGID;
my $tcpar_t_BusoffQual;
my $tcpar_Req_readDTC;
my $tcpar_t_CRCDequa;
my $tcpar_ReadDTCResp;
my $tcpar_t_LOCQual;
my $tcpar_t_LOCDQual;
my $tcpar_t_DLCDQual;
my $tcpar_ReadDTCResp1;
my $tcpar_ReadDTCResp2;

################ global parameter declaration ###################
#add any global variables here
my $CAN_Mapping;
my $res;
my $res1;
my $res2;
my $res3;
my $res4;
my $DLCVarName;
my $csVarName;
my $cntVarName;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Faults =  GEN_Read_mandatory_testcase_parameter( 'Faults' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Fault3 =  GEN_Read_mandatory_testcase_parameter( 'Fault3' );
	$tcpar_Fault4 =  GEN_Read_mandatory_testcase_parameter( 'Fault4' );
	$tcpar_MSGID =  GEN_Read_mandatory_testcase_parameter( 'MSGID' );
	$tcpar_t_BusoffQual =  GEN_Read_mandatory_testcase_parameter( 't_BusoffQual' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_t_CRCDequa =  GEN_Read_mandatory_testcase_parameter( 't_CRCDequa' );
	$tcpar_ReadDTCResp =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp' );
	$tcpar_t_LOCQual =  GEN_Read_mandatory_testcase_parameter( 't_LOCQual' );
	$tcpar_t_LOCDQual =  GEN_Read_mandatory_testcase_parameter( 't_LOCDQual' );
	$tcpar_t_DLCDQual =  GEN_Read_mandatory_testcase_parameter( 't_DLCDQual' );
	$tcpar_ReadDTCResp1 =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp1' );
	$tcpar_ReadDTCResp2 =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp2' );

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
    GDCOM_init() ; # To fetch info for CD from mapping_diag
	
  
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

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON ECU.", 'AUTO_NBR');
	LC_ECU_On();
	
	S_teststep("Wait for 7secs.", 'AUTO_NBR');
	S_wait_ms(7000);
	
	#Create Faults
	S_teststep("Create '@tcpar_Faults' on '$tcpar_MSGID'", 'AUTO_NBR');
	$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	LC_ShortLines(['CAN1+','CAN1-']);
	COM_stopMessages($tcpar_MSGID);
	S_wait_ms(200);
	#DLC fault
	$DLCVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_DLC'};
	CA_set_EnvVar_value($DLCVarName,0);	
	S_wait_ms(200);	
	#Checksum fault
	if ($tcpar_MSGID eq 'BIU660')
	{
		S_w2rep("Checksum fault not available",'Purple');
	}else {
		$csVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_CS'};
		CA_set_EnvVar_value($csVarName ,1);
		S_wait_ms(200);
	}
	
	#Counter fault
	if ($tcpar_MSGID eq 'BIU660')
	{
		S_w2rep("Counter fault not available",'Purple');
	}else {
		$cntVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName ,1);
		S_wait_ms(200);
	}
	#-----------------------------------------------------------------------------------
	
	S_teststep("Wait for '$tcpar_t_BusoffQual' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_BusoffQual);
		
	S_teststep("Send '$tcpar_Req_readDTC' with Status Mask is FF.", 'AUTO_NBR');
	$res = GDCOM_request($tcpar_Req_readDTC,'', 'relax');
	
	S_teststep("Remove '$tcpar_Fault1'  condition.", 'AUTO_NBR');
	LC_UndoShortLines( );
	S_wait_ms(1000);
	my $flt_mem_struct_pd1 = PD_ReadFaultMemory();
	PD_check_fault_status($flt_mem_struct_pd1,$tcpar_Fault1, 0x2F);
	$res = GDCOM_request($tcpar_Req_readDTC,'', 'relax');
	
	S_teststep("Wait for '$tcpar_t_LOCQual' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_LOCQual);
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_readDTC' with Status Mask is FF.", 'AUTO_NBR', 'send_req_readdtcwith_A');			#measurement 1
	$res1 = GDCOM_request($tcpar_Req_readDTC, $tcpar_ReadDTCResp1, 'strict');
	
	S_teststep("Remove '$tcpar_Fault2' condition.", 'AUTO_NBR');
	COM_startMessages($tcpar_MSGID);
	S_wait_ms(1000);
	PD_ReadFaultMemory();
	
	S_teststep("Wait for '$tcpar_t_LOCDQual' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_LOCDQual);
	my $flt_mem_struct_pd2 = PD_ReadFaultMemory();
	PD_check_fault_status($flt_mem_struct_pd2,$tcpar_Fault2, 0x2F);
	
	S_teststep("Send '$tcpar_Req_readDTC' with Status Mask is FF.", 'AUTO_NBR', 'send_req_readdtcwith_B');			#measurement 2
	$res2 = GDCOM_request($tcpar_Req_readDTC, $tcpar_ReadDTCResp1, 'strict');
	
	S_teststep("Remove '$tcpar_Fault3' condition.", 'AUTO_NBR');
	CA_set_EnvVar_value($DLCVarName,8);	
	S_wait_ms(1000);
	
	S_teststep("Wait for '$tcpar_t_DLCDQual'", 'AUTO_NBR');
	S_wait_ms($tcpar_t_DLCDQual);
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_readDTC' with Status Mask is FF.", 'AUTO_NBR', 'send_req_readdtc');			#measurement 3
	$res3 = GDCOM_request($tcpar_Req_readDTC, $tcpar_ReadDTCResp2, 'strict');
	
	if ($tcpar_MSGID eq 'BIU660'){
		S_w2rep("Ignored the dequalification of checksum fault since not applicable",'Purple');
	}else{
		S_teststep("Remove '$tcpar_Fault4' condition and wait for '$tcpar_t_CRCDequa'", 'AUTO_NBR');
		CA_set_EnvVar_value($csVarName ,0);	
		LC_ECU_Reset();
		S_wait_ms(1000);
		S_w2rep("Bus off will be dequalified due to IGN reset",'Purple');
		PD_ReadFaultMemory();
	}
	
	S_teststep("Send '$tcpar_Req_readDTC'with Status Mask is FF.", 'AUTO_NBR', 'send_req_readdtcwith_C');			#measurement 4
	$res4 = GDCOM_request($tcpar_Req_readDTC, $tcpar_ReadDTCResp2, 'strict');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_ReadDTCResp1' should be observed", 'send_req_readdtcwith_A');			#evaluation 1
	S_teststep_detected("DTC response is obtained $res1", 'send_req_readdtcwith_A');
	EVAL_evaluate_string("DTC response Check", $tcpar_ReadDTCResp1, $res1);
	
	S_teststep_expected("'$tcpar_ReadDTCResp1' should be observed", 'send_req_readdtcwith_B');			#evaluation 2
	S_teststep_detected("DTC response is obtained $res2", 'send_req_readdtcwith_B');
	EVAL_evaluate_string("DTC response Check", $tcpar_ReadDTCResp1, $res2);
	
	S_teststep_expected("'$tcpar_ReadDTCResp2' should be observed", 'send_req_readdtc');			#evaluation 3
	S_teststep_detected("DTC response is obtained $res3", 'send_req_readdtc');
	EVAL_evaluate_string("DTC response Check", $tcpar_ReadDTCResp2, $res3);
	
	S_teststep_expected("'$tcpar_ReadDTCResp2' should be observed", 'send_req_readdtcwith_C');			#evaluation 4
	S_teststep_detected("DTC response is obtained $res4", 'send_req_readdtcwith_C');
	EVAL_evaluate_string("DTC response Check", $tcpar_ReadDTCResp2, $res4);
	return 1;
}

sub TC_finalization {
	CA_set_EnvVar_value($cntVarName ,0);
	LC_ECU_Reset();
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request('31 01 AC AC','71 01 AC AC','strict');
    S_wait_ms(3000);
	return 1;
}


1;
