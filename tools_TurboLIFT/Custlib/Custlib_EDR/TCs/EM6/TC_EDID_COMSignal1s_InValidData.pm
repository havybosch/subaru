#### TEST CASE MODULE
package TC_EDID_COMSignal1s_InValidData;

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
use LIFT_can_access;
use LIFT_PD;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use GENERIC_DCOM;
use FuncLib_EDR_Framework;
use FuncLib_TNT_SYC_INTERFACE;
use Data::Dumper;
use FuncLib_CustLib_EDR_CNEDR;
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_COMSignal1s_InValidData

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Activate EDR functionality


I<B<Stimulation and Measurement>>

1. Set the <COMSignal1> to its default state which is fetched from mapping or <COM_Defaultstate>

2. Wait for <WaitTimeTransmitSignal_msec> till the signal is transmitted on the COM bus

3. Create <Condition> for <COMSignal1>

4. Wait <TimeInvalidBeforeCrash_msec>

5. Inject a Crash <Crashcode>

6. Read <EDID> corresponding to COM signal


I<B<Evaluation>>

1. -

2. -

3. -

4. - 

5. -

6. COMSignal1Value corresponding to <COMSignal1AfterInvalidState>should be reported in EDR


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'EDID' => 
	SCALAR 'WaitTimeTransmitSignal_msec' => 
	SCALAR 'TimeInvalidBeforeCrash_msec' => 
	SCALAR 'Q_BitValue' => 
	SCALAR 'ResultDB' => 
	SCALAR 'wait_ms' => 
	SCALAR 'expected_nr_of_records' => 
	SCALAR 'Protocol' => 
	HASH 'COMSignal1sAfterCrash' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'Validate COM signal relavent EDID in EDR when Invalid data is obtained on COM signal'
	EDID = '<Fetch {EDID}>'
	WaitTimeTransmitSignal_msec = '6000'
	TimeInvalidBeforeCrash_msec = '6000'
	Q_BitValue='1'  #optional parameter
	ResultDB = 'EDR'
	wait_ms='20000'
	expected_nr_of_records  = 1
	# COMSignal1 = 'TBD'
	# In case setting of other signal to certain value for invalid state is required
	#Manipulated_COM_Signals=%('additional_signal'=>'value')
	Protocol='CAN' # alternative: 'Flexray'
	COMSignal1sAfterCrash = %()
	#COM_Defaultstate = '' #optional parameter to set different default value , other than defined in mapping_can
	#As defined in CAN mappile file
	#For VIN test case, If any other invalid condition is available from project, then it must be handled by project team.
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_WaitTimeTransmitSignal_msec;
my $tcpar_TimeInvalidBeforeCrash_msec;
my $tcpar_Q_BitValue;
my $tcpar_ResultDB;
my $tcpar_wait_ms;
my $tcpar_expected_nr_of_records;
my $tcpar_Protocol;
my $tcpar_COMSignal1sAfterCrash;

my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_WaitTimeTransmitSignal_msec;
my $tcpar_TimeInvalidBeforeCrash_msec;
my $tcpar_COMSignalAfterInvalidState;
my $tcpar_expected_nr_of_records;
my $tcpar_Protocol;
my $tcpar_COMsignalsAfterCrash;
my $tcpar_COMSignal;
my $tcpar_COM_Message;
my $tcpar_COMsignal_Qbit;
my $tcpar_Condition;
my $tcpar_wait_ms;
my $tcpar_Crashcode;
my $tcpar_DiagType;
my $tcpar_ResultDB ;
my $tcpar_Method;
my $tcpar_Q_BitValue;
my $tcpar_Faulty_value;
my $tcpar_COM_Defaultstate;
my $tcpar_Manipulated_COM_Signals;
my $tcpar_read_NHTSAEDR;
my $tcpar_read_CHINAEDR;
my $tcpar_read_subaru;

################ global parameter declaration ###################
#add any global variables here
my ($record_handler, $crash_handler, $crashSettings, $edrNumberOfEventsToBeStored,$manipulatedCOMsignals,$ChinaEDR_diagType,$default_value,$unit, $message_name);
my $SubaruEDR_diagType;
###############################################################
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
		'HEV377_2_0_MOTOR_RPM'=>'_Env__HEV377_MOTOR_RPM',
		'EGI040_2_0_ENG_RPM'=> "_Env__EGI040_ENG_RPM"
		
	);	

sub TC_set_parameters {

	$tcpar_purpose =  S_read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDID =  S_read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_wait_ms =  S_read_mandatory_testcase_parameter( 'wait_ms' );
	$tcpar_Crashcode =  S_read_mandatory_testcase_parameter( 'Crashcode' );
	$tcpar_expected_nr_of_records =  S_read_mandatory_testcase_parameter( 'expected_nr_of_records' );
	# $tcpar_DiagType =  S_read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  S_read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_WaitTimeTransmitSignal_msec =  S_read_mandatory_testcase_parameter( 'WaitTimeTransmitSignal_msec' );
	$tcpar_TimeInvalidBeforeCrash_msec =  S_read_mandatory_testcase_parameter( 'TimeInvalidBeforeCrash_msec' );
	$tcpar_COMSignalAfterInvalidState =  S_read_optional_testcase_parameter( 'COMSignal1AfterInvalidState');
	$tcpar_Faulty_value =  S_read_optional_testcase_parameter( 'Faulty_value');
	$tcpar_Protocol =  S_read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_COMsignalsAfterCrash = S_read_optional_testcase_parameter( 'COMsignal1sAfterCrash','byref' );
	$tcpar_Manipulated_COM_Signals = S_read_optional_testcase_parameter( 'Manipulated_COM_Signal1s','byref' );
	$tcpar_COMSignal =  S_read_mandatory_testcase_parameter( 'COMSignal1' );
	$tcpar_COM_Message =  S_read_optional_testcase_parameter( 'COM_Message' );
	$tcpar_COM_Defaultstate =  S_read_optional_testcase_parameter( 'COM_Defaultstate' );
	$tcpar_Q_BitValue =  S_read_optional_testcase_parameter( 'Q_BitValue' );
	$tcpar_COMsignal_Qbit =  S_read_optional_testcase_parameter( 'COMsignal1_Qbit' );
	$tcpar_Condition =  S_read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_Method = S_read_optional_testcase_parameter( 'Method' );
	
	unless( defined $tcpar_Method ) {
  		S_w2rep(" -->  Missing optional parameter 'Method', By default script uses 'Constant' as the method. \n");
  		$tcpar_Method = 'Constant';
	}
	$tcpar_read_NHTSAEDR=S_read_optional_testcase_parameter('read_NHTSAEDR');
	$tcpar_read_CHINAEDR=S_read_optional_testcase_parameter('read_CHINAEDR');
	$tcpar_read_subaru =S_read_optional_testcase_parameter('read_subaru');
	
	if(not defined $tcpar_read_CHINAEDR) {
		$tcpar_read_NHTSAEDR = 'yes';
		$tcpar_read_CHINAEDR = 'no';
	}
	else {
		$tcpar_read_NHTSAEDR = 'no';
		my $storageOrder = EDR_getStorageOrder();
		return unless(defined $storageOrder);

		if($storageOrder eq 'PhysicalOrder'){
			$ChinaEDR_diagType= 'Prodiag';  #In platform NHTSA and China EDR is read via proddiag
		}
		else {
			$ChinaEDR_diagType= 'CHINA_Payload';
		}
	}
	if( $tcpar_read_subaru eq 'yes')
	{
		$SubaruEDR_diagType ='Subaru_payload';
	}
	return 1;
}

sub TC_initialization {

	
	 # INITIALIZE RECORD AND CRASH HANDLER
    #    
	S_w2rep("Initialize Record and Crash Handler");
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;

	#--------------------------------------------------------------
    # PREPARE CRASH AND INITIALIZE EQUIPMENT
    #
	S_w2rep("Get crash settings for crash $tcpar_Crashcode");
    my $crashDetails_href = {"RESULTDB" => $tcpar_ResultDB, 'CRASHNAME'=> $tcpar_Crashcode};
    $crashSettings = CSI_GetCrashDataFromMDS($crashDetails_href);
    unless(defined $crashSettings) {
       S_set_error("Crash $tcpar_Crashcode not available in result DB $tcpar_ResultDB. Test case aborted.");
       return;
    }

	my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$tcpar_ResultDB" ] );
	my $resultDB_Path = $resultDBDetails->{'PATH'};
	S_w2log(1, "Crashcode: $tcpar_Crashcode, ResultDB: $tcpar_ResultDB (path: $resultDB_Path)");

	#--------------------------------------------------------------
    # Initialize equipment
    #

	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
    CA_trace_start();
    GDCOM_init() ; # To fetch info for CD from mapping_diag
	  
	S_w2log(1, "Set environments for crash as per result DB");
    CSI_PrepareEnvironment($crashSettings, 'init_complete');
    S_wait_ms(2000);

	S_w2log(1, "Clear crash recorder");
    PD_ClearCrashRecorder_NOERROR();
    S_wait_ms(2000);

	S_w2log(1, "Clear fault memory");
    PD_ClearFaultMemory();
    S_wait_ms(2000);
	
	
    PD_ClearCrashRecorder();
    S_wait_ms(2000);
 


	# read fault memory
    my $faultsBeforeStimulation = PD_ReadFaultMemory();
	
	#Fault memory must be empty
    my $faultsVerdict = PD_evaluate_faults( $faultsBeforeStimulation, []);
 	return 0 unless ($faultsVerdict eq 'VERDICT_PASS');


	
	return 1;
}

sub TC_stimulation_and_measurement {
	# S_w2rep("TC simulation and measurement: CA_write_can_signal : $tcpar_COMSignal and $tcpar_Faulty_value ");
	# COM_setSignalState($tcpar_COMSignal,$tcpar_Faulty_value,$tcpar_Protocol);
	# S_wait_ms(500);
	# S_user_action("check");
	# CA_write_can_signal( $tcpar_COMSignal,$tcpar_Faulty_value,'phys');
	# S_wait_ms(500);
	# S_user_action("check");
	# v_ChkError_b = getvalue(_enV_EGI040_ChksumError);
    # v_MsgCtrerror_b= getvalue(_enV_EGI040_MsgCtrError);
	
	 #--------------------------------------------------------------
    # PREPARE CRASH INJECTION AND REPORT FILES
    #    
    S_teststep("Prepare crash", 'AUTO_NBR');
    LC_ECU_Off();
    S_wait_ms('TIMER_ECU_OFF');

    # Prepare crash
    CSI_LoadCrashSensorData2Simulator($crashSettings);

    # Power ON the ECU
    LC_ECU_On();
    S_wait_ms('TIMER_ECU_READY');

	CSI_PrepareEnvironment( $crashSettings, 'before_crash_same_cycle','normal' );
    S_wait_ms(1000);
	####################################################
	
	
			
		
	
	my @quanh_msg_name = split ("_",$tcpar_COMSignal);
	$message_name = $quanh_msg_name[0];
	S_w2rep("Message name: $message_name");
	
	S_teststep("Create '$tcpar_Condition' for '$tcpar_COMSignal'", 'AUTO_NBR');
	if($tcpar_Condition eq 'Implausible')
	{
		S_w2rep("Send signal $tcpar_COMSignal with value $tcpar_Faulty_value", 'Pink');
		CA_write_can_signal( $tcpar_COMSignal,$tcpar_Faulty_value,'Hex');
		S_wait_ms(500);
		
	}
	elsif($tcpar_Condition eq 'UART_Error')
	{	
		S_w2rep("Send signal $tcpar_COMSignal with value $tcpar_Faulty_value", 'Pink');
		CA_set_EnvVar_value ( "_Env__MET390_FAIL_UART_WA_BOX",1 );
		CA_write_can_signal( $tcpar_COMSignal,$tcpar_Faulty_value,'Hex');
		S_wait_ms(500);
		S_user_action("UART_err");
	}
	elsif($tcpar_Condition eq 'Counter_Error')
	{
			CA_set_EnvVar_value ( "_enV_".$message_name."_MsgCtrError",1 );
			# S_user_action("COunter_err");
	}
	elsif($tcpar_Condition eq 'CRC_Error')
	{
	
		CA_set_EnvVar_value ( "_enV_".$message_name."_CheckSumError",1 );
	}	
	else {
		S_set_error(" Condition mentioned is incorrect, hence test case is aborted");
		return 1;
	}
	S_wait_ms(6000);
	# S_user_action('check fault');
	S_w2rep("Read fault ");
	PD_ReadFaultMemory(); 
	
	S_wait_ms(500);
	# S_teststep("Wait '$tcpar_TimeInvalidBeforeCrash_msec'", 'AUTO_NBR');
	# S_wait_ms($tcpar_TimeInvalidBeforeCrash_msec);

	S_teststep("Inject a Crash", 'AUTO_NBR');
	CSI_TriggerCrash();
	S_wait_ms(8000);
	
	# S_teststep("Wait '$tcpar_wait_ms'", 'AUTO_NBR');
	# S_wait_ms($tcpar_wait_ms);
	
	
	my $dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number()."_".$tcpar_Crashcode;
	
	S_w2rep("Store Trace");
	my $fileName = "$main::REPORT_PATH/".S_get_TC_number()."_LIFT_network_trace.asc";
	my $tracePath;
	$tracePath = CA_trace_store($fileName) if (lc($tcpar_Protocol) =~ m/can/i);
	$tracePath = FR_trace_store($fileName) if (lc($tcpar_Protocol) =~ m/flexray/i);
	GEN_printLink($tracePath);

	S_wait_ms(2000);

	# Restart measurement after storage
    CA_trace_start() if (lc($tcpar_Protocol) =~ m/can/i);
    FR_trace_start() if (lc($tcpar_Protocol) =~ m/flexray/i);
	

	$edrNumberOfEventsToBeStored = SYC_EDR_get_NumberOfEventsToBeStored();
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("Not available in SYC - add or overwrite with Custlibrary Function");
		return;
	}

	S_w2rep("edrNumberOfEventsToBeStored=$edrNumberOfEventsToBeStored");
	S_teststep("Read all EDR records", 'AUTO_NBR');
    PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');
	Prepertation();
	# S_wait_ms(500);
	S_wait_ms(1000);
	if ( lc( $tcpar_read_subaru) eq 'yes' ) {
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $SubaruEDR_diagType,
								"CrashLabel" =>$tcpar_Crashcode."_".$tcpar_COMSignal,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA')
	}
	if (lc($tcpar_read_CHINAEDR) eq 'yes'){
		$edrNumberOfEventsToBeStored=3;
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $ChinaEDR_diagType,
								"CrashLabel" => $tcpar_Crashcode."_".$tcpar_COMSignal,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA');
	}

	S_w2rep("Reset manipulated COM signals");
	if (defined $manipulatedCOMsignals){
		foreach my $manipulatedSignal (keys %{$manipulatedCOMsignals})
		{
			my $originalValue = $manipulatedCOMsignals -> {$manipulatedSignal};
			S_w2rep("manSignal =$manipulatedSignal,Data to be sent=$originalValue");
			COM_setSignalState($manipulatedSignal, $originalValue);
		}

	}
	return 1;
}

sub TC_evaluation {

	my $verdict_eval='VERDICT_PASS';
	my $FinalVerdict='VERDICT_PASS';
	my $edidValue;
	

	for(my $recordNumber = 1; $recordNumber <= $tcpar_expected_nr_of_records; $recordNumber++)
	{
		my $dataElement = $record_handler -> GetDataElementEDID(  "EDIDnr" => $tcpar_EDID,
																  "RecordNumber" => $recordNumber,
																  "CrashLabel" =>$tcpar_Crashcode."_".$tcpar_COMSignal);

		S_w2log(1, "--------------------");
		S_w2rep( "\tEDID $tcpar_EDID ($dataElement) validation",'teal');
		S_w2log(1, "--------------------");
		
		my $range_Exceeded_Upper_Boundary = $record_handler -> GetRange_Exceeded_Upper_Boundary("CrashLabel" => $tcpar_Crashcode."_".$tcpar_COMSignal, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID);
		my $range_Exceeded_Lower_Boundary = $record_handler -> GetRange_Exceeded_Lower_Boundary("CrashLabel" => $tcpar_Crashcode."_".$tcpar_COMSignal, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID);
		S_w2rep("range_Exceeded_Upper_Boundary for EDID: $range_Exceeded_Upper_Boundary");
		S_w2rep("range_Exceeded_Lower_Boundary for EDID: $range_Exceeded_Lower_Boundary");
		
		if (not defined $tcpar_COMSignalAfterInvalidState ){
			if($range_Exceeded_Upper_Boundary ne "NotSpecified" and $range_Exceeded_Lower_Boundary eq "NotSpecified")
			{
				S_w2rep("Quanhh run into this");
				$tcpar_COMSignalAfterInvalidState =$range_Exceeded_Upper_Boundary;
			}
			elsif($range_Exceeded_Upper_Boundary ne "NotSpecified" and $range_Exceeded_Lower_Boundary ne "NotSpecified")
			{
				if ($tcpar_Faulty_value  =~ /^-/){
					$tcpar_COMSignalAfterInvalidState=$range_Exceeded_Lower_Boundary;
				}
				else {
					$tcpar_COMSignalAfterInvalidState=$range_Exceeded_Upper_Boundary;
				}
			
			}
			elsif($range_Exceeded_Upper_Boundary eq "NotSpecified" and $range_Exceeded_Lower_Boundary eq "NotSpecified" and (not defined $tcpar_COMSignalAfterInvalidState)) {
				S_set_error(" Expected State 'COMSignalAfterInvalidState' is not given, test is aborted");
				return;
			}
		}
		
		S_teststep("EDID $tcpar_EDID ($dataElement) in record $recordNumber", 'AUTO_NBR', "read_edid_data_$recordNumber"); #measurement 1
		
		#### for Error signal 
		if ($tcpar_COMSignalAfterInvalidState =~ /0x/)
		{
			my $detectedEDIDvalue = $record_handler -> GetRawEdidDataSamples( "EDIDnr" => $tcpar_EDID,
                                               "RecordNumber" => $recordNumber,
                                               "CrashLabel" => $tcpar_Crashcode."_".$tcpar_COMSignal,
                                               "FormatOption" => "HEX");
											    # "FormatOption" => "DEC"
			unless(defined $detectedEDIDvalue) {
				S_set_error("No EDID data found for crash $tcpar_Crashcode, record $recordNumber. EDID cannot not be evaluated. Go to next record",110);
				return;
			}
			if (($tcpar_COMSignal eq 'MET390_6_0_SEATBELT_DRVR') or ($tcpar_COMSignal eq 'MET390_6_1_SEATBELT_PASS'))
			{
				$detectedEDIDvalue = "0x".$detectedEDIDvalue;
				$edidValue = $detectedEDIDvalue;
				$verdict_eval = EVAL_evaluate_value ( "EDID_$tcpar_EDID\_EvaluationSeatBelt", $detectedEDIDvalue,'==',$tcpar_COMSignalAfterInvalidState );
				
				
			}
			else
			{
				my$Quanhh_dumper =Dumper($detectedEDIDvalue);
				S_w2rep ("QUanhh write detectedEDIDvalue $tcpar_COMSignalAfterInvalidState : $Quanhh_dumper" );
				foreach my $edidValueInside (@{$detectedEDIDvalue})
				{
					$edidValueInside = "0x".$edidValueInside;
					$edidValue = $edidValueInside;
					$verdict_eval = EVAL_evaluate_value ( "EDID_$tcpar_EDID\_EvaluationError", $edidValueInside,'==',$tcpar_COMSignalAfterInvalidState );
					# $verdict_eval = EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $edidValue,$tcpar_COMSignalAfterInvalidState );
				}
			}
		}
		
		else { ## for Implausible
			S_w2rep("Quanh dump gia tri tcpar_COMSignalAfterInvalidState trong implausible $tcpar_COMSignalAfterInvalidState");
			my $QUanhh_record= Dumper($record_handler);
			S_w2rep("QUanhh write record $QUanhh_record");
			
			##QUanhh sua
			# my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $tcpar_Crashcode."_".$tcpar_COMSignal, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID );
			my $edidData = $record_handler -> GetRawEdidDataSamples( "EDIDnr" => $tcpar_EDID,
                                               "RecordNumber" => $recordNumber,
                                               "CrashLabel" => $tcpar_Crashcode."_".$tcpar_COMSignal,
                                               # "FormatOption" => "HEX"
											    "FormatOption" => "DEC");
			
			my $Quanhh_edidData = Dumper ( $edidData);
			S_w2rep ("Quanh write edidData: $Quanhh_edidData");
			
			# my $edidDataSamples = $edidData -> {"DataSamples"}; 
			my $edidDataSamples = $edidData; 

			# my $Quanhh_edidDatasample = Dumper ( $edidDataSamples);
			# S_w2rep ("Quanh write edidData: $Quanhh_edidDatasample");
						
			
			unless(defined $edidDataSamples) {
				S_set_error("No EDID data samples could be obtained for EDID $tcpar_EDID in record $recordNumber!", 110);
				next;
			}
			# foreach my $timeStampEDID (keys %{$edidDataSamples})
			# {
				# # get EDID value corresponding to time stamp
				# $edidValue = $edidDataSamples -> {$timeStampEDID};
			foreach my $edidValue ( @{$edidDataSamples})
			{
				my $QUanhh_dumper_2 = Dumper ($edidValue);
				S_w2rep ("QUanhh_dumper_2 for Implausible $QUanhh_dumper_2");
				
				if ($tcpar_COMSignalAfterInvalidState =~ /[a-zA-Z]/) {
					$verdict_eval = EVAL_evaluate_string ( "EDID_$tcpar_EDID\_EvaluationImplausibleHex", $tcpar_COMSignalAfterInvalidState, $edidValue );	
				}
				elsif (not $tcpar_COMSignalAfterInvalidState  =~ /[a-zA-Z]/) {
					$verdict_eval = EVAL_evaluate_value ( "EDID_$tcpar_EDID\_EvaluationImplausibleDec", $edidValue,'==',$tcpar_COMSignalAfterInvalidState );	
				}
			
			}
		}
		
		$FinalVerdict = 'VERDICT_FAIL' if $verdict_eval eq 'VERDICT_FAIL';	
		S_teststep_expected("EDID $tcpar_EDID ($dataElement) should be value: '$tcpar_COMSignalAfterInvalidState'", "read_edid_data_$recordNumber");			#evaluation 1
		S_teststep_detected("EDID $tcpar_EDID ($dataElement) is value:'$edidValue'", "read_edid_data_$recordNumber");
	}

	return 1;
}

sub TC_finalization {
	  S_w2rep("Reset manipulated COM signals");
	if($tcpar_Condition eq 'Implausible')
	{
			CA_write_can_signal( $tcpar_COMSignal,0,'phys');
	S_wait_ms(500);
		
	}
	elsif($tcpar_Condition eq 'UART_Error')
	{
		CA_set_EnvVar_value ( "_Env__MET390_FAIL_UART_WA_BOX",0 );
	}
	elsif($tcpar_Condition eq 'Counter_Error')
	{
		CA_set_EnvVar_value ( "_enV_".$message_name."_MsgCtrError",0 );
	}
	elsif($tcpar_Condition eq 'CRC_Error')
	{
		
		CA_set_EnvVar_value ( "_enV_".$message_name."_CheckSumError",0);
	}	
	else {
		S_set_error(" Condition mentioned is incorrect, hence test case is aborted");
		return 1;
	}
	
	foreach my $recordNbr (1..$edrNumberOfEventsToBeStored){
        $record_handler -> DeleteRecord(  "CrashLabel" =>  $tcpar_Crashcode."_".$tcpar_COMSignal,
                                          "RecordNumber" => $recordNbr );
    }		
	
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashTimeZero',
     								 "CrashLabel"  => $tcpar_Crashcode  ); 
	
	$crash_handler -> DeleteSource ( "SourceLabel" => 'MDB_Path',
     								 "CrashLabel"  => $tcpar_Crashcode  ); 
     								
	$crash_handler -> DeleteSource ( "SourceLabel" => 'CrashCode_MDS',
     								 "CrashLabel"  => $tcpar_Crashcode  ); 
	# Erase EDR
	PD_ClearCrashRecorder_NOERROR();
	S_wait_ms(2000);

	# Erase Fault memory
	PD_ClearFaultMemory();
	S_wait_ms(2000);
	GDCOM_request ('31 01 30 00', '', 'relax');
	S_wait_ms(3000);

	# Read fault memory after clearing and erasing EDR
	PD_ReadFaultMemory();   

	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
	return 1;
}


# sub Prepare_Crash_Injection{

	# my @CrashInput = @_;
	# my $Crashcode = @CrashInput[0];
	# my $CrashTimeZero = 0;

	# S_teststep_2nd_level("Inject a Crash '$Crashcode'", 'AUTO_NBR');
	# #--------------------------------------------------------------
    # # GET CRASH DETAILS
    # #    
	# # Crash name or index and result DB from EDR mapping
    # $crashDetails_href = $mappingEDR -> {'CRASHFILES'}{$Crashcode};
    # unless(defined $crashDetails_href) {
        # $crashDetails_href = {'RESULTDB' => $tcpar_ResultDB, 'CRASHNAME' => $Crashcode};
    # }
	# # Crash settings
	# $crashSettings = CSI_GetCrashDataFromMDS($crashDetails_href);
	# unless(defined $crashSettings) {
		# S_set_error("Crash code $Crashcode not defined in given result DB. Test case will be aborted.");
		# return 0;
	# }
	
		
	# # Crash code in World DB
	# $crash_handler -> AddCrashSource( "CrashLabel" => $Crashcode,
	    								  # "SourceLabel" => 'CrashCode_MDS', 
	                                      # "OriginalSourceData" => $Crashcode );

    # $crashInfo_href -> {"CrashCode_MDS"} = $Crashcode;

	# # Name of Result DB
	# my $resultDB = $crashDetails_href -> {"RESULTDB"};
	# unless(defined $resultDB) {
		# $resultDB = "DEFAULT";
	# }

	# # Result DB path
	# my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$resultDB" ] );
	
	# # Set environment settings for crash
	# CSI_PrepareEnvironment($crashSettings, 'init_complete');
	# S_wait_ms('TIMER_ECU_READY');
	# #--------------------------------------------------------------
    # # CRASH PREPARATION
    # #
    # S_w2rep("Prepare crash (download crash data)");
	# # LC_ECU_Off();
	# # S_wait_ms('TIMER_ECU_OFF');

	# # Prepare crash
	# my $crashDuration_ms = $crashSettings -> {'METADATA'} -> {'CRASHDURATION_MS'};
	# # Crash duration
	# # $crash_handler -> AddCrashSource( "CrashLabel" => $Crashcode,
	    							  # # "SourceLabel" => 'CrashDuration', 
	                                  # # "OriginalSourceData" => $crashDuration_ms,
									  # # "SourceUnit" => 'ms'  );
	# # my $a;
	# # $a = Dumper($crash_handler->{SourceList});
	# # S_w2rep("Dump sourceList truoc khi add $a");

	# $crash_handler -> AddCrashSource( "CrashLabel" => $Crashcode,
	    							  # "SourceLabel" => 'Crash_Time_Zero', 
	                                  # "OriginalSourceData" => $CrashTimeZero,
									  # "SourceUnit" => 'ms'  );
	# # $a = Dumper($crash_handler->{SourceList});
	# # S_w2rep("Dump sourceList truoc sau khi add $a");

											
	# CSI_LoadCrashSensorData2Simulator( $crashSettings )unless $main::opt_offline;

	# # Power ON the ECU
	# # LC_ECU_On();
 	# # S_wait_ms('TIMER_ECU_READY');
 	
    # CSI_PrepareEnvironment( $crashSettings, 'before_crash_same_cycle','normal' );
    # S_wait_ms(2000);
	
	# # if ($Crashcode eq 'Single_EDR_Rollover_Inflatable')
	# # {	
		# # S_wait_ms(20000);
	# # }
	# # else
	# # {
		# # S_wait_ms(10000);
	# # }
	
	
	# return 1;
# }


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
1;
