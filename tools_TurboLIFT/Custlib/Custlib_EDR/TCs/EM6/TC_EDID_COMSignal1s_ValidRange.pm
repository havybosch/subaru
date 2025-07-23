#### TEST CASE MODULE
package TC_EDID_COMSignal1s_ValidRange;

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

use FuncLib_SYC_INTERFACE;
use FuncLib_EDR_Framework;
use LIFT_crash_simulation;
use LIFT_MDSRESULT;
use LIFT_can_access;
use LIFT_ProdDiag;
use FuncLib_TNT_SYC_INTERFACE;
use LIFT_evaluation;
use LIFT_equipment;
use GENERIC_DCOM;
use Data::Dumper;
use LIFT_labcar;
use LIFT_CD;
use LIFT_PD;
use LIFT_MLC;
use LIFT_CANoe;
use LIFT_flexray_access;
use LIFT_numerics;
use Readonly;
use FuncLib_CustLib_EDR_CNEDR;
use LIFT_CD_CAN;
use constant MILLISEC_TO_SECOND => 0.001;
use constant SECOND_TO_MILLISEC => 1000;
use constant SINE_CURVE_FREQUENCY_HZ => 0.2;
use constant SINE_CURVE_STEPWIDTH_MS => 100;
##################################
Readonly my $PI => 4 * atan2(1, 1);


##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_COMSignal1s_ValidRange

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Activate EDR functionality


I<B<Stimulation and Measurement>>

1. Create the <Condition> on <COMSignal1> with Different COM signal states

2. Wait for <Wait_time_msec> till the signal is transmitted on the COM

3. Inject a crash <Crashcode>

4. Read <EDID> corresponding to COM signal


I<B<Evaluation>>

1. -

2. -

3. -

4. COMSignal1Value corresponding to COMSignalState1 should be reported


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'EDID' => 
	SCALAR 'COMSignalState1' => 
	SCALAR 'ResultDB' => 
	SCALAR 'CrashTimeZero_1' => 
	HASH 'COMSignal1sAfterCrash' => 
	SCALAR 'ToleranceValue_abs' => 
	HASH 'Condition' => 
	SCALAR 'value_max' => 
	SCALAR 'value_min' => 
	SCALAR 'Protocol' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'Validate COM signal related EDIDs for Different COM signals with Valid Range Data on COM Signal'
	# Fill chapter 'TimeSynchronization' in EDR Mapping!
	EDID = '91'
	COMSignalState1 = '<Test Heading 2>'
	ResultDB = 'EDR'
	CrashTimeZero_1 = ''
	COMSignal1sAfterCrash = %()
	ToleranceValue_abs = 1 #optional parameter for tolerance, to be adapted according to EDID resolution. default if not given is 1
	# e.g. %('QbitSpeed' => 3)
	Condition = %()
	#Mode='hex' #This is optional parameter, if not defined default value=phys is taken
	value_max='500' #Max value for random delay counter, if not given default '500' is taken
	value_min='0' #Min value for random delay counter, if not given default '0' is taken
	Protocol = 'CAN' #'Flexray'
	# Protocol is an optional parameter with default value 'CAN' if not given. Other than CAN, TC supports 'Flexray'
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_COMSignalState1;
my $tcpar_ResultDB;
my $tcpar_CrashTimeZero_1;
my $tcpar_COMSignal1sAfterCrash;
my $tcpar_ToleranceValue_abs;
my $tcpar_Condition;
my $tcpar_value_max;
my $tcpar_value_min;
my $tcpar_Protocol;

my $tcpar_Crashcode1;
my $tcpar_Crashcode2;
my $tcpar_CrashTimeZero_2;
my $tcpar_COMSignal1;
my $tcpar_COMSignal2;
my $tcpar_COMSignal3;
my $tcpar_read_CHINAEDR;

my $tcpar_power1;
my $tcpar_CANCondition1;
my $tcpar_sensorCondition1;

my $tcpar_power2;
my $tcpar_CANCondition2;
my $tcpar_sensorCondition2;

my $tcpar_StepValue1_0;
my	$tcpar_StepValue1_1 ;
my	$tcpar_StepValue2_0 ;
my	$tcpar_StepValue2_1 ;
my	$tcpar_StepValue3_0;
my	$tcpar_StepValue3_1 ;

my 	$tcpar_DiagType;
my 	$tcpar_message;
my 	$tcpar_read_SUBARU;
my $tcpar_Tolerance_Value_abs;
my $tcpar_maxValue;
my $tcpar_minValue;
my $tcpar_COMSignal1_Condition;
my $tcpar_COMSignal2_Condition;
my $tcpar_Diag_type;
################ global parameter declaration ###################
#add any global variables here
my $EDR_Mapping;
my $CAN_Mapping;
my $record_handler;
my $msgTo;
my $msgDLC;
my $ta2;
my $ta3;
my $ChinaEDR_diagType;
my $faultCAN2; 
my $faultCAN3;
my $faultSensor2;
my $faultSensor3;
my $index;
my $tcpar_Mode;
my $tcpar_LastSpeedDataSample_EDID;
my $numberOfRecordsToEvaluate;
my $numberOfRecords;
my $tcpar_Crash_Time_Zero_ms;
my $crash_handler;
my $tcpar_Crashtype;
my $manipulatedCOMsignals;
my $dispatchTable ||= {
      SineWave => \&_createSineWaveOnCOM,
      RampUp   => \&_createRampUpOnCOM,
      RampDown   => \&_createRampDownOnCOM,
      SquareWave   => \&_createSquareWaveOnCOM,
	  StepUp   => \&_createStepUpOnCOM,
      StepDown   => \&_createStepDownOnCOM,
};
my ($actualRsp1, $actualRsp2, $actualRsp3);

my (
		$storedCrashLabels_aref,
		$response_value,
		$Expected_value,
		$ChinaEDR_diagType,
		$comSignalLabelMapping_href,
		$mappingEDR,
		$crashSettings,
		$crashDetails_href,
		$crashInfo_href,
		$ChinaEDR_diagType,
		$currentTestCaseIteration,
		$SubaruEDR_diagType,
		$res_key1,
		$edrNumberOfEventsToBeStored,
		$numberOfRecords,

		
		
		
	);
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_COMSignalState1 =  GEN_Read_mandatory_testcase_parameter( 'COMSignalState1' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_CrashTimeZero_1 =  GEN_Read_mandatory_testcase_parameter( 'CrashTimeZero_1' );
	$tcpar_COMSignal1sAfterCrash =  GEN_Read_mandatory_testcase_parameter( 'COMSignal1sAfterCrash' );
	$tcpar_ToleranceValue_abs =  GEN_Read_mandatory_testcase_parameter( 'ToleranceValue_abs' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_value_max =  GEN_Read_mandatory_testcase_parameter( 'value_max' );
	$tcpar_value_min =  GEN_Read_mandatory_testcase_parameter( 'value_min' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	
	$tcpar_Crashcode1=  GEN_Read_mandatory_testcase_parameter( 'Crashcode1' );
    # $tcpar_Crashcode2=  GEN_Read_mandatory_testcase_parameter( 'Crashcode2' );
	# $tcpar_CrashTimeZero_2=  GEN_Read_mandatory_testcase_parameter( 'CrashTimeZero_2' );
	$tcpar_COMSignal1=  GEN_Read_mandatory_testcase_parameter( 'COMSignal1' );
	$tcpar_COMSignal2=  GEN_Read_mandatory_testcase_parameter( 'COMSignal2' );
	$tcpar_COMSignal3=  GEN_Read_mandatory_testcase_parameter( 'COMSignal3' );
	$tcpar_read_CHINAEDR=  GEN_Read_mandatory_testcase_parameter( 'read_CHINAEDR' );
	$tcpar_power1 =  GEN_Read_mandatory_testcase_parameter( 'power1' );
	$tcpar_CANCondition1 =  GEN_Read_mandatory_testcase_parameter( 'CANCondition1' );
	$tcpar_sensorCondition1 =  GEN_Read_mandatory_testcase_parameter( 'sensorCondition1' );;
	# $tcpar_power2 =  GEN_Read_mandatory_testcase_parameter( 'power2' );
	$tcpar_CANCondition2 =  GEN_Read_mandatory_testcase_parameter( 'CANCondition2' );
	$tcpar_sensorCondition2 =  GEN_Read_mandatory_testcase_parameter( 'sensorCondition2' );
	$tcpar_StepValue1_0 =  S_read_optional_testcase_parameter( 'StepValue1_0' );
	$tcpar_StepValue1_1 =  S_read_optional_testcase_parameter( 'StepValue1_1' );
	$tcpar_StepValue2_0 =  S_read_optional_testcase_parameter( 'StepValue2_0' );
	$tcpar_StepValue2_1 =  S_read_optional_testcase_parameter( 'StepValue2_1' );
	$tcpar_StepValue3_0 =  S_read_optional_testcase_parameter( 'StepValue3_0' );
	$tcpar_StepValue3_1 =  S_read_optional_testcase_parameter( 'StepValue3_1' );
	$tcpar_message =  S_read_optional_testcase_parameter( 'message' );
	$tcpar_Tolerance_Value_abs = S_read_optional_testcase_parameter( 'ToleranceValue_abs' );
	
	$tcpar_COMSignal1_Condition=  GEN_Read_mandatory_testcase_parameter( 'COMSignal1_Condition' );
	$tcpar_COMSignal2_Condition=  GEN_Read_mandatory_testcase_parameter( 'COMSignal2_Condition' ); 
	$tcpar_Diag_type=  GEN_Read_mandatory_testcase_parameter( 'Diag_type' );
	return 1;
}

sub TC_initialization {
#####MAPPING########
	$EDR_Mapping = S_get_contents_of_hash( ['Mapping_EDR'] );
	$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	
	$msgTo = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_message}{'CANOE_DISABLE'};
	$msgDLC = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_message}{'CANOE_DLC'};
	
	$index = 0;
	$tcpar_Protocol = 'CAN';
	$tcpar_DiagType = 'ProdDiag';
	$ChinaEDR_diagType = 'CHINA_Payload';
	$tcpar_Mode='phys';
	$tcpar_Crash_Time_Zero_ms = 0;
	$numberOfRecords = 3;
	
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	#--------------------------------------------------------------
    # Initialize equipment
    #

	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
    CA_trace_start();
    GDCOM_init() ; # To fetch info for CD from mapping_diag
	
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


	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler()  || return;
	

	return 1;
}

sub TC_stimulation_and_measurement {
	my $currentVol = 12;

	my $dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number()."_COM_Signal_".find_signal_for_label() ;

	S_teststep("Set power to '$tcpar_power1' state", 'AUTO_NBR');
	_setPower($tcpar_power1);
	S_wait_ms(9000);
	
	S_teststep("Prepera CRASH '$tcpar_Crashcode1'", 'AUTO_NBR');
	Crash_Injection($tcpar_Crashcode1,$tcpar_CrashTimeZero_1);
	
	# S_user_action('ok');
	
	S_teststep("Set '$tcpar_COMSignal1 ' signal to '$tcpar_COMSignalState1'", 'AUTO_NBR');
	$dispatchTable -> {$tcpar_COMSignalState1} -> ();	
	
	S_teststep("Inject Crash '$tcpar_Crashcode1'", 'AUTO_NBR');
	CSI_TriggerCrash();
	
	S_w2rep("- Start sending message 'EventTrigger'");
	my $ID = '0x07';
	my $cycletime_ms = 0;
	my $payload_aref = [0x01];
	my $canvalue = CD_CAN_send_message($payload_aref, $ID, $cycletime_ms);
	S_wait_ms(17000);
	
	Prepertation();
	S_wait_ms(500);
	
	S_teststep("Read EDR record", 'AUTO_NBR');	#measurement 3
	
	_readAndStoreRecord($tcpar_Crashcode1, $tcpar_EDID);
	
	S_w2rep("\n*************************CRASH 2**********************************************************************************************************\n", 'Purple');
	S_w2rep("\n******************************************************************************************************************************************\n", 'Purple');
	# S_user_action("quanh signal");
	# S_teststep("Inject a Crash '$tcpar_Crashcode1' lan 2", 'AUTO_NBR');
	# Crash_Injection($tcpar_Crashcode1,$tcpar_CrashTimeZero_1);
	# S_user_action("quanh dang check ne");
	
	# _readAndStoreRecord($tcpar_Crashcode1, $tcpar_EDID);
	return 1;
}

sub TC_evaluation {

	S_w2rep('************** BEGIN EVALUATE FOR THE 1st TRIGGER  ************** ', 'Purple');
	# S_teststep_expected("COMSignalValue corresponding to $tcpar_COMSignalState1 should be reported", 'AUTO_NBR');			#evaluation 2
	# S_teststep_detected($tcpar_COMSignalState1, 'AUTO_NBR');
	# EDR_Eval_evaluate_EDID_Raw(1, $tcpar_EDID, '1st', '1st');
	if ($tcpar_COMSignal1_Condition eq 'NA')
	{
		S_w2rep('Evaluate in TC has 1 signal', 'Purple');
		EDR_Eval_evaluate_EDID_Raw(1, $tcpar_EDID, $tcpar_Crashcode1, $tcpar_Crashcode1);
	
	}
	else{
		S_w2rep('Evaluate in TC has more than 2 signals', 'Purple');
		EDR_Eval_evaluate_EDID_Raw_EM6_Quanhh(1, $tcpar_EDID, $tcpar_Crashcode1, $tcpar_Crashcode1);
	
	}
	S_w2rep('************** END EVALUATE FOR THE 1st TRIGGER   ************** ', 'Purple');

	return 1;
}

sub TC_finalization {

	S_w2rep("********** Sending request to stop tester present **********\n",'Blue');

	#Clearing crash recorder
	PD_ClearCrashRecorder();
	S_wait_ms(6000);
	
	S_w2rep("Clean up record ...");
	$record_handler -> DeleteAllRecords();
	
	#Erase Fault memory
	GDCOM_request ('31 01 30 00', '', 'relax');
    S_wait_ms(2000);
	
	LC_ECU_Off();
	S_wait_ms(8000);
	LC_ECU_On(13);
	S_wait_ms(6000);

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


sub Crash_Injection{

	my @CrashInput = @_;
	my $Crashcode = @CrashInput[0];
	my $CrashTimeZero = @CrashInput[1];

	S_teststep_2nd_level("Inject a Crash '$Crashcode'", 'AUTO_NBR');
	#--------------------------------------------------------------
    # GET CRASH DETAILS
    #    
	# Crash name or index and result DB from EDR mapping
    $crashDetails_href = $mappingEDR -> {'CRASHFILES'}{$Crashcode};
    unless(defined $crashDetails_href) {
        $crashDetails_href = {'RESULTDB' => $tcpar_ResultDB, 'CRASHNAME' => $Crashcode};
    }
	# Crash settings
	$crashSettings = CSI_GetCrashDataFromMDS($crashDetails_href);
	unless(defined $crashSettings) {
		S_set_error("Crash code $Crashcode not defined in given result DB. Test case will be aborted.");
		return 0;
	}
	
		
	# Crash code in World DB
	$crash_handler -> AddCrashSource( "CrashLabel" => $Crashcode,
	    								  "SourceLabel" => 'CrashCode_MDS', 
	                                      "OriginalSourceData" => $Crashcode );

    $crashInfo_href -> {"CrashCode_MDS"} = $Crashcode;

	# Name of Result DB
	my $resultDB = $crashDetails_href -> {"RESULTDB"};
	unless(defined $resultDB) {
		$resultDB = "DEFAULT";
	}

	# Result DB path
	my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$resultDB" ] );
	
	# Set environment settings for crash
	CSI_PrepareEnvironment($crashSettings, 'init_complete');
	S_wait_ms('TIMER_ECU_READY');
	#--------------------------------------------------------------
    # CRASH PREPARATION
    #
    S_w2rep("Prepare crash (download crash data)");
	# LC_ECU_Off();
	# S_wait_ms('TIMER_ECU_OFF');

	# Prepare crash
	my $crashDuration_ms = $crashSettings -> {'METADATA'} -> {'CRASHDURATION_MS'};
	# Crash duration
	# $crash_handler -> AddCrashSource( "CrashLabel" => $Crashcode,
	    							  # "SourceLabel" => 'CrashDuration', 
	                                  # "OriginalSourceData" => $crashDuration_ms,
									  # "SourceUnit" => 'ms'  );
	# my $a;
	# $a = Dumper($crash_handler->{SourceList});
	# S_w2rep("Dump sourceList truoc khi add $a");

	$crash_handler -> AddCrashSource( "CrashLabel" => $Crashcode,
	    							  "SourceLabel" => 'Crash_Time_Zero', 
	                                  "OriginalSourceData" => $CrashTimeZero,
									  "SourceUnit" => 'ms'  );
	# $a = Dumper($crash_handler->{SourceList});
	# S_w2rep("Dump sourceList truoc sau khi add $a");

											
	CSI_LoadCrashSensorData2Simulator( $crashSettings )unless $main::opt_offline;

	# Power ON the ECU
	# LC_ECU_On();
 	# S_wait_ms('TIMER_ECU_READY');
 	
    CSI_PrepareEnvironment( $crashSettings, 'before_crash_same_cycle','normal' );
    S_wait_ms(2000);
	
	# if ($Crashcode eq 'Single_EDR_Rollover_Inflatable')
	# {	
		# S_wait_ms(20000);
	# }
	# else
	# {
		# S_wait_ms(10000);
	# }
	
	
	return 1;
}

sub ReadAndStoreRecord{

	my @CrashInput = @_;
	my $Crashcode = @CrashInput[0];

	my $dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number()."_"."$Crashcode";

	$edrNumberOfEventsToBeStored = SYC_EDR_get_NumberOfEventsToBeStored();
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("'NumberOfEventsToBeStored' is not available in SYC - add or overwrite 'SYC_EDR_get_NumberOfEventsToBeStored' with Custlibrary Function");
        return;
    }

    PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');
	
	# if ( lc( $tcpar_read_NHTSAEDR) eq 'yes' ) {
		# S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored");
		# EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								# "CrashLabel" => $Crashcode,
								# "NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								# "StoragePath" => $dataStoragePath, 
								# "read_EDRType"=>'NHTSA')
	# }
	if (lc($tcpar_read_CHINAEDR) eq 'yes'){
		$edrNumberOfEventsToBeStored=3;
		S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored");
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" =>  $ChinaEDR_diagType,
								"CrashLabel" => $Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA');
	}
	
	if (lc($tcpar_read_SUBARU) eq 'yes'){
		$numberOfRecords=3;
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $SubaruEDR_diagType,
								"CrashLabel" => $tcpar_Crashtype,
								"NbrOfRecords" =>  $numberOfRecords,
								"StoragePath" => $dataStoragePath,
								"CrashInfo" => $crashInfo_href,
								"read_EDRType"=>'CHINA');
	
	}	
	
	return 1;


}

sub find_signal_for_label{
my $signal_for_label;
	if ($tcpar_COMSignal3 eq 'NA' && $tcpar_COMSignal2 eq 'NA') 
	{
		$signal_for_label = $tcpar_COMSignal1;
	}
	elsif ($tcpar_COMSignal3 eq 'NA') 
	{
		$signal_for_label = $tcpar_COMSignal2;
	}
	else
	{
		$signal_for_label = $tcpar_COMSignal3;
	}
	return $signal_for_label;
}

sub _readAndStoreRecord {
	my $name = shift;
	my $edid = shift;
	
	my $allSignalStatesDuringCrash_href;
	my $manipulatedCOMsignals_aref;
	
	my $signal_for_label = find_signal_for_label();
	
	($manipulatedCOMsignals -> {$signal_for_label}) = CA_read_can_signal($signal_for_label, 'phys');
	push(@{$manipulatedCOMsignals_aref}, $signal_for_label);
	S_w2rep("QUanhh:".$manipulatedCOMsignals->{$signal_for_label});
	my $Quanhh_dumper = Dumper($manipulatedCOMsignals_aref);
	S_w2rep( "QUanhh check dumper $Quanhh_dumper");
	
	my $dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number().$name.$signal_for_label;
	my ($edrNumberOfEventsToBeStored, $tcpar_DiagType, $ChinaEDR_diagType);
	
	$edrNumberOfEventsToBeStored = 3;
	$tcpar_DiagType = 'CHINA_Payload';
	# $tcpar_Diag_type = 'CHINA_Payload';
	
	$edrNumberOfEventsToBeStored = SYC_EDR_get_NumberOfEventsToBeStored();
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("'NumberOfEventsToBeStored' is not available in SYC - add or overwrite 'SYC_EDR_get_NumberOfEventsToBeStored' with Custlibrary Function");
        return;
    }

    PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');
	
	$edrNumberOfEventsToBeStored = 3;
	S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored");
	S_teststep_2nd_level("Read EDID '$edid' in the $name record ", 'AUTO_NBR', "EDID_$edid\_record_$name");
	EDR_ReadAndStoreAllRecords_Subaru ("DiagType" =>  $tcpar_Diag_type,
								"CrashLabel" => $name,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA');
							
	# Store CAN signal
	S_w2rep("Store $tcpar_Protocol Trace");
	my $fileName = "$dataStoragePath/LIFT_network_trace_$signal_for_label.asc";
	my $tracePath;
	$tracePath = CA_trace_store($fileName) if (lc($tcpar_Protocol) =~ m/can/i);
	$tracePath = FR_trace_store($fileName) if (lc($tcpar_Protocol) =~ m/flexray/i);
	GEN_printLink($tracePath);

	S_wait_ms(2000);

	# Restart measurement after storage
    CA_trace_start() if (lc($tcpar_Protocol) =~ m/can/i);
	# _setMessageState($tcpar_msg, $tcpar_msgState);
    FR_trace_start() if (lc($tcpar_Protocol) =~ m/flexray/i);

	my $com_trace_dataref;
	my $eventTrigger_dataref;

	unless($main::opt_offline) {
		S_w2rep("Get COM trace data reference for all manipulated COM signals");
		$eventTrigger_dataref = CA_trace_get_dataref($fileName, ['EventTrigger']);
		unless(defined $eventTrigger_dataref){
    		S_set_error("COM signal time zero could not be obtained from CAN trace (message 'EventTrigger').\n"
    		              ."- Check whether message is seen in CANoe trace.\n"
    		              ."- Check whether message is filtered out in logging block of CANoe.\n"
    		              ."- Check whether message is defined in CAN mapping\n"
                          ."- Check whether the TSG4 firmware is up to date (Minimum firmware version 17 required)");
    	   return;		    
		}
		$com_trace_dataref = CA_trace_get_dataref($fileName, $manipulatedCOMsignals_aref) if (lc($tcpar_Protocol) =~ m/can/i);
		$com_trace_dataref = FR_trace_get_dataref($fileName, $manipulatedCOMsignals_aref) if (lc($tcpar_Protocol) =~ m/flexray/i);
	}

	S_w2rep("Dump COM trace data reference for all manipulated COM signals for reuse");
	S_dump2pmFile ( "VariableToDump" => $com_trace_dataref,
					"VariableName" => "comTraceDataref",
					"PackageName" => "EDR_COM_Trace",
					"StoragePath" => $dataStoragePath);

	# Get COM time stamp at which service 2F is triggered
	my ($value_aref, $time_aref) = EVAL_get_values_and_times_over_time( $eventTrigger_dataref , "EventTrigger") unless($main::opt_offline);
	my $comSignalTimeZero = $time_aref -> [0];
	$comSignalTimeZero = 0 if($main::opt_offline);
	unless(defined $comSignalTimeZero){
		S_set_error("COM signal time zero could not be obtained from CAN trace (message 'EventTrigger').\n"
		              ."- Check whether message is seen in CANoe trace.\n"
		              ."- Check whether message is filtered out in logging block of CANoe.\n"
		              ."- Check whether message is defined in CAN mapping\n"
                      ."- Check whether the TSG4 firmware is up to date (Minimum firmware version 17 required)");
	   return;
	}
	S_w2rep("Event Trigger time stamp: $comSignalTimeZero seconds");

	S_w2rep("Store manipulated COM signals in crash handler", 'AUTO_NBR');
	my $edr_COMSignalValues_href;
	foreach my $signalLabel (keys %{$manipulatedCOMsignals})
	{
		S_w2rep("COM signal $signalLabel");

		my($COMSignalValues_aref, $signalTimeStamps_aref); 
		($COMSignalValues_aref, $signalTimeStamps_aref) = EVAL_get_values_and_times_over_time($com_trace_dataref, $signalLabel) unless ($main::opt_offline); 

		if($main::opt_offline){
			$COMSignalValues_aref = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0];
			$signalTimeStamps_aref = [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
		}			

		next if (not defined $COMSignalValues_aref or not defined $signalTimeStamps_aref);

		$crash_handler -> AddCrashSource ( "CrashLabel"  => $name,
											"SourceType"  => 'COM_Signal',
											"SourceLabel" => $signalLabel,
											"OriginalSourceName" => $signalLabel,
											"OriginalSourceData" => $COMSignalValues_aref,
											"SignalTimeStamps" => $signalTimeStamps_aref,
											"TraceTimeZero_ms" => $comSignalTimeZero * SECOND_TO_MILLISEC );

		$edr_COMSignalValues_href -> {$signalLabel} -> {'Data'} = $COMSignalValues_aref;
		$edr_COMSignalValues_href -> {$signalLabel} -> {'TimeStamps'} = $signalTimeStamps_aref;
		$edr_COMSignalValues_href -> {$signalLabel} -> {'ValueDuringCrash'}= $allSignalStatesDuringCrash_href -> {$signalLabel};
	}

	# S_dump2pmFile ("VariableToDump" => $edr_COMSignalValues_href,
		 # "VariableName" => "comSignalsDuringCrash",
		 # "PackageName" => "EDR_COM_Signal_Values_Crash",
		 # "StoragePath" => $dataStoragePath);
}

sub EDR_Eval_evaluate_EDID_Raw {
	my $recordNbr = shift;
	my $edid = shift;
	my $crashLabel = shift; #actual data
	my $expectedLable = shift; #expected data
	
#--------------------------------------------------------------
    # GET STORAGE ORDER
    #    
    my $storageOrder = EDR_getStorageOrder ();
    return unless(defined $storageOrder);

    if($storageOrder eq 'PhysicalOrder'){
       $storageOrder =  'MostRecentLast'; #same behavior as there is no overwriting
    }

	#--------------------------------------------------------------
    # GET EXPECTED COM SIGNAL VALUE
    #    
	S_w2log(1, "Get expected COM signal value '$tcpar_COMSignal1' in crash the $expectedLable trigeer");
	my $comSignalDataSamples;

	my $functionName = "EDR_COM_GetExpectedValue_$tcpar_COMSignal1";
	if(exists &$functionName) {
	   S_w2log( 4, "Call '$tcpar_COMSignal1' function to get expected COM signal data samples\n" );
 	   {
	        no strict 'refs'; #disable strict refs only for this section
	        $comSignalDataSamples = &$functionName($expectedLable);
	        return if not $comSignalDataSamples;
 	   }
		
	}
	else {
	# Quanhh
	# my $a = Dumper( $crash_handler->{SourceList}  );
	# S_w2rep("Quanhh checkDumper $a");
	    my $sourceData = $crash_handler -> GetSourceDataSamples("SourceLabel" => find_signal_for_label(), "CrashLabel" => $expectedLable); 
		
		$comSignalDataSamples = $sourceData -> {"DataSamples"};
	}
	
 	#--------------------------------------------------------------
    # GET CRASH TIME ZERO ON COM AND EDR
    #    
    my $comTraceTimeZero_ms = $crash_handler -> Get_COM_TraceTimeZero_ms(  "SourceLabel" => find_signal_for_label(), "CrashLabel" => $expectedLable );	
	
	# S_w2rep("Quanhh check comTraceTimeZero_ms = $comTraceTimeZero_ms");
	
	my @allCrashTimeZeros = split('_', $tcpar_Crash_Time_Zero_ms);
	my $numberOfIncidents = @allCrashTimeZeros;
	S_w2rep("Number of incidents: $numberOfIncidents");
	my $crashTimeZero_href;

    if($numberOfIncidents > $numberOfRecords){ #Extended event
        $numberOfRecordsToEvaluate = $numberOfRecords;
    }
    else {
        $numberOfRecordsToEvaluate = $numberOfIncidents;
    }
	
	S_w2rep("numberOfRecordsToEvaluate = $numberOfRecordsToEvaluate");

	foreach my $incidentNumber (1..$numberOfRecordsToEvaluate)
	{
		$crashTimeZero_href -> {"Record_$incidentNumber"} = $allCrashTimeZeros[$incidentNumber-1] if($storageOrder eq 'MostRecentLast');
		$crashTimeZero_href -> {"Record_$incidentNumber"} = $allCrashTimeZeros[$numberOfRecordsToEvaluate - $incidentNumber] if($storageOrder eq 'MostRecentFirst');		
	}

 	S_w2rep("Number of records to evaluate: $numberOfRecordsToEvaluate");
 	#--------------------------------------------------------------
    # VALIDATE REPORTED COM SIGNALS FOR ALL INCIDENTS / RECORDS
    #

	S_w2rep("Evaluate for buffer $recordNbr \n");
	$index = $index + 1;
	# S_teststep_expected_NOHTML("\n");
	# S_teststep_detected_NOHTML("\n");

	S_w2rep("---- Record $recordNbr ----");
	S_teststep_expected_NOHTML("---- Record $recordNbr ----");
	S_teststep_detected_NOHTML("---- Record $recordNbr ----");
	# my $thisCrashTimeZero = $crashTimeZero_href -> {"Record_$recordNbr"};
	my $thisCrashTimeZero = $tcpar_CrashTimeZero_1;

	# Synchronize T0
	S_w2rep("Crash time zero given for this crash is: $thisCrashTimeZero");
	S_w2rep("Synchronize given T0 ($thisCrashTimeZero) for EDID $tcpar_EDID.");
	if(defined $tcpar_LastSpeedDataSample_EDID)
	{
		S_set_warning("Usage of parameter 'LastSpeedDataSample_EDID' outdated. Fill 'TimeSynchronization' section in EDR mapping instead!");

		my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crashLabel, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_LastSpeedDataSample_EDID );
		unless(defined $edidData) {
			S_w2rep("No EDID data found for crash $crashLabel, record $recordNbr. EDID cannot not be evaluated.", 'purple');
			return;
		}
		$thisCrashTimeZero = $thisCrashTimeZero - $edidData -> {DataValue} * MILLISEC_TO_SECOND;
	}
	else{
		$thisCrashTimeZero = EDR_synchronize_T0_for_EDID($tcpar_EDID, $thisCrashTimeZero,		    	
														 $crashLabel, $recordNbr);
	}

	S_w2rep("Synchronized T0: $thisCrashTimeZero ms", 'NO_AUTO_NBR');

	#-----------------------------------------------------------------------
	# Get EDID data
	#-----------------------------------------------------------------------
	S_w2rep("Read EDID '$tcpar_EDID' corresponding to COM signal $tcpar_COMSignal1 in Record $recordNbr", 'Blue');			#measurement 1

	# Eval start and end time
	S_w2rep("Get EDID recording start and end time", 'purple');
	my $recordingStartTime_ms = $record_handler -> GetRecStartTimeMillisecEDID("CrashLabel" => $crashLabel, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID );
	my $recordingEndTime_ms = $record_handler -> GetRecEndTimeMillisecEDID("CrashLabel" => $crashLabel, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID );

	# EDID value
	S_w2rep("Get decoded EDID value");
	my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crashLabel, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID );
	unless(defined $edidData) {
		S_w2rep("No EDID data found for crash $crashLabel, record $recordNbr. EDID cannot not be evaluated.", 'purple');
		return;
	}
	
	
	# TODO: EDID has only one Data Sample, evaluate directly with COM signal value at time zero - try out in Ford
	if(ref($edidData -> {"DataValue"}) ne 'ARRAY'){
		S_w2rep("EDID is static, i.e. there is only one data sample to validate");
		S_w2rep("Recording start time: $recordingStartTime_ms ms");
		my $detectedEDIDvalue = $edidData -> {"DataValue"};
		my $comValueAtRecStart;
		my $crashTimeZeroOnCOM_sec = ($comTraceTimeZero_ms + $thisCrashTimeZero + $recordingStartTime_ms) * MILLISEC_TO_SECOND;
		S_w2rep("EDR recording start time: $crashTimeZeroOnCOM_sec sec");
		foreach my $comTimeStamp (sort {$a <=> $b} keys %{$comSignalDataSamples})
		{
			next if($comTimeStamp < $crashTimeZeroOnCOM_sec);
			$comValueAtRecStart = $comSignalDataSamples -> {$comTimeStamp};
			S_w2rep("COM value at recording start time of EDID is $comValueAtRecStart");
			last;
		}
		S_teststep_expected("Expected value for EDID $tcpar_EDID: $comValueAtRecStart", "EDID_$edid\_record_$crashLabel");
		S_teststep_detected("Detected value for EDID $tcpar_EDID: $detectedEDIDvalue", "EDID_$edid\_record_$crashLabel");
		EVAL_evaluate_value( "EDID_$tcpar_EDID\_$tcpar_COMSignal1" , $detectedEDIDvalue, '==', $comValueAtRecStart, 0.5 , 'absolute');
		return;
	}
	
	# Ringbuffer COM signal -> more than one data sample!
	my $edidDataSamples = $edidData -> {"DataSamples"};
	
	S_w2rep('----------edidDataSamples------');
	while (my ($k,$v)=each %$edidDataSamples) {S_w2rep("key $k => value $v\n")}
	
	S_w2rep('----------------');
	unless(defined $edidDataSamples) {
		S_set_error("No EDID data samples could be obtained for EDID $tcpar_EDID in record $recordNbr!", 110);
		return;
	}

	# EDID Sample Rate
	S_w2rep("Get EDID sample rate in Hz");
	my $edidSampleRate_Hz = $record_handler -> Get_EDID_SampleRateHz("CrashLabel" => $crashLabel, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID );
	my $tolerance_sec;
	if($edidSampleRate_Hz > 0) {
		$tolerance_sec = 1 / $edidSampleRate_Hz;
	}
	else {
		S_set_error("No EDID sample rate greater than zero given - check sample rate in EDR mapping", 110);
		return;
	}

	#-----------------------------------------------------------------------
	# Compare expected and detected
	#-----------------------------------------------------------------------
	# # S_teststep("Start evaluation of '$tcpar_EDID' corresponding to COM signal $tcpar_COMSignal1 in Record $recordNbr, crash $crashLabel", 'AUTO_NBR');
	# S_teststep("Quanhh check  COM_Signal_DataSamples: $comSignalDataSamples,
									 # Rec_Start_Time_ms $recordingStartTime_ms, 
									 # Rec_End_Time_ms $recordingEndTime_ms,
									 # Crash_TimeZero_s $thisCrashTimeZero * MILLISEC_TO_SECOND,
									 # COM_trace_TimeZero_ms $comTraceTimeZero_ms,
									 # EDID_ID $tcpar_EDID,
									 # Absolute_Tolerance_Time_sec $tolerance_sec,
									 # Absolute_Tolerance_Value $tcpar_Tolerance_Value_abs,
									 # DataUnit $edidData ,
									 # CompareTitle COM_Signal_$tcpar_COMSignal1\_Crash_$crashLabel\_Record_$recordNbr);", 'AUTO_NBR');
	
	my ($firstVerdict, $busData_href) = EDR_Eval_Ringbuffer_COMsignal_NOVERDICT(
	# my ($firstVerdict, $busData_href) = EDR_Eval_Ringbuffer_COMsignal_Quanhh	( 
																					 "EDID_DataSamples" => $edidDataSamples,
																					 "COM_Signal_DataSamples" => $comSignalDataSamples,
																					 "Rec_Start_Time_ms" => $recordingStartTime_ms, 
																					 "Rec_End_Time_ms" => $recordingEndTime_ms,
																					 "Crash_TimeZero_s" => $thisCrashTimeZero * MILLISEC_TO_SECOND,
																					 "COM_trace_TimeZero_ms" => $comTraceTimeZero_ms,
																					 "EDID_ID" => $tcpar_EDID,
																					 "Absolute_Tolerance_Time_sec" => $tolerance_sec,
																					 "Absolute_Tolerance_Value" => $tcpar_Tolerance_Value_abs,
																					 "DataUnit" => $edidData -> {"ValueUnit"},
																					 "CompareTitle" => "COM_Signal_$tcpar_COMSignal1\_Crash_$crashLabel\_Record_$recordNbr"
																				 );						

	S_w2rep("First verdict: $firstVerdict");

	my ($thisEdidSynchronizationEdid, $thisEdidSyncType);
	if(not defined $tcpar_LastSpeedDataSample_EDID){
		($thisEdidSynchronizationEdid, $thisEdidSyncType) = EDR_get_synchronization_EDID ($tcpar_EDID);
	}
	else{
		$thisEdidSynchronizationEdid = $tcpar_LastSpeedDataSample_EDID;
	}

	my $secondVerdict;
	my $shiftTimesec = 0;
	if($firstVerdict eq 'VERDICT_FAIL' and not defined $thisEdidSynchronizationEdid ){
		
		S_w2rep("No synchronization EDID given - shift T0 by half sample time and validate again", 'purple');
		my $sampleRate = $record_handler -> Get_EDID_SampleRateHz(  "EDIDnr" => $tcpar_EDID, 
																	"RecordNumber" => $recordNbr, 
																	"CrashLabel" => $crashLabel);
		unless(defined $sampleRate){
			S_set_error("No sample rate defined for EDID. Signal can not be shifted for validation. Abort validation.");
			return;
		}
		$shiftTimesec = 1/$sampleRate;	        	

		S_w2rep("Start validation with T0 shift of $shiftTimesec seconds", 'purple');
		my $busData_href;
		($secondVerdict, $busData_href) = EDR_Eval_Ringbuffer_COMsignal_NOVERDICT( "EDID_DataSamples" => $edidDataSamples, 
										 "COM_Signal_DataSamples" => $comSignalDataSamples,
										 "Rec_Start_Time_ms" => $recordingStartTime_ms, 
										 "Rec_End_Time_ms" => $recordingEndTime_ms,
										 "Crash_TimeZero_s" => $thisCrashTimeZero * MILLISEC_TO_SECOND - $shiftTimesec,
										 "COM_trace_TimeZero_ms" => $comTraceTimeZero_ms,
										 "EDID_ID" => $tcpar_EDID,
										 "Absolute_Tolerance_Time_sec" => $tolerance_sec,
										 "Absolute_Tolerance_Value" => $tcpar_Tolerance_Value_abs,
										 "DataUnit" => $edidData -> {"ValueUnit"},
										 "CompareTitle" => "COM_Signal_$tcpar_COMSignal1\_Crash_$crashLabel\_Record_$recordNbr\_shifted");                     

		 S_w2rep("Second verdict (shifted): $secondVerdict");      	
	}

	#-----------------------------------------------------------------------
	# Set verdict and report result
	#-----------------------------------------------------------------------
	my $verdict;
	if(($firstVerdict eq 'VERDICT_PASS') or ($secondVerdict eq 'VERDICT_PASS')) {
		$verdict = 'VERDICT_PASS';
	}
	else {
		$verdict = 'VERDICT_FAIL';
	}
	
	S_set_verdict($verdict);

	S_teststep_expected("'EDID $tcpar_EDID' corresponding to COM signal '$tcpar_COMSignal1' should be reported as in CAN trace", "EDID_$edid\_record_$crashLabel");			#evaluation 1
	S_teststep_detected("Detected EDID COM signal state: equal to COM signal in trace", "EDID_$edid\_record_$crashLabel") if ($verdict eq 'VERDICT_PASS');
	S_teststep_detected("Detected EDID COM signal state: not equal to COM signal in trace", "EDID_$edid\_record_$crashLabel") if ($verdict eq 'VERDICT_FAIL');
}

sub _createStepUpOnCOM {
	S_w2rep('_createStepUpOnCOM');
	
	S_teststep("Wait for 2 sec before transmitting step on the COM bus", 'AUTO_NBR');
	# my $recordStructure_href = EDR_ReadEDR_Record_structure_info_from_mapping('CHINA_Payload');
	my $recordStructure_href = EDR_ReadEDR_Record_structure_info_from_mapping($tcpar_DiagType);
	my $recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecStartTimeMillisec'};
	$recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'StartTime_ms'} if (not defined $recordingStartTime_ms);
	my $recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecEndTimeMillisec'};
	$recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'EndTime_ms'} if(not defined $recordingEndTime_ms);
	my $total_recording_time= abs ($recordingStartTime_ms)+ abs ($recordingEndTime_ms);
	$total_recording_time = 5000 unless($total_recording_time);
	S_w2rep("_createStepUpOnCOM - total_recording_time = $total_recording_time ");
	my $duration_ms = $total_recording_time;
	##############Quanhh check signal 
	if ($tcpar_COMSignal1_Condition eq 'NA' && $tcpar_COMSignal2_Condition eq 'NA')
	{
		S_w2rep(' TC has 1 signal', 'Purple');	
		unless(defined $tcpar_StepValue1_0 and defined $tcpar_StepValue1_1) 
			{
				S_set_error("Square can not be performed due to missing parameters StepValue1 and StepValue2 -> stimulation aborted");
				return;
			}
			
			COM_stepOrSquareSignal_EM6($tcpar_COMSignal1, $tcpar_StepValue1_0, $duration_ms, $tcpar_StepValue1_1, $tcpar_Protocol, undef, undef);
			my $waitTimeUntilCrash = $total_recording_time / 2;
			S_teststep_2nd_level("Wait $waitTimeUntilCrash ms before injecting crash.", 'AUTO_NBR');
			S_wait_ms($waitTimeUntilCrash);
			# S_wait_ms(1000);
	}
	else
	{ #### 3 signal, signal1 va signal 2 giu nguyen.
		S_w2rep('Evaluate in TC has more than 2 signals', 'Purple');
		S_teststep("Set $tcpar_COMSignal1_Condition ");
		CA_set_EnvVar_value( '_Env__VDC328_IND_VDC_OFF', $tcpar_COMSignal1_Condition, 'phys' );
		CA_set_EnvVar_value( '_Env__VDC328_STATE_ACTIVATE_VDC', $tcpar_COMSignal2_Condition, 'phys' );
		
		unless(defined $tcpar_StepValue2_0 and defined $tcpar_StepValue2_1) 
		{
			S_set_error("Square can not be performed due to missing parameters StepValue1 and StepValue2 -> stimulation aborted");
			return;
		}
		
		COM_stepOrSquareSignal_EM6($tcpar_COMSignal3, $tcpar_StepValue3_0, $duration_ms, $tcpar_StepValue3_1, $tcpar_Protocol, undef, undef);
		my $waitTimeUntilCrash = $total_recording_time / 2;
		S_teststep_2nd_level("Wait $waitTimeUntilCrash ms before injecting crash.", 'AUTO_NBR');
		S_wait_ms($waitTimeUntilCrash);
	}
	

	# unless(defined $tcpar_StepValue1_0 and defined $tcpar_StepValue1_1) {
		# S_set_error("StepUp can not be performed due to missing parameters StepValue1 and StepValue2 -> stimulation aborted");
		# return;
	# }
	# COM_stepOrSquareSignal_EM6($tcpar_COMSignal1, $tcpar_StepValue1_0, $duration_ms, $tcpar_StepValue1_1);
	# my $waitTimeUntilCrash = $total_recording_time / 2;
	# S_teststep_2nd_level("Wait $waitTimeUntilCrash ms before trigger 2F service.", 'AUTO_NBR');
	# S_wait_ms($waitTimeUntilCrash);

	return 1;
}

sub _createStepDownOnCOM {
	S_w2rep('_createStepDownOnCOM');
	
	S_teststep("Wait for 2 sec before transmitting step on the COM bus", 'AUTO_NBR');
	# my $recordStructure_href = EDR_ReadEDR_Record_structure_info_from_mapping('CHINA_Payload');
	my $recordStructure_href = EDR_ReadEDR_Record_structure_info_from_mapping($tcpar_DiagType);
	my $recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecStartTimeMillisec'};
	$recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'StartTime_ms'} if (not defined $recordingStartTime_ms);
	my $recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecEndTimeMillisec'};
	$recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'EndTime_ms'} if(not defined $recordingEndTime_ms);
	my $total_recording_time= abs ($recordingStartTime_ms)+ abs ($recordingEndTime_ms);
	$total_recording_time = 5000 unless($total_recording_time);
	S_w2rep("_createStepDownOnCOM - total_recording_time = $total_recording_time ");
	
	my $duration_ms = $total_recording_time;
	unless(defined $tcpar_StepValue1_0 and defined $tcpar_StepValue1_1) {
		S_set_error("StepUp can not be performed due to missing parameters StepValue1 and StepValue2 -> stimulation aborted");
		return;
	}
	COM_stepOrSquareSignal_Nissan($tcpar_COMSignal1, $tcpar_StepValue1_1, $duration_ms, $tcpar_StepValue1_0);
	my $waitTimeUntilCrash = $total_recording_time / 2;
	S_teststep_2nd_level("Wait $waitTimeUntilCrash ms before trigger 2F service.", 'AUTO_NBR');
	S_wait_ms($waitTimeUntilCrash);

	return 1;
}

sub _getSineCurveValues{
    my $amplitude = shift;
    my $offset = shift;
    my $frequency_Hz = shift;
    my $stepWidth_ms = shift;
    my $numberOfPeriods = shift;
    
    my $numberOfPoints = int( $numberOfPeriods / $frequency_Hz / $stepWidth_ms *1000 +1.5);
    
    my @curvePoints;
    foreach my $index ( 0 .. $numberOfPoints - 1 ){
        my $x = $index * $stepWidth_ms / 1000 *2 * $PI;
        my $y = $amplitude * sin($frequency_Hz * $x ) + $offset;
        push(@curvePoints, $y);
    }
    
    return \@curvePoints;
}

sub _getRangeValues {
	my $dataStartFromByteIndex = 4 if ($tcpar_DiagType  eq 'ProdDiag');
	$dataStartFromByteIndex = 0 if ($tcpar_DiagType  eq 'AKLV');
	my $recordStructure_href;
	my $rangeOfMinMax;
	# if (defined $tcpar_Diag_type){
	if ( $tcpar_Diag_type eq 'CHINA_Payload') {
		$recordStructure_href = EDR_ReadCHINAEDR_Record_structure_info_from_mapping();
	}
	else {
		$recordStructure_href = EDR_ReadSUBARUEDR_Record_structure_info_from_mapping();			
	}
				
	$rangeOfMinMax->{'Range_Min'}=	$recordStructure_href -> {'EDIDS'}->{$tcpar_EDID}->{'Range_Min'};
	$rangeOfMinMax->{'Range_Max'}=	$recordStructure_href -> {'EDIDS'}->{$tcpar_EDID}->{'Range_Max'};
	
	return $rangeOfMinMax;
}

sub _createRampUpOnCOM {

	S_w2rep("Ramp up signal $tcpar_COMSignal1");

	my $rangeOfMinMax= _getRangeValues();
	
	my $range_Min =  $rangeOfMinMax -> {'Range_Min'};
	$tcpar_minValue=$range_Min;
	S_w2rep("Range_Min for EDID: $range_Min");
	
	my $range_Max =  $rangeOfMinMax -> {'Range_Max'};
	S_w2rep("Range_Max for EDID: $range_Max");
	$tcpar_maxValue=$range_Max;
	
	my $signalInfo = COM_fetchSignalInfo($tcpar_COMSignal1, $tcpar_Protocol);
	unless(defined $tcpar_minValue or $range_Min eq 'NotSpecified') {
		my $minValue = $signalInfo->{'DataValueTable'}->{'Min_Value'};
		$tcpar_minValue=$minValue;
	}

	unless(defined $tcpar_maxValue or $range_Max eq 'NotSpecified') {
		my $maxValue = $signalInfo->{'DataValueTable'}->{'Max_Value'};
		$tcpar_maxValue=$maxValue;
	}
	
	
	S_w2rep("Min value: $tcpar_minValue, max value: $tcpar_maxValue");
	my $recordStructure_href = EDR_ReadEDR_Record_structure_info_from_mapping($tcpar_DiagType);
	my $recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecStartTimeMillisec'};
	$recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'StartTime_ms'} if (not defined $recordingStartTime_ms);
	my $recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecEndTimeMillisec'};
	$recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'EndTime_ms'} if(not defined $recordingEndTime_ms);
	my $total_recording_time= abs ($recordingStartTime_ms)+ abs ($recordingEndTime_ms);
	$total_recording_time = 5000 unless($total_recording_time);

	my $nbrOfValues = $total_recording_time / 250; # -> 20 values for a recording time of 5sec
	S_w2rep("Number of values in Ramp = $nbrOfValues (recording time: $total_recording_time ms");
	COM_rampUpSignal( $tcpar_COMSignal1, 250 , $nbrOfValues , $tcpar_minValue, $tcpar_maxValue, $tcpar_Protocol);

	return 1;
}

sub _createRampDownOnCOM {
	S_w2rep("Ramp down signal $tcpar_COMSignal1");
	my $rangeOfMinMax= _getRangeValues();
	
	my $range_Min =  $rangeOfMinMax -> {'Range_Min'};
	$tcpar_minValue=$range_Min;
	S_w2rep("Range_Min for EDID: $range_Min");
	
	my $range_Max =  $rangeOfMinMax -> {'Range_Max'};
	S_w2rep("Range_Max for EDID: $range_Max");
	$tcpar_maxValue=$range_Max;
	
	my $signalInfo = COM_fetchSignalInfo($tcpar_COMSignal1, $tcpar_Protocol);
	unless(defined $tcpar_minValue or $range_Min eq 'NotSpecified') {
		my $minValue = $signalInfo->{'DataValueTable'}->{'Min_Value'};
		$tcpar_minValue=$minValue;
	}

	unless(defined $tcpar_maxValue or $range_Max eq 'NotSpecified') {
		my $maxValue = $signalInfo->{'DataValueTable'}->{'Max_Value'};
		$tcpar_maxValue=$maxValue;
	}
	
	
	S_w2rep("Min value: $tcpar_minValue, max value: $tcpar_maxValue");
	my $recordStructure_href = EDR_ReadEDR_Record_structure_info_from_mapping($tcpar_DiagType);
	
	my $recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecStartTimeMillisec'};
	$recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'StartTime_ms'} if (not defined $recordingStartTime_ms);
	my $recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecEndTimeMillisec'};
	$recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'EndTime_ms'} if(not defined $recordingEndTime_ms);
	my $total_recording_time= abs ($recordingStartTime_ms)+ abs ($recordingEndTime_ms);
	$total_recording_time = 5000 unless($total_recording_time);

	my $nbrOfValues = $total_recording_time / 250; # -> 20 values for a recording time of 5sec
	S_w2rep("Number of values in Ramp = $nbrOfValues (recording time: $total_recording_time ms");
	COM_rampDownSignal( $tcpar_COMSignal1, 250 , $nbrOfValues , $tcpar_minValue, $tcpar_maxValue, $tcpar_Protocol);
	
	return 1;
}

sub _createSineWaveOnCOM{
	my %signal_to_EnvVar	= 
	(
		'VDC139_4_4_ACTIVATE_ABS'=>'_Env__VDC139_ACTIVATE_ABS',
		'VDC139_3_7_FAIL_ABS_SYS'=>'_Env__VDC139_FAIL_ABS_SYS',
		'VDC328_4_0_IND_VDC_OFF'=>'_Env__VDC328_IND_VDC_OFF',
		'VDC328_4_1_STATE_ACTIVATE_VDC'=>'_Env__VDC328_STATE_ACTIVATE_VDC',
		'VDC328_3_2_IND_WARN_VDC'=>'_Env__VDC328_IND_WARN_VDC',
		
		'VDC139_4_2_BRAKELAMPSW'=>'_Env__VDC139_BRAKELAMPSW',
		'MET390_6_0_SEATBELT_DRVR'=>'_Env__MET390_SEATBELT_DRVR',
		'TCU048_3_0_IND_SHIFT_POS'=>'_Env__TCU048_IND_SHIFT_POS',
		'MET390_6_1_SEATBELT_PASS'=>'_Env__MET390_SEATBELT_PASS',
		
		'VDC139_2_0_SPD_WHEEL_AVE'=>'_Env__VDC139_SPD_WHEEL_AVE',
		'VDC138_2_0_STEER_ANGLE'=>'_Env__VDC138_STEER_ANGLE',
		'EGI040_4_0_RATIO_ACCEL'=>'_Env__EGI040_RATIO_ACCEL',
		'BIU660_3_0_COUNT_TRIP'=>'_Env__BIU660_COUNT_TRIP',
		'HEV377_2_0_MOTOR_RPM'=>'_Env__HEV377_MOTOR_RPM'
		
		
	);	
	
	S_w2rep("_createSineWaveOnCOM  $tcpar_COMSignal1");
	my $range_href = _getRangeValues();
	
	my $range_Min = $range_href -> {'Range_Min'};
	my $minValue=$range_Min;
	S_w2rep("Range_Min for EDID: $minValue");
	
	my $range_Max = $range_href -> {'Range_Max'};
	my $maxValue=$range_Max;
	S_w2rep("Range_Max for EDID: $maxValue");
	
	my $signalInfo = COM_fetchSignalInfo($tcpar_COMSignal1, $tcpar_Protocol);
	if (not defined $minValue or $minValue eq 'NotSpecified'){
		$minValue = $signalInfo->{'DataValueTable'}->{'Min_Value'};
		unless(defined $minValue) {
			S_set_error("No 'Min_Value' defined in 'DataValueTable' in COM mapping for signal $tcpar_COMSignal1! Or No min value available in Mapping EDR.No sine wave can be generated, function will be aborted!", 110);
			return;
		}
		S_w2rep("Min value: $minValue");
	}
	
	if(not defined $maxValue or $maxValue eq 'NotSpecified'){
		$maxValue = $signalInfo->{'DataValueTable'}->{'Max_Value'};
		unless(defined $maxValue) {
			S_set_error("No 'Max_Value' defined in 'DataValueTable' in COM mapping for signal $tcpar_COMSignal1! Or No min value available in Mapping EDR. No sine wave can be generated, function will be aborted!", 110);
			return;
		}
		S_w2rep(" Max value: $maxValue");
	}
	
	my $absolute_max=abs $maxValue;
	my $absolute_min=abs $minValue;
	my $amplitude = ($maxValue - $minValue) / 2; 
	S_w2rep (" absolute_max=$absolute_max");
	S_w2rep (" absolute_min=$absolute_min");
	S_w2rep (" Amplitude =$amplitude");
	my $offset = $amplitude + $minValue;
	S_w2rep("Offset: $offset");
	
	S_w2rep("Get EDID recording start and end time");
	
    my $recordStructure_href = EDR_ReadEDR_Record_structure_info_from_mapping($tcpar_DiagType);
	my $recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecStartTimeMillisec'};
	$recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'StartTime_ms'} if (not defined $recordingStartTime_ms);
	my $recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecEndTimeMillisec'};
	$recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'EndTime_ms'} if(not defined $recordingEndTime_ms);
	my $total_recording_time= abs ($recordingStartTime_ms)+ abs ($recordingEndTime_ms);
	$total_recording_time = 5000 unless($total_recording_time);
	
	my $SINE_CURVE_NUMBER_OF_PERIODS= 1 if ($total_recording_time<=5000);
	$SINE_CURVE_NUMBER_OF_PERIODS= 3 if ($total_recording_time>5000 and $total_recording_time<=10000);
	$SINE_CURVE_NUMBER_OF_PERIODS= 6 if ($total_recording_time>10000 and $total_recording_time<=15000);
	$SINE_CURVE_NUMBER_OF_PERIODS= 9 if ($total_recording_time>15000 and $total_recording_time<=20000);
	
	S_w2rep("SINE_CURVE_NUMBER_OF_PERIODS=$SINE_CURVE_NUMBER_OF_PERIODS");
	
	my $curvePoints_aref = _getSineCurveValues($amplitude, $offset, SINE_CURVE_FREQUENCY_HZ, SINE_CURVE_STEPWIDTH_MS, $SINE_CURVE_NUMBER_OF_PERIODS);

	unless(defined $curvePoints_aref) {
		S_set_error("Curve points for sine wave could not be created, function will be aborted. Check whether Min_Value and Max_Value given for $tcpar_COMSignal1 in COM mapping are valid", 110);
		return;
	}

	S_wait_ms(SINE_CURVE_STEPWIDTH_MS);		
	foreach my $physicalValue (@{$curvePoints_aref})
	{
		S_w2log(3, "Set $tcpar_COMSignal1 to $physicalValue");
		my $valueSet;
		$valueSet = CA_set_EnvVar_value ( $signal_to_EnvVar{$tcpar_COMSignal1}, $physicalValue);
		# if ($tcpar_COMSignal1 eq 'VDC139_2_0_SPD_WHEEL_AVE')
		# {
			# $valueSet = CA_set_EnvVar_value ( $signal_to_EnvVar{$tcpar_COMSignal1}, $physicalValue);
		# }
		# elsif ($tcpar_COMSignal1 eq 'VDC138_2_0_STEER_ANGLE')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__VDC138_STEER_ANGLE', $physicalValue);
		# }
		# elsif ($tcpar_COMSignal1 eq 'EGI040_4_0_RATIO_ACCEL')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__EGI040_RATIO_ACCEL', $physicalValue);
		# }
		# elsif ($tcpar_COMSignal1 eq 'VDC139_4_2_BRAKELAMPSW')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__VDC139_4_2_BRAKELAMPSW', $physicalValue);
		# }
		# elsif ($tcpar_COMSignal1 eq 'VDC139_4_4_ACTIVATE_ABS')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__VDC139_4_4_ACTIVATE_ABS', $physicalValue);
		# }
		
		# elsif ($tcpar_COMSignal1 eq 'VDC328_4_0_IND_VDC_OFF')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__VDC328_4_0_IND_VDC_OFF', $physicalValue);
		# }
		# elsif ($tcpar_COMSignal1 eq 'VDC328_4_1_STATE_ACTIVATE_VDC')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__VDC328_4_1_STATE_ACTIVATE_VDC', $physicalValue);
		# }
		# elsif ($tcpar_COMSignal1 eq 'MET390_6_0_SEATBELT_DRVR')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__MET390_6_0_SEATBELT_DRVR', $physicalValue);
		# }
		# elsif ($tcpar_COMSignal1 eq 'MET390_6_1_SEATBELT_PASS')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__MET390_6_1_SEATBELT_PASS', $physicalValue);
		# }
		# elsif ($tcpar_COMSignal1 eq 'BIU660_3_0_COUNT_TRIP')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__BIU660_3_0_COUNT_TRIP', $physicalValue);
		# }
		# elsif ($tcpar_COMSignal1 eq 'HEV377_2_0_MOTOR_RPM')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__HEV377_MOTOR_RPM', $physicalValue);
		# }
		
		# elsif ($tcpar_COMSignal1 eq 'TCU048_3_0_IND_SHIFT_POS')
		# {
			# $valueSet = CA_set_EnvVar_value ( '_Env__TCU048_3_0_IND_SHIFT_POS', $physicalValue);
		# }
		
		
		
		# $valueSet = CA_write_can_signal ( $tcpar_COMSignal1, $physicalValue, 'phys' ) if (lc($tcpar_Protocol) =~ m/can/i);
        $valueSet = FR_write_flxr_signal ( $tcpar_COMSignal1, $physicalValue, $tcpar_Mode ) if (lc($tcpar_Protocol) =~ m/flexray/i);
		unless(defined $valueSet) {		
			S_set_warning("Setting Signal $tcpar_COMSignal1 to '$physicalValue' was not successful. Go to next signal value.");	
		}
		S_wait_ms(SINE_CURVE_STEPWIDTH_MS);
	}
	
	return 1;
}

sub _createSquareWaveOnCOM {
	S_teststep("Create square wave for EDID $tcpar_EDID", 'AUTO_NBR');
	my $recordStructure_href = EDR_ReadEDR_Record_structure_info_from_mapping($tcpar_DiagType);
	my $recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecStartTimeMillisec'};
	$recordingStartTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'StartTime_ms'} if (not defined $recordingStartTime_ms);
	my $recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'RecEndTimeMillisec'};
	$recordingEndTime_ms = $recordStructure_href -> {'EDIDS'}{$tcpar_EDID}{'EndTime_ms'} if(not defined $recordingEndTime_ms);
	my $total_recording_time= abs ($recordingStartTime_ms)+ abs ($recordingEndTime_ms);
	$total_recording_time = 5000 unless($total_recording_time);
	S_w2rep("_createSquareWaveOnCOM - total_recording_time = $total_recording_time ");
	
	my $duration_ms = $total_recording_time;
	my $squareDuration_ms = 600;
	
	# #####Check SIgnal CONDITION 
	
	if ($tcpar_COMSignal1_Condition eq 'NA')
	{
		S_w2rep('Evaluate in TC has 1 signal', 'Purple');
		unless(defined $tcpar_StepValue1_0 and defined $tcpar_StepValue1_1) 
			{
				S_set_error("Square can not be performed due to missing parameters StepValue1 and StepValue2 -> stimulation aborted");
				return;
			}
			
			COM_stepOrSquareSignal_EM6($tcpar_COMSignal1, $tcpar_StepValue1_0, $duration_ms, $tcpar_StepValue1_1, $tcpar_Protocol, undef, $squareDuration_ms, 5);
			my $waitTimeUntilCrash = $total_recording_time / 2;
			S_teststep_2nd_level("Wait $waitTimeUntilCrash ms before injecting crash.", 'AUTO_NBR');
	}
	else { #### 2 signal, signal1 giu nguyen.
		S_w2rep('Evaluate in TC has more than 2 signals', 'Purple');
		S_teststep("Set VDC139_4_4_ACTIVATE_ABS = $tcpar_COMSignal1_Condition ");
		CA_set_EnvVar_value( '_Env__VDC139_ACTIVATE_ABS', $tcpar_COMSignal1_Condition, 'phys' );
		
		unless(defined $tcpar_StepValue2_0 and defined $tcpar_StepValue2_1) 
		{
			S_set_error("Square can not be performed due to missing parameters StepValue1 and StepValue2 -> stimulation aborted");
			return;
		}
		
		COM_stepOrSquareSignal_EM6($tcpar_COMSignal2, $tcpar_StepValue2_0, $duration_ms, $tcpar_StepValue2_1, $tcpar_Protocol, undef, $squareDuration_ms, 5);
		my $waitTimeUntilCrash = $total_recording_time / 2;
		S_teststep_2nd_level("Wait $waitTimeUntilCrash ms before injecting crash.", 'AUTO_NBR');
	}
	
	
	
	

	return 1;
}

sub _setPower {
	my $power = shift;
	my $vol = 7;
	my $waitTime1 = 1;
	my %power_to_wait_time =(
		'IGN OFF B'=> 40,
		'IGN OFF A'=> 8,
		'IGN OFF C'=> 160,
		'IGN OFF D'=> 250,
		'IGN OFF E'=> 550,
		'Low'	   => 5000	
	);
	if( $power eq 'Normal') {
		$vol = 12;
	} elsif ( $power eq 'High' ) {
		$vol = 18;
		$waitTime1 = 1200;
	} 
	else {
		if (exists $power_to_wait_time{$power}){
			$waitTime1 = $power_to_wait_time{$power};
		}
		else {
				S_set_warning("Not set power state to $power yet => Set power to Normal state");
			}		
	}
	S_w2rep("Set voltage = $vol V and wait for $waitTime1 ms",'purple');
	LC_SetVoltage($vol);
	S_wait_ms($waitTime1);
	
	if( $power eq 'Low'){
		S_w2rep("Sending Extended Session Request for Reset Crash Command", 'Purple');
		GDCOM_request_general ('REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession', 'strict');
	}

	return $vol;
}


sub EDR_Eval_evaluate_EDID_Raw_EM6_Quanhh {
	my $recordNbr = shift;
	my $edid = shift;
	my $crashLabel = shift; #actual data
	my $expectedLable = shift; #expected data
	
#--------------------------------------------------------------
    # GET STORAGE ORDER
    #    
    my $storageOrder = EDR_getStorageOrder ();
    return unless(defined $storageOrder);

    if($storageOrder eq 'PhysicalOrder'){
       $storageOrder =  'MostRecentLast'; #same behavior as there is no overwriting
    }

	#--------------------------------------------------------------
    # GET EXPECTED COM SIGNAL VALUE
    #    
	S_w2log(1, "Get expected COM signal value '$tcpar_COMSignal1'and '$tcpar_COMSignal2' and '$tcpar_COMSignal3'  in crash the $expectedLable trigeer");
	my $comSignalDataSamples;
	
	##Quanhh note ne
	#If COMsignal3 == NA => COMsiganl1 giu nguyen && siganl2 thay doi
	#else 
	#COMsiganl1 giu nguyen && siganl2 giu nguyen , Siganl 3 thay doi
	$comSignalDataSamples = EDR_COM_GetExpectedValue_Multiple_Signal_Quanhh($expectedLable);
	
	my $Quanhh_dum = Dumper($comSignalDataSamples);
	S_w2rep("Quanhh check comSignalDataSamples $Quanhh_dum ");
	
 	#--------------------------------------------------------------
    # GET CRASH TIME ZERO ON COM AND EDR
    #    
    my $comTraceTimeZero_ms = $crash_handler -> Get_COM_TraceTimeZero_ms(  "SourceLabel" => find_signal_for_label(), "CrashLabel" => $expectedLable );	
	
	# S_w2rep("Quanhh check comTraceTimeZero_ms = $comTraceTimeZero_ms");
	
	my @allCrashTimeZeros = split('_', $tcpar_Crash_Time_Zero_ms);
	my $numberOfIncidents = @allCrashTimeZeros;
	S_w2rep("Number of incidents: $numberOfIncidents");
	my $crashTimeZero_href;

    if($numberOfIncidents > $numberOfRecords){ #Extended event
        $numberOfRecordsToEvaluate = $numberOfRecords;
    }
    else {
        $numberOfRecordsToEvaluate = $numberOfIncidents;
    }
	
	S_w2rep("numberOfRecordsToEvaluate = $numberOfRecordsToEvaluate");

	foreach my $incidentNumber (1..$numberOfRecordsToEvaluate)
	{
		$crashTimeZero_href -> {"Record_$incidentNumber"} = $allCrashTimeZeros[$incidentNumber-1] if($storageOrder eq 'MostRecentLast');
		$crashTimeZero_href -> {"Record_$incidentNumber"} = $allCrashTimeZeros[$numberOfRecordsToEvaluate - $incidentNumber] if($storageOrder eq 'MostRecentFirst');		
	}

 	S_w2rep("Number of records to evaluate: $numberOfRecordsToEvaluate");
 	#--------------------------------------------------------------
    # VALIDATE REPORTED COM SIGNALS FOR ALL INCIDENTS / RECORDS
    #

	S_w2rep("Evaluate for buffer $recordNbr \n");
	$index = $index + 1;
	# S_teststep_expected_NOHTML("\n");
	# S_teststep_detected_NOHTML("\n");

	S_w2rep("---- Record $recordNbr ----");
	S_teststep_expected_NOHTML("---- Record $recordNbr ----");
	S_teststep_detected_NOHTML("---- Record $recordNbr ----");
	# my $thisCrashTimeZero = $crashTimeZero_href -> {"Record_$recordNbr"};
	my $thisCrashTimeZero = $tcpar_CrashTimeZero_1;

	# Synchronize T0
	S_w2rep("Crash time zero given for this crash is: $thisCrashTimeZero");
	S_w2rep("Synchronize given T0 ($thisCrashTimeZero) for EDID $tcpar_EDID.");
	if(defined $tcpar_LastSpeedDataSample_EDID)
	{
		S_set_warning("Usage of parameter 'LastSpeedDataSample_EDID' outdated. Fill 'TimeSynchronization' section in EDR mapping instead!");

		my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crashLabel, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_LastSpeedDataSample_EDID );
		unless(defined $edidData) {
			S_w2rep("No EDID data found for crash $crashLabel, record $recordNbr. EDID cannot not be evaluated.", 'purple');
			return;
		}
		$thisCrashTimeZero = $thisCrashTimeZero - $edidData -> {DataValue} * MILLISEC_TO_SECOND;
	}
	else{
		$thisCrashTimeZero = EDR_synchronize_T0_for_EDID($tcpar_EDID, $thisCrashTimeZero,		    	
														 $crashLabel, $recordNbr);
	}

	S_w2rep("Synchronized T0: $thisCrashTimeZero ms", 'NO_AUTO_NBR');

	#-----------------------------------------------------------------------
	# Get EDID data
	#-----------------------------------------------------------------------
	S_w2rep("Read EDID '$tcpar_EDID' corresponding to COM signal $tcpar_COMSignal1 in Record $recordNbr", 'Blue');			#measurement 1

	# Eval start and end time
	S_w2rep("Get EDID recording start and end time", 'purple');
	my $recordingStartTime_ms = $record_handler -> GetRecStartTimeMillisecEDID("CrashLabel" => $crashLabel, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID );
	my $recordingEndTime_ms = $record_handler -> GetRecEndTimeMillisecEDID("CrashLabel" => $crashLabel, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID );

	# EDID value
	S_w2rep("Get decoded EDID value");
	my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crashLabel, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID );
	unless(defined $edidData) {
		S_w2rep("No EDID data found for crash $crashLabel, record $recordNbr. EDID cannot not be evaluated.", 'purple');
		return;
	}
	
	
	# TODO: EDID has only one Data Sample, evaluate directly with COM signal value at time zero - try out in Ford
	if(ref($edidData -> {"DataValue"}) ne 'ARRAY'){
		S_w2rep("EDID is static, i.e. there is only one data sample to validate");
		S_w2rep("Recording start time: $recordingStartTime_ms ms");
		my $detectedEDIDvalue = $edidData -> {"DataValue"};
		my $comValueAtRecStart;
		my $crashTimeZeroOnCOM_sec = ($comTraceTimeZero_ms + $thisCrashTimeZero + $recordingStartTime_ms) * MILLISEC_TO_SECOND;
		S_w2rep("EDR recording start time: $crashTimeZeroOnCOM_sec sec");
		foreach my $comTimeStamp (sort {$a <=> $b} keys %{$comSignalDataSamples})
		{
			next if($comTimeStamp < $crashTimeZeroOnCOM_sec);
			$comValueAtRecStart = $comSignalDataSamples -> {$comTimeStamp};
			S_w2rep("COM value at recording start time of EDID is $comValueAtRecStart");
			last;
		}
		S_teststep_expected("Expected value for EDID $tcpar_EDID: $comValueAtRecStart", "EDID_$edid\_record_$crashLabel");
		S_teststep_detected("Detected value for EDID $tcpar_EDID: $detectedEDIDvalue", "EDID_$edid\_record_$crashLabel");
		EVAL_evaluate_value( "EDID_$tcpar_EDID\_$tcpar_COMSignal1" , $detectedEDIDvalue, '==', $comValueAtRecStart, 0.5 , 'absolute');
		return;
	}
	
	# Ringbuffer COM signal -> more than one data sample!
	my $edidDataSamples = $edidData -> {"DataSamples"};
	
	S_w2rep('----------edidDataSamples------');
	while (my ($k,$v)=each %$edidDataSamples) {S_w2rep("key $k => value $v\n")}
	
	S_w2rep('----------------');
	unless(defined $edidDataSamples) {
		S_set_error("No EDID data samples could be obtained for EDID $tcpar_EDID in record $recordNbr!", 110);
		return;
	}

	# EDID Sample Rate
	S_w2rep("Get EDID sample rate in Hz");
	my $edidSampleRate_Hz = $record_handler -> Get_EDID_SampleRateHz("CrashLabel" => $crashLabel, "RecordNumber" => $recordNbr,"EDIDnr" => $tcpar_EDID );
	my $tolerance_sec;
	if($edidSampleRate_Hz > 0) {
		$tolerance_sec = 1 / $edidSampleRate_Hz;
	}
	else {
		S_set_error("No EDID sample rate greater than zero given - check sample rate in EDR mapping", 110);
		return;
	}

	#-----------------------------------------------------------------------
	# Compare expected and detected
	#-----------------------------------------------------------------------
	# S_teststep("Start evaluation of '$tcpar_EDID' corresponding to COM signal $tcpar_COMSignal1 in Record $recordNbr, crash $crashLabel", 'AUTO_NBR');
	S_teststep("Quanhh check  COM_Signal_DataSamples: $comSignalDataSamples,
									 Rec_Start_Time_ms $recordingStartTime_ms, 
									 Rec_End_Time_ms $recordingEndTime_ms,
									 Crash_TimeZero_s $thisCrashTimeZero * MILLISEC_TO_SECOND,
									 COM_trace_TimeZero_ms $comTraceTimeZero_ms,
									 EDID_ID $tcpar_EDID,
									 Absolute_Tolerance_Time_sec $tolerance_sec,
									 Absolute_Tolerance_Value $tcpar_Tolerance_Value_abs,
									 DataUnit $edidData ,
									 CompareTitle COM_Signal_$tcpar_COMSignal1\_Crash_$crashLabel\_Record_$recordNbr);", 'AUTO_NBR');
	
	my ($firstVerdict, $busData_href) = EDR_Eval_Ringbuffer_COMsignal_NOVERDICT(
	# my ($firstVerdict, $busData_href) = EDR_Eval_Ringbuffer_COMsignal_Quanhh	( 
																					 "EDID_DataSamples" => $edidDataSamples,
																					 "COM_Signal_DataSamples" => $comSignalDataSamples,
																					 "Rec_Start_Time_ms" => $recordingStartTime_ms, 
																					 "Rec_End_Time_ms" => $recordingEndTime_ms,
																					 "Crash_TimeZero_s" => $thisCrashTimeZero * MILLISEC_TO_SECOND,
																					 "COM_trace_TimeZero_ms" => $comTraceTimeZero_ms,
																					 "EDID_ID" => $tcpar_EDID,
																					 "Absolute_Tolerance_Time_sec" => $tolerance_sec,
																					 "Absolute_Tolerance_Value" => $tcpar_Tolerance_Value_abs,
																					 "DataUnit" => $edidData -> {"ValueUnit"},
																					 "CompareTitle" => "COM_Signal_$tcpar_COMSignal1\_Crash_$crashLabel\_Record_$recordNbr"
																				 );						

	S_w2rep("First verdict: $firstVerdict");

	my ($thisEdidSynchronizationEdid, $thisEdidSyncType);
	if(not defined $tcpar_LastSpeedDataSample_EDID){
		($thisEdidSynchronizationEdid, $thisEdidSyncType) = EDR_get_synchronization_EDID ($tcpar_EDID);
	}
	else{
		$thisEdidSynchronizationEdid = $tcpar_LastSpeedDataSample_EDID;
	}

	my $secondVerdict;
	my $shiftTimesec = 0;
	if($firstVerdict eq 'VERDICT_FAIL' and not defined $thisEdidSynchronizationEdid ){
		
		S_w2rep("No synchronization EDID given - shift T0 by half sample time and validate again", 'purple');
		my $sampleRate = $record_handler -> Get_EDID_SampleRateHz(  "EDIDnr" => $tcpar_EDID, 
																	"RecordNumber" => $recordNbr, 
																	"CrashLabel" => $crashLabel);
		unless(defined $sampleRate){
			S_set_error("No sample rate defined for EDID. Signal can not be shifted for validation. Abort validation.");
			return;
		}
		$shiftTimesec = 1/$sampleRate;	        	

		S_w2rep("Start validation with T0 shift of $shiftTimesec seconds", 'purple');
		my $busData_href;
		($secondVerdict, $busData_href) = EDR_Eval_Ringbuffer_COMsignal_NOVERDICT( "EDID_DataSamples" => $edidDataSamples, 
										 "COM_Signal_DataSamples" => $comSignalDataSamples,
										 "Rec_Start_Time_ms" => $recordingStartTime_ms, 
										 "Rec_End_Time_ms" => $recordingEndTime_ms,
										 "Crash_TimeZero_s" => $thisCrashTimeZero * MILLISEC_TO_SECOND - $shiftTimesec,
										 "COM_trace_TimeZero_ms" => $comTraceTimeZero_ms,
										 "EDID_ID" => $tcpar_EDID,
										 "Absolute_Tolerance_Time_sec" => $tolerance_sec,
										 "Absolute_Tolerance_Value" => $tcpar_Tolerance_Value_abs,
										 "DataUnit" => $edidData -> {"ValueUnit"},
										 "CompareTitle" => "COM_Signal_$tcpar_COMSignal1\_Crash_$crashLabel\_Record_$recordNbr\_shifted");                     

		 S_w2rep("Second verdict (shifted): $secondVerdict");      	
	}

	#-----------------------------------------------------------------------
	# Set verdict and report result
	#-----------------------------------------------------------------------
	my $verdict;
	if(($firstVerdict eq 'VERDICT_PASS') or ($secondVerdict eq 'VERDICT_PASS')) {
		$verdict = 'VERDICT_PASS';
	}
	else {
		$verdict = 'VERDICT_FAIL';
	}
	
	S_set_verdict($verdict);

	S_teststep_expected("'EDID $tcpar_EDID' corresponding to COM signal '$tcpar_COMSignal1' should be reported as in CAN trace", "EDID_$edid\_record_$crashLabel");			#evaluation 1
	S_teststep_detected("Detected EDID COM signal state: equal to COM signal in trace", "EDID_$edid\_record_$crashLabel") if ($verdict eq 'VERDICT_PASS');
	S_teststep_detected("Detected EDID COM signal state: not equal to COM signal in trace", "EDID_$edid\_record_$crashLabel") if ($verdict eq 'VERDICT_FAIL');
}


sub EDR_COM_GetExpectedValue_Multiple_Signal_Quanhh {
	
	my $crashLabel = shift;
	my $sourceData_signal;
	# my $crash_handler = FuncLib_EDR_Framework::EDR_init_CrashHandler();
	return unless(defined $crash_handler);

	my %result_hash;
	if ($tcpar_COMSignal1 eq 'VDC139_4_4_ACTIVATE_ABS'){
		 %result_hash = (
			"00" => 0,
			"10" => 1,
			"01" => 2,
			"11" => 2,
		)
	}
	elsif ($tcpar_COMSignal1 eq 'VDC328_4_0_IND_VDC_OFF'){
		 %result_hash = (
			"000" => 0,
			"010" => 1,
			"100" => 2,
			"001" => 3,
			"011" => 3,
			"101" => 3,
			"111" => 3,
			"110" => 'FE'
		)
	}
    S_w2log(1, "EDR_COM_GetExpectedValue: Get expected EDR data");

	# my $tcpar_COMSignal = 'DriverSafetyBeltBuckleState';
	
	##Quanhh note ne
	#If COMsignal3 == NA => COMsiganl1 giu nguyen && siganl2 thay doi
	#else 
	#COMsiganl1 giu nguyen && siganl2 giu nguyen , Siganl 3 thay doi

	my $hash_lookup_string_prefix = "";
	if( $tcpar_COMSignal3 eq 'NA')
	{
		$sourceData_signal = $crash_handler -> GetSourceDataSamples("SourceLabel" => $tcpar_COMSignal2, 
                                                                "CrashLabel" => $crashLabel); 
		$hash_lookup_string_prefix = "$tcpar_COMSignal1_Condition";
		S_w2rep("Quanhh check string $hash_lookup_string_prefix ");
	}
	else
	{
		$sourceData_signal = $crash_handler -> GetSourceDataSamples("SourceLabel" => $tcpar_COMSignal3, 
                                                                "CrashLabel" => $crashLabel); 
		S_w2rep("Quanhh check 1 $tcpar_COMSignal1_Condition ");
		S_w2rep("Quanhh check 2 $tcpar_COMSignal2_Condition ");
		$hash_lookup_string_prefix = "$tcpar_COMSignal1_Condition"."$tcpar_COMSignal2_Condition";
		S_w2rep("Quanhh check string $hash_lookup_string_prefix ");
	}
   

	unless(defined $sourceData_signal ) {
		# my $quanh_dd = Dumper($crash_handler);
		# S_w2rep("Dump crashhandler  ra de coisao no ko co DataSamples $quanh_dd");
		S_set_error("No steering input signal values found for crash $crashLabel. Return nothing.");
		return;
	}
	
	my $result;
	my $comSignalDataSamples = $sourceData_signal -> {"DataSamples"};
	
	my $hash_lookup_string;
    foreach my $TimeStamp (sort {$a <=> $b} keys %{$comSignalDataSamples})
    {
        my $Signal_Status_Reported = $comSignalDataSamples -> {$TimeStamp};
		$hash_lookup_string = "$hash_lookup_string_prefix$Signal_Status_Reported";
		my $Quanhh_dum_hash = Dumper($hash_lookup_string);
		S_w2rep("Quanhh check hash_lookup_string $Quanhh_dum_hash ");
		# my $Outputval;
		# if($Signal_Status_Reported == 0)
		# {
			# $Outputval = 0;
		# }
		# elsif ($Signal_Status_Reported == 1)
		# {
			# $Outputval = $Signal_Status_Reported;
		# }
		$result -> {$TimeStamp} = %result_hash->{$hash_lookup_string};

    }		

    return $result;
}

# sub _setMessageState{
	# my $message = shift;
	# my $state = shift;
	
	# S_w2rep("Set state $state for message $message ", 'purple');
	
	# if( $message eq 'HEVC_A1'){
		# if( $state eq 'neverReceived'){
			# S_teststep_2nd_level("Stop '$tcpar_msg' message", 'AUTO_NBR');
			# CA_set_EnvVar_value( $HEVCA1_To, 0 );
			# S_wait_ms(2000);
			# GDCOM_request ('14 FF FF FF', '54', 'relax');
			# S_wait_ms(1000);
		# }	
	# } elsif ( $message eq 'EBA_A1'){
		# if( $state eq 'neverReceived'){
			# S_teststep_2nd_level("Stop '$tcpar_msg' message", 'AUTO_NBR');
			# CA_set_EnvVar_value( $EBAA1_To, 0 );
			# S_wait_ms(2000);
			# GDCOM_request ('14 FF FF FF', '54', 'relax');
			# S_wait_ms(1000);
		# } elsif ( $state eq 'wasReceivedOnce') {
			# S_teststep_2nd_level("Sending '$tcpar_msg' message once", 'AUTO_NBR');
			# CA_set_EnvVar_value( $EBAA1_To, 1 );
			# S_wait_ms(1000);
			# CA_set_EnvVar_value( $EBAA1_To, 0 );
		# } elsif ( $state eq 'Sending') {
			# S_teststep_2nd_level("Sending '$tcpar_msg' message", 'AUTO_NBR');
			# CA_set_EnvVar_value( $EBAA1_To, 1 );
			# S_wait_ms(1000);
		# } 	
	# }	
	# return 1;
# }

sub _printFaultsName{
	my $memory = shift;
	my $id = shift;

	my $size = @{$memory->{fault_text}};
	if($size == 0)
	{
		S_teststep_detected("No Fault is qualified", "$id");
	}
	else
	{
		for (my $i = 0; $i < @{$memory->{fault_text}}; $i++)
		{
			S_teststep_detected("'$memory->{fault_text}[$i] ($memory->{DTC}[$i])' is qualified with $memory->{state}[$i]", "$id");
		}
	}
}

1;
