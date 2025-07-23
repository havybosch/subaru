
#### TEST CASE MODULE
package TC_DEM_FaultRecording_Internaltripcount_incrementcheck;

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

our $PURPOSE = "Check updated of BIU660 trip counter";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DEM_FaultRecording_Internaltripcount_incrementcheck

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard preparation

2.Set following values for signals of message 

BIU660_3_0_COUNT_TRIP = <v_trip1>

BIU660_7_0_COUNT_TIME = '00 00 09'


I<B<Stimulation and Measurement>>

1.Switch ON ECU.

2.Wait for <t_wait> msec.

3.Create <Fault1> condition

4.Wait for <t_Qual1> msec.

5.Send <Req_DTCSnapshotdata> with <Status_Mask>.

6.Switch OFF ECU.

7.Create <Fault2> condition and Switch ON ECU.

8.Send <Req_DTCSnapshotdata> with <Status_Mask>.


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.<PR_ReportDTCSnapshot_reponse> should be recorded.

6.-

7.-

8.<PR_ReportDTCSnapshot_reponse1> should be recorded.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'v_trip1' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse1' => 
	SCALAR 'purpose' => 
	SCALAR 't_wait' => 
	SCALAR 'Fault2' => 
	SCALAR 'Fault1' => 
	SCALAR 'Req_DTCSnapshotdata' => 
	SCALAR 'Status_Mask' => 
	SCALAR 't_Qual1' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the trip counter increment and its recording after fault is qualified ' # description of test case
	# input parameters
	t_wait= '1000'
	Fault2= 'rb_sqm_CrosscouplingAB1FD_flt' 
	Fault1= 'rb_sqm_TerminalShort2BatBT1FR_flt'
	Req_DTCSnapshotdata = '19 05'
	Status_Mask= 'FF'
	t_Qual1= '2000'
	v_trip1='00 05'
	PR_ReportDTCSnapshot_reponse='59 05 01 99 03 00 0A 01 10 1E 00 05 00 00 00 0X'
	
	PR_ReportDTCSnapshot_reponse1='59 05 01 99 03 00 0A 01 10 1E 00 05 00 00 00 0X 02 98 04 00 0A 01 10 1E 00 05 00 00 00 0X 03 HH MM LL 0A 01 10 1E 00 05 00 00 00 0X'
	
	#Note=X varies from 8-B#Byte 0 of time counter
	#Note=Cross coupled Squib DTC:- HH -DTC high byte,MM-DTCMiddle byte ,LL-DTC low byte

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_t_wait;
my $tcpar_Fault2;
my $tcpar_Fault1;
my $tcpar_Req_DTCSnapshotdata;
my $tcpar_Status_Mask;
my $tcpar_t_Qual1;
my $tcpar_v_trip1;
my $tcpar_PR_ReportDTCSnapshot_reponse;
my $tcpar_PR_ReportDTCSnapshot_reponse1;

################ global parameter declaration ###################
#add any global variables here
my ($res1, $res2);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_t_wait =  GEN_Read_mandatory_testcase_parameter( 't_wait' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Req_DTCSnapshotdata =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCSnapshotdata' );
	$tcpar_Status_Mask =  GEN_Read_mandatory_testcase_parameter( 'Status_Mask' );
	$tcpar_t_Qual1 =  GEN_Read_mandatory_testcase_parameter( 't_Qual1' );
	$tcpar_v_trip1 =  GEN_Read_mandatory_testcase_parameter( 'v_trip1' );
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
	
	S_teststep("2.Set following values for signals of message ", 'AUTO_NBR');
	#comment
	S_teststep("BIU660_3_0_COUNT_TRIP = '$tcpar_v_trip1'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TRIP',$tcpar_v_trip1);
	S_wait_ms(1000);
	
	S_teststep("BIU660_7_0_COUNT_TIME = '00 00 09'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TIME','0x9');
	S_wait_ms(1000);
	#S_user_action("check");
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON ECU.", 'AUTO_NBR');
	DCOM_ecu_on ();
	S_wait_ms(5000);
	
	S_teststep("Wait for '$tcpar_t_wait' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_wait);
	
	S_teststep("Create '$tcpar_Fault1' condition", 'AUTO_NBR');
	DEVICE_setDeviceState ('BT1FR', 'Openline');
	#S_user_action("check");
	
	S_teststep("Wait for '$tcpar_t_Qual1' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual1);
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_DTCSnapshotdata' with '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_dtcsnapshotdata_A');			#measurement 1
	$res1 = GDCOM_request($tcpar_Req_DTCSnapshotdata.' '.$tcpar_Status_Mask,'', 'relax');
	
	S_teststep("Switch OFF ECU.", 'AUTO_NBR');
	DCOM_ecu_off ();
	
	S_teststep("Create '$tcpar_Fault2' condition and Switch ON ECU.", 'AUTO_NBR');
	DEVICE_setDeviceState ('AB1FD', 'CrossCouple');
	DCOM_ecu_on ();
	S_wait_ms(7000);
	#S_user_action("created AB1FD cross");
	FM_CD_readFaultMemory(0xFF);
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_DTCSnapshotdata' with '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_dtcsnapshotdata_B');			#measurement 2
	$res2 = GDCOM_request($tcpar_Req_DTCSnapshotdata.' '.$tcpar_Status_Mask,'', 'relax');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse' should be recorded.", 'send_req_dtcsnapshotdata_A');			#evaluation 1
	S_teststep_detected("Response is $res1", 'send_req_dtcsnapshotdata_A');

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse1' should be recorded.", 'send_req_dtcsnapshotdata_B');			#evaluation 2
	S_teststep_detected("Response is $res2", 'send_req_dtcsnapshotdata_B');

	return 1;
}

sub TC_finalization {
	DEVICE_resetDeviceState ('BT1FR', 'Openline');
	DEVICE_resetDeviceState ('AB1FD', 'CrossCouple');
	S_wait_ms(1000);
	LC_ECU_Reset();
	S_wait_ms(1000);
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request('31 01 AC AC','','relax');
    S_wait_ms(5000);
	return 1;
}


1;
