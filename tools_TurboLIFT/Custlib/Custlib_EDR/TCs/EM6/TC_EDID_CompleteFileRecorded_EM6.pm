#### TEST CASE MODULE
package TC_EDID_CompleteFileRecorded_EM6;

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
use LIFT_PD;
use GENERIC_DCOM;
use LIFT_can_access;
use LIFT_labcar;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use FuncLib_SYC_INTERFACE;
use FuncLib_EDR_Framework;
use Data::Dumper;
use FuncLib_CustLib_EDR_CNEDR;

use LIFT_general;
use LIFT_evaluation;
use FuncLib_SYC_INTERFACE;
use FuncLib_EDR_Framework;
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
use LIFT_QuaTe;
use LIFT_numerics;
use FuncLib_CustLib_EDR_CNEDR;

##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_CompleteFileRecorded_EM6

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Activate EDR functionality


I<B<Stimulation and Measurement>>

1. Power Off if Condition <Condition> is ‘BeforeCrash’

2. Inject the crash <Crashcode> 

3. wait for <TimeBeforePowerOffAfterCrash>

4. Power Off if  <Condition> is ‘AfterCrash’

5. wait for <TimeBeforePowerOnAfterCrash>

6.Create <PowerONCondition> if PowerONCondition is 'PowerON'

7. wait for 15 seconds till EDR data is stored.

8. Read the <EDID>  in all Recorders


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

<EDID> should have '0x00' if record is incomplete

<EDID> should have '0x01' if record is complete


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'EDID' => 
	SCALAR 'Condition' => 
	SCALAR 'PowerONCondition' => 
	SCALAR 'TimeBeforePowerOffAfterCrash' => 
	SCALAR 'TimeBeforePowerOnAfterCrash' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 
	HASH 'COMsignalsAfterCrash' => 
	SCALAR 'MandatoryDataStoredForIncident' => 
	HASH 'StorageStatus_Records' => 
	HASH 'PD_PowerOnCounter_Variable' => 
	HASH 'General_MandEDIDs' => 
	HASH 'COM_RGB_MandEDIDs' => 
	SCALAR 'expected_Completelystored' => 
	SCALAR 'expected_NotCompletelystored' => 


=head2 PARAMETER EXAMPLES

	purpose	= 'To validate Complete File Record Reported in EDR'
	EDID = '4012'
	# --- Stimulation ---
	Condition = 'None'
	PowerONCondition = 'None'
	TimeBeforePowerOffAfterCrash = '0'
	TimeBeforePowerOnAfterCrash ='0'
	DiagType  = 'ProdDiag' 
	ResultDB = 'EDR'
	COMsignalsAfterCrash = %()
	MandatoryDataStoredForIncident = '1'
	# --- Evaluation ---
	StorageStatus_Records = %('Record_1' => '0x01', 'Record_2' => '0x01') # storage status of records. Give here number of expected records as well as the storage status of the records.
	PD_PowerOnCounter_Variable = %('VariableName' => 'rb_tim_EcuOnTimeDataEe_st.POnCounter_u32', 'VariableType' => 'U32')
	General_MandEDIDs =%( '4013' => 'TimeFromCurrentToLastEvent',  '4010' => 'IgnitionCycleEvent', '4011' => 'IgnitionCycleDownload', '4014' => 'Vehicle Identification Number', '4015' => 'ECU_HW_Number', '4016' => 'ECU_Serial_Number', '4017' => 'ECU_SW_Number' )
	COM_RGB_MandEDIDs = %('4005' => 'Speed_vehicle_indicated', '4000' => 'DVLongitudinal', '4001' => 'MaxDVLongitudinal',  '4002' => 'TimeMaxDVLongitudinal', '4006' => 'ServiceBrake', '4007' => 'DriverSafetybeltStatus', '4008' => 'AcceleratorPedalPosition', '4009' => 'RevolutionPerMinute', '4035' => 'ThrottlePosition', '4003'=> 'ClippingTimeLongitudinal',  '4004'=> 'ClippingTimeLateral')
	expected_Completelystored =  '0x01' #Mandatory storage Completed Successfully
	expected_NotCompletelystored =  '0x00' #Mandatory storage not Completed Successfully
	#All mandatory EDIDs appliacble for the projects needs to be added.It varies from project to project
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_Condition;
my $tcpar_PowerONCondition;
my $tcpar_TimeBeforePowerOffAfterCrash;
my $tcpar_TimeBeforePowerOnAfterCrash;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_COMsignalsAfterCrash;
my $tcpar_MandatoryDataStoredForIncident;
my $tcpar_StorageStatus_Records;
my $tcpar_PD_PowerOnCounter_Variable;
my $tcpar_General_MandEDIDs;
my $tcpar_com_RGB_MandEDIDs;
my $tcpar_expected_Completelystored;
my $tcpar_expected_NotCompletelystored;

################ global parameter declaration ###################
#add any global variables here
my $tcpar_Crashcode;
my $tcpar_Crash_TimeZero_msec;
my $tcpar_Switch_MandEDIDs;
my $edrNumberOfEventsToBeStored ;
my $tcpar_FireTime_MandEDIDs;
my $storageOrder;
my $tcpar_read_NHTSAEDR;
my $tcpar_read_CHINAEDR;

my ($record_handler, $crashSettings, $expectedRawValues_href, $allSwitchStatesDuringCrash_href, $ChinaEDR_diagType);
###############################################################

sub TC_set_parameters {

	# $tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	# $tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	# $tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	# $tcpar_PowerONCondition =  GEN_Read_mandatory_testcase_parameter( 'PowerONCondition' );
	# $tcpar_TimeBeforePowerOffAfterCrash =  GEN_Read_mandatory_testcase_parameter( 'TimeBeforePowerOffAfterCrash' );
	# $tcpar_TimeBeforePowerOnAfterCrash =  GEN_Read_mandatory_testcase_parameter( 'TimeBeforePowerOnAfterCrash' );
	# $tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	# $tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	# $tcpar_COMsignalsAfterCrash =  GEN_Read_mandatory_testcase_parameter( 'COMsignalsAfterCrash' );
	# $tcpar_MandatoryDataStoredForIncident =  GEN_Read_mandatory_testcase_parameter( 'MandatoryDataStoredForIncident' );
	# $tcpar_StorageStatus_Records =  GEN_Read_mandatory_testcase_parameter( 'StorageStatus_Records' );
	# $tcpar_PD_PowerOnCounter_Variable =  GEN_Read_mandatory_testcase_parameter( 'PD_PowerOnCounter_Variable' );
	# $tcpar_General_MandEDIDs =  GEN_Read_mandatory_testcase_parameter( 'General_MandEDIDs' );
	# $tcpar_COM_RGB_MandEDIDs =  GEN_Read_mandatory_testcase_parameter( 'COM_RGB_MandEDIDs' );
	# $tcpar_expected_Completelystored =  GEN_Read_mandatory_testcase_parameter( 'expected_Completelystored' );
	# $tcpar_expected_NotCompletelystored =  GEN_Read_mandatory_testcase_parameter( 'expected_NotCompletelystored' );

	$tcpar_purpose =  S_read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDID =  S_read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_Condition =  S_read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_DiagType =  S_read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  S_read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_TimeBeforePowerOffAfterCrash =  S_read_mandatory_testcase_parameter( 'TimeBeforePowerOffAfterCrash' );
	$tcpar_TimeBeforePowerOnAfterCrash =  S_read_mandatory_testcase_parameter( 'TimeBeforePowerOnAfterCrash' );
    $tcpar_MandatoryDataStoredForIncident = S_read_mandatory_testcase_parameter( 'MandatoryDataStoredForIncident' );
	$tcpar_PowerONCondition = S_read_mandatory_testcase_parameter( 'PowerONCondition' );
    if(not defined $tcpar_MandatoryDataStoredForIncident){
        S_set_error("incident number where mandatory data must be stored is not given, hence test aborted");
        return;
    }
	$tcpar_COMsignalsAfterCrash =  S_read_optional_testcase_parameter( 'COMsignalsAfterCrash','byref');
	$tcpar_Crashcode =  S_read_mandatory_testcase_parameter( 'Crashcode' );
	$tcpar_Crash_TimeZero_msec =  S_read_mandatory_testcase_parameter( 'Crash_TimeZero_msec' );
	# $tcpar_Switch_MandEDIDs = S_read_mandatory_testcase_parameter( 'Switch_MandEDIDs', 'byref' );
	$tcpar_General_MandEDIDs = S_read_mandatory_testcase_parameter( 'General_MandEDIDs', 'byref' );
	$tcpar_FireTime_MandEDIDs = S_read_optional_testcase_parameter( 'FireTime_MandEDIDs', 'byref' );
	if(not defined $tcpar_FireTime_MandEDIDs){
		my $fireTimeLabelMapping = S_get_contents_of_hash(['Mapping_EDR', 'SquibLabelMapping']);
		%{$tcpar_FireTime_MandEDIDs} = reverse %{$fireTimeLabelMapping};
	}
	$tcpar_com_RGB_MandEDIDs = S_read_mandatory_testcase_parameter( 'COM_RGB_MandEDIDs', 'byref' );
	$tcpar_PD_PowerOnCounter_Variable = S_read_mandatory_testcase_parameter( 'PD_PowerOnCounter_Variable',  'byref');
	$tcpar_expected_Completelystored = S_read_mandatory_testcase_parameter( 'expected_Completelystored');
	$tcpar_expected_NotCompletelystored = S_read_mandatory_testcase_parameter( 'expected_NotCompletelystored');
	$tcpar_StorageStatus_Records = S_read_mandatory_testcase_parameter( 'StorageStatus_Records', 'byref');
	$tcpar_read_NHTSAEDR=S_read_optional_testcase_parameter('read_NHTSAEDR');
	$tcpar_read_CHINAEDR=S_read_optional_testcase_parameter('read_CHINAEDR');
	
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
	S_wait_ms(2000);
	
	
	$tcpar_Crashcode .= "PowerOff_$tcpar_Condition";

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
    my $faultsVerdict = PD_evaluate_faults_NOVERDICT( $faultsBeforeStimulation, []);
    return 0 unless ($faultsVerdict eq 'VERDICT_PASS');


	return 1;
}

sub TC_stimulation_and_measurement {

	CSI_PrepareEnvironment( $crashSettings, 'before_crash_same_cycle','normal' );
    S_wait_ms(1000);
    
    # S_teststep("Start recording of fire times in LCT.", 'AUTO_NBR');
    # LC_MeasureTraceDigitalStart();

	# Read power on cycle for evaluation
	my $powerOnCounterCrash = PD_ReadMemoryByName($tcpar_PD_PowerOnCounter_Variable -> {"VariableName"});
    $powerOnCounterCrash = S_aref2hex ( $powerOnCounterCrash, $tcpar_PD_PowerOnCounter_Variable -> {"VariableType"} );
	my @powerOnCounter_array = split(/0x/, $powerOnCounterCrash);
	
	S_w2log(1, "powerOnCounter_array[1]: $powerOnCounter_array[1]");
	S_w2log(1, "powerOnCounter_array[2]: $powerOnCounter_array[2]");
	
	
	$powerOnCounterCrash  = $powerOnCounter_array[1];
	$powerOnCounterCrash = "0x".$powerOnCounterCrash;
	$expectedRawValues_href -> {'IgnitionCycleEvent'} = {"Record_1" => $powerOnCounterCrash, "Record_2" => $powerOnCounterCrash, , "Record_3" => $powerOnCounterCrash};
	if($tcpar_Condition eq 'None'){
		$expectedRawValues_href -> {'IgnitionCycleDownload'} = {"Record_1" => $powerOnCounterCrash, "Record_2" => $powerOnCounterCrash, "Record_3" => $powerOnCounterCrash};		
	}
	else{
		my $powerOnCounter_dec = hex($powerOnCounterCrash) + 1;
		my $powerOnCounter_hex = "0x".sprintf("%08X", $powerOnCounter_dec);
		$expectedRawValues_href -> {'IgnitionCycleDownload'} = {"Record_1" => $powerOnCounter_hex, "Record_2" => $powerOnCounter_hex};	
	}
	S_w2rep("powerOnCounterCrash: $powerOnCounterCrash");
	S_teststep(" Power Off if Condition $tcpar_Condition is 'BeforeCrash' ", 'AUTO_NBR');
	if ($tcpar_Condition eq 'BeforeCrash')
	{
		S_w2log(1, "Power OFF ECU");
		LC_ECU_Off();
		# S_wait_ms('TIMER_ECU_OFF');
	}
	else
	{
		S_w2log(1, "Power Off is $tcpar_Condition, Do nothing");
	}

	S_teststep("Inject the crash'$tcpar_Crashcode' ", 'AUTO_NBR');
	CSI_TriggerCrash();
	S_wait_ms($tcpar_TimeBeforePowerOffAfterCrash);
	# S_user_action("Crash");
	# if ($tcpar_Condition ne 'None'){
		# S_teststep("wait for '$tcpar_TimeBeforePowerOffAfterCrash'", 'AUTO_NBR');
		# S_wait_ms($tcpar_TimeBeforePowerOffAfterCrash);
		# S_teststep("Power OFF ECU", 'AUTO_NBR');
		# S_w2log(1, "Power OFF ECU");
		# LC_ECU_Off();

		# S_teststep("wait for '$tcpar_TimeBeforePowerOnAfterCrash'", 'AUTO_NBR');
		# S_wait_ms($tcpar_TimeBeforePowerOnAfterCrash);
		# S_w2log(1, "Power ON ECU");
		# LC_ECU_On();
	# }
	
	S_teststep(" Power Off if Condition $tcpar_Condition is 'AfterCrash' ", 'AUTO_NBR');
	if ($tcpar_Condition eq 'AfterCrash')
	{
		S_w2log(1, "Power OFF ECU");
		LC_ECU_Off();
		# S_wait_ms('TIMER_ECU_OFF');
	}
	
	S_teststep("wait for $tcpar_TimeBeforePowerOnAfterCrash ", 'AUTO_NBR');
	S_wait_ms($tcpar_TimeBeforePowerOnAfterCrash);
	
	S_teststep("Create PowerOnCondition $tcpar_PowerONCondition if PowerONCondition is 'PowerOn' ", 'AUTO_NBR');
	if ($tcpar_PowerONCondition eq 'PowerOn')
	{
		S_w2log(1, "Power ON ECU");
		LC_ECU_On();
		
	}
	S_teststep("wait for 15 seconds till EDR data is stored.", 'AUTO_NBR');
	S_wait_ms(15000);
	
	
	
	if (defined $tcpar_COMsignalsAfterCrash){
        foreach my $signal (keys %{$tcpar_COMsignalsAfterCrash})
        {
            my $dataOnCOM = $tcpar_COMsignalsAfterCrash -> {$signal};
            S_w2rep("Signal =$signal,Data to be sent=$dataOnCOM");
            COM_setSignalState($signal,$dataOnCOM);
        }
    }

	

    # S_teststep("Stop recording of fire times in LCT.", 'AUTO_NBR');
    # LC_MeasureTraceDigitalStop();

    S_teststep("Read fault memory after crash injection", 'AUTO_NBR');
	PD_ReadFaultMemory();


    # Read all EDR records supported for the project
	my $dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number()."_".$tcpar_Crashcode;
	$edrNumberOfEventsToBeStored = SYC_EDR_get_NumberOfEventsToBeStored();
	S_teststep("Read the EDID '$tcpar_EDID'  in all '$edrNumberOfEventsToBeStored' EDR Records", 'AUTO_NBR');
    PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');
    
	Prepertation();
	
    if ( lc( $tcpar_read_NHTSAEDR) eq 'yes' ) {
		EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								"CrashLabel" => $tcpar_Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'NHTSA')
	}
	if (lc($tcpar_read_CHINAEDR) eq 'yes'){
		$edrNumberOfEventsToBeStored=3;
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" =>  $ChinaEDR_diagType,
								"CrashLabel" => $tcpar_Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA');
	
	}

	
	return 1;
}

sub  TC_evaluation {
	my $allMandatoryDataStored = shift;
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
	my $recordNumber;

	# Assign expected values according to StorageOrder
    my $storageOrder = EDR_getStorageOrder ();
    return unless(defined $storageOrder);

	if($storageOrder eq 'PhysicalOrder'){
       $storageOrder =  'MostRecentLast'; #same behavior as there is no overwriting
    }

	#Based on available records and storage order the record number will be identified for mandatory storage incident will be identified
 
	my $record_incident_mapping;
	if($detectedNbrOfStoredRecords == 0) {
        S_set_error("No EDR records are stored, hence test is aborted ");    
		
	}
	elsif($detectedNbrOfStoredRecords == 1){
		$recordNumber=$tcpar_MandatoryDataStoredForIncident;
		$record_incident_mapping -> {"Record_1"} = $tcpar_MandatoryDataStoredForIncident;
	}
	elsif($detectedNbrOfStoredRecords == 2){

		if($storageOrder eq 'MostRecentLast'){
			$record_incident_mapping -> {"Record_1"} = 1;
			$record_incident_mapping -> {"Record_2"} = 2;
			$recordNumber =1 if ($tcpar_MandatoryDataStoredForIncident ==1);
			$recordNumber =2 if ($tcpar_MandatoryDataStoredForIncident ==2);
		}
		if($storageOrder eq 'MostRecentFirst'){
			$record_incident_mapping -> {"Record_1"} = 2 ;
			$record_incident_mapping -> {"Record_2"} = 1;
			$recordNumber =2 if ($tcpar_MandatoryDataStoredForIncident ==1);
			$recordNumber =1 if ($tcpar_MandatoryDataStoredForIncident ==2);
		}
	}
	elsif($detectedNbrOfStoredRecords == 3){

		if($storageOrder eq 'MostRecentLast'){
			$record_incident_mapping -> {"Record_1"} = 1;
			$record_incident_mapping -> {"Record_2"} = 2;
			$record_incident_mapping -> {"Record_3"} = 3;
			$recordNumber =1 if ($tcpar_MandatoryDataStoredForIncident ==1);
			$recordNumber =2 if ($tcpar_MandatoryDataStoredForIncident ==2);
			$recordNumber =3 if ($tcpar_MandatoryDataStoredForIncident ==3);
		}
		if($storageOrder eq 'MostRecentFirst'){
			$record_incident_mapping -> {"Record_1"} = 3 ;
			$record_incident_mapping -> {"Record_2"} = 2 ;
			$record_incident_mapping -> {"Record_3"} = 1;
			$recordNumber =3 if ($tcpar_MandatoryDataStoredForIncident ==1);
			$recordNumber =2 if ($tcpar_MandatoryDataStoredForIncident ==2);
			$recordNumber =1 if ($tcpar_MandatoryDataStoredForIncident ==3);
		}
	}

	if ($main::opt_offline){
		$record_incident_mapping -> {"Record_1"} = 1;
	    $recordNumber=1;
	    $detectedNbrOfStoredRecords=1;
	}
	if ($detectedNbrOfStoredRecords < 3)
	{
		S_w2rep("--- Only Record number $recordNumber is evaluated as mandatory incident $tcpar_MandatoryDataStoredForIncident is stored in it---");
		S_w2rep("--- Read mandatory EDR data in Record number $recordNumber ---"); #evaluation 1
	}
	elsif ($detectedNbrOfStoredRecords >= 3)
	{
		S_w2rep("--- Record number $recordNumber is evaluated as mandatory incident 3 is stored in it---");
		S_w2rep("--- Read mandatory EDR data in Record number $recordNumber ---"); #evaluation 1
	}
	
	
	#--------------------------------------------------------------
	# COM SIGNALs and SENSOR RGB DATA(NON Default value)
	#
	S_w2rep("");
	S_w2rep("--------------------------------------------------------", 'purple');
	S_w2rep("NON DEFAULT DATA DATA", 'purple');
	$verdict = 'VERDICT_PASS';
	
	#Quanhh sua
	my $edidHash_href = FuncLib_TNT_EDR::EDR_ReadEDR_Record_structure_info_from_mapping();
	# my $edidHash_href = FuncLib_CustLib_EDR_CNEDR::EDR_ReadCHINAEDR_Record_structure_info_from_mapping();
	foreach  my $com_RGB_EDID (keys %{$tcpar_com_RGB_MandEDIDs})
	{
		my $defaultValue = 'FF';
		my $dataElement = $record_handler -> GetDataElementEDID( "EDIDnr" => $com_RGB_EDID, "RecordNumber" => $recordNumber,
																  "CrashLabel" => $tcpar_Crashcode);
		unless ($dataElement){
		    S_set_error("EDID $com_RGB_EDID not available in record $recordNumber");
		    next;
		}
		my $bytesPerDataSample;
		if (($com_RGB_EDID eq '4003') || ($com_RGB_EDID eq '4004') || ($com_RGB_EDID eq '4035'))
		{
			S_teststep("Check EDID $com_RGB_EDID ($dataElement) has default value in record $recordNumber",
							 'AUTO_NBR',
							 "compare_COM_SensorRGB_EDID_$com_RGB_EDID\_Record_$recordNumber");

			S_w2log(1, "Get EDID $com_RGB_EDID data for Record $recordNumber");
			$detectedEDIDvalue = $record_handler -> GetRawEDID( "EDIDnr" => $com_RGB_EDID,
													   "RecordNumber" => $recordNumber,
													   "CrashLabel" => $tcpar_Crashcode,
													   "FormatOption" => "HEX");
		
			unless(defined $detectedEDIDvalue) {
				S_set_error("No data could be obtained for EDID $com_RGB_EDID.");
				next;
			}
				
			$bytesPerDataSample = $edidHash_href -> {'EDIDS'} -> {$com_RGB_EDID} -> {'BytesPerDataSample'};
			unless(defined $bytesPerDataSample){
				S_set_warning("No bytes per data sample obtained for EDID $com_RGB_EDID in EDR mapping. Will be set to default '1'");
				$bytesPerDataSample = 1;
			}    
			
		}
		
		else
		{
			S_teststep("Check EDID $com_RGB_EDID ($dataElement) has non default value in record $recordNumber",
							 'AUTO_NBR',
							 "compare_COM_SensorRGB_EDID_$com_RGB_EDID\_Record_$recordNumber");

			S_w2log(1, "Get EDID $com_RGB_EDID data for Record $recordNumber");
			$detectedEDIDvalue = $record_handler -> GetRawEDID( "EDIDnr" => $com_RGB_EDID,
													   "RecordNumber" => $recordNumber,
													   "CrashLabel" => $tcpar_Crashcode,
													   "FormatOption" => "HEX");
		
			unless(defined $detectedEDIDvalue) {
				S_set_error("No data could be obtained for EDID $com_RGB_EDID.");
				next;
			}
				
			$bytesPerDataSample = $edidHash_href -> {'EDIDS'} -> {$com_RGB_EDID} -> {'BytesPerDataSample'};
			unless(defined $bytesPerDataSample){
				S_set_warning("No bytes per data sample obtained for EDID $com_RGB_EDID in EDR mapping. Will be set to default '1'");
				$bytesPerDataSample = 1;
			}            
        }   
        if(ref $detectedEDIDvalue eq 'ARRAY') 
		{
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
				my $thisVerdict;
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
					
					if (($com_RGB_EDID eq '4035')||(($com_RGB_EDID eq '4000')&&($tcpar_Crashcode eq 'Single_EDR_SideRight_Inflatable;5')))
					{
						$thisVerdict = EVAL_evaluate_string_NOVERDICT ( "EDID_$com_RGB_EDID\_Evaluation_$dataSample", $adaptedDefaultValue, $thisDataSampleValue, '==');
						
					}
					else
					{
					
						$thisVerdict = EVAL_evaluate_string_NOVERDICT ( "EDID_$com_RGB_EDID\_Evaluation_$dataSample", $adaptedDefaultValue, $thisDataSampleValue, '!=');
						
					}
                    $verdict = 'VERDICT_FAIL' if($thisVerdict eq 'VERDICT_FAIL');
                    S_teststep_expected(" != $nonDefaultValueAdapted", "EDID_$com_RGB_EDID\_Record_$recordNumber\_sample_$dataSample");
                    S_teststep_detected("$thisDataSampleValue", "EDID_$com_RGB_EDID\_Record_$recordNumber\_sample_$dataSample");                   
                }
            }
            else {
				my $thisVerdict;
				if (($com_RGB_EDID eq '4003') || ($com_RGB_EDID eq '4004'))
				{
					$thisVerdict = EVAL_evaluate_string_NOVERDICT ( "EDID_$com_RGB_EDID\_Evaluation", $defaultValue, $detectedEDIDvalue, '=='); 
					
				}
				else
				{
				
					$thisVerdict = EVAL_evaluate_string_NOVERDICT ( "EDID_$com_RGB_EDID\_Evaluation", $defaultValue, $detectedEDIDvalue, '!=');  
					
				}				
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
		$expectedRawValues_href -> {'MultiEventNumber'} = {"Record_1" => '0x01'};
		$expectedRawValues_href -> {'TimeFromInitialToCurrent'} = {"Record_1" => '0xFFFF'};
		$expectedRawValues_href -> {'AWL_Status'} = {"Record_1" => '0x00'};
	}
	elsif($storageOrder eq 'MostRecentLast') {
		$expectedRawValues_href -> {'MultiEventNumber'} = {"Record_1" => '0x01'};
		$expectedRawValues_href -> {'TimeFromInitialToCurrent'} = {"Record_1" => '0xFFFF'};
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
																	 "RecordNumber" => $recordNumber,
															     	 "CrashLabel" => $tcpar_Crashcode);
		next unless ($dataElement);
		my $expectedEDID_Value = $expectedRawValues_href -> {$general_EDID_DataElement} -> {"Record_$recordNumber"};
		next unless(defined $expectedEDID_Value);

		S_w2log(1, "EDID $general_EDID ($dataElement)");
		S_teststep("Compare EDID $general_EDID ($dataElement) is stored with expected value in record $recordNumber",
			             'AUTO_NBR',
			             "compare_General_EDIDS_$general_EDID\_Record_$recordNumber"); #measurement 2
	
		S_w2log(1, "Get EDID $general_EDID data for Record $recordNumber");

		# $detectedEDIDvalue = $record_handler -> GetRawEDID( "EDIDnr" => $general_EDID,
												   # "RecordNumber" => $recordNumber,
												   # "CrashLabel" => $tcpar_Crashcode,
												   # "FormatOption" => "HEX");
												   
	S_wait_ms(10000);											   
	my	$detectedEDIDvalue = $record_handler -> GetRawEdidDataSamples( "EDIDnr" => $general_EDID,
												   "RecordNumber" => $recordNumber,
												   "CrashLabel" => $tcpar_Crashcode,
												   "FormatOption" => "HEX");
	
		unless(defined $detectedEDIDvalue) {
			S_set_error("No data could be obtained for EDID $general_EDID in record $recordNumber.");
			next;
		}
	
		# if(ref $detectedEDIDvalue eq 'ARRAY') {
			# my $detectedEDIDvalueString;
			# foreach my $hexElement (@{$detectedEDIDvalue})
			# {
				# $detectedEDIDvalueString .= $hexElement;
			# }
			# $detectedEDIDvalue = $detectedEDIDvalueString;
		# }
		$detectedEDIDvalue="0x".$detectedEDIDvalue;	
		S_w2rep("detectedEDIDvalue: $detectedEDIDvalue");
		S_teststep_expected("EDID $general_EDID: $expectedEDID_Value", "compare_General_EDIDS_$general_EDID\_Record_$recordNumber");
		S_teststep_detected("EDID $general_EDID: $detectedEDIDvalue", "compare_General_EDIDS_$general_EDID\_Record_$recordNumber");
	
        my $generalverdict = EVAL_evaluate_value ( "EDID_$general_EDID:\_Evaluation", $detectedEDIDvalue, "==", $expectedEDID_Value);			    
		$verdict = 'VERDICT_FAIL' if ($generalverdict eq 'VERDICT_FAIL');
	}
	
	S_w2rep("General EDID verdict: $verdict");
	# if (($allMandatoryDataStored eq 'PASS') && ($verdict eq 'VERDICT_PASS'))
	if ($verdict eq 'VERDICT_PASS')
	{
		$allMandatoryDataStored = 'PASS';
	}
	elsif($verdict eq 'VERDICT_FAIL')
	{
		$allMandatoryDataStored = 'FAIL';
	}
	
	
	# S_w2rep("allMandatoryDataStored: $allMandatoryDataStored");
	
	#--------------------------------------------------------------
	# COMLPLE FILE RECORDED
	#--------------------------------------------------------------
	
	S_w2rep("");
	S_w2rep("--------------------------------------------------------", 'purple');
	S_w2rep("COMPLETE FILE RECORDED for all stored records", 'purple');
	
	foreach my $currentRecordNbr(1..$detectedNbrOfStoredRecords){
	# if ($detectedNbrOfStoredRecords == 1)
	# {
		if ($currentRecordNbr==$recordNumber){
			S_w2rep("-------COMPLETE FILE RECORDED for mandatory incident $tcpar_MandatoryDataStoredForIncident stored in Record number $currentRecordNbr-------------", 'purple');
		}
		else {
			S_w2rep("-------COMPLETE FILE RECORDED for optional incident stored in Record number $currentRecordNbr-------------", 'purple');
	
		}
		my $detectedvalue = $record_handler -> GetRawEDID( "EDIDnr" => $tcpar_EDID,
														   "RecordNumber" =>$currentRecordNbr,
														   "CrashLabel" => $tcpar_Crashcode,
															"FormatOption" => "HEX");
		$detectedvalue="0x".$detectedvalue;													
		S_w2rep("Detected value of EDID '$tcpar_EDID' is '$detectedvalue' ");
		
		if ($currentRecordNbr==$recordNumber){
			# Complete file record validation
			S_teststep("Validate EDID_$tcpar_EDID value in EDR record $currentRecordNbr based on actual storage status of all mandatory data", 'AUTO_NBR', "compare_completefileRecorded_edids\_Record_$recordNumber");
			if($allMandatoryDataStored eq 'PASS')
			{
				S_w2rep("EDR has stored all Mandatory data");
				S_teststep_expected("EDID $tcpar_EDID record $currentRecordNbr expected: $tcpar_expected_Completelystored", "compare_completefileRecorded_edids\_Record_$currentRecordNbr");
				S_teststep_detected("EDID $tcpar_EDID record $currentRecordNbr detected: $detectedvalue", "compare_completefileRecorded_edids\_Record_$currentRecordNbr");
					
				EVAL_evaluate_value("EDID_$tcpar_EDID\_Record_$currentRecordNbr", $detectedvalue,'==', $tcpar_expected_Completelystored);
			}
			# not all mandatory data stored
			else{
				S_w2rep("EDR has not stored all Mandatory data in EDR");
				S_teststep_expected("EDID $tcpar_EDID record $currentRecordNbr expected: $tcpar_expected_NotCompletelystored", "compare_completefileRecorded_edids\_Record_$currentRecordNbr");
				S_teststep_detected("EDID $tcpar_EDID record $currentRecordNbr detected: $detectedvalue", "compare_completefileRecorded_edids\_Record_$currentRecordNbr");
					
				EVAL_evaluate_value("EDID_$tcpar_EDID\_Record_$currentRecordNbr", $detectedvalue,'==', $tcpar_expected_NotCompletelystored);
			}

		}

		S_teststep("Validate EDID_$tcpar_EDID value in EDR record $currentRecordNbr based on expected value from TS", 'AUTO_NBR', "compare_completefileRecorded_TS_expected\_Record_$currentRecordNbr");

		my $expectedRecordStatus = $tcpar_StorageStatus_Records -> {"Record_$currentRecordNbr"};
			
		EVAL_evaluate_value("EDID_$tcpar_EDID\_Record_$currentRecordNbr", $detectedvalue,'==', $expectedRecordStatus);
		
		S_teststep_expected("EDID $tcpar_EDID record $currentRecordNbr expected: $expectedRecordStatus", "compare_completefileRecorded_TS_expected\_Record_$currentRecordNbr");
		S_teststep_detected("EDID $tcpar_EDID record $currentRecordNbr detected: $detectedvalue", "compare_completefileRecorded_TS_expected\_Record_$currentRecordNbr");
		
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

    # LC_ECU_Off();
    # S_wait_ms('TIMER_ECU_OFF');

	return 1;
}
1;
