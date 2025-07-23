#### TEST CASE MODULE
package TC_DSM_Service1905_BitCombinations;

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

our $PURPOSE = "To check response of $19 $05 with different bit combinations";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service1905_BitCombinations

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Send<Request_record1>

3. Send<Request_record2>

4.Send<Request_record3>


I<B<Evaluation>>

1.

2. <Res_Record1> should be obtained followed 

3. <Res_Record2> should be obtained followed

4. <Res_Record3> should be obtained followed


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'Request_record1' => 
	SCALAR 'Request_record2' => 
	SCALAR 'Request_record3' => 
	SCALAR 'Res_Record1' => 
	SCALAR 'Res_Record2' => 
	SCALAR 'Res_Record3' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $19 $05 with different bit combinations'
	
	# input parameters
	Session = @('default','extended')
	Request_record1 = '19 05 01'
	Request_record2 = '19 05 29'
	Request_record3 = '19 05 FF'
	
	# output parameters
	Res_Record1 = '59 05 01'
	Res_Record2 = '59 05 29'
	Res_Record3 = '59 05 FF'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my @tcpar_Session;
my $tcpar_Request_record1;
my $tcpar_Request_record2;
my $tcpar_Request_record3;
my $tcpar_Res_Record1;
my $tcpar_Res_Record2;
my $tcpar_Res_Record3;

################ global parameter declaration ###################
#add any global variables here
my %res1;
my %res2;
my %res3;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Request_record1 =  GEN_Read_mandatory_testcase_parameter( 'Request_record1' );
	$tcpar_Request_record2 =  GEN_Read_mandatory_testcase_parameter( 'Request_record2' );
	$tcpar_Request_record3 =  GEN_Read_mandatory_testcase_parameter( 'Request_record3' );
	$tcpar_Res_Record1 =  GEN_Read_mandatory_testcase_parameter( 'Res_Record1' );
	$tcpar_Res_Record2 =  GEN_Read_mandatory_testcase_parameter( 'Res_Record2' );
	$tcpar_Res_Record3 =  GEN_Read_mandatory_testcase_parameter( 'Res_Record3' );

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
		S_teststep("Enter to $ses session in Physical", 'AUTO_NBR',"enter_supported_session_$ses");
		GDCOM_set_addressing_mode('Physical');
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
			
		S_teststep("Send'$tcpar_Request_record1'", 'AUTO_NBR', "sendrequest_record1_$ses");			#measurement 1
		$res1{$ses} = GDCOM_request($tcpar_Request_record1,$tcpar_Res_Record1,'strict');
		S_teststep("Send'$tcpar_Request_record2'", 'AUTO_NBR', "sendrequest_record2_$ses");			#measurement 2
		$res2{$ses} = GDCOM_request($tcpar_Request_record2,$tcpar_Res_Record2,'strict');
		S_teststep("Send'$tcpar_Request_record3'", 'AUTO_NBR', "sendrequest_record3_$ses");			#measurement 3
		$res3{$ses} = GDCOM_request($tcpar_Request_record3,$tcpar_Res_Record3,'strict');
	}
	return 1;
}

sub TC_evaluation {
	foreach my $ses (@tcpar_Session)
	{
		S_teststep_expected("$ses - '$tcpar_Res_Record1' should be obtained followed ", "sendrequest_record1_$ses");			#evaluation 1
		S_teststep_detected("$ses - response is obsered $res1{$ses}", "sendrequest_record1_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_Record1,$res1{$ses});
		
		S_teststep_expected("$ses - '$tcpar_Res_Record2' should be obtained followed", "sendrequest_record2_$ses");			#evaluation 2
		S_teststep_detected("$ses - response is obsered $res2{$ses}", "sendrequest_record2_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_Record2,$res2{$ses});
		
		S_teststep_expected("$ses - '$tcpar_Res_Record3' should be obtained followed", "sendrequest_record3_$ses");			#evaluation 3
		S_teststep_detected("$ses - response is obsered $res3{$ses}",  "sendrequest_record3_$ses");
		EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_Record3,$res3{$ses});
	}
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
