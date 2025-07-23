#### TEST CASE MODULE
package TC_DEM_ExtraRAM;

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
use FuncLib_TNT_DEVICE;
use FuncLib_TNT_GEN;
use LIFT_DCOM;    #necessary
use FuncLib_Project_FM;
use FuncLib_Project_DEVICE;
use LIFT_ProdDiag;
require LIFT_PD2ProdDiag; 
import LIFT_PD2ProdDiag; 
#include further modules here
use GENERIC_DCOM;
use LIFT_PRITT;
use LIFT_labcar;    #necessary
##################################

our $PURPOSE = "To check the Fault recording in to Extra RAM";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DEM_ExtraRAM

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard preparation

2.Set following values for MsgIDBIU660 signals

BIU660_3_0_COUNT_TRIP = '00 03'


BIU660_7_0_COUNT_TIME = '00 00 08'


I<B<Stimulation and Measurement>>

1.Switch ON ECU.

2.Create <Faults>

3.Wait for <t_Qual>.

4.Create <ExtraRAM_Fault>.

5.wait for <t_Qualitime> msec.

6.Send <Req_snapshotDTC>  <DTCSnapshotrecordnumber>

7. Reset ECU

8. Send <Req_snapshotDTC>  <DTCSnapshotrecordnumber>


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.-

6.<PR_ReportDTCSnapshot_reponse> should be observed.

7.

8. <PR_ReportDTCSnapshot_reponse1> should be observed.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'ExtraRAM_Fault' => 
	SCALAR 't_Qualitime' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse1' => 
	SCALAR 'purpose' => 
	SCALAR 'Faults' => 
	SCALAR 'Req_snapshotDTC' => 
	SCALAR 'DTCSnapshotrecordnumber' => 
	SCALAR 't_Qual' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the Fault recording in to Extra RAM'
	#description of test case
	# input parameters
	Faults = '32Normalfaults'
	Req_snapshotDTC ='19 05'
	DTCSnapshotrecordnumber = '29'
	t_Qual= '60000'
	#output parameters 
	ExtraRAM_Fault= 'rb_sqm_TerminalShort2GndAB1FD_flt'
	t_Qualitime= '2000'
	PR_ReportDTCSnapshot_reponse= '59 05 29 98 02 00 0A 01 10 1E 00 03 00 00 0X'
	PR_ReportDTCSnapshot_reponse1 = 'NA'
	#note-X varies from 8-B 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Faults;
my $tcpar_Req_snapshotDTC;
my $tcpar_DTCSnapshotrecordnumber;
my $tcpar_t_Qual;
my $tcpar_ExtraRAM_Fault;
my $tcpar_t_Qualitime;
my $tcpar_PR_ReportDTCSnapshot_reponse;
my $tcpar_PR_ReportDTCSnapshot_reponse1;

################ global parameter declaration ###################
#add any global variables here
my $DTCMemory;
my $res1;
my $res2;
my $TracePath;
my $CAN_Mapping;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Faults =  GEN_Read_mandatory_testcase_parameter( 'Faults' );
	$tcpar_Req_snapshotDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_snapshotDTC' );
	$tcpar_DTCSnapshotrecordnumber =  GEN_Read_mandatory_testcase_parameter( 'DTCSnapshotrecordnumber' );
	$tcpar_t_Qual =  GEN_Read_mandatory_testcase_parameter( 't_Qual' );
	$tcpar_ExtraRAM_Fault =  GEN_Read_mandatory_testcase_parameter( 'ExtraRAM_Fault' );
	$tcpar_t_Qualitime =  GEN_Read_mandatory_testcase_parameter( 't_Qualitime' );
	$tcpar_PR_ReportDTCSnapshot_reponse =  GEN_Read_mandatory_testcase_parameter( 'PR_ReportDTCSnapshot_reponse' );
	$tcpar_PR_ReportDTCSnapshot_reponse1 =  GEN_Read_mandatory_testcase_parameter( 'PR_ReportDTCSnapshot_reponse1' );

	return 1;
}

sub TC_initialization {
	S_w2rep("Start the CANOe Measurement and CAN trace\n",'Purple');
	CA_trace_start();
	
	S_w2rep("Fetch the DIAG Mapping and CAN Mapping Info\n",'Purple');
	GDCOM_init();
	 
	S_teststep("1.Standard preparation", 'AUTO_NBR');
	#GEN_StandardPrepNoFault();		
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
 	
	S_teststep("2.Set following values for MsgIDBIU660 signals", 'AUTO_NBR');

	S_teststep("BIU660_3_0_COUNT_TRIP = '00 03'", 'AUTO_NBR');
	CA_write_can_signal ('BIU660_3_0_COUNT_TRIP', '3' , 'phys');
	S_wait_ms(1000);
	
	S_teststep("BIU660_7_0_COUNT_TIME = '00 00 08'", 'AUTO_NBR');
	CA_write_can_signal ('BIU660_7_0_COUNT_TIME', '800' , 'phys');
	S_wait_ms(1000);
	
	return 1;
}

sub TC_stimulation_and_measurement {
	#CA_trace_start();
	S_teststep("Switch ON ECU.", 'AUTO_NBR');
	LC_ECU_On();
	S_wait_ms(1000);
	$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	
	S_teststep("Create '$tcpar_Faults'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__MET390_FAIL_UART_WA_BOX','1');
	S_wait_ms(1000);	
	my ($UART,$unit)= CA_read_can_signal('MET390_6_5_FAIL_UART_WA_BOX','phys');
	if ($tcpar_Faults eq '31Normalfaults')
	{
		S_w2rep("Created 31 normal faults",'green');
		_SetDevice();
	}elsif($tcpar_Faults eq '32Normalfaults')
	{
		S_w2rep("Created 32 normal faults",'green');
		_SetDevice();
		
	}	
	S_user_action("check faults");
	
	S_teststep("Wait for '$tcpar_t_Qual'.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual);
	
	$DTCMemory = FM_CD_readFaultMemory(0xFF);
		
	S_teststep("Create '$tcpar_ExtraRAM_Fault'.", 'AUTO_NBR');
	if ($tcpar_ExtraRAM_Fault eq 'rb_sqm_TerminalShort2GndAB1FD_flt')
	{
		DEVICE_setDeviceState ('AB1FD', 'Short2Gnd');
	}elsif($tcpar_ExtraRAM_Fault eq 'rb_coa_EGIRxMsgCounterError_flt')
	{		
		CA_set_EnvVar_value('_enV_EGI040_MsgCtrError',1);
	}elsif($tcpar_ExtraRAM_Fault eq 'rb_coa_EGIRxMsgChecksumError_flt')
	{		
		CA_set_EnvVar_value('_enV_EGI040_CheckSumError',1);
	}elsif($tcpar_ExtraRAM_Fault eq 'rb_coa_EGIRxMsgTimeout_flt')
	{		
		CA_set_EnvVar_value('_enV_EGI040_StartStop',0);
	}elsif($tcpar_ExtraRAM_Fault eq 'rb_coa_CANBusOff_flt')
	{		
		LC_ShortLines(['CAN1+','CAN1-']);
	}else
	{
		#S_user_action("Semi manual testing");
		S_wait_ms(500);
	}
	
	S_teststep("wait for '$tcpar_t_Qualitime' msec.", 'AUTO_NBR');
	if ($tcpar_t_Qualitime eq 'immediate')
	{
		S_w2rep("No need to wait",'green');
	}else
	{
		S_wait_ms($tcpar_t_Qualitime);
	}	
	
	S_teststep("Send '$tcpar_Req_snapshotDTC'  '$tcpar_DTCSnapshotrecordnumber'", 'AUTO_NBR', 'send_req_snapshotdtc_A');			#measurement 1
	if($tcpar_ExtraRAM_Fault eq 'rb_coa_CANBusOff_flt')
	{		
		LC_UndoShortLines( );
		$res1 = GDCOM_request($tcpar_Req_snapshotDTC.' '.$tcpar_DTCSnapshotrecordnumber,'', 'relax');
	}else{
		$res1 = GDCOM_request($tcpar_Req_snapshotDTC.' '.$tcpar_DTCSnapshotrecordnumber,'', 'relax');
	}	
	
	S_teststep("Reset ECU", 'AUTO_NBR');
	LC_ECU_Reset();
	
	S_teststep("Send '$tcpar_Req_snapshotDTC'  '$tcpar_DTCSnapshotrecordnumber'", 'AUTO_NBR', 'send_req_snapshotdtc_B');			#measurement 2
	if ($tcpar_ExtraRAM_Fault eq 'rb_sqm_AB1FDSquibResistanceOpen_flt')
	{		
		$res2 = GDCOM_request($tcpar_Req_snapshotDTC.' '.$tcpar_DTCSnapshotrecordnumber,'', 'relax');
	}else
	{
		S_w2rep("No need to do",'green');
	}
	

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse' should be observed.", 'send_req_snapshotdtc_A');			#evaluation 1
	S_teststep_detected("Response is $res1", 'send_req_snapshotdtc_A');

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse1' should be observed.", 'send_req_snapshotdtc_B');			#evaluation 2
	if ($tcpar_ExtraRAM_Fault eq 'rb_sqm_AB1FDSquibResistanceOpen_flt')
	{
		S_teststep_detected("Response is $res2", 'send_req_snapshotdtc_B');
	}else
	{
		S_w2rep("No need to check",'green');
	}
	#$TracePath = GEN_printLink(CA_trace_store(GEN_generateUniqueTraceName()));   
   # CA_trace_stop();
	return 1;
}

sub TC_finalization {
	 _ResetDevice();
	 _resetFLT($tcpar_ExtraRAM_Fault);
	
	CA_set_EnvVar_value('_Env__MET390_FAIL_UART_WA_BOX','0');
	
	S_wait_ms(1000);
	LC_ECU_Reset();
	S_wait_ms(1000);
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request('31 01 AC AC','','relax');
    S_wait_ms(5000);
	return 1;
}

sub _resetFLT{
	my $flt = shift;
	if ($flt eq 'rb_sqm_TerminalShort2GndAB1FD_flt')
	{
		DEVICE_resetDeviceState ('AB1FD', 'Short2Gnd');
	}elsif($flt eq 'rb_coa_EGIRxMsgCounterError_flt')
	{		
		CA_set_EnvVar_value('_enV_EGI040_MsgCtrError',0);
	}elsif($flt eq 'rb_coa_EGIRxMsgChecksumError_flt')
	{		
		CA_set_EnvVar_value('_enV_EGI040_CheckSumError',0);
	}elsif($flt eq 'rb_coa_EGIRxMsgTimeout_flt')
	{		
		CA_set_EnvVar_value('_enV_EGI040_StartStop',1);
	}
	LC_ECU_Reset();
return 1;	
}
sub _SetDevice {
	#5 flts cs
		CA_set_EnvVar_value('_enV_TCU048_CheckSumError',1);
		CA_set_EnvVar_value('_enV_VDC138_CheckSumError',1);
		CA_set_EnvVar_value('_enV_MET390_CheckSumError',1);
		CA_set_EnvVar_value('_enV_BIU3AC_CheckSumError',1);
		CA_set_EnvVar_value('_enV_EPB32B_CheckSumError',1);
		S_wait_ms(500);
		#7 flts timeout
		CA_set_EnvVar_value('_enV_TCU048_StartStop',0);
		CA_set_EnvVar_value('_enV_VDC138_StartStop',0);
		#CA_set_EnvVar_value('_enV_EGI345_StartStop',0);
		CA_set_EnvVar_value('_enV_MET390_StartStop',0);
		CA_set_EnvVar_value('_enV_BIU3AC_StartStop',0);
		CA_set_EnvVar_value('_enV_BIU660_StartStop',0);
		CA_set_EnvVar_value('_enV_EPB32B_StartStop',0);	
		S_wait_ms(500);
		#7 flts for sensor
		DEVICE_setDeviceState ('UFSL', 'Openline');
		DEVICE_setDeviceState ('UFSR', 'Openline');
		DEVICE_setDeviceState ('PASFL', 'Openline');
		DEVICE_setDeviceState ('PASFR', 'Openline');
		DEVICE_setDeviceState ('PASML', 'Openline');
		DEVICE_setDeviceState ('PASMR', 'Openline');
		DEVICE_setDeviceState ('PASRC', 'Openline');
		S_wait_ms(500);
		#12 flts for squib
		DEVICE_setDeviceState ('KA1FD', 'Openline');
		DEVICE_setDeviceState ('AB1FP', 'Openline');
		DEVICE_setDeviceState ('BT1FL', 'Openline');
		DEVICE_setDeviceState ('BT1FR', 'Openline');
		DEVICE_setDeviceState ('BT1RR', 'Openline');
		DEVICE_setDeviceState ('IC1FL', 'Openline');
		DEVICE_setDeviceState ('IC1FR', 'Openline');
		DEVICE_setDeviceState ('SA1FL', 'Openline');
		DEVICE_setDeviceState ('SA1FR', 'Openline');
		DEVICE_setDeviceState ('BT1RL', 'Openline');
		DEVICE_setDeviceState ('BT2FL', 'Openline');
		DEVICE_setDeviceState ('BT2FR', 'Openline');
		S_wait_ms(500);
	return 1;
}

sub _ResetDevice {
		#7 flts timeout
		CA_set_EnvVar_value('_enV_TCU048_StartStop',1);
		CA_set_EnvVar_value('_enV_VDC138_StartStop',1);
		#CA_set_EnvVar_value('_enV_EGI345_StartStop',1);
		CA_set_EnvVar_value('_enV_MET390_StartStop',1);
		CA_set_EnvVar_value('_enV_BIU3AC_StartStop',1);
		CA_set_EnvVar_value('_enV_BIU660_StartStop',1);
		CA_set_EnvVar_value('_enV_EPB32B_StartStop',1);
		
		#5 flts cs
		CA_set_EnvVar_value('_enV_TCU048_CheckSumError',0);
		CA_set_EnvVar_value('_enV_VDC138_CheckSumError',0);
		CA_set_EnvVar_value('_enV_MET390_CheckSumError',0);
		CA_set_EnvVar_value('_enV_BIU3AC_CheckSumError',0);
		CA_set_EnvVar_value('_enV_EPB32B_CheckSumError',0);
	
		#7 flts for sensor
		DEVICE_resetDeviceState ('UFSL', 'Openline');
		DEVICE_resetDeviceState ('UFSR', 'Openline');
		DEVICE_resetDeviceState ('PASFL', 'Openline');
		DEVICE_resetDeviceState ('PASFR', 'Openline');
		DEVICE_resetDeviceState ('PASML', 'Openline');
		DEVICE_resetDeviceState ('PASMR', 'Openline');
		DEVICE_resetDeviceState ('PASRC', 'Openline');
		#12 flts for squib
		DEVICE_resetDeviceState ('KA1FD', 'Openline');
		DEVICE_resetDeviceState ('AB1FP', 'Openline');
		DEVICE_resetDeviceState ('BT1FL', 'Openline');
		DEVICE_resetDeviceState ('BT1FR', 'Openline');
		DEVICE_resetDeviceState ('BT1RR', 'Openline');
		DEVICE_resetDeviceState ('IC1FL', 'Openline');
		DEVICE_resetDeviceState ('IC1FR', 'Openline');
		DEVICE_resetDeviceState ('SA1FL', 'Openline');
		DEVICE_resetDeviceState ('SA1FR', 'Openline');
		DEVICE_resetDeviceState ('BT1RL', 'Openline');
		DEVICE_resetDeviceState ('BT2FL', 'Openline');
		DEVICE_resetDeviceState ('BT2FR', 'Openline');
		
		S_wait_ms(10000);
	return 1;
}


1;
