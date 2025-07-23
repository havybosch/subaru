#### TEST CASE MODULE
package TC_DSM_Service1905_and_1915_Impact;

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

TC_DSM_Service1905_and_1915_Impact

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

#ReportDTCSnapshotRecordByRecordNumber

#ReportDTCWithPermanentStatus


I<B<Stimulation and Measurement>>

1. Turn On ECU and wait to steady state.

2. Create <Fault_Squib> and wait <time_ms> for faults qualified.

3. Remove fault condtion and wait <time_ms> for faults de-qualified.

4. Reset ECU and wait to steady state

5. Enter to <Session>.

6. Create <Condition>

7. Send <REQ_ClearDiagnosticInformation>

8. Send <REQ_ReportDTCSnapshotRecord1>

9. Send <REQ_ReportDTCSnapshotRecord2>


I<B<Evaluation>>

1.

2. All fault are qualified

3. All fault are de-qualified

4. 

5.

6. <PR_ReportDTC> is obtained

7. <PR_ClearDiagnosticInformation> is obtained

8. <PR_ReportDTCSnapshotRecord1> is obtained

9. Send <PR_ReportDTCSnapshotRecord2> is obtained


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'PR_ReportDTC' => 
	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'Condition' => 
	LIST 'Fault_Squib' => 
	SCALAR 'time_ms' => 
	SCALAR 'REQ_ClearDiagnosticInformation' => 
	SCALAR 'REQ_ReportDTCSnapshotRecord1' => 
	SCALAR 'REQ_ReportDTCSnapshotRecord2' => 
	SCALAR 'PR_ClearDiagnosticInformation' => 
	SCALAR 'PR_ReportDTCSnapshotRecord1' => 
	SCALAR 'PR_ReportDTCSnapshotRecord2' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check the impact of 1905 and 1915'
	
	# input parameters
	Session = 'DefaultSession'
	Condition = '<Test Heading>'
	Fault_Squib = @('rb_sqm_SquibResistanceOpenAB1FD_flt','rb_sqm_SquibResistanceOpenAB1FP_flt')
	time_ms = '3000' #ms
	
	REQ_ClearDiagnosticInformation = '14 FF FF FF'
	REQ_ReportDTCSnapshotRecord1 = '19 05 01'
	REQ_ReportDTCSnapshotRecord2 = '19 05 02'
	
	PR_ClearDiagnosticInformation = '54'
	PR_ReportDTCSnapshotRecord1 = '59 05 01'
	PR_ReportDTCSnapshotRecord2 = '59 05 02'
	PR_ReportDTC = '59 15 0A 98 01 00 08 98 06 00 08'
	#condition ReportDTCWithPermanentStatus = have fault in past memory: first send '14 FF FF FF', second send '19 15', expect positive respond for service 14

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Condition;
my $tcpar_Fault_Squib;
my $tcpar_time_ms;
my $tcpar_REQ_ClearDiagnosticInformation;
my $tcpar_REQ_ReportDTCSnapshotRecord1;
my $tcpar_REQ_ReportDTCSnapshotRecord2;
my $tcpar_PR_ClearDiagnosticInformation;
my $tcpar_PR_ReportDTCSnapshotRecord1;
my $tcpar_PR_ReportDTCSnapshotRecord2;
my $tcpar_PR_ReportDTC;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_Fault_Squib =  GEN_Read_mandatory_testcase_parameter( 'Fault_Squib' );
	$tcpar_time_ms =  GEN_Read_mandatory_testcase_parameter( 'time_ms' );
	$tcpar_REQ_ClearDiagnosticInformation =  GEN_Read_mandatory_testcase_parameter( 'REQ_ClearDiagnosticInformation' );
	$tcpar_REQ_ReportDTCSnapshotRecord1 =  GEN_Read_mandatory_testcase_parameter( 'REQ_ReportDTCSnapshotRecord1' );
	$tcpar_REQ_ReportDTCSnapshotRecord2 =  GEN_Read_mandatory_testcase_parameter( 'REQ_ReportDTCSnapshotRecord2' );
	$tcpar_PR_ClearDiagnosticInformation =  GEN_Read_mandatory_testcase_parameter( 'PR_ClearDiagnosticInformation' );
	$tcpar_PR_ReportDTCSnapshotRecord1 =  GEN_Read_mandatory_testcase_parameter( 'PR_ReportDTCSnapshotRecord1' );
	$tcpar_PR_ReportDTCSnapshotRecord2 =  GEN_Read_mandatory_testcase_parameter( 'PR_ReportDTCSnapshotRecord2' );
	$tcpar_PR_ReportDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReportDTC' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("#ReportDTCSnapshotRecordByRecordNumber", 'AUTO_NBR');

	S_teststep("#ReportDTCWithPermanentStatus", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Turn On ECU and wait to steady state.", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Fault_Squib' and wait '$tcpar_time_ms' for faults qualified.", 'AUTO_NBR', 'create_fault_squib');			#measurement 1

	S_teststep("Remove fault condtion and wait '$tcpar_time_ms' for faults de-qualified.", 'AUTO_NBR', 'remove_fault_condtion');			#measurement 2

	S_teststep("Reset ECU and wait to steady state", 'AUTO_NBR');

	S_teststep("Enter to '$tcpar_Session'.", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Condition'", 'AUTO_NBR', 'create_condition');			#measurement 3

	S_teststep("Send '$tcpar_REQ_ClearDiagnosticInformation'", 'AUTO_NBR', 'send_req_cleardiagnosticinformation');			#measurement 4

	S_teststep("Send '$tcpar_REQ_ReportDTCSnapshotRecord1'", 'AUTO_NBR', 'send_req_reportdtcsnapshotrecord1');			#measurement 5

	S_teststep("Send '$tcpar_REQ_ReportDTCSnapshotRecord2'", 'AUTO_NBR', 'send_req_reportdtcsnapshotrecord2');			#measurement 6

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("All fault are qualified", 'create_fault_squib');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_fault_squib');

	S_teststep_expected("All fault are de-qualified", 'remove_fault_condtion');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'remove_fault_condtion');

	S_teststep_expected("'$tcpar_PR_ReportDTC' is obtained", 'create_condition');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'create_condition');

	S_teststep_expected("'$tcpar_PR_ClearDiagnosticInformation' is obtained", 'send_req_cleardiagnosticinformation');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_req_cleardiagnosticinformation');

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshotRecord1' is obtained", 'send_req_reportdtcsnapshotrecord1');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'send_req_reportdtcsnapshotrecord1');

	S_teststep_expected("Send '$tcpar_PR_ReportDTCSnapshotRecord2' is obtained", 'send_req_reportdtcsnapshotrecord2');			#evaluation 6
	S_teststep_detected("<<add detected result here>>", 'send_req_reportdtcsnapshotrecord2');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
