#### TEST CASE MODULE
package TC_OEMEDID_recordSequenceinfo;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs_CP_Y/TCs_Project/EDR_TR8/TC_OEMEDID_recordSequenceinfo.pm 1.1 2019/07/05 06:59:14ICT Kobayashi Kohji (CC-OSS/ENG3-JP) (khk3to) develop RNO1HC(2019/10/29 15:22:06ICT) $;

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
use LIFT_PD;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use GENERIC_DCOM;
use LIFT_can_access;
use FuncLib_EDR_Framework;
use FuncLib_SYC_INTERFACE;
use Data::Dumper;
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_OEMEDID_recordSequenceinfo

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault 


I<B<Stimulation and Measurement>>

1. Inject <no_ofCrashes> of type  <CrashCode1>

2. Wait for <Wait_time_msec> till the data is recorded

3.Create <Condition> on the ABG ECU.

4.Inject <Crashcode2>

4. Read <EDID> in EDR1 and EDR2 memory.


I<B<Evaluation>>

1. -

2. -

3.-

4. EDR1 should be reporting value <EDR1_val> and EDR2 should be reporting value <EDR2_val>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'no_ofCrashes' => 
	SCALAR 'EDR1_val' => 
	SCALAR 'EDR2_val' => 
	SCALAR 'purpose' => 
	SCALAR 'Wait_time_msec' => 
	SCALAR 'EDID' => 
	SCALAR 'Crashcode1' => 
	SCALAR 'DiagType' => 
	SCALAR 'ResultDB' => 
	SCALAR 'Condition' => 
	SCALAR 'Crashcode2' => 


=head2 PARAMETER EXAMPLES

	purpose		 = 'to check sequence number of current crash event recorded in EDR'
	
	
	Wait_time_msec = '6000'
	
	EDID = '<Fetch {EDID}>'
	
	Crashcode1= '<Fetch {Crash file name in WorldDB}>'
	
	DiagType = 'AKLV'
	ResultDB = 'EDR'
	
	Condition=''
	Crashcode2=''
	no_ofCrashes=1
	EDR1_val='0x0001'
	EDR2_val='0x0000'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Wait_time_msec;
my $tcpar_EDID;
my $tcpar_Crashcode1;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $tcpar_Condition;
my $tcpar_Crashcode2;
my $tcpar_no_ofCrashes;
my $tcpar_EDR1_val;
my $tcpar_EDR2_val;

################ global parameter declaration ###################
#add any global variables here
my ($record_handler, $crash_handler,$recordIsThere, $crashSettings1,$crashSettings2, $edrNumberOfEventsToBeStored,$CrashLabel);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Wait_time_msec =  GEN_Read_mandatory_testcase_parameter( 'Wait_time_msec' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_Crashcode1 =  GEN_Read_mandatory_testcase_parameter( 'Crashcode1' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_Crashcode2 =  GEN_Read_mandatory_testcase_parameter( 'Crashcode2' );
	$tcpar_no_ofCrashes =  GEN_Read_mandatory_testcase_parameter( 'no_ofCrashes' );
	$tcpar_EDR1_val =  GEN_Read_mandatory_testcase_parameter( 'EDR1_val' );
	$tcpar_EDR2_val =  GEN_Read_mandatory_testcase_parameter( 'EDR2_val' );

	return 1;
}

sub TC_initialization {

#	S_teststep("StandardPrepNoFault ", 'AUTO_NBR');
#	GEN_StandardPrepNoFault();
	
	S_w2rep("StandardPrepNoFault");
	S_w2rep("Initialize Record");
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
     # CRASH PREPARATION - Crash1
	S_w2log(1, "Prepare crash" );
	
	
		my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$tcpar_ResultDB" ] );
		my $resultDB_Path = $resultDBDetails->{'PATH'};
		S_w2log(1, "Crashcode: $tcpar_Crashcode1, ResultDB: $tcpar_ResultDB (path: $resultDB_Path) loaded");

    # PREPARE CRASH AND INITIALIZE EQUIPMENT
	S_w2rep("Get crash settings for crash $tcpar_Crashcode1");
    my $crashDetails_href = {"RESULTDB" => $tcpar_ResultDB, 'CRASHNAME'=> $tcpar_Crashcode1};
	$crashSettings1 = CSI_GetCrashDataFromMDS($crashDetails_href);
	unless($crashSettings1) {
		S_set_error("Crashcode '$tcpar_Crashcode1' not available in given Result DB. Abort test case.");
		return;
	}
	S_w2log(1, "Crashcode: $tcpar_Crashcode1, ResultDB: $tcpar_ResultDB (path: $resultDB_Path) loaded");
	S_w2log(1, "Set environments for crash as per result DB");
	# CREIS_SetEnvironmentForCrash($crashSettings1);
	CSI_PrepareEnvironment($crashSettings1, 'init_complete');
 
  	if($tcpar_Crashcode2 eq 'NULL')
  	{
  		#Do nothing
  	}
  	else
  	{
     #--------------------------------------------------------------
     # CRASH PREPARATION - Crash2
		S_w2rep("Get crash settings for crash $tcpar_Crashcode2");
		$crashDetails_href = {"RESULTDB" => $tcpar_ResultDB, 'CRASHNAME'=> $tcpar_Crashcode2};
		$crashSettings2 = CSI_GetCrashDataFromMDS($crashDetails_href);
		unless(defined $crashSettings2) 
		{
		 S_set_error("Crash $tcpar_Crashcode2 not available in result DB $tcpar_ResultDB. Test case aborted.");
				return;
		}
			S_w2log(1, "Crashcode: $tcpar_Crashcode2, ResultDB: $tcpar_ResultDB (path: $resultDB_Path) loaded");
			S_w2log(2, "Set environments for crash as per result DB");
	        CSI_PrepareEnvironment($crashSettings2, 'init_complete');
  	}

  
  
  # CREIS_PrepareCrash($crashSettings1) unless $main::opt_offline;
  # CREIS_SetEnvironmentForCrash($crashSettings1);

	
	
#	S_w2log(1, "Power off ECU");
#	LC_ECU_Off();
#	S_wait_ms('TIMER_ECU_READY');
#
#	#Prepare crash
#	S_w2log(1, "Prepare crash");
#	
#
#	S_w2log(1, "Power on ECU");
#    LC_ECU_On();
#	S_wait_ms('TIMER_ECU_READY');
#
	S_w2log(1, "Read fault memory before stimulation");
	PD_ReadFaultMemory();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Inject '$tcpar_no_ofCrashes' of type  '$tcpar_Crashcode1'", 'AUTO_NBR');
	
	#Prepare crash1
    CSI_LoadCrashSensorData2Simulator($crashSettings1) unless $main::opt_offline;
		# Power ON the ECU
        S_wait_ms(6000);
    
	    # CREIS_InjectCrash();
		CSI_TriggerCrash();
		S_wait_ms(20000);
		S_teststep("Wait for '$tcpar_Wait_time_msec' till the data is recorded", 'AUTO_NBR');
	    S_wait_ms($tcpar_Wait_time_msec);
		S_teststep("Create '$tcpar_Condition' on the ABG ECU.", 'AUTO_NBR');
		
	if ($tcpar_Condition eq 'NULL')
	{
		$CrashLabel= $tcpar_Crashcode1;
	}else{
		LC_ECU_Off(); 
		S_wait_ms(8000);
		LC_ECU_On(); 
		S_wait_ms(8000);
	}
	
	##### The crash 2 is injected 	
	if($tcpar_Crashcode2 ne 'NULL'){
	
	#Prepare crash2
	CSI_LoadCrashSensorData2Simulator($crashSettings2) unless $main::opt_offline;
		# CREIS_PrepareCrash($crashSettings2) unless $main::opt_offline;
		
		S_wait_ms(6000);
	    # CREIS_InjectCrash();
		CSI_TriggerCrash();
        S_wait_ms(20000);
        $CrashLabel= $tcpar_Crashcode1."_".$tcpar_Crashcode2;
	
	}
	
	
	LC_MeasureTraceDigitalStop();
	my $lct_Data = LC_MeasureTraceDigitalGetValues(); 
	
	
	
	my $dataStoragePath = "$main::REPORT_PATH/".$CrashLabel;
	$edrNumberOfEventsToBeStored = 2;
	
	
	S_teststep("Read '$tcpar_EDID' in EDR1 and EDR2 memory.", 'AUTO_NBR');			#measurement 1
	
	EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								"CrashLabel" => $CrashLabel,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								);	

	return 1;
}

sub TC_evaluation {
	
	my $verdict_eval='VERDICT_PASS';
	my $FinalVerdict='VERDICT_PASS';
	my $edidValue;
    my $expectedValue1 = hex $tcpar_EDR1_val;
    my $expectedValue2 = hex $tcpar_EDR2_val;
	my @expectedValue = ($expectedValue1,$expectedValue2);
    
    if($tcpar_Crashcode1 =~ /Multi/) 
    	{
    		$edrNumberOfEventsToBeStored = 2;
    	}
    	elsif($tcpar_Crashcode2 =~ /Multi/) 
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
																  "CrashLabel" => $CrashLabel);

		S_w2log(1, "*****************");
		S_w2log(1, "EDID $tcpar_EDID ($dataElement) validation in record $recordNumber for crash label $CrashLabel ");
		S_w2log(1, "*****************");
		
		S_teststep("Read '$tcpar_EDID' data of the corresponding to COM Message", 'AUTO_NBR', "read_edid_data_recordsequence"."$recordNumber");	#measurement 1		
		my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $CrashLabel, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDID );
		my $detectedvalue = $edidData -> {"DataValue"};
		
		
		unless(defined $detectedvalue) {
			S_set_error("No data could be obtained for EDID $tcpar_EDID");
			next;
		}		
		
		
		$verdict_eval = EVAL_evaluate_string ( "EDID_$tcpar_EDID\_Evaluation", $expectedValue[$recordNumber-1], $detectedvalue );
		
		$FinalVerdict = 'VERDICT_FAIL' if $verdict_eval eq 'VERDICT_FAIL';	

        S_teststep_expected("EDR.$recordNumber should be reporting value '$expectedValue[$recordNumber-1]'", "read_edid_data_recordsequence"."$recordNumber");			#evaluation 1
		S_teststep_detected("EDR.$recordNumber  reporting value is equal to '$detectedvalue' ","read_edid_data_recordsequence"."$recordNumber") if $FinalVerdict eq 'VERDICT_PASS';
		S_teststep_detected("EDR.$recordNumber  reporting value is not equal to '$detectedvalue' ", "read_edid_data_recordsequence"."$recordNumber") if $FinalVerdict eq 'VERDICT_FAIL';
    	
	}

	return 1;
}

sub TC_finalization {
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

	return 1;
}


1;
