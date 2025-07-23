#### TEST CASE MODULE
package TC_EDID_Ringbuffer_Validation_Quanhh;

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

#### HERE SELECTION OF AUTOTEST MODULES ####
use LIFT_general;
use LIFT_evaluation;
use File::Basename;
use Data::Dumper;
use FuncLib_EDR_Framework;
use constant MILLISEC_TO_SECOND => 0.001;
use EDR_Framework::FuncLib_EDR_Offline_xmlLogging;
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_Ringbuffer_Validation

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Inject  <CrashScenarioList>. 

Calculate the expected values of corresponding <EDID> from the Injected Crash File.

2. Read corresponding <EDID> in all EDR records


I<B<Evaluation>>

1. -

2. <EDID> should have values as per injected crash scenario in corresponding EDR records.

Check Data is Stored according to NHTSA coordinate system. 

Note: For Parallel and Multi event crashes it has to be ensured that the data is captured with respect to T0 of each event. For T0. Check Across the Injected Crash File


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'EDID' => 
	SCALAR 'EvalType' => 
	SCALAR 'EvalUnit' => 
	SCALAR 'EvalTolerance_abs' => 
	HASH 'COMsignalsAfterCrash' => 
	LIST 'CrashScenarioList' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To validate dynamic sensor data reported in EDR'
	EDID = '<Fetch {EDID}>'
	# Fill chapter 'TimeSynchronization' in EDR Mapping!
	EvalType = 'DeltaV'
	EvalUnit = 'km/h'
	EvalTolerance_abs = '10' # kmph -> Tolerance must be adapted according to EDID and sensor resolution for each EDID!!
	COMsignalsAfterCrash = %()
	CrashScenarioList = @('Single_EDR_Front_below_8kph_Noise','Single_EDR_SideLeft_Noise_NIS_C1A','Single_EDR_SideRight_Noise_NIS_C1A','Single_EDR_Front_above_8kph_NoDeployment;5','Single_EDR_Rear_above_8kph_NoDeployment;5','Single_EDR_SideLeft_NonInflatable','Single_EDR_Side_above_8kph_NoDeployment;5','Single_EDR_SideRight_NonInflatable','Single_EDR_Rollover_NoDeployment;5','Single_EDR_Front_NonInflatable;5','Single_EDR_Rear_NonInflatable;5','Single_EDR_Front_Inflatable;5','Single_EDR_SideLeft_Inflatable;5','Single_EDR_SideRight_Inflatable;5','Single_EDR_Rollover_Inflatable','Single_EDR_Front_ClipEcuX;5','Single_EDR_SideRight_ClipEcuY;5','Single_EDR_Front_ClipEcuX_after250ms','Single_EDR_SideLeft_ClipEcuY_after250ms')  # Single
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_EvalType;
my $tcpar_EvalUnit;
my $tcpar_EvalTolerance_abs;
my $tcpar_COMsignalsAfterCrash;
my $tcpar_CrashScenarioList;
my $tcpar_EDIDNbr;
my $tcpar_SourceLabel;
my $tcpar_SensorRange;
my $tcpar_CoordinateSystem;
my $tcpar_JitterTime_ms;

################ global parameter declaration ###################
#add any global variables here
#add any global variables here
my (
		$record_handler,
		$crash_handler,
		$storedCrashLabels_aref,
	);

our $PURPOSE;
our $TC_name = "TC_EDID_Ringbuffer_Validation";

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDIDNbr =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	##-----------------------------------
	#Quanhh
	 $tcpar_SourceLabel = S_read_optional_testcase_parameter('SensorLabel');
    #gets sensor label for EDID Quanhh
	if(not defined $tcpar_SourceLabel){
        $tcpar_SourceLabel = EDR_getEdidSensorLabel($tcpar_EDIDNbr);
    }
	$tcpar_CoordinateSystem = S_read_optional_testcase_parameter('CoordinateSystem');
    if(not defined $tcpar_CoordinateSystem){
    	$tcpar_CoordinateSystem = 'NHTSA';
    }
	
	S_add2eval_collection ( 'EDID' , $tcpar_EDIDNbr);
	my $allAttributes = EDR_fetchEDIDallAttributes_by_ID($tcpar_EDIDNbr);
	S_add2eval_collection('EDID From', $allAttributes -> {'From'}) if (defined $allAttributes -> {'From'});
	##-----------------------------------
	$tcpar_EvalType =  GEN_Read_mandatory_testcase_parameter( 'EvalType' );
	$tcpar_EvalUnit =  GEN_Read_mandatory_testcase_parameter( 'EvalUnit' );
	$tcpar_EvalTolerance_abs =  GEN_Read_mandatory_testcase_parameter( 'EvalTolerance_abs' );
	$tcpar_COMsignalsAfterCrash =  GEN_Read_mandatory_testcase_parameter( 'COMsignalsAfterCrash' );
	$tcpar_CrashScenarioList =  GEN_Read_mandatory_testcase_parameter( 'CrashScenarioList', 'byref' );


	return 1;
}

sub TC_initialization {

	#--------------------------------------------------------------
    # INITIALIZE RECORD AND CRASH HANDLER
    #    
	S_w2rep("Initialize Record and Crash Handler", 'DodgerBlue');
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;
	return 1;
}

sub TC_stimulation_and_measurement {

	# Get a list of all crash labels for which EDR records were stored in
	#   previous test cases
	# my $a = Dumper($tcpar_CrashScenarioList);
	# S_w2rep(" dump tcpar_CrashScenarioList ne $a");

	# $a = Dumper(@tcpar_CrashScenarioList);
	# S_w2log(" dump acong tcpar_CrashScenarioList ne $a");

	
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

sub TC_evaluation {

	 my $mappingEDR = S_get_contents_of_hash(['Mapping_EDR']);
	my $extendedMeasurements = lc($mappingEDR -> {'Extended_Measurement'});
    if(S_get_exec_option_NOERROR ( 'EDR_ExtendedMeasurementsEnabled' )){
        $extendedMeasurements = 'enabled';
    }
	my $missingCrashCodes;
	foreach my $crash (@{$storedCrashLabels_aref})
	{
		my $thisCrashVerdict = 'VERDICT_NONE';


		my $crashCode_MDS = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "CrashCode_MDS", "CrashLabel"  => $crash );
		$crashCode_MDS = $crashCode_MDS -> {"DataValues"};

		my $path_MDB = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "MDB_Path", "CrashLabel"  => $crash );
		$path_MDB = $path_MDB -> {"DataValues"};

		S_w2rep("#---------------------------------------------------------------------------------------", 'blue');
		S_w2rep("Crash '$crash'", 'blue');
		S_w2log(1, "Crash code: $crashCode_MDS");
		S_w2log(1, "Result DB path: $path_MDB");
        S_w2rep("#---------------------------------------------------------------------------------------", 'blue');

		#-----------------------------------------------------------------------
		# Get source data
		#-----------------------------------------------------------------------
		S_w2rep("Get source data (label: $tcpar_SourceLabel , coordinate system: $tcpar_CoordinateSystem), Crash $crash");
		#returns data samples of sensor source, as well as sample rate and unit
		
		my $sourceData = $crash_handler -> GetSourceDataSamples( "SourceLabel" => $tcpar_SourceLabel,
																 "CoordinateSystem" => $tcpar_CoordinateSystem, #default is 'NHTSA'
																 "CrashLabel" => $crash); # contains samplerate, time unit, data samples

		unless(defined $sourceData){
			S_w2rep("No Sensor data obtained from crash handler for $crash. Go to next crash.", 'red');
			$missingCrashCodes .= $crash."\n";
			next;
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
			S_set_error("No crash time zero stored for crash $crash. No evaluation of sensor RGB possible. Try next crash.", 110);
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
		if ($numberOfRecords > 3)
		{
			$numberOfRecords = 3;
		}
        foreach my $recordNbr (1..$numberOfRecords)
		{
			S_w2rep("---- Record $recordNbr ----");
			my $isRecordAvailable = $record_handler -> IsRecordAvailable("CrashLabel" => $crash, "RecordNumber" => $recordNbr);
			unless($isRecordAvailable){
                S_set_error("Record $recordNbr is empty for crash $crash (NOT EXPECTED). Will not be evaluated.") unless ($main::opt_offline);
			    next;
			}

            S_teststep("Evaluate EDID $tcpar_EDIDNbr in record $recordNbr for crash '$crash'", 'AUTO_NBR', "Read EDID $tcpar_EDIDNbr crash $crash record $recordNbr");

            # Get Crash time zero
            my $crashTimeZeroThisRecord_ms;
            $crashTimeZeroThisRecord_ms = $crashTimeZero_href -> {"Record_$recordNbr"};
            if($tcpar_JitterTime_ms){
                $crashTimeZeroThisRecord_ms = $crashTimeZeroThisRecord_ms + $tcpar_JitterTime_ms;
                S_teststep("Add given jitter time $tcpar_JitterTime_ms ms to crash time zero record $recordNbr -> new T0: $crashTimeZeroThisRecord_ms ms", 'AUTO_NBR');
            }

			# Synchronize T0
			S_w2rep("Crash time zero given for this crash is: $crashTimeZeroThisRecord_ms");
			S_teststep_2nd_level("Synchronize given T0 ($crashTimeZeroThisRecord_ms) for EDID $tcpar_EDIDNbr.", 'AUTO_NBR');
			$crashTimeZeroThisRecord_ms = EDR_synchronize_T0_for_EDID($tcpar_EDIDNbr, $crashTimeZeroThisRecord_ms,
																		$crash, $recordNbr);
			S_teststep("Synchronized T0: $crashTimeZeroThisRecord_ms ms", 'NO_AUTO_NBR');

			#-----------------------------------------------------------------------
			# Get EDID data
			#-----------------------------------------------------------------------
			if($extendedMeasurements eq 'enabled'){
				$record_handler -> PrintRawEDIDs("CrashLabel" => $crash, "RecordNumber" => $recordNbr, );
				$record_handler -> PrintDecodedEDIDs("CrashLabel" => $crash, "RecordNumber" => $recordNbr, );
			}

			S_w2rep("Get EDID data (EDID $tcpar_EDIDNbr)");
			my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crash, "RecordNumber" =>  $recordNbr,"EDIDnr" => $tcpar_EDIDNbr);

			unless(defined $edidData){
                S_set_error("No EDID data (EDID $tcpar_EDIDNbr) obtained from record handler for $crash. Go to next crash.");
                next;
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

			my $sensorData_href;
			#-----------------------------------------------------------------------
			# Evaluate Rollangle/Pitchangle and Rollrate/Pitchrate/Yawrate EDIDs
			#-----------------------------------------------------------------------
			if(($tcpar_EvalType eq 'Angle') or ($tcpar_EvalType eq 'Rate'))
			{
				S_w2rep("Start ringbuffer evaluation with sensor $tcpar_SourceLabel and EDID $tcpar_EDIDNbr");
				my $graphLabel = "$tcpar_EvalType Eval (EDID $tcpar_EDIDNbr, crash $crash, record $recordNbr)";

				($thisCrashVerdict, $sensorData_href) = EDR_Eval_Ringbuffer_Angle (
												"EDID_ID"            => $tcpar_EDIDNbr,
												"EDID_Type"          => $tcpar_EvalType,
												"EDID_Unit"          => $tcpar_EvalUnit,
												"EDID_DataSamples"   => $edidData -> {"DataSamples"},
												"EDID_SampleRateHz"  => $edidData -> {"SampleRateHz"},
												"Rollrate_Sensor_DataSamples" => $sourceData-> {"DataSamples"},
												"SensorRange"        => $tcpar_SensorRange,
												"Rec_Start_Time_ms"  => $recStartTime_ms,
												"Rec_End_Time_ms"    => $recEndTime_ms,
												"Absolute_Tolerance" => $tcpar_EvalTolerance_abs,
												"Crash_TimeZero_s"   => $crashTimeZeroThisRecord_ms * MILLISEC_TO_SECOND,
												"GraphLabel"	=> $graphLabel,
											  );
			}

			#-----------------------------------------------------------------------
			# Evaluate Delta V EDIDs
			#-----------------------------------------------------------------------
			elsif(($tcpar_EvalType eq 'DeltaV') or($tcpar_EvalType eq 'DeltaV_Z') or ($tcpar_EvalType eq 'DeltaV_Y')){

				my $graphLabel = "Delta V Eval (EDID $tcpar_EDIDNbr, crash $crash, record $recordNbr)";
				S_w2rep("Start ringbuffer evaluation with sensor $tcpar_SourceLabel and EDID $tcpar_EDIDNbr");
				($thisCrashVerdict, $sensorData_href) = EDR_Eval_Ringbuffer_MethodDeltaV (
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
													"Crash_TimeZero_s"   => $crashTimeZeroThisRecord_ms * MILLISEC_TO_SECOND,
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
				($thisCrashVerdict, $sensorData_href) = EDR_Eval_Ringbuffer_Pressure (
													"EDID_ID"            => $tcpar_EDIDNbr,
													"EDID_DataSamples"   => $edidData -> {"DataSamples"},
													"EDID_DataUnit"      => $edidData -> {"ValueUnit"},
													"EDID_SampleRateHz"  => $edidData -> {"SampleRateHz"},
													"Sensor_DataSamples" => $sourceData -> {"DataSamples"},
													"Sensor_DataUnit"    => $sourceData -> {"DataUnit"},
													"Absolute_Tolerance" => $tcpar_EvalTolerance_abs,
													"Rec_Start_Time_ms"  => $recStartTime_ms,
													"Rec_End_Time_ms"    => $recEndTime_ms,
													"Crash_TimeZero_s"   => $crashTimeZeroThisRecord_ms * MILLISEC_TO_SECOND,
													"GraphLabel"	=> $graphLabel,
												  );
			}
			#-----------------------------------------------------------------------
			# No evaluation routine defined - next EDID
			#-----------------------------------------------------------------------
			else{
				S_set_error("No evaluation routine defined for evaluation type '$tcpar_EvalType'");
				return 1;
			}

			S_teststep_expected("All ringbuffer values (EDID $tcpar_EDIDNbr) within absolute tolerance $tcpar_EvalTolerance_abs $tcpar_EvalUnit of sensor data for $crash", "Read EDID $tcpar_EDIDNbr crash $crash record $recordNbr");
			S_teststep_detected("All ringbuffer values (EDID $tcpar_EDIDNbr) within absolute tolerance $tcpar_EvalTolerance_abs $tcpar_EvalUnit of sensor data for $crash", "Read EDID $tcpar_EDIDNbr crash $crash record $recordNbr") if ($thisCrashVerdict eq 'VERDICT_PASS');
			S_teststep_detected("Not all ringbuffer values (EDID $tcpar_EDIDNbr) within absolute tolerance $tcpar_EvalTolerance_abs $tcpar_EvalUnit of sensor data for $crash", "Read EDID $tcpar_EDIDNbr crash $crash record $recordNbr") if ( $thisCrashVerdict eq 'VERDICT_FAIL');

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
				my $description = $record_handler -> GetDataElementEDID("CrashLabel" => $crash,
																		"RecordNumber" =>  $recordNbr,
																		"EDIDnr" => $tcpar_EDIDNbr);

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
						$tcpar_EDIDNbr,
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
		}
		# next crash
	} 
    if($missingCrashCodes and not S_get_exec_option_NOERROR('OfflineReportValidation')){
        S_set_error("Following crash codes were not available in record / crash handler and could not be evaluated:\n".
                      $missingCrashCodes.
                      "Inject all required crashes before running this test case.", 110) unless ($main::opt_offline);
    }
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
