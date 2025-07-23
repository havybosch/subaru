#### TEST CASE MODULE
package TC_DEM_FaultRecording_Internaltimecount;

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

our $PURPOSE = "Check updated of BIU660";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DEM_FaultRecording_Internaltimecount

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard preparation

2.Set following values for MsgIDBIU660 signals

BIU660_3_0_COUNT_TRIP = '00 03'

BIU660_7_0_COUNT_TIME = '<v_Counter>'


I<B<Stimulation and Measurement>>

1.Create <Fault1> condition.

2.Switch ON ECU.

3.Wait for <t_wait> msec.

4.Create <Fault2> condition

5.Wait for <t_Qual2> msec.

6.Set following values for MsgIDBIU660 signals

BIU660_3_0_COUNT_TRIP = '00 03'

BIU660_7_0_COUNT_TIME = '<v_Counter1>'

7.Create <Fault3> condition

8.Wait for<t_Qual3> msec.

9.Send<Req_DTCSnapshotdata>


I<B<Evaluation>>

1.

2.

3.

4.

5.

6.

7.

8.

9.<PR_ReportDTCSnapshot_reponse> should be recorded.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'v_Counter' => 
	SCALAR 'v_Counter1' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse' => 
	SCALAR 'purpose' => 
	SCALAR 't_wait' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Fault3' => 
	SCALAR 'Req_DTCSnapshotdata' => 
	SCALAR 't_Qual2' => 
	SCALAR 't_Qual3' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the time counter increment and its recording after fault is qualified ' # description of test case
	# input parameters
	t_wait='1000'
	Fault1='rb_sqm_CrosscouplingAB1FD_flt'
	Fault2='rb_coa_VDCRxMsgTimeout_flt'
	Fault3='rb_psem_Short2BatUFSL_flt'
	Req_DTCSnapshotdata ='19 05 FF'
	t_Qual2='2000'
	t_Qual3='2600'
	v_Counter= '00 00 AA'
	v_Counter1= '00 00 0A'
	PR_ReportDTCSnapshot_reponse='59 05 01 98 04 00 0A 01 10 1E 00 03 00 00 00 AX 02 HH MM LL 0A 01 10 1E 00 03 00 00 00 AX 03 C1 22 00 0A 01 10 1E 00 03 00 00 00 AX 04 96 17 00 0A 01 10 1E 00 03 00 00 00 0X'
	
	#Note=X varies from A-D#Byte 0 of time counter

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_t_wait;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Fault3;
my $tcpar_Req_DTCSnapshotdata;
my $tcpar_t_Qual2;
my $tcpar_t_Qual3;
my $tcpar_v_Counter;
my $tcpar_v_Counter1;
my $tcpar_PR_ReportDTCSnapshot_reponse;

################ global parameter declaration ###################
#add any global variables here
my $response;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_t_wait =  GEN_Read_mandatory_testcase_parameter( 't_wait' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Fault3 =  GEN_Read_mandatory_testcase_parameter( 'Fault3' );
	$tcpar_Req_DTCSnapshotdata =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCSnapshotdata' );
	$tcpar_t_Qual2 =  GEN_Read_mandatory_testcase_parameter( 't_Qual2' );
	$tcpar_t_Qual3 =  GEN_Read_mandatory_testcase_parameter( 't_Qual3' );
	$tcpar_v_Counter =  GEN_Read_mandatory_testcase_parameter( 'v_Counter' );
	$tcpar_v_Counter1 =  GEN_Read_mandatory_testcase_parameter( 'v_Counter1' );
	$tcpar_PR_ReportDTCSnapshot_reponse =  GEN_Read_mandatory_testcase_parameter( 'PR_ReportDTCSnapshot_reponse' );

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
	#comment
	S_teststep("BIU660_3_0_COUNT_TRIP = '00 03'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TRIP','0x3');
	S_wait_ms(1000);
	
	S_teststep("BIU660_7_0_COUNT_TIME = '$tcpar_v_Counter'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TIME',$tcpar_v_Counter);
	S_wait_ms(1000);
	
	DCOM_ecu_off ();
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Create '$tcpar_Fault1' condition.", 'AUTO_NBR');
	DEVICE_setDeviceState ('AB1FD', 'CrossCouple');
	S_wait_ms(1000);
	#S_user_action("check");
	
	S_teststep("Switch ON ECU.", 'AUTO_NBR');
	DCOM_ecu_on ();
	S_wait_ms(5000);
	
	S_teststep("Wait for '$tcpar_t_wait' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_wait);
	PD_ReadFaultMemory();
	FM_CD_readFaultMemory(0xFF);
	
	S_teststep("Create '$tcpar_Fault2' condition", 'AUTO_NBR');
	CA_set_EnvVar_value('_enV_VDC138_StartStop',0);
	
	S_teststep("Wait for '$tcpar_t_Qual2' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual2);
	PD_ReadFaultMemory();
	FM_CD_readFaultMemory(0xFF);
	
	S_teststep("Set following values for MsgIDBIU660 signals", 'AUTO_NBR');
	#comment
	S_teststep("BIU660_3_0_COUNT_TRIP = '00 03'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TRIP','0x3');
	S_wait_ms(1000);
	
	S_teststep("BIU660_7_0_COUNT_TIME = '$tcpar_v_Counter1'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TIME',$tcpar_v_Counter1);
	S_wait_ms(1000);
	
	S_teststep("Create '$tcpar_Fault3' condition", 'AUTO_NBR');
	DEVICE_setDeviceState ('UFSL', 'Openline');
	#S_user_action("check");
	
	S_teststep("Wait for '$tcpar_t_Qual3' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual3);
	PD_ReadFaultMemory();
	FM_CD_readFaultMemory(0xFF);
	
	S_teststep("Send '$tcpar_Req_DTCSnapshotdata'", 'AUTO_NBR', 'sendreq_dtcsnapshotdata');			#measurement 1
	$response = GDCOM_request($tcpar_Req_DTCSnapshotdata,'', 'relax');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse' should be recorded.", 'sendreq_dtcsnapshotdata');			#evaluation 1
	S_teststep_detected("Response is $response", 'sendreq_dtcsnapshotdata');

	return 1;
}

sub TC_finalization {
	#reset fault
	DEVICE_resetDeviceState ('AB1FD', 'CrossCouple');
	CA_set_EnvVar_value('_enV_VDC138_StartStop',1);
	DEVICE_resetDeviceState ('UFSL', 'Openline');
	S_wait_ms(1000);
	LC_ECU_Reset();
	S_wait_ms(1000);
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request('31 01 AC AC','','relax');
    S_wait_ms(5000);
	return 1;
}


1;
