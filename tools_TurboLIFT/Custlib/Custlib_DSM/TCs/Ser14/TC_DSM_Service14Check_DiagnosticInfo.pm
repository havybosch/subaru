#### TEST CASE MODULE
package TC_DSM_Service14Check_DiagnosticInfo;

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

TC_DSM_Service14Check_DiagnosticInfo

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>.

2. Enter to <Session>

3. Create <Fault> 

4. Send <ReadNumberOfDTC> by <StatusMask>

5. Send <ReadDTC> by <StatusMask>

6. Send <ReadDTCSnapshotRecord> followed by <RecordNo>

7. Send <Req_ClearDTC>

8. Dequalify <Fault> 

9. Send <Req_ClearDTC>

10. Send <ReadNumberOfDTC> by <StatusMask>

11. Send <ReadDTC> by <StatusMask>

12. Send <ReadDTCSnapshotRecord> followed by <RecordNo>


I<B<Evaluation>>

1.

2. 

3. <Fault> should be in <Fault_ActiveState>.

4. <PR_ReadNumberOfDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount>.

5. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC_1> <DTC_2> <DTC_3>.

6.<PR_ReadDTCSnapshotRecord> should be obtained followed by <Record_1> <Reccord_2> <Record_3>.

7. <NRC_22> should be obtained.

8. <Fault> should be in <Fault_InActiveState>.

9. <PR_ClearDTC> should be obtained. 

10. <PR_ReadNumberOfDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier>.

11. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> .

12.<PR_ReadDTCSnapshotRecord> should be obtained followed by <RecordNo>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'Fault' => 
	SCALAR 'Req_ClearDTC' => 
	SCALAR 'ReadNumberOfDTC' => 
	SCALAR 'ReadDTC' => 
	SCALAR 'ReadDTCSnapshotRecord' => 
	SCALAR 'StatusMask' => 
	SCALAR 'RecordNo' => 
	SCALAR 'PR_ClearDTC' => 
	SCALAR 'Fault_ActiveState' => 
	SCALAR 'Fault_InActiveState' => 
	SCALAR 'NRC_22' => 
	SCALAR 'PR_ReadNumberOfDTC' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'FormatIdentifier' => 
	SCALAR 'DTCCount' => 
	SCALAR 'PR_ReadDTC' => 
	SCALAR 'DTC_1' => 
	SCALAR 'DTC_2' => 
	SCALAR 'DTC_3' => 
	SCALAR 'PR_ReadDTCSnapshotRecord' => 
	SCALAR 'Record_1' => 
	SCALAR 'Record_2' => 
	SCALAR 'Record_3' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To clear the faults by Clear DTC request and read the DTC information'
	# input parameters
	AddressingMode = '<Fetch {Addressing Mode}>'
	Protocol = '<Fetch {Protocol}>'
	Session = '<Fetch {Session} {(.* )}>' 
	Fault = '<Test Heading>'
	Req_ClearDTC = 'Req_<Fetch {Service description}>' 
	ReadNumberOfDTC = 'REQ_ReadDTCInformation_ReportNumberOfDTCByStatusMask '
	ReadDTC = 'REQ_ReadDTCInformation_ReportDTCByStatusMask' 
	ReadDTCSnapshotRecord = 'REQ_ReadDTCInformation_ReportDTCSnapshotRecordByRecordedNumber'
	StatusMask = '2E'
	RecordNo = 'FF'
	
	# output parameters
	PR_ClearDTC = 'PR_ClearDTCInformation_all'
	Fault_ActiveState = 'FilteredState'
	Fault_InActiveState = 'StoredState'
	NRC_22 = 'NR_conditionNotCorrect'
	PR_ReadNumberOfDTC= 'PR_REQ_ReadDTCInformation_ReportNumberOfDTCByStatusMask'
	AvalibilityMask = '0A'
	FormatIdentifier = '01'
	DTCCount = '3' #expressed in two bytes of data
	PR_ReadDTC= 'PR_ReadDTCInformation_ReportDTCByStatusMask'
	DTC_1 = '96 A8 00 0A'
	DTC_2 = '96 8A 00 0A'
	DTC_3 = '96 B7 00 0A'
	PR_ReadDTCSnapshotRecord = 'PR_ReadDTCInformation_ReportDTCSnapshotRecordByRecordedNumber'
	Record_1= '01 96 A8 00 0A 01 10 1E XX XX 00 XX XX XX' 
	Record_2= '02 96 8A 00 0A 01 10 1E XX XX 00 XX XX XX' 
	Record_3= '03 96 B7 00 0A 01 10 1E XX XX 00 XX XX XX' 
	#also consider Functional

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_Fault;
my $tcpar_Req_ClearDTC;
my $tcpar_ReadNumberOfDTC;
my $tcpar_ReadDTC;
my $tcpar_ReadDTCSnapshotRecord;
my $tcpar_StatusMask;
my $tcpar_RecordNo;
my $tcpar_PR_ClearDTC;
my $tcpar_Fault_ActiveState;
my $tcpar_Fault_InActiveState;
my $tcpar_NRC_22;
my $tcpar_PR_ReadNumberOfDTC;
my $tcpar_AvalibilityMask;
my $tcpar_FormatIdentifier;
my $tcpar_DTCCount;
my $tcpar_PR_ReadDTC;
my $tcpar_DTC_1;
my $tcpar_DTC_2;
my $tcpar_DTC_3;
my $tcpar_PR_ReadDTCSnapshotRecord;
my $tcpar_Record_1;
my $tcpar_Record_2;
my $tcpar_Record_3;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Req_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ClearDTC' );
	$tcpar_ReadNumberOfDTC =  GEN_Read_mandatory_testcase_parameter( 'ReadNumberOfDTC' );
	$tcpar_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'ReadDTC' );
	$tcpar_ReadDTCSnapshotRecord =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCSnapshotRecord' );
	$tcpar_StatusMask =  GEN_Read_mandatory_testcase_parameter( 'StatusMask' );
	$tcpar_RecordNo =  GEN_Read_mandatory_testcase_parameter( 'RecordNo' );
	$tcpar_PR_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ClearDTC' );
	$tcpar_Fault_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'Fault_ActiveState' );
	$tcpar_Fault_InActiveState =  GEN_Read_mandatory_testcase_parameter( 'Fault_InActiveState' );
	$tcpar_NRC_22 =  GEN_Read_mandatory_testcase_parameter( 'NRC_22' );
	$tcpar_PR_ReadNumberOfDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadNumberOfDTC' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_FormatIdentifier =  GEN_Read_mandatory_testcase_parameter( 'FormatIdentifier' );
	$tcpar_DTCCount =  GEN_Read_mandatory_testcase_parameter( 'DTCCount' );
	$tcpar_PR_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC' );
	$tcpar_DTC_1 =  GEN_Read_mandatory_testcase_parameter( 'DTC_1' );
	$tcpar_DTC_2 =  GEN_Read_mandatory_testcase_parameter( 'DTC_2' );
	$tcpar_DTC_3 =  GEN_Read_mandatory_testcase_parameter( 'DTC_3' );
	$tcpar_PR_ReadDTCSnapshotRecord =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTCSnapshotRecord' );
	$tcpar_Record_1 =  GEN_Read_mandatory_testcase_parameter( 'Record_1' );
	$tcpar_Record_2 =  GEN_Read_mandatory_testcase_parameter( 'Record_2' );
	$tcpar_Record_3 =  GEN_Read_mandatory_testcase_parameter( 'Record_3' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' for '$tcpar_Protocol'.", 'AUTO_NBR');

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Fault' ", 'AUTO_NBR', 'create_fault');			#measurement 1

	S_teststep("Send '$tcpar_ReadNumberOfDTC' by '$tcpar_StatusMask'", 'AUTO_NBR', 'send_readnumberofdtc_by_A');			#measurement 2

	S_teststep("Send '$tcpar_ReadDTC' by '$tcpar_StatusMask'", 'AUTO_NBR', 'send_readdtc_by_A');			#measurement 3

	S_teststep("Send '$tcpar_ReadDTCSnapshotRecord' followed by '$tcpar_RecordNo'", 'AUTO_NBR', 'send_readdtcsnapshotrecord_followed_A');			#measurement 4

	S_teststep("Send '$tcpar_Req_ClearDTC'", 'AUTO_NBR', 'send_req_cleardtc_A');			#measurement 5

	S_teststep("Dequalify '$tcpar_Fault' ", 'AUTO_NBR', 'dequalify_fault');			#measurement 6

	S_teststep("Send '$tcpar_Req_ClearDTC'", 'AUTO_NBR', 'send_req_cleardtc_B');			#measurement 7

	S_teststep("Send '$tcpar_ReadNumberOfDTC' by '$tcpar_StatusMask'", 'AUTO_NBR', 'send_readnumberofdtc_by_B');			#measurement 8

	S_teststep("Send '$tcpar_ReadDTC' by '$tcpar_StatusMask'", 'AUTO_NBR', 'send_readdtc_by_B');			#measurement 9

	S_teststep("Send '$tcpar_ReadDTCSnapshotRecord' followed by '$tcpar_RecordNo'", 'AUTO_NBR', 'send_readdtcsnapshotrecord_followed_B');			#measurement 10

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault' should be in '$tcpar_Fault_ActiveState'.", 'create_fault');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_fault');

	S_teststep_expected("'$tcpar_PR_ReadNumberOfDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount'.", 'send_readnumberofdtc_by_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_readnumberofdtc_by_A');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC_1' '$tcpar_DTC_2' '$tcpar_DTC_3'.", 'send_readdtc_by_A');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_readdtc_by_A');

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be obtained followed by '$tcpar_Record_1' '$tcpar_Reccord_2' '$tcpar_Record_3'.", 'send_readdtcsnapshotrecord_followed_A');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_readdtcsnapshotrecord_followed_A');

	S_teststep_expected("'$tcpar_NRC_22' should be obtained.", 'send_req_cleardtc_A');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'send_req_cleardtc_A');

	S_teststep_expected("'$tcpar_Fault' should be in '$tcpar_Fault_InActiveState'.", 'dequalify_fault');			#evaluation 6
	S_teststep_detected("<<add detected result here>>", 'dequalify_fault');

	S_teststep_expected("'$tcpar_PR_ClearDTC' should be obtained. ", 'send_req_cleardtc_B');			#evaluation 7
	S_teststep_detected("<<add detected result here>>", 'send_req_cleardtc_B');

	S_teststep_expected("'$tcpar_PR_ReadNumberOfDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier'.", 'send_readnumberofdtc_by_B');			#evaluation 8
	S_teststep_detected("<<add detected result here>>", 'send_readnumberofdtc_by_B');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' .", 'send_readdtc_by_B');			#evaluation 9
	S_teststep_detected("<<add detected result here>>", 'send_readdtc_by_B');

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be obtained followed by '$tcpar_RecordNo'", 'send_readdtcsnapshotrecord_followed_B');			#evaluation 10
	S_teststep_detected("<<add detected result here>>", 'send_readdtcsnapshotrecord_followed_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
