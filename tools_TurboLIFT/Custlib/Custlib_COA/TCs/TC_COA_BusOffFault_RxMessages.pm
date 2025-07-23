#### TEST CASE MODULE
package TC_COA_BusOffFault_RxMessages;

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
use LIFT_DCOM;    #necessary
use FuncLib_Project_FM;
use LIFT_ProdDiag;
#include further modules here
use GENERIC_DCOM;
use LIFT_PRITT;
use LIFT_labcar;    #necessary
require LIFT_PD2ProdDiag; 
import LIFT_PD2ProdDiag; 
##################################

our $PURPOSE = "To check the value Rx Messages during Bus off fault";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_BusOffFault_RxMessages

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Reset ECU

2. Wait for <WaitTime>

3. Keep Trip Counter to <Value1> and Time Counter to <Value2> for <RxMessage>

4. Create <Fault_Condition>

5. Change Trip Counter to <NewValue1> and Time Counter to <NewValue2> for <RxMessage>

6. Create <ExternalFault>

7. Wait for <WaitTime1>

8. Remove the <Fault_Condition>

9. Send <Req_ReadDTCSnapshotRecord>.


I<B<Evaluation>>

1.

2.

3.

4.

5.

6.

7.

8.

9. <PR_ReadDTCSnapshotRecord> should be observed with old value of Trip Counter.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Fault_Condition' => 
	SCALAR 'WaitTime' => 
	SCALAR 'WaitTime1' => 
	SCALAR 'Value1' => 
	SCALAR 'Value2' => 
	SCALAR 'RxMessage' => 
	SCALAR 'NewValue1' => 
	SCALAR 'NewValue2' => 
	SCALAR 'ExternalFault' => 
	SCALAR 'Req_ReadDTCSnapshotRecord' => 
	SCALAR 'PR_ReadDTCSnapshotRecord' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the value Rx Messages during Bus off fault'
	
	# input parameters
	Fault_Condition = '<Test Heading>'
	WaitTime = '6000' #ms
	WaitTime1 = '1000' #ms
	Value1 = '4'
	Value2 = '4'
	RxMessage = 'BIU660'
	NewValue1 = '5'
	NewValue2 = '6'
	ExternalFault = 'rb_sqm_SquibResistanceOpenIC1FL_flt'
	Req_ReadDTCSnapshotRecord = '19 05 FF'
	
	#output parameters
	PR_ReadDTCSnapshotRecord = '59 05 01 C0 73 00 0A 01 10 1E 00 04 00 XX XX XX 02 98 36 00 0A 01 10 1E 00 04 00 XX XX XX'    # time counter varies from 4 to 8 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Fault_Condition;
my $tcpar_WaitTime;
my $tcpar_WaitTime1;
my $tcpar_Value1;
my $tcpar_Value2;
my $tcpar_RxMessage;
my $tcpar_NewValue1;
my $tcpar_NewValue2;
my $tcpar_ExternalFault;
my $tcpar_Req_ReadDTCSnapshotRecord;
my $tcpar_PR_ReadDTCSnapshotRecord;

################ global parameter declaration ###################
#add any global variables here
my $res;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Fault_Condition =  GEN_Read_mandatory_testcase_parameter( 'Fault_Condition' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_WaitTime1 =  GEN_Read_mandatory_testcase_parameter( 'WaitTime1' );
	$tcpar_Value1 =  GEN_Read_mandatory_testcase_parameter( 'Value1' );
	$tcpar_Value2 =  GEN_Read_mandatory_testcase_parameter( 'Value2' );
	$tcpar_RxMessage =  GEN_Read_mandatory_testcase_parameter( 'RxMessage' );
	$tcpar_NewValue1 =  GEN_Read_mandatory_testcase_parameter( 'NewValue1' );
	$tcpar_NewValue2 =  GEN_Read_mandatory_testcase_parameter( 'NewValue2' );
	$tcpar_ExternalFault =  GEN_Read_mandatory_testcase_parameter( 'ExternalFault' );
	$tcpar_Req_ReadDTCSnapshotRecord =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTCSnapshotRecord' );
	$tcpar_PR_ReadDTCSnapshotRecord =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTCSnapshotRecord' );

	return 1;
}

sub TC_initialization {
	LC_ECU_Reset();
	S_wait_ms(500);
	S_w2rep("Start the CANOe Measurement and CAN trace\n",'Purple');
	CA_trace_start();
	
	S_w2rep("Fetch the DIAG Mapping and CAN Mapping Info\n",'Purple');
	GDCOM_init(); 
	
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	#GEN_StandardPrepNoFault();
	PD_ClearFaultMemory();	
	PD_ReadFaultMemory();
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Reset ECU", 'AUTO_NBR');
	LC_ECU_Reset();
	
	S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
	S_wait_ms($tcpar_WaitTime);
	
	S_teststep("Keep Trip Counter to '$tcpar_Value1' and Time Counter to '$tcpar_Value2' for '$tcpar_RxMessage'", 'AUTO_NBR');
	CA_write_can_signal ('BIU660_3_0_COUNT_TRIP' ,$tcpar_Value1, 'phys');
	CA_write_can_signal ('BIU660_7_0_COUNT_TIME' ,$tcpar_Value2, 'phys');
	S_wait_ms(200);
	
	S_teststep("Create '$tcpar_Fault_Condition'", 'AUTO_NBR');
	LC_ShortLines(['CAN1+','CAN1-']);
		
	S_teststep("Change Trip Counter to '$tcpar_NewValue1' and Time Counter to '$tcpar_NewValue2' for '$tcpar_RxMessage'", 'AUTO_NBR');
	CA_write_can_signal ('BIU660_3_0_COUNT_TRIP' ,$tcpar_NewValue1, 'phys');
	CA_write_can_signal ('BIU660_7_0_COUNT_TIME' ,$tcpar_NewValue2, 'phys');
	S_wait_ms(200);
	
	S_teststep("Create '$tcpar_ExternalFault'", 'AUTO_NBR');
	LC_DisconnectLine('IC1FL');
	
	S_teststep("Wait for '$tcpar_WaitTime1'", 'AUTO_NBR');
	S_wait_ms($tcpar_WaitTime1);
		
	S_teststep("Remove the '$tcpar_Fault_Condition'", 'AUTO_NBR');
	LC_UndoShortLines( );
	my $flt_mem_struct_pd = PD_ReadFaultMemory();
	PD_check_fault_status($flt_mem_struct_pd,'rb_coa_CANBusOff_flt', 0x2F);
	
	S_teststep("Send '$tcpar_Req_ReadDTCSnapshotRecord'.", 'AUTO_NBR', 'send_req_readdtcsnapshotrecord');			#measurement 1
	$res = GDCOM_request($tcpar_Req_ReadDTCSnapshotRecord, '', 'relax');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be observed with old value of Trip Counter.", 'send_req_readdtcsnapshotrecord');			#evaluation 1
	S_teststep_detected("DTC snapshot record response is $res", 'send_req_readdtcsnapshotrecord');
	my @sub_rsp = split(/ /,$res);
	EVAL_evaluate_value("Checking vaue of byte 1", @sub_rsp[0],'==',0x59);
	EVAL_evaluate_value("Checking vaue of byte 2", @sub_rsp[1],'==',0x05);
	EVAL_evaluate_value("Checking vaue of byte 3", @sub_rsp[2],'==',0x01);
	EVAL_evaluate_value("Checking vaue of byte 4", @sub_rsp[3],'==',0xC0);
	EVAL_evaluate_value("Checking vaue of byte 5", @sub_rsp[4],'==',0x73);
	EVAL_evaluate_value("Checking vaue of byte 6", @sub_rsp[5],'==',0x00);
	EVAL_evaluate_value("Checking vaue of byte 7", @sub_rsp[6],'==',0x0A);
	EVAL_evaluate_value("Checking vaue of byte 8", @sub_rsp[7],'==',0x01);
	EVAL_evaluate_value("Checking vaue of byte 9", @sub_rsp[8],'==',0x10);
	EVAL_evaluate_value("Checking vaue of byte 10",@sub_rsp[9],'==',0x1E);
	EVAL_evaluate_value("Checking vaue of byte 11",@sub_rsp[10],'==',0x00);
	EVAL_evaluate_value("Checking vaue of byte 12",@sub_rsp[11],'==',0x04);
	EVAL_evaluate_value("Checking vaue of byte 17",@sub_rsp[16],'==',0x02);
	EVAL_evaluate_value("Checking vaue of byte 18",@sub_rsp[17],'==',0x98);
	EVAL_evaluate_value("Checking vaue of byte 19",@sub_rsp[18],'==',0x36);
	EVAL_evaluate_value("Checking vaue of byte 20",@sub_rsp[19],'==',0x00);
	EVAL_evaluate_value("Checking vaue of byte 21",@sub_rsp[20],'==',0x0A);
	EVAL_evaluate_value("Checking vaue of byte 22",@sub_rsp[21],'==',0x01);
	EVAL_evaluate_value("Checking vaue of byte 23",@sub_rsp[22],'==',0x10);
	EVAL_evaluate_value("Checking vaue of byte 24",@sub_rsp[23],'==',0x1E);
	EVAL_evaluate_value("Checking vaue of byte 25",@sub_rsp[24],'==',0x00);
	EVAL_evaluate_value("Checking vaue of byte 26",@sub_rsp[25],'==',0x04);
	return 1;
}

sub TC_finalization {
	CA_write_can_signal ('BIU660_3_0_COUNT_TRIP' ,'0', 'phys');
	CA_write_can_signal ('BIU660_7_0_COUNT_TIME' ,'0', 'phys');
	S_wait_ms(200);
	LC_ConnectLine('IC1FL');
	LC_ECU_Reset();
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request_general('REQ_ClearDTCInformation_all', 'PR_ClearDTCInformation_all','strict');
	PRD_Clear_Fault_Memory();
    S_wait_ms(3000);
	return 1;
}


1;
