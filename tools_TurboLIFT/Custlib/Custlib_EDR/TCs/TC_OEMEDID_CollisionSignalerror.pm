#### TEST CASE MODULE
package TC_OEMEDID_CollisionSignalerror;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_OEMEDID_CollisionSignalerror.pm 1.1 2019/07/05 06:59:12ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS name> (e.g. TS_SWM_SwitchMgt)
#TS version in DOORS: <TS version based on which this script is written/updated> (e.g. 3.30)
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here
use LIFT_CREIS;
use LIFT_POWER;
use LIFT_PD;
use GENERIC_DCOM;
use LIFT_labcar;
use LIFT_LCT;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use LIFT_can_access;
use FuncLib_SYC_INTERFACE;
use FuncLib_EDR_Framework;
use LIFT_TSG4;
use Data::Dumper;

##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_OEMEDID_CollisionSignalerror

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault 


I<B<Stimulation and Measurement>>

1. Create <HWline_fault> on <Crash_OutputSignal>

2. Wait for <Wait_time_msec> till the crashsignal line fault qualify

3. Inject a crash <Crashcode>

4. Read <EDID> 


I<B<Evaluation>>

1. -

2. -

3. -

4.Communication error signal on HWline of <Crash_OutputSignal> should be reported as <error_value>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Wait_time_msec' => 
	SCALAR 'EDID' => 
	SCALAR 'Crashcode' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 
	SCALAR 'Crash_OutputSignal' => 
	SCALAR 'HWline_fault' => 
	SCALAR 'error_value' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'to check EDR data recorded when there is communication error in collision detection signal'
	
	
	Wait_time_msec = '6000'
	
	EDID = '<Fetch {EDID}>'
	
	Crashcode= '<Fetch {Crash file name in WorldDB}>'
	
	DiagType = 'AKLV'
	ResultDB = 'EDR'
	Crash_OutputSignal=<Test Heading 1>
	HWline_fault=<Test Heading 2>
	error_value='0x01'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Wait_time_msec;
my $tcpar_EDID;
my $tcpar_Crashcode;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_Crash_OutputSignal;
my $tcpar_HWline_fault;
my $tcpar_error_value;

################ global parameter declaration ###################
#add any global variables here
my ($record_handler, $crash_handler,$recordIsThere, $crashSettings, $edrNumberOfEventsToBeStored,$CrashLabel);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Wait_time_msec =  GEN_Read_mandatory_testcase_parameter( 'Wait_time_msec' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_Crashcode =  GEN_Read_mandatory_testcase_parameter( 'Crashcode' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_Crash_OutputSignal =  GEN_Read_mandatory_testcase_parameter( 'Crash_OutputSignal' );
	$tcpar_HWline_fault =  GEN_Read_mandatory_testcase_parameter( 'HWline_fault' );
	$tcpar_error_value =  GEN_Read_mandatory_testcase_parameter( 'error_value' );

	return 1;
}

sub TC_initialization {

#	S_teststep("StandardPrepNoFault ", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	
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
	
	
	S_w2log(1, "Power off ECU");
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_READY');

	#Prepare crash
	S_w2log(1, "Prepare crash");
	CREIS_PrepareCrash($crashSettings) unless $main::opt_offline;

	S_w2log(1, "Power on ECU");
    LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');

	S_w2log(1, "Read fault memory before stimulation");
	PD_ReadFaultMemory();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Create '$tcpar_HWline_fault' on '$tcpar_Crash_OutputSignal'", 'AUTO_NBR');
	#FM_createFault($tcpar_HWline_fault);
	#LC_ShortLines( ['AB1FD+', 'AB2FD-'] );
	if($tcpar_Crash_OutputSignal eq 'DoorUnlock')
	{
	if($tcpar_HWline_fault eq 'ShorttoVbat')
	{
		#LC_ShortLines( ['DoorUnlock', 'Ubat+'] );
		DEVICE_setDeviceState ('DoorUnlock', 'Short2Bat');
		S_wait_ms(6000);
		
	}
	elsif($tcpar_HWline_fault eq 'ShorttoGround')
	{
		#LC_ShortLines( ['DoorUnlock+', 'Ubat-'] );
		DEVICE_setDeviceState ('DoorUnlock', 'Short2Gnd');
		S_wait_ms(6000);
		
	}
	}
	elsif($tcpar_Crash_OutputSignal eq 'AACN')
	{
	if($tcpar_HWline_fault eq 'ShorttoVbat')
	{DEVICE_setDeviceState ('AACN', 'Short2Bat');
	S_wait_ms(6000);
		
	}
	elsif($tcpar_HWline_fault eq 'ShorttoGround')
	{DEVICE_setDeviceState ('AACN', 'Short2Gnd');
		
	S_wait_ms(6000);
		
	}
	}
	else
	{
		#Do Nothing
	}
	
	
	
	S_teststep("Wait for '$tcpar_Wait_time_msec' till the crashsignal line fault qualify", 'AUTO_NBR');
	S_wait_ms($tcpar_Wait_time_msec);
	PD_ReadFaultMemory(); 
	
	S_teststep("Inject a crash '$tcpar_Crashcode'", 'AUTO_NBR');
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
																							
	
#	S_teststep("Read '$tcpar_EDID' ", 'AUTO_NBR', 'read_edid');			#measurement 1
	
	return 1;
}

sub TC_evaluation {
	 my $verdict_eval='VERDICT_PASS';
	my $FinalVerdict='VERDICT_PASS';
	my $edidValue;
    my $expectedValue=hex $tcpar_error_value;
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
		
		S_teststep("Read '$tcpar_EDID' data of the corresponding to COM Message", 'AUTO_NBR', "read_edid_data_Collisiondetection"."$recordNumber");	#measurement 1		
		my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID );
		my $detectedvalue = $edidData -> {"DataValue"};
		
		
		unless(defined $detectedvalue) {
			S_set_error("No data could be obtained for EDID $tcpar_EDID");
			next;
		}
		
		S_w2log(1, "Compare detected ($detectedvalue) and expected ($expectedValue) values", 'AUTO_NBR');	
		$verdict_eval = EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $expectedValue, $detectedvalue );	
		
	
		
		$FinalVerdict = 'VERDICT_FAIL' if $verdict_eval eq 'VERDICT_FAIL';	
        S_teststep_expected("Communication error signal on HWline of '$tcpar_Crash_OutputSignal' should be reported as '$tcpar_error_value'", "read_edid_data_Collisiondetection"."$recordNumber");			#evaluation 1
		S_teststep_detected("Communication error signal on HWline of '$tcpar_Crash_OutputSignal' reported is equal to Obtained value : $edidValue in record $recordNumber ", "read_edid_data_Collisiondetection"."$recordNumber") if $FinalVerdict eq 'VERDICT_PASS';
		S_teststep_detected("Communication error signal on HWline of '$tcpar_Crash_OutputSignal' reported is not equal to Obtained value : $edidValue in record $recordNumber ", "read_edid_data_Collisiondetection"."$recordNumber") if $FinalVerdict eq 'VERDICT_FAIL';
	return 1;
	}


sub TC_finalization 
{
	if($tcpar_Crash_OutputSignal eq 'DoorUnlock')
	{
	if($tcpar_HWline_fault eq 'ShorttoVbat')
	{DEVICE_undoShortLines ();
		
	}
	elsif($tcpar_HWline_fault eq 'ShorttoGround')
	{DEVICE_undoShortLines ();
		
	}
	}
	elsif($tcpar_Crash_OutputSignal eq 'AACN')
	{
	if($tcpar_HWline_fault eq 'ShorttoVbat')
	{DEVICE_undoShortLines ();
		
	}
	elsif($tcpar_HWline_fault eq 'ShorttoGround')
	{DEVICE_undoShortLines ();
		
	}
	}
	else
	{
		#Do Nothing
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

	LC_ECU_Off();	
	S_wait_ms('TIMER_ECU_READY');
	return 1;
 }
}

1;


