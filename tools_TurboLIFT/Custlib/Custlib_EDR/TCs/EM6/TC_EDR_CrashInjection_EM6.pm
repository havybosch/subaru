#### TEST CASE MODULE
package TC_EDR_CrashInjection_EM6;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;
###-------------------------------

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS_EDID_GenericEDIDList> 
#TS version in DOORS: <1.10> 
#-------------------------------------------------------------------------


#### HERE SELECTION OF AUTOTEST MODULES ####
use LIFT_general;
use LIFT_evaluation;
use LIFT_PD;
use LIFT_crash_simulation;
use LIFT_CANoe;
use LIFT_labcar;
use LIFT_equipment;
use LIFT_MDSRESULT;
use GENERIC_DCOM;
# use LIFT_DCOM;
use LIFT_can_access;
use LIFT_flexray_access;
# use INCLUDES_Project;
use File::Basename;
use Data::Dumper;
use FuncLib_EDR_Framework;
use FuncLib_SYC_INTERFACE;
use LIFT_QuaTe;
use LIFT_numerics;
use FuncLib_CustLib_EDR_CNEDR;
use LIFT_ProdDiag;
require LIFT_PD2ProdDiag; 
import LIFT_PD2ProdDiag; 
# use LIFT_CD;            # use STEPS_diag;

use constant MILLISEC_TO_SECOND => 0.001;
use constant SECOND_TO_MILLISEC => 1000;

##################################
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDR_CrashInjection  

requires test setup with
	- Quate
	- MDS data base
	- LCT 64
	- CANoe
	- TSG4

default state is faultfree ECU powered ON

=head1 PURPOSE

inject a crash and store all data in record and crash handler for use in later test cases

=head1 TESTCASE DESCRIPTION 

    [initialisation]
    initialize record handler
    initialize crash handler
    clear crash recorder and fault memory

    [stimulation & measurement]
	1. start LCT measurement and CAN trace
    2. inject crash
    3. stop LCT measurement
    4. read all crash records and add to record handler
	5. Store CAN trace
    6. get all sensor data and add to crash handler
	7. get switch states and add to crash handler
    8. add all fire times to crash handler
	(Steps 5. to 7.: Which data is stored in crash handler depends on storage options parameter)
	
	All data in record and crash handler will be available to the rest of the test cases in the testlist!
	
    [evaluation]
    1. no evaluation required

    [finalisation]
    1. clear fault memory
    2. clear crash recorder
    3. reset ECU

=head1 PARAMETER DESCRIPTION

=head2 PARAMETER NAMES

    purpose --> Purpose of the test case
    crashtype --> Type/name of crash (must be there in EDR mapping!)
 	DiagType --> Supported: Ford, AKLV, Geely
	StorageOptions --> Choose which data to store for the injected crash	
	Protocol --> CAN or Flexray
	CrashTimeZero_ms --> Time when event is active for EDR with reference to Quate T0

=head2 PARAMETER EXAMPLES

    [TC_EDR_CrashInjection.xxx]
	# From here on: applicable Lift Default Parameters
	purpose = 'inject a set of crashes for later evaluation'
	crashtype = 'FrontInflatable'
	DiagType = 'AKLV'
	StorageOptions = %('COM_Signals' => 'no', 'SensorData' => 'yes', 'FireTimes' => 'yes', 'SwitchStates' => 'yes')
	Protocol = 'CAN' (optional parameter)
	CrashTimeZero_ms = '5.26' #in msec

=cut

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DOCUMENTATION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Crashtype;
my $tcpar_DiagType;
my $tcpar_StorageOptions_href;
my $tcpar_Protocol;
my $tcpar_CrashTimeZero_ms;
my $tcpar_ResultDB;
my $tcpar_COMsignalsAfterCrash;
my $tcpar_FireCurrentThreshold;
my $tcpar_purpose;
my $tcpar_EDIDNr_Supplier;
my $tcpar_SquibResistance_Ohm;
my $tcpar_FD_Variables_aref;
my $tcpar_FD_VariablesTypes_aref;
my $tcpar_read_NHTSAEDR;
my $tcpar_read_CHINAEDR;
my $tcpar_read_SUBARU;
my $tcpar_Driverside;

my $tcpar_value_max;
my $tcpar_value_min;
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
		$SubaruEDR_diagType,
	);

our $PURPOSE;
our $TC_name = "TC_EDR_CrashInjection";

#-------------------------------------------------------------------------------
sub TC_set_parameters {
#-------------------------------------------------------------------------------
	S_w2rep("Read testcase parameters");
	$tcpar_purpose =  S_read_mandatory_testcase_parameter( 'purpose' );
    $tcpar_Crashtype = S_read_mandatory_testcase_parameter('crashtype');
    $tcpar_DiagType = S_read_mandatory_testcase_parameter('DiagType');
	$tcpar_StorageOptions_href = S_read_mandatory_testcase_parameter('StorageOptions', 'byref');
	$tcpar_Protocol = S_read_optional_testcase_parameter('Protocol');
	$tcpar_CrashTimeZero_ms = S_read_optional_testcase_parameter('CrashTimeZero_ms');
	$tcpar_ResultDB = S_read_optional_testcase_parameter('ResultDB');
    $tcpar_ResultDB = 'DEFAULT' unless (defined $tcpar_ResultDB);
	$tcpar_read_NHTSAEDR=S_read_optional_testcase_parameter('read_NHTSAEDR');
	$tcpar_read_SUBARU = S_read_optional_testcase_parameter('read_SUBARU');
	$tcpar_read_CHINAEDR = S_read_optional_testcase_parameter('read_CHINAEDR');
	$tcpar_COMsignalsAfterCrash =  S_read_optional_testcase_parameter( 'COMsignalsAfterCrash','byref');
	$tcpar_FireCurrentThreshold =  S_read_optional_testcase_parameter( 'FireCurrentThreshold');
	$tcpar_SquibResistance_Ohm = S_read_optional_testcase_parameter( 'SquibResistance_Ohm');
	$tcpar_EDIDNr_Supplier =  S_read_optional_testcase_parameter( 'EDIDNr_Supplier');
    $tcpar_FD_Variables_aref = S_read_optional_testcase_parameter( 'FD_Variables', 'byref');
    $tcpar_value_max= S_read_optional_testcase_parameter( 'value_max');
    $tcpar_value_max= '500' if (not defined $tcpar_value_max);
    $tcpar_value_min= S_read_optional_testcase_parameter( 'value_min');
    $tcpar_value_min= '0' if (not defined $tcpar_value_min);
    $tcpar_Driverside = S_read_optional_testcase_parameter( 'Driverside');
    if($tcpar_FD_Variables_aref){
        $tcpar_FD_VariablesTypes_aref = S_read_mandatory_testcase_parameter( 'FD_Variables_Types', 'byref');    
    }
	
	unless(defined $tcpar_Protocol) {
		$tcpar_Protocol = 'CAN';
	}
	
	if(not defined $tcpar_read_CHINAEDR) {
		$tcpar_read_NHTSAEDR = 'yes';
		$tcpar_read_CHINAEDR = 'no';
	}
	else {
		$tcpar_read_NHTSAEDR = 'no';
		my $storageOrder = EDR_getStorageOrder();
		 # my $storageOrder = 'PhysicalOrder';
		return unless(defined $storageOrder);

		if($storageOrder eq 'PhysicalOrder'){
			$ChinaEDR_diagType= 'ProdDiag';  #In platform NHTSA and China EDR is read via proddiag
		}
		else {
			$ChinaEDR_diagType= 'CHINA_Payload';
			# $ChinaEDR_diagType= 'ProdDiag'; 
		}
	}
	
	if( $tcpar_read_SUBARU eq 'yes')
	{
		$SubaruEDR_diagType ='Subaru_payload';
	}
	
	unless(defined $tcpar_CrashTimeZero_ms) {
		S_set_warning("EDR crash time zero for this crash is not defined! Will be set to 0ms");
		$tcpar_CrashTimeZero_ms = 0;
	}

    $mappingEDR = S_get_contents_of_hash(['Mapping_EDR']) unless defined $mappingEDR;

	return 1;
}

#-------------------------------------------------------------------------------
sub TC_initialization {
# Read fault memory after crash
    PD_ReadFaultMemory();
    S_wait_ms(2000);

	# Erase EDR
    PD_ClearCrashRecorder();
    S_wait_ms(2000);
	
	# Erase Fault memory
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	# Reset ECU    
    PD_ECUreset();
    S_wait_ms('TIMER_ECU_READY');

	# Read fault memory after clearing and erasing EDR
    PD_ReadFaultMemory();   
#-------------------------------------------------------------------------------

    # INITIALIZE RECORD AND CRASH HANDLER
    #    
	S_w2rep("Initialize Record and Crash Handler");
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;

	#--------------------------------------------------------------
    # GET CRASH DETAILS
    #    
	# Crash name or index and result DB from EDR mapping
	if (($tcpar_Crashtype eq 'Multi_EDR_FrontAD_SideLeftAD_FrontAD_SideRightAD;5') || ($tcpar_Crashtype eq 'Multi_EDR_Noise_Noise_Front_AD;5_CN'))
	{
		
		$tcpar_ResultDB = 'MULTI';
		
	}
	else
	{
		;
				
	}
    $crashDetails_href = $mappingEDR -> {'CRASHFILES'}{$tcpar_Crashtype};
    unless(defined $crashDetails_href) {
        $crashDetails_href = {'RESULTDB' => $tcpar_ResultDB, 'CRASHNAME' => $tcpar_Crashtype};
    }
	# Crash settings
	$crashSettings = CSI_GetCrashDataFromMDS($crashDetails_href);
	unless(defined $crashSettings) {
		S_set_error("Crash code $tcpar_Crashtype not defined in given result DB. Test case will be aborted.");
		return 0;
	}
	
	# Make crash label unique if threshold was set
	if (defined $tcpar_FireCurrentThreshold) {
		my $measureThreshold = $tcpar_FireCurrentThreshold;
		S_w2rep("Current threshold: $measureThreshold ");
		$measureThreshold =~ s/\./_/g;
		$tcpar_Crashtype .= "_".$measureThreshold."A";	
	}

	#--------------------------------------------------------------
    # ADD EDR CRASH TIME ZERO AS CRASH SOURCE
    #    
    $crash_handler -> AddCrashSource( "CrashLabel" => $tcpar_Crashtype,
    								  "SourceLabel" => 'CrashTimeZero', 
                                      "OriginalSourceData" => $tcpar_CrashTimeZero_ms,
                                      "SourceUnit" => 'ms',);    
	
	# Crash code in World DB
	$crash_handler -> AddCrashSource( "CrashLabel" => $tcpar_Crashtype,
	    								  "SourceLabel" => 'CrashCode_MDS', 
	                                      "OriginalSourceData" => $tcpar_Crashtype );

    $crashInfo_href -> {"CrashCode_MDS"} = $tcpar_Crashtype;

	# Name of Result DB
	my $resultDB = $crashDetails_href -> {"RESULTDB"};
	unless(defined $resultDB) {
		$resultDB = "DEFAULT";
	}

	# Result DB path
	my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$resultDB" ] );
	$crashInfo_href -> {"MDB_Path"} = $resultDBDetails->{'PATH'};

	# Crash time Zero and EDR crash label -> crash name in EDR mapping
	$crashInfo_href -> {"CrashTimeZero_ms"} = $tcpar_CrashTimeZero_ms;
	$crashInfo_href -> {"CrashLabel"} = $tcpar_Crashtype;

	#--------------------------------------------------------------
    # Initialize equipment
    #

	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
    CA_trace_start();
    GDCOM_init() ; # To fetch info for CD from mapping_diag
	
	# Set environment settings for crash
	CSI_PrepareEnvironment($crashSettings, 'init_complete');
	S_wait_ms('TIMER_ECU_READY');
  
    PD_ClearCrashRecorder();
    S_wait_ms(2000);
 
    # erase FltMem
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	# read fault memory
    my $faultsBeforeStimulation = PD_ReadFaultMemory();
	
	#Fault memory must be empty
    my $faultsVerdict = PD_evaluate_faults( $faultsBeforeStimulation, []);
 	return 0 unless ($faultsVerdict eq 'VERDICT_PASS');

    return 1;
}

#-------------------------------------------------------------------------------
sub TC_stimulation_and_measurement {
	# S_user_action('signal');
#-------------------------------------------------------------------------------
	 # # # Configure and Monitor bit will be set for Device 'AB1FD' and Configure bit will be cleared for device 'UFSL'
     # # my $device_modes_href = {
        # # 'DriverSide' => ['clear_Configure'],
     # # };
     
    # # # Same as above, but Hard reset will be done after device configuration 
    # # # and then waiting will be done for 10000 ms
    # # my $options_href = {
        # # 'resetType' => 'HARD',
        # # 'wait_time_after_reset_ms' => 5000,
    # # };     
    # # PRD_Set_Device_Configuration( $device_modes_href, $options_href );
	# # --------------------------------------------------------------
    # CRASH PREPARATION
    
    S_teststep("Prepare crash (download crash data)", 'AUTO_NBR');
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	# S_user_action("Before crash");
	# Prepare crash
	my $crashDuration_ms = $crashSettings -> {'METADATA'} -> {'CRASHDURATION_MS'};
	# Crash duration
	$crash_handler -> AddCrashSource( "CrashLabel" => $tcpar_Crashtype,
	    							  "SourceLabel" => 'CrashDuration', 
	                                  "OriginalSourceData" => $crashDuration_ms,
									  "SourceUnit" => 'ms'  );
											
	CSI_LoadCrashSensorData2Simulator( $crashSettings )unless $main::opt_offline;

	# Power ON the ECU
	LC_ECU_On();
 	S_wait_ms('TIMER_ECU_READY');
 	
    CSI_PrepareEnvironment( $crashSettings, 'before_crash_same_cycle','normal' );
    S_wait_ms(1000);

	# --------------------------------------------------------------
    # START MEASUREMENTS #unt3hc
    
    S_teststep("Configure and start LCT Measurement", 'AUTO_NBR');

    # configure digital fire time measurement #unt3hc
    if($tcpar_FireCurrentThreshold){
        S_teststep_2nd_level("Set measurement threshold to $tcpar_FireCurrentThreshold A for all squibs", 'AUTO_NBR');
        LC_MeasureTraceDigitalConfigureThresholds( ['ALL'], $tcpar_FireCurrentThreshold );
    }
    else {
        S_teststep_2nd_level("Set measurement threshold to 0.5 A for all squibs", 'AUTO_NBR');
        LC_MeasureTraceDigitalConfigureThresholds( ['ALL'], 0.5 );  
    }
    
    # Set squib resistances #unt3hc
    if($tcpar_SquibResistance_Ohm){
        S_teststep_2nd_level("Set all squib resistances to $tcpar_SquibResistance_Ohm Ohm", 'AUTO_NBR');
        foreach my $squibLabel (LC_Get_names( 'SQUIBS' ))
        {
            LC_SetResistance( $squibLabel, $tcpar_SquibResistance_Ohm );
        }
    }

    S_teststep_2nd_level("Start fire time measurement", 'AUTO_NBR');
    LC_MeasureTraceDigitalStart();

    # my $fastDiag;
    # if($tcpar_FD_Variables_aref){
        # S_teststep_2nd_level("Start fast diag measurement", 'AUTO_NBR');
        # $fastDiag = PD_StartFastDiagName( "$main::REPORT_PATH/".S_get_TC_number()."__FastDiagMeasurement" , $tcpar_FD_Variables_aref , $tcpar_FD_VariablesTypes_aref , undef, 4);    
    # }

	 # my $random_value_ms = NUM_RandomNumber( $tcpar_value_max, {value_min =>$tcpar_value_min} );
	 # S_teststep("Wait for $random_value_ms ms before crash", 'AUTO_NBR');
	 # S_wait_ms($random_value_ms);
	# S_user_action("Before crash");
	# S_teststep("DRC before crash", 'AUTO_NBR');
	# GDCOM_request ('22 20 06', '62 20 06', 'relax');
	# S_wait_ms(2000);
	# --------------------------------------------------------------
    # CRASH INJECTION
	
	S_teststep("Inject crash", 'AUTO_NBR');
	CSI_TriggerCrash();
	# S_user_action("after crash");
 	if(defined $crashDuration_ms){
	    S_teststep("Wait for crash duration ($crashDuration_ms ms) + 10 seconds for EDR recording.");
	    S_wait_ms($crashDuration_ms);
	    S_wait_ms(17000);
	}
	else{
	    S_wait_ms(10000);
	}
	

	# GDCOM_request_general('REQ_ReadDataByIdentifier_CnEDRdata01', 'PR_ReadDataByIdentifier_CnEDRdata01','relax'); 
	# S_user_action("After crash");
	# S_teststep("DRC after crash", 'AUTO_NBR');
	# GDCOM_request ('22 20 06', '62 20 06', 'relax');
	# S_wait_ms(2000);
	
    # if($tcpar_FD_Variables_aref and $fastDiag){
      # S_teststep_2nd_level("Stop fast diag measurement", 'AUTO_NBR');
      # PD_StopFastDiag();
    # }
	# #--------------------------------------------------------------poh3hc

    # STOP MEASUREMENTS #unt3hc
    
	S_teststep("Stop LCT Measurement", 'AUTO_NBR');
    LC_MeasureTraceDigitalStop();

	# if (defined $tcpar_COMsignalsAfterCrash){
		# foreach my $signal (keys %{$tcpar_COMsignalsAfterCrash})
		# {				
			# my $dataOnCOM = $tcpar_COMsignalsAfterCrash -> {$signal};
			# S_w2rep("Signal =$signal,Data to be sent=$dataOnCOM");
			# COM_setSignalState($signal,$dataOnCOM);
		# }

	# }
	# S_wait_ms(2000);

    # Rollover has long storing times
    S_wait_ms(20000) if ($tcpar_Crashtype =~ /Rollover/);

	# --------------------------------------------------------------
    # READ AND STORE CRASH RECORDS
    
    my $dataStoragePath = "$main::REPORT_PATH/".$tcpar_Crashtype;

    # ************** 1 - CRASH RECORDS **************   
	S_teststep("Get all stored records via CustDiag and store in record handler", 'AUTO_NBR');

	my $numberOfRecords = SYC_EDR_get_NumberOfEventsToBeStored();
	# my $numberOfRecords_Su = SYC_EDR_get_NumberOfEventsToBeStored();
	unless(defined $numberOfRecords){
        S_set_error("Not available in SYC - add or overwrite with Custlibrary Function");
        return;
    }
	
	# unless(defined $numberOfRecords_Su){
        # S_set_error("Not available in SYC - add or overwrite with Custlibrary Function");
        # return;
    # }
	
	PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');	
	S_wait_ms(500);
	
	
	GDCOM_request ('10 03', '', 'relax');
	S_wait_ms(200);
	S_teststep("Send request to access security level2.", 'AUTO_NBR', 'send_request_to_B');			#measurement 2
	my $res_key1 = _reqres_key();
	my @reskey1 = split(/ /,$res_key1);
	EVAL_evaluate_value("Checking value of byte 1", @reskey1[0],'==',0x67);
	EVAL_evaluate_value("Checking value of byte 2", @reskey1[1],'==',0x04);
	#set bien ve 0 neu ko xai
	CA_set_EnvVar_value('Security03', 0);
	S_wait_ms(500);
	
	if ( lc( $tcpar_read_NHTSAEDR) eq 'yes' ) {
		# EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								# "CrashLabel" => $tcpar_Crashtype,
								# "NbrOfRecords" =>  $numberOfRecords,
								# "StoragePath" => $dataStoragePath,
								# "CrashInfo" => $crashInfo_href,
								# "read_EDRType"=>'NHTSA');
	}
	# GDCOM_request_general ("REQ_ReadDataByIdentifier_CnEDRdata02","PR_ReadDatabyReadDataByIdentifier_CnEDRdata02");
	# if (lc($tcpar_read_CHINAEDR) eq 'yes'){
		# $numberOfRecords=3;
		# S_w2rep("Quanhh check CHINA_EDR");
		# EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $ChinaEDR_diagType,
								# "CrashLabel" => $tcpar_Crashtype,
								# "NbrOfRecords" =>  $numberOfRecords,
								# "StoragePath" => $dataStoragePath,
								# "CrashInfo" => $crashInfo_href,
								# "read_EDRType"=>'CHINA');
	
	# }	
	# S_user_action("COM ");
	# S_wait_ms(1000);
	if (lc($tcpar_read_CHINAEDR) eq 'yes'){
		$numberOfRecords=3;
		S_w2rep("Quanhh check CHINA_EDR");
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => "ProdDiag",
								"CrashLabel" => $tcpar_Crashtype,
								"NbrOfRecords" =>  $numberOfRecords,
								"StoragePath" => $dataStoragePath,
								"CrashInfo" => $crashInfo_href,
								"read_EDRType"=>'CHINA');
	
	}	
	
	
# # poh3hc
	if (lc($tcpar_read_SUBARU) eq 'yes'){
		$numberOfRecords=3;
		S_w2rep("Quanhh check SUBARU DATA");
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $SubaruEDR_diagType,
								"CrashLabel" => $tcpar_Crashtype,
								"NbrOfRecords" =>  $numberOfRecords,
								"StoragePath" => $dataStoragePath,
								"CrashInfo" => $crashInfo_href,
								"read_EDRType"=>'CHINA');
	
	}
	
	my $recordAvailable = $record_handler -> IsRecordAvailable("CrashLabel" => $tcpar_Crashtype, "RecordNumber"=> 1);
	if($recordAvailable){
		$record_handler -> ExportCrashRecordsToExcel("CrashLabel" => $tcpar_Crashtype,
													"Filepath" => $dataStoragePath."\\".$tcpar_Crashtype.".xlsx");		
	}
   
	foreach my $recordNbr (1..$numberOfRecords)
		{
			$record_handler -> PrintDecodedEDIDs( "RecordNumber" => $recordNbr,
												  "CrashLabel" => $tcpar_Crashtype,);
											  
			S_teststep("PrintDecodedEDIDs", 'AUTO_NBR');
			#--------------------------------------------------------------
			# PRINT SUPPLIER EDIDS
			#    
			# ----------------------------------------------------------- 
			my $recordAvailable = $record_handler -> IsRecordAvailable("CrashLabel" => $tcpar_Crashtype, "RecordNumber"=> $recordNbr);
			if ($recordAvailable and defined $tcpar_EDIDNr_Supplier)
			{
			S_teststep("IF GetRawEDID ", 'AUTO_NBR');
				my $recordData_aref = $record_handler -> GetRawEDID( 	"EDIDnr" => $tcpar_EDIDNr_Supplier,
																		"RecordNumber" => $recordNbr,
																		"CrashLabel" => $tcpar_Crashtype,);
				S_teststep("EDR_ReadEDR_Record_structure_info_from_mapping_NOERR ", 'AUTO_NBR');
				my $recordStructure_href = EDR_ReadEDR_Record_structure_info_from_mapping_NOERROR('Supplier',0,'Mapping_EDR','SUPPLIER_EDIDS');
				S_teststep("IF ", 'AUTO_NBR');
				if (defined $recordStructure_href ){
				S_teststep("ADD CRASH RECORD ", 'AUTO_NBR');
				$record_handler -> AddCrashRecord(
													"RecordNumber" => $recordNbr,
													"CrashLabel"   => $tcpar_Crashtype.'_Supplier',
													"RecordStructureInfo" => $recordStructure_href,
													"RawDataGeneric" => $recordData_aref,
													);	
								S_teststep("PRITN RAWs", 'AUTO_NBR');					
				$record_handler -> PrintRawEDIDs( "RecordNumber" => $recordNbr,
													"CrashLabel" => $tcpar_Crashtype.'_Supplier',
													"FormatOption" => 'HEX');

				}
				else
				{
					S_w2rep("No Supplier EDID data found for in the record number $recordNbr .");
					next;
				}
													
			}
			else
			{
				S_w2rep("Requested EDR record is empty.NO supplier edids will be printed.");
				next;
			}
			
		}
	
	PD_ECUlogin();
	S_wait_ms(2000);
	PD_DumpNVMData_NOERROR_NOHTML($main::REPORT_PATH . "/".S_get_TC_number(). "_ReadAllNVMSections_Dump.txt");

	#--------------------------------------------------------------
    # STORE MEASUREMENTS
    #
	S_w2rep("Store $tcpar_Protocol Trace");
	my $fileName = "$dataStoragePath/LIFT_network_trace.asc";
	my $tracePath;
	$tracePath = CA_trace_store($fileName) if (lc($tcpar_Protocol) =~ m/can/i);
	$tracePath = FR_trace_store($fileName) if (lc($tcpar_Protocol) =~ m/flexray/i);
	S_w2rep("Trace File: $tracePath");

	# Restart Rest bus simulation - is stopped when storing!
	S_wait_ms(2000);
	CA_trace_start() if (lc($tcpar_Protocol) =~ m/can/i);
	FR_trace_start() if (lc($tcpar_Protocol) =~ m/flexray/i);	

    # ************** 1 - FIRE TIMES **************       utn3hc
	if($tcpar_StorageOptions_href->{'FireTimes'} eq 'yes')
	{
		S_teststep("Get and store measured fire times", 'AUTO_NBR');
	
		S_w2rep("Get measured squib fire values by calling LC_MeasureTraceDigitalGetValues()");
	    my $LCT_data = LC_MeasureTraceDigitalGetValues();

		# Get list of all measured squib labels
	    my $squibLabels_aref; 
	    foreach my $time ( sort { $a <=> $b } keys %$LCT_data )
	    {
	    	foreach my $squibLabel (keys %{$LCT_data->{$time}})
	    	{
	    		push(@{$squibLabels_aref}, $squibLabel);
	    	}
	        last;
	    }
		
		if(defined $squibLabels_aref  and not S_check_exec_option ( 'EDR_CrashInjection_DeleteRecordObjects' )) {
		    EVAL_dump2UNV( $LCT_data, "$dataStoragePath/LCT_Measurement.txt.unv" );
		    
			S_w2rep("Add all fire times measured to crash handler");
			EDR_addFireTimesToCrashHandler ("LCT_Measurement" => $LCT_data,
											"SquibLabels" => $squibLabels_aref,
											"CrashLabel"  => $tcpar_Crashtype,
											"FireCurrentDuration" => 'true');
			
		}
		else {
			S_w2rep("No deployment times will be stored for crash $tcpar_Crashtype.", 'AUTO_NBR');		
		}
	}
	
	return 1 if(S_get_exec_option_NOERROR ( 'EDR_CrashInjection_DeleteRecordObjects' ));

    # ************** 2 - COM SIGNALS **************       
    if($tcpar_StorageOptions_href->{'COM_Signals'} eq 'yes')
    {        
        S_teststep("Store EDR relevant COM signals and add to crash handler", 'AUTO_NBR');

        if(defined $mappingEDR -> {'EDR_COM_SIGNAL_LABELS'})
        {                       
            my $edr_COMsignals_aref = $mappingEDR -> {'EDR_COM_SIGNAL_LABELS'};

            EDR_addCOMsignalsToCrashHandler ("COM_SignalLabels" => $edr_COMsignals_aref,
                                         "CrashLabel"  => $tcpar_Crashtype,
                                         "COM_TraceFileName" => $fileName,
                                         "DataStoragePath" => $dataStoragePath,);
        }
        else {
            S_w2rep("No EDR specific COM signals defined in EDR mapping under 'EDR_COM_SIGNALS_AREF'. Only .asc file is stored.");
        }
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
                                     "CrashLabel"  => $tcpar_Crashtype,
                                     "DataStoragePath" => $dataStoragePath, # optional
                                    );
	}
	
    # ************** 2 - SWITCH STATES **************       
	if($tcpar_StorageOptions_href->{'SwitchStates'} eq 'yes')
	{
		S_teststep("Get and store switch state values", 'AUTO_NBR');
	    
		# Store environment settings for later use
		S_dump2pmFile (  "VariableToDump" => $crashRawSignals -> {'ENVIRONMENT'},
	    				 "VariableName" => "EnvironmentSettings",
						 "PackageName" => "EDR_EnvironmentSettings",
						 "StoragePath" => $dataStoragePath);
	
		my $allSwitchStatesDuringCrash_href;
		
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

			# Store obtained information for later dump to file	
			$allSwitchStatesDuringCrash_href -> {$switch}-> {"State"} = $switchStatePhysical;
			$allSwitchStatesDuringCrash_href -> {$switch}-> {"MDS_State"} = $switchStateMDS;
			$allSwitchStatesDuringCrash_href -> {$switch}-> {"Configured"} = $switchConfigured;
			
			# Add switch to crash handler
			S_w2rep("Adding switch $switch with state $switchStatePhysical to crash handler");
			$crash_handler -> AddCrashSource(  "CrashLabel" => $tcpar_Crashtype,
											   "SourceType" => 'Switch', 
	                                           "SourceLabel" => $switch,
	                                           "OriginalSourceData" => $switchStatePhysical,  # not buckled
	                                         );    		
		}
	
		# Store switch states in file for later use
		S_dump2pmFile ("VariableToDump" => $allSwitchStatesDuringCrash_href,
					 "VariableName" => "SwitchStatesDuringCrash",
					 "PackageName" => "Switch_States",
					 "StoragePath" => $dataStoragePath);
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
#-------------------------------------------------------------------------------
sub TC_evaluation {
#-------------------------------------------------------------------------------
	S_w2rep("No evaluation in this test case");	
	
    return 1;
}

#-------------------------------------------------------------------------------
sub TC_finalization {
#-------------------------------------------------------------------------------

    # Reset squib resistances
    if($tcpar_SquibResistance_Ohm){
       foreach my $squibLabel (LC_Get_names( 'SQUIBS' ))
       {
           LC_SetResistance( $squibLabel, 'DEFAULT' );
       }
    }
    
    # Reset current threshold to default value 0.5
    if($tcpar_FireCurrentThreshold){
        LC_MeasureTraceDigitalConfigureThresholds( ['ALL'], 0.5 );
    }

    if(S_get_exec_option_NOERROR ( 'EDR_CrashInjection_DeleteRecordObjects' )){
        S_w2log(1, "Delete all stored record objects as per execution option 'EDR_CrashInjection_DeleteRecordObjects'");
        my $numberOfRecords = SYC_EDR_get_NumberOfEventsToBeStored();
        if(not defined $numberOfRecords){
            S_set_warning("Not available in SYC - add or overwrite with Custlibrary Function");
        }
        else{
            foreach my $recordNbr (1..$numberOfRecords)
            {
                $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype, "RecordNumber" => $recordNbr);
				$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype."CHINA", "RecordNumber" => $recordNbr);
                $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype."_Supplier", "RecordNumber" => $recordNbr);
            }                
        }
		
		####poh3hc
		 # my $numberOfRecords_Su = SYC_EDR_get_NumberOfEventsToBeStored();
        # if(not defined $numberOfRecords_Su){
            # S_set_warning("Not available in SYC - add or overwrite with Custlibrary Function");
        # }
        # else{
            # foreach my $recordNbr (1..$numberOfRecords_Su)
            # {
                # $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype, "RecordNumber" => $recordNbr);
				# $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype."CHINA", "RecordNumber" => $recordNbr);
                # $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype."_Supplier", "RecordNumber" => $recordNbr);
            # }                
        # }
    }

	# Read fault memory after crash
    PD_ReadFaultMemory();
    S_wait_ms(2000);

	# Erase EDR
    PD_ClearCrashRecorder();
    S_wait_ms(2000);
	
	# Erase Fault memory
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	# Reset ECU    
    PD_ECUreset();
    S_wait_ms('TIMER_ECU_READY');

	# Read fault memory after clearing and erasing EDR
    PD_ReadFaultMemory();   
    
    # LC_ECU_Off();
    # S_wait_ms('TIMER_ECU_OFF'); 

	return 1;
}

sub Delete_Record{
	my $numberOfRecords =shift; 

	 if(S_get_exec_option_NOERROR ( 'EDR_CrashInjection_DeleteRecordObjects' )){
        S_w2log(1, "Delete all stored record objects as per execution option 'EDR_CrashInjection_DeleteRecordObjects'");
        my $numberOfRecords = SYC_EDR_get_NumberOfEventsToBeStored();
        if(not defined $numberOfRecords){
            S_set_warning("Not available in SYC - add or overwrite with Custlibrary Function");
        }
        else{
            foreach my $recordNbr (1..$numberOfRecords)
            {
                $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype, "RecordNumber" => $recordNbr);
				$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype."CHINA", "RecordNumber" => $recordNbr);
                $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype."_Supplier", "RecordNumber" => $recordNbr);
            }                
        }
		
		####poh3hc
		 # my $numberOfRecords_Su = SYC_EDR_get_NumberOfEventsToBeStored();
        # if(not defined $numberOfRecords_Su){
            # S_set_warning("Not available in SYC - add or overwrite with Custlibrary Function");
        # }
        # else{
            # foreach my $recordNbr (1..$numberOfRecords_Su)
            # {
                # $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype, "RecordNumber" => $recordNbr);
				# $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype."CHINA", "RecordNumber" => $recordNbr);
                # $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashtype."_Supplier", "RecordNumber" => $recordNbr);
            # }                
        # }
    }
}
	

1;