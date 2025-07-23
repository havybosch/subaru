#### TEST CASE MODULE
package TC_EDID_MultiEvent;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_EDID_MultiEvent.pm 1.1 2019/07/05 06:59:10ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;

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
##################################

our $PURPOSE = " To verify EDID data multi event number and time from previous event to current event";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_MultiEvent

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1) Switch ON the ECU 

2) Inject <Crash_Code1>

3)Wait for <Wait_Time_For_Second_Crash_ms>

4)Create <Condition> on ABG ECU.

5) Inject <Crash_Code2>

6) Read the EDIDs in EDR 1 & EDR 2


I<B<Evaluation>>

1)-

2)-

3)-

4)-

5)-

6) 

Following values should be reported in EDR1 and EDR2

<CompareValues_CT1>

<CompareValues_CT2>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Crash_Code1' => 
	SCALAR 'Wait_Time_For_Second_Crash_ms' => 
	HASH 'CompareValues_CT1' => 
	HASH 'CompareValues_CT2' => 
	SCALAR 'purpose' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 
	SCALAR 'Crash_Code2' => 
	SCALAR 'TimeTolerance_s' => 
	SCALAR 'Condition' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To Inject a crash and validate EDID 45 and EDID 46 in EDR 1 & EDR 2'
	#---- Stimulation ---
	DiagType  = 'AKLV'
	ResultDB = 'EDR'
	Crash_Code2 = ''
	TimeTolerance_s = '0.1' #sec
	Condition=''
	Crash_Code1 ='Single_EDR_Front_Inflatable;5'
	
	Wait_Time_For_Second_Crash_ms=0 #ms
	CompareValues_CT1 = %('45' => '0x01', '46' => '0x00') 
	
	CompareValues_CT2 = %('45' => '0xFF', '46' => '0xFF') 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_Crash_Code2;
my $tcpar_TimeTolerance_s;
my $tcpar_Condition;
my $tcpar_Crash_Code1;
my $tcpar_Wait_Time_For_Second_Crash_ms;
my $tcpar_CompareValues_CT1;
my $tcpar_CompareValues_CT2;
my $tcpar_EDID1;
my $tcpar_EDID2;


################ global parameter declaration ###################
#add any global variables here
my $crashSettings1;
my $crashSettings2;
my $crashDetails_href;
my $dataStoragePath;
my $CrashLabel;
my $record_handler;
my $crash_handler;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_Crash_Code2 =  GEN_Read_optional_testcase_parameter( 'Crash_Code2' );
	$tcpar_TimeTolerance_s =  GEN_Read_mandatory_testcase_parameter( 'TimeTolerance_s' );
	$tcpar_Condition =  GEN_Read_optional_testcase_parameter( 'Condition' );
	$tcpar_Crash_Code1 =  GEN_Read_mandatory_testcase_parameter( 'Crash_Code1' );
	$tcpar_Wait_Time_For_Second_Crash_ms =  GEN_Read_optional_testcase_parameter( 'Wait_Time_For_Second_Crash_ms' );
	$tcpar_CompareValues_CT1 =  GEN_Read_mandatory_testcase_parameter( 'CompareValues_CT1','byref' );
	$tcpar_CompareValues_CT2 =  GEN_Read_mandatory_testcase_parameter( 'CompareValues_CT2' ,'byref');
	$tcpar_EDID1 = GEN_Read_optional_testcase_parameter('EDID1');
	$tcpar_EDID2 = GEN_Read_optional_testcase_parameter('EDID2');
	
	
	
	
	if(defined $tcpar_Crash_Code2){
		$CrashLabel= $tcpar_Crash_Code1."_".$tcpar_Crash_Code2;
		
	}
	else {
		$CrashLabel= $tcpar_Crash_Code1;
	}
	
	
	$dataStoragePath = "$main::REPORT_PATH/".$CrashLabel;

	return 1;
}

sub TC_initialization {

	S_w2rep("StandardPrepNoFault");
	S_w2rep("Initialize Record and Crash Handler");
		$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;
	S_teststep("Start CAN Trace", 'AUTO_NBR');
    CA_trace_start();

	S_w2log(1, "Power on ECU");
    LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');

	PD_ClearCrashRecorder_NOERROR();
	S_wait_ms(6000);

	S_w2log(1, "Clear fault memory");
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	GDCOM_init () ;

	#--------------------------------------------------------------
    # CRASH PREPARATION
	S_w2log(1, "Prepare crash" );
	
	
		my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$tcpar_ResultDB" ] );
		my $resultDB_Path = $resultDBDetails->{'PATH'};
		S_w2log(1, "Crashcode: $tcpar_Crash_Code1, ResultDB: $tcpar_ResultDB (path: $resultDB_Path) loaded");

    # PREPARE CRASH AND INITIALIZE EQUIPMENT
	S_w2rep("Get crash settings for crash $tcpar_Crash_Code1");
    my $crashDetails_href = {"RESULTDB" => $tcpar_ResultDB, 'CRASHNAME'=> $tcpar_Crash_Code1};
	$crashSettings1 = CSI_GetCrashDataFromMDS($crashDetails_href);
	unless($crashSettings1) {
		S_set_error("Crashcode '$tcpar_Crash_Code1' not available in given Result DB. Abort test case.");
		return;
	}
	S_w2log(1, "Crashcode: $tcpar_Crash_Code1, ResultDB: $tcpar_ResultDB (path: $resultDB_Path) loaded");
	
  if(defined $tcpar_Crash_Code2)
  {
		S_w2rep("Get crash settings for crash $tcpar_Crash_Code2");
		$crashDetails_href = {"RESULTDB" => $tcpar_ResultDB, 'CRASHNAME'=> $tcpar_Crash_Code2};
		$crashSettings2 = CSI_GetCrashDataFromMDS($crashDetails_href);
		unless(defined $crashSettings2) 
		{
		 S_set_error("Crash $tcpar_Crash_Code2 not available in result DB $tcpar_ResultDB. Test case aborted.");
				return;
		}
			S_w2log(1, "Crashcode: $tcpar_Crash_Code2, ResultDB: $tcpar_ResultDB (path: $resultDB_Path) loaded");

  }
  
  # CREIS_PrepareCrash($crashSettings1) unless $main::opt_offline;
    CSI_PrepareEnvironment($crashSettings1, 'init_complete');
	
	
	return 1;
}

sub TC_stimulation_and_measurement {	
	
	S_teststep("Prepare crash ", 'AUTO_NBR');

    LC_ECU_Off();
    S_wait_ms('TIMER_ECU_OFF');

    # Prepare crash
    CSI_LoadCrashSensorData2Simulator($crashSettings1);
    
	S_teststep(") Switch ON the ECU ", 'AUTO_NBR');
    # Power ON the ECU
    LC_ECU_On();
    S_wait_ms('TIMER_ECU_READY');
	

	S_teststep(" Inject '$tcpar_Crash_Code1'", 'AUTO_NBR');
	CSI_TriggerCrash();
	
	if( not defined $tcpar_Crash_Code2){
		S_wait_ms(20000);		
	}
	else {
		my $time_start_sec = S_get_TC_time ();
		S_wait_ms(500);
		CSI_PrepareEnvironment($crashSettings2, 'init_complete') unless $main::opt_offline;
		CSI_LoadCrashSensorData2Simulator($crashSettings2);
		my $time_end_sec = S_get_TC_time ();
		my $time_elapsed_sec =$time_end_sec-$time_start_sec;
		my $time_elapsed= $time_elapsed_sec*1000;   # converted time from secs to millisecs
		if ($time_elapsed < $tcpar_Wait_Time_For_Second_Crash_ms){
			my $wait_time= $tcpar_Wait_Time_For_Second_Crash_ms-$time_elapsed;
			S_teststep("Wait for '$tcpar_Wait_Time_For_Second_Crash_ms'", 'AUTO_NBR');
	        S_wait_ms($wait_time);
		}
		else{
			S_teststep(" Waited for '$time_elapsed' msec already, no additional wait time is required. ", 'AUTO_NBR');
		}
	    if ($tcpar_Condition eq 'rest the ECU')
	    {
	    S_teststep(")Create '$tcpar_Condition' on ABG ECU.", 'AUTO_NBR');
	    LC_ECU_Off();
		S_wait_ms('TIMER_ECU_READY');
		
		CSI_LoadCrashSensorData2Simulator($crashSettings2);
		LC_ECU_On();
		S_wait_ms('TIMER_ECU_READY');
	     
	    }
	    
	    S_teststep(" Inject '$tcpar_Crash_Code2'", 'AUTO_NBR');
	    CSI_TriggerCrash();
	    S_wait_ms(20000);
	     
	}
	S_teststep(") Read the EDIDs in EDR 1 & EDR 2", 'AUTO_NBR');
	
    PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');
	EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
							 	"CrashLabel" => $CrashLabel,
							 	"NbrOfRecords" =>  2,
							 	"StoragePath" => $dataStoragePath,
							 	);	
								
	# S_w2rep("Read recorded data in NVM section for Data ");
    # my $i = S_get_TC_number();
	# my $filename = PD_DumpNVMData($main::REPORT_PATH .'/'.$i."_ReadAllNVMSections_Dump.txt");
 
 

	return 1;
}

sub TC_evaluation {
	
	my $CrashRecord;
	
	my $storageOrder = EDR_getStorageOrder ();
	unless(defined $storageOrder) {
		S_set_error("Define storage order in EDR mapping! Must be 'MostRecentFirst' or 'MostRecentLast'");
		return;
	}
	
	if (defined $tcpar_Crash_Code2){
		$CrashRecord = {'Record_1' => { 'CrashCode' => $tcpar_Crash_Code1}, 'Record_2' => { 'CrashCode' => $tcpar_Crash_Code2}} if ( $storageOrder  eq 'MostRecentLast');
		$CrashRecord = {'Record_1' => { 'CrashCode' => $tcpar_Crash_Code2}, 'Record_2' => { 'CrashCode' => $tcpar_Crash_Code1}} if ( $storageOrder  eq 'MostRecentFirst');
	}
	else {
		$CrashRecord = {'Record_1' => { 'CrashCode' => $tcpar_Crash_Code1}};
	} 
	
	foreach my $recordNbr (1..2)
	{
		my $crash= $CrashRecord -> {"Record_$recordNbr"} -> {'CrashCode'};
		next unless(defined $crash);
		
		
		#-----------------------------------------------------------------------
		# Get EDID data
		#-----------------------------------------------------------------------
        S_teststep("Read '$tcpar_EDID1' from EDR record $recordNbr", 'AUTO_NBR', "read_edid_data_record_$recordNbr $tcpar_EDID1");         #measurement 1
		my $EDID_data1 = $record_handler -> GetDecodedEDID("CrashLabel" => $CrashLabel, "RecordNumber" =>  $recordNbr,"EDIDnr" => $tcpar_EDID1);
	
		unless(defined $EDID_data1){
			S_w2rep("No EDID data obtained from record. Try next crash.", 'red');
			S_set_verdict('VERDICT_NONE');
			next unless($main::opt_offline);
			return 1;
		}
		my $detectedvalue1 = $EDID_data1 -> {"DataValue"};
		$detectedvalue1 = sprintf("0x%02X", $detectedvalue1); 
		
		unless(defined $detectedvalue1) {
			S_set_error("No data could be obtained for EDID $tcpar_EDID2");
			next;
		}
		 S_teststep("Read '$tcpar_EDID2' from EDR record $recordNbr", 'AUTO_NBR', "read_edid_data_record_$recordNbr $tcpar_EDID2");         #measurement 1
		my $EDID_data2 = $record_handler -> GetDecodedEDID("CrashLabel" => $CrashLabel, "RecordNumber" =>  $recordNbr,"EDIDnr" => $tcpar_EDID2);
	
		unless(defined $EDID_data2){
			S_w2rep("No EDID data obtained from record. Try next crash.", 'red');
			S_set_verdict('VERDICT_NONE');
			next unless($main::opt_offline);
			return 1;
		}
		my $detectedvalue2 = $EDID_data2 -> {"DataValue"};
		
		$detectedvalue2 = sprintf("0x%02X", $detectedvalue2);
		
		unless(defined $detectedvalue2) {
			S_set_error("No data could be obtained for EDID $tcpar_EDID2");
			next;
		}
		
		if ($recordNbr  == 1)
		{
	
		 EVAL_evaluate_string ( "Record_$recordNbr: multivent no", $tcpar_CompareValues_CT1->{$tcpar_EDID1}, $detectedvalue1);
		 EVAL_evaluate_string ( "Record_$recordNbr: Time from previous event to current event", $tcpar_CompareValues_CT1->{$tcpar_EDID2}, $detectedvalue2);
		}
		  
		  if ($recordNbr == 2)
		  {
		  EVAL_evaluate_string ( "Record_$recordNbr: multivent no", $tcpar_CompareValues_CT2->{$tcpar_EDID1}, $detectedvalue1);
		  EVAL_evaluate_string ( "Record_$recordNbr: Time from previous event to current event", $tcpar_CompareValues_CT2->{$tcpar_EDID2}, $detectedvalue2);
		  }
	}
		

	return 1;
}

sub TC_finalization {

    PD_ReadFaultMemory();
    S_wait_ms(8000);

	# Erase EDR
    PD_ClearCrashRecorder();
    S_wait_ms(5000);
	
	
	# Read fault memory after crash
    PD_ReadFaultMemory();
    S_wait_ms(2000);
	
	# Erase Fault memory
    PD_ClearFaultMemory();
    S_wait_ms(5000);

	# Reset ECU    
    #PD_ECUreset();
    #S_wait_ms(2000);

	# Read fault memory after clearing and erasing EDR
    PD_ReadFaultMemory();   
    
    LC_ECU_Off();
    S_wait_ms('TIMER_ECU_OFF');
    
    S_w2rep("Clean up record and crash handler");
    $record_handler -> DeleteAllRecords();
    $crash_handler -> DeleteAllSources();

	return 1;
}


1;
