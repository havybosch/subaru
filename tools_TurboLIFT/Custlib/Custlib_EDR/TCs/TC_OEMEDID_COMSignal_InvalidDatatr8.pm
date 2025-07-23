#### TEST CASE MODULE
package TC_OEMEDID_COMSignal_InvalidData;
#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_OEMEDID_COMSignal_InvalidDatatr8.pm 1.1 2019/07/05 06:59:11ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;

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

TC_OEMEDID_COMSignal_InvalidData

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault 


I<B<Stimulation and Measurement>>

1. Set the <COMSignal> to its default state which is fetched from mapping

2. Wait for <WaitTimeTransmitSignal_msec> till the signal is transmitted on the COM bus

3. Create <Condition> for <COMSignal>

4. Wait <TimeInvalidBeforeCrash_msec>

5. Inject a Crash <Crashcode>

6. Read <EDID> corresponding to COM signal


I<B<Evaluation>>

1. -

2. -

3. -

4. - 

5. -

6. COMSignalValue corresponding to <COMSignalAfterInvalidState>should be reported in EDR


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'COM_Message' => 
	SCALAR 'Condition' => 
	SCALAR 'COMSignal' => 
	SCALAR 'purpose' => 
	SCALAR 'WaitTimeTransmitSignal_msec' => 
	SCALAR 'TimeInvalidBeforeCrash_msec' => 
	SCALAR 'Crashcode' => 
	SCALAR 'EDID' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 
	SCALAR 'wait_ms' => 
	SCALAR 'expected_nr_of_records' => 
	SCALAR 'COMSignalAfterInvalidState' => 
	SCALAR 'Protocol' => 
	HASH 'COMsignalsAfterCrash' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'Validate COM signal relavent EDID in EDR when Invalid data is obtained on COM signal'
	WaitTimeTransmitSignal_msec = '6000'
	TimeInvalidBeforeCrash_msec = '6000'
	Crashcode= '<Fetch {Crash file name in WorldDB}>'
	EDID = '<Fetch {EDID}>'
	DiagType  = 'AKLV' 
	ResultDB = 'EDR'
	wait_ms='20000'
	expected_nr_of_records  = 1
	# COMSignal = 'TBD'
	COMSignalAfterInvalidState = 'InvalidData'
	Protocol='CAN'
	COMsignalsAfterCrash = %()
	#As defined in CAN mappile file
	
	COM_Message= 'TCU048'
	Condition='CRC_Error'
	COMSignal='TCU048_3_0_IND_SHIFT_POS'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_WaitTimeTransmitSignal_msec;
my $tcpar_TimeInvalidBeforeCrash_msec;
my $tcpar_Crashcode;
my $tcpar_EDID;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_wait_ms;
my $tcpar_expected_nr_of_records;
my $tcpar_COMSignalAfterInvalidState;
my $tcpar_Protocol;
my $tcpar_COMsignalsAfterCrash;
my $tcpar_COM_Message;
my $tcpar_Condition;
my $tcpar_COMSignal;

################ global parameter declaration ###################
#add any global variables here
my ($record_handler, $crash_handler,$recordIsThere, $crashSettings, $edrNumberOfEventsToBeStored);


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_WaitTimeTransmitSignal_msec =  GEN_Read_mandatory_testcase_parameter( 'WaitTimeTransmitSignal_msec' );
	$tcpar_TimeInvalidBeforeCrash_msec =  GEN_Read_mandatory_testcase_parameter( 'TimeInvalidBeforeCrash_msec' );
	$tcpar_Crashcode =  GEN_Read_mandatory_testcase_parameter( 'Crashcode' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_wait_ms =  GEN_Read_mandatory_testcase_parameter( 'wait_ms' );
	$tcpar_expected_nr_of_records =  GEN_Read_mandatory_testcase_parameter( 'expected_nr_of_records' );
	$tcpar_COMSignalAfterInvalidState =  GEN_Read_mandatory_testcase_parameter( 'COMSignalAfterInvalidState' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_COMsignalsAfterCrash =  GEN_Read_mandatory_testcase_parameter( 'COMsignalsAfterCrash' );
	$tcpar_COM_Message =  GEN_Read_mandatory_testcase_parameter( 'COM_Message' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
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

	S_teststep("Set the '$tcpar_COMSignal' to its default state which is fetched from mapping", 'AUTO_NBR');

	S_teststep("Wait for '$tcpar_WaitTimeTransmitSignal_msec' till the signal is transmitted on the COM bus", 'AUTO_NBR');
    S_wait_ms($tcpar_WaitTimeTransmitSignal_msec);
	S_teststep("Create '$tcpar_Condition' for '$tcpar_COMSignal'", 'AUTO_NBR');
    if($tcpar_Condition eq 'ChecksumError')
{
	COM_setSignalState($tcpar_COMSignal ,'1');
}
elsif($tcpar_Condition eq 'MessageCounterError') 
{
	
	COM_setSignalState($tcpar_COMSignal ,'1');
	
}
elsif($tcpar_Condition eq 'WrongTransmissionType') 
{
	if($tcpar_COM_Message eq 'TCU048')
	{
	COM_setSignalState('EGI345_2_7_TRANSMISSION_TYPE' ,'1');
	}
	elsif($tcpar_COM_Message eq 'BIU3AC')
	{
	COM_setSignalState('EGI345_2_7_TRANSMISSION_TYPE' ,'0');
	}
	
}
elsif($tcpar_Condition eq 'Undefined1') 
{
	
	COM_setSignalState('TCU048_3_0_IND_SHIFT_POS' ,'6');
	
}
elsif($tcpar_Condition eq 'Undefined2') 
{
	
	COM_setSignalState('TCU048_3_0_IND_SHIFT_POS' ,'7');
	
}
elsif($tcpar_Condition eq 'MessageTimeout') 
{
	COM_stopMessages($tcpar_COM_Message);
	
}
	CREIS_PrepareCrash($crashSettings) unless $main::opt_offline;
		# Power ON the ECU
	LC_ECU_On();
 	S_wait_ms('TIMER_ECU_READY'); 
	S_teststep("Wait '$tcpar_TimeInvalidBeforeCrash_msec'", 'AUTO_NBR');
    S_wait_ms($tcpar_TimeInvalidBeforeCrash_msec);
	S_teststep("Inject a Crash '$tcpar_Crashcode'", 'AUTO_NBR');
    CREIS_InjectCrash();
    S_wait_ms(20000);
    LC_MeasureTraceDigitalStop();
	my $lct_Data = LC_MeasureTraceDigitalGetValues(); 
	
	my $dataStoragePath = "$main::REPORT_PATH/".$tcpar_Crashcode;

	$edrNumberOfEventsToBeStored = 2;
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("Not available in SYC - add or overwrite with Custlibrary Function");
		return;
	}
		 
	S_w2rep("edrNumberOfEventsToBeStored=$edrNumberOfEventsToBeStored");
	
	S_teststep("Read '$tcpar_EDID' corresponding to COM signal", 'AUTO_NBR');			#measurement 1
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
    my $expectedValue=$tcpar_COMSignalAfterInvalidState;
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

		S_w2log(1, "*****************");
		S_w2log(1, "EDID $tcpar_EDID ($dataElement) validation in record $recordNumber for crash label $tcpar_Crashcode ");
		S_w2log(1, "*****************");
		
		S_teststep("Read '$tcpar_EDID' data of the corresponding to COM Message", 'AUTO_NBR', "read_edid_invaliddata"."$recordNumber");	#measurement 1		
		my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID );
		my $detectedvalue = $edidData -> {"DataValue"};
		
		
		unless(defined $detectedvalue) {
			S_set_error("No data could be obtained for EDID $tcpar_EDID");
			next;
		}
		
		S_w2log(1, "Compare detected ($detectedvalue) and expected ($expectedValue) values", 'AUTO_NBR');	
		$verdict_eval = EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $expectedValue, $detectedvalue );	
		
		$FinalVerdict = 'VERDICT_FAIL' if $verdict_eval eq 'VERDICT_FAIL';	
        S_teststep_expected("COMSignalValue corresponding to '$tcpar_COMSignalAfterInvalidState'should be reported in EDR", "read_edid_invaliddata"."$recordNumber");			#evaluation 1
		S_teststep_detected("COMSignalValue corresponding to '$tcpar_COMSignalAfterInvalidState'is reported is equal to obtained COM state: $edidValue in record $recordNumber ", "read_edid_invaliddata"."$recordNumber") if $FinalVerdict eq 'VERDICT_PASS';
		S_teststep_detected("COMSignalValue corresponding to '$tcpar_COMSignalAfterInvalidState'is reported is not equal to obtained COM state: $edidValue in record $recordNumber ", "read_edid_invaliddata"."$recordNumber") if $FinalVerdict eq 'VERDICT_FAIL';
	}

	

	return 1;
}

sub TC_finalization {
if($tcpar_Condition eq 'ChecksumError')
{
	COM_setSignalState($tcpar_COMSignal ,'0');
}
elsif($tcpar_Condition eq 'MessageCounterError') 
{
	
	COM_setSignalState($tcpar_COMSignal ,'0');
	
}
elsif($tcpar_Condition eq 'WrongTransmissionType') 
{
	if($tcpar_COM_Message eq 'TCU048')
	{
	COM_setSignalState('EGI345_2_7_TRANSMISSION_TYPE' ,'0');
	}
	elsif($tcpar_COM_Message eq 'BIU3AC')
	{
	COM_setSignalState('EGI345_2_7_TRANSMISSION_TYPE' ,'1');
	}
	
}
S_wait_ms(2000);
COM_setSignalState('TCU048_3_0_IND_SHIFT_POS' ,'3');#valid value
	S_w2rep("Delete all object instances created...");
	#foreach my $recordNumber (1..$edrNumberOfEventsToBeStored)
	#{
	#	$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNumber);	
	#}
	$record_handler->DeleteAllRecords();

	# Erase EDR
	PD_ClearCrashRecorder_NOERROR();
	S_wait_ms(2000);
	
	
    PD_ReadFaultMemory();  
	# Erase Fault memory
	PD_ClearFaultMemory();
	S_wait_ms(10000);
	#PD_ECUreset('Hard_reset');

	# Read fault memory after clearing and erasing EDR
	PD_ReadFaultMemory();   
    GEN_Power_on_Reset(); 
    PD_ReadFaultMemory(); 
	LC_ECU_Off();

	return 1;
}

1;

