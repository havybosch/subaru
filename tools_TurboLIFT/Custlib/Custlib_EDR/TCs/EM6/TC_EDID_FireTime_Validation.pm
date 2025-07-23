#### TEST CASE MODULE
package TC_EDID_FireTime_Validation;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;


#### HERE SELECTION OF AUTOTEST MODULES ####
use LIFT_general;
use LIFT_evaluation;
use File::Basename;
use Data::Dumper;
use FuncLib_EDR_Framework;
use EDR_Framework::FuncLib_EDR_Offline_xmlLogging;

##################################
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDR_FireTime_Validation  
requires previous crash injection
   with storage of fire times and EDR records in
   Crash / Record handler
   e.g. use TC_EDR_CrashInjection.pm (ONLINE)
   or TC_EDR_CrashDataRetrieval.pm (OFFLINE)

TC does not require any equipment - only previously
   obtained data will be used

=head1 PURPOSE

to validate deployment times stored in EDR

=head1 TESTCASE DESCRIPTION 

    [initialisation]
    initialize record handler

    [stimulation & measurement]
	not needed

    [evaluation]
    1. get list of stored records
    2. evaluate fire time of squib xy for each stored record

    [finalisation]
    not needed

=head1 PARAMETER DESCRIPTION

=head2 PARAMETER NAMES

	SquibLabel --> Label of squib to be evaluated
	EDID --> EDID number of squib to be evaluated
	EvalTolerance_abs --> Tolerance in ms for deployment time
  	

=head2 PARAMETER EXAMPLES

    [TC_EDR_FireTime_Validation.AB1FD]
	# From here on: applicable Lift Default Parameters
	SquibLabel = 'AB1FD'
	EDID = 51
	EvalTolerance_abs = 2 #msec

=cut

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DOCUMENTATION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_EDIDNbr;
my $tcpar_SquibLabel;
my $tcpar_EvalTolerance_abs;
my $tcpar_purpose;
my $tcpar_SupplierValidation;
my $tcpar_ExpectedValueNotDeployed;
my $tcpar_DeploymentStatus_EDID;
my $tcpar_DeploymentStatus_Expected_Deployed;
my $tcpar_DeploymentStatus_Expected_NotDeployed;
my $tcpar_CrashScenarioList;
my $storedCrashLabels_aref;

################ global parameter declaration ###################
#add any global variables here
my(
    $record_handler,
    $crash_handler,
);

our $PURPOSE;
our $TC_name = "TC_EDID_FireTimeValidation";

#-------------------------------------------------------------------------------
sub TC_set_parameters {
#-------------------------------------------------------------------------------
    $tcpar_purpose =  S_read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDIDNbr = S_read_mandatory_testcase_parameter('EDID');
    $tcpar_SquibLabel = S_read_mandatory_testcase_parameter('SquibLabel');
    my @squibLabelArray = split(/_/, $tcpar_SquibLabel);
    $tcpar_SquibLabel = $squibLabelArray[0];
    $tcpar_EvalTolerance_abs = S_read_mandatory_testcase_parameter('EvalTolerance_abs');
    $tcpar_SupplierValidation = S_read_optional_testcase_parameter('SupplierValidation');
    if(not defined $tcpar_SupplierValidation){
        $tcpar_SupplierValidation = 'false';
    }
	$tcpar_CrashScenarioList = S_read_optional_testcase_parameter('CrashScenarioList', 'byref');
    $tcpar_ExpectedValueNotDeployed = S_read_optional_testcase_parameter('ExpectedValueNotDeployed');
    $tcpar_DeploymentStatus_EDID = S_read_optional_testcase_parameter('DeploymentStatus_EDID');
    if(defined $tcpar_DeploymentStatus_EDID){
        $tcpar_DeploymentStatus_Expected_Deployed = S_read_mandatory_testcase_parameter('DeploymentStatus_Expected_Deployed');
        $tcpar_DeploymentStatus_Expected_NotDeployed = S_read_mandatory_testcase_parameter('DeploymentStatus_Expected_NotDeployed');
    }

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
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;

    return 1;
}

#-------------------------------------------------------------------------------
sub TC_stimulation_and_measurement {
#-------------------------------------------------------------------------------
	S_w2rep("No stimulation needed.");

    return 1;
}

#-------------------------------------------------------------------------------
sub TC_evaluation {
#-------------------------------------------------------------------------------
	my $fireTimeValidationResult_href;
	if(defined $tcpar_CrashScenarioList) {
        $storedCrashLabels_aref = $tcpar_CrashScenarioList;
    }
    else {
        $storedCrashLabels_aref = $record_handler -> GetListOfStoredRecords();
    }
	
	foreach my $crash (@{$storedCrashLabels_aref})
	{
        # check whether EDID is there in record
        my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crash, "RecordNumber" => 1, "EDIDnr" => $tcpar_EDIDNbr);
        next unless($edidData);
		
		my $sourceDataCrashLabel;
		if($crash =~ m/(.*)_Supplier/){
			my @splitCrashCode = split('_Supplier', $crash);
			$sourceDataCrashLabel = $splitCrashCode[0];			
		}
		else {
			$sourceDataCrashLabel = $crash;
		}

		my $compareOperator = '==';

		my $crashCode_MDS = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "CrashCode_MDS", "CrashLabel"  => $sourceDataCrashLabel );
		$crashCode_MDS = $crashCode_MDS -> {"DataValues"};

		my $path_MDB = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "MDB_Path",	"CrashLabel"  => $sourceDataCrashLabel );
		$path_MDB = $path_MDB -> {"DataValues"};
		
		S_teststep("------------------------------", 'NO_AUTO_NBR');
		S_teststep("Squib $tcpar_SquibLabel evaluation for Crash $crash", 'AUTO_NBR');
		S_w2log(1, "Crash code: $crashCode_MDS");
		S_w2log(1, "Result DB path: $path_MDB");
		#--------------------------------------------------------------
	    # GET CRASH TIME ZERO
		#    
		my $crashTimeZero = $crash_handler -> GetSourceDataValues ( "SourceLabel" => "CrashTimeZero",
															        "CrashLabel"  => $sourceDataCrashLabel );
		unless(defined $crashTimeZero) {
			S_set_error("No crash time zero stored for crash $crash. No evaluation of fire times possible. Try next crash.", 110)unless ($main::opt_offline);
			next;
		}
		my $crashTimeZero_ms = $crashTimeZero -> {"DataValues"};
		my $crashTimeZeroUnit = $crashTimeZero -> {"DataUnit"};
		if($crashTimeZeroUnit ne "ms") {
			S_set_error("Crash Time zero must be stored in ms!! Go to next crash.", 110);
			next;
		}

        S_w2rep("Crash time zero for fire time validation: $crashTimeZero_ms ms");
		my ($squibVerdict, $allResults) = EDR_Eval_SquibFireTimes("CrashLabel" => $crash,
													"CrashLabel_FireTimes" => $sourceDataCrashLabel,
		                                           "EDID_SquibLabels" => {$tcpar_EDIDNbr => $tcpar_SquibLabel},
		                                           "CrashTimeZero_ms" => $crashTimeZero_ms,
		                                           "FireTimeTolerance_ms" => $tcpar_EvalTolerance_abs,
		                                           "ExpectedValueNotDeployed" => $tcpar_ExpectedValueNotDeployed);

        # Evaluation of deployment status
        if(defined $tcpar_DeploymentStatus_EDID){
            S_teststep("---- Deployment Status ($tcpar_SquibLabel, EDID $tcpar_DeploymentStatus_EDID), crash $crash ---",
                        'NO_AUTO_NBR');
            my ($numberOfIncidents, $crashTimeZero_href) = EDR_getCrashTimeZeroPerRecord ($crashTimeZero_ms);
            foreach my $recordNbr (1..$numberOfIncidents){
                S_teststep("Evaluate Deployment status for squib $tcpar_SquibLabel (EDID $tcpar_DeploymentStatus_EDID) in record $recordNbr",
                            'AUTO_NBR', "DeployStatus_EDID_$tcpar_DeploymentStatus_EDID\_Record_$recordNbr\_$crash");
                my $expectedStatus = $allResults -> {$tcpar_SquibLabel} -> {"Record_$recordNbr"} -> {'ExpectedFireStatus'};
                $expectedStatus = $tcpar_DeploymentStatus_Expected_Deployed if($expectedStatus eq 'Fired');
                $expectedStatus = $tcpar_DeploymentStatus_Expected_NotDeployed if($expectedStatus eq 'NotFired');
                
                S_teststep_expected("$expectedStatus", "DeployStatus_EDID_$tcpar_DeploymentStatus_EDID\_Record_$recordNbr\_$crash");
 
                my $edidData = $record_handler -> GetDecodedEDID( "CrashLabel" => $crash,
                                                                     "RecordNumber"=> $recordNbr,
                                                                     "EDIDnr" => $tcpar_DeploymentStatus_EDID);
                unless(defined $edidData){
                    S_teststep_detected("EDID $tcpar_DeploymentStatus_EDID not stored in record $recordNbr"
                                        , "DeployStatus_EDID_$tcpar_DeploymentStatus_EDID\_Record_$recordNbr\_$crash");
                    S_set_verdict('VERDICT_FAIL');
                    next;
                }
                my $detectedEdidValue = $edidData -> {DataValue};
                EVAL_evaluate_string("EDID_$tcpar_DeploymentStatus_EDID\_Record_$recordNbr", $expectedStatus, $detectedEdidValue);         
                S_teststep_detected("$detectedEdidValue", "DeployStatus_EDID_$tcpar_DeploymentStatus_EDID\_Record_$recordNbr\_$crash");
            }
        }

		# Collect info for HTML table
		foreach my $record (sort keys %{$allResults -> {$tcpar_SquibLabel}})
		{
			my $expected = $allResults -> {$tcpar_SquibLabel} -> {$record} -> {'Expected'};
			my $detected = $allResults -> {$tcpar_SquibLabel} -> {$record} -> {'Detected'};
			my $verdict = $allResults -> {$tcpar_SquibLabel} -> {$record} -> {'Verdict'};
			$fireTimeValidationResult_href -> {"$crash\_$record"} -> {'CrashCode'} = $crashCode_MDS;	
			$fireTimeValidationResult_href -> {"$crash\_$record"} -> {'EDR'} = $detected;	
			$fireTimeValidationResult_href -> {"$crash\_$record"} -> {'MEASUREMENT'} = $expected;	
			$fireTimeValidationResult_href -> {"$crash\_$record"} -> {'Verdict'} = $verdict;
			
			if(S_get_exec_option_NOERROR('CreisOfflineEvalReporting')){
				my @record = split(/_/, $record);
				FLEDR_XML_addStaticEdidNode(
						$record[1], # record number
						'Deployment',
						$tcpar_EDIDNbr,
						"Deployment time $tcpar_SquibLabel",
						$expected,
						$detected,
						$tcpar_EvalTolerance_abs,
						'ms',
						$verdict,
				);
		    }
			
		}
		
		# next Crash
	}
	
	S_w2log(1, "Print summary of fire time validation result to table.\n", undef, 'Summary_Table');
	Print_HTML_ResultTable($tcpar_SquibLabel, $fireTimeValidationResult_href);
	
    return 1;
}


#-------------------------------------------------------------------------------------------------------------------
###
# Internal functions
###

sub Print_HTML_ResultTable {
	
	my $squib = shift;
	my $fireTimes_href = shift;
	
	#-----------------------------------------------------------------------
    # Set up HTML table
    #-----------------------------------------------------------------------
	my $html = <<"HTML_HEADER";
		<TABLE Name = FireTimeValidation class='tablesorter'>
			<caption><h4>Fire time validation squib $squib </h4></caption>
			<TR bgcolor = grey>
				<TH>Crash Name</TH>
				<TH>Crash Code</TH>
				<TH>Fire Time EDR [ms]</TH>
				<TH>Fire Time Measured [ms]</TH>
				<TH>Status</TH>
			</TR>
HTML_HEADER

 	push(@TC_HTML_TEXT ,$html);

	#-----------------------------------------------------------------------
    # Add content to HTML table
    #-----------------------------------------------------------------------
	my ($crashCode, $edrFireTime, $lctFireTime, $verdict);

	foreach my $crashName (keys %{$fireTimes_href})
	{
		$crashCode = $fireTimes_href -> {$crashName} -> {"CrashCode"};
		$edrFireTime = $fireTimes_href -> {$crashName} -> {"EDR"};
		$lctFireTime = $fireTimes_href -> {$crashName} -> {"MEASUREMENT"};
		$verdict = $fireTimes_href -> {$crashName} -> {"Verdict"};

		my $colour;
		$colour = 'red' if ($verdict eq 'VERDICT_FAIL');
		$colour = 'green' if ($verdict eq 'VERDICT_PASS');

		$html = "<TR bgcolor = silver><TD>$crashName</TD><TD>$crashCode</TD><TD>$edrFireTime</TD><TD>$lctFireTime</TD><TD  style='background:$colour'>$verdict</TD>";
		push(@TC_HTML_TEXT ,$html);		
	}

	#-----------------------------------------------------------------------
    # End of HTML Report Table
    #-----------------------------------------------------------------------
	$html = '</TABLE>';
	push(@TC_HTML_TEXT ,$html);	
	
	return 1;
}

1;