#### TEST CASE MODULE
package TC_EDID_SquibFaulty_EM6;

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
use LIFT_general;
use LIFT_evaluation;
use LIFT_PD;
use LIFT_crash_simulation;
use LIFT_CANoe;
use LIFT_labcar;
use LIFT_QuaTe;
use LIFT_MDSRESULT;
use LIFT_equipment;
use GENERIC_DCOM;
use LIFT_can_access;
use LIFT_flexray_access;
use LIFT_evaluation;
use LIFT_FaultMemory;
use INCLUDES_Project;
use File::Basename;
use Data::Dumper;
use FuncLib_EDR_Framework;
use FuncLib_SYC_INTERFACE;
use FuncLib_CustLib_EDR_CNEDR;
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_SquibFaulty

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Activate EDR functionality


I<B<Stimulation and Measurement>>

(1) Config Driver Side <DriverSide>

(2) Prepare crash <CrashCode>

(3) Create squib faults on squibs <SquibLabel>

(4-1) Create <FaultCondition> fault on <SquibLabel>

(4-2) Wait for fault qualification

(4-3) Read fault memory

(5) Dequalified fault <FaultCondition> if <DequalifiedFlag> eq Yes

(6) Start fire time Measurement

(7) Inject crash <CrashCode>

(8) Stop fire time Measurement

(9) Read EDR after crash (EDID <EDID_SquibLabel>)


I<B<Evaluation>>

(1) -

(4-3) Check that faults are qualified and no additional faults are stored

(6)

    a) Number of stored records

    b) Correct values stored for <EDID_SquibLabel> in all records


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'CrashCode' => 
	SCALAR 'ResultDB' => 
	SCALAR 'CrosscouplingSquib' => 
	SCALAR 'SquibLabel' => 
	SCALAR 'FaultCondition' => 
	SCALAR 'DequalifiedFlag' => 
	SCALAR 'DriverSide' => 
	SCALAR 'NbrOfExpectedRecords' => 
	SCALAR 'EDID_SquibLabel' => 
	SCALAR 'ExpectedValue_DataNotAvailable' => 
	SCALAR 'ExpectedValue_InvalidData' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To Validate EDIDs related to squib deployment time when squib is faulty'
	# Stimulation
	CrashCode = 'tbd'
	ResultDB = 'EDR'
	#Crosscoupling/Short2Bat/OpenLine/Undefined/Short2Gnd/Short2Bat
	CrosscouplingSquib = 'tbd' # required if 'InvalidDataFault' is 'Crosscoupling'
	SquibLabel =  '<Test Heading 1>'
	FaultCondition = '<Test Heading 2>'
	DequalifiedFlag = '<Test Heading 3>'
	DriverSide = '<Test Heading 4>'
	# Evaluation
	NbrOfExpectedRecords = 2
	EDID_SquibLabel = 'tbd'
	ExpectedValue_DataNotAvailable = 'Not deployed'
	ExpectedValue_InvalidData = 'ValidFireTime' # The keyword 'ValidFireTime' will evaluate the squib checking that a fire time >= 0 is stored. This is the CA behavior. If there is a different handling in your project, you can give a different value here based on the interpreted value stored, e.g. 'InvalidData' or 'SquibFaulty'
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_CrashCode;
my $tcpar_ResultDB;
my $tcpar_CrosscouplingSquib;
my $tcpar_SquibLabel;
my $tcpar_FaultCondition;
my $tcpar_DequalifiedFlag;
my $tcpar_DriverSide;
my $tcpar_NbrOfExpectedRecords;
my $tcpar_EDID_SquibLabel;
my $tcpar_ExpectedValue_DataNotAvailable;
my $tcpar_ExpectedValue_InvalidData;
my $tcpar_read_subaru;
my $tcpar_read_CHINAEDR;
 my $tcpar_COMsignalsAfterCrash;
my $tcpar_DiagType;
my $storageOrder;
my $tcpar_Crash_time_Zero;
my $tcpar_EvalTolerance_abs;
################ global parameter declaration ###################
#add any global variables here
my ($crashDetails_href,
    $crashSettings,
    $record_handler,
    $faultsAfterStimulation,
    $crashInfo_href,
    @faultsCreated,
    $edrNumberOfEventsToBeStored,
	$ChinaEDR_diagType,
	$SubaruEDR_diagType,
	$Subaru_payload,
	$crash_handler,
	);
my $fireTimeEvalKeywordsCount = 0; #To get unique fire time eval keywords
my $ringbufferEvalKeywordsCount = 0; #To get unique ringbuffer eval keywords
my $comSignalEvalKeywordsCount = 0; #To get unique fire time eval keywords

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_CrashCode =  GEN_Read_mandatory_testcase_parameter( 'CrashCode' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_CrosscouplingSquib =  GEN_Read_mandatory_testcase_parameter( 'CrosscouplingSquib' );
	$tcpar_SquibLabel =  GEN_Read_mandatory_testcase_parameter( 'SquibLabel' );
	$tcpar_FaultCondition =  GEN_Read_mandatory_testcase_parameter( 'FaultCondition' );
	$tcpar_DequalifiedFlag =  GEN_Read_mandatory_testcase_parameter( 'DequalifiedFlag' );
	$tcpar_DriverSide =  GEN_Read_mandatory_testcase_parameter( 'DriverSide' );
	$tcpar_NbrOfExpectedRecords =  GEN_Read_mandatory_testcase_parameter( 'NbrOfExpectedRecords' );
	$tcpar_EDID_SquibLabel =  GEN_Read_mandatory_testcase_parameter( 'EDID_SquibLabel' );
	$tcpar_ExpectedValue_DataNotAvailable =  GEN_Read_mandatory_testcase_parameter( 'ExpectedValue_DataNotAvailable' );
	$tcpar_ExpectedValue_InvalidData =  GEN_Read_mandatory_testcase_parameter( 'ExpectedValue_InvalidData' );
	$tcpar_Crash_time_Zero =GEN_Read_mandatory_testcase_parameter('CrashTimeZero_ms');
	$tcpar_read_CHINAEDR=S_read_optional_testcase_parameter('read_CHINAEDR');
	$tcpar_read_subaru = S_read_optional_testcase_parameter('read_SUBARU');
	$tcpar_EvalTolerance_abs =  GEN_Read_mandatory_testcase_parameter('EvalTolerance_abs');
	$storageOrder = EDR_getStorageOrder();
	return unless(defined $storageOrder);

	if($storageOrder eq 'PhysicalOrder'){
		$ChinaEDR_diagType= 'Prodiag';  #In platform NHTSA and China EDR is read via proddiag
	}
	else {
		$ChinaEDR_diagType= 'CHINA_Payload';
	}
	
	if( $tcpar_read_subaru eq 'yes')
	{
		$SubaruEDR_diagType ='Subaru_payload';
	}
	return 1;
}

sub TC_initialization {

	#--------------------------------------------------------------
    # INITIALIZE RECORD AND CRASH HANDLER
    #    
	S_w2rep("Initialize Record Handler");
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler()  || return;
	#--------------------------------------------------------------
    # GET CRASH DETAILS
    #    
	# Crash name or index and result DB from EDR mapping
    $crashDetails_href = {'RESULTDB' => $tcpar_ResultDB, 'CRASHNAME' => $tcpar_CrashCode};

	# Crash settings
    $crashSettings = CSI_GetCrashDataFromMDS($crashDetails_href);
    unless(defined $crashSettings) {
        S_set_error("Crash $tcpar_CrashCode not available in result DB $tcpar_ResultDB. Test case aborted.");
        return;
    }

	# Crash code in World DB
	$crashInfo_href -> {"CrashCode_MDS"} = '$tcpar_CrashCode';

	# Name of Result DB
	my $resultDB = $crashDetails_href -> {"RESULTDB"};
	unless(defined $resultDB) {
		$resultDB = "DEFAULT";
	}

	# Result DB path
	my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$resultDB" ] );
	$crashInfo_href -> {"MDB_Path"} = $resultDBDetails->{'PATH'};

	#--------------------------------------------------------------
    # Initialize equipment
    #    
	LC_MeasureTraceDigitalConfigureThresholds( ['ALL'], 0.5 );

	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
    GDCOM_init () ; # To fetch info for CD from mapping_diag
    CA_trace_start();

	# Set environment settings for crash
    CSI_PrepareEnvironment($crashSettings, 'init_complete');
	S_wait_ms('TIMER_ECU_READY');

    PD_ClearCrashRecorder();
    S_wait_ms(2000);

    # erase FltMem
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	# read fault memory
    my $faultsBeforeStimulation = LIFT_FaultMemory -> read_fault_memory('Bosch');

	#Fault memory must be empty
    my $faultsVerdict = $faultsBeforeStimulation -> evaluate_faults({});
	return 0 if ($faultsVerdict eq 'VERDICT_FAIL');


	return 1;
}

sub TC_stimulation_and_measurement {



	#--------------------------------------------------------------
    # CRASH PREPARATION
    #
	S_teststep("Prepare crash '$tcpar_CrashCode'", 'AUTO_NBR');
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');

	# Prepare crash
    CSI_LoadCrashSensorData2Simulator($crashSettings);

	# Power ON the ECU
	LC_ECU_On();
 	S_wait_ms('TIMER_ECU_READY');
 	
 	CSI_PrepareEnvironment( $crashSettings, 'before_crash_same_cycle','normal' );
    S_wait_ms(1000);


	S_teststep(" Create squib faults on squibs '$tcpar_SquibLabel'", 'AUTO_NBR', "Squib_Fault_Creation");
	S_teststep_2nd_level("Create '$tcpar_FaultCondition' fault on '$tcpar_SquibLabel'", 'AUTO_NBR');
	 _create_squib_fault($tcpar_SquibLabel, $tcpar_FaultCondition);
	 
	S_teststep_2nd_level( "Wait 5 sec for fault qualification", 'AUTO_NBR');
	S_wait_ms(5000);

	S_teststep_2nd_level( "Read fault memory", 'AUTO_NBR');
    $faultsAfterStimulation = LIFT_FaultMemory -> read_fault_memory('Bosch');
	
	
	#--------------------------------------------------------------
    # START MEASUREMENTS
    #
	S_teststep("Start LCT Measurement", 'AUTO_NBR');
    LC_MeasureTraceDigitalStart();

	#--------------------------------------------------------------
    # CRASH INJECTION
    #
	S_teststep("Inject crash '$tcpar_CrashCode'", 'AUTO_NBR');
	CSI_TriggerCrash();
    S_wait_ms(15000);

	#--------------------------------------------------------------
    # STOP MEASUREMENTS
    #
	S_teststep("Stop LCT Measurement", 'AUTO_NBR');
    LC_MeasureTraceDigitalStop();
	if (defined $tcpar_COMsignalsAfterCrash){
		foreach my $signal (keys %{$tcpar_COMsignalsAfterCrash})
		{
			my $dataOnCOM = $tcpar_COMsignalsAfterCrash -> {$signal};
			S_w2rep("Signal =$signal,Data to be sent=$dataOnCOM");
			COM_setSignalState($signal,$dataOnCOM);
		}
        S_wait_ms(2000);
	}

	#--------------------------------------------------------------
    # READ AND STORE CRASH RECORDS
    #
    my $dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number()."_".$tcpar_CrashCode;

	S_teststep("Read EDR after crash (EDID $tcpar_EDID_SquibLabel)",
	               'AUTO_NBR', 'read_edr');

	$edrNumberOfEventsToBeStored = SYC_EDR_get_NumberOfEventsToBeStored();
	unless(defined $edrNumberOfEventsToBeStored){
        S_set_error("Number of records to be stored not available in SYC - add or overwrite with Custlibrary Function");
        return;
    }

	PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');
	# EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								# "CrashLabel" => $tcpar_CrashCode."_$tcpar_SquibLabel_Asic1\_$tcpar_SquibLabel_Asic2\_Faulty",
								# "NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								# "StoragePath" => $dataStoragePath,
								# "CrashInfo" => $crashInfo_href,);
	Prepertation();
	# S_wait_ms(500);
	S_wait_ms(1000);
	if ( lc( $tcpar_read_subaru) eq 'yes' ) {
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $SubaruEDR_diagType,
								"CrashLabel" =>$tcpar_CrashCode,#."_$tcpar_SquibLabel\_Faulty",
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA')
	}
	if (lc($tcpar_read_CHINAEDR) eq 'yes'){
		$edrNumberOfEventsToBeStored=3;
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $ChinaEDR_diagType,
								"CrashLabel" =>$tcpar_CrashCode,#."_$tcpar_SquibLabel\_Faulty",
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA');
	}
	
	my $lct_Data = LC_MeasureTraceDigitalGetValues();
	my $squibLabels_aref;
	# Get list of all measured squib labels
	foreach my $lctTimeStamp (keys %{$lct_Data})
	{
		foreach my $squib (keys %{$lct_Data -> {$lctTimeStamp}})
		{
			push(@{$squibLabels_aref}, $squib);
		}
		last;
	}
	if(defined $squibLabels_aref) {
		EVAL_dump2UNV( $lct_Data, "$dataStoragePath/LCT_Measurement_$tcpar_CrashCode.txt.unv" );
		# EDR_addFireTimesToCrashHandler ("LCT_Measurement" => $lct_Data,
		EDR_addFireTimesToCrashHandler ("LCT_Measurement" => $lct_Data,
										"SquibLabels" => $squibLabels_aref,
										"CrashLabel"  => $tcpar_CrashCode,#."_$tcpar_SquibLabel\_Faulty",
										"StoragePath" => $dataStoragePath)
		#Quanh them ne revert thi xoa dong nay
										;
		S_w2rep("Quanh dump squibLabels_aref saukhi chay ham ".Dumper($squibLabels_aref));
		S_w2rep("Quanh dump lct data saukhi chay ham ".Dumper($lct_Data));
	}
	
	
	
	return 1;
}

sub TC_evaluation {
	
	my ($squibVerdict, $allResults) = EDR_Eval_SquibFireTimes_Quanhh("CrashLabel" => $tcpar_CrashCode,#."_$tcpar_SquibLabel\_Faulty",
													"CrashLabel_FireTimes" => $tcpar_CrashCode,
		                                           "EDID_SquibLabels" => {$tcpar_EDID_SquibLabel => $tcpar_SquibLabel},
		                                           "CrashTimeZero_ms" => $tcpar_Crash_time_Zero,
		                                           "FireTimeTolerance_ms" => $tcpar_EvalTolerance_abs,
												   
		                                          );
	S_w2rep("quanhh dump squibVerdict ".Dumper($squibVerdict));
	S_w2rep("quanhh dump allResults ".Dumper($allResults));
    # #--------------------------------------------------------------
    # # FAULT QUALIFICATION
    # #
    # my $expectedFaults_href = {};
    # my $faultIndex = 1;
    # foreach my $fault (@faultsCreated){
        # $expectedFaults_href -> {'mandatory'} -> {$fault} = {
            # 'DecodedStatus' => { 'TestFailed' => 1,}, # fault in qualified state     
        # };
    # }

	# my $faultsVerdict = $faultsAfterStimulation -> evaluate_faults( $expectedFaults_href, 'Squib_Fault_Creation' );

	# if($faultsVerdict eq 'VERDICT_FAIL' and not $main::opt_offline){
	    # S_w2rep("As intended faults were not stimulated, continuing the test is not useful.\n"
	               # ." Check why fault creation failed and repeat test.");
    	# S_set_verdict('VERDICT_FAIL') ;
	    # return 1;
	# }

    # my $crashLabel = $tcpar_CrashCode."_$tcpar_SquibLabel\_Faulty";
	# S_w2rep("Quanhh finished  fault qualification ","Pink");
    # #--------------------------------------------------------------
    # # NUMBER OF EXPECTED RECORDS
    # #
    # S_teststep("--------------------------------------------------------", 'NO_AUTO_NBR');
    # S_teststep("NUMBER OF EXPECTED RECORDS", 'NO_AUTO_NBR');
    # S_teststep_expected_NOHTML("--------------------------------------------------------");
    # S_teststep_expected_NOHTML("NUMBER OF EXPECTED RECORDS");
    # S_teststep_detected_NOHTML("--------------------------------------------------------");
    # S_teststep_detected_NOHTML("NUMBER OF EXPECTED RECORDS");

    # my $detectedNbrOfStoredRecords = 0;
    # foreach my $recordNumber (1..$edrNumberOfEventsToBeStored)
    # {
        # my $recordAvailable = $record_handler -> IsRecordAvailable("CrashLabel" => $crashLabel,
                                                                   # "RecordNumber"=> $recordNumber);
        # $detectedNbrOfStoredRecords++ if ($recordAvailable);
    # }
    # S_teststep_expected("Expected records: $tcpar_NbrOfExpectedRecords", 'read_edr'); #evaluation 1
    # my $verdict= EVAL_evaluate_value("NumberOfRecords", $detectedNbrOfStoredRecords,
                                        # '==', $tcpar_NbrOfExpectedRecords);
    # S_teststep_detected("Records stored: $detectedNbrOfStoredRecords", 'read_edr');

    # if($detectedNbrOfStoredRecords == 0) {
        # S_w2rep("No further evaluation done since no record was stored.");
        # return 1;
    # }

    # #--------------------------------------------------------------
    # # SQUIB VALUE VALIDATION
    # #
    # S_teststep("--------------------------------------------------------", 'NO_AUTO_NBR');
    # S_teststep("SQUIB VALUE VALIDATION", 'NO_AUTO_NBR');
    # S_teststep_expected_NOHTML("--------------------------------------------------------");
    # S_teststep_expected_NOHTML("SQUIB VALUE VALIDATION");
    # S_teststep_detected_NOHTML("--------------------------------------------------------");
    # S_teststep_detected_NOHTML("SQUIB VALUE VALIDATION");

    # my $dataElement = $record_handler -> GetDataElementEDID(  "EDIDnr" => $tcpar_EDID_SquibLabel,
                                                                     # "RecordNumber" => 1,
                                                                     # "CrashLabel" => $crashLabel);
    # # my $dataElement_Asic2 = $record_handler -> GetDataElementEDID(  "EDIDnr" => $tcpar_EDID_SquibLabel_Asic2,
                                                                     # # "RecordNumber" => 1,
                                                                     # # "CrashLabel" => $crashLabel);
    # S_teststep("Read EDID $tcpar_EDID_SquibLabel in all records.",'AUTO_NBR');

    # my $expectedValues_href = {};
    # $expectedValues_href -> {$tcpar_EDID_SquibLabel} = $tcpar_ExpectedValue_InvalidData; # if($tcpar_FaultCondition eq 'InvalidData');
 
    # # $expectedValues_href -> {$tcpar_EDID_SquibLabel} = $tcpar_ExpectedValue_DataNotAvailable   if($tcpar_FaultCondition eq 'DataNotAvailable');
	# # my $expectedValues_href -> {$tcpar_EDID_SquibLabel} = ;

    # foreach my $recordNumber (1..$detectedNbrOfStoredRecords){
        # # Squib Asic 1
    	# _evaluate_squib_value( $tcpar_SquibLabel,
    							# $tcpar_EDID_SquibLabel,
    							# $expectedValues_href -> {$tcpar_EDID_SquibLabel},
    							# $crashLabel,
    							# $recordNumber);

        # # Squib Asic 2
    	# # _evaluate_squib_value(  $tcpar_SquibLabel_Asic2,
    							# # $tcpar_EDID_SquibLabel_Asic2,
    							# # $expectedValues_href -> {$tcpar_EDID_SquibLabel_Asic2},
    							# # $crashLabel,
    							# # $recordNumber);
        # # next record
    # }

	return 1;
}

sub TC_finalization {
	  S_teststep("Delete crashes from record handler and ECU", 'AUTO_NBR');
    foreach my $recordNbr (1..$tcpar_NbrOfExpectedRecords)
    {
        $record_handler -> DeleteRecord(
                    "RecordNumber" => $recordNbr,
                    "CrashLabel" => $tcpar_CrashCode
        );
    }

	
   	
	
	
    # Erase EDR
    PD_ClearCrashRecorder();

    S_teststep("Reset squib fault manipulation", 'AUTO_NBR');
    _remove_squib_fault($tcpar_SquibLabel, $tcpar_FaultCondition) ;#if ($tcpar_FaultCondition =~ m/Invalid|InvalidData/);
    # _remove_squib_fault($tcpar_SquibLabel, $tcpar_DataNotAvailableFault) if ($tcpar_FaultCondition eq 'DataNotAvailable');

  

	# Erase Fault memory
    PD_ClearFaultMemory();

	# Reset ECU    
    PD_ECUreset();
    S_wait_ms('TIMER_ECU_READY');

	# Read fault memory after clearing and erasing EDR
    PD_ReadFaultMemory();

    LC_ECU_Off();
    S_wait_ms('TIMER_ECU_OFF');
	return 1;
}


sub _evaluate_squib_value {
	my $squibLabel = shift;
	my $squibEdid = shift;
	my $expectedValue = shift;
	my $crashLabel = shift;
	my $recordNbr = shift;

    S_teststep_2nd_level("Read EDID $squibEdid in record $recordNbr",
                        'AUTO_NBR',
                        "EDID_$squibEdid\_Record_$recordNbr");
    # my $detectedSquibState_href = $record_handler -> GetDecodedEDID(
                                                         # "EDIDnr" => $squibEdid,
                                                         # "RecordNumber" => $recordNbr,
                                                         # "CrashLabel" => $crashLabel); 
	my  $detectedSquibState_href = $record_handler -> GetRawEdidDataSamples( 
																			"EDIDnr" => $squibEdid,
																		    "RecordNumber" => $recordNbr,
																		    "CrashLabel" => $crashLabel,
																		   # "FormatOption" => "HEX"
																				"FormatOption" => "DEC");
	
	S_w2rep("QUanhh dumper ".Dumper($detectedSquibState_href),"GREEN");
    unless(defined $detectedSquibState_href){
    	S_set_error("No EDID data obtained for EDID $squibEdid in record $recordNbr.\n".
                   	"Check whether EDR is reported or squib $squibLabel is configured or not");
        return 1;
    }

    my $detectedValueSquib = $detectedSquibState_href -> {"DataValue"};

    if($expectedValue eq 'ValidFireTime'){
	    S_teststep_expected($expectedValue." -> greater than 0",
	                            "EDID_$squibEdid\_Record_$recordNbr" );
	    S_teststep_detected($detectedValueSquib,
	                            "EDID_$squibEdid\_Record_$recordNbr" );

		if($detectedValueSquib =~ /^[A-Z]|[a-z]/){
			S_set_verdict('VERDICT_FAIL');
		}
		else{
		    EVAL_evaluate_value ( "EDID_$squibEdid\_Record_$recordNbr" ,
		     						$detectedValueSquib,
		       						'>=',
		                            0);
		}
	}
	else{
	   # COMPARE EXPECTED AND DETECTED SQUIB STATE
        S_teststep_expected($expectedValue,
	                            "EDID_$squibEdid\_Record_$recordNbr" );
	    S_teststep_detected($detectedValueSquib,
	                            "EDID_$squibEdid\_Record_$recordNbr" );

	    EVAL_evaluate_string ( "EDID_$squibEdid\_Record_$recordNbr" ,
	                            $expectedValue ,
	                            $detectedValueSquib  );
	}

	return 1;
}

sub _create_squib_fault{
    my $squibLabel = shift;
    my $faultType = shift;
    # my $crosscouplingSquib = shift;

    if($faultType eq 'Short2Bat'){
        LC_ShortLines( [$squibLabel.'+', 'B+'] );
        push(@faultsCreated, 'rb_sqm_TerminalShort2Bat'.$squibLabel.'_flt');
    }
    elsif($faultType eq 'Short2Gnd'){
        LC_ShortLines( [$squibLabel.'+', 'B-'] );
        push(@faultsCreated, 'rb_sqm_TerminalShort2Gnd'.$squibLabel.'_flt');
    }
    # elsif($faultType eq 'Crosscoupling'){
        # LC_ShortLines([$squibLabel.'+', $crosscouplingSquib.'+'] );
        # push(@faultsCreated, 'rb_sqm_Crosscoupling'.$squibLabel.'_flt');
        # push(@faultsCreated, 'rb_sqm_Crosscoupling'.$crosscouplingSquib.'_flt');
    # }
    elsif($faultType eq 'Short'){
        LC_ShortLines( [$squibLabel.'+', $squibLabel.'-'] );
        push(@faultsCreated, 'rb_sqm_SquibResistanceShort'.$squibLabel.'_flt');
    }
    elsif($faultType eq 'OpenLine'){
        LC_DisconnectLine( $squibLabel );
        push(@faultsCreated, 'rb_sqm_SquibResistanceOpen'.$squibLabel.'_flt');
    }
    elsif($faultType eq 'NotConfigured'){
        PD_Device_configuration( 'clear', [$squibLabel] );
        LC_DisconnectLine( $squibLabel );
    }
    else{
        S_set_error("Given fault type '$faultType' not known!");
    }

    LC_ECU_Off();
    S_wait_ms('TIMER_ECU_OFF');
    LC_ECU_On();
    S_wait_ms('TIMER_ECU_READY');

    return 1;
}



sub _remove_squib_fault{
    my $squibLabel = shift;
    my $faultType = shift;
    # my $crosscouplingSquib = shift;

	S_w2log(4, "_remove_squib_fault -> Fault type: $faultType");
    if($faultType =~ m/Short2Bat|Short2Gnd|Crosscoupling|Short/){
        LC_UndoShortLines();
    }
    elsif($faultType eq 'OpenLine'){
        LC_ConnectLine( $squibLabel );
    }
    elsif($faultType eq 'NotConfigured'){
        PD_Device_configuration( 'set', [$squibLabel] );
        LC_ConnectLine( $squibLabel );
    }

    LC_ECU_Off();
    S_wait_ms('TIMER_ECU_OFF');
    LC_ECU_On();
    S_wait_ms('TIMER_ECU_READY');


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
#### PREPEARETION for DSM 

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



sub EDR_Eval_SquibFireTimes_Quanhh {
#-------------------------------------------------------------------------------
    my @args = @_;
    my $params = { @args };

    S_w2log(3, "Starting EDR_Eval_SquibFireTimes...");
    my $squib_EDIDs_href = $params->{EDID_SquibLabels};
    my $crashLabel = $params->{CrashLabel};
    my $crashLabel_FireTimes = $params -> {CrashLabel_FireTimes};
    my $crashTimeZero_ms = $params->{CrashTimeZero_ms};
    my $fireTimeTolerance_ms = $params->{FireTimeTolerance_ms};
    my $fixedRecordNumber = $params -> {RecordNumber};
    my $multiEventIncidentNumber = $params -> {MultiEventIncidentNumber};
    my $expectedValueNotDeployed = $params -> {ExpectedValueNotDeployed};
    if(not defined $expectedValueNotDeployed){
        my $mappingEDR = S_get_contents_of_hash(['Mapping_EDR']);
        $expectedValueNotDeployed = $mappingEDR -> {'SquibValueNotDeployed_Decoded'};
        $expectedValueNotDeployed = 'DataNotAvailable' if (not defined $expectedValueNotDeployed);
    }

    #-------------------------------------------------
    # CHECK MANDATORY PARAMETERS
    #
    @args = ($squib_EDIDs_href, $crashLabel, $crashTimeZero_ms, $fireTimeTolerance_ms, $crashLabel_FireTimes, $fixedRecordNumber, $multiEventIncidentNumber);
    return unless S_checkFunctionArguments( 'EDR_Eval_SquibFireTimes_Quanhh ( $squib_EDIDs_href , $crashLabel, $crashTimeZero_ms, $fireTimeTolerance_ms[, $crashLabel_FireTimes, $fixedRecordNumber , $multiEventIncidentNumber ])', @args );

    unless(defined $crashLabel_FireTimes) {
        $crashLabel_FireTimes = $crashLabel;
    }

    unless(defined $record_handler) {
        S_set_error("Record handler not initialized!");
        return;
    }

    unless(defined $crash_handler) {
        S_set_error("Crash handler not initialized!");
        return;
    }

    my $mappingEDR = S_get_contents_of_hash(['Mapping_EDR']);
    my $storageOrder = $mappingEDR -> {"StorageOrder"};
    unless(defined $storageOrder) {
        S_set_error("Define 'StorageOrder' in EDR mapping! Must be 'MostRecentFirst' or 'MostRecentLast' or 'PhysicalOrder'");
        return;
    }
    if($storageOrder eq 'PhysicalOrder'){
        S_set_warning("Storage order 'PhysicalOrder' will be treated as 'MostRecentLast' for fire time validation.\n".
                        "For scenarios where overwriting takes place, use EDR_Eval_SquibFireTimes for specific record numbers only!");
        $storageOrder = 'MostRecentLast';
    }

    my $evaluationVerdict = 'VERDICT_PASS';

    # Loop over all squibs which are to be evaluated
    my $allResults_href; # store all expected and detected values for returning
    foreach my $squibEDID (keys %{$squib_EDIDs_href})
    {
        my $squibLabel = $squib_EDIDs_href -> {$squibEDID};
        S_w2log(1, "*****************");
        S_w2log(1, "Squib $squibLabel");
        S_w2log(1, "*****************");

        my @crashTimesZero_array = split(/_/, $crashTimeZero_ms);

        #--------------------------------------------------------------
        # GET MEASURED SQUIB FIRE TIME
        #    
        S_w2log(1, "Get measured squib fire time '$squibLabel' in crash $crashLabel_FireTimes");
        my $sourceData  = $crash_handler -> GetSourceDataValues ( "SourceLabel"=>$squibLabel, "CrashLabel" => $crashLabel_FireTimes);
        my $compareOperator;
        unless(defined $sourceData){
            S_w2log(1, "No measured data (from LCT or TRC) for squib '$squibLabel' found.");
            if($main::opt_offline) {
                S_w2log(1, "Offline run, set value to 1 ms.");
                $sourceData -> {"DataValues"} = $crashTimesZero_array[0] + 2;
                $sourceData -> {"DataUnit"} = 'ms';
                $compareOperator = '==';
            }
            else {
                S_w2log(1, "No fire time was measured, set expected value to 'DataNotAvailable'.");
                $sourceData = {"DataValues" => 'DataNotAvailable', "DataUnit" => 'ms'};
                $compareOperator = 'eq';
            }
        }

		my $ref_FireTimes = ref($sourceData -> {"DataValues"}) ;

        my $sourceData_CurrentDuration  = $crash_handler -> GetSourceDataValues ( "SourceLabel"=>$squibLabel."_CurrentDuration", "CrashLabel" => $crashLabel_FireTimes);
		if(not defined $sourceData_CurrentDuration) {
			S_w2log(2, "No fire current duration stored in crash handler. Will be set to undef.");
			$sourceData_CurrentDuration -> {"DataUnit"} = undef;
			$sourceData_CurrentDuration -> {"DataValues"} = [] if($ref_FireTimes eq 'ARRAY');
		}
		else {
			my $values_aref = $sourceData_CurrentDuration -> {"DataValues"};
			my $fireDurationValue;
			if(ref($values_aref) eq 'ARRAY'){
				foreach my $fireDuration (@{$values_aref}){
					$fireDurationValue .= $fireDuration." - ";
				}
			}
			else{
				$fireDurationValue = $values_aref;
			}
		    S_w2log(2, "Detected fire current duration is: ". $fireDurationValue." ms");
		}

        #--------------------------------------------------------------
        # GET EXPECTED NUMBER OF CRASH RECORDS
        #    
        # Get number of incidents by splitting crash time zero
 		my ($numberOfIncidents, $crashTimeZero_href) = EDR_getCrashTimeZeroPerRecord ($crashTimeZero_ms);
 		unless(defined $numberOfIncidents){
 			S_set_error("Number of incidents could not be obtained with given crash time zero. Check format of input parameter.");
 			return;
 		}
        S_w2log(1, "Crash scenario to be evaluated has $numberOfIncidents incidents.");

        # Extract squib fire times from source data values to array
        my (@squibFireTimes, @squibCurrentDurations);
        if(ref($sourceData -> {"DataValues"}) eq 'ARRAY') {
            # Squib has fired more than once
            @squibFireTimes = @{$sourceData -> {"DataValues"}};
            @squibCurrentDurations = @{$sourceData_CurrentDuration -> {"DataValues"}}
        }
        else {
            # Squib has only fired once
            push(@squibFireTimes, $sourceData -> {"DataValues"});
            push(@squibCurrentDurations, $sourceData_CurrentDuration -> {"DataValues"});
        }

        S_w2log(1, "Map measured fire times to incident for each incident");
        my ($squibStatesPerIncident, $currentDurationPerIncident, $expectedSquibState, $expectedCurrentDuration) = FuncLib_EDR_Framework::getFireTimesPerIncident(\@crashTimesZero_array, \@squibFireTimes, \@squibCurrentDurations);

        # Decide which records must be evaluated
        my ($startFromRecordNbr, $numberOfRecords);
        # Case 1: Fixed record number is given in parameters
        if(defined $fixedRecordNumber) {

            $numberOfRecords = $fixedRecordNumber;
            $startFromRecordNbr = $fixedRecordNumber;
            $expectedSquibState = undef;
            $expectedCurrentDuration = undef;

            my $incidentNumber;
            if(defined $multiEventIncidentNumber) {
                $incidentNumber = $multiEventIncidentNumber;
            }
            elsif($numberOfIncidents == 1) {
                $incidentNumber = 1;
            }
            else {
                S_set_error("For record $fixedRecordNumber, it is not clear which of the incidents ($numberOfIncidents) should be taken", 110);
                return;
            }

            S_w2log(1, "Fire times will be evaluated for incident $multiEventIncidentNumber which is stored in record $fixedRecordNumber");
            $expectedSquibState -> {"Record_$fixedRecordNumber"} = $squibStatesPerIncident -> {"Incident_$incidentNumber"};
			$expectedCurrentDuration -> {"Record_$fixedRecordNumber"} = $currentDurationPerIncident -> {"Incident_$incidentNumber"};
            $crashTimeZero_href -> {"Record_$fixedRecordNumber"} = $crashTimesZero_array[$incidentNumber-1];
        }
        # Case 2: Fixed record number is not given in parameters, as many records as incidents are there will be validated
        else {
            $numberOfRecords = $numberOfIncidents;
            $startFromRecordNbr = 1;
            S_w2log(1, "$numberOfRecords records will be evaluated, starting with record number $startFromRecordNbr");
        }


        #--------------------------------------------------------------
        # EVALUATE MEASURED SQUIB FIRE TIME WITH EDR
        #
        for(my $recordNumber = $startFromRecordNbr; $recordNumber <= $numberOfRecords; $recordNumber++)
        {
        	$fireTimeEvalKeywordsCount++;
            S_teststep_2nd_level("Squib $squibLabel (EDID $squibEDID), Record $recordNumber", 'AUTO_NBR', "Squib_$squibLabel\_Record_$recordNumber\_$fireTimeEvalKeywordsCount");

            my $crashT0_ms = $crashTimeZero_href -> {"Record_$recordNumber"};
			S_w2log(1, "Record $recordNumber fire times validated with crash T0 $crashT0_ms\n");

            # ************** 1 - Calculate expected fire time for squib **************   
            my($sourceValue, $sourceUnit);
            if($expectedSquibState -> {"Record_$recordNumber"} eq 'NotFired') {
                S_w2log(1, "Squib has not fired according to measurement.\n");
                $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"ExpectedFireStatus"} = 'NotFired';
                $sourceValue = "Not deployed";
                $compareOperator = 'eq';
                $sourceUnit  = '';
            }
            elsif($expectedSquibState -> {"Record_$recordNumber"} eq 'DataNotAvailable') {
                $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"ExpectedFireStatus"} = 'NotFired';
                $sourceValue = "Not config";
                $compareOperator = 'eq';
                $sourceUnit  = '';
            }
            else {
                S_w2log(1, "Subtract crash time zero $crashT0_ms ms from measured fire time.\n");
                $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"ExpectedFireStatus"} = 'Fired';
                $sourceValue = $expectedSquibState -> {"Record_$recordNumber"} - $crashT0_ms;
                $sourceUnit  = $sourceData -> {DataUnit};
                $compareOperator = '==';
                if(($sourceValue > 300) and ($params -> {'Autarky'} eq 'true')){
                    S_w2log(1, "Fire times greater than 300ms will be reported as not deployed in autarky");
                    $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"ExpectedFireStatus"} = 'NotFired';
                    $sourceValue = $expectedValueNotDeployed;
                    $compareOperator = 'eq';
                }
            }

            S_teststep_expected("$sourceValue $sourceUnit (+/- $fireTimeTolerance_ms)", "Squib_$squibLabel\_Record_$recordNumber\_$fireTimeEvalKeywordsCount");

            # ************** 2 - Get EDID data fire time **************       
            S_w2log(1, "Get EDID data fire time '$squibLabel' from crash $crashLabel");
            my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crashLabel, "RecordNumber" => $recordNumber,"EDIDnr" => $squibEDID );
            unless(defined $edidData){
                S_set_error("No EDR data for squib '$squibLabel' (EDID $squibEDID) found. Return nothing.") unless($main::opt_offline);
                return unless($main::opt_offline);

                S_w2log(1, "Offline run, set EDID value to 1 ms.");
                $edidData = {"DataValue" => 1, "ValueUnit" => 'ms'};
            }
            my $edidValue = $edidData -> { DataValue };
            my $edidUnit = $edidData -> {ValueUnit};
            S_teststep_detected("$edidValue $edidUnit", "Squib_$squibLabel\_Record_$recordNumber\_$fireTimeEvalKeywordsCount");

            # ************** 3 - Compare expected and detected values **************
            my $verdict;
            # Squib is deployed - compare deployment time
            if($compareOperator eq '==' and not $edidValue =~ /[a-zA-Z]/) {
                $verdict = EVAL_evaluate_value ( "Fire_Time_$squibLabel\_$crashLabel\_Record$recordNumber",
                                                $edidValue,
                                                $compareOperator,
                                                $sourceValue,
                                                $fireTimeTolerance_ms,
                                                'absolute');
            }
            # Squib is not deployed - string 'DataNotAvailable' expected
            elsif($compareOperator eq 'eq' or $edidValue =~ /[a-zA-Z]/) {
                $verdict = EVAL_evaluate_string ( "Fire_Time_$squibLabel\_$crashLabel\_Record$recordNumber",
                                                  $sourceValue,
                                                  $edidValue,);
            }
            else {
                S_w2log(1, "No compare operator ('eq' for string, '==' for numbers) defined.");
                $verdict = S_set_verdict('VERDICT_NONE');
            }
            S_w2log(1, "Verdict for squib $squibLabel is $verdict");
            $evaluationVerdict = 'VERDICT_FAIL' if($verdict eq 'VERDICT_FAIL');

            $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"Expected"} = $sourceValue;
            $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"Detected"} = $edidValue;
            $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"Verdict"} = $verdict;
            $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"CurrentDuration"} = $expectedCurrentDuration -> {"Record_$recordNumber"};
        }
    }

    return ($evaluationVerdict, $allResults_href);
}



1;
