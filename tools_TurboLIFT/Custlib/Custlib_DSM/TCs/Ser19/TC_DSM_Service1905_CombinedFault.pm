#### TEST CASE MODULE
package TC_DSM_Service1905_CombinedFault;

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

TC_DSM_Service1905_CombinedFault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Continue from above TS_DSM_462

Set the following values for BIU660 msg:

Trip Counter = 05    

Time Counter = 04


I<B<Stimulation and Measurement>>

1. Disqualify  <Fault1> 

2. Send <Req_ReadDTCSnapshotRecord> followed by <RecordNo_1>

3. Send <Req_ReadDTCSnapshotRecord> followed by <RecordNo_2>

4. Disqualify all remaining faults and do IGN Reset.

5. Send <Req_ReadDTCSnapshotRecord> followed by <RecordNo_2>


I<B<Evaluation>>

1. <Fault1> should be in <InActiveState>

2. <PR_ReadDTCSnapshotRecord> should be obtained followed by <DTCRecord_1Past>

3. <PR_ReadDTCSnapshotRecord> should be obtained followed by <DTCRecord_1Past> <DTCRecord_2Current> <DTCRecord_3Current>.

4.

5. <PR_ReadDTCSnapshotRecord> should be obtained followed by <DTCRecord_1Past> <DTCRecord_2Past> <DTCRecord_3Past>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'RecordNo_1' => 
	SCALAR 'RecordNo_2' => 
	SCALAR 'Fault1' => 
	SCALAR 'PR_ReadDTCSnapshotRecord' => 
	SCALAR 'InActiveState' => 
	SCALAR 'DTCRecord_1Past' => 
	SCALAR 'DTCRecord_2Current' => 
	SCALAR 'DTCRecord_3Current' => 
	SCALAR 'DTCRecord_2Past' => 
	SCALAR 'DTCRecord_3Past' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $19 $05 when filtered and latched state faults are present'
	
	# input parameters
	Req_ReadDTC = 'REQ_<Fetch {Service description}>'  
	RecordNo_1 = '01'
	RecordNo_2 = 'FF'
	Fault1 = '<Test Heading>'
	
	# output parameters
	PR_ReadDTCSnapshotRecord = 'PR_ReadDTCInformation_ReportDTCSnapshotRecordByRecordedNumber' 
	InActiveState = 'LatchedState'
	DTCRecord_1Past = '01 98 01 00 08 01 10 1E  00 05 XX XX XX'  #time counter varies from 4 to 8
	DTCRecord_2Current = '02 C4 01 00 0A 01 10 1E 00 05 00 XX XX XX' 
	DTCRecord_3Current = '03 96 37 00 0A 01 10 1E 00 05 00 XX XX XX' 
	DTCRecord_2Past = '02 C4 01 00 08 01 10 1E 00 05 00 XX XX XX' 
	DTCRecord_3Past = '03 96 37 00 08 01 10 1E 00 05 00 XX XX XX' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Req_ReadDTC;
my $tcpar_RecordNo_1;
my $tcpar_RecordNo_2;
my $tcpar_Fault1;
my $tcpar_PR_ReadDTCSnapshotRecord;
my $tcpar_InActiveState;
my $tcpar_DTCRecord_1Past;
my $tcpar_DTCRecord_2Current;
my $tcpar_DTCRecord_3Current;
my $tcpar_DTCRecord_2Past;
my $tcpar_DTCRecord_3Past;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_RecordNo_1 =  GEN_Read_mandatory_testcase_parameter( 'RecordNo_1' );
	$tcpar_RecordNo_2 =  GEN_Read_mandatory_testcase_parameter( 'RecordNo_2' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_PR_ReadDTCSnapshotRecord =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTCSnapshotRecord' );
	$tcpar_InActiveState =  GEN_Read_mandatory_testcase_parameter( 'InActiveState' );
	$tcpar_DTCRecord_1Past =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_1Past' );
	$tcpar_DTCRecord_2Current =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_2Current' );
	$tcpar_DTCRecord_3Current =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_3Current' );
	$tcpar_DTCRecord_2Past =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_2Past' );
	$tcpar_DTCRecord_3Past =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_3Past' );

	return 1;
}

sub TC_initialization {

	S_teststep("Continue from above TS_DSM_462", 'AUTO_NBR');

	S_teststep("Set the following values for BIU660 msg:", 'AUTO_NBR');

	S_teststep("Trip Counter = 05    ", 'AUTO_NBR');

	S_teststep("Time Counter = 04", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Disqualify  '$tcpar_Fault1' ", 'AUTO_NBR', 'disqualify__fault1');			#measurement 1

	S_teststep("Send '$tcpar_Req_ReadDTCSnapshotRecord' followed by '$tcpar_RecordNo_1'", 'AUTO_NBR', 'send_req_readdtcsnapshotrecord_A');			#measurement 2

	S_teststep("Send '$tcpar_Req_ReadDTCSnapshotRecord' followed by '$tcpar_RecordNo_2'", 'AUTO_NBR', 'send_req_readdtcsnapshotrecord_B');			#measurement 3

	S_teststep("Disqualify all remaining faults and do IGN Reset.", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTCSnapshotRecord' followed by '$tcpar_RecordNo_2'", 'AUTO_NBR', 'send_req_readdtcsnapshotrecord_C');			#measurement 4

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault1' should be in '$tcpar_InActiveState'", 'disqualify__fault1');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'disqualify__fault1');

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be obtained followed by '$tcpar_DTCRecord_1Past'", 'send_req_readdtcsnapshotrecord_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtcsnapshotrecord_A');

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be obtained followed by '$tcpar_DTCRecord_1Past' '$tcpar_DTCRecord_2Current' '$tcpar_DTCRecord_3Current'.", 'send_req_readdtcsnapshotrecord_B');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtcsnapshotrecord_B');

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be obtained followed by '$tcpar_DTCRecord_1Past' '$tcpar_DTCRecord_2Past' '$tcpar_DTCRecord_3Past'.", 'send_req_readdtcsnapshotrecord_C');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtcsnapshotrecord_C');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
