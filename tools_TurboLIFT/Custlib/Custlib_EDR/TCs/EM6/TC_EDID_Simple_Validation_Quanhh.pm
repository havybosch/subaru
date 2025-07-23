#### TEST CASE MODULE
package TC_EDID_Simple_Validation_Quanhh;

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

require LIFT_PD2ProdDiag; 

use constant MILLISEC_TO_SECOND => 0.001;
use constant SECOND_TO_MILLISEC => 1000;

##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_Simple_Validation

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Activate EDR functionality


I<B<Stimulation and Measurement>>

1. Inject a Crash <Crashcode>

2.Read EDR

3. Read  <EDID>


I<B<Evaluation>>

1. -

2.<ExpectedNbrOfRecords> should be observed.

3. <ExpectedValue_Decoded>  should have data as per the Crash injected


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Crashcode' => if not given, all stored records will be evaluated
	HASH 'ExpectedValue_Decoded' => can also be a scalar if there is only one record or expected value is the same for all records
	HASH 'ExpectedValue_Raw' => can also be a scalar if there is only one record or expected value is the same for all records
	SCALAR 'EvalTolerance_abs' => 
	SCALAR 'purpose' => purpose of test case
	SCALAR 'EDID' => 
	SCALAR 'ExpectedNbrOfRecords' => 
	SCALAR 'EvalOperator' => check EDR_Eval_evaluate_EDID_Decoded and EDR_Eval_evaluate_EDID_Raw_Hex for options


=head2 PARAMETER EXAMPLES

	purpose = 'To EDID TEnd which indicates timing of event end relative to T0'
	EDID = 2055
	ExpectedNbrOfRecords = 1 # optional
	Crashcode = 'Single_EDR_Side_above_8kph_NoDeployment;5' # optional
	ExpectedValue_Decoded = %('Record_1' => 32)
	EvalTolerance_abs = 3
	EvalOperator = '>'

	purpose = 'To EDID TEnd which indicates timing of event end relative to T0'
	EDID = 2055
	ExpectedNbrOfRecords = 1 # optional
	Crashcode = 'Single_EDR_Side_above_8kph_NoDeployment;5' # optional
	ExpectedValue_Raw = 32
	EvalOperator = '==' 
	
=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'read_CHINAEDR' => 
	SCALAR 'ExpectedNbrOfRecords' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To validate EDID which indicates <Test Heading 1>'
	#'Enable CHINA EDR',’Disable UN Series0 EDR’, ’Disable UN Series1 EDR’  
	read_CHINAEDR = 'yes'
	ExpectedNbrOfRecords = 1
	#Note: expected value is only applicable  for CA project
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_read_CHINAEDR;
my $tcpar_ExpectedNbrOfRecords;

my $tcpar_EDID;
my $tcpar_Crashcode;
my $tcpar_ExpectedValue_Decoded;
my $tcpar_EvalTolerance_abs;
my $tcpar_ExpectedValue_Raw;
my $tcpar_EvalOperator;
my $tcpar_read_NHTSAEDR ;
my  $tcpar_ECU_InforValue;
my $tcpar_Crashtype;

my $tcpar_DiagType = 'ProdDiag';
my $tcpar_ResultDB = 'EDR';
my $tcpar_StorageOptions_href;
my $tcpar_Protocol;
my $tcpar_CrashTimeZero_ms;
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

my $tcpar_value_max;
my $tcpar_value_min;
################ global parameter declaration ###################
#add any global variables here

my (
		$record_handler,
		$crash_handler,
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
		$Response_HW,
		$Response_SERI,
		$Response_SW,
		$Expected_HW,
		$Expected_SERI,
		$Expected_SW,
		
		
		
	);


my $default_VIN = "2E F1 90 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00";
my $default_HW = "00 00 00 00 00 00 00 00 00 00";
my $default_SW = "00 00 00 00 00";
my $default_SerialNumber = "00 00 00 00 00 00 00 00 00 00 00";

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_read_CHINAEDR =  GEN_Read_mandatory_testcase_parameter( 'read_CHINAEDR' );
	$tcpar_ExpectedNbrOfRecords =  GEN_Read_mandatory_testcase_parameter( 'ExpectedNbrOfRecords' );
	$tcpar_EDID =  S_read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_ExpectedNbrOfRecords =  S_read_optional_testcase_parameter( 'ExpectedNbrOfRecords' );
	if(not defined $tcpar_ExpectedNbrOfRecords){
		$tcpar_ExpectedNbrOfRecords = SYC_EDR_get_NumberOfEventsToBeStored();
	}
	$tcpar_Crashcode =  S_read_optional_testcase_parameter( 'Crashcode');
	$tcpar_ExpectedValue_Decoded =  S_read_optional_testcase_parameter( 'ExpectedValue_Decoded','byref' );
	$tcpar_ExpectedValue_Raw =  S_read_optional_testcase_parameter( 'ExpectedValue_Raw','byref' );
	$tcpar_EvalTolerance_abs =  S_read_optional_testcase_parameter( 'EvalTolerance_abs' );
	$tcpar_EvalOperator =  S_read_optional_testcase_parameter( 'EvalOperator' );
	$tcpar_EvalOperator = '==' if(not defined $tcpar_EvalOperator);
	if ((not defined $tcpar_ExpectedValue_Decoded) and (not defined $tcpar_ExpectedValue_Raw)){
		S_set_error(" Missing parameter 'ExpectedValue_Decoded' or 'ExpectedValue_Raw'");
		return 1;
	}
	$tcpar_ECU_InforValue =  S_read_optional_testcase_parameter( 'ECU_InforValue' );
	$tcpar_read_NHTSAEDR = S_read_optional_testcase_parameter('read_NHTSAEDR');
	$tcpar_Protocol = S_read_optional_testcase_parameter('Protocol');
	$tcpar_read_SUBARU = S_read_optional_testcase_parameter('read_SUBARU');
	
    $tcpar_FD_Variables_aref = S_read_optional_testcase_parameter( 'FD_Variables', 'byref');
    $tcpar_value_max= S_read_optional_testcase_parameter( 'value_max');
    $tcpar_value_max= '500' if (not defined $tcpar_value_max);
    $tcpar_value_min= S_read_optional_testcase_parameter( 'value_min');
    $tcpar_value_min= '0' if (not defined $tcpar_value_min);
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

	return 1;
}

sub TC_initialization {

# INITIALIZE RECORD AND CRASH HANDLER
    #    
	S_w2rep("Initialize Record and Crash Handler");
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;
	
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

	
	###################### PREPARE DEFAULT DATA
	
	if ($tcpar_EDID eq '4014')
	{
		Prepertation();
		S_w2rep("Prepare VIN DATA with $default_VIN", 'AUTO_NBR');
		GDCOM_request($default_VIN, '6E F1 90', 'relax' );
		S_wait_ms(500);
		
		S_w2rep("READ VIN DATA", 'AUTO_NBR');
		my $test = GDCOM_request( '22 F1 90', '62 F1 90', 'relax' );
		S_wait_ms(500);
	}
	elsif ($tcpar_EDID eq '4015')
	{
		S_w2rep("Prepare HW DATA with value $default_HW", 'AUTO_NBR');
		my @value = split(' ',$default_HW);

		PD_WriteNVMSection("swv_CustECUParNumber",\@value);
		S_wait_ms(500);
		
		Prepertation();
		
		S_teststep_2nd_level("Read Vehicle ManufactureECUHardwareNumberDataIdentifier after write", 'AUTO_NBR');
		GDCOM_request('22 F1 8E', '62 F1 8E', 'relax' );
	}
	elsif ($tcpar_EDID eq '4016')
	{
		S_w2rep("Prepare Serial SW DATA with value $default_SerialNumber", 'AUTO_NBR');
		my @value = split(' ',$default_SerialNumber);

		PD_WriteNVMSection("swv_CustECUSerialNumber",\@value);
		S_wait_ms(500);

		Prepertation();
		
		S_teststep_2nd_level("Read ECU Serial Number Data Identifier after write", 'AUTO_NBR');
		$Response_SERI = GDCOM_request('22 10 5F', '62 10 5F', 'relax' );
		S_wait_ms(200);
	}
	elsif ($tcpar_EDID eq '4017')
	{
		S_teststep("5. Write SW Part Number data with value as '$default_SW'", 'AUTO_NBR');
		my @value = split(' ',$default_SW);
		
		PD_WriteNVMSection("swv_CustECUSoftwarenumber",\@value);
		S_wait_ms(500);

		Prepertation();
		
		S_teststep_2nd_level("Read ECUSoftware Number DataIdentifier after write", 'AUTO_NBR');
		$Response_SW = GDCOM_request('22 F1 82', '62 F1 82', 'relax' );
		S_wait_ms(200);
	}
	
	return 1;
}

sub TC_stimulation_and_measurement {

	
  	
	if ($tcpar_EDID eq '4014')
	{
		Prepertation();
		# WRITE VIN
		S_teststep("Send request 'WriteDataByIdentifier_VIN' with '$tcpar_ECU_InforValue'.", 'AUTO_NBR');			
		GDCOM_request('2E F1 90 '.$tcpar_ECU_InforValue,'6E F1 90', 'relax');
		S_wait_ms(500);
		
		#READ VIN
		S_teststep_2nd_level("Read VIN after write", 'AUTO_NBR');
		$response_value = GDCOM_request( '22 F1 90', '62', 'relax' );
		S_wait_ms(500);

		my @value = split(' ',$response_value);
		my $count = 0;
		my @array;
		foreach my $var (@value)
		{
			if ($count >=3)
			{
				# S_w2rep("@value[$count]",(@value[$count]));
				push(@array, @value[$count]);			
			}
			$count ++;
		
		}

		my $stringVIN = join('',@array);
		$Expected_value = "0x".$stringVIN;
		S_w2rep("Expected VIN: $Expected_value");
	}
	elsif ($tcpar_EDID eq '4015')
	{
		HW($tcpar_ECU_InforValue);
	}
	elsif ($tcpar_EDID eq '4016')
	{
		Serial_Number($tcpar_ECU_InforValue);
	}
	elsif ($tcpar_EDID eq '4017')
	{
		SW($tcpar_ECU_InforValue);
	}
	S_teststep("Inject a Crash '$tcpar_Crashcode'", 'AUTO_NBR');
	Crash_Injection($tcpar_Crashcode);
	S_wait_ms(10000);
	
	Prepertation();
	
	S_teststep("Read EDR record", 'AUTO_NBR');			#measurement 3
	ReadAndStoreRecord($tcpar_Crashcode);
	
	return 1;

}

sub TC_evaluation {

	SystemEDID_Evaluate(1,$tcpar_EDID,$Expected_value,$tcpar_Crashcode);
	
	return 1;
}

sub TC_finalization {
	S_w2rep("Remove condition");
	
	foreach my $recordNbr (1..$tcpar_ExpectedNbrOfRecords)
	{
		$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNbr);
				$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode."CHINA", "RecordNumber" => $recordNbr);
                $record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode."_Supplier", "RecordNumber" => $recordNbr);
	}
	S_w2rep("Clean up record ...");
	$record_handler -> DeleteAllRecords(); 

	$crash_handler -> DeleteAllSources ( "SourceLabel" => 'CrashCode_MDS',
							 "CrashLabel"  => $tcpar_Crashcode );
	$crash_handler -> DeleteAllSources ( "SourceLabel" => 'CrashDuration',
								 "CrashLabel"  => $tcpar_Crashcode  );						 

	
	
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


sub HW {
	my $value = shift;
	S_teststep("Write HW Part Number data with value as '$value'", 'AUTO_NBR');
	my @value = split(' ',$value);
	PD_WriteNVMSection("swv_CustECUParNumber",\@value);
	S_wait_ms(500);
	
	Prepertation(); 
	
	S_teststep_2nd_level("Read Vehicle ManufactureECUHardwareNumberDataIdentifier after write", 'AUTO_NBR');
	$Response_HW = GDCOM_request('22 F1 8E', '62 F1 8E', 'relax' );
	S_wait_ms(200);
	
	my @value_result = split(' ',$Response_HW);
	my $count = 0;
	my @array;
	foreach my $var (@value_result)
	{
		if ($count >=3)
		{
			# S_w2rep("@value[$count]",(@value[$count]));
			push(@array, @value_result[$count]);			
		}
		$count ++;
	
	}

	# S_w2rep("output: @array");
	my $stringHW = join('',@array);
	# S_w2rep("string: $stringHW");
	my $Value_padding = '0x202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
	$Expected_value = "$Value_padding"."$stringHW";
	S_w2rep("Expected HW number: $Expected_value");
}

sub Serial_Number {
	my $value = shift;
	S_teststep("Write Serial Part Number data with value as '$value'", 'AUTO_NBR');
	my @value = split(' ',$value);

	PD_WriteNVMSection("swv_CustECUSerialNumber",\@value);
	S_wait_ms(500);

	Prepertation();
	
	S_teststep_2nd_level("Read ECU Serial Number Data Identifier after write", 'AUTO_NBR');
	$Response_SERI = GDCOM_request('22 10 5F', '62 10 5F', 'relax' );
	S_wait_ms(200);
	my @value = split(' ',$Response_SERI);
	my $count = 0;
	my @array;
	foreach my $var (@value)
	{
		if ($count >=3)
		{
			# S_w2rep("@value[$count]",(@value[$count]));
			push(@array, @value[$count]);			
		}
		$count ++;
	
	}

	# S_w2rep("output: @array");
	my $stringSERI = join('',@array);
	# S_w2rep("string: $stringSERI");
	my $Value_padding = '0x2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
	$Expected_value = "$Value_padding"."$stringSERI";
	S_w2rep("Expected SERI: $Expected_value");
	
}

sub SW {
	my $value = shift;
	S_teststep("5. Write SW Part Number data with value as '$value'", 'AUTO_NBR');
	my @value = split(' ',$value);
	
	PD_WriteNVMSection("swv_CustECUSoftwarenumber",\@value);
	S_wait_ms(500);

	Prepertation();
	
	S_teststep_2nd_level("Read ECUSoftware Number DataIdentifier after write", 'AUTO_NBR');
	$Response_SW = GDCOM_request('22 F1 82', '62 F1 82', 'relax' );
	S_wait_ms(200);
	
	my @value = split(' ',$Response_SW);
	my $count = 0;
	my @array;
	foreach my $var (@value)
	{
		if ($count >=3)
		{
			# S_w2rep("@value[$count]",(@value[$count]));
			push(@array, @value[$count]);			
		}
		$count ++;
	
	}

	# S_w2rep("output: @array");
	my $stringSW = join('',@array);
	# S_w2rep("string: $stringSW");
	my $Value_padding = '0x2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
	$Expected_value = "$Value_padding"."$stringSW";
	S_w2rep("Expected SW: $Expected_value");
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
####Evaluate EDID
sub SystemEDID_Evaluate {

	# my @inputValue = @_;
	my $Buffer = shift;
	my $EDID = shift;
	my $ExpectedSystemValue = shift;
	my $Crashcode = shift;
	# S_w2rep("ExpectedSystemValue value is: $ExpectedSystemValue");
	if (defined $ExpectedSystemValue)
	{
		my $thisRecordExpectedValue;
		if(ref($ExpectedSystemValue) eq 'HASH'){
			$thisRecordExpectedValue = $ExpectedSystemValue->{"Record_$Buffer"};
		}
		else{
			$thisRecordExpectedValue = $ExpectedSystemValue;
		}
		S_teststep("Validate EDID $EDID after for crash $Crashcode", 'AUTO_NBR');       #evaluation 1
		EDR_Eval_evaluate_EDID_Raw ("EDIDnr" => $EDID,
						"RecordNumber" => $Buffer,
						"CrashLabel" => $Crashcode,
						"Expected_Raw_Hex" => $thisRecordExpectedValue,
						"EvalOperator" => $tcpar_EvalOperator);
	}
	

	return 1;
}



######## Inject Crash

sub Crash_Injection{

	my @CrashInput = @_;
	my $Crashcode = @CrashInput[0];

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
	$crash_handler -> AddCrashSource( "CrashLabel" => $Crashcode,
	    							  "SourceLabel" => 'CrashDuration', 
	                                  "OriginalSourceData" => $crashDuration_ms,
									  "SourceUnit" => 'ms'  );
											
	CSI_LoadCrashSensorData2Simulator( $crashSettings )unless $main::opt_offline;

	# Power ON the ECU
	# LC_ECU_On();
 	# S_wait_ms('TIMER_ECU_READY');
 	
    CSI_PrepareEnvironment( $crashSettings, 'before_crash_same_cycle','normal' );
    S_wait_ms(2000);

 
	CSI_TriggerCrash();
	S_wait_ms(10000);
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

##Store data
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
	
	if ( lc( $tcpar_read_NHTSAEDR) eq 'yes' ) {
		S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored");
		EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								"CrashLabel" => $Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath, 
								"read_EDRType"=>'NHTSA')
	}
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

sub EDR_Eval_evaluate_EDID_Raw {
#-------------------------------------------------------------------------------
    my @args = @_;
    my $params = { @args };

    S_w2log(3, "Starting EDR_Eval_evaluate_EDID...");

    #-------------------------------------------------
    # CHECK MANDATORY PARAMETERS
    #
    unless( defined $params->{EDIDnr} ){
        S_set_error(" EDID Number is missing!", 110);
        return;
    }

    unless( defined $params->{RecordNumber} ){
        S_set_error("Record Number is missing!", 110);
        return;
    }

    unless( defined $params->{CrashLabel} ){
        S_set_error("CrashLabel is missing!", 110);
        return;
    }

    unless( defined $params->{Expected_Raw_Hex} ){
        S_set_error("Expected value for EDID is missing!", 110);
        return;
    }

    unless( defined $params->{EvalOperator} ){
        $params->{EvalOperator} = '==';
    }
    
    if($params->{EvalOperator} eq 'or' and not defined $params->{Expected_Raw_Hex_Alternative}){
        S_set_error("For evaluation operator 'or', the parameter 'Expected_Raw_Hex_Alternative' is required!", 110);
        return;
    }

    # GET DETECTED VALUE
	my $edid = $params->{EDIDnr};
	my $dataElement = $record_handler -> GetDataElementEDID( "EDIDnr" => $edid,
                                                            "RecordNumber" => $params->{RecordNumber},
                                                            "CrashLabel" => $params->{CrashLabel});

	my $recordNbr = $params->{RecordNumber};
		S_teststep("Read EDID '$edid' ($dataElement) in record $recordNbr", 'AUTO_NBR', "EDID_$edid\_record_$recordNbr");
    my $detected_Value_RawHex_Projectaref = $record_handler -> GetRawEDID("EDIDnr" => $edid,
                                                   	 "RecordNumber" => $recordNbr,
													 "CrashLabel" => $params->{CrashLabel},
													 "FormatOption" => "HEX");

    unless(defined $detected_Value_RawHex_Projectaref) {
        S_w2rep("No EDID data found for crash $params->{CrashLabel}, record $recordNbr. EDID cannot not be evaluated.");
        return;
	}

	my $detected_Value_RawHex;

	if(ref $detected_Value_RawHex_Projectaref eq 'ARRAY') 
	{
		my $detectedEDIDvalueString;
		foreach my $hexElement (@{$detected_Value_RawHex_Projectaref})
		{
			$detectedEDIDvalueString .= $hexElement;
		}
		$detected_Value_RawHex = $detectedEDIDvalueString;
	}
	else
	{ # scalar values
		$detected_Value_RawHex = $detected_Value_RawHex_Projectaref;
	}
	$detected_Value_RawHex = '01' if ($main::opt_offline);
	$detected_Value_RawHex = "0x".$detected_Value_RawHex;
	

    # EVALUATE EXPECTED <=> DETECTED
    my $verdict;
    if($params->{EvalOperator} eq 'or')
	{
        S_teststep_expected("$params->{Expected_Raw_Hex} or $params->{Expected_Raw_Hex_Alternative}", "EDID_$edid\_record_$recordNbr" ); #evaluation
        S_teststep_detected("$detected_Value_RawHex", "EDID_$edid\_record_$recordNbr" );    
        my $verdictValue1 = EVAL_evaluate_value_NOVERDICT( "EDID_$edid\_Evaluation", $detected_Value_RawHex, '==' , $params->{Expected_Raw_Hex} );
        my $verdictValue2 = EVAL_evaluate_value_NOVERDICT( "EDID_$edid\_Evaluation", $detected_Value_RawHex, '==' , $params->{Expected_Raw_Hex_Alternative} );
        if($verdictValue1 eq VERDICT_PASS or $verdictValue2 eq VERDICT_PASS){
            S_set_verdict(VERDICT_PASS);
        }
        else
		{
            S_set_verdict(VERDICT_FAIL);            
        }
    }
	else
	{
		S_teststep_expected("$params->{Expected_Raw_Hex}", "EDID_$edid\_record_$recordNbr" ); #evaluation
		S_teststep_detected("$detected_Value_RawHex ", "EDID_$edid\_record_$recordNbr" );
		$verdict = EVAL_evaluate_string ( "EDID_$edid\_Evaluation", $params->{Expected_Raw_Hex},$detected_Value_RawHex);#
		
	}


	if(S_get_exec_option_NOERROR('CreisOfflineEvalReporting')){
		my $expectedValue;
		if($params->{EvalOperator} eq '!='){
			$expectedValue = "!= ".$params->{Expected_Raw_Hex};
		}
		elsif($params->{EvalOperator} eq '!='){
			$expectedValue = $params->{Expected_Raw_Hex}." or ". $params->{Expected_Raw_Hex_Alternative};
		}
		else{
			$expectedValue = $params->{Expected_Raw_Hex};
		}

		FLEDR_XML_addStaticEdidNode(
				$recordNbr, # record number
				'Misc_Static',
				$edid,
				$dataElement,
				$expectedValue,
				$detected_Value_RawHex,
				'n/a',
				'n/a',
				$verdict,
		);
    }

	return $verdict;
}
1;
