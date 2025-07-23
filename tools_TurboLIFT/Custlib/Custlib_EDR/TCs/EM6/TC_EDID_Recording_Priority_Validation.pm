#### TEST CASE MODULE
package TC_EDID_Recording_Priority_Validation;

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
use FuncLib_SYC_INTERFACE;
use FuncLib_EDR_Framework;
use LIFT_crash_simulation;
use LIFT_labcar;
use LIFT_PD;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use GENERIC_DCOM;
use LIFT_can_access;
use FuncLib_TNT_SYC_INTERFACE;
use Data::Dumper;
use constant MILLISEC_TO_SECOND => 0.001;
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_Recording_Priority_Validation

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1. StandardPrepNoFault

2. China EDR is configured with type as CN CAT-A  through EOL

3. Set voltage in normal as <Volatage> Vol

4. All CAN signals transmitted normally

5. CAN message EBA_A1 and HEVC_A1 are never received

6. Set the <Signal> signal to value <COM_Precondition1>

7. Inject <CrashPrecondition1> if precondition <PreCrash1> not equal 'Empty'

8. Set the <Signal> signal to value <COM_Precondition2>

9. Inject <CrashPrecondition2> if precondition <PreCrash2> not equal 'Empty'

10. Set the <Signal> signal to value <COM_Precondition3>

11. Inject <CrashPrecondition3> if precondition <PreCrash3> not equal 'Empty'


I<B<Stimulation and Measurement>>

1. Set the CAN signal <Signal> as value <VSp_Value1>

2. Inject a Crash <Crashcode1>

3. Waiting for <WaitTime1> ms

4. Set the CAN signal <Signal> as value <VSp_Value2>

5. Inject a Crash <Crashcode2>

6. Waiting for <WaitTime2> ms

7. Power OFF

8. Power ON

9. Read All Records value 


I<B<Evaluation>>

1. -

2. -

3. -

4. -

5. -

6. -

7.- 

8. -

9.  COMSignalValue corresponding to COMSignalState should be reported


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
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
	SCALAR 'Signal' => 
	SCALAR 'VSp_Precondition1' => 
	SCALAR 'VSp_Precondition2' => 
	SCALAR 'VSp_Precondition3' => 
	HASH 'PreconditionValue1' => 
	HASH 'PreconditionValue2' => 
	HASH 'PreconditionValue3' => 
	SCALAR 'VSp_Value1' => 
	SCALAR 'VSp_Value2' => 
	SCALAR 'VSp_Value3' => 
	HASH 'ExpectedVSpData1' => 
	HASH 'ExpectedVSpData2' => 
	HASH 'ExpectedVSpData3' => 
	SCALAR 'Crashcode1' => 
	SCALAR 'Crashcode2' => 
	SCALAR 'WaitTime1' => 
	SCALAR 'WaitTime2' => 
	SCALAR 'ExpectedNbrOfRecords' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To validate EDR data recording priority'
	Protocol = 'CAN' 
	read_CHINAEDR = 'yes'
	DiagType = 'ProdDiag'
	ResultDB = 'EDR'
	PreCrash1 = 'NDCrash'
	PreCrash2 = 'Empty'
	PreCrash3 = 'Empty'
	CrashPrecondition1 = 'Single_EDR_SideRight_NonInflatable'
	CrashPrecondition2 = 'NA'
	CrashPrecondition3 = 'NA'
	Signal = 'VehicleSpeedDisplayedinkmh'
	VSp_Precondition1 = '0'
	VSp_Precondition2 = '1'
	VSp_Precondition3 = '2'
	PreconditionValue1 = %( '4005' => '0x00')
	PreconditionValue2 = %( '4005' => '0x01')
	PreconditionValue3 = %( '4005' => '0x02')
	VSp_Value1 = '100'
	VSp_Value2 = '250'
	VSp_Value3 = '409.5'
	ExpectedVSpData1 = %( '4005' => '0x64')
	ExpectedVSpData2 = %( '4005' => '0xFA')
	ExpectedVSpData3 = %( '4005' => '0xFE')
	Crashcode1 = 'Single_EDR_Front_above_8kph_NoDeployment;5'
	Crashcode2 = 'Single_EDR_Rear_NonInflatable;5'
	WaitTime1 = '1500'
	WaitTime2 = '16'
	ExpectedNbrOfRecords = '3'
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Protocol;
my $tcpar_read_CHINAEDR;
my $tcpar_read_NHTSAEDR;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_Volatage;
my $tcpar_EvalType;
my $tcpar_EvalUnit;
my $tcpar_EDID;
my $tcpar_EvalTolerance_abs;
my $tcpar_SourceLabel;
my $tcpar_PreCrash1;
my $tcpar_PreCrash2;
my $tcpar_PreCrash3;
my $tcpar_CrashTypeCheck;
my $tcpar_CrashPrecondition1;
my $tcpar_CrashPrecondition2;
my $tcpar_CrashPrecondition3;
my $tcpar_T0CrashPrecondition_ms1;
my $tcpar_T0CrashPrecondition_ms2;
my $tcpar_T0CrashPrecondition_ms3;
my $tcpar_Signal;
my $tcpar_DriverState_Precondition1;
my $tcpar_DriverState_Precondition2;
my $tcpar_DriverState_Precondition3;
my $tcpar_DriverState_Value1;
my $tcpar_DriverState_Value2;
my $tcpar_Crashcode1;
my $tcpar_Crashcode2;
my $tcpar_CrashTimeZero_ms1;
my $tcpar_CrashTimeZero_ms2;
my $tcpar_WaitTime1;
my $tcpar_WaitTime2;
my $tcpar_ExpectedNbrOfRecords;
my $tcpar_ExpectedDriverState_Buffer1;
my $tcpar_ExpectedDriverState_Buffer2;
my $tcpar_ExpectedDriverState_Buffer3;
my $tcpar_ExpectedCompleted_Buffer1;
my $tcpar_ExpectedCompleted_Buffer2;
my $tcpar_ExpectedCompleted_Buffer3;
my $tcpar_CoordinateSystem;
my $tcpar_StorageOptions_href;
################ global parameter declaration ###################
#add any global variables here
my (
		$record_handler,
		$crash_handler,
		$comSignalLabelMapping_href,
		$mappingEDR,
		$crashSettings,
		$crashDetails_href,
		$crashInfo_href,
		$ChinaEDR_diagType,
		$currentTestCaseIteration,
		$storedCrashLabels_aref,
		$edrNumberOfEventsToBeStored,
		$unit,
		$ignitionCycle,
		$IGN_ValueCrash1,
		$IGN_ValueCrash2,
		$IGN_ValueCrash3,
		$manipulatedCOMsignals,
		$dataStoragePath,

	);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  S_read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Protocol =  S_read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_read_CHINAEDR =  S_read_mandatory_testcase_parameter( 'read_CHINAEDR' );
	$tcpar_read_NHTSAEDR = S_read_optional_testcase_parameter('read_NHTSAEDR');
	$tcpar_DiagType =  S_read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  S_read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_Volatage =  S_read_mandatory_testcase_parameter( 'Volatage' );
	$tcpar_EvalType =  S_read_mandatory_testcase_parameter( 'EvalType' );
	$tcpar_EvalUnit =  S_read_mandatory_testcase_parameter( 'EvalUnit' );
	$tcpar_EDID =  S_read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_EvalTolerance_abs =  S_read_mandatory_testcase_parameter( 'EvalTolerance_abs' );
	$tcpar_SourceLabel =  S_read_mandatory_testcase_parameter( 'SensorLabel' );
	$tcpar_PreCrash1 =  S_read_mandatory_testcase_parameter( 'PreCrash1' );
	$tcpar_PreCrash2 =  S_read_mandatory_testcase_parameter( 'PreCrash2' );
	$tcpar_PreCrash3 =  S_read_mandatory_testcase_parameter( 'PreCrash3' );
	$tcpar_CrashTypeCheck =  S_read_mandatory_testcase_parameter( 'CrashTypeCheck' );
	$tcpar_CrashPrecondition1 =  S_read_mandatory_testcase_parameter( 'CrashPrecondition1' );
	$tcpar_CrashPrecondition2 =  S_read_mandatory_testcase_parameter( 'CrashPrecondition2' );
	$tcpar_CrashPrecondition3 =  S_read_mandatory_testcase_parameter( 'CrashPrecondition3' );
	$tcpar_T0CrashPrecondition_ms1 =  S_read_mandatory_testcase_parameter( 'T0CrashPrecondition_ms1' );
	$tcpar_T0CrashPrecondition_ms2 =  S_read_mandatory_testcase_parameter( 'T0CrashPrecondition_ms2' );
	$tcpar_T0CrashPrecondition_ms3 =  S_read_mandatory_testcase_parameter( 'T0CrashPrecondition_ms3' );
	$tcpar_Signal =  S_read_mandatory_testcase_parameter( 'Signal' );
	$tcpar_DriverState_Precondition1 =  S_read_mandatory_testcase_parameter( 'DriverState_Precondition1' );
	$tcpar_DriverState_Precondition2 =  S_read_mandatory_testcase_parameter( 'DriverState_Precondition2' );
	$tcpar_DriverState_Precondition3 =  S_read_mandatory_testcase_parameter( 'DriverState_Precondition3' );
	$tcpar_DriverState_Value1 =  S_read_mandatory_testcase_parameter( 'DriverState_Value1' );
	$tcpar_DriverState_Value2 =  S_read_mandatory_testcase_parameter( 'DriverState_Value2' );
	$tcpar_Crashcode1 =  S_read_mandatory_testcase_parameter( 'Crashcode1' );
	$tcpar_Crashcode2 =  S_read_mandatory_testcase_parameter( 'Crashcode2' );
	$tcpar_CrashTimeZero_ms1 =  S_read_mandatory_testcase_parameter( 'CrashTimeZero_ms1' );
	$tcpar_CrashTimeZero_ms2 =  S_read_mandatory_testcase_parameter( 'CrashTimeZero_ms2' );
	$tcpar_WaitTime1 =  S_read_mandatory_testcase_parameter( 'WaitTime1' );
	$tcpar_WaitTime2 =  S_read_mandatory_testcase_parameter( 'WaitTime2' );
	$tcpar_ExpectedNbrOfRecords =  S_read_mandatory_testcase_parameter( 'ExpectedNbrOfRecords' );
	$tcpar_ExpectedDriverState_Buffer1 =  S_read_mandatory_testcase_parameter( 'ExpectedDriverState_Buffer1' );
	$tcpar_ExpectedDriverState_Buffer2 =  S_read_mandatory_testcase_parameter( 'ExpectedDriverState_Buffer2' );
	$tcpar_ExpectedDriverState_Buffer3 =  S_read_mandatory_testcase_parameter( 'ExpectedDriverState_Buffer3' );
	$tcpar_ExpectedCompleted_Buffer1 =  S_read_mandatory_testcase_parameter( 'ExpectedCompleted_Buffer1' );
	$tcpar_ExpectedCompleted_Buffer2 =  S_read_mandatory_testcase_parameter( 'ExpectedCompleted_Buffer2' );
	$tcpar_ExpectedCompleted_Buffer3 =  S_read_mandatory_testcase_parameter( 'ExpectedCompleted_Buffer3' );
	$tcpar_CoordinateSystem = S_read_optional_testcase_parameter('CoordinateSystem');
	$tcpar_StorageOptions_href = S_read_mandatory_testcase_parameter('StorageOptions', 'byref');
	if(not defined $tcpar_CoordinateSystem){
    	$tcpar_CoordinateSystem = 'NHTSA';
    }
	if(not defined $tcpar_read_CHINAEDR) {
		$tcpar_read_NHTSAEDR = 'yes';
		$tcpar_read_CHINAEDR = 'no';
	}
	else {
		$tcpar_read_NHTSAEDR = 'no';
		my $storageOrder = EDR_getStorageOrder();
		return unless(defined $storageOrder);

		if($storageOrder eq 'PhysicalOrder'){
			$ChinaEDR_diagType= 'Prodiag';  #In platform NHTSA and China EDR is read via proddiag
		}
		else {
			$ChinaEDR_diagType= 'CHINA_Payload';
		}
	}

	return 1;
}

sub TC_initialization {

	# INITIALIZE RECORD AND CRASH HANDLER
    #    
	S_w2rep("Initialize Record and Crash Handler");
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;
	
	#--------------------------------------------------------------
    # Initialize equipment
    #

	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
    CA_trace_start();
    GDCOM_init () ; # To fetch info for CD from mapping_diag

	
    PD_ClearCrashRecorder();
    S_wait_ms(2000);
 
    # erase FltMem
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	# read fault memory
    my $faultsBeforeStimulation = PD_ReadFaultMemory();
	
	#Fault memory must be empty
	S_teststep("1. StandardPrepNoFault", 'AUTO_NBR');
    my $faultsVerdict = PD_evaluate_faults( $faultsBeforeStimulation, []);
 	return 0 unless ($faultsVerdict eq 'VERDICT_PASS');

	S_teststep("2. China EDR is configured with type as CN CAT-A  through EOL", 'AUTO_NBR');
	# my $status = EOL_SetDeviceType( 'CNEDR', 'OTHERS', 'CATA', 'C1A' );
	# S_wait_ms(2000);

	S_teststep("3. Set voltage in normal as '$tcpar_Volatage' Vol", 'AUTO_NBR');

	S_teststep("4. All CAN signals transmitted normally", 'AUTO_NBR');
	# CA_set_EnvVar_value ( 'EnvHEVC_A1To_', 1);
	# CA_set_EnvVar_value ( 'EnvEBA_A1To_', 1);
	# CA_set_EnvVar_value ( 'EnvECM_A3To_', 1);
	# CA_set_EnvVar_value ( 'EnvECM_A8To_', 1);
	# CA_set_EnvVar_value ( 'EnvECM_A9To_', 1);
	# CA_set_EnvVar_value ( 'EnvBCM_A7To_', 1);
	# S_wait_ms(2000);

	# S_teststep("5. CAN message EBA_A1 and HEVC_A1 are never received", 'AUTO_NBR');
	# CA_set_EnvVar_value( 'EnvHEVC_A1To_', 0 );
	# S_wait_ms(2000);
	# GDCOM_request ('14 FF FF FF', '54', 'relax');
	# S_wait_ms(1000);
	
	# CA_set_EnvVar_value( 'EnvEBA_A1To_', 0 );
	# S_wait_ms(2000);
	# GDCOM_request ('14 FF FF FF', '54', 'relax');
	# S_wait_ms(1000);
		

	S_teststep("6. Set the '$tcpar_Signal' signal to value '$tcpar_DriverState_Precondition1'", 'AUTO_NBR');
	CA_set_EnvVar_value( '_Env__MET390_SEATBELT_DRVR', $tcpar_DriverState_Precondition1);
	

	S_teststep("7. Inject '$tcpar_CrashPrecondition1' if precondition '$tcpar_PreCrash1' not equal 'Empty'", 'AUTO_NBR');
	if($tcpar_PreCrash1 ne 'Empty')
	{
		Crash_Injection($tcpar_CrashPrecondition1,$tcpar_T0CrashPrecondition_ms1);
		S_wait_ms(8000);
	}
	else
	{
		S_teststep_2nd_level("Crash is not inject in this step", 'AUTO_NBR');
	}

	S_teststep("8. Set the '$tcpar_Signal' signal to value '$tcpar_DriverState_Precondition2'", 'AUTO_NBR');
	CA_set_EnvVar_value( '_Env__MET390_SEATBELT_DRVR', $tcpar_DriverState_Precondition2);


	S_teststep("9. Inject '$tcpar_CrashPrecondition2' if precondition '$tcpar_PreCrash2' not equal 'Empty'", 'AUTO_NBR');
	if($tcpar_PreCrash2 ne 'Empty')
	{
		Crash_Injection($tcpar_CrashPrecondition2,$tcpar_T0CrashPrecondition_ms2);
		S_wait_ms(8000);
	}
	else
	{
		S_teststep_2nd_level("Crash is not inject in this step", 'AUTO_NBR');
	}

	S_teststep("10. Set the '$tcpar_Signal' signal to value '$tcpar_DriverState_Precondition3'", 'AUTO_NBR');
	
	CA_set_EnvVar_value( '_Env__MET390_SEATBELT_DRVR', $tcpar_DriverState_Precondition3);


	S_teststep("11. Inject '$tcpar_CrashPrecondition3' if precondition '$tcpar_PreCrash3' not equal 'Empty'", 'AUTO_NBR');
	if($tcpar_PreCrash3 ne 'Empty')
	{
		Crash_Injection($tcpar_CrashPrecondition3,$tcpar_T0CrashPrecondition_ms3);
		S_wait_ms(8000);
	}
	else
	{
		S_teststep_2nd_level("Crash is not inject in this step", 'AUTO_NBR');
	}

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set the CAN signal '$tcpar_Signal' as value '$tcpar_DriverState_Value1'", 'AUTO_NBR');
	CA_set_EnvVar_value( '_Env__MET390_SEATBELT_DRVR', $tcpar_DriverState_Value1);

	S_teststep("Inject a Crash '$tcpar_Crashcode1'", 'AUTO_NBR');
	Crash_Injection($tcpar_Crashcode1,$tcpar_CrashTimeZero_ms1);
	# S_user_action("Check crash record after crash1");
	
	S_teststep("Waiting for '$tcpar_WaitTime1' ms", 'AUTO_NBR');
	S_wait_ms($tcpar_WaitTime1);

	S_teststep("Set the CAN signal '$tcpar_Signal' as value '$tcpar_DriverState_Value2'", 'AUTO_NBR');
	CA_set_EnvVar_value( '_Env__MET390_SEATBELT_DRVR', $tcpar_DriverState_Value2);
	
	S_teststep("Inject a Crash '$tcpar_Crashcode2'", 'AUTO_NBR');
	Crash_Injection($tcpar_Crashcode2,$tcpar_CrashTimeZero_ms2);
	# S_user_action("Check crash record after crash2");
	
	
	S_teststep("Waiting for '$tcpar_WaitTime2' ms", 'AUTO_NBR');
	S_wait_ms($tcpar_WaitTime2);

	S_teststep("Power OFF", 'AUTO_NBR');
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');

	S_teststep("Power ON", 'AUTO_NBR');
	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');

	S_teststep("Read All Records value ", 'AUTO_NBR', 'read_all_records');			#measurement 1
	ReadAndStoreRecord($tcpar_Crashcode2);
	
	# S_user_action("Check crash record after crash2");
	return 1;
}

sub TC_evaluation {
	
	
	S_w2rep("");
	S_w2rep("--------------------------------------------------------", 'purple');
	S_w2rep("COMPLETE FILE RECORDED EDID 4012", 'purple');
	
	Complete_Recored(1,$tcpar_Crashcode2,%$tcpar_ExpectedCompleted_Buffer1);
	Complete_Recored(2,$tcpar_Crashcode2,%$tcpar_ExpectedCompleted_Buffer2);
	Complete_Recored(3,$tcpar_Crashcode2,%$tcpar_ExpectedCompleted_Buffer3);
	
	S_w2rep("");
	S_w2rep("--------------------------------------------------------", 'purple');
	S_w2rep("Safety Belt Status Driver EDID 4007", 'purple');
	      
	Verified_Buffer(1,$tcpar_Crashcode2,%$tcpar_ExpectedDriverState_Buffer1);
	Verified_Buffer(2,$tcpar_Crashcode2,%$tcpar_ExpectedDriverState_Buffer2);
	Verified_Buffer(3,$tcpar_Crashcode2,%$tcpar_ExpectedDriverState_Buffer3);

	S_w2rep("");
	S_w2rep("--------------------------------------------------------", 'purple');
	S_w2rep("Longitudinal DeltaV EDID 4000", 'purple');
	
	if (($tcpar_CrashTypeCheck eq 'ND_NAD')||($tcpar_CrashTypeCheck eq 'ND_AD')||($tcpar_CrashTypeCheck eq 'ND_ND'))
	{
		if (($tcpar_PreCrash1 eq 'NDCrash') && ($tcpar_PreCrash2 eq 'Empty') && ($tcpar_PreCrash3 eq 'Empty'))
		{
			Evaluate_DeltaV(1,$tcpar_Crashcode2,$tcpar_Crashcode2,$tcpar_CrashTimeZero_ms2);
			Evaluate_DeltaV(2,$tcpar_Crashcode2,$tcpar_Crashcode1,$tcpar_CrashTimeZero_ms1);
			Evaluate_DeltaV(3,$tcpar_Crashcode2,$tcpar_CrashPrecondition1,$tcpar_T0CrashPrecondition_ms1);
			
		}
		elsif (($tcpar_PreCrash1 eq 'ADCrash') && ($tcpar_PreCrash2 eq 'NDCrash') && ($tcpar_PreCrash3 eq 'Empty'))
		{
			Evaluate_DeltaV(1,$tcpar_Crashcode2,$tcpar_Crashcode2,$tcpar_CrashTimeZero_ms2);
			Evaluate_DeltaV(2,$tcpar_Crashcode2,$tcpar_Crashcode1,$tcpar_CrashTimeZero_ms1);
			Evaluate_DeltaV(3,$tcpar_Crashcode2,$tcpar_CrashPrecondition2,$tcpar_T0CrashPrecondition_ms2);
		}
		else
		{
			Evaluate_DeltaV(1,$tcpar_Crashcode2,$tcpar_Crashcode2 ,$tcpar_CrashTimeZero_ms2);
			Evaluate_DeltaV(2,$tcpar_Crashcode2,$tcpar_CrashPrecondition3,$tcpar_T0CrashPrecondition_ms3);
			Evaluate_DeltaV(3,$tcpar_Crashcode2,$tcpar_CrashPrecondition1,$tcpar_T0CrashPrecondition_ms1);
		}

	}
	elsif (($tcpar_CrashTypeCheck eq 'NAD_ND')||($tcpar_CrashTypeCheck eq 'AD_ND')||($tcpar_CrashTypeCheck eq 'NAD_AD')||($tcpar_CrashTypeCheck eq 'AD_NAD')||($tcpar_CrashTypeCheck eq 'NAD_NAD')||($tcpar_CrashTypeCheck eq 'AD_AD'))
	{
		if (($tcpar_PreCrash1 eq 'NDCrash') && ($tcpar_PreCrash2 eq 'Empty') && ($tcpar_PreCrash3 eq 'Empty'))
		{
			Evaluate_DeltaV(1,$tcpar_Crashcode2,$tcpar_Crashcode2,$tcpar_CrashTimeZero_ms2);
			Evaluate_DeltaV(2,$tcpar_Crashcode2,$tcpar_Crashcode1,$tcpar_CrashTimeZero_ms1);
			Evaluate_DeltaV(3,$tcpar_Crashcode2,$tcpar_CrashPrecondition1,$tcpar_T0CrashPrecondition_ms1);
		}
		elsif (($tcpar_PreCrash1 eq 'ADCrash') && ($tcpar_PreCrash2 eq 'NDCrash') && ($tcpar_PreCrash3 eq 'Empty'))
		{
			
			Evaluate_DeltaV(1,$tcpar_Crashcode2,$tcpar_Crashcode2,$tcpar_CrashTimeZero_ms2);
			Evaluate_DeltaV(2,$tcpar_Crashcode2,$tcpar_Crashcode1,$tcpar_CrashTimeZero_ms1);
			Evaluate_DeltaV(3,$tcpar_Crashcode2,$tcpar_CrashPrecondition2,$tcpar_T0CrashPrecondition_ms2);
		}
		else
		{
			Evaluate_DeltaV(1,$tcpar_Crashcode2,$tcpar_Crashcode1,$tcpar_CrashTimeZero_ms1);
			Evaluate_DeltaV(2,$tcpar_Crashcode2,$tcpar_CrashPrecondition3,$tcpar_T0CrashPrecondition_ms3);
			Evaluate_DeltaV(3,$tcpar_Crashcode2,$tcpar_CrashPrecondition1,$tcpar_T0CrashPrecondition_ms1);
		}

	}
	
	
	

	return 1;
}

sub TC_finalization {

	S_w2rep("Clean up record ...");
	$record_handler -> DeleteAllRecords(); 
	foreach my $recordNbr (1..$tcpar_ExpectedNbrOfRecords)
	{
		$record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_Crashcode1", "RecordNumber" => $recordNbr);
		$record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_Crashcode2", "RecordNumber" => $recordNbr);
		$record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_CrashPrecondition1", "RecordNumber" => $recordNbr);
		$record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_CrashPrecondition2", "RecordNumber" => $recordNbr);
		$record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_CrashPrecondition3", "RecordNumber" => $recordNbr);
	}
	

	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashCode_MDS',
     								 "CrashLabel"  => $tcpar_CrashPrecondition1  );
									 
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashCode_MDS',
     								 "CrashLabel"  => $tcpar_CrashPrecondition2  );
     								
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashCode_MDS',
     								 "CrashLabel"  => $tcpar_CrashPrecondition3  ); 
									 
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashCode_MDS',
     								 "CrashLabel"  => $tcpar_Crashcode1  );
									
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashCode_MDS',
     								 "CrashLabel"  => $tcpar_Crashcode2  ); 
     								
	
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashDuration',
     								 "CrashLabel"  => $tcpar_CrashPrecondition1  );
									 
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashDuration',
     								 "CrashLabel"  => $tcpar_CrashPrecondition2  );
     								
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashDuration',
     								 "CrashLabel"  => $tcpar_CrashPrecondition3  ); 
									 
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashDuration',
     								 "CrashLabel"  => $tcpar_Crashcode1  );
									 
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashDuration',
     								 "CrashLabel"  => $tcpar_Crashcode2  );
     								
	
	# S_w2rep("Clear fault memory");
	PD_ClearCrashRecorder();
	S_wait_ms(2000);
	# Erase Fault memory
	PD_ClearFaultMemory();
	S_wait_ms(2000);
	# GDCOM_request ('31 01 30 00', '71 01', 'relax');
	# S_wait_ms(2000);

	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
	# Erase EDR
	PD_ClearCrashRecorder_NOERROR();
	S_wait_ms(2000);
	
	# S_user_action("check record");
	return 1;
}

sub Crash_Injection{

	my @CrashInput = @_;
	my $Crashcode = @CrashInput[0];
	my $CrashTimeZero = @CrashInput[1];

	S_teststep_2nd_level("Inject a Crash '$Crashcode'", 'AUTO_NBR');
	#--------------------------------------------------------------
    # GET CRASH DETAILS
    #    
	# Crash name or index and result DB from EDR mapping
	$tcpar_ResultDB = 'EDR';
	# if ($Crashcode eq 'Single_EDR_Rollover_Inflatable')
	# {
		
		# $tcpar_ResultDB = 'ROLLOVER';
		
		
	# }
	# elsif (($Crashcode eq 'Single_Cust_Nissan_C1A_Front_NAD') || ($Crashcode eq 'Single_EDR_Rear_NonInflatable;5'))
	# {
		
		# $tcpar_ResultDB = 'NAD';
		
	# }
	# else
	# {
		# $tcpar_ResultDB = 'EDR';
	# }
	
    $crashDetails_href = $mappingEDR -> {'CRASHFILES'}{$Crashcode};
    unless(defined $crashDetails_href) {
        $crashDetails_href = {'RESULTDB' => $tcpar_ResultDB, 'CRASHNAME' => $Crashcode};
    }
	# Crash settings
	$crashSettings = CSI_GetCrashDataFromMDS($crashDetails_href);
	unless(defined $crashSettings) {
		S_set_error("Crash code $Crashcode not defined in given result DB. Test case will be aborted.");
		return 0;
	}
	

	#--------------------------------------------------------------
    # ADD EDR CRASH TIME ZERO AS CRASH SOURCE
    #    
    $crash_handler -> AddCrashSource( "CrashLabel" => $Crashcode,
    								  "SourceLabel" => 'CrashTimeZero', 
                                      "OriginalSourceData" => $CrashTimeZero,
                                      "SourceUnit" => 'ms',);    
	
	# Crash code in World DB
	$crash_handler -> AddCrashSource( "CrashLabel" => $Crashcode,
	    								  "SourceLabel" => 'CrashCode_MDS', 
	                                      "OriginalSourceData" => $Crashcode );

    $crashInfo_href -> {"CrashCode_MDS"} = $Crashcode;

	# Name of Result DB
	my $resultDB = $crashDetails_href -> {"RESULTDB"};
	unless(defined $resultDB) {
		$resultDB = "DEFAULT";
	}

	# Result DB path
	my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$resultDB" ] );
	$crashInfo_href -> {"MDB_Path"} = $resultDBDetails->{'PATH'};

	# Crash time Zero and EDR crash label -> crash name in EDR mapping
	$crashInfo_href -> {"CrashTimeZero_ms"} = $CrashTimeZero;
	$crashInfo_href -> {"CrashLabel"} = $Crashcode;
	
	#--------------------------------------------------------------
    # CRASH PREPARATION
    #
    S_w2rep("Prepare crash (download crash data)");
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');

	# Prepare crash
	my $crashDuration_ms = $crashSettings -> {'METADATA'} -> {'CRASHDURATION_MS'};
	# Crash duration
	$crash_handler -> AddCrashSource( "CrashLabel" => $Crashcode,
	    							  "SourceLabel" => 'CrashDuration', 
	                                  "OriginalSourceData" => $crashDuration_ms,
									  "SourceUnit" => 'ms'  );
											
	CSI_LoadCrashSensorData2Simulator( $crashSettings )unless $main::opt_offline;

	# Power ON the ECU
	LC_ECU_On();
 	S_wait_ms('TIMER_ECU_READY');
 	
    CSI_PrepareEnvironment( $crashSettings, 'before_crash_same_cycle','normal' );
    # S_wait_ms(1000);
	
	$dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number()."_"."$Crashcode";

	$edrNumberOfEventsToBeStored = SYC_EDR_get_NumberOfEventsToBeStored();
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("'NumberOfEventsToBeStored' is not available in SYC - add or overwrite 'SYC_EDR_get_NumberOfEventsToBeStored' with Custlibrary Function");
        return;
    }


	#--------------------------------------------------------------
    # STORE MDS DATA FROM CRASH
    #
	my $crashRawSignals = MDSRESULT_GetCrashDetails( $crashDetails_href, NO_FILTERING | NO_ROTATION );	# will return sensor signals with real physical values

    # ************** 1 - SENSOR DATA **************       
	if($tcpar_StorageOptions_href->{'SensorData'} eq 'yes')
	{
		S_teststep("Get and store physical sensor values", 'AUTO_NBR');

	    EDR_addSensorDataToCrashHandler ("Crash_href" => $crashDetails_href,
                                     "CrashLabel"  => $Crashcode,
                                     "DataStoragePath" => $dataStoragePath, # optional
                                    );
	}
	
    # CRASH INJECTION
	S_w2rep("Inject crash");
	CSI_TriggerCrash();
 		
	return 1;
	
}
sub ReadAndStoreRecord{

	my @CrashInput = @_;
	my $Crashcode = @CrashInput[0];

	my $dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number()."_"."$Crashcode";

	$edrNumberOfEventsToBeStored = SYC_EDR_get_NumberOfEventsToBeStored();
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("'NumberOfEventsToBeStored' is not available in SYC - add or overwrite 'SYC_EDR_get_NumberOfEventsToBeStored' with Custlibrary Function");
        return;
    }

    PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');
	Prepertation();
	S_wait_ms(1000);
	if ( lc( $tcpar_read_NHTSAEDR) eq 'yes' ) {
		S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored");
		EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								"CrashLabel" => $Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath, 
								"read_EDRType"=>'NHTSA')
	}
	if (lc($tcpar_read_CHINAEDR) eq 'yes'){
		$edrNumberOfEventsToBeStored=3;
		S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored");
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" =>  $ChinaEDR_diagType,
								"CrashLabel" => $Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA');
	}
	
	return 1;


}
sub Verified_Buffer{

	
	my $Buffer = shift;
	my $Crashcode = shift;
	my %CrashData = @_;
	# S_w2rep ("buffer: $Buffer \n");
	

	foreach my $edid ( keys %CrashData )
	{
		
		my $value = $CrashData{$edid};
		# S_w2rep ("$edid : $value\n");
		
	
			my $edidValue;
			my $dataElement = $record_handler -> GetDataElementEDID(  "EDIDnr" => $edid,
																	  "RecordNumber" => $Buffer,
																	  "CrashLabel" => $Crashcode);
			
			S_teststep("EDID $edid ($dataElement) in record $Buffer", 'AUTO_NBR',"read_edid_data_$Buffer\_$edid");				#measurement 1
			
			if ($value=~/0x/)
			{
				my $detectedEDIDvalue = $record_handler -> GetRawEdidDataSamples( "EDIDnr" => $edid,
												   "RecordNumber" => $Buffer,
												   "CrashLabel" => $Crashcode,
												   "FormatOption" => "HEX");
				unless(defined $detectedEDIDvalue) {
					S_set_error("No EDID data found for crash $Crashcode, record $Buffer. EDID cannot not be evaluated. Go to next record",110);
					return;
				}
	
				
				if(ref $detectedEDIDvalue ne 'ARRAY') {
					S_teststep_2nd_level("Read '$edid' ", 'AUTO_NBR',"Read_edid_data_$Buffer\_$edid");
					$edidValue ="0x".$detectedEDIDvalue;
					EVAL_evaluate_value ( "EDID_$edid\_Evaluation", $edidValue,'==',$value );
					S_teststep_expected("EDID_$edid should be value: '$value'", "Read_edid_data_$Buffer\_$edid");
					S_teststep_detected("EDID_$edid is value: '$edidValue'", "Read_edid_data_$Buffer\_$edid");
				}
				else{
					my $dataSample=1;
					my $edidValueHex;
					
					foreach $edidValue (@{$detectedEDIDvalue})
					{
						
					
						S_teststep_2nd_level("Read '$edid' data sample $dataSample", 'AUTO_NBR',"read_edid_data_$Buffer\_$edid\_data_sample_$dataSample");
						$edidValueHex="0x".$edidValue;
						EVAL_evaluate_value ( "EDID_$edid\_Evaluation", $edidValueHex,'==',$value );
						S_teststep_expected("EDID_$edid should be value: '$value'", "read_edid_data_$Buffer\_$edid\_data_sample_$dataSample");
						S_teststep_detected("EDID_$edid is value: '$edidValueHex'", "read_edid_data_$Buffer\_$edid\_data_sample_$dataSample");
						$dataSample++;
						
						
					}
					
				}	
			
			}
		
	}


}

sub Evaluate_DeltaV {
		
	my @CrashInput = @_;
	my $recordNbr = @CrashInput[0];
	my $CrashcodeEDR = @CrashInput[1];
	my $CrashExpected = @CrashInput[2];
	my $CrashcodeTimeZeroThisRecord_ms = @CrashInput[3];
	
	
	# S_w2rep("CrashExpected: '$CrashExpected'", 'blue');
	# S_w2rep("CrashcodeEDR: '$CrashcodeEDR'", 'blue');
	
	my $mappingEDR = S_get_contents_of_hash(['Mapping_EDR']);
	my $extendedMeasurements = lc($mappingEDR -> {'Extended_Measurement'});
    # if(S_get_exec_option_NOERROR ( 'EDR_ExtendedMeasurementsEnabled' )){
        # $extendedMeasurements = 'enabled';
    # }
	my $missingCrashCodes;
	
		my $thisCrashVerdict = 'VERDICT_NONE';


		my $crashCode_MDS = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "CrashCode_MDS", "CrashLabel"  => $CrashExpected );
		$crashCode_MDS = $crashCode_MDS -> {"DataValues"};

		my $path_MDB = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "MDB_Path", "CrashLabel"  => $CrashExpected );
		$path_MDB = $path_MDB -> {"DataValues"};

		S_w2rep("#---------------------------------------------------------------------------------------", 'blue');
		S_w2rep("Evaluate DeltaV for crash '$CrashExpected'", 'blue');
		S_w2log(1, "Crash code: $CrashExpected");
		S_w2log(1, "Result DB path: $path_MDB");
        S_w2rep("#---------------------------------------------------------------------------------------", 'blue');

		#-----------------------------------------------------------------------
		# Get source data
		#-----------------------------------------------------------------------
		S_w2rep("Get source data (label: $tcpar_SourceLabel , coordinate system: $tcpar_CoordinateSystem)");

		my $sourceData = $crash_handler -> GetSourceDataSamples( "SourceLabel" => $tcpar_SourceLabel,
																 "CoordinateSystem" => 'NHTSA', #default is 'NHTSA'
																 "CrashLabel" => $CrashExpected); # contains samplerate, time unit, data samples

		unless(defined $sourceData){
			S_w2rep("No Sensor data obtained from crash handler for $CrashExpected. Go to next crash.", 'red');
			$missingCrashCodes .= $CrashExpected."\n";
			next;
		}
	
		my $sourceSampleRateHz = $crash_handler -> GetSourceSampleRateHz("SourceLabel" => $tcpar_SourceLabel, "CrashLabel"=>$CrashExpected );

        my $sensorDetailsMapping = S_get_contents_of_hash_NOERROR(['Mapping_EDR', 'SensorMapping', "$tcpar_SourceLabel"]);
        my $sensorRange;
        if($sensorDetailsMapping){
            $sensorRange = $sensorDetailsMapping -> {'SensorRange'};
            S_w2rep("Obtained sensor range $sensorRange for sensor $tcpar_SourceLabel.")if(defined $sensorRange);
        }
        #-----------------------------------------------------------------------
        # Get crash time zero
        #-----------------------------------------------------------------------
		my $CrashcodeTimeZero = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "CrashTimeZero",
															        "CrashLabel"  => $CrashExpected );
																	
															
		unless(defined $CrashcodeTimeZero) {
			S_set_error("No crash time zero stored for crash $CrashExpected. No evaluation of sensor RGB possible. Try next crash.", 110);
			next;
		}
		my $CrashcodeTimeZero_ms = $CrashcodeTimeZero -> {"DataValues"};
		my $CrashcodeTimeZeroUnit = $CrashcodeTimeZero -> {"DataUnit"};
		if($CrashcodeTimeZeroUnit ne "ms") {
			S_set_error("Crash Time zero must be stored in ms!! Go to next crash.", 110);
			next;
		}
		S_w2rep("Crash Time Zero: $CrashcodeTimeZero_ms ms");

		#-----------------------------------------------------------------------
		# Get number of expected records
		#-----------------------------------------------------------------------
        my $CrashcodeTimeZero_href = EDR_getCrashTimeZeroPerRecord($CrashcodeTimeZero_ms);
		
        # foreach my $recordNbr (1..$numberOfRecords)
		# {
			S_w2rep("---- Record $recordNbr ----");
			# my $isRecordAvailable = $record_handler -> IsRecordAvailable("CrashLabel" => $CrashcodeEDR, "RecordNumber" => $recordNbr);
			# unless($isRecordAvailable){
                # S_set_error("Record $recordNbr is empty for crash $CrashcodeEDR (NOT EXPECTED). Will not be evaluated.") unless ($main::opt_offline);
			    # next;
			# }
			
			my $dataElement = $record_handler -> GetDataElementEDID( "EDIDnr" => $tcpar_EDID,
                                                            "RecordNumber" => $recordNbr,
                                                            "CrashLabel" => "$CrashcodeEDR");

            S_teststep("Evaluate EDID $tcpar_EDID ($dataElement) in record $recordNbr", 'AUTO_NBR', "Read EDID $tcpar_EDID crash $CrashcodeEDR record $recordNbr");


			S_teststep("T0: $CrashcodeTimeZeroThisRecord_ms ms", 'NO_AUTO_NBR');

			#-----------------------------------------------------------------------
			# Get EDID data
			#-----------------------------------------------------------------------
			if($extendedMeasurements eq 'enabled'){
				$record_handler -> PrintRawEDIDs("CrashLabel" => $CrashcodeEDR, "RecordNumber" => $recordNbr, );
				$record_handler -> PrintDecodedEDIDs("CrashLabel" => $CrashcodeEDR, "RecordNumber" => $recordNbr, );
			}

			S_w2rep("Get EDID data (EDID $tcpar_EDID)");
			my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $CrashcodeEDR, "RecordNumber" =>  $recordNbr,"EDIDnr" => $tcpar_EDID);

			unless(defined $edidData){
                S_set_error("No EDID data (EDID $tcpar_EDID) obtained from record handler for $CrashcodeEDR. Go to next crash.");
                next;
			}

			if($extendedMeasurements eq 'enabled'){
				 S_w2rep("Additional measurement: Sensor data and EDID data in original unit");
				 S_w2rep("Sensor data:");
	 			 EDR_printGraphFromDataSamples($sourceData -> {"DataSamples"}, S_get_TC_number()."_Crash_$CrashExpected\_Record_$recordNbr\_SensorData", "$main::REPORT_PATH/", "Crash_$CrashExpected\_Record_$recordNbr\_Sensor_$tcpar_SourceLabel");
				my $CrashcodeT0 = $CrashcodeTimeZero_href -> {"Record_$recordNbr"};
				S_w2rep("EDID data (shifted by Crash T0 $CrashcodeT0 ms compared to sensor data):");
	 			EDR_printGraphFromDataSamples($edidData -> {"DataSamples"}, S_get_TC_number()."_Crash_$CrashcodeEDR\_Record_$recordNbr\_EDID_$tcpar_EDID", "$main::REPORT_PATH/", "Crash_$CrashcodeEDR\_Record_$recordNbr\_EDID_$tcpar_EDID");
			}

			#-----------------------------------------------------------------------
			# Get start and end time for evaluation (Note: p. 67 and p. 82)
			#-----------------------------------------------------------------------
			S_w2rep("Get recording start and end time");

			# Recording Start Time
			# my $recStartTime_ms = $record_handler -> GetRecStartTimeMillisecEDID("CrashLabel" => $CrashExpected, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID);
			my $recStartTime_ms = 0;
			S_w2rep("Recording start time for EDID: $recStartTime_ms ms");

			# Recording End Time  
			# my $recEndTime_ms = $record_handler -> GetRecEndTimeMillisecEDID("CrashLabel" => $CrashExpected, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID);
			my $recEndTime_ms = 250;
			S_w2rep("Recording end time for EDID: $recEndTime_ms ms");

			my $sensorData_href;
			
			#-----------------------------------------------------------------------
			# Evaluate Delta V EDIDs
			#-----------------------------------------------------------------------
			if(($tcpar_EvalType eq 'DeltaV') or($tcpar_EvalType eq 'DeltaV_Z') or ($tcpar_EvalType eq 'DeltaV_Y'))
			{

				my $graphLabel = "Delta V Eval (EDID $tcpar_EDID, crash $CrashExpected, record $recordNbr)";
				S_w2rep("Start ringbuffer evaluation with sensor $tcpar_SourceLabel and EDID $tcpar_EDID");
				($thisCrashVerdict, $sensorData_href) = EDR_Eval_Ringbuffer_MethodDeltaV (
													"EDID_ID"            => $tcpar_EDID,
													"EDID_DataSamples"   => $edidData -> {"DataSamples"},
													"EDID_DataUnit"      => $edidData -> {"ValueUnit"},
													"EDID_SampleRateHz"  => $edidData -> {"SampleRateHz"},
													"Sensor_DataSamples" => $sourceData -> {"DataSamples"},
													"Sensor_DataUnit"    => $sourceData -> {"DataUnit"},
													"Absolute_Tolerance" => $tcpar_EvalTolerance_abs,
													"CompareDataUnit"    => $tcpar_EvalUnit,
													"Rec_Start_Time_ms"  => $recStartTime_ms,
													"Rec_End_Time_ms"    => $recEndTime_ms,
													"Crash_TimeZero_s"   => $CrashcodeTimeZeroThisRecord_ms * MILLISEC_TO_SECOND,
													"GraphLabel"	=> $graphLabel,
													"Sensor_Range" => $sensorRange,
												  );
			}
			
			#-----------------------------------------------------------------------
			# No evaluation routine defined - next EDID
			#-----------------------------------------------------------------------
			else{
				S_set_error("No evaluation routine defined for evaluation type '$tcpar_EvalType'");
				return 1;
			}

			S_teststep_expected("All ringbuffer values (EDID $tcpar_EDID) within absolute tolerance $tcpar_EvalTolerance_abs $tcpar_EvalUnit of sensor data for $CrashExpected", "Read EDID $tcpar_EDID crash $CrashcodeEDR record $recordNbr");
			S_teststep_detected("All ringbuffer values (EDID $tcpar_EDID) within absolute tolerance $tcpar_EvalTolerance_abs $tcpar_EvalUnit of sensor data for $CrashExpected", "Read EDID $tcpar_EDID crash $CrashcodeEDR record $recordNbr") if ($thisCrashVerdict eq 'VERDICT_PASS');
			S_teststep_detected("Not all ringbuffer values (EDID $tcpar_EDID) within absolute tolerance $tcpar_EvalTolerance_abs $tcpar_EvalUnit of sensor data for $CrashExpected", "Read EDID $tcpar_EDID crash $CrashcodeEDR record $recordNbr") if ( $thisCrashVerdict eq 'VERDICT_FAIL');

			if(S_get_exec_option_NOERROR('CreisOfflineEvalReporting')){
				my $edidDataString;
				my $nbrOfEdidDataSamples = 0;
				foreach my $edidDataSample(sort {$a <=> $b} keys %{$edidData -> {"DataSamples"}}){
					if(not defined $edidDataString){
						$edidDataString = $edidData -> {"DataSamples"} -> {$edidDataSample};
					}
					else{
						$edidDataString .= " ".$edidData -> {"DataSamples"} -> {$edidDataSample};
					}
					$nbrOfEdidDataSamples++;
				}
				my $description = $record_handler -> GetDataElementEDID("CrashLabel" => $CrashcodeEDR,
																		"RecordNumber" =>  $recordNbr,
																		"EDIDnr" => $tcpar_EDID);

				my $sensorDataString;
				my $nbrOfSensorDataSamples = 0;
				foreach my $timeStamp (sort {$a <=> $b} keys %{$sensorData_href}){
					if(not defined $sensorDataString){
						$sensorDataString = $sensorData_href -> {$timeStamp};
					}
					else{
						$sensorDataString .= " ".$sensorData_href -> {$timeStamp};
					}
					$nbrOfSensorDataSamples ++;
					last if($nbrOfSensorDataSamples == $nbrOfEdidDataSamples);
				}

				FLEDR_XML_addDynamicEdidNode(
						$recordNbr, # record number
						'SensorData',
						$tcpar_EDID,
						$description,
						$sensorDataString, # <TODO> Sensor data
						$edidDataString,
						$tcpar_EvalTolerance_abs,
						$edidData -> {"ValueUnit"},
						$recStartTime_ms,
						$recEndTime_ms,
						$edidData -> {"SampleRateHz"},
						$thisCrashVerdict,
				);
		    }
			#next record
		# }
		# next crash
		
    if($missingCrashCodes and not S_get_exec_option_NOERROR('OfflineReportValidation')){
        S_set_error("Following crash codes were not available in record / crash handler and could not be evaluated:\n".
                      $missingCrashCodes.
                      "Inject all required crashes before running this test case.", 110) unless ($main::opt_offline);
    }
	
	return 1;
}

sub Complete_Recored{
	
	my $Buffer = shift;
	my $Crashcode = shift;
	my %CrashData = @_;
	# S_w2rep ("buffer: $Buffer \n");
	
	# --------------------------------------------------------------
	# COMLPLE FILE RECORDED
	# --------------------------------------------------------------
	
	
	foreach my $edid ( keys %CrashData )
	{
		
		my $expectedRecordStatus = $CrashData{$edid};
		S_w2rep ("$edid : $expectedRecordStatus\n");
	
		
		
			my $detectedvalue = $record_handler -> GetRawEDID( "EDIDnr" => $edid,
															   "RecordNumber" =>$Buffer,
															   "CrashLabel" => $Crashcode,
																"FormatOption" => "HEX");
			$detectedvalue="0x".$detectedvalue;													
			# S_w2rep("Detected value of EDID '$edid' is '$detectedvalue' ");
			
			my $dataElement = $record_handler -> GetDataElementEDID(  "EDIDnr" => $edid,
																	  "RecordNumber" => $Buffer,
																	  "CrashLabel" => $Crashcode);
			S_teststep("Validate EDID_$edid ($dataElement) value in EDR record $Buffer", 'AUTO_NBR', "compare_completefileRecorded_TS_expected\_Record_$Buffer");

			# my $expectedRecordStatus = $tcpar_StorageStatus_Records -> {"Record_$currentRecordNbr"};
				
			EVAL_evaluate_value("EDID_$edid\_Record_$Buffer", $detectedvalue,'==', $expectedRecordStatus);
			
			S_teststep_expected("EDID $edid record $Buffer expected: $expectedRecordStatus", "compare_completefileRecorded_TS_expected\_Record_$Buffer");
			S_teststep_detected("EDID $edid record $Buffer detected: $detectedvalue", "compare_completefileRecorded_TS_expected\_Record_$Buffer");
	
	}
	return 1;

}

#Ham de chay  _reqres_key()
sub _reqres_key{
	my $sub_res;
	my $sub_response;
	my @Sub_arrResponse;
	CA_set_EnvVar_value('Security03', 1);
	S_wait_ms(1000);
	$sub_res = CA_get_EnvVar_value('EvRxMesgBox');
	for (my $i = 0; $i< @$sub_res; $i++){
		@Sub_arrResponse[$i] = @$sub_res[$i];
	}
	$sub_response = '';
	for(my $i=0;$i<@Sub_arrResponse;$i++)
	{
		$Sub_arrResponse[$i] = S_dec2hex($Sub_arrResponse[$i]);			
		$sub_response = $sub_response .$Sub_arrResponse[$i] ;
		if ( $i < ( @Sub_arrResponse - 1 ))
		{
			$sub_response = $sub_response . ' ';
		}
	}
	return $sub_response;
}

sub Prepertation{
	S_teststep("Send request to enter extended session.", 'AUTO_NBR');			#measurement 1
	GDCOM_request_general( 'REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession', 'relax' );
	S_wait_ms(100);
	
	#Security
	S_teststep("Send request to access security level2.", 'AUTO_NBR');			#measurement 2
	my $res_key2 = _reqres_key();
	# S_teststep_expected("Positive response is observed.", 'send_request_to_C');			#evaluation 2
	# S_teststep_detected("Security response should be $res_key1", 'send_request_to_C');
	my @reskey2 = split(/ /,$res_key2);
	EVAL_evaluate_value("Checking value of byte 1", @reskey2[0],'==',0x67);
	EVAL_evaluate_value("Checking value of byte 2", @reskey2[1],'==',0x4);
	CA_set_EnvVar_value('Security03', 0);
	S_wait_ms(1000);
}

1;
