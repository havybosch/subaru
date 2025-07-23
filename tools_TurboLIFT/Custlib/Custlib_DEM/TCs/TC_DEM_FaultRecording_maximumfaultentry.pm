#### TEST CASE MODULE
package TC_DEM_FaultRecording_maximumfaultentry;

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

our $PURPOSE = "Check fault entry";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DEM_FaultRecording_maximumfaultentry

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard preparation


I<B<Stimulation and Measurement>>

1.Switch ON ECU.

2.Create <Fault1> condition.

3.Wait for <t_quali> msec.

4.Send<Req_readDTC> with <Status_Mask>

5.Reset the ECU.

6.Create <Fault2> condition.

7.Wait for <t_quali1> msec.

8.Send<Req_readDTC> with <Status_Mask>


I<B<Evaluation>>

1.-

2.-

3.-

4.<PR_ReportDTCSnapshot_reponse1> should be recorded

5.-

6.

7.-

8.<PR_ReportDTCSnapshot_reponse2> should be recorded


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Reset' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse1' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse2' => 
	SCALAR 'purpose' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'Status_Mask' => 
	SCALAR 'Extra_Fault' => 
	SCALAR 't_quali' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the maximum fault entry in to CFMCA with combination of normal and firing fault is present ' # description of test case
	# input parameters 
	Req_readDTC = '19 02'
	Status_Mask= 'FF'
	Extra_Fault= '33rdfault' #any fault apart from already Qualified fault.
	t_quali= '60000'
	Reset='Not Applicable' # reset the ECU is not applicable for this condition.
	Fault1= '32 Normal faults and 8 firing faults'
	Fault2= 'NA' 
	PR_ReportDTCSnapshot_reponse1 = '59 02 0A NH1 NM1 NL1 SM1...NH32 NM32 NL32 SM32 FH33 FM33 FL33 SM33...FH40 FM40 FL40 SM40'
	PR_ReportDTCSnapshot_reponse2 = 'NA'
	#Note:- NHx =Normal fault DTCx High byte,
	            #NMx =Normal fault DTCx Middle byte
	            #NLx  =Normal fault DTCx Low byte
	            
	            #FHx =Firing fault DTCx High byte,
	            #FMx =Firing fault DTCx Middle byte
	            #FLx  =Firing fault DTCx Low byte
	            #SMx = DTCx Status Mask

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Req_readDTC;
my $tcpar_Status_Mask;
my $tcpar_Extra_Fault;
my $tcpar_t_quali;
my $tcpar_Reset;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_PR_ReportDTCSnapshot_reponse1;
my $tcpar_PR_ReportDTCSnapshot_reponse2;

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
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_Status_Mask =  GEN_Read_mandatory_testcase_parameter( 'Status_Mask' );
	$tcpar_Extra_Fault =  GEN_Read_mandatory_testcase_parameter( 'Extra_Fault' );
	$tcpar_t_quali =  GEN_Read_mandatory_testcase_parameter( 't_quali' );
	$tcpar_Reset =  GEN_Read_mandatory_testcase_parameter( 'Reset' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
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
	
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON ECU.", 'AUTO_NBR');
	LC_ECU_On();
	S_wait_ms(1000);
	$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	
	S_teststep("Create '$tcpar_Fault1' condition.", 'AUTO_NBR');
	if ($tcpar_Fault1 eq '32 Normal faults and 8 firing faults')
	{
		S_w2rep("Created 32 normal faults",'green');
		_SetDevice();
	}
	S_user_action("check faults");
	
	S_teststep("Wait for '$tcpar_t_quali' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_quali);
	$DTCMemory = FM_CD_readFaultMemory(0xFF);
	
	S_teststep("Send '$tcpar_Req_readDTC' with '$tcpar_Status_Mask'", 'AUTO_NBR', 'sendreq_readdtc_with_A');			#measurement 1
	$res1 = GDCOM_request($tcpar_Req_readDTC.' '.$tcpar_Status_Mask,'', 'relax');
	
	S_teststep("Reset the ECU.", 'AUTO_NBR');
	if ($tcpar_Reset eq 'Not Applicable')
	{
		S_w2rep("No need to do reset",'green');
	}else{
		LC_ECU_Reset();
	}
	
	S_teststep("Create '$tcpar_Fault2' condition.", 'AUTO_NBR');
	if ($tcpar_Fault2 eq 'NA')
	{
		S_w2rep("No need to check",'green');
	}
	
	S_teststep("Wait for '$tcpar_t_quali1' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_quali1);
	
	S_teststep("Send'$tcpar_Req_readDTC' with '$tcpar_Status_Mask'", 'AUTO_NBR', 'sendreq_readdtc_with_B');			#measurement 2
	if ($tcpar_Fault2 eq 'NA')
	{
		S_w2rep("No need to check",'green');
	}
	
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse1' should be recorded", 'sendreq_readdtc_with_A');			#evaluation 1
	S_teststep_detected("Response is $res1", 'sendreq_readdtc_with_A');

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse2' should be recorded", 'sendreq_readdtc_with_B');			#evaluation 2
	if ($tcpar_Fault2 eq 'NA')
	{
		S_w2rep("No need to check",'green');
	}else{
		S_teststep_detected("Response is $res2", 'sendreq_readdtc_with_B');
	}
	

	return 1;
}

sub TC_finalization {
	_ResetDevice();
	LC_ECU_Reset();
	S_wait_ms(1000);
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request('31 01 AC AC','','relax');
    S_wait_ms(5000);
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
