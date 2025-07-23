#### TEST CASE MODULE
package TC_EDID_Overwrite_Validation_DeltaV;

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

TC_EDID_Overwrite_Validation_DeltaV

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1. StandardPrepNoFault

2. Inject crash <CrashPrecondition1> if precondition <PreCrash1> not equal 'Empty'. Calculate the expected values of corresponding from the Injected Crash File

3. Inject crash <CrashPrecondition2> if precondition <PreCrash2> not equal 'Empty'. Calculate the expected values of corresponding from the Injected Crash File

4. Inject crash <CrashPrecondition3> if precondition <PreCrash3> not equal 'Empty'. Calculate the expected values of corresponding from the Injected Crash File


I<B<Stimulation and Measurement>>

5. Inject a Crash <Crashcode1>

6. Inject a Crash <Crashcode2>

7. Inject a Crash <Crashcode3>

8. Do turn Off ECU if power off condition <PowerOff> equal Yes

9. Do turn On ECU if power off condition <PowerOff> equal Yes

10. Read <EDIDs> value 


I<B<Evaluation>>

1. -

2. -

3. -

4. -

5. -

6. - 

7. -

8. -

9. -

10.  <EDIDs> should have values as per injected crash scenario in corresponding EDR records.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'EvalType' => 
	SCALAR 'EvalType_MaxDeltaV_Value' => 
	SCALAR 'EvalType_MaxDeltaV_Time' => 
	SCALAR 'EvalUnit' => 
	SCALAR 'EDID' => 
	SCALAR 'EvalTolerance_abs' => 
	SCALAR 'EvalTolerance_abs_ClippngTime' => 
	HASH 'COMsignalsAfterCrash' => 
	SCALAR 'Protocol' => 
	SCALAR 'read_CHINAEDR' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 
	SCALAR 'PreCrash1' => 
	SCALAR 'PreCrash2' => 
	SCALAR 'PreCrash3' => 
	SCALAR 'CrashPrecondition1' => 
	SCALAR 'CrashPrecondition2' => 
	SCALAR 'CrashPrecondition3' => 
	SCALAR 'T0CrashPrecondition_ms1' => 
	SCALAR 'T0CrashPrecondition_ms2' => 
	SCALAR 'T0CrashPrecondition_ms3' => 
	LIST 'EDIDs' => 
	SCALAR 'Crashcode1' => 
	SCALAR 'Crashcode2' => 
	SCALAR 'Crashcode3' => 
	SCALAR 'CrashTimeZero_ms1' => 
	SCALAR 'CrashTimeZero_ms2' => 
	SCALAR 'CrashTimeZero_ms3' => 
	SCALAR 'ExpectedNbrOfRecords' => 
	SCALAR 'SensorLabel' => 
	HASH 'StorageOptions' => 
	SCALAR 'PowerOff' => 


=head2 PARAMETER EXAMPLES

	purpose ='To validate EDR buffer can be overwritten correctly for DeltaV data'
	EvalType = 'DeltaV'
	EvalType_MaxDeltaV_Value = 'MaxDeltaV_Value'
	EvalType_MaxDeltaV_Time = 'MaxDeltaV_Time'
	EvalUnit = 'km/h'
	EDID = 4000
	EvalTolerance_abs = '10' # kmph -> Tolerance must be adapted according to EDID and sensor resolution for each EDID!!
	EvalTolerance_abs_ClippngTime = '2'
	COMsignalsAfterCrash = %()
	Protocol = 'CAN' 
	read_CHINAEDR = 'yes'
	DiagType = 'ProdDiag'
	ResultDB = 'EDR'
	PreCrash1 = 'NDCrash'
	PreCrash2 = 'NDCrash'
	PreCrash3 = 'NDCrash'
	CrashPrecondition1 = 'Single_EDR_SideRight_NonInflatable'
	CrashPrecondition2 = 'Single_EDR_Rear_above_8kph_NoDeployment;5'
	CrashPrecondition3 = 'Single_EDR_SideLeft_NonInflatable'
	T0CrashPrecondition_ms1 = '60'
	T0CrashPrecondition_ms2 = '113'
	T0CrashPrecondition_ms3 = '60'
	EDIDs = @(4001,4002,4003,4004)
	Crashcode1 = 'Single_EDR_Front_above_8kph_NoDeployment;5'
	Crashcode2 = 'Single_EDR_Side_above_8kph_NoDeployment;5'
	Crashcode3 = 'Single_EDR_Rollover_NoDeployment;5'
	CrashTimeZero_ms1 = '77'
	CrashTimeZero_ms2 = '140'
	CrashTimeZero_ms3 = '465'
	ExpectedNbrOfRecords = '3'
	SensorLabel = 'ECU: Acc_HG: -M45: SMA660_sync_axay_96g_426Hz'
	StorageOptions = %('COM_Signals' => 'no', 'SensorData' => 'yes')
	PowerOff = 'Yes'
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EvalType;
my $tcpar_EvalType_MaxDeltaV_Value;
my $tcpar_EvalType_MaxDeltaV_Time;
my $tcpar_EvalUnit;
my $tcpar_EDID;
my $tcpar_EvalTolerance_abs;
my $tcpar_EvalTolerance_abs_ClippngTime;
my $tcpar_COMsignalsAfterCrash;
my $tcpar_Protocol;
my $tcpar_read_CHINAEDR;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_PreCrash1;
my $tcpar_PreCrash2;
my $tcpar_PreCrash3;
my $tcpar_CrashPrecondition1;
my $tcpar_CrashPrecondition2;
my $tcpar_CrashPrecondition3;
my $tcpar_T0CrashPrecondition_ms1;
my $tcpar_T0CrashPrecondition_ms2;
my $tcpar_T0CrashPrecondition_ms3;
my $tcpar_EDIDs;
my $tcpar_Crashcode1;
my $tcpar_Crashcode2;
my $tcpar_Crashcode3;
my $tcpar_CrashTimeZero_ms1;
my $tcpar_CrashTimeZero_ms2;
my $tcpar_CrashTimeZero_ms3;
my $tcpar_ExpectedNbrOfRecords;
my $tcpar_SensorLabel;
my $tcpar_StorageOptions;
my $tcpar_PowerOff;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EvalType =  GEN_Read_mandatory_testcase_parameter( 'EvalType' );
	$tcpar_EvalType_MaxDeltaV_Value =  GEN_Read_mandatory_testcase_parameter( 'EvalType_MaxDeltaV_Value' );
	$tcpar_EvalType_MaxDeltaV_Time =  GEN_Read_mandatory_testcase_parameter( 'EvalType_MaxDeltaV_Time' );
	$tcpar_EvalUnit =  GEN_Read_mandatory_testcase_parameter( 'EvalUnit' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_EvalTolerance_abs =  GEN_Read_mandatory_testcase_parameter( 'EvalTolerance_abs' );
	$tcpar_EvalTolerance_abs_ClippngTime =  GEN_Read_mandatory_testcase_parameter( 'EvalTolerance_abs_ClippngTime' );
	$tcpar_COMsignalsAfterCrash =  GEN_Read_mandatory_testcase_parameter( 'COMsignalsAfterCrash' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_read_CHINAEDR =  GEN_Read_mandatory_testcase_parameter( 'read_CHINAEDR' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_PreCrash1 =  GEN_Read_mandatory_testcase_parameter( 'PreCrash1' );
	$tcpar_PreCrash2 =  GEN_Read_mandatory_testcase_parameter( 'PreCrash2' );
	$tcpar_PreCrash3 =  GEN_Read_mandatory_testcase_parameter( 'PreCrash3' );
	$tcpar_CrashPrecondition1 =  GEN_Read_mandatory_testcase_parameter( 'CrashPrecondition1' );
	$tcpar_CrashPrecondition2 =  GEN_Read_mandatory_testcase_parameter( 'CrashPrecondition2' );
	$tcpar_CrashPrecondition3 =  GEN_Read_mandatory_testcase_parameter( 'CrashPrecondition3' );
	$tcpar_T0CrashPrecondition_ms1 =  GEN_Read_mandatory_testcase_parameter( 'T0CrashPrecondition_ms1' );
	$tcpar_T0CrashPrecondition_ms2 =  GEN_Read_mandatory_testcase_parameter( 'T0CrashPrecondition_ms2' );
	$tcpar_T0CrashPrecondition_ms3 =  GEN_Read_mandatory_testcase_parameter( 'T0CrashPrecondition_ms3' );
	$tcpar_EDIDs =  GEN_Read_mandatory_testcase_parameter( 'EDIDs' );
	$tcpar_Crashcode1 =  GEN_Read_mandatory_testcase_parameter( 'Crashcode1' );
	$tcpar_Crashcode2 =  GEN_Read_mandatory_testcase_parameter( 'Crashcode2' );
	$tcpar_Crashcode3 =  GEN_Read_mandatory_testcase_parameter( 'Crashcode3' );
	$tcpar_CrashTimeZero_ms1 =  GEN_Read_mandatory_testcase_parameter( 'CrashTimeZero_ms1' );
	$tcpar_CrashTimeZero_ms2 =  GEN_Read_mandatory_testcase_parameter( 'CrashTimeZero_ms2' );
	$tcpar_CrashTimeZero_ms3 =  GEN_Read_mandatory_testcase_parameter( 'CrashTimeZero_ms3' );
	$tcpar_ExpectedNbrOfRecords =  GEN_Read_mandatory_testcase_parameter( 'ExpectedNbrOfRecords' );
	$tcpar_SensorLabel =  GEN_Read_mandatory_testcase_parameter( 'SensorLabel' );
	$tcpar_StorageOptions =  GEN_Read_mandatory_testcase_parameter( 'StorageOptions' );
	$tcpar_PowerOff =  GEN_Read_mandatory_testcase_parameter( 'PowerOff' );

	return 1;
}

sub TC_initialization {

	S_teststep("1. StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("2. Inject crash '$tcpar_CrashPrecondition1' if precondition '$tcpar_PreCrash1' not equal 'Empty'. Calculate the expected values of corresponding from the Injected Crash File", 'AUTO_NBR');

	S_teststep("3. Inject crash '$tcpar_CrashPrecondition2' if precondition '$tcpar_PreCrash2' not equal 'Empty'. Calculate the expected values of corresponding from the Injected Crash File", 'AUTO_NBR');

	S_teststep("4. Inject crash '$tcpar_CrashPrecondition3' if precondition '$tcpar_PreCrash3' not equal 'Empty'. Calculate the expected values of corresponding from the Injected Crash File", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Inject a Crash '$tcpar_Crashcode1'", 'AUTO_NBR');

	S_teststep("Inject a Crash '$tcpar_Crashcode2'", 'AUTO_NBR');

	S_teststep("Inject a Crash '$tcpar_Crashcode3'", 'AUTO_NBR');

	S_teststep("Do turn Off ECU if power off condition '$tcpar_PowerOff' equal Yes", 'AUTO_NBR');

	S_teststep("Do turn On ECU if power off condition '$tcpar_PowerOff' equal Yes", 'AUTO_NBR');

	S_teststep("Read '$tcpar_EDIDs' value ", 'AUTO_NBR', 'read_edids_value');			#measurement 1

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_EDIDs' should have values as per injected crash scenario in corresponding EDR records.", 'read_edids_value');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'read_edids_value');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
