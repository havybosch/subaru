#### TEST CASE MODULE
package TC_DSM_NRC_RequestOutOfRange;

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

our $PURPOSE = "To verify that NRC $31 is received with VIN value";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_NRC_RequestOutOfRange

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Create <Condition> for VIN.

2. Set addressing mode is <AddressingMode> as per Project specific SPR.

3. Enter session <Session> supported by the service and get security access  <Security> if required.

4. Send request <Req_VINCondition> by service  <Service>.


I<B<Evaluation>>

1. -

2. -

3. Positive response is received.

4. Response <NR_RequestOutOfRange_Res> is received.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	LIST 'Req_VINCondition' => 
	SCALAR 'NR_RequestOutOfRange_Res' => 
	SCALAR 'Purpose' => 
	SCALAR 'Condition' => 
	SCALAR 'Service' => 
	LIST 'AddressingMode' => 
	SCALAR 'Security' => 
	LIST 'Session' => 


=head2 PARAMETER EXAMPLES

	Purpose = 'To verify that NRC $31 is received with VIN value and Lock Status'
	Condition = '<Test Heading 3>'
	Service = '<Test Heading 2>'
	AddressingMode =@('Physical','Functional')
	Security = 'Level2'
	Session = @('Extended')
	Req_VINCondition = @('2E 10 5E 01', '2E 10 5E FE')
	NR_RequestOutOfRange_Res = '7F 2E 31'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Purpose;
my $tcpar_Condition;
my $tcpar_Service;
my @tcpar_AddressingMode;
my $tcpar_Security;
my @tcpar_Session;
my @tcpar_Req_VINCondition;
my $tcpar_NR_RequestOutOfRange_Res;

################ global parameter declaration ###################
#add any global variables here
my %res_key;
my %res_sess;
my ($mode,$session,$request,$Addressing_Mode,$SessionSupport);
my %VIN_response;
###############################################################

sub TC_set_parameters {

	$tcpar_Purpose =  GEN_Read_mandatory_testcase_parameter( 'Purpose' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_Service =  GEN_Read_mandatory_testcase_parameter( 'Service' );
	@tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Security =  GEN_Read_mandatory_testcase_parameter( 'Security' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	@tcpar_Req_VINCondition =  GEN_Read_mandatory_testcase_parameter( 'Req_VINCondition' );
	$tcpar_NR_RequestOutOfRange_Res =  GEN_Read_mandatory_testcase_parameter( 'NR_RequestOutOfRange_Res' );

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

	S_teststep("Create '$tcpar_Condition' for VIN.", 'AUTO_NBR');
	if ($tcpar_Condition eq 'Support'){
		PD_WriteMemoryByName( 'rb_sycg_StaticBehaviorBits_dfst.rb_sycg_StaticBits_ab8(1)', [ 0x01 ] );
	}
	else{
		PD_WriteMemoryByName( 'rb_sycg_StaticBehaviorBits_dfst.rb_sycg_StaticBits_ab8(1)', [ 0x00 ] );
	}
	LC_ECU_Reset();
	foreach $mode (@tcpar_AddressingMode) {
		S_teststep("Set addressing mode is $mode Addressing Mode as per Project specific SPR.", 'AUTO_NBR');
		GDCOM_set_addressing_mode($mode);
		S_wait_ms(100);
		foreach $session(@tcpar_Session)
		{			
			my $res;
			S_teststep("Enter session $session supported by the service and get security access  '$tcpar_Security' if required.", 'AUTO_NBR', 'enter_session_session'."_$mode"."_$session");			#measurement 1
			if ($session =~/Default/)
			{
				S_w2rep("Enter default session", 'Purple');
				$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
			}				
			elsif($session =~/Extended/)
			{
				S_w2rep("Enter Extended session", 'Purple');
				$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
			}
			$res_sess{$mode}{$session} = $res;		
			if ($tcpar_Security eq 'Level2')
			{
				S_w2rep("Request security level2.", 'Purple');
				$res_key{$mode}{$session} = _reqres_key();
				#my @reskey = split(/ /,$res_key{$mode}{$session});
				#EVAL_evaluate_value("Checking value of byte 1", @reskey[0],'==',0x67);
				#EVAL_evaluate_value("Checking value of byte 2", @reskey[1],'==',0x4);
			}
			else
			{
				S_w2rep("Request security not request", 'Purple');
			}
			foreach $request (@tcpar_Req_VINCondition) {
				my $resVIN;
				S_teststep("Send request $request by service  '$tcpar_Service'.", 'AUTO_NBR', 'send_request_req'."_$mode"."_$session"."_$request");			#measurement 2
				if ($mode eq 'Physical'){
					$resVIN = GDCOM_request($request,$tcpar_NR_RequestOutOfRange_Res, 'strict');
				}
				elsif($mode eq 'Functional'){ #no response expected
					$resVIN = GDCOM_request($request,"", 'quiet');
				}
				$VIN_response{$mode}{$session}{$request} = $resVIN;
			}
			CA_set_EnvVar_value('Security03', 0);
			S_wait_ms(1000);
		}
	}
	
	return 1;
}

sub TC_evaluation {
foreach my $mode(@tcpar_AddressingMode)
{
	foreach my $session (@tcpar_Session)
	{
		S_teststep_expected("$session - Positive response is received.", 'enter_session_session'."_$mode"."_$session");			#evaluation 1
		S_teststep_detected("$session - response is obsered $res_sess{$mode}{$session}", 'enter_session_session'."_$mode"."_$session");
		if ($session =~/Default/)
		{
			S_w2rep("Enter default session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 01 00 32 01 F4', $res_sess{$mode}{$session});
		}elsif($session =~ /Extended/)
		{
			S_w2rep("Enter extended session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4', $res_sess{$mode}{$session});
		}
		if ($tcpar_Security eq 'Level2')
		{
			S_w2rep("Security level2 passed as $res_key{$mode}{$session}.", 'Purple');
			my @reskey = split(/ /,$res_key{$mode}{$session});
			EVAL_evaluate_value("Checking value of byte 1", @reskey[0],'==',0x67);
			EVAL_evaluate_value("Checking value of byte 2", @reskey[1],'==',0x4);
		}
		foreach $request (@tcpar_Req_VINCondition)
		{
			if ($mode eq 'Physical'){	
				S_teststep_expected("$request - Response '$tcpar_NR_RequestOutOfRange_Res' is received.", 'send_request_req'."_$mode"."_$session"."_$request");			#evaluation 2
				S_teststep_detected("$request - Obtained response is $VIN_response{$mode}{$session}{$request}", 'send_request_req'."_$mode"."_$session"."_$request");
				EVAL_evaluate_string("Evaluating DTC response",$tcpar_NR_RequestOutOfRange_Res,$VIN_response{$mode}{$session}{$request});		
			}
			elsif($mode eq 'Functional'){
				S_w2rep("No Response is received for Functional mode", 'Purple');
			}
		}
	}
}
	return 1;
}

sub TC_finalization {
	# stop tester present
	GDCOM_set_addressing_mode('physical');
	GDCOM_stop_CyclicTesterPresent();
	S_wait_ms(100);
	# clear NVM after finishing

	#clear fault memory
	PD_ClearFaultMemory();
	S_wait_ms(3000);

	#clear NVM memory of VIN, support to dependency TCs
	_ClearNVMforVIN();
	
	#change to support VIN with China Variant
	PD_WriteMemoryByName( 'rb_sycg_StaticBehaviorBits_dfst.rb_sycg_StaticBits_ab8(1)', [ 0x01 ] );
	S_wait_ms(500);
	LC_ECU_Reset();
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
