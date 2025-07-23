#### TEST CASE MODULE
package TC_DSM_Service1902_CombinedFaults;

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

##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service1902_CombinedFaults

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Continue from above TS_DSM_417


I<B<Stimulation and Measurement>>

1. Disqualify <Fault1> and do IGN Reset

2. Wait for <WaitTime>

3. Send <Req_ReadDTC> followed by <StatusMask1>

4. Send <Req_ReadDTC> followed by <StatusMask2>

5. Send <Req_ReadDTC> followed by <StatusMask3>

6. Send <Req_ReadDTC> followed by <StatusMask4>

7. Disqualify all faults and do IGN Reset

8. Send <Req_ReadDTC> followed by <StatusMask2>


I<B<Evaluation>>

1. <Fault1> should be in <InactiveState>

2. 

3. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Past> <DTC2_Current> <DTC3_Current> <DTC4_Current>.

4. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Past> <DTC2_Current> <DTC3_Current> <DTC4_Current>.

5. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Past> <DTC2_Current> <DTC3_Current> <DTC4_Current>.

6. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Past> <DTC2_Current> <DTC3_Current> <DTC4_Current>.

7. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Past> <DTC2_Current> <DTC3_Current> <DTC4_Current>.

8. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Past> <DTC2_Past> <DTC3_Past> <DTC4_Past>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'StatusMask1' => 
	SCALAR 'StatusMask2' => 
	SCALAR 'StatusMask3' => 
	SCALAR 'StatusMask4' => 
	SCALAR 'Fault1' => 
	SCALAR 'InactiveState' => 
	SCALAR 'PR_ReadDTC' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'DTC1_Past' => 
	SCALAR 'DTC2_Current' => 
	SCALAR 'DTC3_Current' => 
	SCALAR 'DTC4_Current' => 
	SCALAR 'DTC2_Past' => 
	SCALAR 'DTC3_Past' => 
	SCALAR 'DTC4_Past' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of service 1902 when Filtered and Stored state faults are present'
	
	# input parameters
	Session =@('default','extended')
	Req_ReadDTC = 'REQ_<Fetch {Service description}>' 
	StatusMask1 = '04'
	StatusMask2 = '06'
	StatusMask3 = '28'
	StatusMask4 = 'FF'
	Fault1 = 'rb_coa_BIURxMsgCounterError_flt'
	
	# output parameters
	InactiveState = 'StoredState'
	PR_ReadDTC = 'PR_ReadDTCInformation_ReportDTCByStatusMask' 
	AvalibilityMask = '0A'
	DTC1_Past = 'C4 22 00 08'
	DTC2_Current = '96 27 00 0A'
	DTC3_Current = '96 22 00 0A'
	DTC4_Current = '98 11 00 0A'
	DTC2_Past =  '96 27 00 08'
	DTC3_Past  = '96 22 00 08'
	DTC4_Past  = '98 11 00 08'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Req_ReadDTC;
my $tcpar_StatusMask1;
my $tcpar_StatusMask2;
my $tcpar_StatusMask3;
my $tcpar_StatusMask4;
my $tcpar_Fault1;
my $tcpar_InactiveState;
my $tcpar_PR_ReadDTC;
my $tcpar_AvalibilityMask;
my $tcpar_DTC1_Past;
my $tcpar_DTC2_Current;
my $tcpar_DTC3_Current;
my $tcpar_DTC4_Current;
my $tcpar_DTC2_Past;
my $tcpar_DTC3_Past;
my $tcpar_DTC4_Past;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_StatusMask1 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask1' );
	$tcpar_StatusMask2 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask2' );
	$tcpar_StatusMask3 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask3' );
	$tcpar_StatusMask4 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask4' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_InactiveState =  GEN_Read_mandatory_testcase_parameter( 'InactiveState' );
	$tcpar_PR_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_DTC1_Past =  GEN_Read_mandatory_testcase_parameter( 'DTC1_Past' );
	$tcpar_DTC2_Current =  GEN_Read_mandatory_testcase_parameter( 'DTC2_Current' );
	$tcpar_DTC3_Current =  GEN_Read_mandatory_testcase_parameter( 'DTC3_Current' );
	$tcpar_DTC4_Current =  GEN_Read_mandatory_testcase_parameter( 'DTC4_Current' );
	$tcpar_DTC2_Past =  GEN_Read_mandatory_testcase_parameter( 'DTC2_Past' );
	$tcpar_DTC3_Past =  GEN_Read_mandatory_testcase_parameter( 'DTC3_Past' );
	$tcpar_DTC4_Past =  GEN_Read_mandatory_testcase_parameter( 'DTC4_Past' );

	return 1;
}

sub TC_initialization {

	S_teststep("Continue from above TS_DSM_417", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Disqualify '$tcpar_Fault1' and do IGN Reset", 'AUTO_NBR', 'disqualify_fault1_and');			#measurement 1

	S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask1'", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 2

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask2'", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 3

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask3'", 'AUTO_NBR', 'send_req_readdtc_C');			#measurement 4

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask4'", 'AUTO_NBR', 'send_req_readdtc_D');			#measurement 5

	S_teststep("Disqualify all faults and do IGN Reset", 'AUTO_NBR', 'disqualify_all_faults');			#measurement 6

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask2'", 'AUTO_NBR', 'send_req_readdtc_E');			#measurement 7

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault1' should be in '$tcpar_InactiveState'", 'disqualify_fault1_and');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'disqualify_fault1_and');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Past' '$tcpar_DTC2_Current' '$tcpar_DTC3_Current' '$tcpar_DTC4_Current'.", 'send_req_readdtc_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_A');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Past' '$tcpar_DTC2_Current' '$tcpar_DTC3_Current' '$tcpar_DTC4_Current'.", 'send_req_readdtc_B');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_B');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Past' '$tcpar_DTC2_Current' '$tcpar_DTC3_Current' '$tcpar_DTC4_Current'.", 'send_req_readdtc_C');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_C');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Past' '$tcpar_DTC2_Current' '$tcpar_DTC3_Current' '$tcpar_DTC4_Current'.", 'send_req_readdtc_D');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_D');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Past' '$tcpar_DTC2_Current' '$tcpar_DTC3_Current' '$tcpar_DTC4_Current'.", 'disqualify_all_faults');			#evaluation 6
	S_teststep_detected("<<add detected result here>>", 'disqualify_all_faults');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Past' '$tcpar_DTC2_Past' '$tcpar_DTC3_Past' '$tcpar_DTC4_Past'.", 'send_req_readdtc_E');			#evaluation 7
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_E');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
