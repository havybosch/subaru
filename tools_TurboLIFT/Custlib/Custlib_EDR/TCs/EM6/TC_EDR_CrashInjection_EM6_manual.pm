#### TEST CASE MODULE
package TC_EDR_CrashInjection_EM6_manual;

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
use FuncLib_TNT_EDR;
require LIFT_PD2ProdDiag; 
import LIFT_PD2ProdDiag; 
# use LIFT_CD;            # use STEPS_diag;
use  FuncLib_TNT_GEN;
use constant MILLISEC_TO_SECOND => 0.001;
use constant SECOND_TO_MILLISEC => 1000;
use MDSResult;
use FuncLib_CustLib_EDR_CNEDR;
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
	$tcpar_read_CHINAEDR=S_read_optional_testcase_parameter('read_CHINAEDR');
	$tcpar_COMsignalsAfterCrash =  S_read_optional_testcase_parameter( 'COMsignalsAfterCrash','byref');
	$tcpar_FireCurrentThreshold =  S_read_optional_testcase_parameter( 'FireCurrentThreshold');
	$tcpar_SquibResistance_Ohm = S_read_optional_testcase_parameter( 'SquibResistance_Ohm');
	$tcpar_EDIDNr_Supplier =  S_read_optional_testcase_parameter( 'EDIDNr_Supplier');
    $tcpar_FD_Variables_aref = S_read_optional_testcase_parameter( 'FD_Variables', 'byref');
    $tcpar_value_max= S_read_optional_testcase_parameter( 'value_max');
    $tcpar_value_max= '500' if (not defined $tcpar_value_max);
    $tcpar_value_min= S_read_optional_testcase_parameter( 'value_min');
    $tcpar_value_min= '0' if (not defined $tcpar_value_min);
    
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
		return unless(defined $storageOrder);

		if($storageOrder eq 'PhysicalOrder'){
			$ChinaEDR_diagType= 'ProdDiag';  #In platform NHTSA and China EDR is read via proddiag
		}
		else {
			$ChinaEDR_diagType= 'CHINA_Payload';
			# $ChinaEDR_diagType= 'ProdDiag'; 
		}
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
    # PD_ReadFaultMemory();   
#-------------------------------------------------------------------------------

    # # INITIALIZE RECORD AND CRASH HANDLER
    # #    
	# S_w2rep("Initialize Record and Crash Handler");
	# $record_handler = EDR_init_RecordHandler() || return;
	# $crash_handler  = EDR_init_CrashHandler() || return;

	# #--------------------------------------------------------------
    # # GET CRASH DETAILS
    # #    
	# # Crash name or index and result DB from EDR mapping
	# if (($tcpar_Crashtype eq 'Single_EDR_Front_ClipEcuX_after250ms') || ($tcpar_Crashtype eq 'Single_EDR_SideLeft_ClipEcuY_after250ms'))
	# {
		
		# $tcpar_ResultDB = 'NEWCRASH';
		
	# }
	# else
	# {
		# ;
				
	# }
    # $crashDetails_href = $mappingEDR -> {'CRASHFILES'}{$tcpar_Crashtype};
    # unless(defined $crashDetails_href) {
        # $crashDetails_href = {'RESULTDB' => $tcpar_ResultDB, 'CRASHNAME' => $tcpar_Crashtype};
    # }
	# # Crash settings
	# $crashSettings = CSI_GetCrashDataFromMDS($crashDetails_href);
	# unless(defined $crashSettings) {
		# S_set_error("Crash code $tcpar_Crashtype not defined in given result DB. Test case will be aborted.");
		# return 0;
	# }
	
	# # Make crash label unique if threshold was set
	# if (defined $tcpar_FireCurrentThreshold) {
		# my $measureThreshold = $tcpar_FireCurrentThreshold;
		# S_w2rep("Current threshold: $measureThreshold ");
		# $measureThreshold =~ s/\./_/g;
		# $tcpar_Crashtype .= "_".$measureThreshold."A";	
	# }

	# #--------------------------------------------------------------
    # # ADD EDR CRASH TIME ZERO AS CRASH SOURCE
    # #    
    # $crash_handler -> AddCrashSource( "CrashLabel" => $tcpar_Crashtype,
    								  # "SourceLabel" => 'CrashTimeZero', 
                                      # "OriginalSourceData" => $tcpar_CrashTimeZero_ms,
                                      # "SourceUnit" => 'ms',);    
	
	# # Crash code in World DB
	# $crash_handler -> AddCrashSource( "CrashLabel" => $tcpar_Crashtype,
	    								  # "SourceLabel" => 'CrashCode_MDS', 
	                                      # "OriginalSourceData" => $tcpar_Crashtype );

    # $crashInfo_href -> {"CrashCode_MDS"} = $tcpar_Crashtype;

	# # Name of Result DB
	# my $resultDB = $crashDetails_href -> {"RESULTDB"};
	# unless(defined $resultDB) {
		# $resultDB = "DEFAULT";
	# }

	# # Result DB path
	# my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$resultDB" ] );
	# $crashInfo_href -> {"MDB_Path"} = $resultDBDetails->{'PATH'};

	# # Crash time Zero and EDR crash label -> crash name in EDR mapping
	# $crashInfo_href -> {"CrashTimeZero_ms"} = $tcpar_CrashTimeZero_ms;
	# $crashInfo_href -> {"CrashLabel"} = $tcpar_Crashtype;

	# #--------------------------------------------------------------
    # # Initialize equipment
    # #

	# LC_ECU_On();
	# S_wait_ms('TIMER_ECU_READY');
    # CA_trace_start();
    # GDCOM_init() ; # To fetch info for CD from mapping_diag
	
	# # Set environment settings for crash
	# CSI_PrepareEnvironment($crashSettings, 'init_complete');
	# S_wait_ms('TIMER_ECU_READY');
  
    # PD_ClearCrashRecorder();
    # S_wait_ms(2000);
 
    # # erase FltMem
    # PD_ClearFaultMemory();
    # S_wait_ms(2000);

	# # read fault memory
    # my $faultsBeforeStimulation = PD_ReadFaultMemory();
	
	# #Fault memory must be empty
    # my $faultsVerdict = PD_evaluate_faults( $faultsBeforeStimulation, []);
 	# return 0 unless ($faultsVerdict eq 'VERDICT_PASS');

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


sub Quanh_just_to_test_syntax {
    my $crashIdentifyParams_href = shift;    # A hash passed to the API to identify the particular crash
    my $options                  = shift;    # optional
    my $sensorProperties_href    = shift;    # required, if NO_FILTERING = 0, otherwise optional
    my $sensorPropertyKeys_aref  = shift;    # required, if NO_FILTERING = 0, otherwise optional (only passed for convenience of easier usage of these keys, i.e. no need to know any sensor channel name as key in sensorProperties_href)

    my $status;
	S_w2rep("Quanh Dump crashIdentifyParams_href".Dumper($crashIdentifyParams_href));
	S_w2rep("Quanh Dump options".Dumper($options));
	S_w2rep("Quanh Dump sensorProperties_href".Dumper($sensorProperties_href));
	S_w2rep("Quanh Dump sensorPropertyKeys_aref".Dumper($sensorPropertyKeys_aref));
	
}
#-------------------------------------------------------------------------------
sub TC_stimulation_and_measurement {
#-------------------------------------------------------------------------------


	my @my_crash_1 = ("Single_EDR_Front_Inflatable;5", "Single_EDR_SideLeft_Inflatable;5", "Single_EDR_SideRight_Inflatable;5" );
	# my @my_time_1  =("42","44","44");
	my @my_time_1  =("12","14","14");
	my @my_crash_2 = ("Single_EDR_Rear_NonInflatable;5","Single_EDR_Front_NonInflatable;5","Single_EDR_SideLeft_NonInflatable");
	# my @my_time_2  =("45","52","89");
	my @my_time_2  =("12","22","59");
	my @my_crash_3 = ("Single_EDR_SideRight_NonInflatable","Single_EDR_Rear_above_8kph_NoDeployment");
	# my @my_time_3  =("89","142");
	my @my_time_3  =("59","112");
	# my @my_crash_4 = ("Single_EDR_SideRight_Inflatable;5","Single_EDR_SideLeft_NonInflatable", "Single_EDR_Front_Inflatable;5");
	my @my_crash_5 = ("Single_EDR_Front_Inflatable;5", "Single_EDR_SideLeft_Inflatable;5", "Single_EDR_SideRight_Inflatable;5","Single_EDR_Front_Inflatable;5" );
	my @my_crash_6 = ("Single_EDR_Front_Inflatable;5", "Single_EDR_SideLeft_Inflatable;5", "Single_EDR_SideRight_Inflatable;5","Single_EDR_Rear_NonInflatable;5","Single_EDR_Front_NonInflatable;5","Single_EDR_SideLeft_NonInflatable","Single_EDR_SideRight_NonInflatable","Single_EDR_Rear_above_8kph_NoDeployment" );
	
	my $size = @my_crash_1;
	
	for my $i ( 0..$size-1) {
	# DEVICE_resetDeviceState('AB1FD','Short2Bat');
	# S_wait_ms(3000);
	MDSRESULT_Init();
  
	S_teststep("--------------------------------PREPARATION--------------------------------------------------------------");
		S_user_action("COM signal ");
		
		S_teststep("Inject crash $i: $my_crash_1[$i]", 'AUTO_NBR');
		
		my $CrashSettings1 = CSI_GetCrashDataFromMDS({
															'RESULTDB' => 'C:/sandboxes/su12_EM6_Testing/PUN1HC/tools_TurboLIFT/Custlib/config/Tools/CrashFile/SU_EM6/1stSW/MDSng/mdb/CrashFile_Subaru_EM6_20211112_SU1201_B1_0001_BB012021_CAT2_5R-d211115.mdb',
															'MDSTYPE'    => "MDSNG",
															'CRASHNAME'      => $my_crash_1[$i],
															# 'CRASHNAME'      => "Single_EDR_Front_Inflatable;5",
															"STATEVARIATION" => 1, 
													   });
													   
		CSI_PrepareEnvironment($CrashSettings1, 'init_complete');
		
		CSI_LoadCrashSensorData2Simulator( $CrashSettings1);
		
		CSI_TriggerCrash();
		S_wait_ms(10000);
		# my ($status, $SimDevices) = mdsresult_GetSimDevices();
			# S_w2rep("Quanhh write stus: $status","GREEN");
			# S_w2rep("Quanhh write MIN:".Dumper($SimDevices),"GREEN");
		# my  $sensorPropertyKeys_aref = ["AMPLITUDE", "CORRECTION_ANGLE", "CRASH_DEVICE", "DEV_TYPE_INTERN", "INPUT_BIT_WIDTH", , "OFFSET"];
		# my $crashdetails_href =  MDSRESULT_GetCrashDetails('1', '1');
		
		# Quanh_just_to_test_syntax( {'RESULTDB' => 'C:/sandboxes/su12_EM6_Testing/PUN1HC/tools_TurboLIFT/Custlib/config/Tools/CrashFile/SU_EM6/1stSW/MDSng/mdb/CrashFile_Subaru_EM6_20211112_SU1201_B1_0001_BB012021_CAT2_5R-d211115.mdb',
															# 'MDSTYPE'    => "MDSNG",
															# 'CRASHNAME'      => $my_crash_1[$i],
															# 'CRASHNAME'      => "Single_EDR_Front_Inflatable;5",
															# "STATEVARIATION" => 1, 
															# }
															# , 0x0001
														
													   # );  # from result database
		# my $crashdetails_href =  MDSRESULT_GetCrashDetails( {'RESULTDB' => 'C:/sandboxes/su12_EM6_Testing/PUN1HC/tools_TurboLIFT/Custlib/config/Tools/CrashFile/SU_EM6/1stSW/MDSng/mdb/CrashFile_Subaru_EM6_20211112_SU1201_B1_0001_BB012021_CAT2_5R-d211115.mdb',
															# 'MDSTYPE'    => "MDSNG",
															# 'CRASHNAME'      => $my_crash_1[$i],
															# 'CRASHNAME'      => "Single_EDR_Front_Inflatable;5",
															# "STATEVARIATION" => 1, 
															# }
															# , 0x0001 #NO_FILTERING
														
													   # );  # from result database
													   
		# S_w2rep("Quanhh write MIN:".Dumper($crashdetails_href),"GREEN");											   
	# my ($minTime_ms, $maxTime_ms, $isDeployed) = MDSRESULT_GetDeploymentForSimDevice($crashdetails_href, "AB1FD");
	# my ($minTime_ms, $maxTime_ms, $isDeployed) = MDSRESULT_GetDeploymentForSimDevice(" Single_EDR_Front_Inflatable;5", "AB1FD");
	
	

	# S_w2rep("Quanhh write MIN: $minTime_ms","GREEN");

	# S_w2rep("Quanhh write MAX: $maxTime_ms","PINK");
	# S_w2rep("Quanhh write Deloyed: $isDeployed","Yellow");
	#####
		# # S_user_action('check');
		# # S_teststep("Wait $my_time_1[$i]", 'AUTO_NBR');
		# # S_wait_ms($my_time_1[$i]);
		# # S_wait_ms(22);
		# # S_teststep("ECU off", 'AUTO_NBR');
		# # LC_ECU_Off();
		# # S_wait_ms(10000);
		# # S_teststep("ECU on", 'AUTO_NBR');
		# # LC_ECU_On();
		
		
		# # S_user_action('check');
		# my $CrashSettings2 = CSI_GetCrashDataFromMDS({
															# 'RESULTDB' => 'C:/sandboxes/su12_EM6_Testing/PUN1HC/tools_TurboLIFT/Custlib/config/Tools/CrashFile/SU_EM6/1stSW/MDSng/mdb/CrashFile_Subaru_EM6_20211112_SU1201_B1_0001_BB012021_CAT2_5R-d211115.mdb',
															# 'MDSTYPE'    => "MDSNG",
															# # 'CRASHNAME'      => $my_crash_1[$i],
															# 'CRASHNAME'      => "Single_EDR_Front_NonInflatable;5",
															# "STATEVARIATION" => 1, 
													   # });
		# CSI_PrepareEnvironment($CrashSettings2, 'init_complete');
		# CSI_LoadCrashSensorData2Simulator( $CrashSettings2);
		# CSI_TriggerCrash();
		# S_wait_ms(10000);
		
		# my $CrashSettings3 = CSI_GetCrashDataFromMDS({
															# 'RESULTDB' => 'C:/sandboxes/su12_EM6_Testing/PUN1HC/tools_TurboLIFT/Custlib/config/Tools/CrashFile/SU_EM6/1stSW/MDSng/mdb/CrashFile_Subaru_EM6_20211112_SU1201_B1_0001_BB012021_CAT2_5R-d211115.mdb',
															# 'MDSTYPE'    => "MDSNG",
															# # 'CRASHNAME'      => $my_crash_1[$i],
															# 'CRASHNAME'      => "Single_EDR_SideLeft_Inflatable;5",
															# "STATEVARIATION" => 1, 
													   # });
													   
		# CSI_PrepareEnvironment($CrashSettings3, 'init_complete');
		# CSI_LoadCrashSensorData2Simulator( $CrashSettings3);
		# CSI_TriggerCrash();
		# S_wait_ms(10000);
		
		# S_w2rep("Set ECU in idle mode",'Purple');
		# PD_WriteMemoryByName('rb_swv_SwVersionNvmCfg_dfst.ProjectId_u8',[04]);
		# GEN_Power_on_Reset();
		# PD_ECUlogin();
		# # Read fault memory after crash
		# PD_ReadFaultMemory();
		# S_wait_ms(2000);
		
	GDCOM_request ('10 03', '', 'relax');
	S_wait_ms(200);
	S_teststep("Send request to access security level2.", 'AUTO_NBR');			#measurement 2
	my $res_key1 = _reqres_key();
	my @reskey1 = split(/ /,$res_key1);
	EVAL_evaluate_value("Checking value of byte 1", @reskey1[0],'==',0x67);
	EVAL_evaluate_value("Checking value of byte 2", @reskey1[1],'==',0x4);
	#set bien ve 0 neu ko xai
	CA_set_EnvVar_value('Security03', 0);
	S_wait_ms(500);
	
	# EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => "ProdDiag",
								# "CrashLabel" =>$my_crash_1[$i],#."_$tcpar_SquibLabel\_Faulty",
								# "NbrOfRecords" => $i ,
								# "StoragePath" => $dataStoragePath,
								# "read_EDRType"=>'CHINA');
								
	# S_teststep("Read service 22 10 66:");
	# GDCOM_request ('22 10 66', '', 'relax');
		S_teststep("Read EDR 1:");
		S_teststep("FA 13:");
		GDCOM_request("22 FA 13","62 FA 13","relax");
		S_wait_ms(500);
		
		S_teststep("FA 14");
		GDCOM_request("22 FA 14","62 FA 14","relax");
		S_wait_ms(500);

		S_teststep("FA 15");
		GDCOM_request("22 FA 15","62 FA 15","relax");
		S_wait_ms(500);
		S_teststep("----------------------------------------22 25 ------------------------------------------------------");
		# S_teststep("Read EDR 1:");
		S_teststep("22 25 02 :");
		GDCOM_request("22 25 02","62","relax");
		# # GDCOM_request_general('ReadDataByIdentifier_CnEDRdata01', 'PR_ReadDataByIdentifier_CnEDRdata01','relax'); 
		S_wait_ms(500);
		
		S_teststep("22 25 05");
		GDCOM_request("22 25 05","62","relax");
		S_wait_ms(500);
		
		S_teststep("22 25 08");
		GDCOM_request("22 25 08","62","relax");
		S_wait_ms(500);
		
		S_teststep("----------------------------------------------------------------------------------------------");
		S_teststep("----------------------------------------------------------------------------------------------");
		S_teststep("----------------------------------------------------------------------------------------------");
	}
	
	# S_teststep("------------------------------------OVERWIRTE BUFFER ----------------------------------------------------------");
	# S_user_action("OVERWRITE");
	# my $size1 = @my_crash_5;
	# for my $i ( 0..$size1-1) {
	#####
	# S_teststep("--------------------------------PREPARATION--------------------------------------------------------------");
	# S_user_action("INJECT AD CRASH");
	
	# S_teststep("Inject crash $i: $my_crash_5[$i]", 'AUTO_NBR');
	
	# my $CrashSettings2 = CSI_GetCrashDataFromMDS({
														# 'RESULTDB' => 'C:/sandboxes/su12_EM6_Testing/PUN1HC/tools_TurboLIFT/Custlib/config/Tools/CrashFile/SU_EM6/1stSW/MDSng/mdb/CrashFile_Subaru_EM6_20211112_SU1201_B1_0001_BB012021_CAT2_5R-d211115.mdb',
														# 'MDSTYPE'    => "MDSNG",
														# 'CRASHNAME'      => $my_crash_5[$i],
														# "STATEVARIATION" => 1, 
												   # });
												   
	# CSI_PrepareEnvironment($CrashSettings2, 'init_complete');
	
	# CSI_LoadCrashSensorData2Simulator( $CrashSettings2);
	
	# CSI_TriggerCrash();
	# S_wait_ms(10000);
	# S_user_action('check');
	
	# S_teststep("Read EDR 1:");
	# S_teststep("FA 13:");
	# GDCOM_request("22 FA 13","62 FA 13","relax");
	# S_wait_ms(500);
	
	# S_teststep("FA 14");
	# GDCOM_request("22 FA 14","62 FA 14","relax");
	# S_wait_ms(500);

	# S_teststep("FA 15");
	# GDCOM_request("22 FA 15","62 FA 15","relax");
	# S_wait_ms(500);
	# S_teststep("----------------------------------------22 25 ------------------------------------------------------");
	# S_teststep("Read EDR 1:");
	# S_teststep("22 25 02 :");
	# GDCOM_request("22 25 02","62","relax");
	# S_wait_ms(500);
	
	# S_teststep("22 25 05");
	# GDCOM_request("22 25 05","62","relax");
	# S_wait_ms(500);
	
	# S_teststep("22 25 08");
	# GDCOM_request("22 25 08","62","relax");
	# S_wait_ms(500);
	
	# S_teststep("----------------------------------------------------------------------------------------------");
	# S_teststep("----------------------------------------------------------------------------------------------");
	# S_teststep("----------------------------------------------------------------------------------------------");
# }

	 
	 
	 

	return 1;
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
    }

	#normal mode
	# S_w2rep("Set ECU in normal mode",'Purple');
	# PD_WriteMemoryByName('rb_swv_SwVersionNvmCfg_dfst.ProjectId_u8',[01]);
	# GEN_Power_on_Reset();
	# PD_ECUlogin();
	
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


1;