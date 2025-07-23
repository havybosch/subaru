#### TEST CASE MODULE
package TC_EDID_MEssageCommunicationError;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_EDID_MEssageCommunicationError.pm 1.1 2019/07/05 06:59:09ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;

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

TC_EDID_MEssageCommunicationError

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault 


I<B<Stimulation and Measurement>>

1. Create <Condition> for <COMMessage>

2. Wait <TimeInvalidBeforeCrash_msec>

3. Inject a Crash <Crashcode>

4. Read <EDID> data of the corresponding to COM Message


I<B<Evaluation>>

1. -

2. -

3. -

4. <COMerror_value>corresponding to <COMMessage> should be reported


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Condition' => 
	SCALAR 'Crashcode' => 
	SCALAR 'COMMessage' => 
	SCALAR 'COMerror_value' => 
	SCALAR 'purpose' => 
	SCALAR 'TimeInvalidBeforeCrash_msec' => 
	SCALAR 'EDID' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'check the Value recorded in EDR when there in communication error in COM message'
	
	TimeInvalidBeforeCrash_msec= '6000'  #msec
	EDID = '<Fetch {EDID}>'
	DiagType = 'AKLV'
	ResultDB='EDR'
	Condition=<Test Heading 2>
	Crashcode='Single_EDR_Rollover_Inflatable;5'
	COMMessage='VDC138'
	COMerror_value='0x01'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_TimeInvalidBeforeCrash_msec;
my $tcpar_EDID;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_COM_Signal;
my $tcpar_Condition;
my $tcpar_Crashcode;
my $tcpar_COMMessage;
my $tcpar_COMerror_value;

################ global parameter declaration ###################
#add any global variables here
my ($record_handler, $crash_handler,$recordIsThere, $crashSettings, $edrNumberOfEventsToBeStored);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_TimeInvalidBeforeCrash_msec =  GEN_Read_mandatory_testcase_parameter( 'TimeInvalidBeforeCrash_msec' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_COM_Signal= GEN_Read_mandatory_testcase_parameter( 'COM_Signal' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_Crashcode =  GEN_Read_mandatory_testcase_parameter( 'Crashcode' );
	#$tcpar_Crashcode ='Single_EDR_Front_Inflatable_Stage1;5';
	$tcpar_COMMessage =  GEN_Read_mandatory_testcase_parameter( 'COMMessage' );
	$tcpar_COMerror_value =  GEN_Read_mandatory_testcase_parameter( 'COMerror_value' );
    
    #unless( defined $tcpar_Method ) {
  		#S_w2rep(" -->  Missing optional parameter 'Method', By default script uses 'Constant' as the method. \n");
  		#$tcpar_Method = 'Constant';
	#}
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

	S_teststep("Create '$tcpar_Condition' for '$tcpar_COMMessage'", 'AUTO_NBR');
if($tcpar_Condition eq 'Checksumerror')
{
	COM_setSignalState($tcpar_COM_Signal ,'1');
}
elsif($tcpar_Condition eq 'MessageCounter') 
{
	
	COM_setSignalState($tcpar_COM_Signal ,'1');
	
}
elsif($tcpar_Condition eq 'timeout') 
{
	COM_stopMessages($tcpar_COMMessage);
	
}
elsif($tcpar_Condition eq 'Nofault') 
{
	#Do nothing;
	
}
else
{
	#Do nothing;
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
	
	S_teststep("Read '$tcpar_EDID' data of the corresponding to COM Message", 'AUTO_NBR');			#measurement 1
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
    my $expectedValue=S_0x2dec ( $tcpar_COMerror_value );
    
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
		
		S_teststep("Read '$tcpar_EDID' data of the corresponding to COM Message", 'AUTO_NBR', "read_edid_data"."$recordNumber");	#measurement 1		
		my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID );
		my $detectedvalue = $edidData -> {"DataValue"};
		
		#$detectedvalue = S_dec2hex ($detectedvalue);
		
		
		unless(defined $detectedvalue) {
			S_set_error("No data could be obtained for EDID $tcpar_EDID");
			next;
		}
		
		S_w2log(1, "Compare detected ($detectedvalue) and expected ($expectedValue) values", 'AUTO_NBR');	
		$verdict_eval = EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $expectedValue, $detectedvalue);	
		
		$FinalVerdict = 'VERDICT_FAIL' if $verdict_eval eq 'VERDICT_FAIL';	
        S_teststep_expected("'$tcpar_COMerror_value'corresponding to '$tcpar_COMMessage' should be reported", "read_edid_data"."$recordNumber");			#evaluation 1
		S_teststep_detected("'$tcpar_COMerror_value'corresponding to '$tcpar_COMMessage' reported is equal to Obtained COM state: $edidValue in record $recordNumber ", "read_edid_data"."$recordNumber") if $FinalVerdict eq 'VERDICT_PASS';
		S_teststep_detected("'$tcpar_COMerror_value'corresponding to '$tcpar_COMMessage' is NOT equal to Obtained COM state: $edidValue in record $recordNumber ", "read_edid_data"."$recordNumber") if $FinalVerdict eq 'VERDICT_FAIL';
	}

	
	return 1;
	
	
}

sub TC_finalization {
	S_w2rep("Start test case finalization...");
    if($tcpar_Condition eq 'Checksumerror')
{
	COM_setSignalState($tcpar_COM_Signal ,'0')
}
elsif($tcpar_Condition eq 'MessageCounter') 
{
	COM_setSignalState($tcpar_COM_Signal ,'0');
	
}
elsif($tcpar_Condition eq 'timeout') 
{
	COM_startMessages($tcpar_COMMessage);
	
}
S_w2rep("Delete all object instances created...");
	#foreach my $recordNumber (1..$edrNumberOfEventsToBeStored)
	#{
	#	$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode."_COM_Error", "RecordNumber" => $recordNumber);	
	#}
	
	#$crash_handler->DeleteAllSources();
	$record_handler->DeleteAllRecords();

	# Erase EDR
	PD_ClearCrashRecorder_NOERROR();
	S_wait_ms(2000);

	# Erase Fault memory
	PD_ClearFaultMemory();
	S_wait_ms(10000);

	# Read fault memory after clearing and erasing EDR
		PD_ReadFaultMemory();   
    GEN_Power_on_Reset(); 
    PD_ReadFaultMemory();    

	LC_ECU_Off();
	

	
	return 1;
}

1;

