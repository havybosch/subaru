#### TEST CASE MODULE
package TC_EDID_Overwrite_Validation;

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
use FuncLib_CustLib_EDR_CNEDR;
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_Overwrite_Validation

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

8. Inject <CrashPrecondition1> if precondition <PreCrash1> not equal 'Empty'

9. Set the <COMSignals> signal to value <COM_Precondition2>

10. Inject <CrashPrecondition2> if precondition <PreCrash2> not equal 'Empty'

11. Set the <COMSignals> signal to value <COM_Precondition3>

12. Inject <CrashPrecondition3> if precondition <PreCrash3> not equal 'Empty'


I<B<Stimulation and Measurement>>

1. Set the <COMSignals> signal to value <COM_Value1>

2. Inject a Crash <Crashcode1>

3. Set the <COMSignals> signal to value <COM_Value2>

4. Inject a Crash <Crashcode2>

5. Set the <COMSignals> signal to value <COM_Value3>

6. Inject a Crash <Crashcode3>

7. Do turn Off ECU if power off condition <PowerOff> equal Yes

8. Do turn On ECU if power off condition <PowerOff> equal Yes

9. Read <EDIDs> value 


I<B<Evaluation>>

1. -

2. -

3. -

4. 

5. -

6. - 

7. -

8. 

9. COMSignalValue corresponding to COMSignalState should be reported


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Protocol' => 
	SCALAR 'read_CHINAEDR' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 
	SCALAR 'PreCrash1' => 
	SCALAR 'PreCrash2' => 
	SCALAR 'PreCrash3' => 
	SCALAR 'CrashPrecondition1' => 
	SCALAR 'CrashPrecondition2' => 
	SCALAR 'CrashPrecondition3' => 
	LIST 'COM_Precondition1' => 
	LIST 'COM_Precondition2' => 
	LIST 'COM_Precondition3' => 
	HASH 'PreconditionValue1' => 
	HASH 'PreconditionValue2' => 
	HASH 'PreconditionValue3' => 
	LIST 'COMSignals' => 
	LIST 'COM_Value1' => 
	LIST 'COM_Value2' => 
	LIST 'COM_Value3' => 
	HASH 'ExpectedCOMSignalData1' => 
	HASH 'ExpectedCOMSignalData2' => 
	HASH 'ExpectedCOMSignalData3' => 
	LIST 'SystemData' => 
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
	SCALAR 'Crashcode1' => 
	SCALAR 'Crashcode2' => 
	SCALAR 'Crashcode3' => 
	SCALAR 'ExpectedNbrOfRecords' => 
	SCALAR 'PowerOff' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To validate EDR buffer can be overwritten correctly'
	Protocol = 'CAN' 
	read_CHINAEDR = 'yes'
	DiagType = 'ProdDiag'
	ResultDB = 'EDR'
	PreCrash1 = 'NDCrash'
	PreCrash2 = 'NDCrash'
	PreCrash3 = 'NDCrash'
	CrashPrecondition1 = 'Single_EDR_SideRight_NonInflatable'
	CrashPrecondition2 = 'Single_EDR_Rear_above_8kph_NoDeployment;5'
	CrashPrecondition3 = 'Single_EDR_SideLeft_NonInflatable'
	COM_Precondition1 = @('0', '0', '0', '0', '0', '0')
	COM_Precondition2 = @('1', '1', '1', '1', '100', '1')
	COM_Precondition3 = @('2', '2', '2', '2', '200', '2')
	PreconditionValue1 = %( '4005' => '0x00','4006' => '0xFE', '4007' => '0xFF','4008' => '0x00', '4009' => '0x00','4035' => '0x00')
	PreconditionValue2 = %( '4005' => '0x01','4006' => '0x00', '4007' => '0x01','4008' => '0x01', '4009' => '0x01','4035' => '0x01')
	PreconditionValue3 = %( '4005' => '0x02','4006' => '0x01', '4007' => '0x00','4008' => '0x02', '4009' => '0x02','4035' => '0x02')
	COMSignals = @('VehicleSpeedDisplayedinkmh', 'BrakeInfoStatus', 'DriverSafetyBeltBuckleState', 'RawSensor', 'EngineRPM', 'EngineThrottlePosition')
	COM_Value1 = @('100', '1', '1', '50', '500', '99')
	COM_Value2 = @('250', '2', '2', '101', '8191', '100')
	COM_Value3 = @('409.5', '3', '3', '127.75', '8191.875', '127')
	ExpectedCOMSignalData1 = %( '4005' => '0x64','4006' => '0x00', '4007' => '0x01','4008' => '0x32', '4009' => '0x05','4035' => '0x63')
	ExpectedCOMSignalData2 = %( '4005' => '0xFA','4006' => '0x01', '4007' => '0x00','4008' => '0x64', '4009' => '0x51','4035' => '0x64')
	ExpectedCOMSignalData3 = %( '4005' => '0xFE','4006' => '0xFE', '4007' => '0xFE','4008' => '0xFE', '4009' => '0xFE','4035' => '0xFE')
	SystemData = @('Power-on cycle at event', 'Power-on cycle at reading', 'Vehicle Identification Number', 'HW Part Number', 'Serial Part Number', 'SW Part Number')
	VIN_Value = 'BB BB BB BB BB BB BB BB 31 BB BB BB BB BB BB BB BB'
	ExpectedVIN = '0xBBBBBBBBBBBBBBBB31BBBBBBBBBBBBBBBB'
	HWPartNumber_Value = '01 09 08 07 06 05 04 03 02 08'
	ExpectedHWPartNumber = '0x20202020202020202020202020202020202020202020202020202020202020202020202020202020202020200102030405060708090101090807060504030208'
	SerialPartNumber_Value = '01 02 03 04 05 06 07 08 09 01 10 90 80 70 60 50 40 30 20 16'
	ExpectedSerialPartNumber = '0x20202020202020202020202020202020202020202020202020202020202020202020202020202020202020200102030405060708090110908070605040302016'
	SWPartNumber_Value = '11 12 18 18 18 18 18 18 18 18 18 18 01 02 03 04 05 06 07 08 09 01 10 90 80 70 60 50 40 30 20 15'
	ExpectedSWPartNumber = '0x20202020202020202020202020202020202020202020202020202020202020201112181818181818181818180102030405060708090110908070605040302015'
	IGN_Variable = 'rb_tim_EcuOnTimeDataEe_st.POnCounter_u32'
	Variable_IgnitionCycle_LowByte = 'rb_tim_EcuOnTimeDataEe_st(0)'
	Variable_IgnitionCycle_HighByte = 'rb_tim_EcuOnTimeDataEe_st(1)'
	Value_UB = '00'
	Value_HB = '00' 
	Value_MB = '00' 
	Value_LB = '01'
	EDIDs = @(4014,4015,4016,4017,4010,4011)
	Crashcode1 = 'Single_EDR_Front_above_8kph_NoDeployment;5'
	Crashcode2 = 'Single_EDR_SideLeft_NonInflatable'
	Crashcode3 = 'Single_EDR_Rollover_NoDeployment;5'
	ExpectedNbrOfRecords = '3'
	PowerOff = 'Yes'
	 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Protocol;
my $tcpar_read_CHINAEDR;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_PreCrash1;
my $tcpar_PreCrash2;
my $tcpar_PreCrash3;
my $tcpar_CrashPrecondition1;
my $tcpar_CrashPrecondition2;
my $tcpar_CrashPrecondition3;
my $tcpar_COM_Precondition1;
my $tcpar_COM_Precondition2;
my $tcpar_COM_Precondition3;
my $tcpar_PreconditionValue1;
my $tcpar_PreconditionValue2;
my $tcpar_PreconditionValue3;
my $tcpar_COMSignals;
my $tcpar_COM_Value1;
my $tcpar_COM_Value2;
my $tcpar_COM_Value3;
my $tcpar_ExpectedCOMSignalData1;
my $tcpar_ExpectedCOMSignalData2;
my $tcpar_ExpectedCOMSignalData3;
my $tcpar_SystemData;
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
my $tcpar_Crashcode1;
my $tcpar_Crashcode2;
my $tcpar_Crashcode3;
my $tcpar_ExpectedNbrOfRecords;
my $tcpar_PowerOff;

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
		$Expected_IGN,
	);;
my $record1 = 1;
my $record2 = 2;
my $record3 = 3;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_read_CHINAEDR =  GEN_Read_mandatory_testcase_parameter( 'read_CHINAEDR' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_PreCrash1 =  GEN_Read_mandatory_testcase_parameter( 'PreCrash1' );
	$tcpar_PreCrash2 =  GEN_Read_mandatory_testcase_parameter( 'PreCrash2' );
	$tcpar_PreCrash3 =  GEN_Read_mandatory_testcase_parameter( 'PreCrash3' );
	$tcpar_CrashPrecondition1 =  GEN_Read_mandatory_testcase_parameter( 'CrashPrecondition1' );
	$tcpar_CrashPrecondition2 =  GEN_Read_mandatory_testcase_parameter( 'CrashPrecondition2' );
	$tcpar_CrashPrecondition3 =  GEN_Read_mandatory_testcase_parameter( 'CrashPrecondition3' );
	$tcpar_COM_Precondition1 =  GEN_Read_mandatory_testcase_parameter( 'COM_Precondition1' );
	$tcpar_COM_Precondition2 =  GEN_Read_mandatory_testcase_parameter( 'COM_Precondition2' );
	$tcpar_COM_Precondition3 =  GEN_Read_mandatory_testcase_parameter( 'COM_Precondition3' );
	$tcpar_PreconditionValue1 =  GEN_Read_mandatory_testcase_parameter( 'PreconditionValue1' );
	$tcpar_PreconditionValue2 =  GEN_Read_mandatory_testcase_parameter( 'PreconditionValue2' );
	$tcpar_PreconditionValue3 =  GEN_Read_mandatory_testcase_parameter( 'PreconditionValue3' );
	$tcpar_COMSignals =  GEN_Read_mandatory_testcase_parameter( 'COMSignals' );
	$tcpar_COM_Value1 =  GEN_Read_mandatory_testcase_parameter( 'COM_Value1' );
	$tcpar_COM_Value2 =  GEN_Read_mandatory_testcase_parameter( 'COM_Value2' );
	$tcpar_COM_Value3 =  GEN_Read_mandatory_testcase_parameter( 'COM_Value3' );
	$tcpar_ExpectedCOMSignalData1 =  GEN_Read_mandatory_testcase_parameter( 'ExpectedCOMSignalData1' );
	$tcpar_ExpectedCOMSignalData2 =  GEN_Read_mandatory_testcase_parameter( 'ExpectedCOMSignalData2' );
	$tcpar_ExpectedCOMSignalData3 =  GEN_Read_mandatory_testcase_parameter( 'ExpectedCOMSignalData3' );
	$tcpar_SystemData =  GEN_Read_mandatory_testcase_parameter( 'SystemData' );
	$tcpar_EDIDs =  GEN_Read_mandatory_testcase_parameter( 'EDIDs' );
	$tcpar_Crashcode1 =  GEN_Read_mandatory_testcase_parameter( 'Crashcode1' );
	$tcpar_Crashcode2 =  GEN_Read_mandatory_testcase_parameter( 'Crashcode2' );
	$tcpar_Crashcode3 =  GEN_Read_mandatory_testcase_parameter( 'Crashcode3' );
	$tcpar_ExpectedNbrOfRecords =  GEN_Read_mandatory_testcase_parameter( 'ExpectedNbrOfRecords' );
	$tcpar_PowerOff =  GEN_Read_mandatory_testcase_parameter( 'PowerOff' );
	$tcpar_VIN_Value =  GEN_Read_mandatory_testcase_parameter( 'VIN_Value' );
	$tcpar_ExpectedVIN =  GEN_Read_mandatory_testcase_parameter( 'ExpectedVIN' );
   	# $tcpar_ExpectedValue_Decoded =  S_read_optional_testcase_parameter( 'ExpectedValue_Decoded','byref');
	$tcpar_HWPartNumber_Value =  GEN_Read_mandatory_testcase_parameter( 'HWPartNumber_Value' );
	$tcpar_ExpectedHWPartNumber =  GEN_Read_mandatory_testcase_parameter( 'ExpectedHWPartNumber' );
	$tcpar_SerialPartNumber_Value =  GEN_Read_mandatory_testcase_parameter( 'SerialPartNumber_Value' );
	$tcpar_ExpectedSerialPartNumber =  GEN_Read_mandatory_testcase_parameter( 'ExpectedSerialPartNumber' );
	$tcpar_SWPartNumber_Value =  GEN_Read_mandatory_testcase_parameter( 'SWPartNumber_Value' );
	$tcpar_ExpectedSWPartNumber =  GEN_Read_mandatory_testcase_parameter( 'ExpectedSWPartNumber' );
	$tcpar_IGN_Variable =  GEN_Read_mandatory_testcase_parameter( 'IGN_Variable' );
	$tcpar_Variable_IgnitionCycle_LowByte =  GEN_Read_mandatory_testcase_parameter( 'Variable_IgnitionCycle_LowByte' );
	$tcpar_Variable_IgnitionCycle_HighByte =  GEN_Read_mandatory_testcase_parameter( 'Variable_IgnitionCycle_HighByte' );
	$tcpar_Value_UB =  GEN_Read_mandatory_testcase_parameter( 'Value_UB' );
	$tcpar_Value_HB =  GEN_Read_mandatory_testcase_parameter( 'Value_HB' );
	$tcpar_Value_MB =  GEN_Read_mandatory_testcase_parameter( 'Value_MB' );
	$tcpar_Value_LB =  GEN_Read_mandatory_testcase_parameter( 'Value_LB' );
	# $tcpar_EvalOperator = '==' if(not defined $tcpar_EvalOperator);
	
	if(not defined $tcpar_read_CHINAEDR) {
		# $tcpar_read_NHTSAEDR = 'yes';
		$tcpar_read_CHINAEDR = 'no';
	}
	else {
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
	S_w2rep("1. StandardPrepNoFault");
    my $faultsVerdict = PD_evaluate_faults( $faultsBeforeStimulation, []);
 	return 0 unless ($faultsVerdict eq 'VERDICT_PASS');
	
	
	# S_teststep("2. Write VIN data with value as '$tcpar_VIN_Value'", 'AUTO_NBR');
	# Prepertation();
	# # WRITE VIN
	# GDCOM_request('2E F1 90 '.$tcpar_VIN_Value,'6E F1 90', 'relax');
	# S_wait_ms(500);
	
	# #READ VIN
	# S_teststep_2nd_level("Read VIN after write", 'AUTO_NBR');
	# $Response_VIN = GDCOM_request( '22 F1 90', '62', 'relax' );
	# S_wait_ms(500);

	# my @value = split(' ',$Response_VIN);
	# my $count = 0;
	# my @array;
	# foreach my $var (@value)
	# {
		# if ($count >=3)
		# {
			# # S_w2rep("@value[$count]",(@value[$count]));
			# push(@array, @value[$count]);			
		# }
		# $count ++;
	
	# }

	# my $stringVIN = join('',@array);
	# $Expected_VIN = "0x".$stringVIN;
	# S_w2rep("Expected VIN: $Expected_VIN");
	# S_wait_ms(200);
	
	# S_teststep("3. Write HW Part Number data with value as '$tcpar_HWPartNumber_Value'", 'AUTO_NBR');
	# HW($tcpar_HWPartNumber_Value);
	# S_wait_ms(200);
	
	# S_teststep("4. Write Serial Part Number data with value as '$tcpar_SerialPartNumber_Value'", 'AUTO_NBR');
	# Serial_Number($tcpar_SerialPartNumber_Value);
	# S_wait_ms(200);
	
	# S_teststep("5. Write SW Part Number data with value as '$tcpar_SWPartNumber_Value'", 'AUTO_NBR');
	# SW($tcpar_SWPartNumber_Value);
	# S_wait_ms(200);
	
	# ## 500 => 1F4
	# S_teststep("6. Set  IGN cycle '$tcpar_IGN_Variable' to 500'", 'AUTO_NBR');
	# CA_set_EnvVar_value( '_Env__BIU660_COUNT_TRIP', '500', 'phys' );
	# S_wait_ms(500);
	# $Expected_IGN = CA_get_EnvVar_value( '_Env__BIU660_COUNT_TRIP', 'phys' );

	# S_teststep("7. Set the '$tcpar_COMSignals' signal to value '$tcpar_COM_Precondition1'", 'AUTO_NBR');
	# CA_set_EnvVar_value ('EnvSetComValue1',1);
	# S_wait_ms(5500);
	
	# S_teststep("8. Inject '$tcpar_CrashPrecondition1' if precondition '$tcpar_PreCrash1' not equal 'Empty'", 'AUTO_NBR');
	# if($tcpar_PreCrash1 ne 'Empty')
	# {
		# Crash_Injection($tcpar_CrashPrecondition1);
	# }
	# else
	# {
		# S_teststep_2nd_level("Crash is not inject in this step", 'AUTO_NBR');
	# }

	# S_teststep("9. Set the '$tcpar_COMSignals' signal to value '$tcpar_COM_Precondition2'", 'AUTO_NBR');
	# CA_set_EnvVar_value ('EnvSetComValue2',1);
	# S_wait_ms(5500);

	# S_teststep("10. Inject '$tcpar_CrashPrecondition2' if precondition '$tcpar_PreCrash2' not equal 'Empty'", 'AUTO_NBR');
	# if($tcpar_PreCrash2 ne 'Empty')
	# {
		# Crash_Injection($tcpar_CrashPrecondition2);
	# }
	# else
	# {
		# S_teststep_2nd_level("Crash is not inject in this step", 'AUTO_NBR');
	# }
	
	# S_teststep("11. Set the '$tcpar_COMSignals' signal to value '$tcpar_COM_Precondition3'", 'AUTO_NBR');
	# CA_set_EnvVar_value ('EnvSetComValue3',1);
	# S_wait_ms(5500);
	
	# S_teststep("12. Inject '$tcpar_CrashPrecondition3' if precondition '$tcpar_PreCrash3' not equal 'Empty'", 'AUTO_NBR');
	# if($tcpar_PreCrash3 ne 'Empty')
	# {
		# Crash_Injection($tcpar_CrashPrecondition3);
	# }
	# else
	# {
		# S_teststep_2nd_level("Crash is not inject in this step", 'AUTO_NBR');
	# }
	
	return 1;
}

sub TC_stimulation_and_measurement {
	# S_teststep("Prepare Crash '$tcpar_Crashcode1'", 'AUTO_NBR');
	# Prepare_Crash($tcpar_Crashcode1);
	# S_wait_ms(500);

	# S_teststep("Set the '$tcpar_COMSignals' signal to value '$tcpar_COM_Value1'", 'AUTO_NBR');
	# CA_set_EnvVar_value ('EnvSetComValue2_Quanhh',1);
	# S_wait_ms(7000);
	
	# S_teststep("Inject a Crash '$tcpar_Crashcode1'", 'AUTO_NBR');
	# CSI_TriggerCrash();
	# S_wait_ms(10000);


	# # Prepertation();
	# # S_teststep("Read '$tcpar_EDIDs' value ", 'AUTO_NBR');			#measurement 1
	# # ReadAndStoreRecord($tcpar_Crashcode1);
	
	# S_teststep("Prepare Crash '$tcpar_Crashcode2'", 'AUTO_NBR');
	# Prepare_Crash($tcpar_Crashcode2);
	# # S_wait_ms(800);
	
	# S_teststep("Set the '$tcpar_COMSignals' signal to value '$tcpar_COM_Value2'", 'AUTO_NBR');
	# CA_set_EnvVar_value ('EnvSetComValue5_Quanhh',1);
	# S_wait_ms(8000);
	
	# S_teststep("Inject a Crash '$tcpar_Crashcode2'", 'AUTO_NBR');
	# CSI_TriggerCrash();
	# S_wait_ms(10000);

	# Prepertation();
	# S_teststep("Read '$tcpar_EDIDs' value ", 'AUTO_NBR');			#measurement 1
	# ReadAndStoreRecord($tcpar_Crashcode2);
	
	S_teststep("Prepare Crash '$tcpar_Crashcode3'", 'AUTO_NBR');
	Prepare_Crash($tcpar_Crashcode3);
	S_wait_ms(800);
	
	S_teststep("Set the '$tcpar_COMSignals' signal to value '$tcpar_COM_Value3'", 'AUTO_NBR');
	CA_set_EnvVar_value ('EnvSetComValue6_Quanhh',1);
	S_wait_ms(7000);
	
	S_teststep("Inject a Crash '$tcpar_Crashcode3'", 'AUTO_NBR');
	CSI_TriggerCrash();
	S_wait_ms(10000);
	
	# S_teststep("Do turn Off ECU if power off condition '$tcpar_PowerOff' equal Yes", 'AUTO_NBR');
	# if ($tcpar_PowerOff eq 'Yes')
	# {
		# S_teststep_2nd_level("ECU OFF", 'AUTO_NBR');
		# LC_ECU_Off();
		# S_wait_ms('TIMER_ECU_OFF');

	# }
	# else
	# {
		# S_teststep_2nd_level("ECU OFF is not require in this step", 'AUTO_NBR');
	# }
	
	# S_teststep("Do turn On ECU if power off condition '$tcpar_PowerOff' equal Yes", 'AUTO_NBR');
	# if ($tcpar_PowerOff eq 'Yes')
	# {
		# S_teststep_2nd_level("ECU ON", 'AUTO_NBR');
		# LC_ECU_On();
		# S_wait_ms('TIMER_ECU_READY');
	# }
	# else
	# {
		# S_teststep_2nd_level("ECU ON is not require in this step", 'AUTO_NBR');
	# }
	
	Prepertation();
	S_teststep("Read '$tcpar_EDIDs' value ", 'AUTO_NBR', 'read_edids_value');			#measurement 1
	ReadAndStoreRecord($tcpar_Crashcode3);
	
	return 1;
}

sub TC_evaluation {

	# S_teststep_expected("COMSignalValue corresponding to COMSignalState should be reported", 'read_edids_value');			#evaluation 1
	# S_teststep_detected("<<add detected result here>>", 'read_edids_value');

	return 1;
}

sub TC_finalization {

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


sub HW {
	my $value = shift;
	# S_teststep("Write HW Part Number data with value as '$value'", 'AUTO_NBR');
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
	$Expected_HW = "$Value_padding"."$stringHW";
	S_w2rep("Expected HW number: $Expected_HW");
}

sub Serial_Number {
	my $value = shift;
	# S_teststep("Write Serial Part Number data with value as '$value'", 'AUTO_NBR');
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
	$Expected_SERI = "$Value_padding"."$stringSERI";
	S_w2rep("Expected SERI: $Expected_SERI");
	
}

sub SW {
	my $value = shift;
	# S_teststep("5. Write SW Part Number data with value as '$value'", 'AUTO_NBR');
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
	$Expected_SW = "$Value_padding"."$stringSW";
	S_w2rep("Expected SW: $Expected_SW");
}

sub Prepare_Crash{

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

 
	# CSI_TriggerCrash();
	# S_wait_ms(10000);
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
	
	
	if (lc($tcpar_read_CHINAEDR) eq 'yes'){
		$edrNumberOfEventsToBeStored=3;
		S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored");
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" =>  $ChinaEDR_diagType,
								"CrashLabel" => $Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA');
	}
	
	return 1;


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
		S_teststep("Validate EDID $EDID after for crash $Crashcode", 'AUTO_NBR');       #evaluation 1
		EDR_Eval_evaluate_EDID_Raw ("EDIDnr" => $EDID,
						"RecordNumber" => $Buffer,
						"CrashLabel" => $Crashcode,
						"Expected_Raw_Hex" => $thisRecordExpectedValue,
						# "EvalOperator" => $tcpar_EvalOperator
						);
	}
	

	return 1;
}

sub Verified_Buffer{
	my $Buffer = shift;
	my $Crashcode = shift;
	my %CrashData = @_;
	S_w2rep ("In buffer: $Buffer \n");
	# S_w2rep ("Crashcode: $Crashcode \n");
	foreach my $edid ( keys %CrashData )
	{
		
		my $value = $CrashData{$edid};
		S_w2rep ("Value of EDID $edid in buffer $Buffer is $value\n");
		
	      
	
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
	if (($tcpar_PowerOff eq 'Yes') && ($EDID == 4011))
	{
		$Expectedvalue = $Expectedvalue + 1;
	}
	

    S_teststep_expected("($dataElement) should be $Expectedvalue cycles", "read_edid_value_$EDID\_$Buffer"); #evaluation 1
    S_teststep_detected("($dataElement) is: $detectedvalue cycles", "read_edid_value_$EDID\_$Buffer");
    EVAL_evaluate_value ( "EDID_$EDID\_Evaluation", $detectedvalue,'==', $Expectedvalue );
		
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
