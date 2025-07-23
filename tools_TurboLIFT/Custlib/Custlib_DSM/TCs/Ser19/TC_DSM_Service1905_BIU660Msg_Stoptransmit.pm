#### TEST CASE MODULE
package TC_DSM_Service1905_BIU660Msg_Stoptransmit;

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

TC_DSM_Service1905_BIU660Msg_Stoptransmit

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Switch On ECU.

2. Stop <MSG> message from transmission.

3. Created <Fault>

4. Create IGN Reset twice times.

5. Enter <Session>

6. Send <Req_ReadDTCSnapshotRecord> followed by <RecordNo_1>


I<B<Evaluation>>

1.

2.

3. <Fault> should be in <ActiveState>

4.

5.

6. <PR_ReadDTCSnapshotRecord> should be obtained followed by <DTCRecord_1Current>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'MSG' => 
	SCALAR 'RecordNo_1' => 
	SCALAR 'Fault' => 
	LIST 'Session' => 
	SCALAR 'PR_ReadDTCSnapshotRecord' => 
	SCALAR 'ActiveState' => 
	SCALAR 'DTCRecord_1Current' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $19 $05 when BIU660 msg transmission is stopped'
	
	# input parameters
	Req_ReadDTC = 'REQ_<Fetch {Service description}>'  
	MSG = 'BIU660'
	RecordNo_1 = 'FF'
	Fault = 'rb_coa_VDCRxMsgTimeout_flt'
	Session =@('default','extended')
	# output parameters
	PR_ReadDTCSnapshotRecord = 'PR_ReadDTCInformation_ReportDTCSnapshotRecordByRecordedNumber' 
	ActiveState = 'FilteredState'
	DTCRecord_1Current = '01 C1 22 00 0A 01 10 1E  00 02 00 XX XX XX'  

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Req_ReadDTC;
my $tcpar_MSG;
my $tcpar_RecordNo_1;
my $tcpar_Fault;
my $tcpar_Session;
my $tcpar_PR_ReadDTCSnapshotRecord;
my $tcpar_ActiveState;
my $tcpar_DTCRecord_1Current;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_MSG =  GEN_Read_mandatory_testcase_parameter( 'MSG' );
	$tcpar_RecordNo_1 =  GEN_Read_mandatory_testcase_parameter( 'RecordNo_1' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_PR_ReadDTCSnapshotRecord =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTCSnapshotRecord' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_DTCRecord_1Current =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_1Current' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch On ECU.", 'AUTO_NBR');

	S_teststep("Stop '$tcpar_MSG' message from transmission.", 'AUTO_NBR');

	S_teststep("Created '$tcpar_Fault'", 'AUTO_NBR', 'created_fault');			#measurement 1

	S_teststep("Create IGN Reset twice times.", 'AUTO_NBR');

	S_teststep("Enter '$tcpar_Session'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTCSnapshotRecord' followed by '$tcpar_RecordNo_1'", 'AUTO_NBR', 'send_req_readdtcsnapshotrecord');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault' should be in '$tcpar_ActiveState'", 'created_fault');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'created_fault');

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be obtained followed by '$tcpar_DTCRecord_1Current'", 'send_req_readdtcsnapshotrecord');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtcsnapshotrecord');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
