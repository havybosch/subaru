#### TEST CASE MODULE
package TC_DSM_NRC_ConditionsNotCorrect;

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

our $PURPOSE = "To verify that NRC $22 is received with VIN value and Lock Status";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_NRC_ConditionsNotCorrect

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set the <AddressingMode> addressing mode

2. Enter to <Session> Session and get security access Level2.

3. Use service <Service> to send request <Req_WriteLockStatus> with <Lockvalue>


I<B<Evaluation>>

1.

2. Enter session is completed.

3. Response <NR_ConditionsNotCorrect_Res> is received


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req_WriteLockStatus' => 
	SCALAR 'Lockvalue' => 
	SCALAR 'Purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Session' => 
	SCALAR 'Service' => 
	SCALAR 'NR_ConditionsNotCorrect_Res' => 


=head2 PARAMETER EXAMPLES

	Purpose = 'To verify that NRC $22 is received with VIN value and Lock Status'
	AddressingMode = 'Physical'
	Session = 'ExtendedSession'
	Service = '<Test Heading 2>'
	NR_ConditionsNotCorrect_Res = '7F 2E 22'
	Req_WriteLockStatus = '2E 10 5E 00'
	Lockvalue = '00'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Purpose;
my $tcpar_AddressingMode;
my $tcpar_Session;
my $tcpar_Service;
my $tcpar_NR_ConditionsNotCorrect_Res;
my $tcpar_Req_WriteLockStatus;
my $tcpar_Lockvalue;

################ global parameter declaration ###################
#add any global variables here
my $res_key;
my $res_sess;
my $writeLock_response;
###############################################################

sub TC_set_parameters {

	$tcpar_Purpose =  GEN_Read_mandatory_testcase_parameter( 'Purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Service =  GEN_Read_mandatory_testcase_parameter( 'Service' );
	$tcpar_NR_ConditionsNotCorrect_Res =  GEN_Read_mandatory_testcase_parameter( 'NR_ConditionsNotCorrect_Res' );
	$tcpar_Req_WriteLockStatus =  GEN_Read_mandatory_testcase_parameter( 'Req_WriteLockStatus' );
	$tcpar_Lockvalue =  GEN_Read_mandatory_testcase_parameter( 'Lockvalue' );

	return 1;
}

sub TC_initialization {
	#clear NVM memory of VIN, support to dependency TCs
	S_teststep("Clear NVM memory of VIN", 'AUTO_NBR');
	_ClearNVMforVIN();
	LC_ECU_Reset();
	
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	GDCOM_set_addressing_mode('Physical');
	GDCOM_start_CyclicTesterPresent();
	S_wait_ms(100);
	
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set the '$tcpar_AddressingMode' addressing mode", 'AUTO_NBR');
	GDCOM_set_addressing_mode(lc $tcpar_AddressingMode);
	S_wait_ms(100);
	
	S_teststep("Enter to '$tcpar_Session' Session and get security access Level2.", 'AUTO_NBR', 'enter_to_session');			#measurement 1
	$res_sess = GDCOM_request_general( "REQ_DiagnosticSessionControl_" . $tcpar_Session, "PR_DiagnosticSessionControl_" . $tcpar_Session );
	S_w2rep("Request security level2.", 'Purple');
	$res_key = _reqres_key();
	my @reskey = split(/ /,$res_key);
	EVAL_evaluate_value("Checking value of byte 1", @reskey[0],'==',0x67);
	EVAL_evaluate_value("Checking value of byte 2", @reskey[1],'==',0x4);
	
	S_teststep("Use service '$tcpar_Service' to send request '$tcpar_Req_WriteLockStatus' with '$tcpar_Lockvalue'", 'AUTO_NBR', 'use_service_service');			#measurement 2
	$writeLock_response = GDCOM_request ($tcpar_Req_WriteLockStatus,$tcpar_NR_ConditionsNotCorrect_Res,'strict');
	
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Enter session is completed.", 'enter_to_session');			#evaluation 1
	S_teststep_detected("Session is entry $res_sess", 'enter_to_session');
	EVAL_evaluate_string("Evaluation session is :",'50 03 00 32 01 F4', $res_sess);

	S_teststep_expected("Response '$tcpar_NR_ConditionsNotCorrect_Res' is received", 'use_service_service');			#evaluation 2
	S_teststep_detected("Obtained Response is $writeLock_response", 'use_service_service');
	EVAL_evaluate_string("Evaluation session is :",'7F 2E 22', $writeLock_response);
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
