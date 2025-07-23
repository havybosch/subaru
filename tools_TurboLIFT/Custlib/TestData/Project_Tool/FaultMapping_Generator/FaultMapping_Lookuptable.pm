package MAP_SRS_LOOKUPTABLE;

$TABLE = {

	# Map the column names from SRS (exported to excel) with the names required by the Create_Fault_Mapping.pl tool
	#name used in tool => label in excel

	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	'COLUMN_NAMES' => {

		#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

################### EDITABLE SECTION ################
		#mandatory
		'ID'                          => 'ID',
		'DTC'                         => 'DemDtcValue',
		'Bosch Fault Name'            => 'DemEvent (Bosch fault name)',
		'FaultType'                   => 'PFT FaultEvaluation',
		'Cyclic Qualification Time'   => 'Cust cyc. qualification time',
		'Cyclic Dequalification Time' => 'Cust cyc. dequalification time',
		'Init Qualification Time'     => 'Cust init. qualification time',
		'Init Dequalification Time'   => 'Cust init. dequalification time',
		'States'                      => [ 'State_J12S', 'State_J30A', 'State_J30K', 'State_J30S', 'State_J30X', 'State_J34H', 'State_J34X', 'State_MS' ],
		
		'System Reaction'			  => 'PFT System Reaction',
		# 'System Warning Lamp'			=>'PFT WL behavior',
		'System Warning Lamp' => 'DeActTrigger',
		'Warning Lamp Support'     	  => 'WITypeSupported',
		'DeviceType'          => 'DeviceType',

		#optional
		'Fault Priority'      => 'DemDTCPriority',
		'Unlearning'          => '',
		'Tolerance'           => 'Tolerance of Qualify_Dequalify Time',
		'Qualification Group' => '',
		'Internal Fault'      => '',
		'Suppression'         => 'DemEventAvailable',
################## END EDITABLE SECTION ###############

	},

################### EDITABLE SECTION ################
	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	'PFT FaultEvaluation' => {    #label corresponding to 'FaultType'

		#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		'Initial'                   => 'init',
		'Init'                      => 'init',
		'Initial '                  => 'init',
		'Initial (before Dem_Init)' => 'init',
		'Cyclic: 10 ms'             => 'cyclic',
		'On Event'                  => 'init/cyclic',
		'Cyclic: 10 ms
Cyclic: 100 ms' => 'cyclic',
		'Cyclic: 30 ms
Cyclic: 60 ms (without fault info)
Cyclic: 100 ms' => 'cyclic',
		'Cyclic: 30 ms
Cyclic: 100 ms' => 'cyclic',
		'Cyclic: 10 ms
Cyclic: Configurable' => 'cyclic',
		'Initial
Cyclic: 10 ms' => 'init/cyclic',
		'Initial
Cyclic: 100 ms' => 'init/cyclic',
		'Initial
Cyclic: 2 ms' => 'init/cyclic',
		'Initial
Cyclic: 5 ms' => 'init/cyclic',
		'Initial
Cyclic: 30 ms' => 'init/cyclic',
		'Initial
On Event' => 'init',
		'On Event
Cyclic: Configurable' => 'cyclic',
		'Initial
Cyclic: Configurable'          => 'init/cyclic',
		'Cyclic: 100 ms'       => 'cyclic',
		'Cyclic: 200 ms'       => 'cyclic',
		'Cyclic: 2 ms'         => 'cyclic',
		'Cyclic: 200 ms'       => 'cyclic',
		'Cyclic: 30 ms'        => 'cyclic',
		'Cyclic: 5 ms'         => 'cyclic',
		'Cyclic: 25 ms'        => 'cyclic',
		'Cyclic: 90 ms'        => 'cyclic',
		'Cyclic: 60 ms'        => 'cyclic',
		'Cyclic: 1000 ms'      => 'cyclic',
		'Cyclic: Configurable' => 'cyclic',
	},

	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	'FaultType_OverWriteForSpecificFault' => {    #map FaultType from fault name to an allowed FaultType as per template
		'CrashDetected'            => 'cyclic_SPI_SingleQuali_DequaliNextPOC',
		'FuelCutoff'               => 'cyclic_SPI_SingleQuali_DequaliNextPOC',
		'csem_InitGroup'           => 'init_permanent',
		'csem_CyclRT'              => 'cyclic_SPI_SingleQuali',
		'csem_MonPerm'             => 'init_permanent',
		'pom_ESRhigh'              => 'init_NoClearNoReset',
		'pom_ErCapacityOutOfRange' => 'init_NoClearNoReset',
		'pom_OverTemperature'      => 'cyclic_SPI',
		'pom_VerLow'               => 'cyclic_SPI',
		'pom_VerHigh'              => 'cyclic_SPI',
		'pom_VST50Vltg'            => 'cyclic_SPI',
		'pom_VltgsNok'             => 'cyclic_SPI',
		'psem_Init'                => 'init_NoClearNoReset',
		'psem_SensorDefect'        => 'cyclic_permanent',
		'psem_UnexpectedSensor'    => 'init_dequali_cyclic',
		'psem_OpenLine'            => 'cyclic_DequaliNextPOC',
		'psem_ExternalComm'        => 'cyclic_DequaliNextPOC',
		'psem_InternalComm'        => 'cyclic_DequaliNextPOC',
		'sqm_ConnectorCap'         => 'init_permanent',
		'sidePowerstage'           => 'init_powerstage',
		'lfm_LifeTime'             => 'init_permanent',
	},

##################  EDITABLE SECTION ###############
	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	'PFT WL behavior' => {    #label corresponding to 'System Warning Lamp'

		#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		'WL on filtered fault' => 'Filtered',
		'WL on stored fault'   => 'Filtered/Latched/Stored',
		'WL on latched fault'  => 'Filtered/Latched',
		'None'                 => 'Off',
################## END EDITABLE SECTION ###############

	},

	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	'DeActTrigger' => {       #label corresponding to 'System Warning Lamp'
		'DEACT_TF'           => 'Filtered',
		'DEACT_TF_RNOC'      => 'Filtered',
		'DEACT_TFTOC'        => 'Filtered/Latched',
		'DEACT_TFTOC_RNOC'   => 'Filtered/Latched',
		'DEACT_ON_CONFIRMED' => 'Filtered/Latched/Stored',
		'NO_INDICATOR'       => 'Off',
	},
	
	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	'WITypeSupported' => {       #label corresponding to 'System Warning Lamp'
		'IndicatorType_SysWL'           => 'WarningLamp',
		'IndicatorType_DHSWL'           => 'DHSWarningLamp',
		'IndicatorType_BothIndicator'   => 'BothWarningLamp',
	},

	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	'Q_DQ_time_replacements' => {
		#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

################## EDITABLE SECTION ###############
		's'             => '*1000',    #replace 's' (which stands for seconds) with the number multiplied by 1000 to get the times in ms
		'ms'            => '*1',       #replace 'ms' (which stands for milliseconds) with the number multiplied by 1 to get the times in ms
		'sofort'        => '2',        #immediately -> 2 ms
		'immediately'   => '2',        #immediately -> 2 ms
		'"Immediately"' => '2',        #immediately -> 2 ms
################## END EDITABLE SECTION ###############
	},

	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	'tolerance_replacements' => {

		#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

################## EDITABLE SECTION ###############
		's'             => '*1000',    #replace 's' (which stands for seconds) with the number multiplied by 1000 to get the times in ms
		'ms'            => '*1',       #replace 'ms' (which stands for milliseconds) with the number multiplied by 1 to get the times in ms
		'sofort'        => '2',        #immediately -> 2 ms
		'immediately'   => '2',        #immediately -> 2 ms
		'"Immediately"' => '2',        #immediately -> 2 ms
################## END EDITABLE SECTION ###############
	},

	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	'FaultCondition' => {              #map condition from fault name to an allowed 'condition'
		'OpenLine'              => 'Openline',
		'ResistanceShort'       => 'ShortResistance',
		'ShortLine'             => 'Short2Gnd',
		'ResistanceOpen'        => 'Openline',
		'Configuration'         => 'Configuration',
		'Short2Bat'             => 'Short2Bat',
		'Short2VBat'            => 'Short2Bat',
		'Short2Gnd'             => 'Short2Gnd',
		'TerminalShort2Bat'     => 'Short2Bat',
		'TerminalShort2Gnd'     => 'Short2Gnd',
		'CrossCoupled'          => 'CrossCouple',
		'CrossCoupling'         => 'CrossCouple',
		'XCoupling'             => 'CrossCouple',
		'Undefined'             => 'Undefined',
		'Option'                => 'Option',
		'Plausibility'          => 'Plausibility',
		'ExternalComm'          => 'ManchesterError',
		'InternalComm'          => 'Internalcomm',
		'Defect'                => 'Defect',
		'SensorDefect'          => 'Defect',
		'FltIdleMode'           => 'IdleMode',
		'CrashDetected'         => 'Crash',
		'FuelCutoff'                    => 'Crash',
		'FltESP21TachoVelError'         => 'SignalError',
		'SquibResistanceOpen'           => 'Openline',
		'UnexpectedSensor'              => 'Configuration',
		'SquibResistanceShort'          => 'ShortResistance',
		'Unexpected'                    => 'Configuration',
		'IndicatorShort2Bat'            => 'Short2Bat',
		'IndicatorShort2Gnd'            => 'Short2Gnd',
		'HighsidePowerstage'            => 'HighsidePowerstage',
		'LowsidePowerstage'             => 'LowsidePowerstage',
		'PPSAbsolutePressure'           => 'PPSpressure',
		'PTSAbsolutePressure'           => 'PTSpressure',
		'RxMsgTimeout'                  => 'TimeOutError',
		'VbatLow'                       => 'VBatLow',
		'VbatHigh'                      => 'VBatHigh',
		'SignalMonPes'                  => 'ESO',
		'AMUConnectorCapacitorTest'     => 'plantmode11',
		'PsiCapacitance'                => 'plantmode11',
		'ConfigurationDataInconsistent' => 'DataInconsistent',
	},

	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	'Device' => {    #map device name from fault name to an allowed/required 'Device'
		'ACC10'                         => 'ACC_10',
		'FltAdaptABFD'                  => 'FrontDriverFirstStage',
		'AOutSysWarningIndicator'       => 'AWL',
		'AOutPassAirbagOffIndicator'    => 'PADL',
		'AOutPassAirbagOnIndicator'     => 'PAEL',
		'AOutCrashOutput1'              => 'CRO1',
		'AOutCrashOutput2'              => 'CRO2',
		'ConfigurationDataInconsistent' => 'UFSD',
		'FuelCutoff'                    => 'none',
		'PAOff'                         => 'PADL',
		'PAOn'                          => 'PAEL',
		'SysWI'                         => 'AWL',
		'UfsD'                          => 'UFSD',
		'UfsP'                          => 'UFSP',
		'PasFD'                         => 'PASFD',
		'PasFP'                         => 'PASFP',
		'PasMD'                         => 'PASMD',
		'PasMP'                         => 'PASMP',
		'PesRear'                       => 'PASRC',
		'RcSc1'                         => 'RCSC1',
		'RcSc2'                         => 'RCSC2',
		'PpsFD'                         => 'PPSFD',
		'PpsFP'                         => 'PPSFP',
		'PtsD'                          => 'PTSD',
		'PtsP'                          => 'PTSP',
		'PcsC'                          => 'PCSC',
		'AMUConnectorCapacitorTest'     => 'AMUConnectorCapacitor',
		'VehSpdRxMsgTimeout'            => 'Veh_Speed_dashboard',
		'PPSAbsolutePressure'           => 'PPS',
		'PTSAbsolutePressure'           => 'PTS',
	},

	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	'DeviceType' => {    #map device type from fault name to an allowed/required 'DeviceType'

		#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		#Adaptation
		'Adapt' => 'Squib',

		#Communication
		'coa'                   => 'Message',
		'FltESP21TachoVelError' => 'Signal',
		'psem'                  => 'PAS',
		'swm'                   => 'Switch',
		'wim'                   => 'Lamp',
		'sqm'                   => 'Squib',
		'aod'                   => 'Lamp',
		'evm'                   => 'evm',
		'simp'                  => 'PAS',
		'FuelCutoff'            => 'evm',
	},

};
1;
