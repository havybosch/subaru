#### TEST CASE MODULE
package TC_EDID_Autarky_Validation;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs/TCs_Project/CNEDR/TC_EDID_Autarky_Validation.pm 1.1 2020/12/16 18:07:43ICT Nguyen Thi Ngoc Tuyen (RBVH/EPS21) (UTN3HC) develop  $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS name> (e.g. TS_SWM_SwitchMgt)
#TS version in DOORS: <TS version based on which this script is written/updated> (e.g. 3.30)
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here
use LIFT_evaluation;
use FuncLib_SYC_INTERFACE;
use FuncLib_EDR_Framework;
use LIFT_crash_simulation;
use LIFT_labcar;
use LIFT_PD;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use GENERIC_DCOM;
use LIFT_can_access;
use FuncLib_TNT_SYC_INTERFACE;
use Data::Dumper;
##################################

our $PURPOSE = "To validate EDR data recording under Autarky condition";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_Autarky_Validation

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1. StandardPrepNoFault

2. Write VIN data with value as <VIN_Value>

3. Write HW Part Number data with value as <HWPartNumber_Value>

4. Write Serial Part Number data with value as <SerialPartNumber_Value>

5. Write SW Part Number data with value as <SWPartNumber_Value>

6. Set  IGN cycle <IGN_Variable> to <Value_UB>,<Value_HB>,<Value_MB>,<Value_LB>

7. Set the <COMSignals> signal to value <COM_Precondition1>

8. Inject <CrashPrecondition1> if precondition <PreCrash1> equal 'Yes'

9. Read data and store All Records

10. Set the <COMSignals> signal to value <COM_Precondition2>

11. Inject <CrashPrecondition2> if precondition <PreCrash2> equal 'Yes'

12. Read data and store All Records

13. Set the <COMSignals> signal to value <COM_Precondition3>

14. Inject <CrashPrecondition3> if precondition <PreCrash3> equal 'Yes'

15. Read data and store All Records


I<B<Stimulation and Measurement>>

1. Set the <COMSignals> signal to value <COM_Value>

2. If <Autarky> is 'Before', power OFF then wait for <WaitTime>

3. Inject a Crash <Crashcode>

4. If <Autarky> is 'After', power OFF then wait for <WaitTime>

5. Power ON, wait for 5s.

6. Read <EDIDs> value 


I<B<Evaluation>>

1. -

2. -

3. -

4. -

5. -

6. COMSignalValue corresponding to COMSignalState should be reported


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Protocol' => 
	SCALAR 'read_CHINAEDR' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 
	SCALAR 'Autarky' => 
	SCALAR 'WaitTime' => 
	SCALAR 'PreCrash1' => 
	SCALAR 'PreCrash2' => 
	SCALAR 'PreCrash3' => 
	LIST 'COM_Precondition1' => 
	LIST 'COM_Precondition2' => 
	LIST 'COM_Precondition3' => 
	LIST 'PreconditionValue1' => 
	LIST 'PreconditionValue2' => 
	LIST 'PreconditionValue3' => 
	LIST 'COMSignals' => 
	HASH 'COM_Value' => 
	HASH 'ExpectedCOMSignalData' => 
	SCALAR 'VIN_Value' => 
	SCALAR 'ExpectedVIN' => 
	SCALAR 'HWPartNumber_Value' => 
	SCALAR 'ExpectedHWPartNumber' => 
	SCALAR 'SerialPartNumber_Value' => 
	SCALAR 'ExpectedSerialPartNumber' => 
	SCALAR 'SWPartNumber_Value' => 
	SCALAR 'ExpectedSWPartNumber' => 
	SCALAR 'IGN_Variable' => 
	SCALAR 'Variable_IgnitionCycle_LowByte' => 
	SCALAR 'Variable_IgnitionCycle_HighByte' => 
	SCALAR 'Value_UB' => 
	SCALAR 'Value_HB' => 
	SCALAR 'Value_MB' => 
	SCALAR 'Value_LB' => 
	LIST 'EDIDs' => 
	SCALAR 'CrashPrecondition1' => 
	SCALAR 'CrashPrecondition2' => 
	SCALAR 'CrashPrecondition3' => 
	SCALAR 'Crashcode' => 
	SCALAR 'ExpectedNbrOfRecords' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To validate EDR data recording under Autarky condition'
	Protocol = 'CAN' 
	read_CHINAEDR = 'yes'
	DiagType = 'ProdDiag'
	ResultDB = 'EDR'
	Autarky = '<Test Heading 1>'
	WaitTime = '<Test Heading 2>'
	PreCrash1 = '<Test Heading 3>'
	PreCrash2 = '<Test Heading 4>'
	PreCrash3 = '<Test Heading 5>'
	COM_Precondition1 = @('0', '0', '0', '0', '0', '0')
	COM_Precondition2 = @('1', '1', '1', '1', '100', '1')
	COM_Precondition3 = @('2', '2', '2', '2', '200', '2')
	PreconditionValue1 = @('0x00', '0xFE', '0xFE', '0x00', '0x00', '0x00')
	PreconditionValue2 = @('0x01', '0x00', '0x01', '0x01', '0x01', '0x01')
	PreconditionValue3 = @('0x02', '0x01', '0x00', '0x02', '0x02', '0x02')
	COMSignals = @('VehicleSpeedDisplayedinkmh', 'BrakeInfoStatus', 'DriverSafetyBeltBuckleState', 'RawSensor', 'EngineRPM', 'EngineThrottlePosition')
	COM_Value = @('100', '1', '1', '50', '500', '99')
	ExpectedCOMSignalData = @('0x64', '0x00', '0x01', '0x32', '0x05', '0x63')
	VIN_Value = 'BB BB BB BB BB BB BB BB BB BB BB BB BB BB BB BB BB'
	ExpectedVIN = '0xBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB'
	HWPartNumber_Value = '01 02 03 04 05 06 07 08 09 01 01 09 08 07 06 05 04 03 02 08'
	ExpectedHWPartNumber = '0x20202020202020202020202020202020202020202020202020202020202020202020202020202020202020200102030405060708090101090807060504030208'
	SerialPartNumber_Value = '01 02 03 04 05 06 07 08 09 01 10 90 80 70 60 50 40 30 20 16'
	ExpectedSerialPartNumber = '0x20202020202020202020202020202020202020202020202020202020202020202020202020202020202020200102030405060708090110908070605040302016'
	SWPartNumber_Value = '11 12 18 18 18 18 18 18 18 18 18 18 01 02 03 04 05 06 07 08 09 01 10 90 80 70 60 50 40 30 20 15'
	ExpectedSWPartNumber = '0x20202020202020202020202020202020202020202020202020202020202020201112181818181818181818180102030405060708090AA0908070605040302015'
	IGN_Variable = 'rb_tim_EcuOnTimeDataEe_st.POnCounter_u32'
	Variable_IgnitionCycle_LowByte = 'rb_tim_EcuOnTimeDataEe_st(0)'
	Variable_IgnitionCycle_HighByte = 'rb_tim_EcuOnTimeDataEe_st(1)'
	Value_UB = '00'
	Value_HB = '00' 
	Value_MB = '00' 
	Value_LB = '01'
	EDIDs = @('4005', '4006', '4007', '4008', '4009', '4010', '4011', '4012','4013','4014','4015','4016','4017')
	CrashPrecondition1 = 'Single_EDR_Front_above_8kph_NoDeployment;5'
	CrashPrecondition2 = 'NA'
	CrashPrecondition3 = 'NA'
	Crashcode = 'Single_EDR_Rollover_Inflatable'
	ExpectedNbrOfRecords = 2
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Protocol;
my $tcpar_read_CHINAEDR;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_Autarky;
my $tcpar_WaitTime;
my $tcpar_PreCrash1;
my $tcpar_PreCrash2;
my $tcpar_PreCrash3;
my $tcpar_COM_Precondition1;
my $tcpar_COM_Precondition2;
my $tcpar_COM_Precondition3;
my $tcpar_PreconditionValue1;
my $tcpar_PreconditionValue2;
my $tcpar_PreconditionValue3;
my $tcpar_COMSignals;
my $tcpar_COM_Value;
my $tcpar_ExpectedCOMSignalData;
my $tcpar_VIN_Value;
my $tcpar_ExpectedVIN;
my $tcpar_HWPartNumber_Value;
my $tcpar_ExpectedHWPartNumber;
my $tcpar_SerialPartNumber_Value;
my $tcpar_ExpectedSerialPartNumber;
my $tcpar_SWPartNumber_Value;
my $tcpar_ExpectedSWPartNumber;
my $tcpar_IGN_Variable;
my $tcpar_Variable_IgnitionCycle_LowByte;
my $tcpar_Variable_IgnitionCycle_HighByte;
my $tcpar_Value_UB;
my $tcpar_Value_HB;
my $tcpar_Value_MB;
my $tcpar_Value_LB;
my $tcpar_EDIDs;
my $tcpar_CrashPrecondition1;
my $tcpar_CrashPrecondition2;
my $tcpar_CrashPrecondition3;
my $tcpar_Crashcode;
my $tcpar_ExpectedNbrOfRecords;
my $tcpar_read_NHTSAEDR;
my $tcpar_EvalOperator ;
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
		$storedCrashLabels_aref,
		$edrNumberOfEventsToBeStored,
		$unit,
		$ignitionCycle,
		$IGN_ValueCrash1,
		$IGN_ValueCrash2,
		$IGN_ValueCrash3,
		$manipulatedCOMsignals,
		$Response_VIN,
		$Expected_VIN,
		$Response_HW,
		$Expected_HW,
		$Response_SW,
		$Expected_SW,
		$Response_SERI,
		$Expected_SERI,
	);;
my $record1 = 1;
my $record2 = 2;
my $record3 = 3;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  S_read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Protocol =  S_read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_read_CHINAEDR =  S_read_mandatory_testcase_parameter( 'read_CHINAEDR' );
	$tcpar_read_NHTSAEDR =  S_read_optional_testcase_parameter( 'read_NHTSAEDR' );
	$tcpar_DiagType =  S_read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  S_read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_Autarky =  S_read_mandatory_testcase_parameter( 'Autarky' );
	$tcpar_WaitTime =  S_read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_PreCrash1 =  S_read_mandatory_testcase_parameter( 'PreCrash1' );
	$tcpar_PreCrash2 =  S_read_mandatory_testcase_parameter( 'PreCrash2' );
	$tcpar_PreCrash3 =  S_read_mandatory_testcase_parameter( 'PreCrash3' );
	$tcpar_COM_Precondition1 =  S_read_mandatory_testcase_parameter( 'COM_Precondition1' );
	$tcpar_COM_Precondition2 =  S_read_mandatory_testcase_parameter( 'COM_Precondition2' );
	$tcpar_COM_Precondition3 =  S_read_mandatory_testcase_parameter( 'COM_Precondition3' );
	$tcpar_PreconditionValue1 =  S_read_mandatory_testcase_parameter( 'PreconditionValue1' );
	$tcpar_PreconditionValue2 =  S_read_mandatory_testcase_parameter( 'PreconditionValue2' );
	$tcpar_PreconditionValue3 =  S_read_mandatory_testcase_parameter( 'PreconditionValue3' );
	$tcpar_COMSignals =  S_read_mandatory_testcase_parameter( 'COMSignals' );
	$tcpar_COM_Value =  S_read_mandatory_testcase_parameter( 'COM_Value' );
	$tcpar_ExpectedCOMSignalData =  S_read_mandatory_testcase_parameter( 'ExpectedCOMSignalData' , 'byref');
	$tcpar_VIN_Value =  S_read_mandatory_testcase_parameter( 'VIN_Value' );
	$tcpar_ExpectedVIN =  S_read_mandatory_testcase_parameter( 'ExpectedVIN' );
	$tcpar_HWPartNumber_Value =  S_read_mandatory_testcase_parameter( 'HWPartNumber_Value' );
	$tcpar_ExpectedHWPartNumber =  S_read_mandatory_testcase_parameter( 'ExpectedHWPartNumber' );
	$tcpar_SerialPartNumber_Value =  S_read_mandatory_testcase_parameter( 'SerialPartNumber_Value' );
	$tcpar_ExpectedSerialPartNumber =  S_read_mandatory_testcase_parameter( 'ExpectedSerialPartNumber' );
	$tcpar_SWPartNumber_Value =  S_read_mandatory_testcase_parameter( 'SWPartNumber_Value' );
	$tcpar_ExpectedSWPartNumber =  S_read_mandatory_testcase_parameter( 'ExpectedSWPartNumber' );
	$tcpar_IGN_Variable =  S_read_mandatory_testcase_parameter( 'IGN_Variable' );
	$tcpar_Variable_IgnitionCycle_LowByte =  S_read_mandatory_testcase_parameter( 'Variable_IgnitionCycle_LowByte' );
	$tcpar_Variable_IgnitionCycle_HighByte =  S_read_mandatory_testcase_parameter( 'Variable_IgnitionCycle_HighByte' );
	$tcpar_Value_UB =  S_read_mandatory_testcase_parameter( 'Value_UB' );
	$tcpar_Value_HB =  S_read_mandatory_testcase_parameter( 'Value_HB' );
	$tcpar_Value_MB =  S_read_mandatory_testcase_parameter( 'Value_MB' );
	$tcpar_Value_LB =  S_read_mandatory_testcase_parameter( 'Value_LB' );
	$tcpar_EDIDs =  S_read_mandatory_testcase_parameter( 'EDIDs' );
	$tcpar_CrashPrecondition1 =  S_read_mandatory_testcase_parameter( 'CrashPrecondition1' );
	$tcpar_CrashPrecondition2 =  S_read_mandatory_testcase_parameter( 'CrashPrecondition2' );
	$tcpar_CrashPrecondition3 =  S_read_mandatory_testcase_parameter( 'CrashPrecondition3' );
	$tcpar_Crashcode =  S_read_mandatory_testcase_parameter( 'Crashcode' );
	$tcpar_ExpectedNbrOfRecords =  S_read_mandatory_testcase_parameter( 'ExpectedNbrOfRecords' );
	$tcpar_EvalOperator = '==' if(not defined $tcpar_EvalOperator);

	
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

	S_teststep("1. StandardPrepNoFault", 'AUTO_NBR');
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
    GDCOM_init () ; # To fetch info for CD from mapping_diag

	
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
	# CA_set_EnvVar_value( 'EnvHEVC_A1To_', 0 );
	# S_wait_ms(2000);
	# GDCOM_request ('14 FF FF FF', '54', 'relax');
	# S_wait_ms(1000);
	
	# CA_set_EnvVar_value( 'EnvEBA_A1To_', 0 );
	# S_wait_ms(2000);
	# GDCOM_request ('14 FF FF FF', '54', 'relax');
	# S_wait_ms(1000);
	
	# CA_set_EnvVar_value ( 'EnvECM_A3To_', 1);
	# S_wait_ms(2000);

	# CA_set_EnvVar_value ( 'EnvECM_A8To_', 1);
	# S_wait_ms(2000);

	# CA_set_EnvVar_value ( 'EnvECM_A9To_', 1);
	# S_wait_ms(2000);
			
	# CA_set_EnvVar_value ( 'EnvBCM_A7To_', 1);
	# S_wait_ms(2000);
	
	# CA_set_EnvVar_value ( 'EnvVehicleSpeedDisplayedinkmh_', 1);
	# S_wait_ms(2000);

	S_teststep("2. Write VIN data with value as '$tcpar_VIN_Value'", 'AUTO_NBR');
	my $VIN_Response = GDCOM_request_general( 'REQ_ReadDataByIdentifier_VINDataIdentifer', 'PR_ReadDataByIdentifier_VINDataIdentifer', 'relax' );
	S_wait_ms(500);
	if ($VIN_Response ne '62 F1 90 BB BB BB BB BB BB BB BB BB BB BB BB BB BB BB BB BB') 
	{
		# S_teststep_2nd_level("Unlock Security level 1", 'AUTO_NBR');
		# PD_WriteMemoryByName('rb_dsm_SecurityUnlock_bo',0x01);
		# S_wait_ms(500);
		# GDCOM_request_general( 'REQ_DiagnosticSessionControl_ExtendedSession', 'PR_DiagnosticSessionControl_ExtendedSession', 'relax' );
		# S_wait_ms(500);
		# GDCOM_request('2E F1 90 '. $tcpar_VIN_Value, '6E F1 90', 'relax' );
		# S_wait_ms(500);
		# Prepare();
		Prepertation();
		GDCOM_request('2E F1 90 '.$tcpar_VIN_Value,'6E F1 90', 'relax');
		S_wait_ms(500);
	}
	S_teststep_2nd_level("Read VIN after write", 'AUTO_NBR');
	$Response_VIN = GDCOM_request_general( 'REQ_ReadDataByIdentifier_VINDataIdentifer', 'PR_ReadDataByIdentifier_VINDataIdentifer', 'relax' );
	S_wait_ms(100);
	
	my @value = split(' ',$Response_VIN);
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
	my $stringVIN = join('',@array);
	# S_w2rep("string: $stringVIN");
	$Expected_VIN = "0x".$stringVIN;
	S_w2rep("Expected VIN: $Expected_VIN");

	S_teststep("3. Write HW Part Number data with value as '$tcpar_HWPartNumber_Value'", 'AUTO_NBR');
	my @value = split(' ',$tcpar_HWPartNumber_Value);
	# HW($tcpar_HWPartNumber_Value);
	PD_WriteNVMSection("swv_CustECUParNumber",\@value);
	S_wait_ms(500);
	# my $count = 0;
	
	# foreach my $ecuvalue (@value)
	# {
		# PD_WriteMemoryByName("rb_drdi_ECUHwNumber_dfst.ECUHwNumber_au8($count)",hex(@value[$count]));
		# S_wait_ms(500);
		# $count++;
		
	# }	
	GDCOM_request('10 03', '50 03', 'relax' );
	S_wait_ms(200);
	GDCOM_request('11 01', '51 01', 'relax' );
	S_wait_ms(7000);
	
	S_teststep_2nd_level("Read Vehicle ManufactureECUHardwareNumberDataIdentifier after write", 'AUTO_NBR');
	# $Response_HW = GDCOM_request('22 F1 91', '62 F1 91', 'relax' );
	$Response_HW = GDCOM_request('22 F1 8E', '62 F1 8E', 'relax' );
	S_wait_ms(200);
	
	my @value = split(' ',$Response_HW);
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
	my $stringHW = join('',@array);
	# S_w2rep("string: $stringHW");
	my $Value_padding = '0x202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
	$Expected_HW = "$Value_padding"."$stringHW";
	S_w2rep("Expected HW number: $Expected_HW");
	
	
	S_teststep("4. Write Serial Part Number data with value as '$tcpar_SerialPartNumber_Value'", 'AUTO_NBR');
	my @value = split(' ',$tcpar_SerialPartNumber_Value);
	PD_WriteNVMSection("swv_CustECUSerialNumber",\@value);
	S_wait_ms(500);
	# PD_WriteNVMSection("swv_CustECUParNumber",\@value);
	# S_wait_ms(500);
	
	# Serial_Number($tcpar_SerialPartNumber_Value);
	# my $count = 0;
	# foreach my $ecuvalue (@value)
	# {
				
			# PD_WriteMemoryByName("rb_drdi_ECUSerialNum_dfst.ECUSerialNum_au8($count)",hex(@value[$count]));
			# S_wait_ms(500);
			# $count ++;
	# }
	GDCOM_request('10 03', '50 03', 'relax' );
	S_wait_ms(200);
	GDCOM_request('11 01', '51 01', 'relax' );
	S_wait_ms(7000);
	Prepertation();
	S_teststep_2nd_level("Read ECU Serial Number Data Identifier after write", 'AUTO_NBR');
	# $Response_SERI = GDCOM_request('22 F1 8C', '62 F1 8C', 'relax' );
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
	my $Value_padding = '0x2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020';
	$Expected_SERI = "$Value_padding"."$stringSERI";
	S_w2rep("Expected SERI: $Expected_SERI");
	
	S_teststep("5. Write SW Part Number data with value as '$tcpar_SWPartNumber_Value'", 'AUTO_NBR');
	my @value = split(' ',$tcpar_SWPartNumber_Value);
	PD_WriteNVMSection("swv_CustECUSoftwarenumber",\@value);
	S_wait_ms(500);
	# SW($tcpar_SWPartNumber_Value);
	# my $count = 0;
	# foreach my $ecuvalue (@value)
	# {
			
			# PD_WriteMemoryByName("rb_drdi_CustECUSwNumberDataID_dfst.rb_drdi_ECUSwNumberDataID_au8($count)",hex(@value[$count]));
			# S_wait_ms(500);
			# $count ++;
		
	# }
	GDCOM_request('10 03', '50 03', 'relax' );
	S_wait_ms(200);
	GDCOM_request('11 01', '51 01', 'relax' );
	S_wait_ms(7000);
	S_teststep_2nd_level("Read ECUSoftware Number DataIdentifier after write", 'AUTO_NBR');
	# $Response_SW = GDCOM_request('22 F1 95', '62 F1 95', 'relax' );
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
	my $Value_padding = '0x2020202020202020202020202020202020202020202020202020202020202020';
	$Expected_SW = "$Value_padding"."$stringSW";
	S_w2rep("Expected SW: $Expected_SW");
	
	S_teststep("6. Set  IGN cycle '$tcpar_IGN_Variable' to '$tcpar_Value_UB','$tcpar_Value_HB','$tcpar_Value_MB','$tcpar_Value_LB'", 'AUTO_NBR');
	my $IGNvalue = "$tcpar_Value_UB"."$tcpar_Value_HB"."$tcpar_Value_MB"."$tcpar_Value_LB";
	PD_WriteMemoryByName("$tcpar_IGN_Variable",$IGNvalue);
	S_wait_ms(1000);
	$IGN_ValueCrash1 = IgnCycleRead();
	
	S_teststep("7. Set the '@$tcpar_COMSignals' signal to value '@$tcpar_COM_Precondition1'", 'AUTO_NBR');
	CA_set_EnvVar_value ('EnvSetComValue1',1);
	S_wait_ms(6000);
	# S_user_action("DriverSafetyBeltBuckleState = 0");
	S_teststep("8. Inject '$tcpar_CrashPrecondition1' if precondition '$tcpar_PreCrash1' equal 'Yes'", 'AUTO_NBR');
	if($tcpar_PreCrash1 eq 'Yes')
	{
		Crash_Injection($tcpar_CrashPrecondition1);
		S_wait_ms(8000);
	}
	else
	{
		S_teststep_2nd_level("Crash is not inject in this step", 'AUTO_NBR');
	}

	S_teststep("9. Set the '@$tcpar_COMSignals' signal to value '@$tcpar_COM_Precondition2'", 'AUTO_NBR');
	if($tcpar_PreCrash2 eq 'Yes')
	{
		CA_set_EnvVar_value ('EnvSetComValue2',1);
		S_wait_ms(5500);
	}
	else
	{
		;
	}

	S_teststep("10. Inject '$tcpar_CrashPrecondition2' if precondition '$tcpar_PreCrash2' equal 'Yes'", 'AUTO_NBR');
	if($tcpar_PreCrash2 eq 'Yes')
	{
		Crash_Injection($tcpar_CrashPrecondition2);
		S_wait_ms(8000);
	}
	else
	{
		S_teststep_2nd_level("Crash is not inject in this step", 'AUTO_NBR');
	}
	
	S_teststep("11. Set the '@$tcpar_COMSignals' signal to value '@$tcpar_COM_Precondition3'", 'AUTO_NBR');
	if($tcpar_PreCrash3 eq 'Yes')
	{
		CA_set_EnvVar_value ('EnvSetComValue3',1);
		S_wait_ms(5500);
	}
	else
	{
		;
	}

	
	S_teststep("12. Inject '$tcpar_CrashPrecondition3' if precondition '$tcpar_PreCrash3' equal 'Yes'", 'AUTO_NBR');
	if($tcpar_PreCrash3 eq 'Yes')
	{
		Crash_Injection($tcpar_CrashPrecondition3);
	}
	else
	{
		S_teststep_2nd_level("Crash is not inject in this step", 'AUTO_NBR');
	}
	
	#--------------------------------------------------------------
    # GET CRASH DETAILS
    #    
	# Crash name or index and result DB from EDR mapping
    $crashDetails_href = $mappingEDR -> {'CRASHFILES'}{$tcpar_Crashcode};
    unless(defined $crashDetails_href) {
        $crashDetails_href = {'RESULTDB' => $tcpar_ResultDB, 'CRASHNAME' => $tcpar_Crashcode};
    }
	# Crash settings
	$crashSettings = CSI_GetCrashDataFromMDS($crashDetails_href);
	unless(defined $crashSettings) {
		S_set_error("Crash code $tcpar_Crashcode not defined in given result DB. Test case will be aborted.");
		return 0;
	}
	
		
	# Crash code in World DB
	$crash_handler -> AddCrashSource( "CrashLabel" => $tcpar_Crashcode,
	    								  "SourceLabel" => 'CrashCode_MDS', 
	                                      "OriginalSourceData" => $tcpar_Crashcode );

    $crashInfo_href -> {"CrashCode_MDS"} = $tcpar_Crashcode;

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
	$crash_handler -> AddCrashSource( "CrashLabel" => $tcpar_Crashcode,
	    							  "SourceLabel" => 'CrashDuration', 
	                                  "OriginalSourceData" => $crashDuration_ms,
									  "SourceUnit" => 'ms'  );
											
	CSI_LoadCrashSensorData2Simulator( $crashSettings )unless $main::opt_offline;

	# Power ON the ECU
	# LC_ECU_On();
 	# S_wait_ms('TIMER_ECU_READY');
 	
    CSI_PrepareEnvironment( $crashSettings, 'before_crash_same_cycle','normal' );
    S_wait_ms(2000);
	
	

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set the '@$tcpar_COMSignals' signal to value '@$tcpar_COM_Value'", 'AUTO_NBR');
	CA_set_EnvVar_value ('EnvSetComValue4',1);
	S_wait_ms(5500);
	# S_user_action("hello my friend");
	S_teststep("If '$tcpar_Autarky' is 'Before', power OFF then wait for '$tcpar_WaitTime' ", 'AUTO_NBR');
	if ($tcpar_Autarky eq 'Before')
	{
		S_teststep_2nd_level("ECU OFF", 'AUTO_NBR');
		LC_ECU_Off();
		S_wait_ms($tcpar_WaitTime);
	
	}
	else
	{
		S_teststep_2nd_level("Autarky is 'After' crash", 'AUTO_NBR');
	}
	S_teststep("Inject a Crash '$tcpar_Crashcode'", 'AUTO_NBR');
	CSI_TriggerCrash();
	if ($tcpar_Autarky eq 'Before')
	{
		S_wait_ms(5000);
	}
	else
	{
		;
	}
	
	S_teststep("If '$tcpar_Autarky' is 'After', wait for '$tcpar_WaitTime' then power OFF", 'AUTO_NBR');
	if ($tcpar_Autarky eq 'After')
	{
		S_wait_ms($tcpar_WaitTime);
		S_teststep_2nd_level("ECU OFF", 'AUTO_NBR');
		LC_ECU_Off();
		S_wait_ms(5000);
		
	}
	else
	{
		S_teststep_2nd_level("Power OFF is not apply in this step", 'AUTO_NBR');
	}

	S_teststep("Power ON, wait for 5s.", 'AUTO_NBR');
	LC_ECU_On();
	S_wait_ms(5000);
	# S_user_action("123");
	S_teststep("Read All Records value", 'AUTO_NBR', 'read_edids_value');			#measurement 1
	Prepertation();
	ReadAndStoreRecord($tcpar_Crashcode);
	return 1;
}

sub TC_evaluation {


	if ($tcpar_Autarky eq 'Before')
	{
		if ($tcpar_WaitTime == 100)
		{	
			
			Verified_Buffer($record1,$tcpar_Crashcode,%$tcpar_ExpectedCOMSignalData);
			Verified_Buffer($record2,$tcpar_Crashcode,%$tcpar_PreconditionValue1);
		}
		elsif ($tcpar_WaitTime == 200)
		{	
			
			Verified_Buffer($record1,$tcpar_Crashcode,%$tcpar_ExpectedCOMSignalData);
			Verified_Buffer($record2,$tcpar_Crashcode,%$tcpar_PreconditionValue2);
			Verified_Buffer($record3,$tcpar_Crashcode,%$tcpar_PreconditionValue1);
		}
		elsif ($tcpar_WaitTime == 300)
		{	
			
			Verified_Buffer($record1,$tcpar_Crashcode,%$tcpar_ExpectedCOMSignalData);
			Verified_Buffer($record2,$tcpar_Crashcode,%$tcpar_PreconditionValue3);
			Verified_Buffer($record3,$tcpar_Crashcode,%$tcpar_PreconditionValue1);
		}
		elsif ($tcpar_WaitTime == 500)
		{	
			
			Verified_Buffer($record1,$tcpar_Crashcode,%$tcpar_PreconditionValue1);

		}
		elsif ($tcpar_WaitTime == 600)
		{	
			
			Verified_Buffer($record1,$tcpar_Crashcode,%$tcpar_PreconditionValue2);
			Verified_Buffer($record2,$tcpar_Crashcode,%$tcpar_PreconditionValue1);
		}
		elsif ($tcpar_WaitTime == 700)
		{
			
			Verified_Buffer($record1,$tcpar_Crashcode,%$tcpar_PreconditionValue3);
			Verified_Buffer($record2,$tcpar_Crashcode,%$tcpar_PreconditionValue2);
			Verified_Buffer($record3,$tcpar_Crashcode,%$tcpar_PreconditionValue1);
		
		}
	}
	elsif ($tcpar_Autarky eq 'After')
	{
		if (($tcpar_WaitTime == 500) || ($tcpar_WaitTime == 12))
		{	
			
			Verified_Buffer($record1,$tcpar_Crashcode,%$tcpar_ExpectedCOMSignalData);
			Verified_Buffer($record2,$tcpar_Crashcode,%$tcpar_PreconditionValue1);
		}
		
		elsif (($tcpar_WaitTime == 200) || ($tcpar_WaitTime == 430))
		{	
			
			Verified_Buffer($record1,$tcpar_Crashcode,%$tcpar_ExpectedCOMSignalData);
			Verified_Buffer($record2,$tcpar_Crashcode,%$tcpar_PreconditionValue2);
			Verified_Buffer($record3,$tcpar_Crashcode,%$tcpar_PreconditionValue1);
		}
		else
		{	
			
			Verified_Buffer($record1,$tcpar_Crashcode,%$tcpar_ExpectedCOMSignalData);
			Verified_Buffer($record2,$tcpar_Crashcode,%$tcpar_PreconditionValue3);
			Verified_Buffer($record3,$tcpar_Crashcode,%$tcpar_PreconditionValue1);
		}
	}

	
	return 1;
}

sub TC_finalization {

	# S_w2rep("Remove condition");
	CA_set_EnvVar_value ('EnvSetComValue1',0);
	S_wait_ms(2000);
	
	CA_set_EnvVar_value ('EnvSetComValue2',0);
	S_wait_ms(2000);
	
	CA_set_EnvVar_value ('EnvSetComValue3',0);
	S_wait_ms(2000);
	
	CA_set_EnvVar_value ('EnvSetComValue4',0);
	S_wait_ms(2000);
	
	
	$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => 1);
	$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => 2);
	$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => 3);
	
	
	# S_w2rep("Clear fault memory");
	PD_ClearCrashRecorder();
	S_wait_ms(2000);
	# Erase Fault memory
	PD_ClearFaultMemory();
	S_wait_ms(2000);
	GDCOM_request ('31 01 30 00', '71 01', 'relax');
	S_wait_ms(2000);

	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
	# Erase EDR
	PD_ClearCrashRecorder_NOERROR();
	S_wait_ms(2000);
	
	
	return 1;
}
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
    S_wait_ms(1000);
	
	CSI_TriggerCrash();

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
	
	if ( lc( $tcpar_read_NHTSAEDR) eq 'yes' ) {
		S_w2rep("Hello NHTSA");
		S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored");
		EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								"CrashLabel" => $Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath, 
								"read_EDRType"=>'NHTSA')
	}
	if (lc($tcpar_read_CHINAEDR) eq 'yes'){
		$edrNumberOfEventsToBeStored=3;
		S_w2rep("Hello CNEDR");
		S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored");
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" =>  $ChinaEDR_diagType,
								"CrashLabel" => $Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA');
	}
	
	return 1;


}

sub IgnCycleRead {
	
	my	$ignitionCycleBeforeCrash_LowByte = S_aref2hex(PD_ReadMemoryByName_NOERROR($tcpar_Variable_IgnitionCycle_LowByte));
	my  $ignitionCycleBeforeCrash_HighByte = S_aref2hex(PD_ReadMemoryByName_NOERROR($tcpar_Variable_IgnitionCycle_HighByte));
	my $ignitionCycle =$ignitionCycleBeforeCrash_HighByte.$ignitionCycleBeforeCrash_LowByte;
	$ignitionCycle=~ m/0x(.*)0x(.*)/;			#concatenated and removed 0x
	$ignitionCycle = '0x'.$1.$2;
	
	if ($ignitionCycle >= 0xFFFD){
		$ignitionCycle=65533;
		
	}

	if($ignitionCycle == 0){
		S_set_warning ( "Variables are not present in .sad file hence variable 'rb_tim_EcuOnTimeDataEe_st.POnCounter_u32' is read \n" );
		$ignitionCycle = S_aref2hex(PD_ReadMemoryByName('rb_tim_EcuOnTimeDataEe_st.POnCounter_u32'));
	}

	$ignitionCycle = S_0x2dec ( $ignitionCycle ); 
	# S_w2rep("IGN Cycle value before crash 1 is: $ignitionCycle");
	return $ignitionCycle;

}

sub SystemEDID_Evaluate {

	my @inputValue = @_;
	my $Buffer = @inputValue[0];
	my $EDID = @inputValue[1];
	my $ExpectedSystemValue = @inputValue[2];
	my $Crashcode = @inputValue[3];
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
		S_teststep("Validate EDID $EDID after crash $Crashcode", 'AUTO_NBR');       #evaluation 1
		EDR_Eval_evaluate_EDID_Raw ("EDIDnr" => $EDID,
						"RecordNumber" => $Buffer,
						"CrashLabel" => $Crashcode,
						"Expected_Raw_Hex" => $thisRecordExpectedValue,
						"EvalOperator" => $tcpar_EvalOperator);
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
sub IGNCycle_Evaluate {

	my @inputValue = @_;
	my $Buffer = @inputValue[0];
	my $EDID = @inputValue[1];
	my $Expectedvalue = @inputValue[2];
	my $Crashcode = @inputValue[3];

	
	my $dataElement = $record_handler -> GetDataElementEDID( "EDIDnr" => $EDID,
                                                            "RecordNumber" => $Buffer,
                                                            "CrashLabel" => "$Crashcode");
	S_teststep("Read $EDID ($dataElement) in record $Buffer", 'AUTO_NBR', "read_edid_value_$EDID\_$Buffer");
    my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => "$Crashcode", "RecordNumber" => $Buffer,"EDIDnr" => $EDID );
    my $detectedvalue = $edidData -> {"DataValue"};
    my $unit = $edidData -> {"ValueUnit"};    
    unless(defined $detectedvalue) {
        S_set_error("No data could be obtained for EDID $EDID in record read after first crash injection");
        return 1;
    }
	if ((($tcpar_Autarky eq 'After') || ($tcpar_Autarky eq 'Before'))&& ($EDID == 4011))
	{
		$Expectedvalue = $Expectedvalue + 1;
	}
	

    S_teststep_expected("($dataElement) should be $Expectedvalue cycles", "read_edid_value_$EDID\_$Buffer"); #evaluation 1
    S_teststep_detected("($dataElement) is: $detectedvalue cycles", "read_edid_value_$EDID\_$Buffer");
    EVAL_evaluate_value ( "EDID_$EDID\_Evaluation", $detectedvalue,'==', $Expectedvalue );
		
	
	return 1;

}


sub Verified_Buffer{
	
	my $Buffer = shift;
	my $Crashcode = shift;
	my %CrashData = @_;
	S_w2rep ("buffer: $Buffer \n");
	# S_w2rep ("Crashcode: $Crashcode \n");
	foreach my $edid ( keys %CrashData )
	{
		
		my $value = $CrashData{$edid};
		S_w2rep ("$edid : $value\n");
		
	      
	
			my $edidValue;
			my $dataElement = $record_handler -> GetDataElementEDID(  "EDIDnr" => $edid,
																	  "RecordNumber" => $Buffer,
																	  "CrashLabel" => $Crashcode);
			
			S_teststep("EDID $edid ($dataElement) in record $Buffer", 'AUTO_NBR',"read_edid_data_$Buffer\_$edid");				#measurement 1
			
			if ($value=~/0x/)
			{
				my $detectedEDIDvalue = $record_handler -> GetRawEdidDataSamples( "EDIDnr" => $edid,
												   "RecordNumber" => $Buffer,
												   "CrashLabel" => $Crashcode,
												   "FormatOption" => "HEX");
				unless(defined $detectedEDIDvalue) {
					S_set_error("No EDID data found for crash $Crashcode, record $Buffer. EDID cannot not be evaluated. Go to next record",110);
					return;
				}
	
				
				if(ref $detectedEDIDvalue ne 'ARRAY') {
					S_teststep_2nd_level("Read '$edid' ", 'AUTO_NBR',"Read_edid_data_$Buffer\_$edid");
					$edidValue ="0x".$detectedEDIDvalue;
					EVAL_evaluate_value ( "EDID_$edid\_Evaluation", $edidValue,'==',$value );
					S_teststep_expected("EDID_$edid should be value: '$value'", "Read_edid_data_$Buffer\_$edid");
					S_teststep_detected("EDID_$edid is value: '$edidValue'", "Read_edid_data_$Buffer\_$edid");
				}
				else{
					my $dataSample=1;
					my $edidValueHex;
					
					foreach $edidValue (@{$detectedEDIDvalue})
					{
						
					
						S_teststep_2nd_level("Read '$edid' data sample $dataSample", 'AUTO_NBR',"read_edid_data_$Buffer\_$edid\_data_sample_$dataSample");
						$edidValueHex="0x".$edidValue;
						EVAL_evaluate_value ( "EDID_$edid\_Evaluation", $edidValueHex,'==',$value );
						S_teststep_expected("EDID_$edid should be value: '$value'", "read_edid_data_$Buffer\_$edid\_data_sample_$dataSample");
						S_teststep_detected("EDID_$edid is value: '$edidValueHex'", "read_edid_data_$Buffer\_$edid\_data_sample_$dataSample");
						$dataSample++;
						
						
					}
					
				}	
			
			}
		
	}
	#####--------------------System EDID---------------------#########
	my @SystemEDIDs = (4014,4015,4016,4017,4010,4011);
	SystemEDID_Evaluate($Buffer,$SystemEDIDs[0],$Expected_VIN,$Crashcode);
	SystemEDID_Evaluate($Buffer,$SystemEDIDs[1],$Expected_HW,$Crashcode);
	SystemEDID_Evaluate($Buffer,$SystemEDIDs[2],$Expected_SERI,$Crashcode);
	SystemEDID_Evaluate($Buffer,$SystemEDIDs[3],$Expected_SW,$Crashcode);
	IGNCycle_Evaluate($Buffer,$SystemEDIDs[4],$IGN_ValueCrash1,$Crashcode);
	IGNCycle_Evaluate($Buffer,$SystemEDIDs[5],$IGN_ValueCrash1,$Crashcode);

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
	# $Expected_value = "$Value_padding"."$stringHW";
	# S_w2rep("Expected HW number: $Expected_value");
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
	# $Expected_value = "$Value_padding"."$stringSERI";
	# S_w2rep("Expected SERI: $Expected_value");
	
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
	# $Expected_value = "$Value_padding"."$stringSW";
	# S_w2rep("Expected SW: $Expected_value");
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
1;
