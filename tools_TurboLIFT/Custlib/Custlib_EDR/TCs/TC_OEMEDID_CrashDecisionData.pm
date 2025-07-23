#### TEST CASE MODULE
package TC_OEMEDID_CrashDecisionData;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_OEMEDID_CrashDecisionData.pm 1.1 2019/07/05 06:59:12ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;

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

our $PURPOSE = "To check the crash decision data of the Crash Algorithm";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_OEMEDID_CrashDecisionData

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault 


I<B<Stimulation and Measurement>>

1.Inject a crash <CrashCode>.

2.Read <EDID> in EDR memory.


I<B<Evaluation>>

1. -

2. -

3. Crash decision data reported should be a<EDR_value>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'EDR_value' => 
	SCALAR 'purpose' => 
	SCALAR 'EDID' => 
	SCALAR 'Crashcode' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'to check the time it takes to decide the logical firing of squib'
	
	
	
	
	EDID = '<Fetch {EDID}>'
	
	Crashcode= '<Fetch {Crash file name in WorldDB}>'
	
	DiagType = 'AKLV'
	ResultDB = 'EDR'
	EDR_value='#from cras file'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_Crashcode;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_EDR_value;

################ global parameter declaration ###################
#add any global variables here
my ($record_handler, $crash_handler,$recordIsThere, $crashSettings, $edrNumberOfEventsToBeStored, @ObtainedValue,$data_splitcount);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_Crashcode =  GEN_Read_mandatory_testcase_parameter( 'Crashcode' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_EDR_value =  GEN_Read_mandatory_testcase_parameter( 'EDR_value' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault ", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	S_w2rep("Initialize Record Handler");
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

	S_teststep("Inject a crash '$tcpar_Crashcode'.", 'AUTO_NBR');
    CREIS_PrepareCrash($crashSettings) unless $main::opt_offline;
		# Power ON the ECU
#	LC_ECU_On();
# 	S_wait_ms('TIMER_ECU_READY'); 
#	S_teststep("Wait '$tcpar_TimeInvalidBeforeCrash_msec'", 'AUTO_NBR');
#    S_wait_ms($tcpar_TimeInvalidBeforeCrash_msec);
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
	
	S_teststep("Read '$tcpar_EDID' in EDR memory.", 'AUTO_NBR');		#measurement 1
	EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								"CrashLabel" => $tcpar_Crashcode,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								);
	
	

	S_teststep("Crash decision data reported should be a<EDR_value>", 'AUTO_NBR');

	return 1;
}

sub TC_evaluation {

	my $verdict_eval='VERDICT_PASS';
	my $FinalVerdict='VERDICT_PASS';
	my $edidValue;
    my @expectedValue;
	if($tcpar_Crashcode =~ /Multi/) 
    	{
    		$edrNumberOfEventsToBeStored = 2;
    	}
    	else
    	{
    		$edrNumberOfEventsToBeStored = 1;
    	}
    	
    	if($tcpar_EDID=='1079' ||$tcpar_EDID=='1081')
    	{ $data_splitcount=15;}
    	else
    	{$data_splitcount=7;}
	for(my $recordNumber = 1; $recordNumber <= $edrNumberOfEventsToBeStored; $recordNumber++)
	{
		my $dataElement = $record_handler -> GetDataElementEDID(  "EDIDnr" => $tcpar_EDID,
																  "RecordNumber" => $recordNumber,
																  "CrashLabel" => $tcpar_Crashcode);

		S_w2log(1, "*****************");
		S_w2log(1, "EDID $tcpar_EDID ($dataElement) validation in record $recordNumber for crash label $tcpar_Crashcode ");
		S_w2log(1, "*****************");
		
		S_teststep("Read '$tcpar_EDID' data of the corresponding to crash decision data", 'AUTO_NBR', "read_edid_Crashdecision"."$recordNumber");	#measurement 1		
		my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID );
		my $detectedvalue = $edidData -> {"DataValue"};
		
		
		
		unless(defined $detectedvalue) {
			S_set_error("No data could be obtained for EDID $tcpar_EDID");
			next;
		}
		@expectedValue=split(/ /,$tcpar_EDR_value );
		 @ObtainedValue=split(/ /,$detectedvalue );
		#S_w2log(1, "Compare detected ($detectedvalue) and expected ($expectedValue[) values", 'AUTO_NBR');	
		for(my $bytecount=0;$bytecount<=$data_splitcount;$bytecount++)
		{
			
		$verdict_eval = EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $expectedValue[$bytecount], $ObtainedValue[$bytecount] );	
		}
		$FinalVerdict = 'VERDICT_FAIL' if $verdict_eval eq 'VERDICT_FAIL';	
        S_teststep_expected("Crash decision data reported should be a '$tcpar_EDR_value'", "read_edid_Crashdecision"."$recordNumber");			#evaluation 1
		S_teststep_detected("Crash decision data reported is equal to '$tcpar_EDR_value' ", "read_edid_Crashdecision"."$recordNumber") if $FinalVerdict eq 'VERDICT_PASS';
		S_teststep_detected("Crash decision data reported is not equal to '$tcpar_EDR_value' ", "read_edid_Crashdecision"."$recordNumber") if $FinalVerdict eq 'VERDICT_FAIL';
	}

	return 1;
}

sub TC_finalization {
    S_w2rep("Delete all object instances created...");
	
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
