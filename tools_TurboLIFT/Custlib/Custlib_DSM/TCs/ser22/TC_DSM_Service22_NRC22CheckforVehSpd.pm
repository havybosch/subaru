#### TEST CASE MODULE
package TC_DSM_Service22_NRC22CheckforVehSpd;

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

our $PURPOSE = "To check NRC22 for Vehicle Speed";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service22_NRC22CheckforVehSpd

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set supported <Addressing_Mode>.

2. Enter into <Session>.

3. Create <Condition>

4. Send <REQ_VehicleSpeed>


I<B<Evaluation>>

1. 

2. Session Entery Successful

3.

4. <NRC22> shall be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Addressing_Mode' => 
	LIST 'Session' => 
	SCALAR 'Condition' => 
	SCALAR 'REQ_VehicleSpeed' => 
	SCALAR 'NRC22' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check NRC22 for Vehicle Speed' 
	#input parameter
	Addressing_Mode =@('Physical','Functional')
	Session = @('default','extended')
	Condition = '<Test Heading>'
	REQ_VehicleSpeed = '22 10 1A'
	#output parameter
	NRC22 = '7F 22 22'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Addressing_Mode;
my @tcpar_Session;
my $tcpar_Condition;
my $tcpar_REQ_VehicleSpeed;
my $tcpar_NRC22;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res_sess;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_REQ_VehicleSpeed =  GEN_Read_mandatory_testcase_parameter( 'REQ_VehicleSpeed' );
	$tcpar_NRC22 =  GEN_Read_mandatory_testcase_parameter( 'NRC22' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {
	S_w2rep("Start the CANOe Measurement and CAN trace\n",'Purple');
	CA_trace_start();
	PRD_Clear_Fault_Memory();
	S_wait_ms(5000);
	foreach my $add(@tcpar_Addressing_Mode)
	{	
		S_teststep("Set supported $add Addressing Mode", 'AUTO_NBR');
		GDCOM_set_addressing_mode($add);
		foreach my $ses(@tcpar_Session)
		{			
			my $res;
			S_teststep("Enter into $ses Session", 'AUTO_NBR', 'enter_into_session'."_$add"."_$ses");			#measurement 1
			if ($ses =~/default/)
			{
				S_w2rep("Enter default session", 'Purple');
				$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
			}				
			elsif($ses =~ /extended/)
			{
				S_w2rep("Enter Extended session", 'Purple');
				$res = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
			}
			$res_sess{$add}{$ses} = $res;
			
			S_teststep("Create '$tcpar_Condition'", 'AUTO_NBR');
			_CheckCondition($tcpar_Condition);
			
			S_teststep("Send '$tcpar_REQ_VehicleSpeed'", 'AUTO_NBR', 'send_req_vehiclespeed'."_$add"."_$ses");			#measurement 2
			$res1{$add}{$ses} = GDCOM_request($tcpar_REQ_VehicleSpeed,$tcpar_NRC22,'strict');
		}
	}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_Addressing_Mode)
{	
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - Session Entery Successful", 'enter_into_session'."_$add"."_$ses");			#evaluation 1
		S_teststep_detected("$ses - Positive response is $res_sess{$add}{$ses}", 'enter_into_session'."_$add"."_$ses");
		if ($ses =~/default/)
		{
			S_w2rep("Enter default session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 01 00 32 01 F4', $res_sess{$add}{$ses});
		}elsif($ses =~ /extended/)
		{
			S_w2rep("Enter extended session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4', $res_sess{$add}{$ses});
		}
		
		S_teststep_expected("$ses - '$tcpar_NRC22' shall be obtained.", 'send_req_vehiclespeed'."_$add"."_$ses");			#evaluation 2
		S_teststep_detected("$ses - DTC response is $res1{$add}{$ses}", 'send_req_vehiclespeed'."_$add"."_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC22,$res1{$add}{$ses});
	}
}
	return 1;
}

sub TC_finalization {
	S_w2rep("Re-Configuring $tcpar_Condition", 'Purple');
	_ResetCondition($tcpar_Condition);
	
	return 1;
}

sub _CheckCondition{
	my $sub_condition = shift;
	if($sub_condition eq 'VDC139MsgTimeOut')
	{
		COM_stopMessages('VDC139');
	}elsif($sub_condition eq 'VDC139DLCError')
	{
		CA_set_EnvVar_value('enV_VDC139_DLC',0);	
	}elsif($sub_condition eq 'VDC139ChecksumError')
	{
		CA_set_EnvVar_value('_enV_VDC139_CheckSumError',1);
	}elsif($sub_condition eq 'VDC139MsgCounterError')
	{
		CA_set_EnvVar_value('_enV_VDC139_MsgCtrError',1);
	}
	S_wait_ms(200);
}

sub _ResetCondition{
	my $sub_condition1 = shift;
	if($sub_condition1 eq 'VDC139MsgTimeOut')
	{
		COM_startMessages('VDC139');
	}elsif($sub_condition1 eq 'VDC139DLCError')
	{
		CA_set_EnvVar_value('enV_VDC139_DLC',8);	
	}elsif($sub_condition1 eq 'VDC139ChecksumError')
	{
		CA_set_EnvVar_value('_enV_VDC139_CheckSumError',0);
	}elsif($sub_condition1 eq 'VDC139MsgCounterError')
	{
		CA_set_EnvVar_value('_enV_VDC139_MsgCtrError',0);
	}
	S_wait_ms(500);
}
1;
