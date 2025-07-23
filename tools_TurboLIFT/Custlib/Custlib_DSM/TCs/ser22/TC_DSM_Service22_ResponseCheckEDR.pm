#### TEST CASE MODULE
package TC_DSM_Service22_ResponseCheckEDR;

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

our $PURPOSE = "To read EDR DID init values and response length";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service22_ResponseCheckEDR

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set supported <Addressing_Mode>.

2. Enter supported <Session>.

3. Take <Level2_SecurityAccess>

4. Check <PreCondition> if any are not set.

5. Send request <REQ_ReadDataByIdentifier>.


I<B<Evaluation>>

1. 

2. Session Entery Successful

3. Positive response key <Pos_Response_Key> should be observed.

4.

5.Positive Response <PR_ReadDataByIndentifier> shall be obtained along with <Data_Length> 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'REQ_ReadDataByIdentifier' => 
	SCALAR 'PR_ReadDataByIndentifier' => 
	SCALAR 'Data_Length' => 
	SCALAR 'Purpose' => 
	SCALAR 'Session' => 
	LIST 'Addressing_Mode' => 
	SCALAR 'PreCondition' => 
	SCALAR 'Level2_SecurityAccess' => 
	SCALAR 'Pos_Response_Key' => 


=head2 PARAMETER EXAMPLES

	Purpose = 'To read EDR DID init values and response length.'
	#input parameter
	Session = '<Fetch {Session} {(.* )}>'
	Addressing_Mode =@('Physical','Functional')
	PreCondition = '<Fetch {Preconditions Prohibiting Execution}>'
	Level2_SecurityAccess = '<Fetch {Security Access}>'
	#output parameter
	Pos_Response_Key = '0x67 0x4'
	REQ_ReadDataByIdentifier = '22 23 00'
	PR_ReadDataByIndentifier = '62 23 00 C0 01 EF 81' 
	Data_Length = '4'
	
	# Note: V_ES1MHEV: PR_ReadDataByIndentifier = '62 23 00 C0 01 EF 81' 
	
		

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Purpose;
my $tcpar_Session;
my @tcpar_Addressing_Mode;
my $tcpar_PreCondition;
my $tcpar_Level2_SecurityAccess;
my $tcpar_Pos_Response_Key;
my $tcpar_REQ_ReadDataByIdentifier;
my $tcpar_PR_ReadDataByIndentifier;
my $tcpar_Data_Length;

################ global parameter declaration ###################
#add any global variables here
my %res;
my %res_sess;
my %res_key;
my $databyte;
###############################################################

sub TC_set_parameters {

	$tcpar_Purpose =  GEN_Read_mandatory_testcase_parameter( 'Purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_PreCondition =  GEN_Read_mandatory_testcase_parameter( 'PreCondition' );
	$tcpar_Level2_SecurityAccess =  GEN_Read_mandatory_testcase_parameter( 'Level2_SecurityAccess' );
	$tcpar_Pos_Response_Key =  GEN_Read_mandatory_testcase_parameter( 'Pos_Response_Key' );
	$tcpar_REQ_ReadDataByIdentifier =  GEN_Read_mandatory_testcase_parameter( 'REQ_ReadDataByIdentifier' );
	$tcpar_PR_ReadDataByIndentifier =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDataByIndentifier' );
	$tcpar_Data_Length =  GEN_Read_mandatory_testcase_parameter( 'Data_Length' );

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
		S_teststep("Set supported $add Addressing Mode'.", 'AUTO_NBR');
		GDCOM_set_addressing_mode($add);	

		S_teststep("Enter supported '$tcpar_Session'.", 'AUTO_NBR', "enter_supported_session_$add");			#measurement 1
		S_w2rep("Enter Extended session", 'Purple');
		$res_sess{$add} = GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession');
		
		S_teststep("Take '$tcpar_Level2_SecurityAccess'", 'AUTO_NBR', "take_level2_securityaccess_$add");			#measurement 2
		$res_key{$add} = _reqres_key($tcpar_Level2_SecurityAccess);
		
		S_teststep("Check '$tcpar_PreCondition' if any are not set.", 'AUTO_NBR');
		if ($tcpar_PreCondition eq 'None')
		{
			S_w2rep("No need to do PreCondition", 'Purple');
		}else
		{
			S_w2rep("Do $tcpar_PreCondition ", 'Purple');
		}
		
		S_teststep("Send request '$tcpar_REQ_ReadDataByIdentifier'.", 'AUTO_NBR', "send_request_req_$add");			#measurement 3
		$res{$add} = GDCOM_request($tcpar_REQ_ReadDataByIdentifier,$tcpar_PR_ReadDataByIndentifier,'strict');
	}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_Addressing_Mode)
{
	S_teststep_expected("$add - Session Entery Successful", "enter_supported_session_$add");			#evaluation 1
	S_teststep_detected("$add - response is obsered $res_sess{$add}", "enter_supported_session_$add");
	S_w2rep("Enter extended session successful.", 'Purple');
	EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4', $res_sess{$add});
			
	S_teststep_expected("$add - Positive response key '$tcpar_Pos_Response_Key' should be observed.", "take_level2_securityaccess_$add");			#evaluation 2
	S_teststep_detected("$add - positive response key is $res_key{$add}", "take_level2_securityaccess_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Pos_Response_Key, $res_key{$add});
	
	S_teststep_expected("$add - Positive Response '$tcpar_PR_ReadDataByIndentifier' shall be obtained along with '$tcpar_Data_Length' ", "send_request_req_$add");			#evaluation 3
	S_teststep_detected("$add - Positive response is observed $res{$add}", "send_request_req_$add");
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_ReadDataByIndentifier,$res{$add});
	$databyte= _CountNoByteData($res{$add});
	EVAL_evaluate_value("Data byte should be: ",$databyte,'==',$tcpar_Data_Length);
}
	return 1;
}

sub TC_finalization {
		
		CA_set_EnvVar_value('Security03', 0);
		S_wait_ms(1000);
	
	return 1;
}

sub _reqres_key{
	my $sub_level = shift;
	my $sub_res;
	my $sub_response;
	my @Sub_arrResponse;
	if ($sub_level eq 'Level 2')
	{
		CA_set_EnvVar_value('Security03', 1);
	}
	else
	{
		S_w2rep("Do nothing", 'Purple');
	}
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

sub _CountNoByteData{
	my $data = shift;
	my $x = " ";
	my $c = () = $data =~ /$x/g;
	return $c -2;
}
1;
