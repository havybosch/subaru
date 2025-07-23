#### TEST CASE MODULE
package TC_DSM_Service1902_InternalFault;

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

TC_DSM_Service1902_InternalFault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Create <InternalFault> and <Fault>

3. Wait for <WaitTime>

4. Send <Req_ReadDTC> followed by <StatusMask>

5. Disqualify <InternalFault> and <Fault> then do IGN reset.

6. Wait for <WaitTime>

7. Send <Req_ReadDTC> followed by <StatusMask>


I<B<Evaluation>>

1.

2. <InternalFault> and <Fault>should be in <ActiveState>

3.

4. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Current> <DTC2_Current>

5. <InternalFault> and <Fault> should be in <InActiveState>

7. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Current> <DTC2_Past>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'WaitTime' => 
	SCALAR 'InternalFault' => 
	SCALAR 'Fault' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'StatusMask' => 
	SCALAR 'PR_ReadDTC' => 
	SCALAR 'ActiveState' => 
	SCALAR 'InActiveState' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'DTC1_Current' => 
	SCALAR 'DTC2_Current' => 
	SCALAR 'DTC2_Past' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of service 19 02 when an Internal Fault is present'
	
	# input parameters
	Session =@('default','extended')
	WaitTime = '3000' #ms
	InternalFault = '<Test Heading>'
	Fault = 'rb_coa_METRxMsgCounterError_flt'
	Req_ReadDTC = 'REQ_<Fetch {Service description}>' 
	StatusMask = 'FF'
	
	# output parameters
	PR_ReadDTC = 'PR_ReadDTCInformation_ReportDTCByStatusMask' 
	ActiveState = 'FilteredState' 
	InActiveState = 'StoredState'
	AvalibilityMask = '0A'
	DTC1_Current = '95 51 00 0A'
	DTC2_Current = 'C4 23 00 0A' 
	DTC2_Past = 'C4 23 00 08' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_WaitTime;
my $tcpar_InternalFault;
my $tcpar_Fault;
my $tcpar_Req_ReadDTC;
my $tcpar_StatusMask;
my $tcpar_PR_ReadDTC;
my $tcpar_ActiveState;
my $tcpar_InActiveState;
my $tcpar_AvalibilityMask;
my $tcpar_DTC1_Current;
my $tcpar_DTC2_Current;
my $tcpar_DTC2_Past;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_InternalFault =  GEN_Read_mandatory_testcase_parameter( 'InternalFault' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_StatusMask =  GEN_Read_mandatory_testcase_parameter( 'StatusMask' );
	$tcpar_PR_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_InActiveState =  GEN_Read_mandatory_testcase_parameter( 'InActiveState' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_DTC1_Current =  GEN_Read_mandatory_testcase_parameter( 'DTC1_Current' );
	$tcpar_DTC2_Current =  GEN_Read_mandatory_testcase_parameter( 'DTC2_Current' );
	$tcpar_DTC2_Past =  GEN_Read_mandatory_testcase_parameter( 'DTC2_Past' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');

	S_teststep("Create '$tcpar_InternalFault' and '$tcpar_Fault'", 'AUTO_NBR', 'create_internalfault_and');			#measurement 1

	S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask'", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 2

	S_teststep("Disqualify '$tcpar_InternalFault' and '$tcpar_Fault' then do IGN reset.", 'AUTO_NBR', 'disqualify_internalfault_and');			#measurement 3

	S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask'", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 4

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_InternalFault' and '$tcpar_Fault'should be in '$tcpar_ActiveState'", 'create_internalfault_and');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_internalfault_and');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Current' '$tcpar_DTC2_Current'", 'send_req_readdtc_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_A');

	S_teststep_expected("'$tcpar_InternalFault' and '$tcpar_Fault' should be in '$tcpar_InActiveState'", 'disqualify_internalfault_and');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'disqualify_internalfault_and');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Current' '$tcpar_DTC2_Past'", 'send_req_readdtc_B');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
