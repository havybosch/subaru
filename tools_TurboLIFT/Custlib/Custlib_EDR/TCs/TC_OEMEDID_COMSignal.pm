#### TEST CASE MODULE
package TC_OEMEDID_COMSignal;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_OEMEDID_COMSignal.pm 1.1 2019/07/05 06:59:11ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;

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
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_OEMEDID_COMSignal

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault 


I<B<Stimulation and Measurement>>

1. Set <COMSignal> with different <COM_signalstate>

2. Wait for <Wait_time_msec> till the signal is transmitted on the COM

3. Inject a crash <Crashcode>

4. Read <EDID> 


I<B<Evaluation>>

1. -

2. -

3. -

4. COMSignal value corresponding to COMSignalState should be reported


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'COM_signalstate' => 
	SCALAR 'Crashcode' => 
	SCALAR 'CrashTimeZero_ms' => 
	SCALAR 'COMSignal_value' => 
	SCALAR 'COMSignal' => 
	SCALAR 'purpose' => 
	SCALAR 'Wait_time_msec' => 
	SCALAR 'EDID' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'Validate COM signal related EDIDs for Different COM signals with Valid Data on COM Signal'
	
	
	Wait_time_msec = '6000'
	
	EDID = '<Fetch {EDID}>'
	
	
	DiagType = 'AKLV'
	ResultDB = 'EDR'
	COM_signalstate='0'#COMSignal set to0
	Crashcode= 'Single_EDR_Front_Inflatable;5'
	CrashTimeZero_ms = '11.76'#ms
	COMSignal_value='0x00'
	COMSignal='TCU048_3_0_IND_SHIFT_POS'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Wait_time_msec;
my $tcpar_EDID;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_COM_signalstate;
my $tcpar_Crashcode;
my $tcpar_CrashTimeZero_ms;
my $tcpar_COMSignal_value;
my $tcpar_COMSignal;

################ global parameter declaration ###################
#add any global variables here
my ($record_handler, $crash_handler,$recordIsThere, $crashSettings, $edrNumberOfEventsToBeStored);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Wait_time_msec =  GEN_Read_mandatory_testcase_parameter( 'Wait_time_msec' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_COM_signalstate =  GEN_Read_mandatory_testcase_parameter( 'COM_signalstate' );
	$tcpar_Crashcode =  GEN_Read_mandatory_testcase_parameter( 'Crashcode' );
	$tcpar_CrashTimeZero_ms =  GEN_Read_mandatory_testcase_parameter( 'CrashTimeZero_ms' );
	$tcpar_COMSignal_value =  GEN_Read_mandatory_testcase_parameter( 'COMSignal_value' );
	$tcpar_COMSignal =  GEN_Read_mandatory_testcase_parameter( 'COMSignal' );

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
	S_w2rep("Get crash settings for crash $tcpar_Crashcode");
    my $crashDetails_href = {"RESULTDB" => $tcpar_ResultDB, 'CRASHNAME'=> $tcpar_Crashcode};
	$crashSettings = CREIS_GetCrashSettingsFromMDS($crashDetails_href);
	unless($crashSettings) {
		S_set_error("Crashcode '$tcpar_Crashcode' not available in given Result DB. Abort test case.");
		return;
	}

	my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$tcpar_ResultDB" ] );
	my $resultDB_Path = $resultDBDetails->{'PATH'};
	S_w2log(1, "Crashcode: $tcpar_Crashcode, ResultDB: $tcpar_ResultDB (path: $resultDB_Path)");
    S_w2log(1, "Set environments for crash as per result DB");
	CREIS_SetEnvironmentForCrash($crashSettings);

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_COMSignal' with different '$tcpar_COM_signalstate'", 'AUTO_NBR');
	if($tcpar_COMSignal eq 'BIU3AC_6_4_REVERSE_MT')
	{COM_setSignalState('EGI345_2_7_TRANSMISSION_TYPE' ,'1');
		
	}
	else
	{COM_setSignalState('EGI345_2_7_TRANSMISSION_TYPE' ,'0');
		
	}
   COM_setSignalState($tcpar_COMSignal,$tcpar_COM_signalstate,'CAN');	
   
	S_teststep("Wait for '$tcpar_Wait_time_msec' till the signal is transmitted on the COM", 'AUTO_NBR');
    S_wait_ms(2000);
    #--------------------------------------------------------------
    #Prepare crash
    CREIS_PrepareCrash($crashSettings) unless $main::opt_offline;
		# Power ON the ECU
     S_wait_ms(6000);
    
    # CRASH INJECTION
	S_teststep("Inject a crash '$tcpar_Crashcode'", 'AUTO_NBR');
    CREIS_InjectCrash();
    S_wait_ms(20000);
    # This step is done in order to clear LCT of stored values
    LC_MeasureTraceDigitalStop();
	my $lct_Data = LC_MeasureTraceDigitalGetValues(); 
	
	my $dataStoragePath = "$main::REPORT_PATH/".$tcpar_Crashcode;

	$edrNumberOfEventsToBeStored = 2;
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("Not available in SYC - add or overwrite with Custlibrary Function");
		return;
	}
		 
	S_w2rep("edrNumberOfEventsToBeStored=$edrNumberOfEventsToBeStored");
	
	S_teststep("Read '$tcpar_EDID' ", 'AUTO_NBR');			#measurement 1
	EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								"CrashLabel" => $tcpar_Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								);
	

	return 1;
}

sub TC_evaluation {
    my $verdict_eval='VERDICT_PASS';
	my $FinalVerdict='VERDICT_PASS';
	my $edidValue;
    my $expectedValue= hex $tcpar_COMSignal_value;
    if($tcpar_COMSignal_value eq 'InvalidData')
    {$expectedValue='InvalidData';}
    if($tcpar_Crashcode =~ /Multi/) 
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
																  "CrashLabel" => $tcpar_Crashcode);

		S_w2log(1, "--------------------");
		S_w2rep(1,"EDID $tcpar_EDID ($dataElement) validation in record $recordNumber for crash label $tcpar_Crashcode ");
		S_w2log(1, "--------------------");
		
		S_teststep("Read '$tcpar_EDID' corresponding to COM signal", 'AUTO_NBR', "read_edid_COMSIGNAL"."$recordNumber");			#measurement 1			
		my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID );
		my $detectedvalue = $edidData -> {"DataValue"};
	
		
		unless(defined $detectedvalue) {
			S_set_error("No data could be obtained for EDID $tcpar_EDID");
			next;
		}
		
		S_w2log(1, "Compare detected ($detectedvalue) and expected ($expectedValue) values", 'AUTO_NBR');	
		$verdict_eval = EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $expectedValue, $detectedvalue );	
		
		$FinalVerdict = 'VERDICT_FAIL' if $verdict_eval eq 'VERDICT_FAIL';	
		S_teststep_expected("COMSignalValue reported in EDR is '$tcpar_COMSignal_value'", "read_edid_COMSIGNAL"."$recordNumber");			#evaluation 1
		S_teststep_detected("Expected COM state in EDR :$tcpar_COMSignal_value is equal to Obtained COM state: $edidValue in record $recordNumber ", "read_edid_COMSIGNAL"."$recordNumber") if $FinalVerdict eq 'VERDICT_PASS';
		S_teststep_detected("Expected COM state in EDR :$tcpar_COMSignal_value is NOT equal to Obtained COM state: $edidValue in record $recordNumber ", "read_edid_COMSIGNAL"."$recordNumber") if $FinalVerdict eq 'VERDICT_FAIL';
	}

	#S_teststep_expected("COMSignal value corresponding to COMSignalState should be reported", 'read_edid');			#evaluation 1
	#S_teststep_detected("<<add detected result here>>", 'read_edid');

	return 1;
}

sub TC_finalization {

S_w2rep("Start test case finalization...");
	
	S_w2rep("Delete all object instances created...");
	#foreach my $recordNumber (1..$edrNumberOfEventsToBeStored)
	#{
	#	$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNumber);	
	#}
	$record_handler->DeleteAllRecords();

	# Erase EDR
	PD_ClearCrashRecorder_NOERROR();
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

