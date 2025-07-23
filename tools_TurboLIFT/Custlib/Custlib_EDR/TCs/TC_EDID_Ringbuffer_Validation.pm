#### TEST CASE MODULE
package TC_EDID_Ringbuffer_Validation;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;
###-------------------------------
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_EDID_Ringbuffer_Validation.pm 1.1 2019/07/05 06:59:10ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;
################################## 


#### HERE SELECTION OF AUTOTEST MODULES ####
use LIFT_general;
use LIFT_evaluation;
use INCLUDES_Project;
use File::Basename;
use Data::Dumper;
use FuncLib_EDR_Framework;
use constant MILLISEC_TO_SECOND => 0.001;
##################################
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_Ringbuffer_Validation  $Revision: 1.1 $

requires previous test case that does crash injection or crash data retrieval
for all the crashes for which ringbuffers shall be evaluated
(e.g. use TC_EDR_CrashInjection.pm or TC_EDR_CrashDataRetrieval.pm)
Crash records must be stored in record handler
Sensor data must be stored in crash handler
Crash Time Zero must be stored in crash handler
Crashlabel must be the same for sensor data and records!

default state is faultfree ECU powered ON

=head1 PURPOSE

to implement EDR Testing Framework

=head1 TESTCASE DESCRIPTION 

    [initialisation]
    initialize record handler
    initialize crash handler

    [stimulation & measurement]
	1. Inject Crash (No actual crash injection, crash data in crash handler is used)
	2. Read EDR for crash (stored data in record handler is used)

    [evaluation]
    1. Compare for each value of ringbuffer EDID that value is within sensor values and tolerance

    [finalisation]

=head1 PARAMETER DESCRIPTION

=head2 PARAMETER NAMES

    purpose --> Purpose of the test case
	SensorLabel
	EvalType --> DeltaV (for delta V and acceleration RGB) or Rollangle (for Rollrate and Rollangle)
	EvalUnit --> kmph or deg
	EvalTolerance_abs --> absolute tolerance
	EDID --> ID of the ringbuffer to be validated

=head2 PARAMETER EXAMPLES

	[TC_EDR_Ringbuffer_Validation.LateralAccelerationHighRange]
	EDID = '77'
	SensorLabel ='ECU: Acc_HG: P45: SMA660_sync_axay_96g_426Hz'
	EvalType = 'DeltaV'
	EvalUnit = 'kmph'
	EvalTolerance_abs = '10' # kmph

=cut

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DOCUMENTATION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_EDIDNbr;
my $tcpar_SourceLabel;
my $tcpar_EvalType;
my $tcpar_EvalUnit;
my $tcpar_EvalTolerance_abs;
my $tcpar_CrashScenarioList;
my $tcpar_purpose;

################ global parameter declaration ###################
#add any global variables here
my (
		$record_handler,
		$crash_handler,
		$storedCrashLabels_aref,
	);

our $PURPOSE;
our $TC_name = "TC_EDID_Ringbuffer_Validation";

#-------------------------------------------------------------------------------
sub TC_set_parameters {
#-------------------------------------------------------------------------------
	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
    $tcpar_EDIDNbr = GEN_Read_mandatory_testcase_parameter('EDID');
    $tcpar_SourceLabel = GEN_Read_mandatory_testcase_parameter('SensorLabel');

    $tcpar_EvalType = GEN_Read_mandatory_testcase_parameter('EvalType');
    $tcpar_EvalUnit = GEN_Read_mandatory_testcase_parameter('EvalUnit');
    $tcpar_EvalTolerance_abs = GEN_Read_mandatory_testcase_parameter('EvalTolerance_abs');

    $tcpar_CrashScenarioList = GEN_Read_optional_testcase_parameter('CrashScenarioList', 'byref');

	S_add2eval_collection ( 'EDID' , $tcpar_EDIDNbr);
	my $allAttributes = EDR_fetchEDIDallAttributes_by_ID($tcpar_EDIDNbr);
	S_add2eval_collection('EDID From', $allAttributes -> {'From'}) if (defined $allAttributes -> {'From'});

	return 1;
}

#-------------------------------------------------------------------------------
sub TC_initialization {
#-------------------------------------------------------------------------------
	#--------------------------------------------------------------
    # INITIALIZE RECORD AND CRASH HANDLER
    #    
	S_w2rep("Initialize Record and Crash Handler", 'DodgerBlue');
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;

    return 1;
}

#-------------------------------------------------------------------------------
sub TC_stimulation_and_measurement {
#-------------------------------------------------------------------------------
	# Get a list of all crash labels for which EDR records were stored in
	#   previous test cases
    if(defined $tcpar_CrashScenarioList) {
        $storedCrashLabels_aref = $tcpar_CrashScenarioList;
    }
    else {
        $storedCrashLabels_aref = $record_handler -> GetListOfStoredRecords();    
    }

	# Prepare evaluation keywords - no actual crash injection
	foreach my $crash (@{$storedCrashLabels_aref})
	{
		S_w2rep("Read EDR (EDID $tcpar_EDIDNbr) and injected sensor values for crash $crash"); # evaluation label
	}

    return 1;
}

#-------------------------------------------------------------------------------
sub TC_evaluation {
#-------------------------------------------------------------------------------

    my $mappingEDR = S_get_contents_of_hash(['Mapping_EDR']);
	my $storageOrder = $mappingEDR -> {"StorageOrder"};
	my $extendedMeasurements = lc($mappingEDR -> {'Extended_Measurement'});

	unless(defined $storageOrder) {
		S_set_error("Define 'StorageOrder' in EDR mapping! Must be 'MostRecentFirst' or 'MostRecentLast'");
		return;
	}
	
	if($storageOrder ne 'MostRecentFirst' and $storageOrder ne 'MostRecentLast') {
		S_set_error("'StorageOrder' in EDR mapping not known! Must be 'MostRecentFirst' or 'MostRecentLast', but is given as '$storageOrder'");
		return;
	}
	
	foreach my $crash (@{$storedCrashLabels_aref})
	{
		my $thisCrashVerdict = 'VERDICT_NONE';


		my $crashCode_MDS = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "CrashCode_MDS", "CrashLabel"  => $crash );
		$crashCode_MDS = $crashCode_MDS -> {"DataValues"};

		my $path_MDB = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "MDB_Path", "CrashLabel"  => $crash );
		$path_MDB = $path_MDB -> {"DataValues"};

		S_w2rep("#---------------------------------------------");
		S_teststep("Evaluate EDID $tcpar_EDIDNbr for crash $crash", 'AUTO_NBR', "Read EDID $tcpar_EDIDNbr crash $crash");
		S_w2log(1, "Crash code: $crashCode_MDS");
		S_w2log(1, "Result DB path: $path_MDB");
        S_w2rep("#---------------------------------------------");

		#-----------------------------------------------------------------------
		# Get source data
		#-----------------------------------------------------------------------
		S_w2rep("Get source data (label: $tcpar_SourceLabel)");

		my $sourceData = $crash_handler -> GetSourceDataSamples( "SourceLabel" => $tcpar_SourceLabel,
																 "CoordinateSystem" => "NHTSA",
																 "CrashLabel" => $crash); # contains samplerate, time unit, data samples

		unless(defined $sourceData){
			S_w2rep("No Sensor data obtained from crash handler. Try next crash.", 'red');
			S_set_verdict('VERDICT_NONE');
			next unless($main::opt_offline);
			return 1;
		}

		my $sourceSampleRateHz = $crash_handler -> GetSourceSampleRateHz("SourceLabel" => $tcpar_SourceLabel, "CrashLabel"=>$crash );

        my $sensorDetailsMapping = S_get_contents_of_hash_NOERROR(['Mapping_EDR', 'SensorMapping', "$tcpar_SourceLabel"]);
        my $sensorRange;
        if($sensorDetailsMapping){
            $sensorRange = $sensorDetailsMapping -> {'SensorRange'};
            S_w2rep("Obtained sensor range $sensorRange for sensor $tcpar_SourceLabel.")if(defined $sensorRange); 
        }

        #-----------------------------------------------------------------------
        # Get crash time zero
        #-----------------------------------------------------------------------
		my $crashTimeZero = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "CrashTimeZero",
															        "CrashLabel"  => $crash );
		unless(defined $crashTimeZero) {
			S_set_error("No crash time zero stored for crash $crash. No evaluation of fire times possible. Try next crash.", 110);
			next;
		}
		my $crashTimeZero_ms = $crashTimeZero -> {"DataValues"};
		my $crashTimeZeroUnit = $crashTimeZero -> {"DataUnit"};
		if($crashTimeZeroUnit ne "ms") {
			S_set_error("Crash Time zero must be stored in ms!! Go to next crash.", 110);
			next;
		}
		
		S_w2rep("Crash Time Zero: $crashTimeZero_ms ms");

		#-----------------------------------------------------------------------
		# Get number of expected records
		#-----------------------------------------------------------------------
		
        my ($numberOfRecords, $crashTimeZero_href) = EDR_getCrashTimeZeroPerRecord($crashTimeZero_ms);
			
		for (my $recordNbr = 1; $recordNbr <= $numberOfRecords; $recordNbr++)
		{
			S_w2rep("---- Record $recordNbr ----");
			#-----------------------------------------------------------------------
			# Get EDID data
			#-----------------------------------------------------------------------
			if($extendedMeasurements eq 'enabled'){

				$record_handler -> PrintRawEDIDs("CrashLabel" => $crash, "RecordNumber" => $recordNbr, );	
				$record_handler -> PrintDecodedEDIDs("CrashLabel" => $crash, "RecordNumber" => $recordNbr, );				
			}


			S_w2rep("Get EDID data (EDID $tcpar_EDIDNbr)");
			my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crash, "RecordNumber" =>  $recordNbr,"EDIDnr" => $tcpar_EDIDNbr);
			#foreach my $comTimeStamp (sort {$a <=> $b} keys %{$comSignalDataSamples})
			
			if ($tcpar_EDIDNbr == 31 || $tcpar_EDIDNbr == 32 ||$tcpar_EDIDNbr == 33 || $tcpar_EDIDNbr == 34)
			{
			#S_w2rep(Dumper($edidData ->{"DataSamples"}));
			foreach my $timeStamp (sort {$a <=> $b} keys %{$edidData ->{"DataSamples"}})
				{
					my $value = $edidData -> {"DataSamples"} -> {$timeStamp};
				     if ($value>=0 and $value<= 0x9A)
				     {
				     	
				     	 $value = $value * 1 + 0;# 0 as offset for positive values
				     	 $edidData -> {"DataSamples"} -> {$timeStamp} = $value;
				     }
				     else
				      
				     {

				     	 $value = $value * 1 - 256;# - 256 as offset for neg values
				     	 $edidData -> {"DataSamples"} -> {$timeStamp} = $value;
				     }
				}
			}
			

			unless(defined $edidData){
				S_w2rep("No EDID data obtained from record. Try next crash.", 'red');
				S_set_verdict('VERDICT_NONE');
				next unless($main::opt_offline);
				return 1;
			}

			if($extendedMeasurements eq 'enabled'){
				 S_w2rep("Additional measurement: Sensor data and EDID data in original unit");
				 S_w2rep("Sensor data:");
	 			 EDR_printGraphFromDataSamples($sourceData -> {"DataSamples"}, S_get_TC_number()."_Crash_$crash\_Record_$recordNbr\_SensorData", "$main::REPORT_PATH/", "Crash_$crash\_Record_$recordNbr\_Sensor_$tcpar_SourceLabel");
	
				my $crashT0 = $crashTimeZero_href -> {"Record_$recordNbr"};
				S_w2rep("EDID data (shifted by Crash T0 $crashT0 ms compared to sensor data):");
	 			EDR_printGraphFromDataSamples($edidData -> {"DataSamples"}, S_get_TC_number()."_Crash_$crash\_Record_$recordNbr\_EDID_$tcpar_EDIDNbr", "$main::REPORT_PATH/", "Crash_$crash\_Record_$recordNbr\_EDID_$tcpar_EDIDNbr");
			}

			#-----------------------------------------------------------------------
			# Get start and end time for evaluation (Note: p. 67 and p. 82)
			#-----------------------------------------------------------------------
			S_w2rep("Get recording start and end time");

			# Recording Start Time
			my $recStartTime_ms = $record_handler -> GetRecStartTimeMillisecEDID("CrashLabel" => $crash, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDIDNbr);
			S_w2rep("Recording start time for EDID: $recStartTime_ms ms");

			# Recording End Time  
			my $recEndTime_ms = $record_handler -> GetRecEndTimeMillisecEDID("CrashLabel" => $crash, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDIDNbr);
			S_w2rep("Recording end time for EDID: $recEndTime_ms ms");

			#-----------------------------------------------------------------------
			# Evaluate Rollangle and Rollrate EDIDs
			#-----------------------------------------------------------------------
			if(($tcpar_EvalType eq 'Rollangle') or ($tcpar_EvalType eq 'Rollrate'))
			{
				S_w2rep("Start ringbuffer evaluation with sensor $tcpar_SourceLabel and EDID $tcpar_EDIDNbr");
				my $graphLabel = "Rollangle Eval (EDID $tcpar_EDIDNbr, crash $crash, record $recordNbr)";

				$thisCrashVerdict = EDR_Eval_Ringbuffer_Rollangle (
												"EDID_ID"            => $tcpar_EDIDNbr,
												"EDID_Type"          => $tcpar_EvalType,
												"EDID_DataSamples"   => $edidData -> {"DataSamples"},
												"EDID_SampleRateHz"  => $edidData -> {"SampleRateHz"},
												"Rollrate_Sensor_DataSamples" => $sourceData-> {"DataSamples"},
												"Rec_Start_Time_ms"  => $recStartTime_ms,
												"Rec_End_Time_ms"    => $recEndTime_ms,
												"Absolute_Tolerance" => $tcpar_EvalTolerance_abs,
												"Crash_TimeZero_s"   => $crashTimeZero_href -> {"Record_$recordNbr"} * MILLISEC_TO_SECOND,
													"GraphLabel"	=> $graphLabel,
											  );
			}


			#-----------------------------------------------------------------------
			# Evaluate Delta V EDIDs
			#-----------------------------------------------------------------------
			elsif(($tcpar_EvalType eq 'DeltaV') or($tcpar_EvalType eq 'DeltaV_Z') or ($tcpar_EvalType eq 'DeltaV_Y')){

				my $graphLabel = "Delta V Eval (EDID $tcpar_EDIDNbr, crash $crash, record $recordNbr)";
				S_w2rep("Start ringbuffer evaluation with sensor $tcpar_SourceLabel and EDID $tcpar_EDIDNbr");
				$thisCrashVerdict = EDR_Eval_Ringbuffer_MethodDeltaV (
													"EDID_ID"            => $tcpar_EDIDNbr,
													"EDID_DataSamples"   => $edidData -> {"DataSamples"},
													"EDID_DataUnit"      => $edidData -> {"ValueUnit"},
													"EDID_SampleRateHz"  => $edidData -> {"SampleRateHz"},
													"Sensor_DataSamples" => $sourceData -> {"DataSamples"},
													"Sensor_DataUnit"    => $sourceData -> {"DataUnit"},
													"Absolute_Tolerance" => $tcpar_EvalTolerance_abs,
													"CompareDataUnit"    => $tcpar_EvalUnit,
													"Rec_Start_Time_ms"  => $recStartTime_ms,
													"Rec_End_Time_ms"    => $recEndTime_ms,
													"Crash_TimeZero_s"   => $crashTimeZero_href -> {"Record_$recordNbr"} * MILLISEC_TO_SECOND,
													"GraphLabel"	=> $graphLabel,
													"Sensor_Range" => $sensorRange,
												  );
			}
			#-----------------------------------------------------------------------
			# Evaluate Pressure EDIDs
			#-----------------------------------------------------------------------
			elsif($tcpar_EvalType eq 'PressureRGB'){

				my $graphLabel = "Pressure Eval (EDID $tcpar_EDIDNbr, crash $crash, record $recordNbr)";
				S_w2rep("Start ringbuffer evaluation with sensor $tcpar_SourceLabel and EDID $tcpar_EDIDNbr");
				$thisCrashVerdict = EDR_Eval_Ringbuffer_Pressure (
													"EDID_ID"            => $tcpar_EDIDNbr,
													"EDID_DataSamples"   => $edidData -> {"DataSamples"},
													"EDID_DataUnit"      => $edidData -> {"ValueUnit"},
													"EDID_SampleRateHz"  => $edidData -> {"SampleRateHz"},
													"Sensor_DataSamples" => $sourceData -> {"DataSamples"},
													"Sensor_DataUnit"    => $sourceData -> {"DataUnit"},
													"Absolute_Tolerance" => $tcpar_EvalTolerance_abs,
													"Rec_Start_Time_ms"  => $recStartTime_ms,
													"Rec_End_Time_ms"    => $recEndTime_ms,
													"Crash_TimeZero_s"   => $crashTimeZero_href -> {"Record_$recordNbr"} * MILLISEC_TO_SECOND,
													"GraphLabel"	=> $graphLabel,
												  );
			}
			#-----------------------------------------------------------------------
			# No evaluation routine defined - next EDID
			#-----------------------------------------------------------------------
			else{
				S_w2rep("No evaluation routine defined for evaluation type '$tcpar_EvalType'", 'red');
				S_set_verdict('VERDICT_INCONC');
				return;
			}
			
			S_teststep_expected("All ringbuffer values (EDID $tcpar_EDIDNbr) within absolute tolerance $tcpar_EvalTolerance_abs $tcpar_EvalUnit of sensor data for $crash", "Read EDID $tcpar_EDIDNbr crash $crash");
			S_teststep_detected("All ringbuffer values (EDID $tcpar_EDIDNbr) within absolute tolerance $tcpar_EvalTolerance_abs $tcpar_EvalUnit of sensor data for $crash", "Read EDID $tcpar_EDIDNbr crash $crash") if ($thisCrashVerdict eq 'VERDICT_PASS');
			S_teststep_detected("Not all ringbuffer values (EDID $tcpar_EDIDNbr) within absolute tolerance $tcpar_EvalTolerance_abs $tcpar_EvalUnit of sensor data for $crash", "Read EDID $tcpar_EDIDNbr crash $crash") if ( $thisCrashVerdict eq 'VERDICT_FAIL');
			
			#next record
		}
		
		# next crash
	}

    return 1;
}

#-------------------------------------------------------------------------------------------------------------------

1;