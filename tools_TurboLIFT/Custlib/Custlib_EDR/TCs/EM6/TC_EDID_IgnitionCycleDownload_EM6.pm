#### TEST CASE MODULE
package TC_EDID_IgnitionCycleDownload_EM6;

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

use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here

use FuncLib_SYC_INTERFACE;
use FuncLib_EDR_Framework;
use LIFT_crash_simulation;
use LIFT_MDSRESULT;
use LIFT_can_access;
use LIFT_ProdDiag;
use FuncLib_TNT_SYC_INTERFACE;
use LIFT_evaluation;
use LIFT_equipment;
use GENERIC_DCOM;
use Data::Dumper;
use LIFT_labcar;
use LIFT_CD;
use LIFT_PD;
use LIFT_MLC;
use LIFT_CANoe;
use LIFT_flexray_access;
use LIFT_numerics;
use Readonly;
use FuncLib_CustLib_EDR_CNEDR;
use LIFT_CD_CAN;
use constant MILLISEC_TO_SECOND => 0.001;
use constant SECOND_TO_MILLISEC => 1000;
use constant SINE_CURVE_FREQUENCY_HZ => 0.2;
use constant SINE_CURVE_STEPWIDTH_MS => 100;
#include further modules here

##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDID_IgnitionCycleDownload_EM6

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

0. -

1. Set signal <IGN_Variable> to <Value_Signal1>

2. Note down the Value of <Value_Signal>

3. Inject <CrashType1>

4. Read <EDID> value 

5. Reset ECU

6. Read <EDID> value in the corresponding EDR 

7. Reset ECU <NumberOfECU_Reset> times

8. Inject <CrashType2> 

9. Read <EDID> value in the corresponding EDR 1 and EDR 2

10. Set signal <IGN_Variable> to <Value_Signal2>

11. Note down the Value of <Value_Signal>

12. Inject <CrashType3> 

13. Read <EDID> value in the corresponding EDR 1, EDR 2 and EDR 3


I<B<Evaluation>>

0.-

1. -

2. -

3. -

4. IgnitionCycleCrash should have value same as current Ignition Cycle.

5. -

6. IgnitonCycleCrash should have value Incremented by 1 value compared to step 3

7. -

8. -

9. IgnitonCycleCrash should have value same as current Ignition Cycle for both crash recorders(Incremented by 4 value compared to step 3)

10. -

11. -

12. -

13. IgnitonCycleCrash should have value same as current Ignition Cycle for three crash recorders (Incremented by <NumberOfECU_Reset_before_3rdCrash> value compared to step 9)


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'DiagType' => 
	SCALAR 'purpose' => 
	SCALAR 'EDID' => 
	SCALAR 'ResultDB' => 
	SCALAR 'NumberOfECU_Reset' => 
	SCALAR 'CrashType1' => 
	SCALAR 'CrashType2' => 
	SCALAR 'CrashType3' => 
	SCALAR 'IGN_Variable' => 
	HASH 'COMsignalsAfterCrash' => 


=head2 PARAMETER EXAMPLES

	purpose	= 'To validate Ignition Cycle Crash download recorded in EDR'
	
	EDID = '<Fetch {EDID}>'
	ResultDB = 'EDR'
	NumberOfECU_Reset='3'
	CrashType1 = 'Single_EDR_Front_above_8kph_NoDeployment;5'
	CrashType2 = 'Single_EDR_Front_Inflatable;5'
	CrashType3 = 'Single_EDR_Rear_NonInflatable;5'
	IGN_Variable = 'BIU660_3_0_COUNT_TRIP'
	COMsignalsAfterCrash = %()
	#Enable NHTSA EDR
	DiagType  = 'ProdDiag'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_EDID;
my $tcpar_ResultDB;
my $tcpar_NumberOfECU_Reset;
my $tcpar_CrashType1;
my $tcpar_CrashType2;
my $tcpar_CrashType3;
my $tcpar_IGN_Variable;
my $tcpar_COMsignalsAfterCrash;
my $tcpar_DiagType;

my $tcpar_IGN_Variable;
my $tcpar_COMsignalsAfterCrash;
my $tcpar_POC;

my $tcpar_Value_Signal2;
my $tcpar_Value_Signal1;
my $tcpar_Diag_type;
my $index ;
	my $tcpar_Protocol;
	my $tcpar_DiagType ;
	
	my $tcpar_Mode;
	my $tcpar_Crash_Time_Zero_ms;
	my $numberOfRecords;
################ global parameter declaration ###################
#add any global variables here
my $tcpar_read_NHTSAEDR;
my $tcpar_read_CHINAEDR;
my ($record_handler, $crashSettings, $edrNumberOfEventsToBeStored,$ChinaEDR_diagType);
my ($IGN_after_crash1, $IGN_after_crash2, $IGN_after_crash3, $IGN_before_crash1);
my ($ignitionCycle_BeforeCrash1,$ignitionCycle_AfterCrash1AndReset,$ignitionCycle_crash2, $ignitionCycle_AfterCrash2AndReset,$ignitionCycle_crash3);
my (
		$storedCrashLabels_aref,
		$response_value,
		$Expected_value,
		$ChinaEDR_diagType,
		$comSignalLabelMapping_href,
		$mappingEDR,
		$crashSettings,
		$crashDetails_href,
		$crashInfo_href,
		$ChinaEDR_diagType,
		$currentTestCaseIteration,
		$SubaruEDR_diagType,
		$res_key1,
		$edrNumberOfEventsToBeStored,
		$numberOfRecords,
		$msgDLC,
		$msgTo
	);
my $manipulatedCOMsignals;
my $tcpar_message;

my $crash_handler;
my	$IGN_before_crash1 ;
my	$IGN_after_crash1 ;
my	$IGN_after_crash2;
my	$IGN_after_crash3;
my ($expect_value_before_crash1,$expect_value_after_crash1, $expect_value_after_crash2, $expect_value_after_crash3);

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_EDID =  GEN_Read_mandatory_testcase_parameter( 'EDID' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_NumberOfECU_Reset =  GEN_Read_mandatory_testcase_parameter( 'NumberOfECU_Reset' );
	$tcpar_CrashType1 =  GEN_Read_mandatory_testcase_parameter( 'CrashType1' );
	$tcpar_CrashType2 =  GEN_Read_mandatory_testcase_parameter( 'CrashType2' );
	$tcpar_CrashType3 =  GEN_Read_mandatory_testcase_parameter( 'CrashType3' );
	$tcpar_IGN_Variable =  GEN_Read_mandatory_testcase_parameter( 'IGN_Variable' );
	$tcpar_COMsignalsAfterCrash =  GEN_Read_mandatory_testcase_parameter( 'COMsignalsAfterCrash' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_read_CHINAEDR = GEN_Read_mandatory_testcase_parameter( 'read_CHINAEDR' );
	$tcpar_DiagType =  GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_Value_Signal2 = GEN_Read_mandatory_testcase_parameter( 'Value_Signal2' );
	$tcpar_Value_Signal1 = GEN_Read_mandatory_testcase_parameter( 'Value_Signal1' );
	$tcpar_message =  S_read_optional_testcase_parameter( 'message' );
	$tcpar_POC =  GEN_Read_mandatory_testcase_parameter( 'POC' );
	if(not defined $tcpar_read_CHINAEDR) {
		$tcpar_read_NHTSAEDR = 'yes';
		$tcpar_read_CHINAEDR = 'no';
	}
	else {
		$tcpar_read_NHTSAEDR = 'no';
		my $storageOrder = EDR_getStorageOrder();
		return unless(defined $storageOrder);

		if($storageOrder eq 'PhysicalOrder'){
			$ChinaEDR_diagType= 'ProdDiag';  #In platform NHTSA and China EDR is read via proddiag
		}
		else {
			$ChinaEDR_diagType= 'CHINA_Payload';
		}
	}
	return 1;
}

sub TC_initialization {

	my $EDR_Mapping = S_get_contents_of_hash( ['Mapping_EDR'] );
	my $CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	
	# $msgTo = $CAN_Mapping->{'CAN_MESSAGES'}{'BIU660'}{'CANOE_DISABLE'};
	# $msgDLC = $CAN_Mapping->{'CAN_MESSAGES'}{'BIU660'}{'CANOE_DLC'};
	
	$index = 0;
	$tcpar_Protocol = 'CAN';
	
	$tcpar_Mode='phys';
	 $tcpar_Crash_Time_Zero_ms = 0;
	 $numberOfRecords = 3;
	
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	#--------------------------------------------------------------
    # Initialize equipment
    #

	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
    CA_trace_start();
    GDCOM_init() ; # To fetch info for CD from mapping_diag
	
    PD_ClearCrashRecorder();
    S_wait_ms(2000);
 
    # erase FltMem
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	# read fault memory
    my $faultsBeforeStimulation = PD_ReadFaultMemory();
	
	#Fault memory must be empty
    my $faultsVerdict = PD_evaluate_faults( $faultsBeforeStimulation, []);
 	return 0 unless ($faultsVerdict eq 'VERDICT_PASS');


	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler()  || return;
	#___________________---------------------------
	
	return 1;
}

sub TC_stimulation_and_measurement {
#S_teststep(" Prepare Inject '$tcpar_CrashType1'", 'AUTO_NBR');
	Prepare_crash($tcpar_CrashType1);
	
	S_teststep("if'$tcpar_POC' != NA, set NVM POC to '$tcpar_POC'", 'AUTO_NBR');
	if( $tcpar_POC ne 'NA')
	{
		
		PRD_Write_Memory("rb_tim_EcuOnTimeDataEe_st.POnCounter_u32",$tcpar_POC);
		S_wait_ms(500);
	}
	
	S_teststep("if $tcpar_IGN_Variable = $tcpar_Value_Signal1  ", 'AUTO_NBR');
	S_teststep("if $tcpar_IGN_Variable = $tcpar_Value_Signal1  ", 'AUTO_NBR');
	if($tcpar_Value_Signal1 eq 'TimeOut' )
	{
		CA_set_EnvVar_value( '_enV_BIU660_StartStop',0, 'phys' );
		# S_user_action('check stop msg');
		$expect_value_before_crash1 = S_aref2hex(PRD_Read_Memory("rb_tim_EcuOnTimeDataEe_st.POnCounter_u32"));
		$expect_value_before_crash1 = S_0x2dec ( $expect_value_before_crash1 ); 
		S_w2rep("Quanhh write exptected value before crash 1 when ABSENT $expect_value_before_crash1 ");
	}elsif (	$tcpar_Value_Signal1 ge '60001')
	{
		CA_set_EnvVar_value( '_Env__BIU660_COUNT_TRIP', $tcpar_Value_Signal1, 'phys' );
		$expect_value_before_crash1 = '60001';
		S_w2rep("Quanhh write exptected value before crash 1  $expect_value_before_crash1 when VALUE >= 60001");
	
	}else
	{
		S_teststep("Set signal '$tcpar_IGN_Variable' to '$tcpar_Value_Signal1'", 'AUTO_NBR');
		CA_set_EnvVar_value( '_Env__BIU660_COUNT_TRIP', $tcpar_Value_Signal1, 'phys' );
		S_wait_ms(500);
		$expect_value_before_crash1 = CA_get_EnvVar_value( '_Env__BIU660_COUNT_TRIP', 'phys' );
		S_w2rep("Quanhh write exptected value before crash 1  $expect_value_before_crash1");
	}
	S_wait_ms(1000);
	
	S_teststep(" Inject '$tcpar_CrashType1'", 'AUTO_NBR');
	CSI_TriggerCrash();
	S_wait_ms(17000);
	
	Prepertation();
	Read_and_stored($tcpar_CrashType1,"$tcpar_CrashType1"."_before_reset");
	############# RESET 1ST 
	S_teststep("5. Reset ECU", 'AUTO_NBR');
	S_teststep("Reset ECU", 'AUTO_NBR');
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
	###########################################
	
	Prepertation();
	Read_and_stored($tcpar_CrashType1, "$tcpar_CrashType1");
	
  ##### RESET ECU VARIOUS TIMES###############
	S_teststep("Reset ECU '$tcpar_NumberOfECU_Reset' times for 3rd", 'AUTO_NBR');
	
    foreach my $ecuReset (1..$tcpar_NumberOfECU_Reset)
    {
        LC_ECU_Off();
        S_wait_ms('TIMER_ECU_OFF');
        LC_ECU_On();
        S_wait_ms('TIMER_ECU_READY');        
    }	
############# CRASH 2#################	
	S_teststep(" Prepear Inject '$tcpar_CrashType2' ", 'AUTO_NBR');
	Prepare_crash($tcpar_CrashType2);
	S_wait_ms(1000);
	
	S_teststep("Inject '$tcpar_CrashType2'", 'AUTO_NBR');	
	CSI_TriggerCrash();
	S_wait_ms(17000);
	
	if($tcpar_Value_Signal1 eq 'TimeOut' )
	{
		
		$expect_value_after_crash2 = S_aref2hex(PRD_Read_Memory("rb_tim_EcuOnTimeDataEe_st.POnCounter_u32"));
		$expect_value_after_crash2 = S_0x2dec ( $expect_value_after_crash2 ); 
		S_w2rep("Quanhh write exptected value before crash 2 when signal 1 ABSENT $expect_value_after_crash2");
		S_wait_ms(1000);
	}
	
	Prepertation();
	Read_and_stored($tcpar_CrashType2, "$tcpar_CrashType2" );
	
	
############ CRASH 3#################
	
	S_teststep(" Prepare Inject '$tcpar_CrashType3'", 'AUTO_NBR');
	Prepare_crash($tcpar_CrashType3);
	
	S_teststep("if $tcpar_Value_Signal2 eq DLC error ", 'AUTO_NBR');
	if($tcpar_Value_Signal2 eq 'DLC_Error' )
	{
		CA_set_EnvVar_value( 'enV_BIU660_DLC',4 );
		# S_user_action('check DLC msg');
		$expect_value_after_crash3 = S_aref2hex(PRD_Read_Memory("rb_tim_EcuOnTimeDataEe_st.POnCounter_u32"));
		$expect_value_after_crash3 = S_0x2dec ( $expect_value_after_crash3 ); 
		S_teststep(" Quanhh Read expected value when DLC err: $expect_value_after_crash3", 'AUTO_NBR');
	}
	elsif($tcpar_Value_Signal2 ge '60001')
	{
		CA_set_EnvVar_value( '_Env__BIU660_COUNT_TRIP', $tcpar_Value_Signal2, 'phys' );
		
		$expect_value_after_crash3 = '60001';
		S_w2rep("Quanhh write exptected value after crash 3  $expect_value_after_crash3 when VALUE >= 60001");
		
		
	}
	else
	{
		CA_set_EnvVar_value( '_Env__BIU660_COUNT_TRIP', $tcpar_Value_Signal2, 'phys' );
		S_wait_ms(500);
		S_teststep("Set signal '$tcpar_IGN_Variable' to '$tcpar_Value_Signal2'", 'AUTO_NBR');
		$expect_value_after_crash3 = CA_get_EnvVar_value( '_Env__BIU660_COUNT_TRIP', 'phys' );
		
		
		S_teststep(" Quanhh Read expected value after crash 3: $expect_value_after_crash3", 'AUTO_NBR');
	}
	
	
	S_wait_ms(1000);
	
	S_teststep(" Inject '$tcpar_CrashType3'", 'AUTO_NBR');
	CSI_TriggerCrash();
	S_wait_ms(17000);
	
	Prepertation();
	Read_and_stored($tcpar_CrashType3,"$tcpar_CrashType3");
	
	return 1;
}

sub TC_evaluation {
	S_teststep("Evalutaion BEFORE reset crash 1", 'AUTO_NBR');
	Evaluate_each_case(1, "$tcpar_CrashType1"."_before_reset", $expect_value_before_crash1);
	S_wait_ms(100);
	S_teststep("----------------------------------------------------------------------------------------", 'AUTO_NBR');
	S_teststep("Evalutaion after crash 3 buffer 1st", 'AUTO_NBR');
	Evaluate_each_case(1, "$tcpar_CrashType3", $expect_value_after_crash3 );
	S_teststep("----------------------------------------------------------------------------------------", 'AUTO_NBR');
	if ($tcpar_Value_Signal1 ne 'TimeOut')
	{
		S_teststep("Evalutaion after crash 2 buffer 2nd when signal 1 is normal", 'AUTO_NBR');
		Evaluate_each_case(2, "$tcpar_CrashType3", $expect_value_before_crash1 );
		S_wait_ms(100);
	
	}else
	{
		S_teststep("Evalutaion after crash 2 buffer 2nd when signal 1 is absent", 'AUTO_NBR');
		Evaluate_each_case(2, "$tcpar_CrashType3", $expect_value_after_crash2 );
		S_wait_ms(100);
	}
	S_teststep("----------------------------------------------------------------------------------------", 'AUTO_NBR');
	S_teststep("Evalutaion after reset crash 1 (buffer 3rd)", 'AUTO_NBR');
	Evaluate_each_case(3, "$tcpar_CrashType3", $expect_value_before_crash1 );
	S_wait_ms(100);
	return 1;
}

sub TC_finalization {
	S_w2rep("Start test case finalization...");
	
	#Delete Record Handler
		
	foreach my $recordNbr (1..$numberOfRecords)
	{
		$record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_CrashType1", "RecordNumber" => $recordNbr);
		$record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_CrashType2", "RecordNumber" => $recordNbr);
		$record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_CrashType3", "RecordNumber" => $recordNbr);
		# $record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_CrashPrecondition1", "RecordNumber" => $recordNbr);
		# $record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_CrashPrecondition2", "RecordNumber" => $recordNbr);
		# $record_handler -> DeleteAllRecords("CrashLabel" => "$tcpar_CrashPrecondition3", "RecordNumber" => $recordNbr);
	}
	

	# my @crash_label_array = ( $tcpar_CrashPrecondition1,$tcpar_CrashPrecondition2,$tcpar_CrashPrecondition3,$tcpar_Crashcode1,$tcpar_Crashcode2,$tcpar_Crashcode3 );                                     
		my @crash_label_array = ( $tcpar_CrashType1,$tcpar_CrashType2,$tcpar_CrashType3 );                                     

	for my $i(@crash_label_array)
	{
			$crash_handler -> DeleteAllSources ( "SourceLabel" => 'CrashCode_MDS',
     								 "CrashLabel"  => $i  );
			$crash_handler -> DeleteAllSources ( "SourceLabel" => 'CrashDuration',
								 "CrashLabel"  => $i  );						 
	}
	#remove condition
	CA_set_EnvVar_value( 'enV_BIU660_DLC',8 , 'phys');
	CA_set_EnvVar_value( '_enV_BIU660_StartStop',0, 'phys' );
	# Erase EDR
    PD_ClearCrashRecorder_NOERROR();
    S_wait_ms(2000);

	# Erase Fault memory
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	# Read fault memory after clearing and erasing EDR
    PD_ReadFaultMemory();   

    S_teststep("Reset ECU", 'AUTO_NBR');
	LC_ECU_Off();
	S_wait_ms('TIMER_ECU_OFF');
	LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
	return 1;
}


sub Prepare_crash{

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
	S_wait_ms(1000);
	
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


sub Read_and_stored{
	
	my $tcpar_CrashType = shift;
	my $CrashLabel = shift;
	my $dataStoragePath = "$main::REPORT_PATH/".S_get_TC_number()."_".$CrashLabel;
	#"$main::REPORT_PATH/".S_get_TC_number()."_"."$tcpar_CrashType._BeforeReset";

	$edrNumberOfEventsToBeStored = SYC_EDR_get_NumberOfEventsToBeStored();
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("'NumberOfEventsToBeStored' is not available in SYC - add or overwrite 'SYC_EDR_get_NumberOfEventsToBeStored' with Custlibrary Function");
        return;
    }

	S_teststep("Read '$tcpar_EDID' value before ECU reset", 'AUTO_NBR');			#measurement 1
    PD_ECUlogin() if($tcpar_DiagType eq 'ProdDiag');
	
	if ( lc( $tcpar_read_NHTSAEDR) eq 'yes' ) 
	{
		S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored");
		EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								"CrashLabel" => $CrashLabel,
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'NHTSA')
	}
	
	if (lc($tcpar_read_CHINAEDR) eq 'yes')
	{
		$edrNumberOfEventsToBeStored=3;
		
		S_w2rep("Nbr of records: $edrNumberOfEventsToBeStored SUbaru");
		EDR_ReadAndStoreAllRecords_Subaru (
										"DiagType" =>  $ChinaEDR_diagType,
										"CrashLabel" => $CrashLabel,
										"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
										"StoragePath" => $dataStoragePath,
										"read_EDRType"=>'CHINA'
									);
	}	

}



sub Evaluate_each_case{
	my $Record_number = shift;
	my $tcpar_CrashType = shift;
	my $expected_value = shift;
	# Ignition Cycle directly after crash 1, no reset
    my $dataElement = $record_handler -> GetDataElementEDID( "EDIDnr" => $tcpar_EDID,
                                                            "RecordNumber" => $Record_number,
                                                            "CrashLabel" => $tcpar_CrashType);
    S_w2log(1, "EDID $tcpar_EDID ($dataElement) validation in record $Record_number in $tcpar_CrashType ");
    my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" =>$tcpar_CrashType, "RecordNumber" =>$Record_number,"EDIDnr" => $tcpar_EDID );
	
    my $detectedvalue = $edidData -> {"DataValue"};
    my $unit = $edidData -> {"ValueUnit"};    
    unless(defined $detectedvalue) {
        S_set_error("No data could be obtained for EDID $tcpar_EDID in record read after first crash injection");
        return 1;
    }

    S_teststep_expected("Ignition Cycle Crash should be $expected_value cycles before Reset"); #evaluation 1
    S_teststep_detected("Ignition Cycle Crash is $detectedvalue cycles");
    EVAL_evaluate_value ( "EDID_$tcpar_EDID", $detectedvalue,'==', $expected_value );
    

}


1;
