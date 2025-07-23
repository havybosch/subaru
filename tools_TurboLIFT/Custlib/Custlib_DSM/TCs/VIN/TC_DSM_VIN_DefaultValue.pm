#### TEST CASE MODULE
package TC_DSM_VIN_DefaultValue;

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
use LIFT_PRITT;
use LIFT_evaluation;
use LIFT_PD;
use LIFT_CD;
use LIFT_CD_CAN;
use LIFT_labcar;
use LIFT_CANoe;
use GENERIC_DCOM;
use LIFT_can_access;
use FuncLib_TNT_DEVICE;
use FuncLib_TNT_FM;
use FuncLib_TNT_COM;
use LIFT_DCOM;
use LIFT_ProdDiag;
##################################

our $PURPOSE = "To check the default value of VIN and Lock Status";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_VIN_DefaultValue

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Turn On ECU, delete fault record by PD, create <ECU_Mode> mode and reset ECU.

2 Set Addressing Mode as <AddressingMode>  per Project specific SPR.

3.Send request to enter <Session>.

4. Wait for <WaitTime_ms> in msec.

5. Send request <Read_VIN>.

6. Send request <Read_LockStatus>.

7. Read Fault Recorder.


I<B<Evaluation>>

1. -

2. -

3. Positive response is observed.

4.

5. <Res_VIN_Default> is obtained.

6. <Res_LockStatus_Default> is obtained.

7. Faults <VINFaults> has status <DTC_Status>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'ECU_Mode' => 
	LIST 'AddressingMode' => 
	LIST 'Session' => 
	SCALAR 'WaitTime_ms' => 
	SCALAR 'Read_VIN' => 
	SCALAR 'Read_LockStatus' => 
	SCALAR 'Res_VIN_Default' => 
	SCALAR 'Res_LockStatus_Default' => 
	SCALAR 'VINFaults' => 
	SCALAR 'DTC_Status' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the default value of VIN and Lock Status' 
	#input parameter
	ECU_Mode ='<Test Heading>'
	AddressingMode = @('Physical','Functional')
	Session = @('DefaultSession', 'ExtendedSession')
	WaitTime_ms ='6000'
	Read_VIN ='ReadDataByIdentifier_VINDataIdentifier'
	Read_LockStatus = 'ReadDataByIdentifier_VINLockFlagDataIdentifier'
	#output parameter
	Res_VIN_Default ='00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00'
	Res_LockStatus_Default = '00'
	VINFaults ='rb_dwdi_VINMissing_flt'
	DTC_Status = 'Qualified'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_ECU_Mode;
my @tcpar_AddressingMode;
my @tcpar_Session;
my $tcpar_WaitTime_ms;
my $tcpar_Read_VIN;
my $tcpar_Read_LockStatus;
my $tcpar_Res_VIN_Default;
my $tcpar_Res_LockStatus_Default;
my $tcpar_VINFaults;
my $tcpar_DTC_Status;

################ global parameter declaration ###################
#add any global variables here
my $faultState;
my %res_sess;
my %readVIN_response;
my %readlock_response;
my %flt_mem_struct_pd;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_ECU_Mode =  GEN_Read_mandatory_testcase_parameter( 'ECU_Mode' );
	@tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime_ms =  GEN_Read_mandatory_testcase_parameter( 'WaitTime_ms' );
	$tcpar_Read_VIN =  GEN_Read_mandatory_testcase_parameter( 'Read_VIN' );
	$tcpar_Read_LockStatus =  GEN_Read_mandatory_testcase_parameter( 'Read_LockStatus' );
	$tcpar_Res_VIN_Default =  GEN_Read_mandatory_testcase_parameter( 'Res_VIN_Default' );
	$tcpar_Res_LockStatus_Default =  GEN_Read_mandatory_testcase_parameter( 'Res_LockStatus_Default' );
	$tcpar_VINFaults =  GEN_Read_mandatory_testcase_parameter( 'VINFaults' );
	$tcpar_DTC_Status =  GEN_Read_mandatory_testcase_parameter( 'DTC_Status' );
	if ($tcpar_DTC_Status eq 'Qualified'){
		$faultState = 0xAF;
	}
	elsif($tcpar_DTC_Status eq 'Dequalified'){
		$faultState = 0x2C; #dequalify in next POC
	}
	elsif($tcpar_DTC_Status eq 'Suppressed'){
		$faultState = 0x00;
	}
	return 1;
}

sub TC_initialization {
	#clear NVM memory of VIN, support to dependency TCs
	S_teststep("Clear NVM memory of VIN", 'AUTO_NBR');
	_ClearNVMforVIN();
	LC_ECU_Reset();
	
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	GDCOM_set_addressing_mode('physical');
	GDCOM_start_CyclicTesterPresent();
	S_wait_ms(100);
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Turn On ECU, delete fault record by PD, create '$tcpar_ECU_Mode' mode and reset ECU.", 'AUTO_NBR');
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
	PD_ClearFaultMemory();
	S_wait_ms(2000);
	# creat ECU mode
	if($tcpar_ECU_Mode eq 'BoschPlantMode')
	{
		S_teststep("Enter to $tcpar_ECU_Mode mode", 'AUTO_NBR', "create_ECUMode_condition");
		GEN_setECUMode('PlantMode7_ElectronicFiringMode');
		S_wait_ms(1000);
		my $checkECUMode = PD_ReadMemoryByName('rb_sycg_PlantModes_dfst.rb_sycg_ActivePlantModes_au8(0)');
		my $CheckValue = S_aref2dec($checkECUMode, 'U8');
		S_w2rep("ECU check mode variable value:  $CheckValue");
		S_teststep_expected("ECU is in BOSCH PlantMode ","create_ECUMode_condition");
		if($CheckValue eq 0x40){
			S_teststep_detected("ECU in BOSCH PlantMode.","create_ECUMode_condition");
		}
		else{
			S_teststep_detected("ECU is not in BOSCH PlantMode","create_ECUMode_condition");
			S_set_verdict('VERDICT_FAIL');
		}
	}else{
		S_w2rep("Enter Normal mode", 'Purple');
	}
	
	LC_ECU_Reset();
	foreach my $add(@tcpar_AddressingMode)
	{
		S_teststep("Set Addressing Mode as $add Addressing Mode per Project specific SPR.", 'AUTO_NBR');
		GDCOM_set_addressing_mode($add);
		foreach my $ses(@tcpar_Session)
		{			
			my $res;
			S_teststep("Send request to enter to $ses Session ", 'AUTO_NBR', 'send_request_to'."_$add"."_$ses");			#measurement 1
			if ($ses eq 'DefaultSession')
			{
				S_w2rep("Enter default session", 'Purple');
				$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
			}				
			elsif($ses eq 'ExtendedSession')
			{
				S_w2rep("Enter Extended session", 'Purple');
				$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
			}
			$res_sess{$add}{$ses} = $res;	
			
			S_teststep("Wait for '$tcpar_WaitTime_ms' in msec.", 'AUTO_NBR');
			S_wait_ms($tcpar_WaitTime_ms);
			
			S_teststep("Send request '$tcpar_Read_VIN'.", 'AUTO_NBR', 'send_request_read_A'."_$add"."_$ses");			#measurement 2
			$readVIN_response{$add}{$ses} = GDCOM_request_general('REQ_'.$tcpar_Read_VIN, 'PR_'.$tcpar_Read_VIN);
			$readVIN_response{$add}{$ses} =~ s/^(.. ){3}//; #only get the VIN data, delete DID lable
			
			S_teststep("Send request '$tcpar_Read_LockStatus'.", 'AUTO_NBR', 'send_request_read_B'."_$add"."_$ses");			#measurement 3
			$readlock_response{$add}{$ses} = GDCOM_request_general('REQ_'.$tcpar_Read_LockStatus, 'PR_'.$tcpar_Read_LockStatus);
			$readlock_response{$add}{$ses} =~ s/^(.. ){3}//; #only get the VIN data, delete DID lable
			
			S_teststep("Read Fault Recorder.", 'AUTO_NBR', 'read_fault_recorder'."_$add"."_$ses");			#measurement 4
			$flt_mem_struct_pd{$add}{$ses} = PD_ReadFaultMemory();
		}
	}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_AddressingMode)
{	
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - Positive response is observed.", 'send_request_to'."_$add"."_$ses");			#evaluation 1
		S_teststep_detected("$ses - response is obsered $res_sess{$add}{$ses}", 'send_request_to'."_$add"."_$ses");
		if ($ses eq 'DefaultSession')
		{
			S_w2rep("Enter default session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 01 00 32 01 F4', $res_sess{$add}{$ses});
		}elsif($ses eq 'ExtendedSession')
		{
			S_w2rep("Enter extended session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4', $res_sess{$add}{$ses});
		}
		
		S_teststep_expected("$ses - '$tcpar_Res_VIN_Default' is obtained.", 'send_request_read_A'."_$add"."_$ses");			#evaluation 2
		S_teststep_detected("$ses - Obtained response is $readVIN_response{$add}{$ses}", 'send_request_read_A'."_$add"."_$ses");
		EVAL_evaluate_string( "VINDefault1\_Evaluation", $tcpar_Res_VIN_Default, $readVIN_response{$add}{$ses});
	
		S_teststep_expected("$ses - '$tcpar_Res_LockStatus_Default' is obtained.", 'send_request_read_B'."_$add"."_$ses");			#evaluation 3
		S_teststep_detected("$ses - Obtained response is $readlock_response{$add}{$ses}", 'send_request_read_B'."_$add"."_$ses");
		EVAL_evaluate_string( "VINDefault2\_Evaluation", $tcpar_Res_LockStatus_Default, $readlock_response{$add}{$ses});
	
		S_teststep_expected("$ses - Faults '$tcpar_VINFaults' has status '$tcpar_DTC_Status'.", 'read_fault_recorder'."_$add"."_$ses");			#evaluation 4
		#S_teststep_detected("$ses - Fault status is observed $flt_mem_struct_pd{$add}{$ses}", 'read_fault_recorder'."_$add"."_$ses");
		PD_check_fault_status($flt_mem_struct_pd{$add}{$ses}, $tcpar_VINFaults, $faultState);
	}
}
	return 1;
}

sub TC_finalization {
	#remove ECU mode
	if($tcpar_ECU_Mode eq 'BoschPlantMode'){
		GEN_setECUMode('RemovePlantModes');
		
		my $checkECUMode = PD_ReadMemoryByName('rb_sycg_PlantModes_dfst.rb_sycg_ActivePlantModes_au8(0)');
		my $CheckValue = S_aref2dec($checkECUMode, 'U8');
		S_w2rep("ECU check mode variable value:  $CheckValue");
		if($CheckValue == 0){
			S_w2rep("ECu is in NormalMode");
		}
		else{
			S_w2rep("Any way! Please config ECU to NormalMode");
		}
	}
	
	# stop tester present
	GDCOM_set_addressing_mode('physical');
	GDCOM_stop_CyclicTesterPresent();
	S_wait_ms(100);
	
	#clear NVM memory of VIN, support to dependency TCs
	_ClearNVMforVIN();
	LC_ECU_Reset();
	
	#clear fault memory
	PD_ClearFaultMemory();
	S_wait_ms(3000);
	return 1;
}

sub _ClearNVMforVIN {

	foreach my $i (0..16){
		PD_WriteMemoryByName( "rb_dwdi_VINData_dfau8($i)", [ 0x00 ] );
		}
	
	PD_WriteMemoryByName( "rb_dwdi_VINLockFlag_dfu8(0)", [ 0x00 ] );
	S_wait_ms(1000);

	return 1;	
}

1;
