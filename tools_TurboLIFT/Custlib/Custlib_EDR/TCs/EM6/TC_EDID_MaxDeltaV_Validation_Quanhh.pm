#### TEST CASE MODULE
package TC_EDID_MaxDeltaV_Validation_Quanhh;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;


#### HERE SELECTION OF AUTOTEST MODULES ####
use LIFT_general;
use LIFT_evaluation;
use File::Basename;
use Data::Dumper;
use FuncLib_EDR_Framework;
use constant MILLISEC_TO_SECOND => 0.001;
use constant SENSOR_RESAMPLING_RATE_HZ => 1000;
use EDR_Framework::FuncLib_EDR_Offline_xmlLogging;

##################################
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_MaxDeltaV_Validation 

requires raw EDR data (setup already done in IC)

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
    1. Max Delta V Value evaluation
	2. Max delta V time evaluation

    [finalisation]
    destroy record handler

=head1 PARAMETER DESCRIPTION

=head2 PARAMETER NAMES

    purpose                  --> Purpose of the test case
	EvalType 				 --> Choose between 'MaxDeltaV_Value' and 'MaxDeltaV_Time'
	EvalUnit 				 --> Will be 'kmph' (max delta v value) or 'msec' (max delta v time)
	SensorLabel				 --> Give sensor name according to project
	EvalTolerance_abs 		--> absolute tolerance
	EDID 					--> data element ID
  	

=head2 PARAMETER EXAMPLES

	[TC_EDID_MaxDeltaV_Validation.Maximum_DeltaV_Longitudinal]
	purpose = 'To validate RGB data recorded in EDR'
	EDID = '2'
	EvalType = 'MaxDeltaV_Value'
	SensorLabel ='ECU: Acc_HG: -M45: SMA660_sync_axay_96g_426Hz'
	EvalTolerance_abs = '10'

=cut

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DOCUMENTATION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_EDIDNbr;
my $tcpar_SourceLabel;
my $tcpar_EvalType;
my $tcpar_EvalTolerance_abs;
my $tcpar_CrashScenarioList;
my $tcpar_purpose;

################ global parameter declaration ###################
#add any global variables here
my (
		$record_handler,
		$crash_handler,
	);

our $PURPOSE;
our $TC_name = "TC_EDID_MaxDeltaV_Validation";

#-------------------------------------------------------------------------------
sub TC_set_parameters {
#-------------------------------------------------------------------------------
    $tcpar_purpose =  S_read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDIDNbr = S_read_mandatory_testcase_parameter('EDID');
    $tcpar_SourceLabel = S_read_optional_testcase_parameter('SensorLabel');
    if(not defined $tcpar_SourceLabel){
        $tcpar_SourceLabel = EDR_getEdidSensorLabel($tcpar_EDIDNbr);
    }
    $tcpar_EvalType = S_read_mandatory_testcase_parameter('EvalType');
    $tcpar_EvalTolerance_abs = S_read_mandatory_testcase_parameter('EvalTolerance_abs');
    
    $tcpar_CrashScenarioList = S_read_optional_testcase_parameter('CrashScenarioList', 'byref');

	S_add2eval_collection ( 'EDID' , $tcpar_EDIDNbr);
	my $allAttributes = EDR_fetchEDIDallAttributes_by_ID($tcpar_EDIDNbr);
	S_add2eval_collection('EDID From', $allAttributes -> {'From'}) if (defined $allAttributes -> {'From'});

	S_w2rep("Eval type: $tcpar_EvalType", 'DodgerBlue');

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
	S_w2rep("No stimulation needed");
    return 1;
}

#-------------------------------------------------------------------------------
sub TC_evaluation {
#-------------------------------------------------------------------------------


	my $storedCrashLabels_aref;
    if(defined $tcpar_CrashScenarioList) {
        $storedCrashLabels_aref = $tcpar_CrashScenarioList;
    }
    else {
        $storedCrashLabels_aref = $record_handler -> GetListOfStoredRecords();    
    }

    my $missingCrashCodes;
	foreach my $crash (@{$storedCrashLabels_aref})
	{
		my $crashCode_MDS = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "CrashCode_MDS", "CrashLabel"  => $crash );
		$crashCode_MDS = $crashCode_MDS -> {"DataValues"};

		my $path_MDB = $crash_handler -> GetSourceDataValues ("SourceLabel" => "MDB_Path", "CrashLabel"  => $crash );
		$path_MDB = $path_MDB -> {"DataValues"};

        S_w2rep("#---------------------------------------------------------------------------------------", 'blue');
        S_w2rep("Crash '$crash'", 'blue');
		S_w2log(1, "Crash code: $crashCode_MDS");
		S_w2log(1, "Result DB path: $path_MDB");
        S_w2rep("#---------------------------------------------------------------------------------------", 'blue');

        #-----------------------------------------------------------------------
        # Get source data
        #-----------------------------------------------------------------------
        S_w2log(1, "Get source data (label: $tcpar_SourceLabel)");

        my $sourceData = $crash_handler -> GetSourceDataSamples( "SourceLabel" => $tcpar_SourceLabel,
        														 "CoordinateSystem" => "NHTSA",
        														 "CrashLabel" => $crash); # contains samplerate, time unit, data samples

        unless(defined $sourceData){
            S_w2rep("No Sensor data obtained from crash handler for $crash. Go to next crash.", 'red');
            $missingCrashCodes .= $crash."\n";
            next;
        }

        my $sourceSampleRateHz = $crash_handler -> GetSourceSampleRateHz("SourceLabel" => $tcpar_SourceLabel, "CrashLabel"=>$crash );

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
		
		S_w2rep("Crash time zero for '$crash': $crashTimeZero_ms (ms)");


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
                S_set_error("Record $recordNbr is empty for crash $crash (NOT EXPECTED). Will not be evaluated.");
                next;
            }

            S_teststep("Evaluate EDID $tcpar_EDIDNbr in record $recordNbr for crash '$crash'", 'AUTO_NBR', "Read EDID $tcpar_EDIDNbr crash $crash record $recordNbr");

	        #-----------------------------------------------------------------------
	        # Get EDID data
	        #-----------------------------------------------------------------------
			S_w2log(1, "Get EDID data (EDID $tcpar_EDIDNbr)");
	        my $EDID_data = $record_handler -> GetDecodedEDID("CrashLabel" => $crash, "RecordNumber" =>  $recordNbr,"EDIDnr" => $tcpar_EDIDNbr);
	
            unless(defined $EDID_data){
                S_set_error("No EDID data (EDID $tcpar_EDIDNbr) obtained from record handler for $crash. Go to next crash.");
                next;
            }
	
	        #-----------------------------------------------------------------------
	        # Get recording start and end time
	        #-----------------------------------------------------------------------
		    S_w2log(1, "Get recording start and end time");
	
	 	    # Recording Start Time
	 	    my $recStartTime_ms = $record_handler -> GetRecStartTimeMillisecEDID("CrashLabel" => $crash, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDIDNbr);
		    $recStartTime_ms = 0 if($recStartTime_ms eq 'T0');
		    S_w2log(1, "Recording start time for EDID: $recStartTime_ms ms");
	
		    # Recording End Time    
		    my $recEndTime_ms = $record_handler -> GetRecEndTimeMillisecEDID("CrashLabel" => $crash, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDIDNbr);
		    $recEndTime_ms = 300 if($recEndTime_ms eq 'T0+300ms');
		    S_w2log(1, "Recording end time for EDID: $recEndTime_ms ms");
	
	        #-----------------------------------------------------------------------
	        # Evaluate maximum delta V
	        #-----------------------------------------------------------------------
			my ($verdict, $expectedMaxDeltaV, $expectedMaxDvTimeStamp);
	        if($tcpar_EvalType eq 'MaxDeltaV_Time'){
				S_w2rep("Start evaluating Max delta V Time");
				($verdict, $expectedMaxDeltaV, $expectedMaxDvTimeStamp) = EDR_Eval_maximumDeltaV (
			 							  "TimeMaximumDeltaV_EDID" => $EDID_data->{"DataValue"},
										  "Sensor_DataSamples" => $sourceData -> {"DataSamples"},
										  "Sensor_DataUnit" => $sourceData -> {"DataUnit"},
										  "Absolute_Tolerance_Time" => $tcpar_EvalTolerance_abs,
										  "ResamplingRateHz" => SENSOR_RESAMPLING_RATE_HZ,
										  "Rec_Start_Time_ms" => $recStartTime_ms,
										  "Rec_End_Time_ms" => $recEndTime_ms,
										  "Crash_TimeZero_s" => ($crashTimeZero_href -> {"Record_$recordNbr"}) * MILLISEC_TO_SECOND,
										 );
				next unless(defined $verdict);
				S_w2rep("Expected Max Dv Time : $expectedMaxDvTimeStamp");
				# Test result for DOORS
				my $detectedMaxDeltaVtime = $EDID_data->{"DataValue"};
	 			S_teststep_expected("Delta V values around +/- $tcpar_EvalTolerance_abs ms of max delta V time recorded in EDR are within 10 kmph tolerance of max delta V value from acceleration sensor ($expectedMaxDeltaV kmph)","Read EDID $tcpar_EDIDNbr crash $crash record $recordNbr");
				S_teststep_detected("Delta V values around +/- $tcpar_EvalTolerance_abs ms of max delta V time $detectedMaxDeltaVtime ms not within 10 kmph tolerance of max delta V value from acceleration sensor ($expectedMaxDeltaV kmph)","Read EDID $tcpar_EDIDNbr crash $crash record $recordNbr") if $verdict eq 'VERDICT_FAIL';
				S_teststep_detected("Delta V values around +/- $tcpar_EvalTolerance_abs ms of max delta V time $detectedMaxDeltaVtime ms is within 10 kmph tolerance of max delta V value from acceleration sensor ($expectedMaxDeltaV kmph)","Read EDID $tcpar_EDIDNbr crash $crash record $recordNbr") if $verdict eq 'VERDICT_PASS';

				if(S_get_exec_option_NOERROR('CreisOfflineEvalReporting')){
			        my $dataElement = $record_handler -> GetDataElementEDID("CrashLabel" => $crash,
			        														"RecordNumber" =>  $recordNbr,
			        														"EDIDnr" => $tcpar_EDIDNbr);

					FLEDR_XML_addStaticEdidNode(
							$recordNbr, # record number
							'SensorData',
							$tcpar_EDIDNbr,
							$dataElement,
							$expectedMaxDvTimeStamp,
							$EDID_data->{"DataValue"},
							$tcpar_EvalTolerance_abs,
							$EDID_data->{"ValueUnit"},
							$verdict,
					);
			    }
	        }
	        elsif($tcpar_EvalType eq 'MaxDeltaV_Value'){
				S_w2rep("Start evaluating Max delta V value");
				($verdict, $expectedMaxDeltaV, $expectedMaxDvTimeStamp) = EDR_Eval_maximumDeltaV (
				 							  "MaximumDeltaV_EDID" => $EDID_data->{"DataValue"},
											  "Sensor_DataSamples" => $sourceData -> {"DataSamples"},
											  "Sensor_DataUnit" => $sourceData -> {"DataUnit"},
											  "Absolute_Tolerance_Value" => $tcpar_EvalTolerance_abs,
											  "ResamplingRateHz" => SENSOR_RESAMPLING_RATE_HZ,
											  "Rec_Start_Time_ms" => $recStartTime_ms,
											  "Rec_End_Time_ms" => $recEndTime_ms,
											  "Crash_TimeZero_s" => ($crashTimeZero_href -> {"Record_$recordNbr"}) * MILLISEC_TO_SECOND,
											 );

				# Test result for DOORS
				my $maxDeltaVdetected = $EDID_data->{"DataValue"};
				S_teststep_expected("Max delta V value within +/- $tcpar_EvalTolerance_abs kmph of max delta V sensor ($expectedMaxDeltaV kmph)","Read EDID $tcpar_EDIDNbr crash $crash record $recordNbr");
				S_teststep_detected("Max delta V detected is $maxDeltaVdetected kmph","Read EDID $tcpar_EDIDNbr crash $crash record $recordNbr");
				if(S_get_exec_option_NOERROR('CreisOfflineEvalReporting')){
			        my $dataElement = $record_handler -> GetDataElementEDID("CrashLabel" => $crash,
			        														"RecordNumber" =>  $recordNbr,
			        														"EDIDnr" => $tcpar_EDIDNbr);

					FLEDR_XML_addStaticEdidNode(
							$recordNbr, # record number
							'SensorData',
							$tcpar_EDIDNbr,
							$dataElement,
							$expectedMaxDeltaV,
							$maxDeltaVdetected,
							$tcpar_EvalTolerance_abs,
							$EDID_data->{"ValueUnit"},
							$verdict,
					);
			    }
	        }
	        else {
				S_w2rep("Eval type not known! Choose either MaxDeltaV_Value or MachDeltaV_Time!");
	        }
        	# next record
		}
		# next crash
	}

    if($missingCrashCodes){
        S_set_error("Following crash codes were not available in record / crash handler and could not be evaluated:\n".
                      $missingCrashCodes.
                      "Inject all required crashes before running this test case.", 110)unless ($main::opt_offline);
    }

    return 1;
}

1;