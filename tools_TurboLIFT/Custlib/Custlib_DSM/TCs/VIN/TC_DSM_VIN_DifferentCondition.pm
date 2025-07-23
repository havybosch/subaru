#### TEST CASE MODULE
package TC_DSM_VIN_DifferentCondition;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.2 $;
our $HEADER = q$Header: TCs/TCs_Project/DSM/TC_DSM_VIN_DifferentCondition.pm 1.2 2019/08/15 11:40:42ICT RNO1HC reviewed RNO1HC(2019/10/29 15:22:04ICT) $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS name> (e.g. TS_SWM_SwitchMgt)
#TS version in DOORS: <TS version based on which this script is written/updated> (e.g. 3.30)
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here
use LIFT_PD;
use LIFT_CD;
use GENERIC_DCOM;
use LIFT_labcar;
use LIFT_PRITT;
use LIFT_evaluation;
use LIFT_CD_CAN;
use LIFT_CANoe;
use LIFT_can_access;
use FuncLib_TNT_DEVICE;
use FuncLib_TNT_FM;
use FuncLib_TNT_COM;
use LIFT_DCOM;
##################################

our $PURPOSE = "This test case try to change VIN value and lock status, the ECU reports by service ReadDataByIdentifier";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_VIN_DifferentCondition

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Turn On ECU and wait for <WaitTime_ms> in msec.

2. Set supported <Addressing_Mode>.

3. Send request to enter <Session> session.

4. Send request to access security level2.

5. Send request <REQ_Write_VIN> with <Byte_LengthVIN> and <VINvalue1>.

 

6. Send request <REQ_Write_Lock> with <Byte_LengthLock> and <Lockvalue1>.

7. Send request <REQ_Read_VIN> and <REQ_Read_LockStatus>.

8. Reset ECU

9. Send request <REQ_Write_VIN> with <Byte_LengthVIN> and <VINvalue2>.

10. Send request <REQ_Write_Lock> with <Byte_LengthLock> and <Lockvalue2>.

11. Send request <REQ_Read_VIN> and <REQ_Read_LockStatus>.

12. Read Fault Recorder.


I<B<Evaluation>>

1. -

2. -

3. Positive response is observed.

4. Positive response is observed.

5. Response <ResWriteVIN_First> is observed.

6. Response <ResWriteLock_First> is observed.

7. <ResReadVIN_First> and  <ResReadLock_First> are obtained.

8. -

9. Response  <ResWriteVIN_Second> is observed.

10. Response <ResWriteLock_Second> is observed.

11. <ResReadVIN_Second> and  <ResReadLock_Second> are obtained.

12. Faults <VINFaults> has status <DTC_Status>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'VINvalue1' => 
	SCALAR 'VINvalue2' => 
	SCALAR 'ResReadVIN_First' => 
	SCALAR 'ResReadVIN_Second' => 
	SCALAR 'purpose' => 
	SCALAR 'Addressing_Mode' => 
	SCALAR 'Session' => 
	SCALAR 'WaitTime_ms' => 
	SCALAR 'REQ_Write_VIN' => 
	SCALAR 'REQ_Write_Lock' => 
	SCALAR 'REQ_Read_VIN' => 
	SCALAR 'REQ_Read_LockStatus' => 
	SCALAR 'Byte_LengthVIN' => 
	SCALAR 'Byte_LengthLock' => 
	SCALAR 'Lockvalue1' => 
	SCALAR 'Lockvalue2' => 
	SCALAR 'ResReadLock_First' => 
	SCALAR 'ResReadLock_Second' => 
	SCALAR 'ResWriteVIN_First' => 
	SCALAR 'ResWriteVIN_Second' => 
	SCALAR 'ResWriteLock_First' => 
	SCALAR 'ResWriteLock_Second' => 
	SCALAR 'VINFaults' => 
	SCALAR 'DTC_Status' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the VIN value and Lock Status in different conditions'
	Addressing_Mode = 'Physical'
	Session = 'ExtendedSession'
	WaitTime_ms='10000'
	REQ_Write_VIN = 'WriteDataByIdentifier_VIN'
	REQ_Write_Lock = 'WriteDataByIdentifier_VINLockFlag'
	REQ_Read_VIN ='ReadDataByIdentifier_VINDataIdentifier'
	REQ_Read_LockStatus = 'ReadDataByIdentifier_VINLockFlagDataIdentifier'
	Byte_LengthVIN = '17'
	Byte_LengthLock = '1'
	Lockvalue1 = '00'
	Lockvalue2= '00'
	ResReadLock_First = '00'
	ResReadLock_Second = '00'
	ResWriteVIN_First = 'PR_WriteDataByIdentifier_VIN'
	ResWriteVIN_Second = 'PR_WriteDataByIdentifier_VIN'
	ResWriteLock_First = 'PR_WriteDataByIdentifier_VINLockFlag'
	ResWriteLock_Second = 'PR_WriteDataByIdentifier_VINLockFlag'
	VINFaults='rb_dwdi_VINMissing_flt'
	DTC_Status='Qualified'
	VINvalue1 = '01 02 03 04 05 06 07 08 30 10 11 12 13 14 15 16 17'
	VINvalue2 = '01 02 03 04 05 06 07 08 31 10 11 12 13 14 15 16 17'
	
	ResReadVIN_First = '01 02 03 04 05 06 07 08 30 10 11 12 13 14 15 16 17'
	ResReadVIN_Second = '01 02 03 04 05 06 07 08 31 10 11 12 13 14 15 16 17'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Addressing_Mode;
my $tcpar_Session;
my $tcpar_WaitTime_ms;
my $tcpar_REQ_Write_VIN;
my $tcpar_REQ_Write_Lock;
my $tcpar_REQ_Read_VIN;
my $tcpar_REQ_Read_LockStatus;
my $tcpar_Byte_LengthVIN;
my $tcpar_Byte_LengthLock;
my $tcpar_Lockvalue1;
my $tcpar_Lockvalue2;
my $tcpar_ResReadLock_First;
my $tcpar_ResReadLock_Second;
my $tcpar_ResWriteVIN_First;
my $tcpar_ResWriteVIN_Second;
my $tcpar_ResWriteLock_First;
my $tcpar_ResWriteLock_Second;
my $tcpar_VINFaults;
my $tcpar_DTC_Status;
my $tcpar_VINvalue1;
my $tcpar_VINvalue2;
my $tcpar_ResReadVIN_First;
my $tcpar_ResReadVIN_Second;

################ global parameter declaration ###################
#add any global variables here
my ($faultState);
my ($dataVIN, $dataLock);
my $res_key1;
my $res_key2;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime_ms =  GEN_Read_mandatory_testcase_parameter( 'WaitTime_ms' );
	$tcpar_REQ_Write_VIN =  GEN_Read_mandatory_testcase_parameter( 'REQ_Write_VIN' );
	$tcpar_REQ_Write_Lock =  GEN_Read_mandatory_testcase_parameter( 'REQ_Write_Lock' );
	$tcpar_REQ_Read_VIN =  GEN_Read_mandatory_testcase_parameter( 'REQ_Read_VIN' );
	$tcpar_REQ_Read_LockStatus =  GEN_Read_mandatory_testcase_parameter( 'REQ_Read_LockStatus' );
	$tcpar_Byte_LengthVIN =  GEN_Read_mandatory_testcase_parameter( 'Byte_LengthVIN' );
	$tcpar_Byte_LengthLock =  GEN_Read_mandatory_testcase_parameter( 'Byte_LengthLock' );
	$tcpar_Lockvalue1 =  GEN_Read_mandatory_testcase_parameter( 'Lockvalue1' );
	$tcpar_Lockvalue2 =  GEN_Read_mandatory_testcase_parameter( 'Lockvalue2' );
	$tcpar_ResReadLock_First =  GEN_Read_mandatory_testcase_parameter( 'ResReadLock_First' );
	$tcpar_ResReadLock_Second =  GEN_Read_mandatory_testcase_parameter( 'ResReadLock_Second' );
	$tcpar_ResWriteVIN_First =  GEN_Read_mandatory_testcase_parameter( 'ResWriteVIN_First' );
	$tcpar_ResWriteVIN_Second =  GEN_Read_mandatory_testcase_parameter( 'ResWriteVIN_Second' );
	$tcpar_ResWriteLock_First =  GEN_Read_mandatory_testcase_parameter( 'ResWriteLock_First' );
	$tcpar_ResWriteLock_Second =  GEN_Read_mandatory_testcase_parameter( 'ResWriteLock_Second' );
	$tcpar_VINFaults =  GEN_Read_mandatory_testcase_parameter( 'VINFaults' );
	$tcpar_DTC_Status =  GEN_Read_mandatory_testcase_parameter( 'DTC_Status' );
	$tcpar_VINvalue1 =  GEN_Read_mandatory_testcase_parameter( 'VINvalue1' );
	$tcpar_VINvalue2 =  GEN_Read_mandatory_testcase_parameter( 'VINvalue2' );
	$tcpar_ResReadVIN_First =  GEN_Read_mandatory_testcase_parameter( 'ResReadVIN_First' );
	$tcpar_ResReadVIN_Second =  GEN_Read_mandatory_testcase_parameter( 'ResReadVIN_Second' );

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

	S_teststep("Turn On ECU and wait for '$tcpar_WaitTime_ms' in msec.", 'AUTO_NBR');
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	LC_ECU_On();
	S_wait_ms($tcpar_WaitTime_ms);
	
	S_teststep("Set supported '$tcpar_Addressing_Mode'.", 'AUTO_NBR');
	GDCOM_set_addressing_mode(lc $tcpar_Addressing_Mode);
	S_wait_ms(100);
	
	S_teststep("Send request to enter '$tcpar_Session' session.", 'AUTO_NBR', 'send_request_to_A');			#measurement 1
	my $session_response = GDCOM_request_general( "REQ_DiagnosticSessionControl_" . $tcpar_Session, "PR_DiagnosticSessionControl_" . $tcpar_Session );
	S_teststep_expected("Positive response is observed.", 'send_request_to_A');			#evaluation 1
	S_teststep_detected("Obtained Response is $session_response", 'send_request_to_A');
	
	S_teststep("Send request to access security level2.", 'AUTO_NBR', 'send_request_to_B');			#measurement 2
	$res_key1 = _reqres_key();
	S_teststep_expected("Positive response is observed.", 'send_request_to_B');			#evaluation 2
	S_teststep_detected("Security response should be $res_key1", 'send_request_to_B');
	my @reskey1 = split(/ /,$res_key1);
	EVAL_evaluate_value("Checking value of byte 1", @reskey1[0],'==',0x67);
	EVAL_evaluate_value("Checking value of byte 2", @reskey1[1],'==',0x4);
	CA_set_EnvVar_value('Security03', 0);
	S_wait_ms(1000);
  	#DIAG_SecurityUnlock(0); # create a event from 0 to 1
  	#S_wait_ms(500); # to sync with CAPL unlock code, 1s wait would be necessary.		
	#DIAG_SecurityUnlock(2);
	#S_wait_ms(500); # to sync with CAPL unlock code, 1s wait would be necessary.
	
	S_teststep("Send request '$tcpar_REQ_Write_VIN' with '$tcpar_Byte_LengthVIN' and '$tcpar_VINvalue1'.", 'AUTO_NBR', 'send_request_req_A');			#measurement 3
	$dataVIN->{'Data'} = $tcpar_VINvalue1;
	my $writeVIN_response1 = GDCOM_request_general("REQ_".$tcpar_REQ_Write_VIN, $tcpar_ResWriteVIN_First, $dataVIN);
	S_teststep_expected("Response '$tcpar_ResWriteVIN_First' is observed.", 'send_request_req_A');			#evaluation 3
	S_teststep_detected("Obtained Response Write VIN is $writeVIN_response1.", 'send_request_req_A');
	
	S_teststep("Send request '$tcpar_REQ_Write_Lock' with '$tcpar_Byte_LengthLock' and '$tcpar_Lockvalue1'.", 'AUTO_NBR', 'send_request_req_B');			#measurement 4
	$dataLock->{'Data'} = $tcpar_Lockvalue1;
	my $writeLock_response1 = GDCOM_request_general("REQ_".$tcpar_REQ_Write_Lock, $tcpar_ResWriteLock_First, $dataLock);
	S_teststep_expected("Response '$tcpar_ResWriteLock_First' is observed.", 'send_request_req_B');			#evaluation 4
	S_teststep_detected("Obtained Response Write Lock status is $writeLock_response1.", 'send_request_req_B');
	
	S_teststep("Send request '$tcpar_REQ_Read_VIN' and '$tcpar_REQ_Read_LockStatus'.", 'AUTO_NBR', 'send_request_req_C');			#measurement 5
	my $readVIN_response1 = GDCOM_request_general('REQ_'.$tcpar_REQ_Read_VIN, 'PR_'.$tcpar_REQ_Read_VIN);
	my $readlock_response1 = GDCOM_request_general('REQ_'.$tcpar_REQ_Read_LockStatus, 'PR_'.$tcpar_REQ_Read_LockStatus);
	$readVIN_response1 =~ s/^(.. ){3}//; #only get the VIN data, delete DID lable
	EVAL_evaluate_string( "VINCondition1\_Evaluation", $tcpar_ResReadVIN_First, $readVIN_response1 );
	$readlock_response1 =~ s/^(.. ){3}//; #only get the VIN data, delete DID lable
	EVAL_evaluate_string( "VINCondition2\_Evaluation", $tcpar_ResReadLock_First, $readlock_response1 );
	S_teststep_expected("'$tcpar_ResReadVIN_First' and  '$tcpar_ResReadLock_First' are obtained.", 'send_request_req_C');			#evaluation 5
	S_teststep_detected("Obtained Response Read VIN is $readVIN_response1 and Obtained Response Read Lock Status is $readlock_response1.", 'send_request_req_C');
	
	S_teststep("Reset ECU", 'AUTO_NBR');
	LC_ECU_Reset();
	S_w2rep("Enter extended session again to write VIN data.\n", 'blue');
	GDCOM_request_general( "REQ_DiagnosticSessionControl_" . $tcpar_Session, "PR_DiagnosticSessionControl_" . $tcpar_Session );
	S_w2rep("Pass security access level 2 again to write VIN data.\n", 'blue');
	$res_key2 = _reqres_key();
	my @reskey2 = split(/ /,$res_key2);
	EVAL_evaluate_value("Checking value of byte 1", @reskey2[0],'==',0x67);
	EVAL_evaluate_value("Checking value of byte 2", @reskey2[1],'==',0x4);
  	#DIAG_SecurityUnlock(0); # create a event from 0 to 1
  	#S_wait_ms(500); # to sync with CAPL unlock code, 1s wait would be necessary.		
	#DIAG_SecurityUnlock(2);
	#S_wait_ms(500); # to sync with CAPL unlock code, 1s wait would be necessary.
	
	S_teststep("Send request '$tcpar_REQ_Write_VIN' with '$tcpar_Byte_LengthVIN' and '$tcpar_VINvalue2'.", 'AUTO_NBR', 'send_request_req_D');			#measurement 6
	$dataVIN->{'Data'} = $tcpar_VINvalue2;
	my $writeVIN_response2 = GDCOM_request_general("REQ_".$tcpar_REQ_Write_VIN, $tcpar_ResWriteVIN_Second, $dataVIN);
	S_teststep_expected("Response  '$tcpar_ResWriteVIN_Second' is observed.", 'send_request_req_D');			#evaluation 6
	S_teststep_detected("Obtained Response Write VIN is $writeVIN_response2.", 'send_request_req_D');
	
	S_teststep("Send request '$tcpar_REQ_Write_Lock' with '$tcpar_Byte_LengthLock' and '$tcpar_Lockvalue2'.", 'AUTO_NBR', 'send_request_req_E');			#measurement 7
	$dataLock->{'Data'} = $tcpar_Lockvalue2;
	my $writeLock_response2 = GDCOM_request_general("REQ_".$tcpar_REQ_Write_Lock, $tcpar_ResWriteLock_Second, $dataLock);
	S_teststep_expected("Response '$tcpar_ResWriteLock_Second' is observed.", 'send_request_req_E');			#evaluation 7
	S_teststep_detected("Obtained Response Write Lock status is $writeLock_response2.", 'send_request_req_E');

	S_teststep("Send request '$tcpar_REQ_Read_VIN' and '$tcpar_REQ_Read_LockStatus'.", 'AUTO_NBR', 'send_request_req_F');			#measurement 8
	my $readVIN_response2 = GDCOM_request_general('REQ_'.$tcpar_REQ_Read_VIN, 'PR_'.$tcpar_REQ_Read_VIN);
	my $readlock_response2 = GDCOM_request_general('REQ_'.$tcpar_REQ_Read_LockStatus, 'PR_'.$tcpar_REQ_Read_LockStatus);
	$readVIN_response2 =~ s/^(.. ){3}//; #only get the VIN data, delete DID lable
	EVAL_evaluate_string( "VINCondition3\_Evaluation", $tcpar_ResReadVIN_Second, $readVIN_response2 );
	$readlock_response2 =~ s/^(.. ){3}//; #only get the VIN data, delete DID lable
	EVAL_evaluate_string( "VINCondition4\_Evaluation", $tcpar_ResReadLock_Second, $readlock_response2 );
	S_teststep_expected("'$tcpar_ResReadVIN_Second' and  '$tcpar_ResReadLock_Second' are obtained.", 'send_request_req_F');			#evaluation 8
	S_teststep_detected("Obtained Response Read VIN is $readVIN_response2 and Obtained Response Read Lock Status is $readlock_response2.", 'send_request_req_F');
	
	S_teststep("Read Fault Recorder.", 'AUTO_NBR', 'read_fault_recorder');			#measurement 9
	my $flt_mem_struct_pd = PD_ReadFaultMemory();
	#my $flt_mem_struct_cd = CD_read_DTC('defaultsubfunc','defaultstate');
	S_teststep_expected("Faults '$tcpar_VINFaults' has status '$tcpar_DTC_Status'.", 'read_fault_recorder');			#evaluation 9		
	PD_check_fault_status($flt_mem_struct_pd, $tcpar_VINFaults, $faultState);
	#CD_check_fault_status($flt_mem_struct_cd, $tcpar_VINFaults, $faultState);
	
	return 1;
}

sub TC_evaluation {

	S_w2rep("Evaluation is done above in stimulation_and_measurement");
	return 1;
}

sub TC_finalization {

	# stop tester present
	GDCOM_set_addressing_mode('physical');
	GDCOM_stop_CyclicTesterPresent();
	S_wait_ms(100);
	# clear NVM after finishing

	#clear NVM memory of VIN, support to dependency TCs
	_ClearNVMforVIN();
	LC_ECU_Reset();
	
	#clear fault memory
	PD_ClearFaultMemory();
	S_wait_ms(3000);
	
	CA_set_EnvVar_value('Security03', 0);
	S_wait_ms(1000);
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


sub _reqres_key{
	my $sub_res;
	my $sub_response;
	my @Sub_arrResponse;
	CA_set_EnvVar_value('Security03', 1);
	S_wait_ms(1000);
	$sub_res = CA_get_EnvVar_value('EvRxMesgBox');
	for (my $i = 0; $i< @$sub_res; $i++){
		@Sub_arrResponse[$i] = @$sub_res[$i];
	}
	$sub_response = '';
	for(my $i=0;$i<@Sub_arrResponse;$i++)
	{
		$Sub_arrResponse[$i] = S_dec2hex($Sub_arrResponse[$i]);			
		$sub_response = $sub_response .$Sub_arrResponse[$i] ;
		if ( $i < ( @Sub_arrResponse - 1 ))
		{
			$sub_response = $sub_response . ' ';
		}
	}
	return $sub_response;
}
1;
