#### TEST CASE MODULE
package TC_DSM_Service22_ResponseCheck_nonEDR;

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

our $PURPOSE = "To read DID's init values and response length";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service22_ResponseCheck_nonEDR

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set supported <Addressing_Mode>.

2. Enter supported <Session>.

3. Check <PreCondition> if any are not set

4. Send request <REQ_ReadDataByIdentifier>.


I<B<Evaluation>>

1. 

2. Session Entery Successful

3. 

4.Positive Response <PR_ReadDataByIndentifier> shall be obtained along with <Data_Length> 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'REQ_ReadDataByIdentifier' => 
	SCALAR 'PR_ReadDataByIndentifier' => 
	SCALAR 'Data_Length' => 
	SCALAR 'Purpose' => 
	LIST 'Addressing_Mode' => 
	LIST 'Session' => 
	SCALAR 'PreCondition' => 


=head2 PARAMETER EXAMPLES

	Purpose = 'To read DID's init values and response length.'
	#input parameter
	Addressing_Mode =@('Physical','Functional')
	Session = @('default','extended')
	PreCondition = '<Fetch {Preconditions Prohibiting Execution}>'
	REQ_ReadDataByIdentifier = '22 00 00'
	PR_ReadDataByIndentifier = '62 00 00 00 00 00 00'
	Data_Length = '4'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Purpose;
my @tcpar_Addressing_Mode;
my @tcpar_Session;
my $tcpar_PreCondition;
my $tcpar_REQ_ReadDataByIdentifier;
my $tcpar_PR_ReadDataByIndentifier;
my $tcpar_Data_Length;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res_sess;
my $databyte;
###############################################################

sub TC_set_parameters {

	$tcpar_Purpose =  GEN_Read_mandatory_testcase_parameter( 'Purpose' );
	@tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_PreCondition =  GEN_Read_mandatory_testcase_parameter( 'PreCondition' );
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
	foreach my $add(@tcpar_Addressing_Mode)
	{	
		S_teststep("Set supported $add Addressing Mode", 'AUTO_NBR');
		GDCOM_set_addressing_mode($add);
		foreach my $ses(@tcpar_Session)
		{			
			my $res;
			S_teststep("Enter to $ses Session'. ", 'AUTO_NBR', 'enter_supported_session'."_$add"."_$ses");			#measurement 1
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
					
			S_teststep("Check '$tcpar_PreCondition' if any are not set", 'AUTO_NBR');
			if($tcpar_PreCondition eq 'None')
			{
				S_w2rep("No Precondition", 'Purple');
			}elsif($tcpar_PreCondition eq 'CANBusOff\nEGI040Invalid')
			{
				S_w2rep("Clear all invalid conditions", 'Purple');
				PRD_Clear_Fault_Memory();
			}

			S_teststep("Send request '$tcpar_REQ_ReadDataByIdentifier'.", 'AUTO_NBR', 'send_request_req'."_$add"."_$ses");			#measurement 2
			$res1{$add}{$ses} = GDCOM_request($tcpar_REQ_ReadDataByIdentifier,$tcpar_PR_ReadDataByIndentifier,'strict');
		}
		
		
	}
	return 1;
}

sub TC_evaluation {
foreach my $add(@tcpar_Addressing_Mode)
{	
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - Session Entery Successful", 'enter_supported_session'."_$add"."_$ses");			#evaluation 1
		S_teststep_detected("$ses - response is obsered $res_sess{$add}{$ses} ",'enter_supported_session'."_$add"."_$ses");
		if ($ses =~/default/)
		{
			S_w2rep("Enter default session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 01 00 32 01 F4', $res_sess{$add}{$ses});
		}elsif($ses =~ /extended/)
		{
			S_w2rep("Enter extended session successful.", 'Purple');
			EVAL_evaluate_string("Evaluating DTC response",'50 03 00 32 01 F4', $res_sess{$add}{$ses});
		}
		
		S_teststep_expected("$ses - Positive Response '$tcpar_PR_ReadDataByIndentifier' shall be obtained along with '$tcpar_Data_Length' ", 'send_request_req'."_$add"."_$ses");			#evaluation 2
		S_teststep_detected("$ses - response is obsered $res1{$add}{$ses}", 'send_request_req'."_$add"."_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_PR_ReadDataByIndentifier ,$res1{$add}{$ses});
		$databyte= _CountNoByteData($res1{$add}{$ses});
		EVAL_evaluate_value("Data byte should be: ",$databyte,'==',$tcpar_Data_Length);
	}
}
	return 1;
}

sub TC_finalization {

	return 1;
}

sub _CountNoByteData{
	my $data = shift;
	my $x = " ";
	my $c = () = $data =~ /$x/g;
	return $c -2;
}
1;
