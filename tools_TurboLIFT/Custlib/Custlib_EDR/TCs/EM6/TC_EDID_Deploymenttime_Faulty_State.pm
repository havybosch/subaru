#### TEST CASE MODULE
package TC_EDID_Deploymenttime_Faulty_State;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;
###-------------------------------
our $VERSION = q$Revision: 1.4 $;
our $HEADER = q$Header: TCs/TCs_Project/TC_EDID_Deploymenttime_Faulty_State.pm 1.4 2018/03/05 19:14:15ICT Jana Reddy Vadagandla (MS/ESA-PE1-CC) (VDJ5KOR) release Nisha Nataraj (MS/ESA-PE2-CC) (NIN3KOR)(2020/01/24 17:53:07ICT) $;
################################## 


#### HERE SELECTION OF AUTOTEST MODULES ####

use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here
# use LIFT_CREIS;
use LIFT_labcar;
use LIFT_can_access;
use LIFT_PD;
use LIFT_evaluation;
use LIFT_MDSRESULT;
use GENERIC_DCOM;
use FuncLib_EDR_Framework;
use FuncLib_TNT_SYC_INTERFACE;
use FuncLib_TNT_DEVICE;
use Data::Dumper;
use File::Basename;
use LIFT_TSG4;
use LIFT_crash_simulation;
use FuncLib_CustLib_EDR_CNEDR;
# use FuncLib_TNT_EDR;
##################################
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_EDR_FireTime_Validation  $Revision: 1.4 $

requires previous crash injection
   with storage of fire times and EDR records in
   Crash / Record handler
   e.g. use TC_EDR_CrashInjection.pm (ONLINE)
   or TC_EDR_CrashDataRetrieval.pm (OFFLINE)

TC does not require any equipment - only previously
   obtained data will be used

=head1 PURPOSE

to validate deployment times stored in EDR

=head1 TESTCASE DESCRIPTION 

    [initialisation]
    initialize record handler

    [stimulation & measurement] 
	not needed

    [evaluation]
    1. get list of stored records
    2. evaluate fire time of squib xy for each stored record

    [finalisation]
    not needed

=head1 PARAMETER DESCRIPTION

=head2 PARAMETER NAMES

	SquibLabel --> Label of squib to be evaluated
	EDID --> EDID number of squib to be evaluated
	EvalTolerance_abs --> Tolerance in ms for deployment time
  	

=head2 PARAMETER EXAMPLES

    [TC_EDR_FireTime_Validation.AB1FD]
	# From here on: applicable Lift Default Parameters
	SquibLabel = 'AB1FD'
	EDID = 51
	EvalTolerance_abs = 2 #msec

=cut

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DOCUMENTATION <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_EDIDNbr;
my $tcpar_SquibLabel;
my $tcpar_EvalTolerance_abs;
my $tcpar_purpose;
my $tcpar_fault_state;
my $tcpar_CrashCode;
my $tcpar_DiagType;
my $tcpar_ResultDB;
my $crashSettings;
my $edrNumberOfEventsToBeStored;
my $tcpar_Method;
my $tcpar_Value;
my $crashDetails_href;
my $crashInfo_href;
my $tcpar_CrashTimeZero_ms;
my $tcpar_ExpectedValueNotDeployed;
my $mappingEDR;
my $tcpar_FireCurrentThreshold;
my $tcpar_SquibResistance_Ohm;
my $tcpar_LCT_EDIDs;
my (	
		$tcpar_read_ChinaEDR,
		$tcpar_Invalid_EDID,
		$tcpar_DequalifiedFlag,
		$tcpar_Driverside,
		
);
################ global parameter declaration ###################
#add any global variables here
my(
    $record_handler,
    $crash_handler,
	$ChinaEDR_diagType,
	$SubaruEDR_diagType,
	$Subaru_payload,
	$crash_handler,
	$ChinaEDR_diagType,
	$tcpar_read_subaru, 
);

my $fireTimeEvalKeywordsCount = 0; #To get unique fire time eval keywords
my $ringbufferEvalKeywordsCount = 0; #To get unique ringbuffer eval keywords
my $comSignalEvalKeywordsCount = 0; #To get unique fire time eval keywords


my ($record_handler, $crashSettings, $expectedRawValues_href, $allSwitchStatesDuringCrash_href, $ChinaEDR_diagType);

our $PURPOSE;
our $TC_name = "TC_EDID_FireTimeValidation";

#-------------------------------------------------------------------------------
sub TC_set_parameters {
#-------------------------------------------------------------------------------
    $tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	# $tcpar_EDIDNbr = GEN_Read_mandatory_testcase_parameter('EDID');
	# S_add2eval_collection ( 'EDID' , $tcpar_EDIDNbr);
	# my $allAttributes = EDR_fetchEDIDallAttributes_by_ID($tcpar_EDIDNbr);
	# S_add2eval_collection('EDID From', $allAttributes -> {'From'}) if (defined $allAttributes -> {'From'});
	# $tcpar_ExpectedValueNotDeployed = S_read_optional_testcase_parameter('ExpectedValueNotDeployed');
	
	$tcpar_read_ChinaEDR  =  GEN_Read_mandatory_testcase_parameter( 'read_CHINAEDR' );
	$tcpar_CrashCode =  GEN_Read_mandatory_testcase_parameter( 'CrashCode' );
	$tcpar_CrashTimeZero_ms = GEN_Read_mandatory_testcase_parameter('CrashTimeZero_ms');
	$tcpar_Invalid_EDID  =  GEN_Read_mandatory_testcase_parameter( 'Invalid_EDID', 'byref' );
	$tcpar_LCT_EDIDs =  S_read_optional_testcase_parameter( 'LCT_EDIDs', 'byref' );
	$tcpar_SquibLabel = GEN_Read_mandatory_testcase_parameter('SquibLabel');
	$tcpar_fault_state = GEN_Read_mandatory_testcase_parameter('fault_state');
	$tcpar_DequalifiedFlag =  GEN_Read_mandatory_testcase_parameter( 'DequalifiedFlag' );
	$tcpar_Driverside =  GEN_Read_mandatory_testcase_parameter( 'Driverside' );
	$tcpar_DiagType = GEN_Read_mandatory_testcase_parameter( 'DiagType' );
	$tcpar_ResultDB =  GEN_Read_mandatory_testcase_parameter( 'ResultDB' );
	$tcpar_EvalTolerance_abs = GEN_Read_mandatory_testcase_parameter('EvalTolerance_abs');
	$tcpar_Value =  GEN_Read_mandatory_testcase_parameter( 'Value' );
	
	$ChinaEDR_diagType= 'CHINA_Payload';
	
	$tcpar_read_subaru ='no';
	$SubaruEDR_diagType ='Subaru_payload';
	return 1;
}

#-------------------------------------------------------------------------------
sub TC_initialization {
#-------------------------------------------------------------------------------
	S_teststep("Test setup preparation", 'AUTO_NBR');
	S_w2log(1, "Power on ECU");
    LC_ECU_On();
	S_wait_ms('TIMER_ECU_READY');
	CA_trace_start();
    GDCOM_init () ; # To fetch info for CD from mapping_diag
	
	#--------------------------------------------------------------
    # INITIALIZE RECORD AND CRASH HANDLER
    #    
	S_w2rep("Initialize Record and Crash Handler");
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;

	#--------------------------------------------------------------
    # PREPARE CRASH AND INITIALIZE EQUIPMENT
    #
	S_w2rep("Get crash settings for crash $tcpar_CrashCode");
	$crashDetails_href = {"RESULTDB" => $tcpar_ResultDB, 'CRASHNAME'=> $tcpar_CrashCode};
	$crashSettings = CSI_GetCrashDataFromMDS($crashDetails_href);
	unless(defined $crashSettings) {
		S_set_error("Crash $tcpar_CrashCode not available in result DB $tcpar_ResultDB. Test case aborted.");
		return;
	}

	# Result DB path
	my $resultDBDetails = S_get_contents_of_hash( [ 'MDSRESULT', 'RESULTS', "$tcpar_ResultDB" ] );
	my $resultDB_Path = $resultDBDetails->{'PATH'};
	S_w2log(1, "Crashcode: $tcpar_CrashCode, ResultDB: $tcpar_ResultDB (path: $resultDB_Path)");
	
	
	S_w2log(1, "Set environments for crash as per result DB");
	CSI_PrepareEnvironment($crashSettings, 'init_complete');
    S_wait_ms(1000);
	
	S_w2log(1, "Clear crash recorder");
	PD_ClearCrashRecorder();
    S_wait_ms(4000);
 
    # erase FltMem 
	#Quanhh cmt
	S_w2log(1, "Clear fault memory");
    PD_ClearFaultMemory();
    S_wait_ms(2000);

	S_w2log(1, "Reset ECU");
    PD_ECUreset();
    S_wait_ms('TIMER_ECU_READY');
	
	# read fault memory
	S_w2log(1, "Read and evaluate fault memory before stimulation");
    my $faultsBeforeStimulation = PD_ReadFaultMemory();              #1 as argument for reading Primary
    # my $faultsVerdict = PD_evaluate_faults( $faultsBeforeStimulation, []);
 	# return 0 unless ($faultsVerdict eq 'VERDICT_PASS');

	# Prepare crash
	CSI_LoadCrashSensorData2Simulator( $crashSettings )unless $main::opt_offline;
    S_wait_ms('TIMER_ECU_READY');

	return 1;
}

#-------------------------------------------------------------------------------
sub TC_stimulation_and_measurement {
#-------------------------------------------------------------------------------
	# my $crashdetails_href =  MDSRESULT_GetCrashDetails( {'RESULTDB' => $tcpar_ResultDB,
															# 'MDSTYPE'    => "MDSNG",
															# 'CRASHNAME'      => $tcpar_CrashCode,
															# "STATEVARIATION" => 1, 
															# }
															# , 0x0001 #NO_FILTERING
														
													   # );  # from result database
													   
		# S_w2rep("Quanhh write crash detail:".Dumper($crashdetails_href),"GREEN");
		
		# my $Sim_device_minT = $crashdetails_href -> {'SIMDEVICES'} ->{$tcpar_SquibLabel} -> {'MINT'};
		# S_w2rep("Quanhh write MIN: $Sim_device_minT","Pink");
		# my $expected_squib_openline = $Sim_device_minT -$tcpar_CrashTimeZero_ms;
		# S_w2rep("Quanhh write expected value of $tcpar_SquibLabel: $expected_squib_openline","Purple");
	
	
	my @devices;
	S_teststep("Set the squib '$tcpar_SquibLabel' to  '$tcpar_fault_state'", 'AUTO_NBR');
	DEVICE_setDeviceState($tcpar_SquibLabel,$tcpar_fault_state);
	if($tcpar_fault_state eq 'Configuration')
	{
		S_wait_ms(10000);
	}
	elsif($tcpar_fault_state eq 'CrossCouple')
	{
		LC_ECU_Off();
		S_wait_ms(6000);
		LC_ECU_On();
		S_wait_ms(6000);
	}
	else
	{
		S_wait_ms(4000);
	}
	   
	
    # -------------- Read Fault memory BEfore Crash -----------
    S_w2rep("Reading Fault Memory for  '$tcpar_SquibLabel' Squib with fault '$tcpar_fault_state'\n");
    PD_ReadFaultMemory_NOERROR(); 
	S_wait_ms(20000);
    
	#--------------------------------------------------------------
    # START MEASUREMENTS
    #
    S_teststep("Configure and start LCT Measurement", 'AUTO_NBR');

    # configure digital fire time measurement
    if($tcpar_FireCurrentThreshold){
        S_teststep_2nd_level("Set measurement threshold to $tcpar_FireCurrentThreshold A for all squibs", 'AUTO_NBR');
        LC_MeasureTraceDigitalConfigureThresholds( ['ALL'], $tcpar_FireCurrentThreshold );
    }
    else {
        S_teststep_2nd_level("Set measurement threshold to 0.5 A for all squibs", 'AUTO_NBR');
        LC_MeasureTraceDigitalConfigureThresholds( ['ALL'], 0.5 );  
    }
    
    # Set squib resistances
    if($tcpar_SquibResistance_Ohm){
        S_teststep_2nd_level("Set all squib resistances to $tcpar_SquibResistance_Ohm Ohm", 'AUTO_NBR');
        foreach my $squibLabel (LC_Get_names( 'SQUIBS' ))
        {
            LC_SetResistance( $squibLabel, $tcpar_SquibResistance_Ohm );
        }
    }

    S_teststep_2nd_level("Start fire time measurement", 'AUTO_NBR');
    LC_MeasureTraceDigitalStart();
  
	
	#------------- Inject Crash --------------
	S_teststep("Inject a Crash '$tcpar_CrashCode'", 'AUTO_NBR');
	CSI_TriggerCrash();
	S_wait_ms(10000);
	
	
	#--------------------------------------------------------------
    # STOP MEASUREMENTS
    #
	S_teststep("Stop LCT Measurement", 'AUTO_NBR');
    LC_MeasureTraceDigitalStop();
	
	#--------------------------------------------------------------
    # READ AND STORE CRASH RECORDS
    #
	my $dataStoragePath = "$main::REPORT_PATH/".$tcpar_CrashCode;

    # ************** 1 - CRASH RECORDS **************   
	S_teststep("Get all stored records via CustDiag and store in record handler", 'AUTO_NBR');
	
	$edrNumberOfEventsToBeStored = SYC_EDR_get_NumberOfEventsToBeStored();             #Uncomment this Once SYC is Proper
	unless(defined $edrNumberOfEventsToBeStored){
		S_set_error("Not available in SYC - add or overwrite with Custlibrary Function");
		return;
	}
		 
	S_w2rep("edrNumberOfEventsToBeStored=$edrNumberOfEventsToBeStored");
	Prepertation();
	S_teststep("Read all EDR records", 'AUTO_NBR');
	$edrNumberOfEventsToBeStored=3;
	# Prepertation();
	# EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								# "CrashLabel" => $tcpar_CrashCode,
								# "NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								# "StoragePath" => $dataStoragePath,
								# "read_EDRType"=>'NHTSA',);
								# # "CrashInfo" => $crashInfo_href,);
	
				

# EDR_ReadAndStoreAllRecords ("DiagType" => $tcpar_DiagType,
								# "CrashLabel" => $tcpar_Crashcode,
								# "NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								# "StoragePath" => $dataStoragePath,
								# "read_EDRType"=>'NHTSA')	
	# Prepertation();
	# if ( lc( $tcpar_read_subaru) eq 'yes' ) {
		# EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $SubaruEDR_diagType,
								# "CrashLabel" =>$tcpar_CrashCode,#."_$tcpar_SquibLabel\_Faulty",
								# "NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								# "StoragePath" => $dataStoragePath,
								# "read_EDRType"=>'CHINA')
	# }
	if (lc($tcpar_read_ChinaEDR) eq 'yes'){
		$edrNumberOfEventsToBeStored=3;
		EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => "ProdDiag",
								"CrashLabel" =>$tcpar_CrashCode,#."_$tcpar_SquibLabel\_Faulty",
								"NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								"StoragePath" => $dataStoragePath,
								"read_EDRType"=>'CHINA');
	}
	
	# EDR_ReadAndStoreAllRecords_Subaru ("DiagType" => $'ProdDiag',
								# "CrashLabel" =>$tcpar_CrashCode,#."_$tcpar_SquibLabel\_Faulty",
								# "NbrOfRecords" =>  $edrNumberOfEventsToBeStored,
								# "StoragePath" => $dataStoragePath,
								# "read_EDRType"=>'CHINA');
	
	
	PD_ECUlogin();
	S_wait_ms(8000);
	PD_DumpNVMData_NOERROR_NOHTML($main::REPORT_PATH . "/".S_get_TC_number(). "_ReadAllNVMSections_Dump.txt");
	
	# ************** 1 - FIRE TIMES **************       
	S_teststep("Get and store measured fire times", 'AUTO_NBR');
	
	S_w2rep("Get measured squib fire values by calling LC_MeasureTraceDigitalGetValues()");
    my $LCT_data = LC_MeasureTraceDigitalGetValues();

	# Get list of all measured squib labels
    my $squibLabels_aref; 
    foreach my $time ( sort { $a <=> $b } keys %$LCT_data )
    {
    	foreach my $squibLabel (keys %{$LCT_data->{$time}})
    	{
			push(@{$squibLabels_aref}, $squibLabel);
	    }
	    last;
	}
		
	if(defined $squibLabels_aref) {  ##  and not S_check_exec_option ( 'EDR_CrashInjection_DeleteRecordObjects' )) {
	    EVAL_dump2UNV( $LCT_data, "$dataStoragePath/LCT_Measurement_$tcpar_CrashCode.txt.unv" );
		    
		S_w2rep("Add all fire times measured to crash handler");
		EDR_addFireTimesToCrashHandler ("LCT_Measurement" => $LCT_data,
										"SquibLabels" => $squibLabels_aref,
										"CrashLabel"  => $tcpar_CrashCode,
										"FireCurrentDuration" => 'true');
		
	}
	else {
		S_w2rep("No deployment times will be stored for crash $tcpar_CrashCode.", 'AUTO_NBR');		
	}
	
	if ($tcpar_DequalifiedFlag eq 'Yes')
	{
		S_w2rep("Dequalified fault = $tcpar_DequalifiedFlag => remove fault",'Green');
		DEVICE_resetDeviceState($tcpar_SquibLabel,$tcpar_fault_state);
		S_wait_ms(3000);
		
		
		# -------------- Read Fault memory BEfore Crash -----------
	
	}
		S_w2rep("Reading Fault Memory for  '$tcpar_SquibLabel' Squib with fault '$tcpar_fault_state' with status of fault $tcpar_DequalifiedFlag \n","Purple");
		PD_ReadFaultMemory_NOERROR(); 
		S_wait_ms(20000);
	return 1 if(S_get_exec_option_NOERROR ( 'EDR_CrashInjection_DeleteRecordObjects' ));
	
    return 1;
}

#-------------------------------------------------------------------------------
sub TC_evaluation {	
	if($tcpar_fault_state eq 'OpenLine')
	{
		my $crashdetails_href =  MDSRESULT_GetCrashDetails( {'RESULTDB' => $tcpar_ResultDB,
															'MDSTYPE'    => "MDSNG",
															'CRASHNAME'      => $tcpar_CrashCode,
															"STATEVARIATION" => 1, 
															}
															, 0x0001 #NO_FILTERING
														
													   );  # from result database
													   
		S_w2rep("Quanhh write crash detail:".Dumper($crashdetails_href),"GREEN");
		
		for my $LCT_edid (keys %{$tcpar_LCT_EDIDs}){
			my $quib = $tcpar_LCT_EDIDs -> {$LCT_edid};
			my $Sim_device_minT = $crashdetails_href -> {'SIMDEVICES'} ->{$quib} -> {'MINT'};
			S_w2rep("Quanhh write MIN: $Sim_device_minT","Pink");
			my $expected_squib_openline = $Sim_device_minT -$tcpar_CrashTimeZero_ms;
			S_w2rep("Quanhh write expected value of $quib: $expected_squib_openline","Purple");
		
	
			my $edidData = $record_handler -> GetRawEdidDataSamples("CrashLabel" => $tcpar_CrashCode, "RecordNumber" => 1,"EDIDnr" => $LCT_edid );
			my $Detectedvalue = $edidData;# -> {"DataValue"};
				
			unless(defined $Detectedvalue) {
				S_w2rep("No data could be obtained for EDID $LCT_edid ");
				next;
			}
						
			S_w2rep("Compare value ","#88B04B");
				
			EVAL_evaluate_string ( "EDID_$LCT_edid\_Evaluation", $expected_squib_openline, $Detectedvalue );	
			
		}
		
			S_w2rep("-------------------------------------------------------------");
			S_w2rep("Squib Evaluation for Crash $tcpar_CrashCode");
			EDR_Eval_SquibFireTimes("CrashLabel" => $tcpar_CrashCode,
								"EDID_SquibLabels" => $tcpar_Invalid_EDID,
								"CrashTimeZero_ms" => $tcpar_CrashTimeZero_ms,
								"FireTimeTolerance_ms" => $tcpar_EvalTolerance_abs,
								# "ExpectedValueNotDeployed" => $tcpar_ExpectedValueNotDeployed
								"CrashLabel_FireTimes" => $tcpar_CrashCode,
								);
		
											   
											   
		
	}
	else 
	{
		S_teststep("Evaluation started", 'AUTO_NBR');
		my ($numberOfIncidents, $crashTimeZero_href) = EDR_getCrashTimeZeroPerRecord ($tcpar_CrashTimeZero_ms);
		if(($tcpar_fault_state eq 'CrossCouple') ||($tcpar_fault_state eq 'Configuration'))
		{
			for(my $recordNumber = 1; $recordNumber <= $numberOfIncidents; $recordNumber++)
			{
					
				my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $tcpar_CrashCode, "RecordNumber" => $recordNumber,"EDIDnr" => $tcpar_EDIDNbr );
				my $Detectedvalue = $edidData -> {"DataValue"};
					
				unless(defined $Detectedvalue) {
					S_w2rep("No data could be obtained for EDID $tcpar_EDIDNbr ");
					next;
				}
							
				S_w2log(1, "Compare expected and detected values");
					
				EVAL_evaluate_string ( "EDID_$tcpar_EDIDNbr\_Evaluation", $tcpar_Value, $Detectedvalue );	
			}
		}
		else
		{
			# S_w2rep("-------------------------------------------------------------");
			# S_w2rep("Squib Evaluation for Crash $tcpar_CrashCode");
			# EDR_Eval_SquibFireTimes("CrashLabel" => $tcpar_CrashCode,
									# "EDID_SquibLabels" => $tcpar_Invalid_EDID,
									# "CrashTimeZero_ms" => $tcpar_CrashTimeZero_ms,
									# "FireTimeTolerance_ms" => $tcpar_EvalTolerance_abs,
									# # "ExpectedValueNotDeployed" => $tcpar_ExpectedValueNotDeployed
									# "CrashLabel_FireTimes" => $tcpar_CrashCode,
									# );
									
			S_w2rep("-------------------------------------------------------------");
			S_w2rep("Squib Evaluation for Crash $tcpar_CrashCode");
			EDR_Eval_SquibFireTimes("CrashLabel" => $tcpar_CrashCode,
									"EDID_SquibLabels" => $tcpar_Invalid_EDID,
									"CrashTimeZero_ms" => $tcpar_CrashTimeZero_ms,
									"FireTimeTolerance_ms" => $tcpar_EvalTolerance_abs,
									# "ExpectedValueNotDeployed" => $tcpar_ExpectedValueNotDeployed
									"CrashLabel_FireTimes" => $tcpar_CrashCode,
									);
		}
	}

	
	return 1;
}
# --------------  Finalisaiton ------------------------
sub TC_finalization {
	
	S_w2rep("Start test case finalization...");
	DEVICE_resetDeviceState($tcpar_SquibLabel,$tcpar_fault_state);
	S_wait_ms(3000);
	# S_user_action('check dequalified');
	
   
	
    LC_ECU_Off();
    S_wait_ms('5000');
    LC_ECU_On();
	S_wait_ms('5000');
     
		 # -------------- Read Fault memory BEfore Crash -----------
   S_w2rep("Reading Fault Memory for  '$tcpar_SquibLabel' Squib with fault '$tcpar_fault_state' with status of fault $tcpar_DequalifiedFlag \n","Purple");
    PD_ReadFaultMemory_NOERROR(); 
	S_wait_ms(20000);
	
	S_w2rep("Delete all object instances created...");
	foreach my $recordNumber (1..$edrNumberOfEventsToBeStored)
	{
		$record_handler -> DeleteRecord("CrashLabel" => $tcpar_CrashCode , "RecordNumber" => $recordNumber);	
		$crash_handler -> DeleteAllSources ( "SourceLabel" => 'CrashTimeZero', "CrashLabel"  => $tcpar_CrashCode, );
		$crash_handler -> DeleteAllSources ( "SourceLabel" => 'CrashCode_MDS', "CrashLabel"  => $tcpar_CrashCode, );
	}

#	# Erase EDR
	PD_ClearCrashRecorder_NOERROR();
	S_wait_ms(20000);
#	
#	#Erase Record Handler
	$record_handler = EDR_init_RecordHandler() || return;
	$crash_handler  = EDR_init_CrashHandler() || return;
	

	# Erase Fault memory
	S_w2log(1, "Clear fault memory");
	PD_ClearFaultMemory_NOERROR();
	S_wait_ms(20000);
	

	LC_ECU_Off();
	S_wait_ms(4000);
	
	LC_ECU_On();
	S_wait_ms(5000);

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
	S_wait_ms(100);
	
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

sub EDR_Eval_SquibFireTimes {
#-------------------------------------------------------------------------------
    
	S_w2rep("Day la ham cua Quanhh chay ne","#9B2335");
	my @args = @_;
    my $params = { @args };

    S_w2log(3, "Starting EDR_Eval_SquibFireTimes...");
    my $squib_EDIDs_href = $params->{EDID_SquibLabels};
    my $crashLabel = $params->{CrashLabel};
    my $crashLabel_FireTimes = $params -> {CrashLabel_FireTimes};
    my $crashTimeZero_ms = $params->{CrashTimeZero_ms};
    my $fireTimeTolerance_ms = $params->{FireTimeTolerance_ms};
    my $fixedRecordNumber = $params -> {RecordNumber};
    my $multiEventIncidentNumber = $params -> {MultiEventIncidentNumber};
    my $expectedValueNotDeployed = $params -> {ExpectedValueNotDeployed};
	my $expectedValueNotConfig = $params -> {ExpectedValueNotConfig};
    if(not defined $expectedValueNotDeployed){
        my $mappingEDR = S_get_contents_of_hash(['Mapping_EDR']);
        $expectedValueNotDeployed = $mappingEDR -> {'SquibValueNotDeployed_Decoded'};
        $expectedValueNotDeployed = 'DataNotAvailable' if (not defined $expectedValueNotDeployed);
    }
	
	 if(not defined $expectedValueNotConfig){
        my $mappingEDR = S_get_contents_of_hash(['Mapping_EDR']);
        $expectedValueNotConfig = $mappingEDR -> {'SquibValueNotConfig_Decoded'};
        $expectedValueNotConfig = 'DataNotAvailable' if (not defined $expectedValueNotConfig);
    }
    #-------------------------------------------------
    # CHECK MANDATORY PARAMETERS
    #
    @args = ($squib_EDIDs_href, $crashLabel, $crashTimeZero_ms, $fireTimeTolerance_ms, $crashLabel_FireTimes, $fixedRecordNumber, $multiEventIncidentNumber);
    return unless S_checkFunctionArguments( 'EDR_Eval_SquibFireTimes ( $squib_EDIDs_href , $crashLabel, $crashTimeZero_ms, $fireTimeTolerance_ms[, $crashLabel_FireTimes, $fixedRecordNumber , $multiEventIncidentNumber ])', @args );

    unless(defined $crashLabel_FireTimes) {
        $crashLabel_FireTimes = $crashLabel;
    }

    unless(defined $record_handler) {
        S_set_error("Record handler not initialized!");
        return;
    }

    unless(defined $crash_handler) {
        S_set_error("Crash handler not initialized!");
        return;
    }

    my $mappingEDR = S_get_contents_of_hash(['Mapping_EDR']);
    my $storageOrder = $mappingEDR -> {"StorageOrder"};
    unless(defined $storageOrder) {
        S_set_error("Define 'StorageOrder' in EDR mapping! Must be 'MostRecentFirst' or 'MostRecentLast' or 'PhysicalOrder'");
        return;
    }
    if($storageOrder eq 'PhysicalOrder'){
        S_set_warning("Storage order 'PhysicalOrder' will be treated as 'MostRecentLast' for fire time validation.\n".
                        "For scenarios where overwriting takes place, use EDR_Eval_SquibFireTimes for specific record numbers only!");
        $storageOrder = 'MostRecentLast';
    }

    my $evaluationVerdict = 'VERDICT_PASS';

    # Loop over all squibs which are to be evaluated
    my $allResults_href; # store all expected and detected values for returning
    foreach my $squibEDID (keys %{$squib_EDIDs_href})
    {
        my $squibLabel = $squib_EDIDs_href -> {$squibEDID};
        S_w2log(1, "*****************");
        S_w2log(1, "Squib $squibLabel");
        S_w2log(1, "*****************");

        my @crashTimesZero_array = split(/_/, $crashTimeZero_ms);

        #--------------------------------------------------------------
        # GET MEASURED SQUIB FIRE TIME
        #    
        S_w2log(1, "Get measured squib fire time '$squibLabel' in crash $crashLabel_FireTimes");
        my $sourceData  = $crash_handler -> GetSourceDataValues ( "SourceLabel"=>$squibLabel, "CrashLabel" => $crashLabel_FireTimes);
        my $compareOperator;
        unless(defined $sourceData){
            S_w2log(1, "No measured data (from LCT or TRC) for squib '$squibLabel' found.");
            if($main::opt_offline) {
                S_w2log(1, "Offline run, set value to 1 ms.");
                $sourceData -> {"DataValues"} = $crashTimesZero_array[0] + 2;
                $sourceData -> {"DataUnit"} = 'ms';
                $compareOperator = '==';
            }
            else {
                S_w2log(1, "No fire time was measured, set expected value to 'DataNotAvailable'.");
                $sourceData = {"DataValues" => 'DataNotAvailable', "DataUnit" => 'ms'};
                $compareOperator = 'eq';
            }
        }

		my $ref_FireTimes = ref($sourceData -> {"DataValues"}) ;

        my $sourceData_CurrentDuration  = $crash_handler -> GetSourceDataValues ( "SourceLabel"=>$squibLabel."_CurrentDuration", "CrashLabel" => $crashLabel_FireTimes);
		if(not defined $sourceData_CurrentDuration) {
			S_w2log(2, "No fire current duration stored in crash handler. Will be set to undef.");
			$sourceData_CurrentDuration -> {"DataUnit"} = undef;
			$sourceData_CurrentDuration -> {"DataValues"} = [] if($ref_FireTimes eq 'ARRAY');
		}
		else {
			my $values_aref = $sourceData_CurrentDuration -> {"DataValues"};
			my $fireDurationValue;
			if(ref($values_aref) eq 'ARRAY'){
				foreach my $fireDuration (@{$values_aref}){
					$fireDurationValue .= $fireDuration." - ";
				}
			}
			else{
				$fireDurationValue = $values_aref;
			}
		    S_w2log(2, "Detected fire current duration is: ". $fireDurationValue." ms");
		}

        #--------------------------------------------------------------
        # GET EXPECTED NUMBER OF CRASH RECORDS
        #    
        # Get number of incidents by splitting crash time zero
 		my ($numberOfIncidents, $crashTimeZero_href) = EDR_getCrashTimeZeroPerRecord ($crashTimeZero_ms);
 		unless(defined $numberOfIncidents){
 			S_set_error("Number of incidents could not be obtained with given crash time zero. Check format of input parameter.");
 			return;
 		}
        S_w2log(1, "Crash scenario to be evaluated has $numberOfIncidents incidents.");

        # Extract squib fire times from source data values to array
        my (@squibFireTimes, @squibCurrentDurations);
        if(ref($sourceData -> {"DataValues"}) eq 'ARRAY') {
            # Squib has fired more than once
            @squibFireTimes = @{$sourceData -> {"DataValues"}};
            @squibCurrentDurations = @{$sourceData_CurrentDuration -> {"DataValues"}}
        }
        else {
            # Squib has only fired once
            push(@squibFireTimes, $sourceData -> {"DataValues"});
            push(@squibCurrentDurations, $sourceData_CurrentDuration -> {"DataValues"});
        }

        S_w2log(1, "Map measured fire times to incident for each incident");
        my ($squibStatesPerIncident, $currentDurationPerIncident, $expectedSquibState, $expectedCurrentDuration) = FuncLib_EDR_Framework::getFireTimesPerIncident(\@crashTimesZero_array, \@squibFireTimes, \@squibCurrentDurations);

        # Decide which records must be evaluated
        my ($startFromRecordNbr, $numberOfRecords);
        # Case 1: Fixed record number is given in parameters
        if(defined $fixedRecordNumber) {

            $numberOfRecords = $fixedRecordNumber;
            $startFromRecordNbr = $fixedRecordNumber;
            $expectedSquibState = undef;
            $expectedCurrentDuration = undef;

            my $incidentNumber;
            if(defined $multiEventIncidentNumber) {
                $incidentNumber = $multiEventIncidentNumber;
            }
            elsif($numberOfIncidents == 1) {
                $incidentNumber = 1;
            }
            else {
                S_set_error("For record $fixedRecordNumber, it is not clear which of the incidents ($numberOfIncidents) should be taken", 110);
                return;
            }

            S_w2log(1, "Fire times will be evaluated for incident $multiEventIncidentNumber which is stored in record $fixedRecordNumber");
            $expectedSquibState -> {"Record_$fixedRecordNumber"} = $squibStatesPerIncident -> {"Incident_$incidentNumber"};
			$expectedCurrentDuration -> {"Record_$fixedRecordNumber"} = $currentDurationPerIncident -> {"Incident_$incidentNumber"};
            $crashTimeZero_href -> {"Record_$fixedRecordNumber"} = $crashTimesZero_array[$incidentNumber-1];
        }
        # Case 2: Fixed record number is not given in parameters, as many records as incidents are there will be validated
        else {
            $numberOfRecords = $numberOfIncidents;
            $startFromRecordNbr = 1;
            S_w2log(1, "$numberOfRecords records will be evaluated, starting with record number $startFromRecordNbr");
        }


        #--------------------------------------------------------------
        # EVALUATE MEASURED SQUIB FIRE TIME WITH EDR
        #
        for(my $recordNumber = $startFromRecordNbr; $recordNumber <= $numberOfRecords; $recordNumber++)
        {
        	$fireTimeEvalKeywordsCount++;
            S_teststep_2nd_level("Squib $squibLabel (EDID $squibEDID), Record $recordNumber", 'AUTO_NBR', "Squib_$squibLabel\_Record_$recordNumber\_$fireTimeEvalKeywordsCount");

            my $crashT0_ms = $crashTimeZero_href -> {"Record_$recordNumber"};
			S_w2log(1, "Record $recordNumber fire times validated with crash T0 $crashT0_ms\n");

            # ************** 1 - Calculate expected fire time for squib **************   
            my($sourceValue, $sourceUnit);
            if($expectedSquibState -> {"Record_$recordNumber"} eq 'NotFired') {
                S_w2log(1, "Squib has not fired according to measurement.\n");
                $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"ExpectedFireStatus"} = 'NotFired';
                $sourceValue = $expectedValueNotDeployed;
                $compareOperator = 'eq';
                $sourceUnit  = '';
            }
            elsif($expectedSquibState -> {"Record_$recordNumber"} eq 'DataNotAvailable') {
                $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"ExpectedFireStatus"} = 'NotFired';
                $sourceValue = $expectedValueNotDeployed;
                $compareOperator = 'eq';
                $sourceUnit  = '';
            }
            else {
                S_w2log(1, "Subtract crash time zero $crashT0_ms ms from measured fire time.\n");
                $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"ExpectedFireStatus"} = 'Fired';
                $sourceValue = $expectedSquibState -> {"Record_$recordNumber"} - $crashT0_ms;
                $sourceUnit  = $sourceData -> {DataUnit};
                $compareOperator = '==';
                if(($sourceValue > 300) and ($params -> {'Autarky'} eq 'true')){
                    S_w2log(1, "Fire times greater than 300ms will be reported as not deployed in autarky");
                    $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"ExpectedFireStatus"} = 'NotFired';
                    $sourceValue = $expectedValueNotDeployed;
                    $compareOperator = 'eq';
                }
            }

            S_teststep_expected("$sourceValue $sourceUnit (+/- $fireTimeTolerance_ms)", "Squib_$squibLabel\_Record_$recordNumber\_$fireTimeEvalKeywordsCount");

            # ************** 2 - Get EDID data fire time **************       
            S_w2log(1, "Get EDID data fire time '$squibLabel' from crash $crashLabel");
            my $edidData = $record_handler -> GetDecodedEDID("CrashLabel" => $crashLabel, "RecordNumber" => $recordNumber,"EDIDnr" => $squibEDID );
            unless(defined $edidData){
                S_set_error("No EDR data for squib '$squibLabel' (EDID $squibEDID) found. Return nothing.") unless($main::opt_offline);
                return unless($main::opt_offline);

                S_w2log(1, "Offline run, set EDID value to 1 ms.");
                $edidData = {"DataValue" => 1, "ValueUnit" => 'ms'};
            }
            my $edidValue = $edidData -> { DataValue };
            my $edidUnit = $edidData -> {ValueUnit};
            S_teststep_detected("$edidValue $edidUnit", "Squib_$squibLabel\_Record_$recordNumber\_$fireTimeEvalKeywordsCount");

            # ************** 3 - Compare expected and detected values **************
            my $verdict;
            # Squib is deployed - compare deployment time
            if($compareOperator eq '==' and not $edidValue =~ /[a-zA-Z]/) {
                $verdict = EVAL_evaluate_value ( "Fire_Time_$squibLabel\_$crashLabel\_Record$recordNumber",
                                                $edidValue,
                                                $compareOperator,
                                                $sourceValue,
                                                $fireTimeTolerance_ms,
                                                'absolute');
            }
            # Squib is not deployed - string 'DataNotAvailable' expected
            elsif($compareOperator eq 'eq' or $edidValue =~ /[a-zA-Z]/) {
                $verdict = EVAL_evaluate_string ( "Fire_Time_$squibLabel\_$crashLabel\_Record$recordNumber",
                                                  $sourceValue,
                                                  $edidValue,);
            }
            else {
                S_w2log(1, "No compare operator ('eq' for string, '==' for numbers) defined.");
                $verdict = S_set_verdict('VERDICT_NONE');
            }
            S_w2log(1, "Verdict for squib $squibLabel is $verdict");
            $evaluationVerdict = 'VERDICT_FAIL' if($verdict eq 'VERDICT_FAIL');

            $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"Expected"} = $sourceValue;
            $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"Detected"} = $edidValue;
            $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"Verdict"} = $verdict;
            $allResults_href -> {$squibLabel} -> {"Record_$recordNumber"} -> {"CurrentDuration"} = $expectedCurrentDuration -> {"Record_$recordNumber"};
        }
    }

    return ($evaluationVerdict, $allResults_href);
}

1;