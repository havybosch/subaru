#### TEST CASE MODULE
package TC_DSM_VIN_DynamicDID_MultiDID;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.2 $;
our $HEADER = q$Header: TCs/TCs_Project/DSM/TC_DSM_VIN_DynamicDID_MultiDID.pm 1.2 2019/08/15 11:40:42ICT RNO1HC reviewed RNO1HC(2019/10/29 15:22:04ICT) $;

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

our $PURPOSE = "This test case try to check VIN value and Lock Status by DynamicDID and MultiDIDs";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_VIN_DynamicDID_MultiDID

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

5. Send request <Req_Write_VIN> with <Byte_LengthVIN> and <VINvalue1>.

6. Send request <Req_DynamicDID>

7. Send request <Req_ReadDID_1st>

8. Send request <Req_Write_VIN> with <Byte_LengthVIN> and <VINvalue2>.

9. Send request <Req_Write_Lock> with <Byte_LengthLock> and <Lockvalue>.

10. Send request <Req_ReadDID_2nd>


I<B<Evaluation>>

1. -

2. -

3. Positive response is observed.

4. Positive response is observed.

5. Positive response is observed.

6. <Res_DynamicDID> is obtained.

7. <Res_ReadDID_1st> is obtained.

8. Positive response is observed.

9. Positive response is observed.

10. <Res_ReadDID_2nd> is obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req_DynamicDID' => 
	SCALAR 'Res_DynamicDID' => 
	SCALAR 'Req_ReadDID_1st' => 
	SCALAR 'Res_ReadDID_1st' => 
	SCALAR 'Req_ReadDID_2nd' => 
	SCALAR 'Res_ReadDID_2nd' => 
	SCALAR 'purpose' => 
	SCALAR 'Addressing_Mode' => 
	SCALAR 'Session' => 
	SCALAR 'WaitTime_ms' => 
	SCALAR 'VINvalue1' => 
	SCALAR 'VINvalue2' => 
	SCALAR 'Lockvalue' => 
	SCALAR 'Req_Write_VIN' => 
	SCALAR 'Req_Write_Lock' => 
	SCALAR 'Byte_LengthVIN' => 
	SCALAR 'Byte_LengthLock' => 
	SCALAR 'Condition' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the VIN value and Lock Status in different conditions'
	Addressing_Mode = 'physical'
	Session = 'ExtendedSession'
	WaitTime_ms='10000'
	VINvalue1 = '00 01 02 03 04 05 06 07 30 08 10 11 12 13 14 15 16'
	VINvalue2 = '01 02 03 04 05 06 07 08 58 10 11 12 13 14 15 16 17'
	Lockvalue = 'FF'
	Req_Write_VIN = 'WriteDataByIdentifier_VIN'
	Req_Write_Lock = 'WriteDataByIdentifier_VINLockFlag'
	Byte_LengthVIN = '17'
	Byte_LengthLock = '1'
	Condition = '<Test Heading 1>' #support to skip step 6 without Dynamic
	Req_DynamicDID = '2C 01 F3 00 F1 90 01 11 10 5E 01 01'
	Res_DynamicDID = '6C 01 F3 00'
	
	Req_ReadDID_1st = '22 F3 00'
	Res_ReadDID_1st = '62 F3 00 00 01 02 03 04 05 06 07 30 08 10 11 12 13 14 15 16 00'
	
	Req_ReadDID_2nd = '22 F3 00'
	Res_ReadDID_2nd = '62 F3 00 01 02 03 04 05 06 07 08 58 10 11 12 13 14 15 16 17 FF'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Addressing_Mode;
my $tcpar_Session;
my $tcpar_WaitTime_ms;
my $tcpar_VINvalue1;
my $tcpar_VINvalue2;
my $tcpar_Lockvalue;
my $tcpar_Req_Write_VIN;
my $tcpar_Req_Write_Lock;
my $tcpar_Byte_LengthVIN;
my $tcpar_Byte_LengthLock;
my $tcpar_Condition;
my $tcpar_Req_DynamicDID;
my $tcpar_Res_DynamicDID;
my $tcpar_Req_ReadDID_1st;
my $tcpar_Res_ReadDID_1st;
my $tcpar_Req_ReadDID_2nd;
my $tcpar_Res_ReadDID_2nd;

################ global parameter declaration ###################
#add any global variables here
my ($dataVIN, $dataLock);
my $res_key1;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime_ms =  GEN_Read_mandatory_testcase_parameter( 'WaitTime_ms' );
	$tcpar_VINvalue1 =  GEN_Read_mandatory_testcase_parameter( 'VINvalue1' );
	$tcpar_VINvalue2 =  GEN_Read_mandatory_testcase_parameter( 'VINvalue2' );
	$tcpar_Lockvalue =  GEN_Read_mandatory_testcase_parameter( 'Lockvalue' );
	$tcpar_Req_Write_VIN =  GEN_Read_mandatory_testcase_parameter( 'Req_Write_VIN' );
	$tcpar_Req_Write_Lock =  GEN_Read_mandatory_testcase_parameter( 'Req_Write_Lock' );
	$tcpar_Byte_LengthVIN =  GEN_Read_mandatory_testcase_parameter( 'Byte_LengthVIN' );
	$tcpar_Byte_LengthLock =  GEN_Read_mandatory_testcase_parameter( 'Byte_LengthLock' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_Req_DynamicDID =  GEN_Read_mandatory_testcase_parameter( 'Req_DynamicDID' );
	$tcpar_Res_DynamicDID =  GEN_Read_mandatory_testcase_parameter( 'Res_DynamicDID' );
	$tcpar_Req_ReadDID_1st =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDID_1st' );
	$tcpar_Res_ReadDID_1st =  GEN_Read_mandatory_testcase_parameter( 'Res_ReadDID_1st' );
	$tcpar_Req_ReadDID_2nd =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDID_2nd' );
	$tcpar_Res_ReadDID_2nd =  GEN_Read_mandatory_testcase_parameter( 'Res_ReadDID_2nd' );

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
	
  	#DIAG_SecurityUnlock(0); # create a event from 0 to 1
  	#S_wait_ms(500); # to sync with CAPL unlock code, 1s wait would be necessary.		
	#DIAG_SecurityUnlock(2);
	#S_wait_ms(500); # to sync with CAPL unlock code, 1s wait would be necessary.
	
	S_teststep("Send request '$tcpar_Req_Write_VIN' with '$tcpar_Byte_LengthVIN' and '$tcpar_VINvalue1'.", 'AUTO_NBR', 'send_request_req_A');			#measurement 3
	$dataVIN->{'Data'} = $tcpar_VINvalue1;
	my $writeVIN_response1 = GDCOM_request_general("REQ_".$tcpar_Req_Write_VIN, "PR_".$tcpar_Req_Write_VIN, $dataVIN);
	S_teststep_expected("Positive response is observed.", 'send_request_req_A');			#evaluation 3
	S_teststep_detected("Obtained Response is $writeVIN_response1.", 'send_request_req_A');

	if($tcpar_Condition ne 'MultiDID'){	
		S_teststep("Send request '$tcpar_Req_DynamicDID'", 'AUTO_NBR', 'send_request_req_B');			#measurement 4
		my $Dynamic_response = GDCOM_request($tcpar_Req_DynamicDID, $tcpar_Res_DynamicDID, 'strict');
		EVAL_evaluate_string( "VINDynamicMulti1\_Evaluation", $tcpar_Res_DynamicDID, $Dynamic_response );
		S_teststep_expected("'$tcpar_Res_DynamicDID' is obtained.", 'send_request_req_B');			#evaluation 4
		S_teststep_detected("Obtained Response Write VIN is $Dynamic_response.", 'send_request_req_B');	
	}
	
	S_teststep("Send request '$tcpar_Req_ReadDID_1st'", 'AUTO_NBR', 'send_request_req_C');			#measurement 5
	my $ReadDID_response1 = GDCOM_request($tcpar_Req_ReadDID_1st, $tcpar_Res_ReadDID_1st, 'strict');
	EVAL_evaluate_string( "VINDynamicMulti2\_Evaluation", $tcpar_Res_ReadDID_1st, $ReadDID_response1 );
	S_teststep_expected("'$tcpar_Res_ReadDID_1st' is obtained.", 'send_request_req_C');			#evaluation 5
	S_teststep_detected("Obtained Response is $ReadDID_response1.", 'send_request_req_C');
	
	S_teststep("Send request '$tcpar_Req_Write_VIN' with '$tcpar_Byte_LengthVIN' and '$tcpar_VINvalue2'.", 'AUTO_NBR', 'send_request_req_D');			#measurement 6
	$dataVIN->{'Data'} = $tcpar_VINvalue2;
	my $writeVIN_response2 = GDCOM_request_general("REQ_".$tcpar_Req_Write_VIN, "PR_".$tcpar_Req_Write_VIN, $dataVIN);	
	S_teststep_expected("Positive response is observed.", 'send_request_req_D');			#evaluation 6
	S_teststep_detected("Obtained Response is $writeVIN_response2.", 'send_request_req_D');

	S_teststep("Send request '$tcpar_Req_Write_Lock' with '$tcpar_Byte_LengthLock' and '$tcpar_Lockvalue'.", 'AUTO_NBR', 'send_request_req_E');			#measurement 7
	$dataLock->{'Data'} = $tcpar_Lockvalue;
	my $writeLock_response = GDCOM_request_general("REQ_".$tcpar_Req_Write_Lock, "PR_".$tcpar_Req_Write_Lock, $dataLock);	
	S_teststep_expected("Positive response is observed.", 'send_request_req_E');			#evaluation 7
	S_teststep_detected("Obtained Response is $writeLock_response.", 'send_request_req_E');

	S_teststep("Send request '$tcpar_Req_ReadDID_2nd'", 'AUTO_NBR', 'send_request_req_F');			#measurement 8
	my $ReadDID_response2 = GDCOM_request($tcpar_Req_ReadDID_2nd, $tcpar_Res_ReadDID_2nd, 'strict');
	EVAL_evaluate_string( "VINDynamicMulti2\_Evaluation", $tcpar_Res_ReadDID_2nd, $ReadDID_response2 );
	S_teststep_expected("'$tcpar_Res_ReadDID_2nd' is obtained.", 'send_request_req_F');			#evaluation 8
	S_teststep_detected("Obtained Response is $ReadDID_response2.", 'send_request_req_F');

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
	S_wait_ms(100);

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
