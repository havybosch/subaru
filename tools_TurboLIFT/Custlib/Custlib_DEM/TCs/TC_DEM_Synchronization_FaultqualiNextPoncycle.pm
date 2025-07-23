#### TEST CASE MODULE
package TC_DEM_Synchronization_FaultqualiNextPoncycle;

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

our $PURPOSE = "check the trip and time counter value in next POC";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DEM_Synchronization_FaultqualiNextPoncycle

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard preparation

2.Initialize EEPROM

3.Set following values for signals of message 

BIU660_3_0_COUNT_TRIP = '00 06'

BIU660_7_0_COUNT_TIME = '00 00 09'


I<B<Stimulation and Measurement>>

1.Switch ON ECU.

2.Wait for 7 sec.

3.Create <fault1> condition and Wait for <t_Qual1> msec.

4.Send <Req_DTCSnapshotdata> with <Status_Mask>.

5.Remove <fault1> condition 

6.Set following values for signals of message 

BIU660_3_0_COUNT_TRIP = '00 02'

BIU660_7_0_COUNT_TIME = '00 00 04'

7.Reset the ECU.

8.Send <Req_DTCSnapshotdata> with <Status_Mask>.

9.Create <fault1> condition and wait for <t_Qual1> msec

10.Send <Req_DTCSnapshotdata> with <Status_Mask>.


I<B<Evaluation>>

1.-

2.-

3.-

4.<PR_ReportDTCSnapshot_reponse1> should be recorded.

5.-

6.

7.-

8.<PR_ReportDTCSnapshot_reponse2> should be recorded.

9.-

10.<PR_ReportDTCSnapshot_reponse1> should be recorded.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'fault1' => 
	SCALAR 't_Qual1' => 
	SCALAR 'Req_DTCSnapshotdata' => 
	SCALAR 'Status_Mask' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse1' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse2' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the trip and time counter value for the fault that has qualified or requalified in next Power On cycle'
	# description of test case
	# input parameters
	fault1= 'rb_coa_TCURxMsgCounterError_flt'
	t_Qual1= '400'
	Req_DTCSnapshotdata = '19 05'
	Status_Mask= 'FF'
	#output parameters 
	PR_ReportDTCSnapshot_reponse1= '59 05 01 C4 02 00 0A 01 10 1E 00 06 00 00 00 0X'
	PR_ReportDTCSnapshot_reponse2='59 05 01 C4 02 00 0A 01 10 1E 00 06 00 00 00 0X'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_fault1;
my $tcpar_t_Qual1;
my $tcpar_Req_DTCSnapshotdata;
my $tcpar_Status_Mask;
my $tcpar_PR_ReportDTCSnapshot_reponse1;
my $tcpar_PR_ReportDTCSnapshot_reponse2;

################ global parameter declaration ###################
#add any global variables here
my ($res1, $res2, $res3);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_fault1 =  GEN_Read_mandatory_testcase_parameter( 'fault1' );
	$tcpar_t_Qual1 =  GEN_Read_mandatory_testcase_parameter( 't_Qual1' );
	$tcpar_Req_DTCSnapshotdata =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCSnapshotdata' );
	$tcpar_Status_Mask =  GEN_Read_mandatory_testcase_parameter( 'Status_Mask' );
	$tcpar_PR_ReportDTCSnapshot_reponse1 =  GEN_Read_mandatory_testcase_parameter( 'PR_ReportDTCSnapshot_reponse1' );
	$tcpar_PR_ReportDTCSnapshot_reponse2 =  GEN_Read_mandatory_testcase_parameter( 'PR_ReportDTCSnapshot_reponse2' );

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
	
	S_teststep("2.Initialize EEPROM", 'AUTO_NBR');

	S_teststep("3.Set following values for signals of message ", 'AUTO_NBR');

	S_teststep("BIU660_3_0_COUNT_TRIP = '00 06'", 'AUTO_NBR');
	CA_write_can_signal ('BIU660_3_0_COUNT_TRIP', '6' , 'phys');
	S_wait_ms(1000);
	
	S_teststep("BIU660_7_0_COUNT_TIME = '00 00 09'", 'AUTO_NBR');
	CA_write_can_signal ('BIU660_7_0_COUNT_TIME','9','phys');
	S_wait_ms(1000);
	
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON ECU.", 'AUTO_NBR');
	LC_ECU_On();
	
	S_teststep("Wait for 7 sec.", 'AUTO_NBR');
	S_wait_ms(7000);
	
	S_teststep("Create '$tcpar_fault1' condition and Wait for '$tcpar_t_Qual1' msec.", 'AUTO_NBR');
	CA_set_EnvVar_value('_enV_TCU048_MsgCtrError',1);
	S_wait_ms(500);
	S_wait_ms($tcpar_t_Qual1);
	
	S_teststep("Send '$tcpar_Req_DTCSnapshotdata' with '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_dtcsnapshotdata_A');			#measurement 1
	$res1 = GDCOM_request($tcpar_Req_DTCSnapshotdata.' '.$tcpar_Status_Mask,'', 'relax');
	
	S_teststep("Remove '$tcpar_fault1' condition ", 'AUTO_NBR');
	CA_set_EnvVar_value('_enV_TCU048_MsgCtrError',0);
	S_wait_ms(1000);
	
	S_teststep("Set following values for signals of message ", 'AUTO_NBR');
	#comment
	S_teststep("BIU660_3_0_COUNT_TRIP = '00 02'", 'AUTO_NBR');
	CA_write_can_signal ('BIU660_3_0_COUNT_TRIP', '2' , 'phys');
	S_wait_ms(1000);
	
	S_teststep("BIU660_7_0_COUNT_TIME = '00 00 04'", 'AUTO_NBR');
	CA_write_can_signal ('BIU660_7_0_COUNT_TIME','4','phys');
	S_wait_ms(1000);
	
	S_teststep("Reset the ECU.", 'AUTO_NBR');
	LC_ECU_Reset();
	S_wait_ms(7000);
	
	S_teststep("Send '$tcpar_Req_DTCSnapshotdata' with '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_dtcsnapshotdata_B');			#measurement 2
	$res2 = GDCOM_request($tcpar_Req_DTCSnapshotdata.' '.$tcpar_Status_Mask,'', 'relax');
	
	S_teststep("Create '$tcpar_fault1' condition and wait for '$tcpar_t_Qual1' msec", 'AUTO_NBR');
	CA_set_EnvVar_value('_enV_TCU048_MsgCtrError',1);
	S_wait_ms(500);
	S_wait_ms($tcpar_t_Qual1);
	
	S_teststep("Send '$tcpar_Req_DTCSnapshotdata' with '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_dtcsnapshotdata_C');			#measurement 3
	$res3 = GDCOM_request($tcpar_Req_DTCSnapshotdata.' '.$tcpar_Status_Mask,'', 'relax');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse1' should be recorded.", 'send_req_dtcsnapshotdata_A');			#evaluation 1
	S_teststep_detected("Response is $res1", 'send_req_dtcsnapshotdata_A');

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse2' should be recorded.", 'send_req_dtcsnapshotdata_B');			#evaluation 2
	S_teststep_detected("Response is $res2", 'send_req_dtcsnapshotdata_B');

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse1' should be recorded.", 'send_req_dtcsnapshotdata_C');			#evaluation 3
	S_teststep_detected("Response is $res3", 'send_req_dtcsnapshotdata_C');

	return 1;
}

sub TC_finalization {
	CA_set_EnvVar_value('_enV_TCU048_MsgCtrError',0);
	LC_ECU_Reset();
	S_wait_ms(1000);
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request('31 01 AC AC','','relax');
    S_wait_ms(5000);
	return 1;
}


1;
