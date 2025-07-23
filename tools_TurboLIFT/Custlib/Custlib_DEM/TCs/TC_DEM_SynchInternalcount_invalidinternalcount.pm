#### TEST CASE MODULE
package TC_DEM_SynchInternalcount_invalidinternalcount;

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

our $PURPOSE = "Check internal sync for BIU660";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DEM_SynchInternalcount_invalidinternalcount

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard preparation

2.Initialize EEPROM

3.Set the invalid values for signals of message 

BIU660_3_0_COUNT_TRIP = <V_trip1>

BIU660_7_0_COUNT_TIME = <V_timer1>


I<B<Stimulation and Measurement>>

1.Create <fault1> condition.

2.Switch ON ECU.

3.Wait for <t_Qual1> msec.

4.Send <Req_DTCSnapshotData> with <Status_Mask>.

5.Set the invalid values for signals of message 

BIU660_3_0_COUNT_TRIP = <V_trip2>

BIU660_7_0_COUNT_TIME = <V_timer2>

6.Create <fault2> condition.

7.Wait for <t_Qual2> msec.

8.Send <Req_DTCSnapshotData> with <Status_Mask>.


I<B<Evaluation>>

1.-

2.-

3.-

4.<PR_ReportDTCSnapshot_reponse1> should be recorded.

5.-

6.-

7.-

8.<PR_ReportDTCSnapshot_reponse2> should be recorded.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'V_trip1' => 
	SCALAR 'V_timer1' => 
	SCALAR 'V_trip2' => 
	SCALAR 'V_timer2' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse1' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse2' => 
	SCALAR 'purpose' => 
	SCALAR 'fault1' => 
	SCALAR 't_Qual1' => 
	SCALAR 'fault2' => 
	SCALAR 't_Qual2' => 
	SCALAR 'Req_DTCSnapshotData' => 
	SCALAR 'Status_Mask' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the trip and time counter value when the invalid internal count is transmitted ' # description of test case
	# input parameters
	fault1='rb_sqm_SquibResistanceOpenSA1FR_flt'
	t_Qual1='2000' #Qual time in msec
	fault2= 'rb_psem_Short2BatUFSL_flt'
	t_Qual2='2600' #Qual time in msec
	Req_DTCSnapshotData= '19 05'
	Status_Mask= 'FF'
	#output parameters 
	V_trip1='00 0A'
	V_timer1='FF FF FF'
	V_trip2='00 F0'
	V_timer2='00 00 1A'
	
	PR_ReportDTCSnapshot_reponse1='59 05 01 98 21 00 0A 01 10 1E 00 01 20 00 00 40'
	
	#internal time trip counter data are recorded
	
	PR_ReportDTCSnapshot_reponse2='59 05 01 98 21 00 0A 01 10 1E 00 01 20 00 00 40 02 96 A8 00 0A 01 10 1E 00 F0 00 00 00 1X'
	
	#Note=X varies from A-D#Byte 0(bit0-3) of time counter

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_fault1;
my $tcpar_t_Qual1;
my $tcpar_fault2;
my $tcpar_t_Qual2;
my $tcpar_Req_DTCSnapshotData;
my $tcpar_Status_Mask;
my $tcpar_V_trip1;
my $tcpar_V_timer1;
my $tcpar_V_trip2;
my $tcpar_V_timer2;
my $tcpar_PR_ReportDTCSnapshot_reponse1;
my $tcpar_PR_ReportDTCSnapshot_reponse2;

################ global parameter declaration ###################
#add any global variables here
my ($res1, $res2);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_fault1 =  GEN_Read_mandatory_testcase_parameter( 'fault1' );
	$tcpar_t_Qual1 =  GEN_Read_mandatory_testcase_parameter( 't_Qual1' );
	$tcpar_fault2 =  GEN_Read_mandatory_testcase_parameter( 'fault2' );
	$tcpar_t_Qual2 =  GEN_Read_mandatory_testcase_parameter( 't_Qual2' );
	$tcpar_Req_DTCSnapshotData =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCSnapshotData' );
	$tcpar_Status_Mask =  GEN_Read_mandatory_testcase_parameter( 'Status_Mask' );
	$tcpar_V_trip1 =  GEN_Read_mandatory_testcase_parameter( 'V_trip1' );
	$tcpar_V_timer1 =  GEN_Read_mandatory_testcase_parameter( 'V_timer1' );
	$tcpar_V_trip2 =  GEN_Read_mandatory_testcase_parameter( 'V_trip2' );
	$tcpar_V_timer2 =  GEN_Read_mandatory_testcase_parameter( 'V_timer2' );
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
	#comment
	S_teststep("3.Set the invalid values for signals of message ", 'AUTO_NBR');
	#comment
	S_teststep("BIU660_3_0_COUNT_TRIP = '$tcpar_V_trip1'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TRIP',$tcpar_V_trip1);
	S_wait_ms(1000);
	
	S_teststep("BIU660_7_0_COUNT_TIME = '$tcpar_V_timer1'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TIME',$tcpar_V_timer1);
		
	S_wait_ms(1000);
	#LC_ECU_Off();
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Create '$tcpar_fault1' condition.", 'AUTO_NBR');
	DEVICE_setDeviceState ('SA1FR', 'Openline');
	S_wait_ms(1000);
	S_user_action("check");
	
	S_teststep("Switch ON ECU.", 'AUTO_NBR');
	#LC_ECU_On();
	
	S_teststep("Wait for '$tcpar_t_Qual1' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual1);	
	FM_CD_readFaultMemory(0xFF);

	
	S_teststep("Send '$tcpar_Req_DTCSnapshotData' with '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_dtcsnapshotdata_A');			#measurement 1
	$res1 = GDCOM_request($tcpar_Req_DTCSnapshotData.' '.$tcpar_Status_Mask,'', 'relax');
	
	S_teststep("Set the invalid values for signals of message ", 'AUTO_NBR');
	#comment
	S_teststep("BIU660_3_0_COUNT_TRIP = '$tcpar_V_trip2'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TRIP',$tcpar_V_trip2);
	S_wait_ms(1000);
	
	S_teststep("BIU660_7_0_COUNT_TIME = '$tcpar_V_timer2'", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TIME',$tcpar_V_timer2);
	S_wait_ms(1000);
		
	S_teststep("Create '$tcpar_fault2' condition.", 'AUTO_NBR');
	DEVICE_setDeviceState ('UFSL', 'Short2Bat');
	S_wait_ms(1000);
	S_user_action("check");
	
	S_teststep("Wait for '$tcpar_t_Qual2' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual2);
	FM_CD_readFaultMemory(0xFF);
		
	S_teststep("Send '$tcpar_Req_DTCSnapshotData' with '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_dtcsnapshotdata_B');			#measurement 2
	$res2 = GDCOM_request($tcpar_Req_DTCSnapshotData.' '.$tcpar_Status_Mask,'', 'relax');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse1' should be recorded.", 'send_req_dtcsnapshotdata_A');			#evaluation 1
	S_teststep_detected("Response is $res1", 'send_req_dtcsnapshotdata_A');

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse2' should be recorded.", 'send_req_dtcsnapshotdata_B');			#evaluation 2
	S_teststep_detected("Response is $res2", 'send_req_dtcsnapshotdata_B');

	return 1;
}

sub TC_finalization {
	DEVICE_resetDeviceState ('SA1FR', 'Openline');
	DEVICE_resetDeviceState ('UFSL', 'Short2Bat');
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request('31 01 AC AC','','relax');
    S_wait_ms(5000);
	return 1;
}


1;
