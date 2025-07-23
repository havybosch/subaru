#### TEST CASE MODULE
package TC_DSM_Service1902Check_TwoDTC;

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

TC_DSM_Service1902Check_TwoDTC

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Create <Number> of  <Fault>.

3. Wait for <WaitTime>

4. Send <Req_ReadDTC> followed by <Index>

5. Disqualify one  Fault of same DTC and do IGN reset.

6. Wait for <WaitTime>

7. Send <Req_ReadDTC> followed by <StatusMask1>


I<B<Evaluation>>

1.

2. <Fault>should be in <ActiveState>

3.

4. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Current>.

5. <Fault2> should be in <InActiveState>and <Fault1> should be in <ActiveState>

7. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Current> <DTC2_Past>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'WaitTime' => 
	LIST 'Fault' => 
	SCALAR 'Index' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'StatusMask' => 
	SCALAR 'PR_ReadDTC' => 
	SCALAR 'ActiveState' => 
	SCALAR 'InActiveState' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'DTC1_Current' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $19 $02 when 2 DTCs are present'
	
	# input parameters
	Session = '<Test Heading>'
	WaitTime = '3' #secs
	
	Fault = @('rb_coa_BIURxMsgChecksumError_flt','rb_coa_BIURxMsgCounterError_flt')
	
	Index = '<Test Heading>'
	
	Req_ReadDTC = 'REQ_<Fetch {Service description}>' 
	StatusMask = 'FF'
	
	# output parameters
	PR_ReadDTC = 'PR_ReadDTCInformation_ReportDTCByStatusMask' 
	ActiveState = 'FilteredState' 
	InActiveState = 'StoredState'
	AvalibilityMask = '0A'
	DTC1_Current = 'C4 22 00 0A'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_WaitTime;
my $tcpar_Fault;
my $tcpar_Index;
my $tcpar_Req_ReadDTC;
my $tcpar_StatusMask;
my $tcpar_PR_ReadDTC;
my $tcpar_ActiveState;
my $tcpar_InActiveState;
my $tcpar_AvalibilityMask;
my $tcpar_DTC1_Current;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Index =  GEN_Read_mandatory_testcase_parameter( 'Index' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_StatusMask =  GEN_Read_mandatory_testcase_parameter( 'StatusMask' );
	$tcpar_PR_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_InActiveState =  GEN_Read_mandatory_testcase_parameter( 'InActiveState' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_DTC1_Current =  GEN_Read_mandatory_testcase_parameter( 'DTC1_Current' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Number' of  '$tcpar_Fault'.", 'AUTO_NBR', 'create_number_of');			#measurement 1

	S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_Index'", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 2

	S_teststep("Disqualify one  Fault of same DTC and do IGN reset.", 'AUTO_NBR', 'disqualify_one__fault');			#measurement 3

	S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask1'", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 4

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault'should be in '$tcpar_ActiveState'", 'create_number_of');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_number_of');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Current'.", 'send_req_readdtc_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_A');

	S_teststep_expected("'$tcpar_Fault2' should be in '$tcpar_InActiveState'and '$tcpar_Fault1' should be in '$tcpar_ActiveState'", 'disqualify_one__fault');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'disqualify_one__fault');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Current' '$tcpar_DTC2_Past'", 'send_req_readdtc_B');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
