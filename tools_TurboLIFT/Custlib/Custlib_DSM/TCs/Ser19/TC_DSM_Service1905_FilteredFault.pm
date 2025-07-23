#### TEST CASE MODULE
package TC_DSM_Service1905_FilteredFault;

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

TC_DSM_Service1905_FilteredFault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.StandardPrepNoFault

2. Set the following values for BIU660 msg:

BIU660_3_0_COUNT_TRIP = 05    

BIU660_7_0_COUNT_TIME = 04


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Create <Fault1>, <Fault2>,<Fault3>

3. Send <Req_ReadDTCSnapshotRecord> followed by <RecordNo_1>

4. Send <Req_ReadDTCSnapshotRecord> followed by <RecordNo_2>


I<B<Evaluation>>

1. 

2. All Fault should be in <ActiveState>

3. <PR_ReadDTCSnapshotRecord> should be obtained followed by <DTCRecord_2>

4. <PR_ReadDTCSnapshotRecord> should be obtained followed by <DTCRecord_1> <DTCReccord_2> <DTCRecord_3>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'RecordNo_1' => 
	SCALAR 'RecordNo_2' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Fault3' => 
	SCALAR 'PR_ReadDTCSnapshotRecord' => 
	SCALAR 'ActiveState' => 
	SCALAR 'DTCRecord_1' => 
	SCALAR 'DTCRecord_2' => 
	SCALAR 'DTCRecord_3' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $19 $05 when faults are in filtered state'
	
	# input parameters
	Session = @('default','extended')
	Req_ReadDTC = 'REQ_<Fetch {Service description}>' 
	RecordNo_1 = '02'
	RecordNo_2 = 'FF'
	Fault1 = 'rb_sqm_SquibResistanceOpenAB1FD_flt'
	Fault2 = 'rb_coa_EGIRxMsgCounterError_flt'
	Fault3 = 'rb_psem_OpenLinePASML_flt'
	
	# output parameters
	PR_ReadDTCSnapshotRecord = 'PR_ReadDTCInformation_ReportDTCSnapshotRecordByRecordedNumber' 
	ActiveState = 'FilteredState'
	DTCRecord_1 = '01 98 01 00 0A 01 10 1E  00 05 00 XX XX XX'  #time counter varies from 4 to 8
	DTCRecord_2 = '02 C4 01 00 0A 01 10 1E 00 05 00 XX XX XX' 
	DTCRecord_3 = '03 96 37 00 0A 01 10 1E 00 05 00 XX XX XX' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Req_ReadDTC;
my $tcpar_RecordNo_1;
my $tcpar_RecordNo_2;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Fault3;
my $tcpar_PR_ReadDTCSnapshotRecord;
my $tcpar_ActiveState;
my $tcpar_DTCRecord_1;
my $tcpar_DTCRecord_2;
my $tcpar_DTCRecord_3;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_RecordNo_1 =  GEN_Read_mandatory_testcase_parameter( 'RecordNo_1' );
	$tcpar_RecordNo_2 =  GEN_Read_mandatory_testcase_parameter( 'RecordNo_2' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Fault3 =  GEN_Read_mandatory_testcase_parameter( 'Fault3' );
	$tcpar_PR_ReadDTCSnapshotRecord =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTCSnapshotRecord' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_DTCRecord_1 =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_1' );
	$tcpar_DTCRecord_2 =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_2' );
	$tcpar_DTCRecord_3 =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_3' );

	return 1;
}

sub TC_initialization {

	S_teststep("1.StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("2. Set the following values for BIU660 msg:", 'AUTO_NBR');

	S_teststep("BIU660_3_0_COUNT_TRIP = 05    ", 'AUTO_NBR');

	S_teststep("BIU660_7_0_COUNT_TIME = 04", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Fault1', '$tcpar_Fault2','$tcpar_Fault3'", 'AUTO_NBR', 'create_fault1_fault2fault3');			#measurement 1

	S_teststep("Send '$tcpar_Req_ReadDTCSnapshotRecord' followed by '$tcpar_RecordNo_1'", 'AUTO_NBR', 'send_req_readdtcsnapshotrecord_A');			#measurement 2

	S_teststep("Send '$tcpar_Req_ReadDTCSnapshotRecord' followed by '$tcpar_RecordNo_2'", 'AUTO_NBR', 'send_req_readdtcsnapshotrecord_B');			#measurement 3

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("All Fault should be in '$tcpar_ActiveState'", 'create_fault1_fault2fault3');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_fault1_fault2fault3');

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be obtained followed by '$tcpar_DTCRecord_2'", 'send_req_readdtcsnapshotrecord_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtcsnapshotrecord_A');

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be obtained followed by '$tcpar_DTCRecord_1' '$tcpar_DTCReccord_2' '$tcpar_DTCRecord_3'.", 'send_req_readdtcsnapshotrecord_B');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtcsnapshotrecord_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
