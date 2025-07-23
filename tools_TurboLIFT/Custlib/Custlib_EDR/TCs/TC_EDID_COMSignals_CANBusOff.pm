#### TEST CASE MODULE
package TC_EDID_COMSignals_CANBusOff;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_EDID_COMSignals_CANBusOff.pm 1.1 2019/07/05 06:59:08ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS name> (e.g. TS_SWM_SwitchMgt)
#TS version in DOORS: <TS version based on which this script is written/updated> (e.g. 3.30)
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here
use LIFT_CREIS;
use LIFT_labcar;
use LIFT_can_access;
use LIFT_PD;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use GENERIC_DCOM;
use FuncLib_EDR_Framework;
use FuncLib_TNT_SYC_INTERFACE;
use Data::Dumper;
use LIFT_TSG4;

##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_COMSignals_CANBusOff

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault 


I<B<Stimulation and Measurement>>

1. Create CAN BusOFF

2. Wait for <Wait_time_msec> 

3. Inject a <CrashCode>

4. Remove CAN BusOff

5. Wait for <wait_ms>.

6. Read <EDID> corresponding to COM signal


I<B<Evaluation>>

1. -

2. -

3. -

4. -

5. COMSignalValue corresponding to <ExpectedCOMSignalData> should be reported


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'ExpectedCOMSignalData' => 
	SCALAR 'purpose' => 
	SCALAR 'Wait_time_msec' => 
	SCALAR 'EDID' => 
	SCALAR 'wait_ms' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 
	SCALAR 'CrashCode' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'check COM signal relevant OEM EDIDs in EDR when CAN BusOff is created'
	
	Wait_time_msec = '6000'  #msec
	EDID = '<Fetch {EDID}>'
	
	wait_ms= '15000'  #ms
	
	
	DiagType = 'AKLV'
	ResultDB='EDR'
	
	CrashCode='Multi_EDR_Side_ND_Front_AD;5'
	ExpectedCOMSignalData='0x01'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Wait_time_msec;
my $tcpar_EDID;
my $tcpar_wait_ms;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_CrashCode;
my $tcpar_EDR1_val;
my $tcpar_EDR2_val;

################ global parameter declaration ###################
#add any global variables here
my ($record_handler, $crash_handler,$recordIsThere, $crashSettings, $edrNumberOfEventsToBeStored);


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Wait_time_msec =  GEN_Read_mandatory_testcase_parameter( 'Wait_time_msec' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_wait_ms =  GEN_Read_mandatory_testcase_parameter( 'wait_ms' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_CrashCode =  GEN_Read_mandatory_testcase_parameter( 'CrashCode' );
	$tcpar_EDR1_val =  GEN_Read_mandatory_testcase_parameter( 'EDR1_val' );
	$tcpar_EDR2_val =  GEN_Read_mandatory_testcase_parameter( 'EDR2_val' );

	return 1;
}

sub TC_initialization {

	S_w2rep("StandardPrepNoFault");
	S_w2rep("Initialize Record and Crash Handler");
	$record_handler = EDR_init_RecordHandler();

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

    # PREPARE CRASH AND INITIALIZE EQUIPMENT
	S_w2rep("Get crash settings for crash $tcpar_CrashCode");
    my $crashDetails_href = {"RESULTDB" => $tcpar_ResultDB, 'CRASHNAME'=> $tcpar_CrashCode};
	$crashSettings = CREIS_GetCrashSettingsFromMDS($crashDetails_href);
	unless($crashSettings) {
		S_set_error("Crashcode '$tcpar_CrashCode' not available in given Result DB. Abort test case.");
		return;
	}

	my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$tcpar_ResultDB" ] );
	my $resultDB_Path = $resultDBDetails->{'PATH'};
	S_w2log(1, "Crashcode: $tcpar_CrashCode, ResultDB: $tcpar_ResultDB (path: $resultDB_Path)");
    S_w2log(1, "Set environments for crash as per result DB");
	CREIS_SetEnvironmentForCrash($crashSettings);


	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Create CAN BusOFF", 'AUTO_NBR');
       	FM_createFault('rb_coa_CANBusOff_flt');
    
	S_teststep("Wait for '$tcpar_Wait_time_msec' ", 'AUTO_NBR');
    S_wait_ms(6000);
	S_teststep("Inject a '$tcpar_CrashCode'", 'AUTO_NBR');
	CREIS_PrepareCrash($crashSettings) unless $main::opt_offline;
		
     S_wait_ms(6000);
    CREIS_InjectCrash();
    LC_MeasureTraceDigitalStop();
	my $lct_Data = LC_MeasureTraceDigitalGetValues(); 
	
	my $dataStoragePath = "$main::REPORT_PATH/".$tcpar_CrashCode;

	$edrNumberOfEventsToBeStored =2;
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("Not available in SYC - add or overwrite with Custlibrary Function");
		return;
	}
		 
	S_w2rep("edrNumberOfEventsToBeStored=$edrNumberOfEventsToBeStored");

	S_teststep("Remove CAN BusOff", 'AUTO_NBR');
        	FM_removeFault('rb_coa_CANBusOff_flt');
	S_teststep("Wait for '$tcpar_wait_ms'.", 'AUTO_NBR', 'wait_for_wait');			
    S_wait_ms($tcpar_Wait_time_msec);
	S_teststep("Read '$tcpar_EDID' in EDR1 and EDR2 memory.", 'AUTO_NBR');	#measurement 1
    EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								"CrashLabel" => $tcpar_CrashCode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								);
	
	return 1;
}

sub TC_evaluation {
     my $verdict_eval='VERDICT_PASS';
	my $FinalVerdict='VERDICT_PASS';
	my $edidValue;
    my $expectedValue =$tcpar_EDR1_val,;
    if($tcpar_CrashCode =~ /Multi/) 
    	{
    		$edrNumberOfEventsToBeStored = 2;
    	}
    	else
    	{
    		$edrNumberOfEventsToBeStored = 1;
    	}
	for(my $recordNumber = 1; $recordNumber <= $edrNumberOfEventsToBeStored; $recordNumber++)
	{
		my $dataElement = $record_handler -> GetDataElementEDID(  "EDIDnr" => $tcpar_EDID,
																  "RecordNumber" => $recordNumber,
																  "CrashLabel" => $tcpar_CrashCode);

		S_w2log(1, "*****************");
		S_w2log(1, "EDID $tcpar_EDID ($dataElement) validation in record $recordNumber for crash label $tcpar_CrashCode ");
		S_w2log(1, "*****************");
		
		S_teststep("Read '$tcpar_EDID' data of the corresponding to PODS", 'AUTO_NBR', "read_edid_data_BusOFF"."$recordNumber");	#measurement 1		
		my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $tcpar_CrashCode, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID );
		my $detectedvalue = $edidData -> {"DataValue"};
		
		
		unless(defined $detectedvalue) {
			S_set_error("No data could be obtained for EDID $tcpar_EDID");
			next;
		}
		
		S_w2log(1, "Compare detected ($detectedvalue) and expected ($expectedValue) values", 'AUTO_NBR');	
		$verdict_eval = EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $expectedValue, $detectedvalue );	
		
		$FinalVerdict = 'VERDICT_FAIL' if $verdict_eval eq 'VERDICT_FAIL';	
	
	S_teststep_expected("EDR1 should be reporting value '$tcpar_EDR1_val' and EDR2 should be reporting value '$tcpar_EDR2_val'","read_edid_data_BusOFF"."$recordNumber");
	S_teststep_detected("The CAN failure reported value is equal to EDR1 '$tcpar_EDR1_val' ","read_edid_data_BusOFF"."$recordNumber")if $FinalVerdict eq 'VERDICT_PASS';
	S_teststep_detected("The CAN failure  reported value is not equal to  EDR1 '$tcpar_EDR1_val' ","read_edid_data_BusOFF"."$recordNumber")if $FinalVerdict eq 'VERDICT_FAIL';
	}
    
	
	return 1;
}

sub TC_finalization {
    foreach my $recordNumber (1..$edrNumberOfEventsToBeStored)
	{
		$record_handler -> DeleteRecord("CrashLabel" => $tcpar_CrashCode, "RecordNumber" => $recordNumber);	
	}

	# Erase EDR
	PD_ClearCrashRecorder_NOERROR();
	S_wait_ms(2000);
    PD_ECUreset('Hard_reset');
    S_wait_ms(2000);
	# Erase Fault memory
	PD_ClearFaultMemory();
	S_wait_ms(10000);
	
    
	# Read fault memory after clearing and erasing EDR
	PD_ReadFaultMemory();   

	LC_ECU_Off();
	

    
	return 1;
}


1;
