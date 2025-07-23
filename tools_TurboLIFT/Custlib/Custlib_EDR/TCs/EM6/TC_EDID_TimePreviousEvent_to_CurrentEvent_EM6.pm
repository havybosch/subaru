#### TEST CASE MODULE
package TC_EDID_TimePreviousEvent_to_CurrentEvent_EM6;

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
use LIFT_crash_simulation;
use LIFT_can_access;
use LIFT_labcar;
use LIFT_PD;
use GENERIC_DCOM;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use FuncLib_SYC_INTERFACE;
use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here
use FuncLib_SYC_INTERFACE;
use FuncLib_EDR_Framework;
use constant MILLISEC_TO_SECOND => 0.001;
use Data::Dumper;
# use LIFT_ProDiag;
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_TimePreviousEvent_to_CurrentEvent

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Activate EDR functionality


I<B<Stimulation and Measurement>>

1. Inject  <CrashScenarioList>. 

Calculate the expected values of corresponding <EDID> from the Injected Crash File.

2. Read corresponding <EDID> and <EDID_MultiEventNumber> in all EDR records


I<B<Evaluation>>

1. -

2. <EDID> =<ExpectedData> 

<EDID_MultiEventNumber>=1 for single and parallel crashes

<EDID> should have value <ExpectedData>,<EDID_MultiEventNumber>=1  in first record and as per injected crash scenario in corresponding EDR records for multi and special events.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'EDID' => 
	SCALAR 'ResultDB' => 
	HASH 'COMSignal1sAfterCrash' => 
	SCALAR 'ExpectedData' => 
	SCALAR 'EvalTolerance_abs' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To Check theTime from previous Event to Current Event'
	EDID = '<Fetch {EDID}>'
	ResultDB = 'EDR'
	COMSignal1sAfterCrash = %()
	ExpectedData='0xFF' 
	#Always only for first record
	EvalTolerance_abs='3'#ms
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_ResultDB;
my $tcpar_COMSignal1sAfterCrash;
my $tcpar_ExpectedData;
my $tcpar_EvalTolerance_abs;
my $tcpar_COMsignalsAfterCrash;
my $tcpar_CrashScenarioList;
my $tcpar_EvalTolerance_abs;
my $tcpar_CrashTimeZero_FirstIncident;
my $tcpar_overwrite;
my $tcpar_EDID_MultiEventNumber;
my $tcpar_read_NHTSAEDR;
my $tcpar_read_CHINAEDR;
################ global parameter declaration ###################
#add any global variables here
my (
		$record_handler,
		$crash_handler,
		$storedCrashLabels_aref,
		$ChinaEDR_diagType,
		$tcpar_DiagType
	);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  S_read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDID =  S_read_mandatory_testcase_parameter( 'EDID' );
	
	$tcpar_ResultDB =  S_read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_EvalTolerance_abs = S_read_mandatory_testcase_parameter('EvalTolerance_abs');
	$tcpar_EDID_MultiEventNumber = S_read_optional_testcase_parameter('EDID_MultiEventNumber');
	$tcpar_overwrite =  S_read_optional_testcase_parameter( 'Overwrite' );
	$tcpar_CrashTimeZero_FirstIncident =  S_read_optional_testcase_parameter( 'CrashTimeZero_FirstIncident','byref' );
	$tcpar_COMsignalsAfterCrash =  S_read_optional_testcase_parameter( 'COMsignalsAfterCrash', 'byref' );
	$tcpar_ExpectedData =  S_read_optional_testcase_parameter( 'ExpectedData' );
	$tcpar_CrashScenarioList = S_read_optional_testcase_parameter('CrashScenarioList', 'byref');
	$tcpar_read_NHTSAEDR=S_read_optional_testcase_parameter('read_NHTSAEDR');
	$tcpar_read_CHINAEDR=S_read_optional_testcase_parameter('read_CHINAEDR');
	$tcpar_DiagType = 'ProdDiag';
	if(not defined $tcpar_read_CHINAEDR) {
		$tcpar_read_NHTSAEDR = 'yes';
		$tcpar_read_CHINAEDR = 'no';
	}
	else {
		$tcpar_read_NHTSAEDR = 'no';
		my $storageOrder = EDR_getStorageOrder();
		return unless(defined $storageOrder);

		if($storageOrder eq 'PhysicalOrder'){
			$ChinaEDR_diagType= 'ProdDiag';  #In platform NHTSA and China EDR is read via proddiag
		}
		else {
			$ChinaEDR_diagType= 'CHINA_Payload';
		}
	}
	return 1;
}

sub TC_initialization {

	# INITIALIZE RECORD AND CRASH HANDLER
	S_w2rep("Initialize Record and Crash Handler", 'DodgerBlue');
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Get list of stored crashes", 'AUTO_NBR');
	# Get a list of all crash labels for which EDR records were stored in
	#   previous test cases
    if(defined $tcpar_CrashScenarioList) {
        $storedCrashLabels_aref = $tcpar_CrashScenarioList;
    }
    else {
        $storedCrashLabels_aref = $record_handler -> GetListOfStoredRecords();
    }
	return 1;
}

sub TC_evaluation {
	my  %crash_to_noise_index = (
		 'Multi_EDR_Noise_Noise_Front_NAD;5' 			=> [0, 1, 1, 0, 0] ,
		 'Multi_EDR_FrontNoise_AnyNoise_SideDriverAD;5' => [0, 1, 1, 0, 0], 
		 'Multi_EDR_Front_AD_Noise_Front_AD;5'			=> [0, 0, 1, 0, 0],
		 'Multi_EDR_LeftSide_ND_Noise_RightSide_AD;5' 	=> [0, 0, 1, 0, 0],
		 'Multi_EDR_FrontAD_FrontND_SideNoise_FrontAD;5'=> [0, 0, 0, 1, 0],
		 'Multi_EDR_Front_NAD_Noise_Front_AD;7'			=> [0, 0, 1, 0, 0],
		 'Multi_EDR_Noise_Noise_Front_AD;5_CN'			=> [0, 1, 1, 0, 0]
		 
	);

	
	
	my $crashTimeZero_incident;
	my $expected_TimePreviousToCurrentEvent_href;
	my $expected_MultiEventNumber_href;

	my $crashnumber=0;
	my $storageOrder = EDR_getStorageOrder();
    return unless(defined $storageOrder);

    if($storageOrder eq 'PhysicalOrder'){
       $storageOrder =  'MostRecentLast'; #same behavior as there is no overwriting
    }
	my $missingCrashCodes;
	foreach my $crash (@{$storedCrashLabels_aref})
	{
		my $noise_index = $crash_to_noise_index{$crash};
		S_w2rep("Quanh dump mang noise_index " . $noise_index . " la " . Dumper($noise_index));
		S_teststep("Validate EDID $tcpar_EDID  for crash $crash", 'AUTO_NBR');
		S_teststep("Validate EDID $tcpar_EDID_MultiEventNumber for crash $crash", 'AUTO_NBR') if (defined $tcpar_EDID_MultiEventNumber);
        #-----------------------------------------------------------------------
        # Get crash time zero
        #-----------------------------------------------------------------------
		S_teststep_2nd_level( "Get crash time zero" , 'AUTO_NBR' );
		my $crashTimeZero = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "CrashTimeZero",
															        "CrashLabel"  => $crash );
		unless(defined $crashTimeZero) {
            S_w2rep("Crash Time zero for $crash not available. Was crash injected?", 'red');
            $missingCrashCodes .= $crash."\n";
			next;
		}
		my $crashTimeZero_ms = $crashTimeZero -> {"DataValues"};
		my $crashTimeZeroUnit = $crashTimeZero -> {"DataUnit"};
		if($crashTimeZeroUnit ne "ms") {
            S_set_error("Crash time zero stored for crash $crash has unit '$crashTimeZeroUnit'. Expected is 'ms'.", 110);
   			next;
		}
		#Quanhh cmt $crashTimeZero_ms have the sample value of .par. => DETECed
		S_w2rep( "Crash Time Zero: $crashTimeZero_ms ms" );
		#-----------------------------------------------------------------------
		# Get number of expected records
		#-----------------------------------------------------------------------
		S_teststep_2nd_level( "Get number of expected records" , 'AUTO_NBR' );
		
		#Quanh cmt : Ham nay trong FuncLib_EDR_Framework, luon luon tra ve numberOfIncidents 
		#Chu number of Records khong lien quan. 
        my ($numberOfRecords, $crashTimeZero_href) = EDR_getCrashTimeZeroPerRecord($crashTimeZero_ms);
		# S_w2rep( "Number of records: $numberOfRecords");
		# if ($numberOfRecords == 4)
		# {
			# $numberOfRecords = 3;
		# }
        my @allCrashTimeZeros = split(/_/, $crashTimeZero_ms);
		###Quanhh 
		

        my $numberOfIncidents = @allCrashTimeZeros;
		
		S_teststep_2nd_level( "Calculate expected multi event number and time between initial to current event" , 'AUTO_NBR' );
		my $previous_incidentNbr  = 1;
		my $total_incident_not_noise = 1;
		
		if (not defined $tcpar_overwrite){
			$expected_TimePreviousToCurrentEvent_href -> {"Incident_$total_incident_not_noise"} = $tcpar_ExpectedData;
			# $expected_MultiEventNumber_href -> {"Incident_$incidentNbr"} = $incidentNbr;
		} 
		else 
		{
			# $expected_TimePreviousToCurrentEvent_href-> {"Incident_$incidentNbr"}=abs($allCrashTimeZeros[$incidentNbr - 1] - ${$tcpar_CrashTimeZero_FirstIncident}[$crashnumber]);			
			;
		}
		foreach my $incidentNbr (2..$numberOfIncidents)
		{
			# my $recordNbr;
			S_w2rep("Quanh dump thu noise index tai vai tri $incidentNbr la " . $noise_index->[$incidentNbr]);
			# $recordNbr = $incidentNbr if($storageOrder eq 'MostRecentLast');
			# $recordNbr = $numberOfRecords - $incidentNbr + 1 if($storageOrder eq 'MostRecentFirst');
			if (not defined $tcpar_overwrite){
				# $previous_incidentNbr= $incidentNbr-1;
				if ($noise_index->[$incidentNbr] == 1 ){
					S_w2rep("Skip incident $incidentNbr vi no la noise");
					last;
				}
				else {
					$total_incident_not_noise += 1;
					my $timeBetweenPreviousToCurrentEvent = abs($allCrashTimeZeros[$incidentNbr - 1] - $allCrashTimeZeros[$previous_incidentNbr-1]); # T0_incidentNbr - T0_previous
					if($timeBetweenPreviousToCurrentEvent > 5000){
						$expected_TimePreviousToCurrentEvent_href -> {"Incident_$total_incident_not_noise"} = $tcpar_ExpectedData;
						# $expected_MultiEventNumber_href -> {"Incident_$incidentNbr"} = 1;
					}
					else{
						$expected_TimePreviousToCurrentEvent_href -> {"Incident_$total_incident_not_noise"} = $timeBetweenPreviousToCurrentEvent;
						# $expected_MultiEventNumber_href -> {"Incident_$incidentNbr"} = $incidentNbr;
					}
				}
				$previous_incidentNbr = $incidentNbr;
			}
			# else{
				# $expected_MultiEventNumber_href -> {"Incident_$incidentNbr"} =$incidentNbr+1;

				# $previous_incidentNbr= $incidentNbr-1;
				# $expected_TimePreviousToCurrentEvent_href-> {"Incident_$incidentNbr"}=abs($allCrashTimeZeros[$incidentNbr - 1] - $allCrashTimeZeros[$previous_incidentNbr-1]);
				
			# }
		}
		$numberOfRecords = $total_incident_not_noise;
		# while($total_incident_not_noise < $numberOfIncidents){
			# $total_incident_not_noise += 1;
			# # $expected_TimePreviousToCurrentEvent_href -> {"Incident_$total_incident_not_noise"} = 'Data Not Available or 1st Event in Multi Event';
			# $expected_TimePreviousToCurrentEvent_href -> {"Incident_$total_incident_not_noise"} = $tcpar_ExpectedData;
		# }
		# my $Quanhh_dumper = Dumper($expected_MultiEventNumber_href);
		# S_w2rep("Quanhh dumper exxpected value: $Quanhh_dumper");
		
		my $Quanhh_dumper_expected_TimePreviousToCurrentEvent_href = Dumper($expected_TimePreviousToCurrentEvent_href);
		S_w2rep("Quanhh dumper exxpected value expected_TimePreviousToCurrentEvent_href: $Quanhh_dumper_expected_TimePreviousToCurrentEvent_href");
		
		# S_w2rep("Quanh dump all record list " . Dumper($record_handler));
        
		
		foreach my $recordNbr (1..$numberOfRecords)
		{
			if ($recordNbr < 4 )
			{
				# Get incident number
				my $incidentNbr;
				my $detectedvalue;
				my $unit;
				$incidentNbr = $numberOfRecords - $recordNbr + 1 if($storageOrder eq 'MostRecentFirst');
				$incidentNbr = $recordNbr if($storageOrder eq 'MostRecentLast');
				
				#Quanh them if multi crash overwrite 
				if ($crash eq 'Multi_EDR_FrontAD_SideLeftAD_FrontAD_SideRightAD;5'){
					$incidentNbr -= 1;
				}
				#-----------------------------------------------------------------------
				# Get EDID data TimePreviousToCurrentEvent
				#-----------------------------------------------------------------------

				my $dataElement = $record_handler -> GetDataElementEDID( "EDIDnr" => $tcpar_EDID,
																	"RecordNumber" => $recordNbr,
																	"CrashLabel" => $crash);

				if (defined $tcpar_overwrite) {
					S_teststep_2nd_level("Evaluate EDID $tcpar_EDID ($dataElement) for crash $crash, record $recordNbr ", 'AUTO_NBR', "Read EDID $tcpar_EDID crash $crash record $recordNbr");
				}
				else {
					S_teststep_2nd_level("Evaluate EDID $tcpar_EDID ($dataElement) for crash $crash, record $recordNbr (incident $incidentNbr)", 'AUTO_NBR', "Read EDID $tcpar_EDID crash $crash record $recordNbr");
				}
				my $expectedTimeBetweenTwoEvents = $expected_TimePreviousToCurrentEvent_href -> {"Incident_$incidentNbr"};
				if ($expectedTimeBetweenTwoEvents =~/0x/){
					my $detectedEDIDvalue = $record_handler -> GetRawEDID("EDIDnr" => $tcpar_EDID,
															 "RecordNumber" => $recordNbr,
															 "CrashLabel" => $crash,
															 "FormatOption" => "HEX");
					unless(defined $detectedEDIDvalue) {
						S_set_error("No EDID data found for crash $crash, record $recordNbr. EDID cannot not be evaluated. Go to next record",110)unless ($main::opt_offline);
						next;
					}
					if(ref $detectedEDIDvalue eq 'ARRAY') {
						my $detectedEDIDvalueString;
						foreach my $hexElement (@{$detectedEDIDvalue})
						{
							$detectedEDIDvalueString .= $hexElement;
						}
						$detectedvalue = $detectedEDIDvalueString;
					}
					else{
						$detectedvalue=$detectedEDIDvalue;
					}
					$detectedvalue = "0x".$detectedEDIDvalue;										 
				}
				else {
					my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crash, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID );
					$detectedvalue = $edidData -> {"DataValue"};
					$unit = $edidData -> {"ValueUnit"};
					unless(defined $detectedvalue) {
						S_set_error("No data could be obtained for EDID $tcpar_EDID")unless ($main::opt_offline);
						next;
					}
				}
				
				if (($expectedTimeBetweenTwoEvents eq 'DataNotAvailable') or ($detectedvalue =~ /[a-zA-Z]/)){
					S_w2rep("Quanh aboutto comprea string $expectedTimeBetweenTwoEvents and $detectedvalue"); 
					EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation ", $expectedTimeBetweenTwoEvents, $detectedvalue );
				}
				else {
					S_w2rep("Quanh aboutto comprea NUMBER  $expectedTimeBetweenTwoEvents and $detectedvalue");
					EVAL_evaluate_value ( "EDID_$tcpar_EDID\_Evaluation ", $detectedvalue,'==', $expectedTimeBetweenTwoEvents ,$tcpar_EvalTolerance_abs, 'absolute');
				}
				S_teststep_expected("Time from Previous Event to Current Event should be: $expectedTimeBetweenTwoEvents ms  ",  "Read EDID $tcpar_EDID crash $crash record $recordNbr");#evaluation 1
				S_teststep_detected("Time from Previous Event to Current Event is: $detectedvalue $unit ",  "Read EDID $tcpar_EDID crash $crash record $recordNbr");
				#-----------------------------------------------------------------------
				# Get EDID data MultiEventNumber
				#-----------------------------------------------------------------------
				# if (defined $tcpar_EDID_MultiEventNumber){
					# $dataElement = $record_handler -> GetDataElementEDID( "EDIDnr" => $tcpar_EDID_MultiEventNumber,
																		# "RecordNumber" => $recordNbr,
																		# "CrashLabel" => $crash);
					# if (defined $tcpar_overwrite) {
						# S_teststep_2nd_level("Evaluate EDID $tcpar_EDID_MultiEventNumber ($dataElement) for crash $crash, record $recordNbr ", 'AUTO_NBR', "Read EDID $tcpar_EDID_MultiEventNumber crash $crash record $recordNbr");
					# }
					# else {
						# S_teststep_2nd_level("Evaluate EDID $tcpar_EDID_MultiEventNumber ($dataElement) for crash $crash, record $recordNbr (incident $incidentNbr)", 'AUTO_NBR', "Read EDID $tcpar_EDID_MultiEventNumber crash $crash record $recordNbr");
					# }
					# my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crash, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID_MultiEventNumber );
					# $detectedvalue = $edidData -> {"DataValue"};
					# $unit = $edidData -> {"ValueUnit"};
					# unless(defined $detectedvalue) {
						# S_set_error("No data could be obtained for EDID $tcpar_EDID_MultiEventNumber")unless ($main::opt_offline);
						# next;
					# }
					# Quanh sua tiep 					my $expectedMultiEventNumber = $expected_MultiEventNumber_href -> {"Incident_$incidentNbr"};
					# my $expectedMultiEventNumber = $incidentNbr;
					# EVAL_evaluate_value ( "EDID_$tcpar_EDID_MultiEventNumber\_Evaluation", $detectedvalue,'==', $expectedMultiEventNumber );
					# S_teststep_expected("$expectedMultiEventNumber ",  "Read EDID $tcpar_EDID_MultiEventNumber crash $crash record $recordNbr");#evaluation 2
					# S_teststep_detected("$detectedvalue ",  "Read EDID $tcpar_EDID_MultiEventNumber crash $crash record $recordNbr");
				# }
			
			}
			else
			{
				;
			}
		}
		$crashnumber++;
	}

    if($missingCrashCodes){
        S_set_error("For following crash codes crash time zero was not available in crash handler and they could not be evaluated:\n".
                      $missingCrashCodes.
                      "Inject all required crashes before running this test case.", 110)unless ($main::opt_offline);
    }


	return 1;
}

sub TC_finalization {

	return 1;
}


1;
