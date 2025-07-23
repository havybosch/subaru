#### TEST CASE MODULE
package TC_EDID_MaxDeltaV_Validation;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;
###-------------------------------
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_EDID_MaxDeltaV_Validation.pm 1.1 2019/07/05 06:59:09ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;
################################## 


#### HERE SELECTION OF AUTOTEST MODULES ####
use LIFT_general;
use LIFT_evaluation;
use INCLUDES_Project;
use File::Basename;
use Data::Dumper;
use FuncLib_EDR_Framework;
use constant MILLISEC_TO_SECOND => 0.001;
use constant SENSOR_RESAMPLING_RATE_HZ => 1000;
##################################
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_MaxDeltaV_Validation  $Revision: 1.1 $

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
    $tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDIDNbr = GEN_Read_mandatory_testcase_parameter('EDID');
    $tcpar_SourceLabel = GEN_Read_mandatory_testcase_parameter('SensorLabel');

    $tcpar_EvalType = GEN_Read_mandatory_testcase_parameter('EvalType');
    $tcpar_EvalTolerance_abs = GEN_Read_mandatory_testcase_parameter('EvalTolerance_abs');
    
    $tcpar_CrashScenarioList = GEN_Read_optional_testcase_parameter('CrashScenarioList', 'byref');

	S_add2eval_collection ( 'EDID' , $tcpar_EDIDNbr);
	my $allAttributes = EDR_fetchEDIDallAttributes_by_ID($tcpar_EDIDNbr);
	S_add2eval_collection('EDID From', $allAttributes -> {'From'}) if (defined $allAttributes -> {'From'});

	S_w2rep("My eval type: $tcpar_EvalType", 'DodgerBlue');

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

    my $mappingEDR = S_get_contents_of_hash(['Mapping_EDR']);
	my $storageOrder = $mappingEDR -> {"StorageOrder"};
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
		my $crashCode_MDS = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "CrashCode_MDS", "CrashLabel"  => $crash );
		$crashCode_MDS = $crashCode_MDS -> {"DataValues"};

		my $path_MDB = $crash_handler -> GetSourceDataValues ("SourceLabel" => "MDB_Path", "CrashLabel"  => $crash );
		$path_MDB = $path_MDB -> {"DataValues"};

		S_w2rep("#---------------------------------------------");
		S_teststep("Evaluate EDID $tcpar_EDIDNbr for crash $crash", 'AUTO_NBR', "Evaluation EDID $tcpar_EDIDNbr crash $crash");
		S_w2log(1, "Crash code: $crashCode_MDS");
		S_w2log(1, "Result DB path: $path_MDB");
        S_w2rep("#---------------------------------------------");

        #-----------------------------------------------------------------------
        # Get source data
        #-----------------------------------------------------------------------
        S_w2log(1, "Get source data (label: $tcpar_SourceLabel)");

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
			S_w2log(1, "Get EDID data (EDID $tcpar_EDIDNbr)");
	        my $EDID_data = $record_handler -> GetDecodedEDID("CrashLabel" => $crash, "RecordNumber" =>  $recordNbr,"EDIDnr" => $tcpar_EDIDNbr);
	            	if ($tcpar_EDIDNbr == 31 || $tcpar_EDIDNbr == 32 ||$tcpar_EDIDNbr == 33 || $tcpar_EDIDNbr == 34)
			{
			#S_w2rep(Dumper($EDID_data ->{"DataSamples"}));
			
					my $value = $EDID_data -> {"DataValue"};
				     if ($value>=0 and $value<= 0x7F)
				     {
				     	 if ($tcpar_EDIDNbr ==35 || $tcpar_EDIDNbr == 36)
				     	 {
				     	 $value = $value * 2.5 + 0;# 0 as offset for positive values
				     	 $EDID_data -> {"DataValue"} = $value;
				     	 }
				     	 else
				     	 {
				     	 	$value = $value * 1 + 0;# 0 as offset for positive values
				     	 $EDID_data -> {"DataValue"} = $value;
				     	 }
				     }
				     else
				      
				     {
				     	if ($tcpar_EDIDNbr ==35 || $tcpar_EDIDNbr == 36)
				     	 {
				     	 $value = $value * 2.5 - 256;# - 256 as offset for -neg values
				     	  $EDID_data -> {"DataValue"} = $value;
				     	 }
				     	 else
				     	 {
				     	 	
				     	 	$value = $value * 1 - 256;# - 256 as offset for neg values
				     	 $EDID_data -> {"DataValue"} = $value;
				     	 }
				     }
				
			}
			
			
	        unless(defined $EDID_data){
	            S_w2rep("No EDID data obtained from record. Try next crash.", 'red');
	            S_set_verdict('VERDICT_NONE');
	            next unless($main::opt_offline);
	            return 1;
	        }
	
	        #-----------------------------------------------------------------------
	        # Get recording start and end time
	        #-----------------------------------------------------------------------
		    S_w2log(1, "Get recording start and end time");
	
	 	    # Recording Start Time
	 	    my $recStartTime_ms = $record_handler -> GetRecStartTimeMillisecEDID("CrashLabel" => $crash, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDIDNbr);
		    S_w2log(1, "Recording start time for EDID: $recStartTime_ms ms");
	
		    # Recording End Time    
		    my $recEndTime_ms = $record_handler -> GetRecEndTimeMillisecEDID("CrashLabel" => $crash, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDIDNbr);
		    S_w2log(1, "Recording end time for EDID: $recEndTime_ms ms");
	
	        #-----------------------------------------------------------------------
	        # Evaluate maximum delta V
	        #-----------------------------------------------------------------------
			my ($verdict, $expectedMaxDeltaV);
	        if($tcpar_EvalType eq 'MaxDeltaV_Time'){
				S_w2rep("Start evaluating Max delta V Time");
				($verdict, $expectedMaxDeltaV) = EDR_Eval_maximumDeltaV (
			 							  "TimeMaximumDeltaV_EDID" => $EDID_data->{"DataValue"},
										  "Sensor_DataSamples" => $sourceData -> {"DataSamples"},
										  "Sensor_DataUnit" => $sourceData -> {"DataUnit"},
										  "Absolute_Tolerance_Time" => $tcpar_EvalTolerance_abs,
										  "ResamplingRateHz" => SENSOR_RESAMPLING_RATE_HZ,
										  "Rec_Start_Time_ms" => $recStartTime_ms,
										  "Rec_End_Time_ms" => $recEndTime_ms,
										  "Crash_TimeZero_s" => ($crashTimeZero_href -> {"Record_$recordNbr"}) * MILLISEC_TO_SECOND,
										 );
	
				# Test result for DOORS
				my $detectedMaxDeltaVtime = $EDID_data->{"DataValue"};
	 			S_teststep_expected("Delta V values around +/- $tcpar_EvalTolerance_abs ms of max delta V time recorded in EDR are within 10 kmph tolerance of max delta V value from acceleration sensor ($expectedMaxDeltaV kmph)","Evaluation EDID $tcpar_EDIDNbr crash $crash");
				S_teststep_detected("Delta V values around +/- $tcpar_EvalTolerance_abs ms of max delta V time $detectedMaxDeltaVtime ms not within 10 kmph tolerance of max delta V value from acceleration sensor ($expectedMaxDeltaV kmph)","Evaluation EDID $tcpar_EDIDNbr crash $crash") if $verdict eq 'VERDICT_FAIL';
				S_teststep_detected("Delta V values around +/- $tcpar_EvalTolerance_abs ms of max delta V time $detectedMaxDeltaVtime ms is within 10 kmph tolerance of max delta V value from acceleration sensor ($expectedMaxDeltaV kmph)","Evaluation EDID $tcpar_EDIDNbr crash $crash") if $verdict eq 'VERDICT_PASS';
	        }
	        elsif($tcpar_EvalType eq 'MaxDeltaV_Value'){
			S_w2rep("Start evaluating Max delta V value");
			($verdict, $expectedMaxDeltaV) = EDR_Eval_maximumDeltaV (
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
				S_teststep_expected("Max delta V value within +/- $tcpar_EvalTolerance_abs kmph of max delta V sensor ($expectedMaxDeltaV kmph)","Evaluation EDID $tcpar_EDIDNbr crash $crash");
				S_teststep_detected("Max delta V detected is $maxDeltaVdetected kmph","Evaluation EDID $tcpar_EDIDNbr crash $crash");
	        }
	        else {
				S_w2rep("Eval type not known! Choose either MaxDeltaV_Value or MachDeltaV_Time!");
	        }
        	# next record
		}
		# next crash
	}

    return 1;
}

1;