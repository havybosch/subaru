#### TEST CASE MODULE
package TC_DSM_Service1905_MultipleFault_SameDTC;

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

our $PURPOSE = "To check response of service 19 05 when multiple fault with same DTC is in Qualified state";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service1905_MultipleFault_SameDTC

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Set the following values for BIU660 msg:

Trip Counter = 07    

Time Counter = 06


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Create  <Fault1>,<Fault2> 

3. Send <Req_ReadDTCSnapshotRecord> followed by <RecordNo_1>

4. Disqualify both the faults, do IGN Reset.

5. Wait for <WaitTime>

6. Send <Req_ReadDTCSnapshotRecord> followed by <RecordNo_1>


I<B<Evaluation>>

1.

2. <Fault1>,<Fault2> should be in <ActiveState>

3. <PR_ReadDTCSnapshotRecord> should be obtained followed by <DTCRecord_1Current>

6. <PR_ReadDTCSnapshotRecord> should be obtained followed by <DTCRecord_1Past>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'Session' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'RecordNo_1' => 
	SCALAR 'WaitTime' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'PR_ReadDTCSnapshotRecord' => 
	SCALAR 'ActiveState' => 
	SCALAR 'DTCRecord_1Current' => 
	SCALAR 'DTCRecord_1Past' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $19 $05 when Multiple fault with same DTC are present '
	
	# input parameters
	Session = @('default','extended')
	Req_ReadDTC = 'REQ_<Fetch {Service description}>'  
	RecordNo_1 = 'FF'
	WaitTime = '3000' #msecs
	Fault1 = 'rb_coa_TCURxMsgChecksumError_flt'
	Fault2 = 'rb_coa_TCURxMsgCounterError_flt'
	
	# output parameters
	PR_ReadDTCSnapshotRecord = 'PR_ReadDTCInformation_ReportDTCSnapshotRecordByRecordedNumber' 
	ActiveState = 'FilteredState'
	DTCRecord_1Current = '01 C4 02 00 0A 01 10 1E  00 07 XX XX XX XX 02 C4 02 00 0A 01 10 1E  00 07 XX XX XX XX'  #time counter varies from 6 to A
	DTCRecord_1Past = '01 C4 02 00 08 01 10 1E  00 07 XX XX XX XX 02 C4 02 00 08 01 10 1E  00 07 XX XX XX XX'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Req_ReadDTC;
my $tcpar_RecordNo_1;
my $tcpar_WaitTime;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_PR_ReadDTCSnapshotRecord;
my $tcpar_ActiveState;
my $tcpar_DTCRecord_1Current;
my $tcpar_DTCRecord_1Past;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_RecordNo_1 =  GEN_Read_mandatory_testcase_parameter( 'RecordNo_1' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_PR_ReadDTCSnapshotRecord =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTCSnapshotRecord' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_DTCRecord_1Current =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_1Current' );
	$tcpar_DTCRecord_1Past =  GEN_Read_mandatory_testcase_parameter( 'DTCRecord_1Past' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("Set the following values for BIU660 msg:", 'AUTO_NBR');

	S_teststep("Trip Counter = 07    ", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TRIP', 7);
	
	S_teststep("Time Counter = 06", 'AUTO_NBR');
	CA_set_EnvVar_value('_Env__BIU660_COUNT_TIME',6);
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');

	S_teststep("Create  '$tcpar_Fault1','$tcpar_Fault2' ", 'AUTO_NBR', 'create__fault1fault2');			#measurement 1

	S_teststep("Send '$tcpar_Req_ReadDTCSnapshotRecord' followed by '$tcpar_RecordNo_1'", 'AUTO_NBR', 'send_req_readdtcsnapshotrecord_A');			#measurement 2

	S_teststep("Disqualify both the faults, do IGN Reset.", 'AUTO_NBR');

	S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTCSnapshotRecord' followed by '$tcpar_RecordNo_1'", 'AUTO_NBR', 'send_req_readdtcsnapshotrecord_B');			#measurement 3

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault1','$tcpar_Fault2' should be in '$tcpar_ActiveState'", 'create__fault1fault2');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create__fault1fault2');

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be obtained followed by '$tcpar_DTCRecord_1Current'", 'send_req_readdtcsnapshotrecord_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtcsnapshotrecord_A');

	S_teststep_expected("'$tcpar_PR_ReadDTCSnapshotRecord' should be obtained followed by '$tcpar_DTCRecord_1Past'", 'send_req_readdtcsnapshotrecord_B');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtcsnapshotrecord_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
