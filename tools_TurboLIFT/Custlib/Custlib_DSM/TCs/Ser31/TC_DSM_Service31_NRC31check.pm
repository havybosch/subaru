#### TEST CASE MODULE
package TC_DSM_Service31_NRC31check;

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
##################################

our $PURPOSE = "Check NRC31 for service31";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service31_NRC31check

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Send <Wrong_Req1>

3. Wait for <WaitTime>

4.  Send <Wrong_Req2>

5. Wait for <WaitTime>

6.  Send <Wrong_Req3>

7. Wait for <WaitTime>

8.  Send <Wrong_Req4>

9. Wait for <WaitTime>

10. Send <Wrong_Req5>


I<B<Evaluation>>

1.

2. <NRC_31> should be obtained.

3. 

4. <NRC_31> should be obtained.

5.

6.<NRC_31> should be obtained.

7.

8.<NRC_31> should be obtained.

9.

10.<NRC_31> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'WaitTime' => 
	SCALAR 'Wrong_Req1' => 
	SCALAR 'Wrong_Req2' => 
	SCALAR 'Wrong_Req3' => 
	SCALAR 'Wrong_Req4' => 
	SCALAR 'Wrong_Req5' => 
	SCALAR 'NRC_31' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $31 service when RID is not supported  in Active Session'
	
	# input parameters
	Session =@('default','extended')
	WaitTime = '1000' #ms
	Wrong_Req1 = '31 01 AB AB'  
	Wrong_Req2 = '31 01 AC BB'  
	Wrong_Req3 = '31 03 11 22'  
	Wrong_Req4 = '31 03 AA AC'  
	Wrong_Req5 = '31 01 00 00'
	
	# output parameters
	NRC_31 = '7F 31 31'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Session;
my $tcpar_WaitTime;
my $tcpar_Wrong_Req1;
my $tcpar_Wrong_Req2;
my $tcpar_Wrong_Req3;
my $tcpar_Wrong_Req4;
my $tcpar_Wrong_Req5;
my $tcpar_NRC_31;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my %res3;
my %res4;
my %res5;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_Wrong_Req1 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req1' );
	$tcpar_Wrong_Req2 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req2' );
	$tcpar_Wrong_Req3 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req3' );
	$tcpar_Wrong_Req4 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req4' );
	$tcpar_Wrong_Req5 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req5' );
	$tcpar_NRC_31 =  GEN_Read_mandatory_testcase_parameter( 'NRC_31' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {
	foreach my $ses(@tcpar_Session)
	{			
		my $res;
		S_teststep("Enter to $ses session ", 'AUTO_NBR',"enter_supported_session_$ses");
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
	
		S_teststep("Send '$tcpar_Wrong_Req1'", 'AUTO_NBR', "send_wrong_req1_$ses");			#measurement 1
		$res1{$ses}= GDCOM_request($tcpar_Wrong_Req1,$tcpar_NRC_31,'strict');
		
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Wrong_Req2'", 'AUTO_NBR', "send_wrong_req2_$ses");			#measurement 2
		$res2{$ses}= GDCOM_request($tcpar_Wrong_Req2,$tcpar_NRC_31,'strict');
		
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Wrong_Req3'", 'AUTO_NBR', "send_wrong_req3_$ses");			#measurement 3
		$res3{$ses}= GDCOM_request($tcpar_Wrong_Req3,$tcpar_NRC_31,'strict');
		
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Wrong_Req4'", 'AUTO_NBR', "send_wrong_req4_$ses");			#measurement 4
		$res4{$ses}= GDCOM_request($tcpar_Wrong_Req4,$tcpar_NRC_31,'strict');
		
		S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');
		S_wait_ms($tcpar_WaitTime);
		
		S_teststep("Send '$tcpar_Wrong_Req5'", 'AUTO_NBR', "send_wrong_req5_$ses");			#measurement 5
		$res5{$ses}= GDCOM_request($tcpar_Wrong_Req5,$tcpar_NRC_31,'strict');
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - '$tcpar_NRC_31' should be obtained.", "send_wrong_req1_$ses");			#evaluation 1
		S_teststep_detected("$ses - NRC response should be $res1{$ses}", "send_wrong_req1_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_31,$res1{$ses});
		
		S_teststep_expected("$ses - '$tcpar_NRC_31' should be obtained.", "send_wrong_req2_$ses");			#evaluation 2
		S_teststep_detected("$ses - NRC response should be $res2{$ses}", "send_wrong_req2_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_31,$res2{$ses});
		
		S_teststep_expected("$ses - '$tcpar_NRC_31' should be obtained.","send_wrong_req3_$ses");			#evaluation 3
		S_teststep_detected("$ses - NRC response should be $res3{$ses}", "send_wrong_req3_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_31,$res3{$ses});
		
		S_teststep_expected("$ses - '$tcpar_NRC_31' should be obtained.", "send_wrong_req4_$ses");			#evaluation 4
		S_teststep_detected("$ses - NRC response should be $res4{$ses}", "send_wrong_req4_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_31,$res4{$ses});
		
		S_teststep_expected("$ses - '$tcpar_NRC_31' should be obtained.", "send_wrong_req5_$ses");			#evaluation 5
		S_teststep_detected("$ses - NRC response should be $res5{$ses}", "send_wrong_req5_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_31,$res5{$ses});
	}
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
