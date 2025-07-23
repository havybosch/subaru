#### TEST CASE MODULE
package TC_OEMEDID_FHIfilerecorded;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_OEMEDID_FHIfilerecorded.pm 1.1 2019/07/05 06:59:13ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS_EDID_GenericEDIDList> 
#TS version in DOORS: <1.2> 
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here
use LIFT_crash_simulation;
use LIFT_PD;
use GENERIC_DCOM;
use LIFT_can_access;
use LIFT_labcar;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use FuncLib_SYC_INTERFACE;
use FuncLib_EDR_Framework;
use Data::Dumper;

##################################

our $PURPOSE = "<This script validates Complete File Record Reported in EDR based on the mandatory data stored in EDR>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_OEMEDID_FHIfilerecorded

=head1 PURPOSE

<validates Complete File Record Reported in EDR based on the mandatory data stored in EDR>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1.Power Off if <PowerOffCondition> is ‘BeforeCrash’

2.wait for <Wait_time_msec1>

3.Inject the <Crashcode> with <Crash_TimeZero_msec>

4.wait for <Wait_time_msec2>

5.Power Off if <PowerOffCondition> is ‘AfterCrash’

6.Create <PowerOffCondition> if <PowerOffCondition> exists

7.wait for 6 seconds till EDR data is stored.

8.Read the <EDID>  in all Recorders


I<B<Evaluation>>

1.-

2.

3. 

4.

5.

6.

7.

8. 

a.

<EDID> should have '0xA5' if record is incomplete and if All Mandatory data should be Reported with corresponding crash data are not reported.

<EDID> should have '0x5A' if record is complete if All Mandatory data should be Reported with corresponding crash data.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Crashcode' => 
	SCALAR 'Crash_TimeZero_msec' => 
	SCALAR 'purpose' => 
	SCALAR 'EDID' => 
	SCALAR 'PowerOffCondition' => 
	SCALAR 'PowerONCondition' => 
	SCALAR 'TimeBeforePowerOffAfterCrash' => 
	SCALAR 'TimeBeforePowerOnAfterCrash' => 
	HASH 'COMsignalsAfterCrash' => 
	HASH 'PD_PowerOnCounter_Variable' => 
	HASH 'General_MandEDIDs' => 
	HASH 'COM_RGB_MandEDIDs' => 
	HASH 'FireTime_MandEDIDs' =>
	SCALAR 'expected_NotCompletelystored' => 
	SCALAR 'expected_Completelystored' => 
	SCALAR 'DiagType' =>
	SCALAR 'ResultDB' =>
	SCALAR 'Switch_state' =>


=head2 PARAMETER EXAMPLES

	purpose		 = 'To validate Complete File Record Reported in EDR'
	
	PowerOffCondition = 'BeforeCrash'
	PowerONCondition = 'PowerON'
	Crashcode = 'Multi_EDR_Side_ND_Front_AD'
	Crash_TimeZero_msec = '139.76_186.76'
	TimeBeforePowerOffAfterCrash = '0'
	TimeBeforePowerOnAfterCrash = '6000'
	# From here on: applicable Lift Default Parameters
	purpose		 = 'To validate Complete File Record Reported in EDR'
	EDID = '1000'
	DiagType  = 'ProdDiag' 
	ResultDB = 'EDR'
	COMsignalsAfterCrash = %()
	PD_PowerOnCounter_Variable = %('VariableName' => 'rb_tim_EcuOnTimeDataCopyEe_st.POnCounter_u32', 'VariableType' => 'U32')
	Switch_MandEDIDs = %('71' => 'BLFD', '72' => 'SPSFD', '76' => 'PADS1', '77' => 'BLFP', '78' => 'SPSFP')
	Switch_state = 'PositionB'
	General_MandEDIDs =%('45'=> 'MultiEventNumber', '48' => 'TimeFromInitialToCurrent', '75' => 'AWL_Status', '1001' => 'IgnitionCycleEvent', '1002' => 'IgnitionCycleDownload')
	FireTime_MandEDIDs = %('51' => 'AB1FD', '56' => 'AB1FP', '52' => 'AB2FD', '53' => 'AB3FD', '54' => 'AB2FD', '55' => 'AB3FD', '57' => 'AB2FP', '58' => 'AB3FP', '59' => 'AB2FP', '60' => 'AB3FP', '61' => 'SA1FD', '62' => 'IC1FD', '63' => 'BT1FD', '65' => 'SA1FP', '66' => 'IC1FP', '67' => 'BT1FP')
	COM_RGB_MandEDIDs = %('91' => 'Speed_vehicle_indicated', '94' => 'Steering_Input', '93' => 'Engine_RPM', '96' => 'ABS_activity', '97' => 'Stability_Control', '22' => 'LateralAccHighRange', '23' => 'LongitudinalAcceHighRange', '24' => 'LongitudinalAccelowRange', '25' => 'NormalAcc', '27' => 'VehicleRollAngle', '31' => 'DVLongitudinal', '32' => 'DVLateral', '33' => 'MaxDVLongitudinal', '34' => 'MaxDVLateral', '35' => 'TimeMaxDVLongitudinal', '36' => 'TimeMaxDVLateral', '37' => 'TimeMaxDVResultant')
	expected_Completelystored =  '0x5A' #Mandatory storage Completed Successfully
	expected_NotCompletelystored =  '0xA5' #Mandatory storage not Completed Successfully

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_PowerOffCondition;
my $tcpar_PowerONCondition;
my $tcpar_TimeBeforePowerOffAfterCrash;
my $tcpar_TimeBeforePowerOnAfterCrash;
my $tcpar_COMsignalsAfterCrash;
my $tcpar_Crashcode;
my $tcpar_Crash_TimeZero_msec;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_Switch_MandEDIDs;
my $edrNumberOfEventsToBeStored ;
my $tcpar_FireTime_MandEDIDs;
my $tcpar_General_MandEDIDs;
my $tcpar_com_RGB_MandEDIDs;
my $tcpar_Switch_state;
my $storageOrder;
my $tcpar_PD_PowerOnCounter_Variable;
my $tcpar_expected_Completelystored;
my $tcpar_expected_NotCompletelystored;
my $tcpar_StorageStatus_Records;
my $tcpar_MandatoryDataStoredForIncident;

################ global parameter declaration ###################
#add any global variables here
my ($record_handler, $crashSettings, $expectedRawValues_href, $allSwitchStatesDuringCrash_href);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  S_read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDID =  S_read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_PowerOffCondition =  S_read_mandatory_testcase_parameter( 'PowerOffCondition' );
	$tcpar_PowerONCondition =  S_read_mandatory_testcase_parameter( 'PowerONCondition' );
	$tcpar_DiagType =  S_read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  S_read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_TimeBeforePowerOffAfterCrash =  S_read_mandatory_testcase_parameter( 'TimeBeforePowerOffAfterCrash' );
	$tcpar_TimeBeforePowerOnAfterCrash =  S_read_mandatory_testcase_parameter( 'TimeBeforePowerOnAfterCrash' );
    $tcpar_MandatoryDataStoredForIncident = S_read_optional_testcase_parameter( 'MandatoryDataStoredForIncident' );
    if(not defined $tcpar_MandatoryDataStoredForIncident){
        S_set_warning("Setting incident number where mandatory data must be stored to 1 (default)");
        $tcpar_MandatoryDataStoredForIncident = 1;
    }
	$tcpar_COMsignalsAfterCrash =  S_read_mandatory_testcase_parameter( 'COMsignalsAfterCrash','byref');
	$tcpar_Crashcode =  S_read_mandatory_testcase_parameter( 'Crashcode' );
	$tcpar_Crash_TimeZero_msec =  S_read_mandatory_testcase_parameter( 'Crash_TimeZero_msec' );
	$tcpar_Switch_MandEDIDs = S_read_mandatory_testcase_parameter( 'Switch_MandEDIDs', 'byref' );
	$tcpar_General_MandEDIDs = S_read_mandatory_testcase_parameter( 'General_MandEDIDs', 'byref' );
	$tcpar_FireTime_MandEDIDs = S_read_mandatory_testcase_parameter( 'FireTime_MandEDIDs', 'byref' );
	$tcpar_com_RGB_MandEDIDs = S_read_mandatory_testcase_parameter( 'COM_RGB_MandEDIDs', 'byref' );
	$tcpar_Switch_state = S_read_mandatory_testcase_parameter( 'Switch_state');
	$tcpar_PD_PowerOnCounter_Variable = S_read_mandatory_testcase_parameter( 'PD_PowerOnCounter_Variable',  'byref');
	$tcpar_expected_Completelystored = S_read_mandatory_testcase_parameter( 'expected_Completelystored');
	$tcpar_expected_NotCompletelystored = S_read_mandatory_testcase_parameter( 'expected_NotCompletelystored');
	$tcpar_StorageStatus_Records = S_read_mandatory_testcase_parameter( 'StorageStatus_Records', 'byref');

	return 1;
}

sub TC_initialization {

	S_w2rep("StandardPrepNoFault");
	S_w2rep("Initialize Record Handler");
	$record_handler = EDR_init_RecordHandler();

	S_teststep("Start CAN Trace", 'AUTO_NBR');
    CA_trace_start();
    GDCOM_init();

	S_w2log(1, "Power on ECU");
    LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');

	PD_ClearCrashRecorder_NOERROR();
	S_wait_ms(2000);

	S_w2log(1, "Clear fault memory");
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	#--------------------------------------------------------------
    # CRASH PREPARATION
	S_w2log(1, "Prepare crash" );

    # PREPARE CRASH AND INITIALIZE EQUIPMENT
	S_w2rep("Get crash settings for crash $tcpar_Crashcode");
    my $crashDetails_href = {"RESULTDB" => $tcpar_ResultDB, 'CRASHNAME'=> $tcpar_Crashcode};
	$crashSettings = CSI_GetCrashDataFromMDS($crashDetails_href);
	unless($crashSettings) {
		S_set_error("Crashcode '$tcpar_Crashcode' not available in given Result DB. Abort test case.");
		return;
	}

	my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$tcpar_ResultDB" ] );
	my $resultDB_Path = $resultDBDetails->{'PATH'};
	S_w2log(1, "Crashcode: $tcpar_Crashcode, ResultDB: $tcpar_ResultDB (path: $resultDB_Path)");
    S_w2log(1, "Set environments for crash as per result DB");
    CSI_PrepareEnvironment($crashSettings, 'init_complete');

	# Get expected switch states
	my $crashRawSignals = MDSRESULT_GetCrashDetails( $crashDetails_href, NO_FILTERING | NO_ROTATION );	# will return sensor signals with real physical values
	foreach my $environmentDevice (keys %{$crashRawSignals -> {'ENVIRONMENT'}})
	{
		next unless $environmentDevice =~ /^Switch_/; # only switches will be regarded

		# Get switch name
		$environmentDevice =~ m/Switch_(.*)_State/;
		my $switch = $1;
		next unless (defined $switch);

		# Get MDS state and configuration status
		my $switchStateMDS = $crashRawSignals -> {'ENVIRONMENT'} -> {"Switch_$switch\_State"};
		my $switchConfigured = $crashRawSignals -> {'ENVIRONMENT'} -> {"Switch_$switch\_Configured"};
		
		# Map MDS state to physical state
		my $switchStatePhysical;		
		if($switchStateMDS == 0) {
			S_w2log(4, "Switch $switch in PositionA (state 0)", 'AUTO_NBR');
			$switchStatePhysical = 'PositionA';
		} 
		elsif ($switchStateMDS == 1) {
			$switchStatePhysical = 'PositionB';
			S_w2log(4, "Switch $switch in PositionB (state 1)");
		}
		elsif ($switchStateMDS == 2) {
			$switchStatePhysical = 'Undefined';
			S_w2log(4, "Switch $switch is Undefined (state 2)");
		}
		elsif ($switchStateMDS == 3) {
			$switchStatePhysical = 'Openline';
			S_w2log(4, "Switch $switch is not connected (state 3)");
		}
		else {
			S_w2rep("Switch state will be set to 'n/a'.State $switchStateMDS is not known.", 'AUTO_NBR');
			$switchStatePhysical = 'n/a';
		}

		# Store obtained information
		$allSwitchStatesDuringCrash_href -> {$switch}-> {"State"} = $switchStatePhysical;
		$allSwitchStatesDuringCrash_href -> {$switch}-> {"MDS_State"} = $switchStateMDS;
		$allSwitchStatesDuringCrash_href -> {$switch}-> {"Configured"} = $switchConfigured;
		
	}
	
	$tcpar_Crashcode .= "PowerOff_$tcpar_PowerOffCondition";

	S_w2log(1, "Power off ECU");
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_READY');

	#Prepare crash
	S_w2log(1, "Prepare crash");
	CSI_LoadCrashSensorData2Simulator($crashSettings);

	S_w2log(1, "Power on ECU");
    LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');

	S_w2log(1, "Read fault memory before stimulation");
	my $faultsBeforeStimulation = PD_ReadFaultMemory();
    # my $faultsVerdict = PD_evaluate_faults_NOVERDICT( $faultsBeforeStimulation, []);
    # return 0 unless ($faultsVerdict eq 'VERDICT_PASS');

	return 1;
}

sub TC_stimulation_and_measurement {

    S_teststep("Start recording of fire times in LCT.", 'AUTO_NBR');
    LC_MeasureTraceDigitalStart();

	# Read power on cycle for evaluation
	my $powerOnCounterCrash = PD_ReadMemoryByName($tcpar_PD_PowerOnCounter_Variable -> {"VariableName"});
    $powerOnCounterCrash = S_aref2hex ( $powerOnCounterCrash, $tcpar_PD_PowerOnCounter_Variable -> {"VariableType"} );
	my @powerOnCounter_array = split(/0x/, $powerOnCounterCrash);
	$powerOnCounterCrash  = $powerOnCounter_array[1];
	$powerOnCounterCrash = "0x".$powerOnCounterCrash;
	$expectedRawValues_href -> {'IgnitionCycleEvent'} = {"Record_1" => $powerOnCounterCrash, "Record_2" => $powerOnCounterCrash};
	# $expectedRawValues_href -> {'IgnitionCycleDownload'} = {"Record_1" => $powerOnCounterCrash, "Record_2" => $powerOnCounterCrash};

	if($tcpar_PowerOffCondition eq 'BeforeCrash'){
		S_teststep("Power OFF '$tcpar_PowerOffCondition' ", 'AUTO_NBR');
		S_w2log(1, "Power OFF ECU");
		LC_ECU_Off();
		# S_wait_ms(500);
	}

	S_teststep("Inject the crash '$tcpar_Crashcode' ", 'AUTO_NBR');
	CSI_TriggerCrash();

	if ($tcpar_PowerOffCondition eq 'AfterCrash'){
		S_teststep("wait for '$tcpar_TimeBeforePowerOffAfterCrash'", 'AUTO_NBR');
		S_wait_ms($tcpar_TimeBeforePowerOffAfterCrash);
		S_teststep("Power OFF  '$tcpar_PowerOffCondition'", 'AUTO_NBR');
		S_w2log(1, "Power OFF ECU");
		LC_ECU_Off();
		
	}

	if(($tcpar_PowerONCondition eq 'PowerON') and ($tcpar_PowerOffCondition ne 'None')){
		S_teststep("wait for '$tcpar_TimeBeforePowerOnAfterCrash'", 'AUTO_NBR');
		S_wait_ms($tcpar_TimeBeforePowerOnAfterCrash);
		S_teststep("Create '$tcpar_PowerONCondition' on ECU", 'AUTO_NBR');
		S_w2log(1, "Power ON ECU");
		LC_ECU_On();
	}
	
	if (defined $tcpar_COMsignalsAfterCrash){
        foreach my $signal (keys %{$tcpar_COMsignalsAfterCrash})
        {
            my $dataOnCOM = $tcpar_COMsignalsAfterCrash -> {$signal};
            S_w2rep("Signal =$signal,Data to be sent=$dataOnCOM");
            COM_setSignalState($signal,$dataOnCOM);
        }
    }

	S_teststep("wait for 6 seconds till EDR data is stored.", 'AUTO_NBR');
	S_wait_ms(6000);

    S_teststep("Stop recording of fire times in LCT.", 'AUTO_NBR');
    LC_MeasureTraceDigitalStop();

    S_teststep("Read fault memory after crash injection", 'AUTO_NBR');
	PD_ReadFaultMemory();


    # Read all EDR records supported for the project
	my $dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number()."_".$tcpar_Crashcode;
	$edrNumberOfEventsToBeStored = 2;
	S_teststep("Read the EDID '$tcpar_EDID'  in all '$edrNumberOfEventsToBeStored' EDR Records", 'AUTO_NBR');
    PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');
	EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								 	"CrashLabel" => $tcpar_Crashcode,
								 	"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								 	"StoragePath" => $dataStoragePath,
								 	);

	# Fire time measurement
	S_w2rep("Get measured squib fire values by calling LC_MeasureTraceDigitalGetValues()");
	my $lctData = LC_MeasureTraceDigitalGetValues();
	EVAL_dump2UNV( $lctData, "$dataStoragePath/LCT_Measurement.txt.unv" );
	my $squibLabels_aref;
	if($tcpar_FireTime_MandEDIDs){
        foreach my $lctEDID (keys %{$tcpar_FireTime_MandEDIDs})
        {
            push(@{$squibLabels_aref}, $tcpar_FireTime_MandEDIDs -> {$lctEDID});
        }	    
	}
    else {
        foreach my $time ( sort { $a <=> $b } keys %$lctData )
        {
            foreach my $squibLabel (keys %{$lctData->{$time}})
            {
                push(@{$squibLabels_aref}, $squibLabel);
            }
            last;
        }        
    }

	EDR_addFireTimesToCrashHandler ("LCT_Measurement" => $lctData,
									"SquibLabels" => $squibLabels_aref,
									"CrashLabel"  => $tcpar_Crashcode,
									"StoragePath" => $dataStoragePath) if(defined $squibLabels_aref);
	return 1;
}

sub TC_evaluation {

	my $allMandatoryDataStored = 'NONE';
	my $verdict = 'VERDICT_PASS';
	my $detectedEDIDvalue;
	#--------------------------------------------------------------
    # RECORD TO BE READ and EVALUATED
    #
	S_w2rep("");
	S_w2rep("--------------------------------------------------------", 'purple');
	S_w2rep("RECORD TO BE READ and EVALUATED", 'purple');

	#Detect number of crash records in EDR.
	my $detectedNbrOfStoredRecords = 0;
	foreach my $recordNumber(1..$edrNumberOfEventsToBeStored)
	{
		my $recordAvailable = $record_handler -> IsRecordAvailable("CrashLabel" => $tcpar_Crashcode, "RecordNumber"=> $recordNumber);
		$detectedNbrOfStoredRecords++ if ($recordAvailable);
	}
	S_w2rep("Detected number of stored records is $detectedNbrOfStoredRecords");
    
    my $verdictMandatoryComplete = 1;
    if($tcpar_PowerOffCondition eq 'BeforeCrash'){
        S_w2rep("Power was turned off before crash, therefore it is acceptable if not all mandatory data is stored.\n");
        S_w2rep("Verdict shall be set at the end after reading the EDR completeness status.\n");
        $verdictMandatoryComplete = 0;
    }

	# Assign expected values according to StorageOrder
    my $storageOrder = EDR_getStorageOrder ();
    return unless(defined $storageOrder);

	if($storageOrder eq 'PhysicalOrder'){
       $storageOrder =  'MostRecentLast'; #same behavior as there is no overwriting
    }

	#Based on available records and storage order the record number will be identified and first crash data will be read
	my @recordsToEvaluate;
	my $record_incident_mapping;
	if($detectedNbrOfStoredRecords == 0) {
        S_teststep("Read EDID_$tcpar_EDID value in EDR record 1", 'AUTO_NBR', 'compare_completefileRecorded_edids');
		if($tcpar_PowerOffCondition eq 'BeforeCrash'){
			S_w2rep("EDR crash recorder is empty as Crash is injected after creating Autarky, Expected behaviour is acceptable, no Evaluation is done");
			S_teststep_expected("EDID $tcpar_EDID record 1 expected: Empty Record", "compare_completefileRecorded_edids");
			S_teststep_detected("EDID $tcpar_EDID record 1 detected: Empty Record", "compare_completefileRecorded_edids");
			S_set_verdict ('VERDICT_PASS' );

		}
		else {
            S_teststep_expected("EDID $tcpar_EDID record 1 expected: Mandatory Data Complete", "compare_completefileRecorded_edids");
            S_teststep_detected("EDID $tcpar_EDID record 1 detected: Empty Record", "compare_completefileRecorded_edids");
            S_set_verdict ('VERDICT_FAIL' );		    
		}
        return 1;
	}
	elsif($detectedNbrOfStoredRecords == 1){
		 push(@recordsToEvaluate, 1);
		 $record_incident_mapping -> {"Record_1"} = $tcpar_MandatoryDataStoredForIncident;
	}
	
	elsif($detectedNbrOfStoredRecords == 2){
		my $expectedRecordStatus = $tcpar_StorageStatus_Records -> {"Record_1"};
		unless($expectedRecordStatus) {
			S_set_verdict('VERDICT_FAIL');
			S_teststep("Check whether correct number of records is stored.", 'AUTO_NBR', 'compare_completefileRecorded_edids');
			S_w2rep("Record 1 detected but no expected status given in parameter 'StorageStatus_Records' for 'Record_1'.");
			S_teststep_expected("Record 1 not stored", "compare_completefileRecorded_edids");
			S_teststep_detected("Record 1 is stored", "compare_completefileRecorded_edids");
			return 1;
		}
		$expectedRecordStatus = $tcpar_StorageStatus_Records -> {"Record_2"};
		unless($expectedRecordStatus) {
			S_set_verdict('VERDICT_FAIL');
			S_teststep("Check whether correct number of records is stored.", 'AUTO_NBR', 'compare_completefileRecorded_edids');
			S_w2rep("Record 2 detected but no expected status given in parameter 'StorageStatus_Records' for 'Record_2'.");
			S_teststep_expected("Record 2 not stored", "compare_completefileRecorded_edids");
			S_teststep_detected("Record 2 is stored", "compare_completefileRecorded_edids");
			return 1;
		}
		push(@recordsToEvaluate, 1);
		push(@recordsToEvaluate, 2);
         $record_incident_mapping -> {"Record_1"} = 1 if($storageOrder eq 'MostRecentLast');
         $record_incident_mapping -> {"Record_2"} = 2 if($storageOrder eq 'MostRecentLast');
         $record_incident_mapping -> {"Record_1"} = 2 if($storageOrder eq 'MostRecentFirst');
         $record_incident_mapping -> {"Record_2"} = 1 if($storageOrder eq 'MostRecentFirst');
	}
	
	foreach my $recordNumber(@recordsToEvaluate)
	{	
		S_w2rep("");
		S_w2rep("");
		S_w2rep("--- Read EDR data in Record number $recordNumber ---"); #evaluation 1
	
		#--------------------------------------------------------------	
		#--------------------------------------------------------------
		# FIRE TIMES
		#
		if($tcpar_FireTime_MandEDIDs){
            S_w2rep("--------------------------------------------------------", 'purple');
            S_w2rep("DEPLOYMENT TIMES", 'purple');
            S_w2rep("--------------------------------------------------------", 'purple');
            my $autarky;
            $autarky = 'true' if($tcpar_PowerOffCondition ne 'None');
            my $incidentNumber = $record_incident_mapping -> {"Record_$recordNumber"};
            S_teststep("Check whether measured deployment times for incident $incidentNumber match the stored deployment times in record $recordNumber.", 'AUTO_NBR',"compare_deployment_edids_Record_$recordNumber");#measurement 2
            my ($squibverdict, $allResults_href) = EDR_Eval_SquibFireTimes_NOVERDICT("CrashLabel" => $tcpar_Crashcode,
                                                       "EDID_SquibLabels" => $tcpar_FireTime_MandEDIDs,
                                                       "CrashTimeZero_ms" => $tcpar_Crash_TimeZero_msec,
                                                       "FireTimeTolerance_ms" => 3,
                                                       "Autarky" => $autarky,
                                                       "MultiEventIncidentNumber" => $incidentNumber,
                                                       "RecordNumber" => $recordNumber);
            
            S_w2rep("Deployment verdict: $squibverdict");
            $allMandatoryDataStored = 'PASS' if (($allMandatoryDataStored eq 'PASS') and ($squibverdict eq 'VERDICT_PASS'));
            $allMandatoryDataStored = 'FAIL' if ($squibverdict eq 'VERDICT_FAIL');		    
		}
	
		#--------------------------------------------------------------
		# COM SIGNALs and SENSOR RGB DATA(NON Default value)
		#
		S_w2rep("");
		S_w2rep("--------------------------------------------------------", 'purple');
		S_w2rep("NON DEFAULT DATA DATA", 'purple');
		$verdict = 'VERDICT_PASS';
		my $edidHash_href = FuncLib_TNT_EDR::EDR_ReadEDR_Record_structure_info_from_mapping();
		foreach  my $com_RGB_EDID (keys %{$tcpar_com_RGB_MandEDIDs})
		{
			my $defaultValue = 'FF';
			my $dataElement = $record_handler -> GetDataElementEDID( "EDIDnr" => $com_RGB_EDID, "RecordNumber" => $recordNumber,
																  "CrashLabel" => $tcpar_Crashcode);
			unless ($dataElement){
			    S_set_error("EDID $com_RGB_EDID not available in record $recordNumber");
			    next;
			}

            S_teststep("Check EDID $com_RGB_EDID ($dataElement) has non default value in record $recordNumber",
                         'AUTO_NBR',
                         "compare_COM_SensorRGB_EDID_$com_RGB_EDID\_Record_$recordNumber");

            S_w2log(1, "Get EDID $com_RGB_EDID data for Record $recordNumber");
            my $detectedEDIDvalue = $record_handler -> GetRawEDID( "EDIDnr" => $com_RGB_EDID,
                                                   "RecordNumber" => $recordNumber,
                                                   "CrashLabel" => $tcpar_Crashcode,
                                                   "FormatOption" => "HEX");
    
            unless(defined $detectedEDIDvalue) {
                S_set_error("No data could be obtained for EDID $com_RGB_EDID.");
                next;
            }
            
            my $bytesPerDataSample = $edidHash_href -> {'EDIDS'} -> {$com_RGB_EDID} -> {'BytesPerDataSample'};
            unless(defined $bytesPerDataSample){
                S_set_warning("No bytes per data sample obtained for EDID $com_RGB_EDID in EDR mapping. Will be set to default '1'");
                $bytesPerDataSample = 1;
            }            
            
            if(ref $detectedEDIDvalue eq 'ARRAY') {
                my $dataSample = 1;
                my $numberOfValues = @{$detectedEDIDvalue};
                my $numberOfDataSamples = $numberOfValues / $bytesPerDataSample;
                S_w2log(2, "EDID $com_RGB_EDID number of samples total: $numberOfDataSamples\n");
                if($numberOfDataSamples > 1){
                    # Get number of data samples based on recording start time and sample rate Hz - only until 300ms
                    my $recStartTime_ms = $record_handler -> GetRecStartTimeMillisecEDID(  "EDIDnr" => $com_RGB_EDID, 
                                                                                            "RecordNumber" => $recordNumber,
                                                                                           "CrashLabel" => $tcpar_Crashcode);
                    my $sampleRate_Hz = $record_handler -> Get_EDID_SampleRateHz(  "EDIDnr" => $com_RGB_EDID,
                                                                                           "RecordNumber" => $recordNumber,
                                                                                           "CrashLabel" => $tcpar_Crashcode);
                    my $sampleTime_ms = (1/$sampleRate_Hz) * 1000;
                    my $numberOfSamplesTo300 = ((300 - $recStartTime_ms) / $sampleTime_ms) + 1;
                    $numberOfDataSamples = $numberOfSamplesTo300 if($numberOfSamplesTo300 < $numberOfDataSamples);
                    S_w2log(2, "EDID $com_RGB_EDID number of samples until 300ms: $numberOfDataSamples\n");                    
                }
          
                my $byteIndex = 0;
                my $nonDefaultValueAdapted = 0;
                my $adaptedDefaultValue;
                foreach my $dataSample (1..$numberOfDataSamples)
                {
                    my $thisDataSampleValue;
                    foreach my $byteInSample (1..$bytesPerDataSample)
                    {
                        $thisDataSampleValue .= $detectedEDIDvalue -> [$byteIndex];
                        $byteIndex ++;
                        $adaptedDefaultValue .= $defaultValue if($nonDefaultValueAdapted == 0);
                    }
                    $nonDefaultValueAdapted = 1 if(defined $adaptedDefaultValue); #only first time
                    S_teststep_2nd_level("EDID $com_RGB_EDID, data sample $dataSample", 'AUTO_NBR', "EDID_$com_RGB_EDID\_Record_$recordNumber\_sample_$dataSample");
                    my $thisVerdict = EVAL_evaluate_string_NOVERDICT ( "EDID_$com_RGB_EDID\_Evaluation_$dataSample", $adaptedDefaultValue, $thisDataSampleValue, '!=');
                    $verdict = 'VERDICT_FAIL' if($thisVerdict eq 'VERDICT_FAIL');
                    S_teststep_expected(" != $nonDefaultValueAdapted", "EDID_$com_RGB_EDID\_Record_$recordNumber\_sample_$dataSample");
                    S_teststep_detected("$thisDataSampleValue", "EDID_$com_RGB_EDID\_Record_$recordNumber\_sample_$dataSample");                   
                }
            }
            else {
                my $thisVerdict = EVAL_evaluate_string_NOVERDICT ( "EDID_$com_RGB_EDID\_Evaluation", $defaultValue, $detectedEDIDvalue, '!=');
                $verdict = 'VERDICT_FAIL' if($thisVerdict eq 'VERDICT_FAIL');
                S_teststep_expected(" != $defaultValue", "compare_COM_SensorRGB_EDID_$com_RGB_EDID\_Record_$recordNumber");
                S_teststep_detected("$detectedEDIDvalue", "compare_COM_SensorRGB_EDID_$com_RGB_EDID\_Record_$recordNumber");
            }
		}
	
		S_w2rep("COM and RGB verdict: $verdict");
		$allMandatoryDataStored = 'PASS' if (($allMandatoryDataStored eq 'PASS') and ($verdict eq 'VERDICT_PASS'));
		$allMandatoryDataStored = 'FAIL'  if($verdict eq 'VERDICT_FAIL');
	
		#--------------------------------------------------------------
		# GENERAL EDIDS(ME number,AWL status,Ignition cycle crash and download,TimefromIntitialeventTocurrentEvent)
		#
		S_w2rep("");
		S_w2rep("--------------------------------------------------------", 'purple');
		S_w2rep("GENERAL EDIDS", 'purple');
		$verdict = 'VERDICT_PASS';
	
		if($detectedNbrOfStoredRecords == 1 ) {
			$expectedRawValues_href -> {'MultiEventNumber'} = {"Record_1" => '0xFF'};
			# $expectedRawValues_href -> {'TimeFromInitialToCurrent'} = {"Record_1" => '0xFFFF'};
			$expectedRawValues_href -> {'AWL_Status'} = {"Record_1" => '0x00'};
		}
		elsif($storageOrder eq 'MostRecentLast') {
			$expectedRawValues_href -> {'MultiEventNumber'} = {"Record_1" => '0xFF'};
			# $expectedRawValues_href -> {'TimeFromInitialToCurrent'} = {"Record_1" => '0xFFFF'};
			$expectedRawValues_href -> {'AWL_Status'} = {"Record_1" => '0x00'};
		}
		elsif($storageOrder eq 'MostRecentFirst') {
			$expectedRawValues_href -> {'MultiEventNumber'} = {"Record_2" => '0x01'};
			$expectedRawValues_href -> {'TimeFromInitialToCurrent'} = {"Record_2" => '0xFFFF'};
			$expectedRawValues_href -> {'AWL_Status'} = {"Record_2" => '0x00'};
		}
	
		foreach  my $general_EDID (keys %{$tcpar_General_MandEDIDs})
		{
			my $general_EDID_DataElement = $tcpar_General_MandEDIDs -> {$general_EDID};
			next unless ($general_EDID_DataElement);
			my $dataElement = $record_handler -> GetDataElementEDID( "EDIDnr" => $general_EDID,
																	 "RecordNumber" => 1,
															     	 "CrashLabel" => $tcpar_Crashcode);
			next unless ($dataElement);
			my $expectedEDID_Value = $expectedRawValues_href -> {$general_EDID_DataElement} -> {"Record_$recordNumber"};
			next unless(defined $expectedEDID_Value);

			S_w2log(1, "EDID $general_EDID ($dataElement)");
			S_teststep("Compare EDID $general_EDID ($dataElement) is stored with expected value in record $recordNumber",
			             'AUTO_NBR',
			             "compare_General_EDIDS_$general_EDID\_Record_$recordNumber"); #measurement 2
	
			S_w2log(1, "Get EDID $general_EDID data for Record $recordNumber");

			$detectedEDIDvalue = $record_handler -> GetRawEDID( "EDIDnr" => $general_EDID,
												   "RecordNumber" => $recordNumber,
												   "CrashLabel" => $tcpar_Crashcode,
												   "FormatOption" => "HEX");
	
			unless(defined $detectedEDIDvalue) {
				S_set_error("No data could be obtained for EDID $general_EDID in record $recordNumber.");
				next;
			}
	
			if(ref $detectedEDIDvalue eq 'ARRAY') {
				my $detectedEDIDvalueString;
				foreach my $hexElement (@{$detectedEDIDvalue})
				{
					$detectedEDIDvalueString .= $hexElement;
				}
				$detectedEDIDvalue = $detectedEDIDvalueString;
			}
			$detectedEDIDvalue = "0x".$detectedEDIDvalue;
	
			S_teststep_expected("EDID $general_EDID: $expectedEDID_Value", "compare_General_EDIDS_$general_EDID\_Record_$recordNumber");
			S_teststep_detected("EDID $general_EDID: $detectedEDIDvalue", "compare_General_EDIDS_$general_EDID\_Record_$recordNumber");
			my $generalverdict;
			if($verdictMandatoryComplete){
                $generalverdict = EVAL_evaluate_value ( "EDID_$general_EDID:\_Evaluation", $detectedEDIDvalue, "==", $expectedEDID_Value);			    
			}
			else{
                $generalverdict = EVAL_evaluate_value_NOVERDICT ( "EDID_$general_EDID:\_Evaluation", $detectedEDIDvalue, "==", $expectedEDID_Value);
			}
			$verdict = 'VERDICT_FAIL' if ($generalverdict eq 'VERDICT_FAIL');
		}
	
		S_w2rep("General EDID verdict: $verdict");
		$allMandatoryDataStored = 'PASS' if (($allMandatoryDataStored eq 'PASS') and ($verdict eq 'VERDICT_PASS'));
		$allMandatoryDataStored = 'FAIL'  if($verdict eq 'VERDICT_FAIL');
	
		# my $expectedValue;
		# A5 expected if Mandatory storage not Completed Successfully
		# $expectedValue = $tcpar_expected_Completelystored if ($allMandatoryDataStored eq 'PASS');
		# $expectedValue = $tcpar_expected_NotCompletelystored if ($allMandatoryDataStored eq 'FAIL');
		# S_w2rep("Final expected value of EDID $tcpar_EDID as per mandatory EDIds stored is $expectedValue");
	
		#--------------------------------------------------------------
		# COMLPLE FILE RECORDED
		#--------------------------------------------------------------
	
		S_w2rep("");
		S_w2rep("--------------------------------------------------------", 'purple');
		S_w2rep("COMPLETE FILE RECORDED", 'purple');
		S_w2rep("--------------------------------------------------------", 'purple');
		my $detectedvalue = $record_handler -> GetRawEDID( "EDIDnr" => $tcpar_EDID,
													   "RecordNumber" => $recordNumber,
													   "CrashLabel" => $tcpar_Crashcode,
														"FormatOption" => "HEX");
		$detectedvalue = "0x".$detectedvalue;
		S_w2rep("Detected value of EDID '$tcpar_EDID' is '$detectedvalue' ");
	
	
		# Complete file record validation

		S_teststep("Validate EDID_$tcpar_EDID value in EDR record $recordNumber based on expected value", 'AUTO_NBR', "compare_completefileRecorded_TS_expected\_Record_$recordNumber");
	
		 my $detectedvalue1 = $record_handler -> GetRawEDID("EDIDnr" => 1000,
													   "RecordNumber" => $recordNumber,
													   "CrashLabel" => $tcpar_Crashcode,
														"FormatOption" => "HEX");
		$detectedvalue1 = "0x".$detectedvalue1;
		S_w2rep("Detected value of EDID '1000' is '$detectedvalue1' ");
		
		my $expectedRecordStatus;
		if($detectedNbrOfStoredRecords == 1 and $tcpar_PowerOffCondition ne 'BeforeCrash'){
			$expectedRecordStatus = $tcpar_expected_Completelystored;
		}
		elsif($detectedNbrOfStoredRecords == 1 and $tcpar_PowerOffCondition eq 'BeforeCrash'){
		
		    
		    $expectedRecordStatus =  '0xAA' if($detectedvalue1 eq '0x55');
			
            $expectedRecordStatus = '0xFF' if($detectedvalue1 ne '0x55');
		}
		else{
			
			$expectedRecordStatus = $tcpar_StorageStatus_Records -> {"Record_$recordNumber"};
		}
		
		
		EVAL_evaluate_string( "EDID_$tcpar_EDID\_Evaluation",  $expectedRecordStatus, $detectedvalue);
		S_teststep_expected("EDID $tcpar_EDID record $recordNumber expected: $expectedRecordStatus", "compare_completefileRecorded_TS_expected\_Record_$recordNumber");
		S_teststep_detected("EDID $tcpar_EDID record $recordNumber detected: $detectedvalue", "compare_completefileRecorded_TS_expected\_Record_$recordNumber");
	
	}


	return 1;
}

sub TC_finalization {

	S_w2rep("Start test case finalization");

	#Delete Record Handler
	S_w2rep("Delete all object instances created...");
	foreach my $recordNumber (1..$edrNumberOfEventsToBeStored)
	{
		$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNumber);	
	}

	#Clearing crash recorder
	PD_ClearCrashRecorder();
	S_wait_ms(2000);

	#Erase Fault memory
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	# Reset ECU
	PD_ECUreset();
	S_wait_ms('TIMER_ECU_READY');

	#Read fault memory after clearing and erasing EDR
    PD_ReadFaultMemory();

    LC_ECU_Off();
    S_wait_ms('TIMER_ECU_OFF');

	return 1;
}


1;
