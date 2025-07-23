	package LIFT_PROJECT;

#$VERSION = q$Revision: 1.2 $;
#$HEADER = q$Header: config/Mazda_AB12_ProjectConst.pm 1.2 2018/04/24 14:32:26ICT Rohit Raj (RBEI/ESA-PE2) (RJO6KOR) develop  $;

our $Defaults;
$Defaults = {
	'VEHICLE' => {
				   'U_BATT_DEFAULT'      => 12.0,
				   'U_BATT_UNDERVOLTAGE' => 6.0,
				   'U_BATT_OVERVOLTAGE'  => 18.0,
				   'U_BATT_LINEFAULT'    => 12.0,
				   'KL15_Zyklus_voltage' => 9.05,
				   'LowVoltage'          => 7.0,
				   'HighVoltage'         => 17.0,
				   'NormalVoltage'       => 12.0,
				   'ISO_FAULTMEMORY'     => 1,
				   'ITM_Init_Time_ms'    => 8000,
	},
	'TIMER' => {
				 'TIMER_ECU_READY'               => 10000,
				 'TIMER_ECU_READY_WITHINITDELAY' => 10000,    #wait time after power on, when ITM init delay is enabled
				 'TIMER_DIAGNOSIS'               => 1500,
				 'TIMER_ECU_OFF'                 => 12000,
				 'TIMER_CLEAR_CRASH_RECORDER'    => 20000,
	},
	 'ASICS' => {
        'MasterSystemASIC'               => 'CG904_M',
        'SlaveSystemASIC'                => 'CG904_S',
        'AdditionalPAS_IFASIC'           => '',
        'MainAccelerationSensor'         => 'SMA760',
        'PlausibilityAccelerationSensor' => 'SMA720',
        'RolloverSensor'                 => 'SMI',
        'ABPlusSensor'                   => '',
        'ABPlusSensorsforActiveSafety'   => '',
    },

	'CRC_AREA' => {
					'PROG_VAR_TBL'  => '1',
					'ASIC_CONF_TBL' => '4',
					'PAR_SEC_TBL'   => '5',
	},
	
	'TC_MANITOO' => {
		'Para_MAP_Manipu' => 'PARA_MAP_SMI', 
		# 'Para_MAP_Manipu' => 'PARA_MAP_SMA7', 
		'Para_MAP_SAD' => 'PARA_MAP_CONF_SMI8_6D_C7',
		# 'Para_MAP_SAD' => 'PARA_MAP_CONF_SMA7',
		'PARA_MAP_SPI'  => 'PARA_MAP_SMI',
        'PARA_MAP_CONF' => 'PARA_MAP_CONF_SMI8_6D_C7',
	},

	'DISPOSAL' => {
					'RoutineStatusRecord'   => '00',
					'SW_Path'               => 'D:\MKS\Projects\TurboLIFT\Projects\JOEM_Platform\Mazda_AB12\config\SW\MA1210_C0_0093_BB100442_Cat2.hex',
					'ECU_Serial_Number'     => '6IS096435C',
					'ECU_Type'              => 'D3A',
					'WL_Status_Read_Method' => 'PD',
					'WL_Signal_Name'        => 'rb_wimi_SysWIStatus_aen(0)',
	},

	'WARNING_LAMPS' =>
	  {
		'WL_1_4_Name' => 'DISP',
	  },

	'CAN' => {

		#'CAN1_Name'   => 'Airbag_Bus',
		'CAN1_Name' => 'CAN1',
		'CAN2_Name' => 'CAN2',
	},

#	'ProdDiag' => {
#					'ProjectName' => 'Mazda',           #possible values are 'TakeFromPSDiag' or project name
#					'CAN_Type'    => 'BOSCH_CAN_03',    #optional. If 'TakeFromPSDiag' is chosen, then this is read from PSDiag config file
#	},
#
#	'SADCONFIG' => {
#					 'CAN_Type' => 'BOSCH_CAN_03',
#	},
#	
	
    'SADCONFIG' => {
        'CAN_Type' => 'BOSCH_CAN_03',
    },
    'ProdDiag' => {
        'ProjectName' => 'TakeFromPSDiag',    # project name, possible values are 'TakeFromPSDiag' or
                                              # a CANType from PSDiag_CAN_Parameter.txt, e.g. 'BOSCH_CAN_03' or 'FORD_CAN_05' or
                                              # a FlexrayType from TBD (this is not yet supported by PDLayer.dll)
    },
########################################################################################################################
	# here you can define global optional faults for every test, for example if you have always variant coding info in EEPROM
	# 'TEMP_OPTIONAL_FAULTS' -> fault is ignored completely
	# 'TEMP_DISTRUB_FAULTS' -> fault is ignored if only disturb bit is set
	# 'TEMP_DISTRUB_FAULTS' => [ 'ALL' ] will ignore all faults where only disturb bit is set
	#e.g. 'TEMP_OPTIONAL_FAULTS' => [ 'FltVdsPitchRateSensorMonitoring' , 'FltVdsYawRateSensorMonitoring' ],
########################################################################################################################
	# 'TEMP_OPTIONAL_FAULTS' => ['rb_swm_MismatchPADS_flt', 'rb_sqm_SquibResistanceOpenAB1FP_flt', 'rb_mm_MazdaPlantMode_flt', 'rb_eol_EOLNotComplete_flt','rb_edr_DataAreaNotInitialized_flt', 'rb_spi_SpiRcvMsgCrcWrong_flt', 'rb_ocs_TimeoutResponseID_flt'],
'TEMP_OPTIONAL_FAULTS' => [],
	# rb_sqm_SquibResistanceOpenAB1FP_flt : caused by issue lack of Hardnet connection
	# rb_swm_MismatchPADS_flt : problem ALM_874137

	#'TEMP_DISTRUB_FAULTS' => [ 'ALL' ],

	'EVALUATION_FILE' => {
		'USED'          => 1,
		'DELIMITER'     => chr(9),      ### useful are: chr(9) is TAB or ';'
		'EMPTY_CHAR'    => ' - - - ',
		'SIGNAL_MARKER' => 'SIG: ',     ### marker to identify the label of the checked signal
		'EXPECT_MARKER' => 'EXP: ',     ### marker to identify the 'MUST' / 'SOLL'
		'DETECT_MARKER' => 'FND: ',     ### marker to identify the 'REAL' / 'IST'
		'JUST_VERDICTS' => {
							 'VERDICT_FAIL'   => 1,
							 'VERDICT_INCONC' => 1,
							 'VERDICT_NONE'   => 1,
							 'VERDICT_PASS'   => 1,
		},
		'COLUMN_ORDER' => [ 'NBR', 'DATE_TIME', 'TC_ID', 'VERDICT', 'MISMATCH', 'LAMPS', 'RB_FAULTS', 'CU_FAULTS', 'OTHER_VALUES', ],
	},
	$Defaults->{'DEVICE_CONFIG'} = {

	# Squibs
	'AB1FD'  => 'AB1FD',
	'AB1FP'  => 'AB1FP',
	'AB2FD'  => 'AB2FD',
	'AB2FP'  => 'AB2FP',
	'BT1FD'  => 'BT1FD',
	'BT1FP'  => 'BT1FP',
	'BT1RD'  => 'BT1RD',
	'BT1RP'  => 'BT1RP',
	'IC1FD'  => 'IC1FD',
	'IC1FP'  => 'IC1FP',
	'KA1FD'  => 'KA1FD',
	'KA1FP'  => 'KA1FP',
	'PPABL'  => 'PPABL',
	'PPABR'  => 'PPABR',
	'SA1FD'  => 'SA1FD',
	'SA1FP'  => 'SA1FP',
	'SA1RD'  => 'SA1RD',
	'SA1RP'  => 'SA1RP',
	'AB1RD'  => 'AB1RD',
	'AB1RP'  => 'AB1RP',
	'AB2RD'  => 'AB2RD',
	'AB2RP'  => 'AB2RP',
	'CS1FD'  => 'CS1FD',
	'CS1FP'  => 'CS1FP',
	'ALLRD'  => 'ALLRD',
	'ALLRP'  => 'ALLRP',

	'UFSD'	   => 'UfsD',
	'UFSP'     => 'UfsP',
	'UFSC'     => 'UfsC',
	'PASFD'    => 'PasFD',
	'PASFP'    => 'PasFP',
	'PASMD'    => 'PasMD',
	'PASMP'    => 'PasMP',
	'PPSFD'    => 'PpsFD',
	'PPSFP'    => 'PpsFP',
	
	# Warning lamps
	'E_call' => 'AOutCrashOutput1',
	'Door_Unlock' => 'AOutCrashOutput2',
	'HV_Cut' => 'AOutCrashOutput3',

	# Switches
	'PADS1'          => 'PADS1',
	'PADS2'          => 'PADS2',
	'BLFD'           => 'BLFD',
	'BLFP'           => 'BLFP',
	'SPSFD'          => 'SPSFD',
	'SPSFP'          => 'SPSFP',
	'OPSFP'          => 'OPSFP',
	'ConnectorLockA' => 'ConnectorLockA',
	'ConnectorLockB' => 'ConnectorLockB',
	'ConnectorLockC' => 'ConnectorLockC',
	'RSD'            => 'RSD',
	'RSP'            => 'RSP',

	# Customer dummy device
	#PASes
	
	# ASICs
	'SystemAsic1'       => 'SystemAsic1',
	'SystemAsic2'       => 'SystemAsic2',
	'CentralSensorMain' => 'CentralSensorMain',
	'CentralSensorYaw'  => 'CentralSensorYaw',
	'CentralSensorRoll' => 'CentralSensorRoll',

	# Special Behaviour Bits
	'SpecBehItmDebugDelay'                       => 'SpecBehItmDebugDelay',
	'DisableAlgoRollover'                        => 'DisableAlgoRollover',
	'DisableAlgoStaticRollover'                  => 'DisableAlgoStaticRollover',
	'DisableAlgoPitch'                           => 'DisableAlgoPitch',
	'DisableAlgoPep'                             => 'DisableAlgoPep',
	'IsRightHandDriver'                          => 'IsRightHandDriver',
	'CustIsOCSConfigured'                        => 'CustIsOCSConfigured',
	'CustDummySBit2'                             => 'CustDummySBit2',
	'CustDummySBitN'                             => 'CustDummySBitN',
	'DISP'                     => 'IsISODisposalSupported',
	'CustIsCrashOutputMessage340and341Supported' => 'CustIsCrashOutputMessage340and341Supported',
	'CustIsCrashoutputEmergencyCallSupported'    => 'CustIsCrashoutputEmergencyCallSupported',
	'CustIsCrashoutputDoorUnlockCallSupported'   => 'CustIsCrashoutputDoorUnlockCallSupported',

	#Section Activators
	'Dummy'              => 'Dummy',
	'CustFuelCutoffSys'  => 'CustFuelCutoffSys',
	'CustMazdaPlantMode' => 'CustMazdaPlantMode',
	'PAOn'               => 'PAOn',
	'PAOff'              => 'PAOff',
	'CustDummyDBitN'     => 'CustDummyDBitN',
  },
  
  
  $Defaults -> {'Coreassetconfig'} = {
	'SYC_device_map' => {
		'SYC_VALIDATE' => 'YES',
	},

	'Aout' => {
		'Crash_Details' => {
		'Crashcode' => 'Single_EDR_Front_Inflatable;5',
		'Crash_Faults' => [rb_evm_CrashDetected_flt, rb_evm_FrontCrashDetected_flt, rb_edr_DataAreaFull_flt, rb_co_ThresholdOverFst_flt, rb_co_DoorUnlockAndEcallOutput_flt, rb_co_FuelCutoff_flt],
		}, 
		'AOUT_CNS_DEVICE_MAP' => {
			 'AOutCrashOutput1' => 'CrashOutput1', 
			 'AOutCrashOutput2' => 'CrashOutput2',
			 'AOutCrashOutput3' => 'CrashOutput3',
			 },
			},

		'AOutCrashOutput1' => {
			  'DriverType'        => 'LOW',
			  'AOUT_ON_Fault'             => 'NONE', # Cannot be set with fault
			  'AOUT_ON_Switch' => {
				 'Switch' => [NONE],
				 'Position' =>[NONE], # Cannot be set with Switch by defaults it is PWM(Blinking continuously)
				},
			  'AOUT_OFF_Switch' => {
				 'Switch' => [NONE],
				 'Position' =>[NONE],
				},
			},
		'AOutCrashOutput2' => {
			  'DriverType'        => 'LOW',
			  'AOUT_ON_Fault'             => 'NONE', # Cannot be set with fault
			  'AOUT_ON_Switch' => {
				 'Switch' => [NONE],
				 'Position' =>[NONE], # Cannot be set with Switch by defaults it is PWM(Blinking continuously)
				},
			  'AOUT_OFF_Switch' => {
				 'Switch' => [NONE],
				 'Position' =>[NONE],
				},
			},
		'AOutCrashOutput3' => {
			  'DriverType'        => 'LOW',
			  'AOUT_ON_Fault'             => 'NONE', # Cannot be set with fault
			  'AOUT_ON_Switch' => {
				 'Switch' => [NONE],
				 'Position' =>[NONE], # Cannot be set with Switch by defaults it is PWM(Blinking continuously)
				},
			  'AOUT_OFF_Switch' => {
				 'Switch' => [NONE],
				 'Position' =>[NONE],
				},
			},	
	},

};

1;
