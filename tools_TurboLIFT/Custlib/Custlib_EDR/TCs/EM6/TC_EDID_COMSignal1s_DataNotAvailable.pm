#### TEST CASE MODULE
package TC_EDID_COMSignal1s_DataNotAvailable;

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
use LIFT_labcar;
use LIFT_PD;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use GENERIC_DCOM;
use LIFT_can_access;
use FuncLib_EDR_Framework;
use FuncLib_TNT_SYC_INTERFACE;
use Data::Dumper;
use FuncLib_CustLib_EDR_CNEDR;
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_COMSignal1s_DataNotAvailable

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Activate EDR functionality


I<B<Stimulation and Measurement>>

1. Set the  <COMSignal1> to its default state which is fetched from mapping or <COM_Defaultstate>

2. Wait for <WaitTimeTransmitSignal_msec> until the signal is transmitted on the COM bus

3. Create <Condition>on <COMSignal1>

4. Wait <WaitTimeAfterCondition_msec>

5. Inject a Crash <Crashcode>

6. Read <EDID> corresponding to COM signal


I<B<Evaluation>>

1. -

2. -

3. -

4. -

5. -

6. 

COMSignal1Value corresponding to <ExpectedCOMSignal1Data> should be reported in EDR


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'EDID' => 
	SCALAR 'WaitTimeTransmitSignal_msec' => 
	SCALAR 'WaitTimeAfterCondition_msec' => 
	HASH 'COMSignal1sAfterCrash' => 
	SCALAR 'ResultDB' => 
	SCALAR 'wait_ms' => 
	SCALAR 'Protocol' => 
	SCALAR 'Condition' => 
	SCALAR 'ExpectedCOMSignal1Data' => 
	SCALAR 'expected_nr_of_records' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'Validate COM signal  reported in EDR when  timeout  is created'
	EDID = '<Fetch {EDID}>'
	WaitTimeTransmitSignal_msec = '6000'
	WaitTimeAfterCondition_msec = '6000'
	COMSignal1sAfterCrash = %()
	#As defined in CAN mappile file
	ResultDB = 'EDR'
	wait_ms='20000'
	Protocol='CAN' #alternative: 'Flexray'
	Condition=  '<Test Heading 2>'
	ExpectedCOMSignal1Data= '0xFF'
	expected_nr_of_records  = 1
	#COM_Defaultstate = '' #optional parameter to set different default value , other than defined in mapping_can
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_WaitTimeTransmitSignal_msec;
my $tcpar_WaitTimeAfterCondition_msec;
my $tcpar_COMSignal1sAfterCrash;
my $tcpar_ResultDB;
my $tcpar_wait_ms;
my $tcpar_Protocol;
my $tcpar_Condition;
my $tcpar_ExpectedCOMSignal1Data;
my $tcpar_expected_nr_of_records;


my $tcpar_ExpectedCOMSignalData;
my $tcpar_COM_Message;
my $tcpar_DiagType;



my $tcpar_Crashcode;
my $tcpar_COM_Signal;

my $tcpar_COM_Defaultstate;

my $tcpar_read_NHTSAEDR;
my $tcpar_read_CHINAEDR;
my $tcpar_read_SUBARU;
################ global parameter declaration ###################
#add any global variables here

my ($record_handler, $crash_handler, 
$crashSettings, 
$edrNumberOfEventsToBeStored,
$ChinaEDR_diagType,
$tcpar_COMsignalsAfterCrash,
);
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

$tcpar_purpose =  S_read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDID =  S_read_mandatory_testcase_parameter( 'EDID' );
	# $tcpar_DiagType =  S_read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  S_read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_wait_ms =  S_read_mandatory_testcase_parameter( 'wait_ms' );
	$tcpar_Crashcode =  S_read_mandatory_testcase_parameter( 'Crashcode' );
	$tcpar_Condition =  S_read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_expected_nr_of_records =  S_read_mandatory_testcase_parameter( 'expected_nr_of_records' );
	$tcpar_WaitTimeTransmitSignal_msec =  S_read_mandatory_testcase_parameter( 'WaitTimeTransmitSignal_msec' );
	$tcpar_WaitTimeAfterCondition_msec =  S_read_mandatory_testcase_parameter( 'WaitTimeAfterCondition_msec' );
	$tcpar_COMsignalsAfterCrash =  S_read_mandatory_testcase_parameter( 'COMSignal1sAfterCrash','byref' );
	$tcpar_ExpectedCOMSignalData =  S_read_mandatory_testcase_parameter( 'ExpectedCOMSignal1Data' );
	$tcpar_COM_Message =  S_read_mandatory_testcase_parameter( 'COM_Message' );
	$tcpar_COM_Signal =  S_read_mandatory_testcase_parameter( 'COMSignal1' );
	$tcpar_COM_Defaultstate =  S_read_optional_testcase_parameter( 'COM_Defaultstate' );
	# $tcpar_Protocol =  S_read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_read_NHTSAEDR=S_read_optional_testcase_parameter('read_NHTSAEDR');
	$tcpar_read_CHINAEDR=S_read_optional_testcase_parameter('read_CHINAEDR');
	# $tcpar_read_SUBARU=S_read_optional_testcase_parameter('read_SUBARU');
	
	if( $tcpar_read_CHINAEDR eq "no") {
		$tcpar_read_NHTSAEDR = 'yes';
		# $tcpar_read_CHINAEDR = 'no';
	}
	else 
	{
		# $tcpar_read_NHTSAEDR = 'no';
		my $storageOrder = EDR_getStorageOrder();
		return unless(defined $storageOrder);

		if($storageOrder eq 'PhysicalOrder'){
			$ChinaEDR_diagType= 'Prodiag';  #In platform NHTSA and China EDR is read via proddiag
		}
		else {
			$ChinaEDR_diagType= 'CHINA_Payload';
		}
	}
	

	return 1;
}

sub TC_initialization {

	# $EDR_Mapping = S_get_contents_of_hash( ['Mapping_EDR'] );
	# $CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	
	# $msgTo = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_message}{'CANOE_DISABLE'};
	# $msgDLC = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_message}{'CANOE_DLC'};
	
	# $index = 0;
	$tcpar_Protocol = 'CAN';
	$tcpar_DiagType = 'ProdDiag';
	$ChinaEDR_diagType = 'CHINA_Payload';
	# $tcpar_Mode='phys';
	# $tcpar_Crash_Time_Zero_ms = 0;
	# $numberOfRecords = 3;
	
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

	# CA_set_EnvVar_value ( "_Env__MET390_FAIL_UART_WA_BOX", 0);
	# S_wait_ms(500);
	# S_user_action('EGI040 msg counter');
	# CA_set_EnvVar_value ( "_Env__MET390_FAIL_UART_WA_BOX", 1);
	# S_wait_ms(500);
	# S_user_action('vdc 328 check sum');
	
	Prepare_Crash_Injection($tcpar_Crashcode);
	
	 #--------------------------------------------------------------
    # START COM SIGNAL MANIPULATION
    #    
	S_teststep("Set the '$tcpar_COM_Signal' to default state given in can mapping OR signal state given in TS", 'AUTO_NBR');
	if (defined $tcpar_COM_Defaultstate){
		S_teststep_2nd_level (" Setting COM signal to $tcpar_COM_Defaultstate", 'AUTO_NBR');
		COM_setSignalState($tcpar_COM_Signal,$tcpar_COM_Defaultstate,$tcpar_Protocol);
	}
	else {
		S_teststep_2nd_level (" Setting COM signal to default value defined in Mapping_CAN", 'AUTO_NBR');
		# 
		COM_setSignalState($tcpar_COM_Signal,0,$tcpar_Protocol);
		# S_user_action("Check ECM_A3 DefaultValue");
	}
	

	S_teststep("Wait for '$tcpar_WaitTimeTransmitSignal_msec' until the signal is transmitted on the COM bus", 'AUTO_NBR');
	S_wait_ms($tcpar_WaitTimeTransmitSignal_msec);
	
	# S_user_action("Before BusOff");
	S_teststep("Create $tcpar_Condition on'$tcpar_COM_Message'", 'AUTO_NBR');
	if ($tcpar_Condition eq "Timeout"){
		Condition_Timeout($tcpar_COM_Signal,$tcpar_COM_Message);
	}
	elsif ($tcpar_Condition eq "DLCerror")
	{
		Condition_Timeout($tcpar_COM_Signal,$tcpar_COM_Message);
	}
	S_wait_ms(1000);
	
	 my $faultsAfterStimulation = PD_ReadFaultMemory();

	S_teststep("Wait '$tcpar_WaitTimeAfterCondition_msec'", 'AUTO_NBR');
	S_wait_ms($tcpar_WaitTimeAfterCondition_msec);

	S_teststep("Inject a Crash", 'AUTO_NBR');
    CSI_TriggerCrash();
	S_wait_ms(15000);
	if (defined $tcpar_COMsignalsAfterCrash){
		foreach my $signal (keys %{$tcpar_COMsignalsAfterCrash})
		{				
			my $dataOnCOM = $tcpar_COMsignalsAfterCrash -> {$signal};
			S_w2rep("Signal =$signal,Data to be sent=$dataOnCOM");
			COM_setSignalState($signal,$dataOnCOM);	
		}
	}
	
	S_teststep("Wait '$tcpar_wait_ms'", 'AUTO_NBR');
	S_wait_ms($tcpar_wait_ms);

	if($tcpar_Condition ne "BusOff"){
		my $fileName = "$main::REPORT_PATH/".S_get_TC_number()."_LIFT_network_trace.asc";
		my $tracePath;
		$tracePath = CA_trace_store($fileName) if (lc($tcpar_Protocol) =~ m/can/i);
		$tracePath = FR_trace_store($fileName) if (lc($tcpar_Protocol) =~ m/flexray/i);
		S_w2rep("Trace File: $tracePath");		
	}
 
	# Restart Rest bus simulation - is stopped when storing!
	S_wait_ms(2000);
	CA_trace_start() if (lc($tcpar_Protocol) =~ m/can/i);
	FR_trace_start() if (lc($tcpar_Protocol) =~ m/flexray/i);	
	if($tcpar_Condition eq "BusOff")
	{
		S_teststep("Reset ECU after restarting the bus simulation", 'AUTO_NBR');
	    LC_ECU_Off();
		S_wait_ms('TIMER_ECU_OFF');
	    LC_ECU_On();
		S_wait_ms('TIMER_ECU_READY');
	}
	
	S_teststep("Read all EDR records", 'AUTO_NBR');
	my $dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number()."_".$tcpar_Crashcode;

	$edrNumberOfEventsToBeStored = SYC_EDR_get_NumberOfEventsToBeStored();
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("Not available in SYC - add or overwrite with Custlibrary Function");
		return;
	}
		 
	S_w2rep("edrNumberOfEventsToBeStored=$edrNumberOfEventsToBeStored");
	Prepertation();
	
	PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');								

	if ( lc( $tcpar_read_NHTSAEDR) eq 'yes' ) {
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $tcpar_DiagType,
								"CrashLabel" => $tcpar_Crashcode."_".$tcpar_Condition,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'NHTSA')
	}
	if (lc($tcpar_read_CHINAEDR) eq 'yes'){
		$edrNumberOfEventsToBeStored=3;
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $ChinaEDR_diagType,
								"CrashLabel" => $tcpar_Crashcode."_".$tcpar_Condition,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA');
	}
	
	# if (lc($tcpar_read_SUBARU) eq 'yes'){
		# $numberOfRecords=3;
		# EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $SubaruEDR_diagType,
								# "CrashLabel" => $tcpar_Crashtype,
								# "NbrOfRecords" =>  $numberOfRecords,
								# "StoragePath" => $dataStoragePath,
								# "CrashInfo" => $crashInfo_href,
								# "read_EDRType"=>'CHINA');
	S_wait_ms(1000);
	return 1;
}

sub TC_evaluation {

	my $edidValue;
	for(my $recordNumber = 1; $recordNumber <= $tcpar_expected_nr_of_records; $recordNumber++)
	{
		my $dataElement = $record_handler -> GetDataElementEDID(  "EDIDnr" => $tcpar_EDID,
																  "RecordNumber" => $recordNumber,
																  "CrashLabel" => $tcpar_Crashcode."_".$tcpar_Condition);
		
		S_teststep("EDID $tcpar_EDID ($dataElement) in record $recordNumber", 'AUTO_NBR',"read_edid_data_$recordNumber");				#measurement 1
		
		if ($tcpar_ExpectedCOMSignalData=~/0x/){
			my $detectedEDIDvalue = $record_handler -> GetRawEdidDataSamples( "EDIDnr" => $tcpar_EDID,
                                               "RecordNumber" => $recordNumber,
                                               "CrashLabel" => $tcpar_Crashcode."_".$tcpar_Condition,
                                               "FormatOption" => "HEX");
			unless(defined $detectedEDIDvalue) {
				S_set_error("No EDID data found for crash $tcpar_Crashcode, record $recordNumber. EDID cannot not be evaluated. Go to next record",110);
				return;
			}
			if(ref $detectedEDIDvalue ne 'ARRAY') {
				S_teststep_2nd_level("Read '$tcpar_EDID' ", 'AUTO_NBR',"Read_edid_data_$recordNumber");
				$edidValue ="0x".$detectedEDIDvalue;
				EVAL_evaluate_value ( "EDID_$tcpar_EDID\_Evaluation", $edidValue,'==',$tcpar_ExpectedCOMSignalData );
				S_teststep_expected("BLACK '$tcpar_ExpectedCOMSignalData'", "Read_edid_data_$recordNumber");
				S_teststep_detected("BLACK '$edidValue'", "Read_edid_data_$recordNumber");
			}
			else{
				my $dataSample=1;
				foreach $edidValue (@{$detectedEDIDvalue})
				{
					S_teststep_2nd_level("Read '$tcpar_EDID' data sample $dataSample", 'AUTO_NBR',"read_edid_data_$recordNumber\_data_sample_$dataSample");
					$edidValue="0x".$edidValue;
					EVAL_evaluate_value ( "EDID_$tcpar_EDID\_Evaluation", $edidValue,'==',$tcpar_ExpectedCOMSignalData );
					S_teststep_expected("PINK '$tcpar_ExpectedCOMSignalData'", "read_edid_data_$recordNumber\_data_sample_$dataSample");
					S_teststep_detected("PINK '$edidValue'", "read_edid_data_$recordNumber\_data_sample_$dataSample");
					$dataSample++;
				}
			}	
		
		}
		
		else {
			my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $tcpar_Crashcode."_".$tcpar_Condition, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID );
			unless(defined $edidData) {
				S_set_error("No EDID data found for crash $tcpar_Crashcode, record $recordNumber, return nothing", 110);
				return;
			}
			if(ref($edidData -> {"DataValue"}) ne 'ARRAY'){
				S_w2rep("EDID is static, i.e. there is only one data sample to validate");
				my $edidValue = $edidData -> {"DataValue"};
				EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $tcpar_ExpectedCOMSignalData, $edidValue );
				S_teststep_expected("'$tcpar_ExpectedCOMSignalData'", "read_edid_data_$recordNumber");
				S_teststep_detected("'$edidValue'", "read_edid_data_$recordNumber");
			}
			else{
				my $edidDataSamples = $edidData -> {"DataSamples"}; 
				
				unless(defined $edidDataSamples) {
					S_set_error("No EDID data samples could be obtained for EDID $tcpar_EDID in record $recordNumber!", 110);
					next;
				}
				
				foreach my $timeStampEDID (sort {$a <=> $b} keys %{$edidDataSamples})
				{
					S_teststep_2nd_level("Read '$tcpar_EDID' at time $timeStampEDID s", 'AUTO_NBR',"read_edid_data_$recordNumber\_time_$timeStampEDID");				#measurement 1
					# get EDID value corresponding to time stamp
					my $edidValue = $edidDataSamples -> {$timeStampEDID};
					EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $tcpar_ExpectedCOMSignalData, $edidValue );	
					S_teststep_expected("ROSE'$tcpar_ExpectedCOMSignalData'", "read_edid_data_$recordNumber\_time_$timeStampEDID");
					S_teststep_detected("LISA'$edidValue'", "read_edid_data_$recordNumber\_time_$timeStampEDID");		
				}
			}
		}	
	}


	return 1;
}

sub TC_finalization {
	Remove_Condition_DLC($tcpar_COM_Signal,$tcpar_COM_Message);
	Remove_Condition_Timeout($tcpar_COM_Signal,$tcpar_COM_Message);
	S_w2rep("Delete all object instances created...");
	foreach my $recordNbr (1..$edrNumberOfEventsToBeStored){
        $record_handler -> DeleteRecord(  "CrashLabel" => $tcpar_Crashcode."_".$tcpar_Condition,
                                          "RecordNumber" => $recordNbr );
    }					  
	
	
	# Delete stored records
	# foreach my $recordNbr (1..$edrNumberOfEventsToBeStored)
	# {
		# $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNbr);
		
	# }

	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashTimeZero',
     								 "CrashLabel"  => $tcpar_Crashcode  ); 
	
	$crash_handler -> DeleteSource ( "SourceLabel" => 'MDB_Path',
     								 "CrashLabel"  => $tcpar_Crashcode  ); 
     								
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashCode_MDS',
     								 "CrashLabel"  => $tcpar_Crashcode  ); 
									 

     
	
	PD_ClearCrashRecorder();
	S_wait_ms(2000);
	
	S_w2rep("Clean up record ...");
	$record_handler -> DeleteAllRecords();
	
	# Prepertation();
	#Erase Fault memory
	GDCOM_request ('31 01 30 00', '', 'relax');
    S_wait_ms(2000);
	
	LC_ECU_Off();
	S_wait_ms(8000);
	LC_ECU_On(13);
	S_wait_ms(6000);
	#############
	
	
	


	return 1;
}


sub Prepare_Crash_Injection{

	my @CrashInput = @_;
	my $Crashcode = @CrashInput[0];
	my $CrashTimeZero = 0;

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


sub Condition_Timeout{
	my $tcpar_COM_Signal = shift;
	my $tcpar_COM_Message = shift;
	# %_enV_EGI345_StartStop
	my %signal_to_EnvVar	= 
	(
		'VDC139_4_4_ACTIVATE_ABS'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'VDC139_3_7_FAIL_ABS_SYS'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'VDC328_4_0_IND_VDC_OFF'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'VDC328_4_1_STATE_ACTIVATE_VDC'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'VDC328_3_2_IND_WARN_VDC'=>"_enV_".$tcpar_COM_Message."_StartStop",
		
		'VDC139_4_2_BRAKELAMPSW'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'MET390_6_0_SEATBELT_DRVR'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'TCU048_3_0_IND_SHIFT_POS'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'MET390_6_1_SEATBELT_PASS'=>"_enV_".$tcpar_COM_Message."_StartStop",
		
		'VDC139_2_0_SPD_WHEEL_AVE'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'VDC138_2_0_STEER_ANGLE'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'EGI040_4_0_RATIO_ACCEL'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'EGI040_2_0_ENG_RPM'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'BIU660_3_0_COUNT_TRIP'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'HEV377_2_0_MOTOR_RPM'=>"_enV_".$tcpar_COM_Message."_StartStop"
		
		
	);	
	S_w2rep("$signal_to_EnvVar{$tcpar_COM_Signal}");
	CA_set_EnvVar_value ( "$signal_to_EnvVar{$tcpar_COM_Signal}", 0);
	S_wait_ms(1000);
}



sub Condition_DLC{
	my $tcpar_COM_Signal = shift;
	my $tcpar_COM_Message = shift;
	# enV_BIU3AC_DLC
	my %signal_to_EnvVar	= 
	(
		'VDC139_4_4_ACTIVATE_ABS'=>"enV_".$tcpar_COM_Message."_DLC",
		'VDC139_3_7_FAIL_ABS_SYS'=>"enV_".$tcpar_COM_Message."_DLC",
		'VDC328_4_0_IND_VDC_OFF'=>"enV_".$tcpar_COM_Message."_DLC",
		'VDC328_4_1_STATE_ACTIVATE_VDC'=>"enV_".$tcpar_COM_Message."_DLC",
		'VDC328_3_2_IND_WARN_VDC'=>"enV_".$tcpar_COM_Message."_DLC",
		
		'VDC139_4_2_BRAKELAMPSW'=>"enV_".$tcpar_COM_Message."_DLC",
		'MET390_6_0_SEATBELT_DRVR'=>"enV_".$tcpar_COM_Message."_DLC",
		'TCU048_3_0_IND_SHIFT_POS'=>"enV_".$tcpar_COM_Message."_DLC",
		'MET390_6_1_SEATBELT_PASS'=>"enV_".$tcpar_COM_Message."_DLC",
		
		'VDC139_2_0_SPD_WHEEL_AVE'=>"enV_".$tcpar_COM_Message."_DLC",
		'VDC138_2_0_STEER_ANGLE'=>"enV_".$tcpar_COM_Message."_DLC",
		'EGI040_4_0_RATIO_ACCEL'=>"enV_".$tcpar_COM_Message."_DLC",
		'BIU660_3_0_COUNT_TRIP'=>"enV_".$tcpar_COM_Message."_DLC",
		'HEV377_2_0_MOTOR_RPM'=>"enV_".$tcpar_COM_Message."_DLC",
		'EGI040_2_0_ENG_RPM'=>"_enV_".$tcpar_COM_Message."_StartStop",
		
	);	
	S_w2rep("$signal_to_EnvVar{$tcpar_COM_Signal}");
	CA_set_EnvVar_value ( "$signal_to_EnvVar{$tcpar_COM_Signal}", 0);
	S_wait_ms(1000);
}


sub Remove_Condition_DLC{
	my $tcpar_COM_Signal = shift;
	my $tcpar_COM_Message = shift;
	# enV_BIU3AC_DLC
	my %signal_to_EnvVar	= 
	(
		'VDC139_4_4_ACTIVATE_ABS'=>"enV_".$tcpar_COM_Message."_DLC",
		'VDC139_3_7_FAIL_ABS_SYS'=>"enV_".$tcpar_COM_Message."_DLC",
		'VDC328_4_0_IND_VDC_OFF'=>"enV_".$tcpar_COM_Message."_DLC",
		'VDC328_4_1_STATE_ACTIVATE_VDC'=>"enV_".$tcpar_COM_Message."_DLC",
		'VDC328_3_2_IND_WARN_VDC'=>"enV_".$tcpar_COM_Message."_DLC",
		
		'VDC139_4_2_BRAKELAMPSW'=>"enV_".$tcpar_COM_Message."_DLC",
		'MET390_6_0_SEATBELT_DRVR'=>"enV_".$tcpar_COM_Message."_DLC",
		'TCU048_3_0_IND_SHIFT_POS'=>"enV_".$tcpar_COM_Message."_DLC",
		'MET390_6_1_SEATBELT_PASS'=>"enV_".$tcpar_COM_Message."_DLC",
		
		'VDC139_2_0_SPD_WHEEL_AVE'=>"enV_".$tcpar_COM_Message."_DLC",
		'VDC138_2_0_STEER_ANGLE'=>"enV_".$tcpar_COM_Message."_DLC",
		'EGI040_4_0_RATIO_ACCEL'=>"enV_".$tcpar_COM_Message."_DLC",
		'BIU660_3_0_COUNT_TRIP'=>"enV_".$tcpar_COM_Message."_DLC",
		'HEV377_2_0_MOTOR_RPM'=>"enV_".$tcpar_COM_Message."_DLC",
		'EGI040_2_0_ENG_RPM'=>"_enV_".$tcpar_COM_Message."_StartStop",
		
	);	
	S_w2rep("$signal_to_EnvVar{$tcpar_COM_Signal}");
	CA_set_EnvVar_value ( "$signal_to_EnvVar{$tcpar_COM_Signal}", 8);
	S_wait_ms(1000);
}

sub Remove_Condition_Timeout{
	my $tcpar_COM_Signal = shift;
	my $tcpar_COM_Message = shift;
	# %_enV_EGI345_StartStop
	my %signal_to_EnvVar	= 
	(
		'VDC139_4_4_ACTIVATE_ABS'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'VDC139_3_7_FAIL_ABS_SYS'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'VDC328_4_0_IND_VDC_OFF'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'VDC328_4_1_STATE_ACTIVATE_VDC'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'VDC328_3_2_IND_WARN_VDC'=>"_enV_".$tcpar_COM_Message."_StartStop",
		
		'VDC139_4_2_BRAKELAMPSW'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'MET390_6_0_SEATBELT_DRVR'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'TCU048_3_0_IND_SHIFT_POS'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'MET390_6_1_SEATBELT_PASS'=>"_enV_".$tcpar_COM_Message."_StartStop",
		
		'VDC139_2_0_SPD_WHEEL_AVE'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'VDC138_2_0_STEER_ANGLE'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'EGI040_4_0_RATIO_ACCEL'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'BIU660_3_0_COUNT_TRIP'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'HEV377_2_0_MOTOR_RPM'=>"_enV_".$tcpar_COM_Message."_StartStop",
		'EGI040_2_0_ENG_RPM'=>"_enV_".$tcpar_COM_Message."_StartStop",
		
	);	
	S_w2rep("$signal_to_EnvVar{$tcpar_COM_Signal}");
	CA_set_EnvVar_value ( "$signal_to_EnvVar{$tcpar_COM_Signal}", 1);
	S_wait_ms(1000);
}
 1;
 
