#### TEST CASE MODULE
package TC_OEMEDID_P_SeatInformationFault_check;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_OEMEDID_P_SeatInformationFault_check.pm 1.1 2019/07/05 06:59:13ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;

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

TC_OEMEDID_P-SeatInformationFault_check

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.StandardPrepNoFault 

2.Set Passenger seat occupant information in PODS as 0x07


I<B<Stimulation and Measurement>>

1.Set Passenger seat occupant information in PODS as <Occupant_value>.

2.Create <Condition> on PODS ECU.

3.Wait for <t_wait> msecs.

4.Inject a crash <CrashCode>.

5.Read <EDID> in EDR1 and EDR2 memory.


I<B<Evaluation>>

1. -

2. -

3.-

4.-

5. EDR1 should be reporting value <EDR1_val> and EDR2 should be reporting value <EDR2_val>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Occupant_value' => 
	HASH 'Condition1' => 
	SCALAR 'EDR1_val' => 
	SCALAR 'EDR2_val' => 
	SCALAR 'purpose' => 
	SCALAR 'EDID' => 
	SCALAR 'Crashcode' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 
	SCALAR 't_wait' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'to check the faulty status on Passenger seat occupation during crash'
	
	
	
	
	EDID = '<Fetch {EDID}>'
	
	Crashcode= '<Fetch {Crash file name in WorldDB}>'
	
	DiagType = 'AKLV'
	ResultDB = 'EDR'
	t_wait=5000#msec
	Occupant_value='0x05'
	Condition1=%('Fault_Status'=>'0x01')#fault status in PODS ECU
	EDR1_val='0x02'
	EDR2_val='0x03'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_Crashcode;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_t_wait;
my $tcpar_Occupant_value;
my $tcpar_Condition1;
my $tcpar_EDR1_val;
my $tcpar_EDR2_val;

################ global parameter declaration ###################
#add any global variables here
my ($record_handler, $crash_handler,$recordIsThere, $crashSettings, $edrNumberOfEventsToBeStored);


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_Crashcode =  GEN_Read_mandatory_testcase_parameter( 'Crashcode' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_t_wait =  GEN_Read_mandatory_testcase_parameter( 't_wait' );
	$tcpar_Occupant_value =  GEN_Read_mandatory_testcase_parameter( 'Occupant_value' );
	$tcpar_Condition1 =  GEN_Read_mandatory_testcase_parameter( 'Condition1' );
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

	S_teststep("Set Passenger seat occupant information in PODS as '$tcpar_Occupant_value'.", 'AUTO_NBR');
    S_user_action ( "Set the Occupant status in the PODS simulator as '$tcpar_Occupant_value'");
	S_teststep("Create '$tcpar_Condition1' on PODS ECU.", 'AUTO_NBR');
    S_user_action ( "Set the '$tcpar_Condition1'" );
    if('$tcpar_Condition1' eq 'Undetermined_lessthan60secs')
    {S_teststep("Wait for the condition to be achieved", 'AUTO_NBR');
    	S_wait_ms(6000);
    	
    }
    elsif('$tcpar_Condition1' eq 'Undetermined_greaterthan60secs')
    {S_teststep("Wait for the condition to be achieved", 'AUTO_NBR');
    	S_wait_ms(60000);
    	
    }
    elsif('$tcpar_Condition1' eq 'Undefined_lessthan5secs')
    {S_teststep("Wait for the condition to be achieved", 'AUTO_NBR');
    	S_wait_ms(1000);
    	
    }
    elsif('$tcpar_Condition1' eq 'Undefined_greaterthan5secs')
    {S_teststep("Wait for the condition to be achieved", 'AUTO_NBR');
    	S_wait_ms(5000);
    	
    }
    elsif('$tcpar_Condition1' eq 'Invalid Mirror data')
    {S_teststep("Wait for the condition to be achieved", 'AUTO_NBR');
    	S_wait_ms(1000);
    	
    }
	else
	{
		#Do Nothing
	}
    #S_wait_ms($tcpar_t_wait);
	S_teststep("Inject a crash '$tcpar_Crashcode'.", 'AUTO_NBR');
	#Prepare crash
    CREIS_PrepareCrash($crashSettings) unless $main::opt_offline;
		
     S_wait_ms(6000);
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
	
	S_teststep("Read '$tcpar_EDID' in EDR1 and EDR2 memory.", 'AUTO_NBR');			#measurement 1
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
    my $expectedValue =hex $tcpar_EDR1_val;
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
		
		S_teststep("Read '$tcpar_EDID' data of the corresponding to PODS", 'AUTO_NBR', "read_edid_PSeat"."$recordNumber");	#measurement 1		
		my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID );
		my $detectedvalue = $edidData -> {"DataValue"};
		
		
		unless(defined $detectedvalue) {
			S_set_error("No data could be obtained for EDID $tcpar_EDID");
			next;
		}
		
		S_w2log(1, "Compare detected ($detectedvalue) and expected ($expectedValue) values", 'AUTO_NBR');	
		$verdict_eval = EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $expectedValue, $detectedvalue );	
		
		$FinalVerdict = 'VERDICT_FAIL' if $verdict_eval eq 'VERDICT_FAIL';	
	
	S_teststep_expected("EDR1 should be reporting value '$tcpar_EDR1_val' and EDR2 should be reporting value '$tcpar_EDR2_val'","read_edid_PSeat"."$recordNumber");
	S_teststep_detected("The PODS reporting value in  EDR is equal to '$tcpar_EDR1_val'","read_edid_PSeat"."$recordNumber")if $FinalVerdict eq 'VERDICT_PASS';
	S_teststep_detected("The PODS reporting value in  EDRis not equal to '$tcpar_EDR1_val' ","read_edid_PSeat"."$recordNumber")if $FinalVerdict eq 'VERDICT_FAIL';
	}
	
	return 1;
}

sub TC_finalization {
	S_w2rep("Delete all object instances created...");
#	foreach my $recordNumber (1..$edrNumberOfEventsToBeStored)
#	{
#		$record_handler -> DeleteRecord("CrashLabel" => $tcpar_Crashcode, "RecordNumber" => $recordNumber);	
#	}
    $record_handler->DeleteAllRecords();
	# Erase EDR
	PD_ClearCrashRecorder_NOERROR();
	S_wait_ms(2000);
    
    S_wait_ms(2000);
    PD_ReadFaultMemory(); 
	# Erase Fault memory
	PD_ClearFaultMemory();
	S_wait_ms(10000);
	
    
	# Read fault memory after clearing and erasing EDR
	PD_ReadFaultMemory();   

	LC_ECU_Off();
	

	return 1;
}


1;
