#### This file is generated from SPR export by the Diag mapping generator tool ####														
														
package LIFT_PROJECT; 														
														
######################################################### 														
														
########################################################## 														
														
$Defaults->{"CUSTOMER_DIAGNOSIS"} = {														
	'RequestID_disposal'                          => '0x7F1',                                           #as hex string													
	'ResponseID_disposal'                         => '0x7F9',                                           #as hex string													
	'FlowControlID_disposal'                      => '0x7F1',													
	'Timeout_disposal'                            => 20000,   													
	'P3_mintime_disposal'						  => 100,							
	'RequestID_physical'       => '0x737',                                               #as hex string													
	'ResponseID_physical'      => '0x73F',                                               #as hex string													
	'FlowControlID_physical'   => '0x737',													
	'Timeout_physical'         => 20000,													
	'P3_mintime_physical'      => 100,													
	'RequestID_functional'     => '0x7DF',                                               #as hex string													
	'ResponseID_functional'    => '0x73F',                                               #as hex string													
	'FlowControlID_functional' => '0x737',													
	'Timeout_functional'       => 2000,                                                 #in milliseconds,CD function will convert it to second													
	'P3_mintime_functional'    => 100,													
														
	'FlowControl'              => [ 0x30, 0x00, 0x00 ],                                  #3 Bytes as array ref													
	'clearDTC'                 => [ 0x14, 0xFF, 0xFF, 0xFF ],                                  #Bytes as array ref													
	'SAM'                      => 0xF0,													
	'SJW'                      => 0x04,													
	'Tseg1'                    => 0x30,													
	'Tseg2'                    => 3,													
	'Baudrate'                 => 500000,													
	'DLCmode'                  => 0,                                                     #0 for 8 byte, 1 for dynamic DLC													
	'DTCdefaultstate'          => 0x08,                                                   #read current fault													
        'DTCdefaultsubfunction' => 0x2,														
	'DTCbytes'                 => 3,                                                     #bytes per DTC													
	'ExtID'                    => 0,                                                     # 1 for Extended Identifier, 0 for Standard													
	'ExtAddressing'            => 0,                                                     # 1 for Extended Addressing, 0 for Normal													
	'EcuAddr'                  => 0x01,                                                  # ECU id for Extended Addressing.													
	'TargetAddr'               => 0x55,                                                  # Target address for Extended Addressing.													
	'CAN_TesterPresent_Req'    => [0x02, 0x3E, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00],      #do not add DLC in the request													
	'CAN_TesterPresent_Time'   => 4000,                                                  # cyclic TP cycle time is milli sec													
	'DISABLE'                  => 0,                                                     # optional, to disable all CD features (similar to debug mode)													
	'DTCdefaultsubfunction'    => 0x02,													
														
														
 #Mention the customer diagnostic request response names as defined in database. 														
								    #This will be used to fetch the request/response data using CA/FR functions						
								    'RequestName_physical' => 'ISO_Airbag_01_Req',						
								    'ResponseName_physical' => 'ISO_Airbag_01_Resp',						
								    'RequestName_physical_FR' => 'ISO_Tester_16',						
								    'ResponseName_physical_FR' => 'ISO_Airbag_01_Resp',						
														
};														
														
$Defaults->{"Mapping_DIAG"} = {														
														
														
############# PRJ_SUPPORTED_SERVICES ##################														
														
'PRJ_SUPPORTED_SERVICES' => {														
	'DiagnosticSessionControl' => '10',													
	'ECUReset' => '11',													
	'ClearDTCInformation' => '14',													
	'ReadDTCInformation' => '19',													
	'ReadDataByIdentifier' => '22',													
	'SecurityAccess' => '27',													
	'WriteDataByIdentifier' => '2E',													
	'IOControl' => '2F',													
	'RoutineControl' => '31',													
	'TesterPresent' => '3E',													
	'ControlDTCSetting' => '85',													
},														
#---------------------------------------------------------#														
														
														
############# DIAG SERVICES ##################														
														
'DIAG_SERVICES' => {														
														
														
	'SecurityAccess' => {													
			'Service_ID'        => '27',											
					'Supported_SubFuns' => {									
				'RequestSeed_Deployment' => '5F',										
				'RequestSeed_EDR'        => 'te rt he ap pr op ri at es ub fu nc ti on fo rR eq ue st Se ed :2 7X',										
				'SendKey_Deployment'     => '60',										
				'SendKey_EDR'            => 'te rt he ap pr op ri at es ub fu nc ti on fo rS en dK ey :2 7Y',										
				'RequestSeed_01'         => '27 01',										
				'RequestSeed_03'         => '27 03',										
				'RequestSeed_21'         => '27 21',										
				'RequestSeed_23'         => '27 23',										
				'RequestSeed_25'         => '27 25',										
				'RequestSeed_27'         => '27 27',										
				'RequestSeed_29'         => '27 29',										
				'RequestSeed_2B'         => '27 2B',										
				'RequestSeed_2D'         => '27 2D',										
				'RequestSeed_2F'         => '27 2F',										
				'SendKey_02'             => '27 02',										
				'SendKey_04'             => '27 04',										
				'SendKey_22'             => '27 22',										
				'SendKey_24'             => '27 24',										
				'SendKey_26'             => '27 26',										
				'SendKey_28'             => '27 28',										
				'SendKey_2A'             => '27 2A',										
				'SendKey_2C'             => '27 2C',										
				'SendKey_2E'             => '27 2E',										
				'SendKey_30'             => '27 30',										
					},									
					'NEG_Responses' => {									
				'NR_subFunctionNotSupported'                  => { 'Response' => '7F 27 12', 'Mode' => 'strict', 'Desc' => 'subFunctionNotSupported',                  'AddrModes' => ['physical'] },										
				'NR_incorrectMessageLengthOrInvalidFormat'    => { 'Response' => '7F 27 13', 'Mode' => 'strict', 'Desc' => 'incorrectMessageLengthOrInvalidFormat',    'AddrModes' => [ 'physical', 'functional' ] },										
				'NR_busyRepeatRequest'                        => { 'Response' => '7F 27 21', 'Mode' => 'strict', 'Desc' => 'busyRepeatRequest',                        'AddrModes' => [ 'physical', 'functional' ] },										
				'NR_conditionsNotCorrect'                     => { 'Response' => '7F 27 22', 'Mode' => 'strict', 'Desc' => 'conditionsNotCorrect',                     'AddrModes' => [ 'physical', 'functional' ] },										
				'NR_requestSequenceError'                     => { 'Response' => '7F 27 24', 'Mode' => 'strict', 'Desc' => 'requestSequenceError',                     'AddrModes' => [ 'physical', 'functional' ] },										
				'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' => '7F 27 78', 'Mode' => 'strict', 'Desc' => 'requestCorrectlyReceived_ResponsePending', 'AddrModes' => [ 'physical', 'functional' ] },										
				'NR_subFunctionNotSupportedInActiveSession'   => { 'Response' => '7F 27 7E', 'Mode' => 'strict', 'Desc' => 'subFunctionNotSupportedInActiveSession',   'AddrModes' => [ 'physical', 'functional' ] },										
				'NR_serviceNotSupportedInActiveSession'       => { 'Response' => '7F 27 7F', 'Mode' => 'strict', 'Desc' => 'serviceNotSupportedInActiveSession',       'AddrModes' => [ 'physical', 'functional' ] },										
				'NR_invalidKey'                               => { 'Response' => '7F 27 35', 'Mode' => 'strict', 'Desc' => 'invalidKey',                               'AddrModes' => [ 'physical', 'functional' ] },										
				'NR_exceedNumberOfAttempts'                   => { 'Response' => '7F 27 36', 'Mode' => 'strict', 'Desc' => 'exceedNumberOfAttempts',                   'AddrModes' => [ 'physical', 'functional' ] },										
				'NR_requiredTimeDelayNotExpired'              => { 'Response' => '7F 27 37', 'Mode' => 'strict', 'Desc' => 'requiredTimeDelayNotExpired',              'AddrModes' => [ 'physical', 'functional' ] },										
					},									
	},													
#----------------------------------------------------------------------------------#														
	'DiagnosticSessionControl' => {													
					'Service_ID' => '10',									
					'Supported_SubFuns' => {									
								'DefaultSession' 						=> '01', 
								'DefaultSession_ForDisposal' 			=> '01',			
							    'DefaultSession_WithSuppression'		=> '81',  					
								'ExtendedSession' 						=> '03',
								'ExtendedSession_WithSuppression' 		=> '83',  				
								'ProgrammingSession' 					=> '02',	
								'ProgrammingSession_WithSuppression' 	=> '82', 					
								'SafetySession' 						=> '04',
								'SafetySession_WithSuppression' 		=> '84', 				
					},									
					'NEG_Responses' => {									
								'NR_subFunctionNotSupported' => { 'Response' =>  '7F 10 12' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 10 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_busyRepeatRequest' => { 'Response' =>  '7F 10 21' , 'Mode' =>  'strict' , 'Desc' =>  'busyRepeatRequest' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_conditionsNotCorrect' => { 'Response' =>  '7F 10 22' , 'Mode' =>  'strict' , 'Desc' =>  'conditionsNotCorrect' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' =>  '7F 10 78' , 'Mode' =>  'strict' , 'Desc' =>  'requestCorrectlyReceived_ResponsePending' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_subFunctionNotSupportedInActiveSession' => { 'Response' =>  '7F 10 7E' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_serviceNotSupportedInActiveSession' => { 'Response' =>  '7F 10 7F' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_vehicleSpeedTooHigh' => { 'Response' =>  '7F 10 88' , 'Mode' =>  'strict' , 'Desc' =>  'vehicleSpeedTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooHigh' => { 'Response' =>  '7F 10 92' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooLow' => { 'Response' =>  '7F 10 93' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooLow' , 'AddrModes' => [ 'physical', 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
	'ECUReset' => {													
					'Service_ID' => '11',									
					'Supported_SubFuns' => {									
								'HardReset' => '01', 						
								'HardReset_ForDisposal' => '01',						
								'HardReset_WithSuppression' => '81',  						
					},									
					'NEG_Responses' => {									
								'NR_subFunctionNotSupported' => { 'Response' =>  '7F 11 12' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 11 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_busyRepeatRequest' => { 'Response' =>  '7F 11 21' , 'Mode' =>  'strict' , 'Desc' =>  'busyRepeatRequest' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_conditionsNotCorrect' => { 'Response' =>  '7F 11 22' , 'Mode' =>  'strict' , 'Desc' =>  'conditionsNotCorrect' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestOutOfRange' => { 'Response' =>  '7F 11 31' , 'Mode' =>  'strict' , 'Desc' =>  'requestOutOfRange' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_securityAccessDenied' => { 'Response' =>  '7F 11 33' , 'Mode' =>  'strict' , 'Desc' =>  'securityAccessDenied' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' =>  '7F 11 78' , 'Mode' =>  'strict' , 'Desc' =>  'requestCorrectlyReceived_ResponsePending' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_subFunctionNotSupportedInActiveSession' => { 'Response' =>  '7F 11 7E' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_serviceNotSupportedInActiveSession' => { 'Response' =>  '7F 11 7F' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_vehicleSpeedTooHigh' => { 'Response' =>  '7F 11 88' , 'Mode' =>  'strict' , 'Desc' =>  'vehicleSpeedTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooHigh' => { 'Response' =>  '7F 11 92' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooLow' => { 'Response' =>  '7F 11 93' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooLow' , 'AddrModes' => [ 'physical', 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
	'ClearDTCInformation' => {													
					'Service_ID' => '14',									
					'Supported_SubFuns' => {									
								'allGroupOfDTC' => 'FF FF FF', 						
					},									
					'NEG_Responses' => {									
								'NR_serviceNotSupported' => { 'Response' =>  '7F 14 11' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 14 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_busyRepeatRequest' => { 'Response' =>  '7F 14 21' , 'Mode' =>  'strict' , 'Desc' =>  'busyRepeatRequest' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_conditionsNotCorrect' => { 'Response' =>  '7F 14 22' , 'Mode' =>  'strict' , 'Desc' =>  'conditionsNotCorrect' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestOutOfRange' => { 'Response' =>  '7F 14 31' , 'Mode' =>  'strict' , 'Desc' =>  'requestOutOfRange' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_generalProgrammingFailure' => { 'Response' =>  '7F 14 72' , 'Mode' =>  'strict' , 'Desc' =>  'generalProgrammingFailure' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' =>  '7F 14 78' , 'Mode' =>  'strict' , 'Desc' =>  'requestCorrectlyReceived_ResponsePending' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_serviceNotSupportedInActiveSession' => { 'Response' =>  '7F 14 7F' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_vehicleSpeedTooHigh' => { 'Response' =>  '7F 14 88' , 'Mode' =>  'strict' , 'Desc' =>  'vehicleSpeedTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooHigh' => { 'Response' =>  '7F 14 92' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooLow' => { 'Response' =>  '7F 14 93' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooLow' , 'AddrModes' => [ 'physical', 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation' => {													
					'Service_ID' => '19',									
					'Supported_SubFuns' => {									
								'ReportDTCByStatusMask' 				=> '02',		
								'ReportDTCByStatusMask_WithSuppression' => '82', 						
								'ReportDTCExtDataRecordByDTCNumber' => '06',						
								'ReportDTCExtDataRecordByDTCNumber_WithSuppression' => '86',  						
								'ReportDTCSnapshotRecordByDTCNumber' => '04',						
								'ReportDTCSnapshotRecordByDTCNumber_WithSuppression' => '84',  						
								'ReportNumberOfDTCByStatusMask' => '01',						
								'ReportNumberOfDTCByStatusMask_WithSuppression' => '81',  						
								'ReportSupportedDTC' => '0A',						
								'ReportSupportedDTC_WithSuppression' => '8A',  						
					},									
					'NEG_Responses' => {									
								'NR_serviceNotSupported' => { 'Response' =>  '7F 19 11' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_subFunctionNotSupported' => { 'Response' =>  '7F 19 12' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 19 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_busyRepeatRequest' => { 'Response' =>  '7F 19 21' , 'Mode' =>  'strict' , 'Desc' =>  'busyRepeatRequest' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_conditionsNotCorrect' => { 'Response' =>  '7F 19 22' , 'Mode' =>  'strict' , 'Desc' =>  'conditionsNotCorrect' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestOutOfRange' => { 'Response' =>  '7F 19 31' , 'Mode' =>  'strict' , 'Desc' =>  'requestOutOfRange' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' =>  '7F 19 78' , 'Mode' =>  'strict' , 'Desc' =>  'requestCorrectlyReceived_ResponsePending' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_subFunctionNotSupportedInActiveSession' => { 'Response' =>  '7F 19 7E' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_serviceNotSupportedInActiveSession' => { 'Response' =>  '7F 19 7F' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_vehicleSpeedTooHigh' => { 'Response' =>  '7F 19 88' , 'Mode' =>  'strict' , 'Desc' =>  'vehicleSpeedTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooHigh' => { 'Response' =>  '7F 19 92' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooLow' => { 'Response' =>  '7F 19 93' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooLow' , 'AddrModes' => [ 'physical', 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier' => {													
					'Service_ID' => '22',									
					'Supported_SubFuns' => {									
								'AddressInformationOfPCU' => 'FA 02', 						
								'BootSoftwareIdentification' => 'F1 80', 						
								'CrashOutput_1' => 'D9 07', 						
								'CrashOutput_2' => 'D9 17', 						
								'CrashOutput_3' => 'D9 27', 						
								'CustCentralCfgCRC16Status' => 'E2 0B', 						
								'CustMACSupportStatus' => 'E2 0C', 						
								'CustReadActiveSession' => 'D1 00', 						
								'CustReadActiveSession_ForDisposal' => 'D1 00', 						
								'CustReadAirbagWarningLamp' => '61 C6', 						
								'CustReadDHSAirbagWarningLamp' => '61 A4', 						
								'CustReadDiagTypeNr' => 'DD 19', 						
								'CustReadDiagnosticSpecificationVersion' => 'F1 63', 						
								'CustReadDriverFarSideAB' => '5B 3A', 						
								'CustReadDriverFront1stAB' => '5B 03', 						
								'CustReadDriverFront2ndAB' => '5B 09', 						
								'CustReadDriverFrontCurtainAB' => '5B 0B', 						
								'CustReadDriverFrontSeatPretensioner' => '5B 05', 						
								'CustReadDriverFrontSideAB' => '5B 07', 						
								'CustReadDriverKneeAB' => '5B 10', 						
								'CustReadDriverRear2ndSeatPretensioner' => '5B 36', 						
								'CustReadDriverSeatBeltSensorStatus' => '5B 19', 						
								'CustReadDriverSideSeatbeltLapPretensioner' => '5B 0D', 						
								'CustReadECUAssemblyNumber' => 'F1 12', 						
								'CustReadECUCoreAssemblyNumber' => 'F1 11', 						
								'CustReadECUDeliveryAssemblyNumber' => 'F1 13', 						
								'CustReadECUSerialNr' => 'F1 8C', 						
								'CustReadEOLConfiguration' => 'DE 00', 						
								'CustReadLeftDHSActuator' => '5B 39', 						
								'CustReadLeftPedestrianAirbag' => '58 47', 						
								'CustReadNoTroubleCode' => '02 02', 						
								'CustReadPassenger2ndSeatPretensioner' => '5B 37', 						
								'CustReadPassengerFront1stAB' => '5B 04', 						
								'CustReadPassengerFront2ndAB' => '5B 0A', 						
								'CustReadPassengerFrontCurtainAB' => '5B 0C', 						
								'CustReadPassengerFrontSeatPretensioner' => '5B 06', 						
								'CustReadPassengerFrontSideAB' => '5B 08', 						
								'CustReadPassengerKneeAB' => '5B 3C', 						
								'CustReadPassengerSeatBeltSensorStatus' => '5B 1A', 						
								'CustReadPassengerSeatMatSensorStatus' => '41 19', 						
								'CustReadPassengerSideSeatbeltLapPretensioner' => '5B 0E', 						
								'CustReadPoorConnectionDetectorBarResistenceAChamber' => 'D9 6D', 						
								'CustReadRestraintSystemMalfunctionIndicator' => '5B 1C', 						
								'CustReadRestraintSystemPassengerDisableIndicator' => '5B 1B', 						
								'CustReadRightDHSActuator' => '5B 38', 						
								'CustReadRightPedestrianAirbag' => '58 46', 						
								'CustReadSeatTrackSensorStatus' => '5B 27', 						
								'CustReadSerialNbrCzsDr' => 'F1 41', 						
								'CustReadSerialNrBPillerSisDr' => 'F1 42', 						
								'CustReadSerialNrBPillerSisPa' => 'F1 43', 						
								'CustReadSerialNrCPillerSisDr' => 'F1 44', 						
								'CustReadSerialNrCPillerSisPa' => 'F1 45', 						
								'CustReadSerialNrCzsBump' => 'F1 50', 						
								'CustReadSerialNrCzsCenter' => 'F1 4F', 						
								'CustReadSerialNrCzsPa' => 'F1 48', 						
								'CustReadSerialNrDHS1' => 'F1 49', 						
								'CustReadSerialNrDHS2' => 'F1 4A', 						
								'CustReadSerialNrDHS3' => 'F1 4B', 						
								'CustReadSerialNrDHS4' => 'F1 4C', 						
								'CustReadSerialNrDHS5' => 'F1 4D', 						
								'CustReadSerialNrDHS6' => 'F1 4E', 						
								'CustReadSerialNrPSisDr' => 'F1 46', 						
								'CustReadSerialNrPSisPa' => 'F1 47', 						
								'CustReadSoftwareDownloadSpecificationVersion' => 'F1 62', 						
								'CustReadVBatVoltage' => 'D1 11', 						
								'CustReadVehManuSwNo' => 'F1 88', 						
								'DeploymentLoopTable' => 'FA 06', 						
								'DeploymentMethodVersion' => 'FA 01', 						
								'DismantlerInfo' => 'FA 07', 						
								'ECUCalibrationData1Number' => 'F1 24', 						
								'ECUSoftware2PartNumber' => 'F1 20', 						
								'ECUSoftware3PartNumber' => 'F1 21', 						
								'ECUSoftware4PartNumber' => 'F1 22', 						
								'EDREntry01' => 'FA 13', 						
								'EDREntry02' => 'FA 14', 						
								'EDREntry03' => 'FA 15', 						
								'EDRROM' => 'D9 00', 						
								'MazdaEDRDataPart1_1' => 'D9 F0', 						
								'MazdaEDRDataPart1_2' => 'D9 F3', 						
								'MazdaEDRDataPart1_3' => 'D9 F6', 						
								'MazdaEDRDataPart2_1' => 'D9 F1', 						
								'MazdaEDRDataPart2_2' => 'D9 F4', 						
								'MazdaEDRDataPart2_3' => 'D9 F7', 						
								'MazdaEDRDataPart3_1' => 'D9 F2', 						
								'MazdaEDRDataPart3_2' => 'D9 F5', 						
								'MazdaEDRDataPart3_3' => 'D9 F8', 						
								'NOSCANCommunicationLayerVersionNumber' => 'F1 61', 						
								'NOSCANDriverVersionNumber' => 'F1 59', 						
								'NOSDiagnosticVersionNumber' => 'F1 60', 						
								'NOSGenerationToolVersionNumber' => 'F1 5F', 						
								'NOSInteractionLayerVersionNumber' => 'F1 5C', 						
								'NOSMessageDatabase1VersionNumber' => 'F1 66', 						
								'NOSNetworkInitializationVersionNumber' => 'F1 5D', 						
								'NOSNetworkManagementJunior' => 'F1 5B', 						
								'NOSOSEKNetworkManagementVersionNumber' => 'F1 5A', 						
								'NOSTransportLayerVersionNumber' => 'F1 5E', 						
								'NumberOfPCU' => 'FA 00', 						
								'PostCrash_1' => 'D9 05', 						
								'PostCrash_2' => 'D9 15', 						
								'PostCrash_3' => 'D9 25', 						
								'PreCrashADAS_1' => 'D9 02', 						
								'PreCrashADAS_2' => 'D9 12', 						
								'PreCrashADAS_3' => 'D9 22', 						
								'PreCrash_1' => 'D9 01', 						
								'PreCrash_2' => 'D9 11', 						
								'PreCrash_3' => 'D9 21', 						
								'ReadOcsCALCheckCauseOfFault' => 'D9 6C', 						
								'ReadOcsCalibrationStatus' => '58 09', 						
								'ReadOcsDtcClearedStatus' => '58 08', 						
								'ReadOcsFaultCode' => '41 36', 						
								'ReadOcsMeasuredWeightOfPassenger' => '58 0A', 						
								'ReadOcsStatus' => '5B 25', 						
								'ReadSafeKeyNumber' => '01 0B', 						
								'ReadSerialNumberNode20' => 'F1 54', 						
								'ReadSerialNumberNode21' => 'F1 55', 						
								'ReadSerialNumberNode22' => 'F1 56', 						
								'ReadSerialNumberNode23' => 'F1 57', 						
								'ReadSerialNumberNode24' => 'F1 58', 						
								'ReadTVV' => 'F1 96', 						
								'ReadVIN' => 'F1 90', 						
								'ReadVdsCalibrationStatus' => 'D9 E9', 						
								'SideAirbagforRearseatDrv' => '5B 35', 						
								'SideAirbagforRearseatPsg' => '5B 41', 						
								'TRGInformation_1' => 'D9 04', 						
								'TRGInformation_2' => 'D9 14', 						
								'TRGInformation_3' => 'D9 24', 						
								'TTFInformation_1' => 'D9 06', 						
								'TTFInformation_2' => 'D9 16', 						
								'TTFInformation_3' => 'D9 26', 						
								'VIN_ForDisposal' => 'F1 90', 						
								'VehicleInfomation_1' => 'D9 03', 						
								'VehicleInfomation_2' => 'D9 13', 						
								'VehicleInfomation_3' => 'D9 23', 						
					},									
					'NEG_Responses' => {									
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 22 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_responseTooLong' => { 'Response' =>  '7F 22 14' , 'Mode' =>  'strict' , 'Desc' =>  'responseTooLong' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_busyRepeatRequest' => { 'Response' =>  '7F 22 21' , 'Mode' =>  'strict' , 'Desc' =>  'busyRepeatRequest' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_conditionsNotCorrect' => { 'Response' =>  '7F 22 22' , 'Mode' =>  'strict' , 'Desc' =>  'conditionsNotCorrect' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestOutOfRange' => { 'Response' =>  '7F 22 31' , 'Mode' =>  'strict' , 'Desc' =>  'requestOutOfRange' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_securityAccessDenied' => { 'Response' =>  '7F 22 33' , 'Mode' =>  'strict' , 'Desc' =>  'securityAccessDenied' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' =>  '7F 22 78' , 'Mode' =>  'strict' , 'Desc' =>  'requestCorrectlyReceived_ResponsePending' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_serviceNotSupportedInActiveSession' => { 'Response' =>  '7F 22 7F' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_vehicleSpeedTooHigh' => { 'Response' =>  '7F 22 88' , 'Mode' =>  'strict' , 'Desc' =>  'vehicleSpeedTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooHigh' => { 'Response' =>  '7F 22 92' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooLow' => { 'Response' =>  '7F 22 93' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooLow' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_NoResponse' => { 'Response' =>  '' , 'Mode' =>  'quiet' , 'Desc' =>  'NoResponse' , 'AddrModes' => [ 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
	'SecurityAccess' => {													
					'Service_ID' => '27',									
					'Supported_SubFuns' => {									
								'RequestSeed_31' => '31', 						
								'RequestSeed_33' => '33', 						
								'RequestSeed_Deployment' => '5F', 						
								'SendKey_31' => '32', 						
								'SendKey_33' => '34', 						
								'SendKey_Deployment' => '60', 						
					},									
					'NEG_Responses' => {									
								'NR_subFunctionNotSupported' => { 'Response' =>  '7F 27 12' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 27 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_busyRepeatRequest' => { 'Response' =>  '7F 27 21' , 'Mode' =>  'strict' , 'Desc' =>  'busyRepeatRequest' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_conditionsNotCorrect' => { 'Response' =>  '7F 27 22' , 'Mode' =>  'strict' , 'Desc' =>  'conditionsNotCorrect' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestSequenceError' => { 'Response' =>  '7F 27 24' , 'Mode' =>  'strict' , 'Desc' =>  'requestSequenceError' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestOutOfRange' => { 'Response' =>  '7F 27 31' , 'Mode' =>  'strict' , 'Desc' =>  'requestOutOfRange' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_invalidKey' => { 'Response' =>  '7F 27 35' , 'Mode' =>  'strict' , 'Desc' =>  'invalidKey' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_exceedNumberOfAttempts' => { 'Response' =>  '7F 27 36' , 'Mode' =>  'strict' , 'Desc' =>  'exceedNumberOfAttempts' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requiredTimeDelayNotExpired' => { 'Response' =>  '7F 27 37' , 'Mode' =>  'strict' , 'Desc' =>  'requiredTimeDelayNotExpired' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' =>  '7F 27 78' , 'Mode' =>  'strict' , 'Desc' =>  'requestCorrectlyReceived_ResponsePending' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_subFunctionNotSupportedInActiveSession' => { 'Response' =>  '7F 27 7E' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_serviceNotSupportedInActiveSession' => { 'Response' =>  '7F 27 7F' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_vehicleSpeedTooHigh' => { 'Response' =>  '7F 27 88' , 'Mode' =>  'strict' , 'Desc' =>  'vehicleSpeedTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooHigh' => { 'Response' =>  '7F 27 92' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooLow' => { 'Response' =>  '7F 27 93' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooLow' , 'AddrModes' => [ 'physical', 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
	'WriteDataByIdentifier' => {													
					'Service_ID' => '2E',									
					'Supported_SubFuns' => {									
								'DismantlerInfo' => 'FA 07', 						
								'EOLConfiguration' => 'DE 00', 						
								'TVV' => 'F1 96', 						
								'VIN' => 'F1 90', 						
					},									
					'NEG_Responses' => {									
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 2E 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_busyRepeatRequest' => { 'Response' =>  '7F 2E 21' , 'Mode' =>  'strict' , 'Desc' =>  'busyRepeatRequest' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_conditionsNotCorrect' => { 'Response' =>  '7F 2E 22' , 'Mode' =>  'strict' , 'Desc' =>  'conditionsNotCorrect' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestOutOfRange' => { 'Response' =>  '7F 2E 31' , 'Mode' =>  'strict' , 'Desc' =>  'requestOutOfRange' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_securityAccessDenied' => { 'Response' =>  '7F 2E 33' , 'Mode' =>  'strict' , 'Desc' =>  'securityAccessDenied' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_generalProgrammingFailure' => { 'Response' =>  '7F 2E 72' , 'Mode' =>  'strict' , 'Desc' =>  'generalProgrammingFailure' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' =>  '7F 2E 78' , 'Mode' =>  'strict' , 'Desc' =>  'requestCorrectlyReceived_ResponsePending' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_serviceNotSupportedInActiveSession' => { 'Response' =>  '7F 2E 7F' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_vehicleSpeedTooHigh' => { 'Response' =>  '7F 2E 88' , 'Mode' =>  'strict' , 'Desc' =>  'vehicleSpeedTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooHigh' => { 'Response' =>  '7F 2E 92' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooLow' => { 'Response' =>  '7F 2E 93' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooLow' , 'AddrModes' => [ 'physical', 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
	'IOControl' => {													
					'Service_ID' => '2F',									
					'Supported_SubFuns' => {									
								'ShortTermAdj_TriggerOcsCalProcessing' => '58 09', 						
								'ShortTermAdj_TriggerRestraintAirbagIndicator' => '5B 1C', 						
								'ShortTermAdj_TriggerRestraintSystemPADI' => '5B 1B', 						
								'ShortTermAdj_TriggerVdsCalProcessing' => 'D9 E9', 						
					},									
					'NEG_Responses' => {									
								'NR_serviceNotSupported' => { 'Response' =>  '7F 2F 11' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_subFunctionNotSupported' => { 'Response' =>  '7F 2F 12' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 2F 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_busyRepeatRequest' => { 'Response' =>  '7F 2F 21' , 'Mode' =>  'strict' , 'Desc' =>  'busyRepeatRequest' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_conditionsNotCorrect' => { 'Response' =>  '7F 2F 22' , 'Mode' =>  'strict' , 'Desc' =>  'conditionsNotCorrect' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestOutOfRange' => { 'Response' =>  '7F 2F 31' , 'Mode' =>  'strict' , 'Desc' =>  'requestOutOfRange' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_securityAccessDenied' => { 'Response' =>  '7F 2F 33' , 'Mode' =>  'strict' , 'Desc' =>  'securityAccessDenied' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' =>  '7F 2F 78' , 'Mode' =>  'strict' , 'Desc' =>  'requestCorrectlyReceived_ResponsePending' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_serviceNotSupportedInActiveSession' => { 'Response' =>  '7F 2F 7F' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_vehicleSpeedTooHigh' => { 'Response' =>  '7F 2F 88' , 'Mode' =>  'strict' , 'Desc' =>  'vehicleSpeedTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooHigh' => { 'Response' =>  '7F 2F 92' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooLow' => { 'Response' =>  '7F 2F 93' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooLow' , 'AddrModes' => [ 'physical', 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl' => {													
					'Service_ID' => '31',									
					'Supported_SubFuns' => {									
								'RequestRoutineResult_ReadOnDemandSelfTestResult' => '03 02 02',						
								'RequestRoutineResult_ReadOnDemandSelfTestResult_WithSuppression' => '83 02 02', 						
								'RequestRoutineResult_RequestVdsCalibrationStatus' => '03 02 11', 						
								'RequestRoutineResult_readmackeyupdateresultinfield' => '03 10 10', 						
								'RequestRoutineResults_DeployLoopRoutineID' => '03 E2 01', 						
								'RequestRoutineResults_ExecuteSPL' => '03 E2 00', 						
								'StartRoutine_DeployLoopRoutineID' => '01 E2 01', 						
								'StartRoutine_ExecuteSPL' => '01 E2 00', 						
								'StartRoutine_RunOnDemandSelfTest' => '01 02 02',						
								'StartRoutine_RunOnDemandSelfTest_WithSuppression' => '81 02 02',  						
								'StartRoutine_StartVdscalibration' => '01 02 11', 						
								'StartRoutine_startmackeyupdateinfield' => '01 10 10', 						
								'StartRoutine_startmackeyupdateinplant' => '01 10 0E', 						
								'StartRoutine_startmackeyverificationinplant' => '01 10 0F', 						
					},									
					'NEG_Responses' => {									
								'NR_subFunctionNotSupported' => { 'Response' =>  '7F 31 12' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 31 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_busyRepeatRequest' => { 'Response' =>  '7F 31 21' , 'Mode' =>  'strict' , 'Desc' =>  'busyRepeatRequest' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_conditionsNotCorrect' => { 'Response' =>  '7F 31 22' , 'Mode' =>  'strict' , 'Desc' =>  'conditionsNotCorrect' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestSequenceError' => { 'Response' =>  '7F 31 24' , 'Mode' =>  'strict' , 'Desc' =>  'requestSequenceError' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestOutOfRange' => { 'Response' =>  '7F 31 31' , 'Mode' =>  'strict' , 'Desc' =>  'requestOutOfRange' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_securityAccessDenied' => { 'Response' =>  '7F 31 33' , 'Mode' =>  'strict' , 'Desc' =>  'securityAccessDenied' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_generalProgrammingFailure' => { 'Response' =>  '7F 31 72' , 'Mode' =>  'strict' , 'Desc' =>  'generalProgrammingFailure' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' =>  '7F 31 78' , 'Mode' =>  'strict' , 'Desc' =>  'requestCorrectlyReceived_ResponsePending' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_subFunctionNotSupportedInActiveSession' => { 'Response' =>  '7F 31 7E' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_serviceNotSupportedInActiveSession' => { 'Response' =>  '7F 31 7F' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_vehicleSpeedTooHigh' => { 'Response' =>  '7F 31 88' , 'Mode' =>  'strict' , 'Desc' =>  'vehicleSpeedTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooHigh' => { 'Response' =>  '7F 31 92' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooLow' => { 'Response' =>  '7F 31 93' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooLow' , 'AddrModes' => [ 'physical', 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
	'TesterPresent' => {													
					'Service_ID' => '3E',									
					'Supported_SubFuns' => {									
								'zeroSubfunction'                 => '00', 						
								'zeroSubfunction_ForDisposal'     => '00',						
								'zeroSubfunction_WithSuppression' => '80', 						
					},									
					'NEG_Responses' => {									
								'NR_subFunctionNotSupported' => { 'Response' =>  '7F 3E 12' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 3E 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
	'ControlDTCSetting' => {													
					'Service_ID' => '85',									
					'Supported_SubFuns' => {									
								'Off' 				  => '02',		
								'Off_WithSuppression' => '82',  						
								'On' 				  => '01',		
								'On_WithSuppression'  => '81', 						
					},									
					'NEG_Responses' => {									
								'NR_serviceNotSupported' => { 'Response' =>  '7F 85 11' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_subFunctionNotSupported' => { 'Response' =>  '7F 85 12' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupported' , 'AddrModes' => [ 'physical' ]},						
								'NR_incorrectMessageLengthOrInvalidFormat' => { 'Response' =>  '7F 85 13' , 'Mode' =>  'strict' , 'Desc' =>  'incorrectMessageLengthOrInvalidFormat' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_busyRepeatRequest' => { 'Response' =>  '7F 85 21' , 'Mode' =>  'strict' , 'Desc' =>  'busyRepeatRequest' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_conditionsNotCorrect' => { 'Response' =>  '7F 85 22' , 'Mode' =>  'strict' , 'Desc' =>  'conditionsNotCorrect' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestOutOfRange' => { 'Response' =>  '7F 85 31' , 'Mode' =>  'strict' , 'Desc' =>  'requestOutOfRange' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_requestCorrectlyReceived_ResponsePending' => { 'Response' =>  '7F 85 78' , 'Mode' =>  'strict' , 'Desc' =>  'requestCorrectlyReceived_ResponsePending' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_subFunctionNotSupportedInActiveSession' => { 'Response' =>  '7F 85 7E' , 'Mode' =>  'strict' , 'Desc' =>  'subFunctionNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_serviceNotSupportedInActiveSession' => { 'Response' =>  '7F 85 7F' , 'Mode' =>  'strict' , 'Desc' =>  'serviceNotSupportedInActiveSession' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_vehicleSpeedTooHigh' => { 'Response' =>  '7F 85 88' , 'Mode' =>  'strict' , 'Desc' =>  'vehicleSpeedTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooHigh' => { 'Response' =>  '7F 85 92' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooHigh' , 'AddrModes' => [ 'physical', 'functional' ]},						
								'NR_voltageTooLow' => { 'Response' =>  '7F 85 93' , 'Mode' =>  'strict' , 'Desc' =>  'voltageTooLow' , 'AddrModes' => [ 'physical', 'functional' ]},						
					},									
	},													
#----------------------------------------------------------------------------------#														
														
},														
##### END OF DIAG_SERVICES Section #######														
														
														
######### Request Response Section ########														
														
'Requests_Responses' => {														
														
	'ClearDTCInformation_allGroupOfDTC' => {													
					'Requests' => {									
						'REQ_ClearDTCInformation_allGroupOfDTC' => {'Request' => '14 FF FF FF', },								
					},									
					'POS_Responses' => {									
						'PR_ClearDTCInformation_allGroupOfDTC' => {'DataLength' => '', 'Desc' => 'ClearDTCInformation_allGroupOfDTC', 'DoorsIDs' => ['SPS_ConfigTable262'], 'Mode' => 'relax', 'Response' => '54', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooLowCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ControlDTCSetting_Off' => {													
					'Requests' => {									
						'REQ_ControlDTCSetting_Off' => {'Request' => '85 02', },								
					},									
					'POS_Responses' => {									
						'PR_ControlDTCSetting_Off' => {'DataLength' => '', 'Desc' => 'ControlDTCSetting_Off', 'DoorsIDs' => ['SPS_ConfigTable245'], 'Mode' => 'relax', 'Response' => 'C5 02', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck'],									
					'allowed_in_sessions' => ['ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ControlDTCSetting_Off_WithSuppression' => {													
					'Requests' => {									
						'REQ_ControlDTCSetting_Off_WithSuppression' => {'Request' => '85 82', },								
					},									
					'POS_Responses' => {									
						'PR_ControlDTCSetting_Off_WithSuppression' => {'DataLength' => '', 'Desc' => 'ControlDTCSetting_Off_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable245'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck'],									
					'allowed_in_sessions' => ['ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ControlDTCSetting_On' => {													
					'Requests' => {									
						'REQ_ControlDTCSetting_On' => {'Request' => '85 01', },								
					},									
					'POS_Responses' => {									
						'PR_ControlDTCSetting_On' => {'DataLength' => '', 'Desc' => 'ControlDTCSetting_On', 'DoorsIDs' => ['SPS_ConfigTable244'], 'Mode' => 'relax', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck'],									
					'allowed_in_sessions' => ['ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ControlDTCSetting_On_WithSuppression' => {													
					'Requests' => {									
						'REQ_ControlDTCSetting_On_WithSuppression' => {'Request' => '85 81', },								
					},									
					'POS_Responses' => {									
						'PR_ControlDTCSetting_On_WithSuppression' => {'DataLength' => '', 'Desc' => 'ControlDTCSetting_On_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable244'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck'],									
					'allowed_in_sessions' => ['ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'DiagnosticSessionControl_DefaultSession' => {													
					'Requests' => {									
						'REQ_DiagnosticSessionControl_DefaultSession' => {'Request' => '10 01', },								
					},									
					'POS_Responses' => {									
						'PR_DiagnosticSessionControl_DefaultSession' => {'DataLength' => '', 'Desc' => 'DiagnosticSessionControl_DefaultSession', 'DoorsIDs' => ['SPS_ConfigTable218'], 'Mode' => 'relax', 'Response' => '50 01', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'DiagnosticSessionControl_DefaultSession_WithSuppression' => {													
					'Requests' => {									
						'REQ_DiagnosticSessionControl_DefaultSession_WithSuppression' => {'Request' => '10 81', },								
					},									
					'POS_Responses' => {									
						'PR_DiagnosticSessionControl_DefaultSession_WithSuppression' => {'DataLength' => '', 'Desc' => 'DiagnosticSessionControl_DefaultSession_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable218'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'DiagnosticSessionControl_DefaultSession_ForDisposal' => {													
					'Requests' => {									
						'REQ_DiagnosticSessionControl_DefaultSession_ForDisposal' => {'Request' => '10 01', },								
					},									
					'POS_Responses' => {									
						'PR_DiagnosticSessionControl_DefaultSession_ForDisposal' => {'DataLength' => '', 'Desc' => 'DiagnosticSessionControl_DefaultSession_ForDisposal', 'DoorsIDs' => ['SPS_ConfigTable124'], 'Mode' => 'relax', 'Response' => '50 01', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'DiagnosticSessionControl_ExtendedSession' => {													
					'Requests' => {									
						'REQ_DiagnosticSessionControl_ExtendedSession' => {'Request' => '10 03', },								
					},									
					'POS_Responses' => {									
						'PR_DiagnosticSessionControl_ExtendedSession' => {'DataLength' => '', 'Desc' => 'DiagnosticSessionControl_ExtendedSession', 'DoorsIDs' => ['SPS_ConfigTable219'], 'Mode' => 'relax', 'Response' => '50 03', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooHighCheck', 'VoltageTooLowCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'DiagnosticSessionControl_ExtendedSession_WithSuppression' => {													
					'Requests' => {									
						'REQ_DiagnosticSessionControl_ExtendedSession_WithSuppression' => {'Request' => '10 83', },								
					},									
					'POS_Responses' => {									
						'PR_DiagnosticSessionControl_ExtendedSession_WithSuppression' => {'DataLength' => '', 'Desc' => 'DiagnosticSessionControl_ExtendedSession_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable219'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooHighCheck', 'VoltageTooLowCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'DiagnosticSessionControl_ProgrammingSession' => {													
					'Requests' => {									
						'REQ_DiagnosticSessionControl_ProgrammingSession' => {'Request' => '10 02', },								
					},									
					'POS_Responses' => {									
						'PR_DiagnosticSessionControl_ProgrammingSession' => {'DataLength' => '', 'Desc' => 'DiagnosticSessionControl_ProgrammingSession', 'DoorsIDs' => ['SPS_ConfigTable239'], 'Mode' => 'relax', 'Response' => '50 02', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['InternalFaultConfirmedCheck', 'VoltageTooHighCheck', 'VoltageTooLowCheck', 'AnyLockedDeployStoredCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['Level1'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'DiagnosticSessionControl_ProgrammingSession_WithSuppression' => {													
					'Requests' => {									
						'REQ_DiagnosticSessionControl_ProgrammingSession_WithSuppression' => {'Request' => '10 82', },								
					},									
					'POS_Responses' => {									
						'PR_DiagnosticSessionControl_ProgrammingSession_WithSuppression' => {'DataLength' => '', 'Desc' => 'DiagnosticSessionControl_ProgrammingSession_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable239'], 'Mode' => 'relax', 'Response' => '50 02', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['InternalFaultConfirmedCheck', 'VoltageTooHighCheck', 'VoltageTooLowCheck', 'AnyLockedDeployStoredCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['Level1'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'DiagnosticSessionControl_SafetySession' => {													
					'Requests' => {									
						'REQ_DiagnosticSessionControl_SafetySession' => {'Request' => '10 04', },								
					},									
					'POS_Responses' => {									
						'PR_DiagnosticSessionControl_SafetySession' => {'DataLength' => '', 'Desc' => 'DiagnosticSessionControl_SafetySession', 'DoorsIDs' => ['SPS_ConfigTable125'], 'Mode' => 'relax', 'Response' => '50 04', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck', 'VoltageTooHighCheck', 'VoltageTooLowCheck', 'ProductionModeActiveCheck', 'CustVehSpDisposalCheck', 'CustSPRMIBDisposalCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ECUReset_HardReset' => {													
					'Requests' => {									
						'REQ_ECUReset_HardReset' => {'Request' => '11 01', },								
					},									
					'POS_Responses' => {									
						'PR_ECUReset_HardReset' => {'DataLength' => '', 'Desc' => 'ECUReset_HardReset', 'DoorsIDs' => ['SPS_ConfigTable243'], 'Mode' => 'relax', 'Response' => '51 01', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[ResetType_en,= rb_der_NormalHardReset_e ]',									
	},													
#----------------------------------------------------------------------------------#														
	'ECUReset_HardReset_WithSuppression' => {													
					'Requests' => {									
						'REQ_ECUReset_HardReset_WithSuppression' => {'Request' => '11 81', },								
					},									
					'POS_Responses' => {									
						'PR_ECUReset_HardReset_WithSuppression' => {'DataLength' => '', 'Desc' => 'ECUReset_HardReset_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable243'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[ResetType_en,= rb_der_NormalHardReset_e ]',									
	},													
#----------------------------------------------------------------------------------#														
	'ECUReset_HardReset_ForDisposal' => {													
					'Requests' => {									
						'REQ_ECUReset_HardReset_ForDisposal' => {'Request' => '11 01', },								
					},									
					'POS_Responses' => {									
						'PR_ECUReset_HardReset_ForDisposal' => {'DataLength' => '', 'Desc' => 'ECUReset_HardReset_ForDisposal', 'DoorsIDs' => ['SPS_ConfigTable129'], 'Mode' => 'relax', 'Response' => '51 01', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck'],									
					'allowed_in_sessions' => ['SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[ResetType_en,= rb_der_NormalHardReset_e Or,rb_der_NormalSoftReset_e Or ,rb_der_FastHardReset_e Or ,rb_der_FastSoftReset_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'IOControl_ShortTermAdj_TriggerOcsCalProcessing' => {													
					'Requests' => {									
						'REQ_IOControl_ShortTermAdj_TriggerOcsCalProcessing' => {'Request' => '2F 58 09 IOControlState', },								
					},									
					'POS_Responses' => {									
						'PR_IOControl_ShortTermAdj_TriggerOcsCalProcessing' => {'DataLength' => '', 'Desc' => 'IOControl_ShortTermAdj_TriggerOcsCalProcessing', 'DoorsIDs' => ['SPS_ConfigTable301'], 'Mode' => 'relax', 'Response' => '6F 58 09', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck', 'CustOCSBelowVoltageOperation'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'IOControl_ShortTermAdj_TriggerRestraintAirbagIndicator' => {													
					'Requests' => {									
						'REQ_IOControl_ShortTermAdj_TriggerRestraintAirbagIndicator' => {'Request' => '2F 5B 1C IOControlState', },								
					},									
					'POS_Responses' => {									
						'PR_IOControl_ShortTermAdj_TriggerRestraintAirbagIndicator' => {'DataLength' => '', 'Desc' => 'IOControl_ShortTermAdj_TriggerRestraintAirbagIndicator', 'DoorsIDs' => ['SPS_ConfigTable701'], 'Mode' => 'relax', 'Response' => '6F 5B 1C', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'IOControl_ShortTermAdj_TriggerRestraintSystemPADI' => {													
					'Requests' => {									
						'REQ_IOControl_ShortTermAdj_TriggerRestraintSystemPADI' => {'Request' => '2F 5B 1B IOControlState', },								
					},									
					'POS_Responses' => {									
						'PR_IOControl_ShortTermAdj_TriggerRestraintSystemPADI' => {'DataLength' => '', 'Desc' => 'IOControl_ShortTermAdj_TriggerRestraintSystemPADI', 'DoorsIDs' => ['SPS_ConfigTable700'], 'Mode' => 'relax', 'Response' => '6F 5B 1B', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'IOControl_ShortTermAdj_TriggerVdsCalProcessing' => {													
					'Requests' => {									
						'REQ_IOControl_ShortTermAdj_TriggerVdsCalProcessing' => {'Request' => '2F D9 E9 IOControlState', },								
					},									
					'POS_Responses' => {									
						'PR_IOControl_ShortTermAdj_TriggerVdsCalProcessing' => {'DataLength' => '', 'Desc' => 'IOControl_ShortTermAdj_TriggerVdsCalProcessing', 'DoorsIDs' => ['SPS_ConfigTable793'], 'Mode' => 'relax', 'Response' => '6F D9 E9', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation_ReportDTCByStatusMask' => {													
					'Requests' => {									
						'REQ_ReadDTCInformation_ReportDTCByStatusMask' => {'Request' => '19 02 StatusMask', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDTCInformation_ReportDTCByStatusMask' => {'DataLength' => '', 'Desc' => 'ReadDTCInformation_ReportDTCByStatusMask', 'DoorsIDs' => ['SPS_ConfigTable280'], 'Mode' => 'relax', 'Response' => '59 02', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation_ReportDTCByStatusMask_WithSuppression' => {													
					'Requests' => {									
						'REQ_ReadDTCInformation_ReportDTCByStatusMask_WithSuppression' => {'Request' => '19 82 StatusMask', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDTCInformation_ReportDTCByStatusMask_WithSuppression' => {'DataLength' => '', 'Desc' => 'ReadDTCInformation_ReportDTCByStatusMask_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable280'], 'Mode' => 'relax', 'Response' => '59 02', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation_ReportDTCExtDataRecordByDTCNumber' => {													
					'Requests' => {									
						'REQ_ReadDTCInformation_ReportDTCExtDataRecordByDTCNumber' => {'Request' => '19 06 DTC DTCExtendedDataRecordNumber', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDTCInformation_ReportDTCExtDataRecordByDTCNumber' => {'DataLength' => '', 'Desc' => 'ReadDTCInformation_ReportDTCExtDataRecordByDTCNumber', 'DoorsIDs' => ['SPS_ConfigTable283'], 'Mode' => 'relax', 'Response' => '59 06', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation_ReportDTCExtDataRecordByDTCNumber_WithSuppression' => {													
					'Requests' => {									
						'REQ_ReadDTCInformation_ReportDTCExtDataRecordByDTCNumber_WithSuppression' => {'Request' => '19 86 DTC DTCExtendedDataRecordNumber', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDTCInformation_ReportDTCExtDataRecordByDTCNumber_WithSuppression' => {'DataLength' => '', 'Desc' => 'ReadDTCInformation_ReportDTCExtDataRecordByDTCNumber_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable283'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation_ReportDTCSnapshotRecordByDTCNumber' => {													
					'Requests' => {									
						'REQ_ReadDTCInformation_ReportDTCSnapshotRecordByDTCNumber' => {'Request' => '19 04 DTC DTCSnapshotRecordNumber', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDTCInformation_ReportDTCSnapshotRecordByDTCNumber' => {'DataLength' => '', 'Desc' => 'ReadDTCInformation_ReportDTCSnapshotRecordByDTCNumber', 'DoorsIDs' => ['SPS_ConfigTable282'], 'Mode' => 'relax', 'Response' => '59 04', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation_ReportDTCSnapshotRecordByDTCNumber_WithSuppression' => {													
					'Requests' => {									
						'REQ_ReadDTCInformation_ReportDTCSnapshotRecordByDTCNumber_WithSuppression' => {'Request' => '19 84 DTC DTCSnapshotRecordNumber', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDTCInformation_ReportDTCSnapshotRecordByDTCNumber_WithSuppression' => {'DataLength' => '', 'Desc' => 'ReadDTCInformation_ReportDTCSnapshotRecordByDTCNumber_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable282'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation_ReportNumberOfDTCByStatusMask' => {													
					'Requests' => {									
						'REQ_ReadDTCInformation_ReportNumberOfDTCByStatusMask' => {'Request' => '19 01 StatusMask', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDTCInformation_ReportNumberOfDTCByStatusMask' => {'DataLength' => '', 'Desc' => 'ReadDTCInformation_ReportNumberOfDTCByStatusMask', 'DoorsIDs' => ['SPS_ConfigTable281'], 'Mode' => 'relax', 'Response' => '59 01', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation_ReportNumberOfDTCByStatusMask_WithSuppression' => {													
					'Requests' => {									
						'REQ_ReadDTCInformation_ReportNumberOfDTCByStatusMask_WithSuppression' => {'Request' => '19 81 StatusMask', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDTCInformation_ReportNumberOfDTCByStatusMask_WithSuppression' => {'DataLength' => '', 'Desc' => 'ReadDTCInformation_ReportNumberOfDTCByStatusMask_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable281'], 'Mode' => 'relax', 'Response' => '59 01', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation_ReportSupportedDTC' => {													
					'Requests' => {									
						'REQ_ReadDTCInformation_ReportSupportedDTC' => {'Request' => '19 0A', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDTCInformation_ReportSupportedDTC' => {'DataLength' => '', 'Desc' => 'ReadDTCInformation_ReportSupportedDTC', 'DoorsIDs' => ['SPS_ConfigTable284'], 'Mode' => 'relax', 'Response' => '59 0A', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDTCInformation_ReportSupportedDTC_WithSuppression' => {													
					'Requests' => {									
						'REQ_ReadDTCInformation_ReportSupportedDTC_WithSuppression' => {'Request' => '19 8A', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDTCInformation_ReportSupportedDTC_WithSuppression' => {'DataLength' => '', 'Desc' => 'ReadDTCInformation_ReportSupportedDTC_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable284'], 'Mode' => 'relax', 'Response' => '59 0A', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_AddressInformationOfPCU' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_AddressInformationOfPCU' => {'Request' => '22 FA 02', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_AddressInformationOfPCU' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_AddressInformationOfPCU', 'DoorsIDs' => ['SPS_ConfigTable136'], 'Mode' => 'relax', 'Response' => '62 FA 02', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_BootSoftwareIdentification' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_BootSoftwareIdentification' => {'Request' => '22 F1 80', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_BootSoftwareIdentification' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_BootSoftwareIdentification', 'DoorsIDs' => ['SPS_ConfigTable761'], 'Mode' => 'relax', 'Response' => '62 F1 80', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF180_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CrashOutput_1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CrashOutput_1' => {'Request' => '22 D9 07', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CrashOutput_1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CrashOutput_1', 'DoorsIDs' => ['SPS_ConfigTable804'], 'Mode' => 'relax', 'Response' => '62 D9 07', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CrashOutput_2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CrashOutput_2' => {'Request' => '22 D9 17', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CrashOutput_2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CrashOutput_2', 'DoorsIDs' => ['SPS_ConfigTable811'], 'Mode' => 'relax', 'Response' => '62 D9 17', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CrashOutput_3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CrashOutput_3' => {'Request' => '22 D9 27', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CrashOutput_3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CrashOutput_3', 'DoorsIDs' => ['SPS_ConfigTable818'], 'Mode' => 'relax', 'Response' => '62 D9 27', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustCentralCfgCRC16Status' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustCentralCfgCRC16Status' => {'Request' => '22 E2 0B', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustCentralCfgCRC16Status' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustCentralCfgCRC16Status', 'DoorsIDs' => ['SPS_ConfigTable762'], 'Mode' => 'relax', 'Response' => '62 E2 0B', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[rb_drdi_DIDE20B_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustMACSupportStatus' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustMACSupportStatus' => {'Request' => '22 E2 0C', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustMACSupportStatus' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustMACSupportStatus', 'DoorsIDs' => ['SPS_ConfigTable763'], 'Mode' => 'relax', 'Response' => '62 E2 0C', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[rb_drdi_DIDE20C_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadActiveSession' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadActiveSession' => {'Request' => '22 D1 00', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadActiveSession' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadActiveSession', 'DoorsIDs' => ['SPS_ConfigTable628'], 'Mode' => 'relax', 'Response' => '62 D1 00', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadActiveSession_ForDisposal' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadActiveSession_ForDisposal' => {'Request' => '22 D1 00', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadActiveSession_ForDisposal' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadActiveSession_ForDisposal', 'DoorsIDs' => ['SPS_ConfigTable750'], 'Mode' => 'relax', 'Response' => '62 D1 00', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadAirbagWarningLamp' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadAirbagWarningLamp' => {'Request' => '22 61 C6', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadAirbagWarningLamp' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadAirbagWarningLamp', 'DoorsIDs' => ['SPS_ConfigTable657'], 'Mode' => 'relax', 'Response' => '62 61 C6', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'RB_drdi_GetAWLExtStatus_cu16 ((uint16)0x02)',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDHSAirbagWarningLamp' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDHSAirbagWarningLamp' => {'Request' => '22 61 A4', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDHSAirbagWarningLamp' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDHSAirbagWarningLamp', 'DoorsIDs' => ['SPS_ConfigTable846'], 'Mode' => 'relax', 'Response' => '62 61 A4', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDiagTypeNr' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDiagTypeNr' => {'Request' => '22 DD 19', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDiagTypeNr' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDiagTypeNr', 'DoorsIDs' => ['SPS_ConfigTable693'], 'Mode' => 'relax', 'Response' => '62 DD 19', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDiagnosticSpecificationVersion' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDiagnosticSpecificationVersion' => {'Request' => '22 F1 63', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDiagnosticSpecificationVersion' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDiagnosticSpecificationVersion', 'DoorsIDs' => ['SPS_ConfigTable677'], 'Mode' => 'relax', 'Response' => '62 F1 63', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverFarSideAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverFarSideAB' => {'Request' => '22 5B 3A', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverFarSideAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverFarSideAB', 'DoorsIDs' => ['SPS_ConfigTable650'], 'Mode' => 'relax', 'Response' => '62 5B 3A', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_FS1FD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverFront1stAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverFront1stAB' => {'Request' => '22 5B 03', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverFront1stAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverFront1stAB', 'DoorsIDs' => ['SPS_ConfigTable635'], 'Mode' => 'relax', 'Response' => '62 5B 03', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_AB1FD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverFront2ndAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverFront2ndAB' => {'Request' => '22 5B 09', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverFront2ndAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverFront2ndAB', 'DoorsIDs' => ['SPS_ConfigTable641'], 'Mode' => 'relax', 'Response' => '62 5B 09', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_AB2FD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverFrontCurtainAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverFrontCurtainAB' => {'Request' => '22 5B 0B', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverFrontCurtainAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverFrontCurtainAB', 'DoorsIDs' => ['SPS_ConfigTable643'], 'Mode' => 'relax', 'Response' => '62 5B 0B', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_IC1FD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverFrontCurtainAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverFrontCurtainAB' => { 'Request' => '22 5B 0B', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverFrontCurtainAB' => { 'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverFrontCurtainAB', 'DoorsIDs' => ['SPS_ConfigTable643'], 'Mode' => 'relax', 'Response' => '62 5B 0B', },								
					},									
					'protocol'                            => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions'                 => [ 'DefaultSession', 'ExtendedSession' ],									
					'allowed_in_addressingmodes'          => [ 'physical', 'functional' ],									
					'allowed_in_securitylevels'           => ['None'],									
					'additional_parameter'                => '[Squib=rb_sycf_IC1FD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverFrontSeatPretensioner' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverFrontSeatPretensioner' => {'Request' => '22 5B 05', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverFrontSeatPretensioner' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverFrontSeatPretensioner', 'DoorsIDs' => ['SPS_ConfigTable637'], 'Mode' => 'relax', 'Response' => '62 5B 05', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_BT1FD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverFrontSideAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverFrontSideAB' => {'Request' => '22 5B 07', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverFrontSideAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverFrontSideAB', 'DoorsIDs' => ['SPS_ConfigTable639'], 'Mode' => 'relax', 'Response' => '62 5B 07', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_SA1FD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverKneeAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverKneeAB' => {'Request' => '22 5B 10', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverKneeAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverKneeAB', 'DoorsIDs' => ['SPS_ConfigTable646'], 'Mode' => 'relax', 'Response' => '62 5B 10', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_KA1FD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverRear2ndSeatPretensioner' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverRear2ndSeatPretensioner' => {'Request' => '22 5B 36', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverRear2ndSeatPretensioner' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverRear2ndSeatPretensioner', 'DoorsIDs' => ['SPS_ConfigTable648'], 'Mode' => 'relax', 'Response' => '62 5B 36', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_BT1RD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverSeatBeltSensorStatus' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverSeatBeltSensorStatus' => {'Request' => '22 5B 19', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverSeatBeltSensorStatus' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverSeatBeltSensorStatus', 'DoorsIDs' => ['SPS_ConfigTable630'], 'Mode' => 'relax', 'Response' => '62 5B 19', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Switch = rb_sycs_SwitchBLFD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadDriverSideSeatbeltLapPretensioner' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadDriverSideSeatbeltLapPretensioner' => {'Request' => '22 5B 0D', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadDriverSideSeatbeltLapPretensioner' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadDriverSideSeatbeltLapPretensioner', 'DoorsIDs' => ['SPS_ConfigTable842'], 'Mode' => 'relax', 'Response' => '62 5B 0D', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadECUAssemblyNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadECUAssemblyNumber' => {'Request' => '22 F1 12', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadECUAssemblyNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadECUAssemblyNumber', 'DoorsIDs' => ['SPS_ConfigTable663'], 'Mode' => 'relax', 'Response' => '62 F1 12', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadECUCoreAssemblyNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadECUCoreAssemblyNumber' => {'Request' => '22 F1 11', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadECUCoreAssemblyNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadECUCoreAssemblyNumber', 'DoorsIDs' => ['SPS_ConfigTable662'], 'Mode' => 'relax', 'Response' => '62 F1 11', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadECUDeliveryAssemblyNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadECUDeliveryAssemblyNumber' => {'Request' => '22 F1 13', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadECUDeliveryAssemblyNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadECUDeliveryAssemblyNumber', 'DoorsIDs' => ['SPS_ConfigTable664'], 'Mode' => 'relax', 'Response' => '62 F1 13', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadECUSerialNr' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadECUSerialNr' => {'Request' => '22 F1 8C', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadECUSerialNr' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadECUSerialNr', 'DoorsIDs' => ['SPS_ConfigTable679'], 'Mode' => 'relax', 'Response' => '62 F1 8C', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadEOLConfiguration' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadEOLConfiguration' => {'Request' => '22 DE 00', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadEOLConfiguration' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadEOLConfiguration', 'DoorsIDs' => ['SPS_ConfigTable305'], 'Mode' => 'relax', 'Response' => '62 DE 00', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['ProductionModeActiveCheck', 'CustRAMROMFailure'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadLeftDHSActuator' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadLeftDHSActuator' => {'Request' => '22 5B 39', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadLeftDHSActuator' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadLeftDHSActuator', 'DoorsIDs' => ['SPS_ConfigTable845'], 'Mode' => 'relax', 'Response' => '62 5B 39', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadLeftPedestrianAirbag' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadLeftPedestrianAirbag' => {'Request' => '22 58 47', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadLeftPedestrianAirbag' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadLeftPedestrianAirbag', 'DoorsIDs' => ['SPS_ConfigTable841'], 'Mode' => 'relax', 'Response' => '62 58 47', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadNoTroubleCode' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadNoTroubleCode' => {'Request' => '22 02 02', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadNoTroubleCode' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadNoTroubleCode', 'DoorsIDs' => ['SPS_ConfigTable736'], 'Mode' => 'relax', 'Response' => '62 02 02', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassenger2ndSeatPretensioner' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPassenger2ndSeatPretensioner' => {'Request' => '22 5B 37', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPassenger2ndSeatPretensioner' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassenger2ndSeatPretensioner', 'DoorsIDs' => ['SPS_ConfigTable649'], 'Mode' => 'relax', 'Response' => '62 5B 37', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_BT1RP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassengerFront1stAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPassengerFront1stAB' => {'Request' => '22 5B 04', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPassengerFront1stAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassengerFront1stAB', 'DoorsIDs' => ['SPS_ConfigTable636'], 'Mode' => 'relax', 'Response' => '62 5B 04', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_AB1FP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassengerFront2ndAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPassengerFront2ndAB' => {'Request' => '22 5B 0A', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPassengerFront2ndAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassengerFront2ndAB', 'DoorsIDs' => ['SPS_ConfigTable642'], 'Mode' => 'relax', 'Response' => '62 5B 0A', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_AB2FP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassengerFrontCenterAirbag' => {													
			'Requests' => {											
				'REQ_ReadDataByIdentifier_CustReadPassengerFrontCenterAirbag' => { 'Request' => '22 58 44', },										
			},											
			'POS_Responses' => {											
				'PR_ReadDataByIdentifier_CustReadPassengerFrontCenterAirbag' => { 'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassengerFrontCenterAirbag', 'DoorsIDs' => ['SPS_ConfigTable795'], 'Mode' => 'relax', 'Response' => '62 58 44', },										
			},											
			'protocol'                            => 'UDS',											
			'preconditions_prohibiting_execution' => ['None'],											
			'allowed_in_sessions'                 => [ 'DefaultSession', 'ExtendedSession' ],											
			'allowed_in_addressingmodes'          => [ 'physical', 'functional' ],											
			'allowed_in_securitylevels'           => ['None'],											
			'additional_parameter'                => '0x0000',											
		},												
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassengerFrontCurtainAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPassengerFrontCurtainAB' => {'Request' => '22 5B 0C', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPassengerFrontCurtainAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassengerFrontCurtainAB', 'DoorsIDs' => ['SPS_ConfigTable644'], 'Mode' => 'relax', 'Response' => '62 5B 0C', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_IC1FP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassengerFrontSeatPretensioner' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPassengerFrontSeatPretensioner' => {'Request' => '22 5B 06', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPassengerFrontSeatPretensioner' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassengerFrontSeatPretensioner', 'DoorsIDs' => ['SPS_ConfigTable638'], 'Mode' => 'relax', 'Response' => '62 5B 06', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_BT1FP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassengerFrontSideAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPassengerFrontSideAB' => {'Request' => '22 5B 08', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPassengerFrontSideAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassengerFrontSideAB', 'DoorsIDs' => ['SPS_ConfigTable640'], 'Mode' => 'relax', 'Response' => '62 5B 08', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_SA1FP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassengerKneeAB' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPassengerKneeAB' => {'Request' => '22 5B 3C', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPassengerKneeAB' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassengerKneeAB', 'DoorsIDs' => ['SPS_ConfigTable652'], 'Mode' => 'relax', 'Response' => '62 5B 3C', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_KA1FP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassengerSeatBeltSensorStatus' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPassengerSeatBeltSensorStatus' => {'Request' => '22 5B 1A', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPassengerSeatBeltSensorStatus' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassengerSeatBeltSensorStatus', 'DoorsIDs' => ['SPS_ConfigTable631'], 'Mode' => 'relax', 'Response' => '62 5B 1A', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Switch = rb_sycs_SwitchBLFP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassengerSeatMatSensorStatus' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPassengerSeatMatSensorStatus' => {'Request' => '22 41 19', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPassengerSeatMatSensorStatus' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassengerSeatMatSensorStatus', 'DoorsIDs' => ['SPS_ConfigTable629'], 'Mode' => 'relax', 'Response' => '62 41 19', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Switch = rb_sycs_SwitchOPSFP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPassengerSideSeatbeltLapPretensioner' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPassengerSideSeatbeltLapPretensioner' => {'Request' => '22 5B 0E', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPassengerSideSeatbeltLapPretensioner' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPassengerSideSeatbeltLapPretensioner', 'DoorsIDs' => ['SPS_ConfigTable843'], 'Mode' => 'relax', 'Response' => '62 5B 0E', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceAChamber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceAChamber' => {'Request' => '22 D9 6D', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceAChamber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceAChamber', 'DoorsIDs' => ['SPS_ConfigTable659'], 'Mode' => 'relax', 'Response' => '62 D9 6D', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Switch = rb_sycs_SwitchConnectorLockA_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceBChamber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceBChamber' => { 'Request' => '22 D9 6E', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceBChamber' => { 'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceBChamber', 'DoorsIDs' => ['SPS_ConfigTable660'], 'Mode' => 'relax', 'Response' => '62 D9 6E', },								
					},									
					'protocol'                            => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions'                 => [ 'DefaultSession', 'ExtendedSession' ],									
					'allowed_in_addressingmodes'          => [ 'physical', 'functional' ],									
					'allowed_in_securitylevels'           => ['None'],									
					'additional_parameter'                => '[Switch = rb_sycs_SwitchConnectorLockB_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceCchamber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceCchamber' => { 'Request' => '22 D9 6F', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceCchamber' => { 'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadPoorConnectionDetectorBarResistenceCchamber', 'DoorsIDs' => ['SPS_ConfigTable661'], 'Mode' => 'relax', 'Response' => '62 D9 6F', },								
					},									
					'protocol'                            => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions'                 => [ 'DefaultSession', 'ExtendedSession' ],									
					'allowed_in_addressingmodes'          => [ 'physical', 'functional' ],									
					'allowed_in_securitylevels'           => ['None'],									
					'additional_parameter'                => '[Switch = rb_sycs_SwitchConnectorLockC_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadRestraintSystemMalfunctionIndicator' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadRestraintSystemMalfunctionIndicator' => {'Request' => '22 5B 1C', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadRestraintSystemMalfunctionIndicator' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadRestraintSystemMalfunctionIndicator', 'DoorsIDs' => ['SPS_ConfigTable656'], 'Mode' => 'relax', 'Response' => '62 5B 1C', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'RB_drdi_GetAWLStatus_cu16 ((uint16)0x01)',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadRestraintSystemPassengerDisableIndicator' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadRestraintSystemPassengerDisableIndicator' => {'Request' => '22 5B 1B', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadRestraintSystemPassengerDisableIndicator' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadRestraintSystemPassengerDisableIndicator', 'DoorsIDs' => ['SPS_ConfigTable655'], 'Mode' => 'relax', 'Response' => '62 5B 1B', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'RB_drdi_GetPADIStatus_cu16 ((uint16)0x03)',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadRightDHSActuator' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadRightDHSActuator' => {'Request' => '22 5B 38', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadRightDHSActuator' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadRightDHSActuator', 'DoorsIDs' => ['SPS_ConfigTable844'], 'Mode' => 'relax', 'Response' => '62 5B 38', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadRightPedestrianAirbag' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadRightPedestrianAirbag' => {'Request' => '22 58 46', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadRightPedestrianAirbag' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadRightPedestrianAirbag', 'DoorsIDs' => ['SPS_ConfigTable839'], 'Mode' => 'relax', 'Response' => '62 58 46', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSeatTrackSensorStatus' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSeatTrackSensorStatus' => {'Request' => '22 5B 27', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSeatTrackSensorStatus' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSeatTrackSensorStatus', 'DoorsIDs' => ['SPS_ConfigTable632'], 'Mode' => 'relax', 'Response' => '62 5B 27', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Switch = rb_sycs_SwitchSPSFP_e/rb_sycs_SwitchSPSFD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNbrCzsDr' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNbrCzsDr' => {'Request' => '22 F1 41', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNbrCzsDr' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNbrCzsDr', 'DoorsIDs' => ['SPS_ConfigTable665'], 'Mode' => 'relax', 'Response' => '62 F1 41', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Sensor = rb_sycp_UfsD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrBPillerSisDr' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrBPillerSisDr' => {'Request' => '22 F1 42', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrBPillerSisDr' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrBPillerSisDr', 'DoorsIDs' => ['SPS_ConfigTable666'], 'Mode' => 'relax', 'Response' => '62 F1 42', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Sensor = b_sycp_PasFD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrBPillerSisPa' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrBPillerSisPa' => {'Request' => '22 F1 43', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrBPillerSisPa' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrBPillerSisPa', 'DoorsIDs' => ['SPS_ConfigTable667'], 'Mode' => 'relax', 'Response' => '62 F1 43', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Sensor = b_sycp_PasFP_e],',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrCPillerSisDr' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrCPillerSisDr' => {'Request' => '22 F1 44', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrCPillerSisDr' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrCPillerSisDr', 'DoorsIDs' => ['SPS_ConfigTable669'], 'Mode' => 'relax', 'Response' => '62 F1 44', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Sensor = b_sycp_PasMD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrCPillerSisPa' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrCPillerSisPa' => {'Request' => '22 F1 45', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrCPillerSisPa' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrCPillerSisPa', 'DoorsIDs' => ['SPS_ConfigTable670'], 'Mode' => 'relax', 'Response' => '62 F1 45', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Sensor = b_sycp_PasMP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrCzsBump' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrCzsBump' => {'Request' => '22 F1 50', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrCzsBump' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrCzsBump', 'DoorsIDs' => ['SPS_ConfigTable675'], 'Mode' => 'relax', 'Response' => '62 F1 50', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Sensor = rb_sycp_UfsC_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrCzsCenter' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrCzsCenter' => {'Request' => '22 F1 4F', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrCzsCenter' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrCzsCenter', 'DoorsIDs' => ['SPS_ConfigTable674'], 'Mode' => 'relax', 'Response' => '62 F1 4F', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Sensor = rb_sycp_UfsD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrCzsPa' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrCzsPa' => {'Request' => '22 F1 48', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrCzsPa' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrCzsPa', 'DoorsIDs' => ['SPS_ConfigTable673'], 'Mode' => 'relax', 'Response' => '62 F1 48', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Sensor = rb_sycp_UfsP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrDHS1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrDHS1' => {'Request' => '22 F1 49', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrDHS1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrDHS1', 'DoorsIDs' => ['SPS_ConfigTable833'], 'Mode' => 'relax', 'Response' => '62 F1 49', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDDHSx_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrDHS2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrDHS2' => {'Request' => '22 F1 4A', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrDHS2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrDHS2', 'DoorsIDs' => ['SPS_ConfigTable834'], 'Mode' => 'relax', 'Response' => '62 F1 4A', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDDHSx_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrDHS3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrDHS3' => {'Request' => '22 F1 4B', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrDHS3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrDHS3', 'DoorsIDs' => ['SPS_ConfigTable835'], 'Mode' => 'relax', 'Response' => '62 F1 4B', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDDHSx_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrDHS4' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrDHS4' => {'Request' => '22 F1 4C', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrDHS4' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrDHS4', 'DoorsIDs' => ['SPS_ConfigTable836'], 'Mode' => 'relax', 'Response' => '62 F1 4C', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDDHSx_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrDHS5' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrDHS5' => {'Request' => '22 F1 4D', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrDHS5' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrDHS5', 'DoorsIDs' => ['SPS_ConfigTable837'], 'Mode' => 'relax', 'Response' => '62 F1 4D', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDDHSx_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrDHS6' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrDHS6' => {'Request' => '22 F1 4E', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrDHS6' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrDHS6', 'DoorsIDs' => ['SPS_ConfigTable838'], 'Mode' => 'relax', 'Response' => '62 F1 4E', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDDHSx_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrPSisDr' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrPSisDr' => {'Request' => '22 F1 46', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrPSisDr' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrPSisDr', 'DoorsIDs' => ['SPS_ConfigTable671'], 'Mode' => 'relax', 'Response' => '62 F1 46', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Sensor = b_sycp_PPSFD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSerialNrPSisPa' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSerialNrPSisPa' => {'Request' => '22 F1 47', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSerialNrPSisPa' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSerialNrPSisPa', 'DoorsIDs' => ['SPS_ConfigTable672'], 'Mode' => 'relax', 'Response' => '62 F1 47', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Sensor = b_sycp_PPSFP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadSoftwareDownloadSpecificationVersion' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadSoftwareDownloadSpecificationVersion' => {'Request' => '22 F1 62', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadSoftwareDownloadSpecificationVersion' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadSoftwareDownloadSpecificationVersion', 'DoorsIDs' => ['SPS_ConfigTable676'], 'Mode' => 'relax', 'Response' => '62 F1 62', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadVBatVoltage' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadVBatVoltage' => {'Request' => '22 D1 11', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadVBatVoltage' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadVBatVoltage', 'DoorsIDs' => ['SPS_ConfigTable658'], 'Mode' => 'relax', 'Response' => '62 D1 11', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Voltage = VBat]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadVehManuSwNo' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadVehManuSwNo' => {'Request' => '22 F1 88', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadVehManuSwNo' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadVehManuSwNo', 'DoorsIDs' => ['SPS_ConfigTable691'], 'Mode' => 'relax', 'Response' => '62 F1 88', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_DeploymentLoopTable' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_DeploymentLoopTable' => {'Request' => '22 FA 06', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_DeploymentLoopTable' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_DeploymentLoopTable', 'DoorsIDs' => ['SPS_ConfigTable137'], 'Mode' => 'relax', 'Response' => '62 FA 06', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['---'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_DeploymentMethodVersion' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_DeploymentMethodVersion' => {'Request' => '22 FA 01', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_DeploymentMethodVersion' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_DeploymentMethodVersion', 'DoorsIDs' => ['SPS_ConfigTable135'], 'Mode' => 'relax', 'Response' => '62 FA 01', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_DismantlerInfo' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_DismantlerInfo' => {'Request' => '22 FA 07', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_DismantlerInfo' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_DismantlerInfo', 'DoorsIDs' => ['SPS_ConfigTable138'], 'Mode' => 'relax', 'Response' => '62 FA 07', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ECUCalibrationData1Number' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ECUCalibrationData1Number' => {'Request' => '22 F1 24', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ECUCalibrationData1Number' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ECUCalibrationData1Number', 'DoorsIDs' => ['SPS_ConfigTable746'], 'Mode' => 'relax', 'Response' => '62 F1 24', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF12x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ECUSoftware2PartNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ECUSoftware2PartNumber' => {'Request' => '22 F1 20', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ECUSoftware2PartNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ECUSoftware2PartNumber', 'DoorsIDs' => ['SPS_ConfigTable749'], 'Mode' => 'relax', 'Response' => '62 F1 20', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF12x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ECUSoftware3PartNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ECUSoftware3PartNumber' => {'Request' => '22 F1 21', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ECUSoftware3PartNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ECUSoftware3PartNumber', 'DoorsIDs' => ['SPS_ConfigTable748'], 'Mode' => 'relax', 'Response' => '62 F1 21', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF12x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ECUSoftware4PartNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ECUSoftware4PartNumber' => {'Request' => '22 F1 22', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ECUSoftware4PartNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ECUSoftware4PartNumber', 'DoorsIDs' => ['SPS_ConfigTable747'], 'Mode' => 'relax', 'Response' => '62 F1 22', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF12x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_EDREntry01' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_EDREntry01' => {'Request' => '22 FA 13', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_EDREntry01' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_EDREntry01', 'DoorsIDs' => ['SPS_ConfigTable166'], 'Mode' => 'relax', 'Response' => '62 FA 13', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'none',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_EDREntry02' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_EDREntry02' => {'Request' => '22 FA 14', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_EDREntry02' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_EDREntry02', 'DoorsIDs' => ['SPS_ConfigTable167'], 'Mode' => 'relax', 'Response' => '62 FA 14', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'none',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_EDREntry03' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_EDREntry03' => {'Request' => '22 FA 15', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_EDREntry03' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_EDREntry03', 'DoorsIDs' => ['SPS_ConfigTable168'], 'Mode' => 'relax', 'Response' => '62 FA 15', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'none',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_CustReadApSwFingerprint' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_CustReadApSwFingerprint' => { 'Request' => '22 F1 84', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_CustReadApSwFingerprint' => { 'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_CustReadApSwFingerprint', 'DoorsIDs' => ['SPS_ConfigTable761'], 'Mode' => 'relax', 'Response' => '62 F1 84', },								
					},									
					'protocol'                            => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions'                 => [ 'DefaultSession', 'ExtendedSession', 'ProgrammingSession' ],									
					'allowed_in_addressingmodes' => [ 'physical', 'functional' ],									
					'allowed_in_securitylevels'  => ['None'],									
					'additional_parameter'       => 'rb_drdi_DIDF180_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_EDRROM' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_EDRROM' => {'Request' => '22 D9 00', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_EDRROM' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_EDRROM', 'DoorsIDs' => ['SPS_ConfigTable819'], 'Mode' => 'relax', 'Response' => '62 D9 00', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_MazdaEDRDataPart1_1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_MazdaEDRDataPart1_1' => {'Request' => '22 D9 F0', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_MazdaEDRDataPart1_1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_MazdaEDRDataPart1_1', 'DoorsIDs' => ['SPS_ConfigTable620'], 'Mode' => 'relax', 'Response' => '62 D9 F0', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_MazdaEDRDataPart1_2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_MazdaEDRDataPart1_2' => {'Request' => '22 D9 F3', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_MazdaEDRDataPart1_2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_MazdaEDRDataPart1_2', 'DoorsIDs' => ['SPS_ConfigTable694'], 'Mode' => 'relax', 'Response' => '62 D9 F3', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_MazdaEDRDataPart1_3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_MazdaEDRDataPart1_3' => {'Request' => '22 D9 F6', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_MazdaEDRDataPart1_3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_MazdaEDRDataPart1_3', 'DoorsIDs' => ['SPS_ConfigTable697'], 'Mode' => 'relax', 'Response' => '62 D9 F6', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_MazdaEDRDataPart2_1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_MazdaEDRDataPart2_1' => {'Request' => '22 D9 F1', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_MazdaEDRDataPart2_1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_MazdaEDRDataPart2_1', 'DoorsIDs' => ['SPS_ConfigTable621'], 'Mode' => 'relax', 'Response' => '62 D9 F1', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_MazdaEDRDataPart2_2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_MazdaEDRDataPart2_2' => {'Request' => '22 D9 F4', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_MazdaEDRDataPart2_2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_MazdaEDRDataPart2_2', 'DoorsIDs' => ['SPS_ConfigTable695'], 'Mode' => 'relax', 'Response' => '62 D9 F4', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_MazdaEDRDataPart2_3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_MazdaEDRDataPart2_3' => {'Request' => '22 D9 F7', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_MazdaEDRDataPart2_3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_MazdaEDRDataPart2_3', 'DoorsIDs' => ['SPS_ConfigTable698'], 'Mode' => 'relax', 'Response' => '62 D9 F7', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_MazdaEDRDataPart3_1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_MazdaEDRDataPart3_1' => {'Request' => '22 D9 F2', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_MazdaEDRDataPart3_1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_MazdaEDRDataPart3_1', 'DoorsIDs' => ['SPS_ConfigTable622'], 'Mode' => 'relax', 'Response' => '62 D9 F2', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_MazdaEDRDataPart3_2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_MazdaEDRDataPart3_2' => {'Request' => '22 D9 F5', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_MazdaEDRDataPart3_2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_MazdaEDRDataPart3_2', 'DoorsIDs' => ['SPS_ConfigTable696'], 'Mode' => 'relax', 'Response' => '62 D9 F5', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_MazdaEDRDataPart3_3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_MazdaEDRDataPart3_3' => {'Request' => '22 D9 F8', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_MazdaEDRDataPart3_3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_MazdaEDRDataPart3_3', 'DoorsIDs' => ['SPS_ConfigTable699'], 'Mode' => 'relax', 'Response' => '62 D9 F8', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NOSCANCommunicationLayerVersionNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NOSCANCommunicationLayerVersionNumber' => {'Request' => '22 F1 61', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NOSCANCommunicationLayerVersionNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NOSCANCommunicationLayerVersionNumber', 'DoorsIDs' => ['SPS_ConfigTable759'], 'Mode' => 'relax', 'Response' => '62 F1 61', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF15x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NOSCANDriverVersionNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NOSCANDriverVersionNumber' => {'Request' => '22 F1 59', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NOSCANDriverVersionNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NOSCANDriverVersionNumber', 'DoorsIDs' => ['SPS_ConfigTable751'], 'Mode' => 'relax', 'Response' => '62 F1 59', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF15x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NOSDiagnosticVersionNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NOSDiagnosticVersionNumber' => {'Request' => '22 F1 60', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NOSDiagnosticVersionNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NOSDiagnosticVersionNumber', 'DoorsIDs' => ['SPS_ConfigTable758'], 'Mode' => 'relax', 'Response' => '62 F1 60', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF15x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NOSGenerationToolVersionNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NOSGenerationToolVersionNumber' => {'Request' => '22 F1 5F', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NOSGenerationToolVersionNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NOSGenerationToolVersionNumber', 'DoorsIDs' => ['SPS_ConfigTable752'], 'Mode' => 'relax', 'Response' => '62 F1 5F', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF15F_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NOSInteractionLayerVersionNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NOSInteractionLayerVersionNumber' => {'Request' => '22 F1 5C', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NOSInteractionLayerVersionNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NOSInteractionLayerVersionNumber', 'DoorsIDs' => ['SPS_ConfigTable755'], 'Mode' => 'relax', 'Response' => '62 F1 5C', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF15x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NOSMessageDatabase1VersionNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NOSMessageDatabase1VersionNumber' => {'Request' => '22 F1 66', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NOSMessageDatabase1VersionNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NOSMessageDatabase1VersionNumber', 'DoorsIDs' => ['SPS_ConfigTable760'], 'Mode' => 'relax', 'Response' => '62 F1 66', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF15x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NOSNetworkInitializationVersionNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NOSNetworkInitializationVersionNumber' => {'Request' => '22 F1 5D', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NOSNetworkInitializationVersionNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NOSNetworkInitializationVersionNumber', 'DoorsIDs' => ['SPS_ConfigTable754'], 'Mode' => 'relax', 'Response' => '62 F1 5D', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF15x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NOSNetworkManagementJunior' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NOSNetworkManagementJunior' => {'Request' => '22 F1 5B', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NOSNetworkManagementJunior' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NOSNetworkManagementJunior', 'DoorsIDs' => ['SPS_ConfigTable756'], 'Mode' => 'relax', 'Response' => '62 F1 5B', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF15x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NOSOSEKNetworkManagementVersionNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NOSOSEKNetworkManagementVersionNumber' => {'Request' => '22 F1 5A', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NOSOSEKNetworkManagementVersionNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NOSOSEKNetworkManagementVersionNumber', 'DoorsIDs' => ['SPS_ConfigTable757'], 'Mode' => 'relax', 'Response' => '62 F1 5A', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF15x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NOSTransportLayerVersionNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NOSTransportLayerVersionNumber' => {'Request' => '22 F1 5E', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NOSTransportLayerVersionNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NOSTransportLayerVersionNumber', 'DoorsIDs' => ['SPS_ConfigTable753'], 'Mode' => 'relax', 'Response' => '62 F1 5E', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'rb_drdi_DIDF15x_e',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_NumberOfPCU' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_NumberOfPCU' => {'Request' => '22 FA 00', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_NumberOfPCU' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_NumberOfPCU', 'DoorsIDs' => ['SPS_ConfigTable134'], 'Mode' => 'relax', 'Response' => '62 FA 00', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_PostCrash_1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_PostCrash_1' => {'Request' => '22 D9 05', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_PostCrash_1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_PostCrash_1', 'DoorsIDs' => ['SPS_ConfigTable802'], 'Mode' => 'relax', 'Response' => '62 D9 05', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_PostCrash_2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_PostCrash_2' => {'Request' => '22 D9 15', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_PostCrash_2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_PostCrash_2', 'DoorsIDs' => ['SPS_ConfigTable809'], 'Mode' => 'relax', 'Response' => '62 D9 15', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_PostCrash_3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_PostCrash_3' => {'Request' => '22 D9 25', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_PostCrash_3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_PostCrash_3', 'DoorsIDs' => ['SPS_ConfigTable816'], 'Mode' => 'relax', 'Response' => '62 D9 25', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_PreCrashADAS_1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_PreCrashADAS_1' => {'Request' => '22 D9 02', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_PreCrashADAS_1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_PreCrashADAS_1', 'DoorsIDs' => ['SPS_ConfigTable799'], 'Mode' => 'relax', 'Response' => '62 D9 02', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_PreCrashADAS_2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_PreCrashADAS_2' => {'Request' => '22 D9 12', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_PreCrashADAS_2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_PreCrashADAS_2', 'DoorsIDs' => ['SPS_ConfigTable806'], 'Mode' => 'relax', 'Response' => '62 D9 12', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_PreCrashADAS_3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_PreCrashADAS_3' => {'Request' => '22 D9 22', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_PreCrashADAS_3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_PreCrashADAS_3', 'DoorsIDs' => ['SPS_ConfigTable813'], 'Mode' => 'relax', 'Response' => '62 D9 22', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_PreCrash_1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_PreCrash_1' => {'Request' => '22 D9 01', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_PreCrash_1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_PreCrash_1', 'DoorsIDs' => ['SPS_ConfigTable798'], 'Mode' => 'relax', 'Response' => '62 D9 01', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_PreCrash_2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_PreCrash_2' => {'Request' => '22 D9 11', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_PreCrash_2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_PreCrash_2', 'DoorsIDs' => ['SPS_ConfigTable805'], 'Mode' => 'relax', 'Response' => '62 D9 11', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_PreCrash_3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_PreCrash_3' => {'Request' => '22 D9 21', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_PreCrash_3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_PreCrash_3', 'DoorsIDs' => ['SPS_ConfigTable812'], 'Mode' => 'relax', 'Response' => '62 D9 21', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadOcsCALCheckCauseOfFault' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadOcsCALCheckCauseOfFault' => {'Request' => '22 D9 6C', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadOcsCALCheckCauseOfFault' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadOcsCALCheckCauseOfFault', 'DoorsIDs' => ['SPS_ConfigTable293'], 'Mode' => 'relax', 'Response' => '62 D9 6C', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadOcsCalibrationStatus' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadOcsCalibrationStatus' => {'Request' => '22 58 09', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadOcsCalibrationStatus' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadOcsCalibrationStatus', 'DoorsIDs' => ['SPS_ConfigTable288'], 'Mode' => 'relax', 'Response' => '62 58 09', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadOcsDtcClearedStatus' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadOcsDtcClearedStatus' => {'Request' => '22 58 08', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadOcsDtcClearedStatus' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadOcsDtcClearedStatus', 'DoorsIDs' => ['SPS_ConfigTable287'], 'Mode' => 'relax', 'Response' => '62 58 08', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadOcsFaultCode' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadOcsFaultCode' => {'Request' => '22 41 36', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadOcsFaultCode' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadOcsFaultCode', 'DoorsIDs' => ['SPS_ConfigTable692'], 'Mode' => 'relax', 'Response' => '62 41 36', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadOcsMeasuredWeightOfPassenger' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadOcsMeasuredWeightOfPassenger' => {'Request' => '22 58 0A', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadOcsMeasuredWeightOfPassenger' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadOcsMeasuredWeightOfPassenger', 'DoorsIDs' => ['SPS_ConfigTable300'], 'Mode' => 'relax', 'Response' => '62 58 0A', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadOcsStatus' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadOcsStatus' => {'Request' => '22 5B 25', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadOcsStatus' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadOcsStatus', 'DoorsIDs' => ['SPS_ConfigTable290'], 'Mode' => 'relax', 'Response' => '62 5B 25', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadSafeKeyNumber' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadSafeKeyNumber' => {'Request' => '22 01 0B', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadSafeKeyNumber' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadSafeKeyNumber', 'DoorsIDs' => ['SPS_ConfigTable791'], 'Mode' => 'relax', 'Response' => '62 01 0B', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['CustSecOCCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[rb_drdi_DID010B_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadSerialNumberNode20' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadSerialNumberNode20' => {'Request' => '22 F1 54', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadSerialNumberNode20' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadSerialNumberNode20', 'DoorsIDs' => ['SPS_ConfigTable294'], 'Mode' => 'relax', 'Response' => '62 F1 54', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadSerialNumberNode21' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadSerialNumberNode21' => {'Request' => '22 F1 55', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadSerialNumberNode21' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadSerialNumberNode21', 'DoorsIDs' => ['SPS_ConfigTable295'], 'Mode' => 'relax', 'Response' => '62 F1 55', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadSerialNumberNode22' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadSerialNumberNode22' => {'Request' => '22 F1 56', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadSerialNumberNode22' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadSerialNumberNode22', 'DoorsIDs' => ['SPS_ConfigTable296'], 'Mode' => 'relax', 'Response' => '62 F1 56', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadSerialNumberNode23' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadSerialNumberNode23' => {'Request' => '22 F1 57', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadSerialNumberNode23' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadSerialNumberNode23', 'DoorsIDs' => ['SPS_ConfigTable297'], 'Mode' => 'relax', 'Response' => '62 F1 57', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadSerialNumberNode24' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadSerialNumberNode24' => {'Request' => '22 F1 58', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadSerialNumberNode24' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadSerialNumberNode24', 'DoorsIDs' => ['SPS_ConfigTable298'], 'Mode' => 'relax', 'Response' => '62 F1 58', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadTVV' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadTVV' => {'Request' => '22 F1 96', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadTVV' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadTVV', 'DoorsIDs' => ['SPS_ConfigTable796'], 'Mode' => 'relax', 'Response' => '62 F1 96', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['CustRAMROMFailure'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[TVV]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadVIN' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadVIN' => {'Request' => '22 F1 90', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadVIN' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadVIN', 'DoorsIDs' => ['SPS_ConfigTable260'], 'Mode' => 'relax', 'Response' => '62 F1 90', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['CustRAMROMFailure'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[VIN]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_ReadVdsCalibrationStatus' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_ReadVdsCalibrationStatus' => {'Request' => '22 D9 E9', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_ReadVdsCalibrationStatus' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_ReadVdsCalibrationStatus', 'DoorsIDs' => ['SPS_ConfigTable792'], 'Mode' => 'relax', 'Response' => '62 D9 E9', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_SideAirbagforRearseatDrv' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_SideAirbagforRearseatDrv' => {'Request' => '22 5B 35', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_SideAirbagforRearseatDrv' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_SideAirbagforRearseatDrv', 'DoorsIDs' => ['SPS_ConfigTable733'], 'Mode' => 'relax', 'Response' => '62 5B 35', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_SA1RD_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_SideAirbagforRearseatPsg' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_SideAirbagforRearseatPsg' => {'Request' => '22 5B 41', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_SideAirbagforRearseatPsg' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_SideAirbagforRearseatPsg', 'DoorsIDs' => ['SPS_ConfigTable734'], 'Mode' => 'relax', 'Response' => '62 5B 41', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['None'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '[Squib=rb_sycf_SA1RP_e]',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_TRGInformation_1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_TRGInformation_1' => {'Request' => '22 D9 04', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_TRGInformation_1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_TRGInformation_1', 'DoorsIDs' => ['SPS_ConfigTable801'], 'Mode' => 'relax', 'Response' => '62 D9 04', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_TRGInformation_2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_TRGInformation_2' => {'Request' => '22 D9 14', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_TRGInformation_2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_TRGInformation_2', 'DoorsIDs' => ['SPS_ConfigTable808'], 'Mode' => 'relax', 'Response' => '62 D9 14', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_TRGInformation_3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_TRGInformation_3' => {'Request' => '22 D9 24', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_TRGInformation_3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_TRGInformation_3', 'DoorsIDs' => ['SPS_ConfigTable815'], 'Mode' => 'relax', 'Response' => '62 D9 24', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_TTFInformation_1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_TTFInformation_1' => {'Request' => '22 D9 06', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_TTFInformation_1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_TTFInformation_1', 'DoorsIDs' => ['SPS_ConfigTable803'], 'Mode' => 'relax', 'Response' => '62 D9 06', },								
					},									
					'protocol' => 'UDS', 									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_TTFInformation_2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_TTFInformation_2' => {'Request' => '22 D9 16', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_TTFInformation_2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_TTFInformation_2', 'DoorsIDs' => ['SPS_ConfigTable810'], 'Mode' => 'relax', 'Response' => '62 D9 16', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_TTFInformation_3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_TTFInformation_3' => {'Request' => '22 D9 26', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_TTFInformation_3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_TTFInformation_3', 'DoorsIDs' => ['SPS_ConfigTable817'], 'Mode' => 'relax', 'Response' => '62 D9 26', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_VIN_ForDisposal' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_VIN_ForDisposal' => {'Request' => '22 F1 90', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_VIN_ForDisposal' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_VIN_ForDisposal', 'DoorsIDs' => ['SPS_ConfigTable133'], 'Mode' => 'relax', 'Response' => '62 F1 90', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['---'],									
					'allowed_in_sessions' => ['SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_VehicleInfomation_1' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_VehicleInfomation_1' => {'Request' => '22 D9 03', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_VehicleInfomation_1' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_VehicleInfomation_1', 'DoorsIDs' => ['SPS_ConfigTable800'], 'Mode' => 'relax', 'Response' => '62 D9 03', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_VehicleInfomation_2' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_VehicleInfomation_2' => {'Request' => '22 D9 13', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_VehicleInfomation_2' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_VehicleInfomation_2', 'DoorsIDs' => ['SPS_ConfigTable807'], 'Mode' => 'relax', 'Response' => '62 D9 13', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'ReadDataByIdentifier_VehicleInfomation_3' => {													
					'Requests' => {									
						'REQ_ReadDataByIdentifier_VehicleInfomation_3' => {'Request' => '22 D9 23', },								
					},									
					'POS_Responses' => {									
						'PR_ReadDataByIdentifier_VehicleInfomation_3' => {'DataLength' => '', 'Desc' => 'ReadDataByIdentifier_VehicleInfomation_3', 'DoorsIDs' => ['SPS_ConfigTable814'], 'Mode' => 'relax', 'Response' => '62 D9 23', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['AlgoIsActiveOrCrashStorageInProgressCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', '---'],									
					'allowed_in_addressingmodes' => ['physical', 'functional', '---'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'NULL',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_RequestRoutineResult_ReadOnDemandSelfTestResult' => {													
					'Requests' => {									
						'REQ_RoutineControl_RequestRoutineResult_ReadOnDemandSelfTestResult' => {'Request' => '31 03 02 02', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_RequestRoutineResult_ReadOnDemandSelfTestResult' => {'DataLength' => '', 'Desc' => 'RoutineControl_RequestRoutineResult_ReadOnDemandSelfTestResult', 'DoorsIDs' => ['SPS_ConfigTable303'], 'Mode' => 'relax', 'Response' => '71 03 02 02', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck', 'CustOCSBelowVoltageOperation'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_RequestRoutineResult_ReadOnDemandSelfTestResult_WithSuppression' => {													
					'Requests' => {									
						'REQ_RoutineControl_RequestRoutineResult_ReadOnDemandSelfTestResult_WithSuppression' => {'Request' => '31 83 02 02', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_RequestRoutineResult_ReadOnDemandSelfTestResult_WithSuppression' => {'DataLength' => '', 'Desc' => 'RoutineControl_RequestRoutineResult_ReadOnDemandSelfTestResult_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable303'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck', 'CustOCSBelowVoltageOperation'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_RequestRoutineResult_RequestVdsCalibrationStatus' => {													
					'Requests' => {									
						'REQ_RoutineControl_RequestRoutineResult_RequestVdsCalibrationStatus' => {'Request' => '31 03 02 11', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_RequestRoutineResult_RequestVdsCalibrationStatus' => {'DataLength' => '', 'Desc' => 'RoutineControl_RequestRoutineResult_RequestVdsCalibrationStatus', 'DoorsIDs' => ['SPS_ConfigTable784'], 'Mode' => 'relax', 'Response' => '71 03 02 11', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['---'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_RequestRoutineResult_readmackeyupdateresultinfield' => {													
					'Requests' => {									
						'REQ_RoutineControl_RequestRoutineResult_readmackeyupdateresultinfield' => {'Request' => '31 03 10 10', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_RequestRoutineResult_readmackeyupdateresultinfield' => {'DataLength' => '', 'Desc' => 'RoutineControl_RequestRoutineResult_readmackeyupdateresultinfield', 'DoorsIDs' => ['SPS_ConfigTable790'], 'Mode' => 'relax', 'Response' => '71 03 10 10', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooHighCheck', 'VoltageTooLowCheck', 'InitTestNotCompletedCheck', 'CustFailureCounterCheck '],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_RequestRoutineResults_DeployLoopRoutineID' => {													
					'Requests' => {									
						'REQ_RoutineControl_RequestRoutineResults_DeployLoopRoutineID' => {'Request' => '31 03 E2 01', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_RequestRoutineResults_DeployLoopRoutineID' => {'DataLength' => '', 'Desc' => 'RoutineControl_RequestRoutineResults_DeployLoopRoutineID', 'DoorsIDs' => ['SPS_ConfigTable154'], 'Mode' => 'relax', 'Response' => '71 03 E2 01', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['---'],									
					'allowed_in_sessions' => ['SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['Level30'],									
					'additional_parameter' => '[ControlOptionLength = 1],[ControlOptionValidation = rb_dmim_E201RecordValidation],[InfoAndStatusLength  = 3]',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_RequestRoutineResults_ExecuteSPL' => {													
					'Requests' => {									
						'REQ_RoutineControl_RequestRoutineResults_ExecuteSPL' => {'Request' => '31 03 E2 00', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_RequestRoutineResults_ExecuteSPL' => {'DataLength' => '', 'Desc' => 'RoutineControl_RequestRoutineResults_ExecuteSPL', 'DoorsIDs' => ['SPS_ConfigTable153'], 'Mode' => 'relax', 'Response' => '71 03 E2 00', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['---'],									
					'allowed_in_sessions' => ['SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['Level30'],									
					'additional_parameter' => '[ControlOptionLength = 0],[ControlOptionValidation = rb_dmim_E200RecordValidation],[InfoAndStatusLength  = 2]',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_StartRoutine_DeployLoopRoutineID' => {													
					'Requests' => {									
						'REQ_RoutineControl_StartRoutine_DeployLoopRoutineID' => {'Request' => '31 01 E2 01 ', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_StartRoutine_DeployLoopRoutineID' => {'DataLength' => '', 'Desc' => 'RoutineControl_StartRoutine_DeployLoopRoutineID', 'DoorsIDs' => ['SPS_ConfigTable152'], 'Mode' => 'relax', 'Response' => '71 01 E2 01', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['---'],									
					'allowed_in_sessions' => ['SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['Level30'],									
					'additional_parameter' => '[ControlOptionLength = 1],[ControlOptionValidation = rb_dmim_E201RecordValidation],[InfoAndStatusLength  = 3]',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_StartRoutine_ExecuteSPL' => {													
					'Requests' => {									
						'REQ_RoutineControl_StartRoutine_ExecuteSPL' => {'Request' => '31 01 E2 00 ', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_StartRoutine_ExecuteSPL' => {'DataLength' => '', 'Desc' => 'RoutineControl_StartRoutine_ExecuteSPL', 'DoorsIDs' => ['SPS_ConfigTable151'], 'Mode' => 'relax', 'Response' => '71 01 E2 00', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['---'],									
					'allowed_in_sessions' => ['SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['Level30'],									
					'additional_parameter' => '[ControlOptionLength = 1],[ControlOptionValidation = rb_dmim_E200RecordValidation],[InfoAndStatusLength  = 2]',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_StartRoutine_RunOnDemandSelfTest' => {													
					'Requests' => {									
						'REQ_RoutineControl_StartRoutine_RunOnDemandSelfTest' => {'Request' => '31 01 02 02 ', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_StartRoutine_RunOnDemandSelfTest' => {'DataLength' => '', 'Desc' => 'RoutineControl_StartRoutine_RunOnDemandSelfTest', 'DoorsIDs' => ['SPS_ConfigTable302'], 'Mode' => 'relax', 'Response' => '71 01 02 02', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck', 'CustOCSBelowVoltageOperation'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_StartRoutine_RunOnDemandSelfTest_WithSuppression' => {													
					'Requests' => {									
						'REQ_RoutineControl_StartRoutine_RunOnDemandSelfTest_WithSuppression' => {'Request' => '31 81 02 02', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_StartRoutine_RunOnDemandSelfTest_WithSuppression' => {'DataLength' => '', 'Desc' => 'RoutineControl_StartRoutine_RunOnDemandSelfTest_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable302'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck', 'CustOCSBelowVoltageOperation'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_StartRoutine_StartVdscalibration' => {													
					'Requests' => {									
						'REQ_RoutineControl_StartRoutine_StartVdscalibration' => {'Request' => '31 01 02 11', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_StartRoutine_StartVdscalibration' => {'DataLength' => '', 'Desc' => 'RoutineControl_StartRoutine_StartVdscalibration', 'DoorsIDs' => ['SPS_ConfigTable783'], 'Mode' => 'relax', 'Response' => '71 01 02 11', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['---'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_StartRoutine_startmackeyupdateinfield' => {													
					'Requests' => {									
						'REQ_RoutineControl_StartRoutine_startmackeyupdateinfield' => {'Request' => '31 01 10 10 RoutineControlOption', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_StartRoutine_startmackeyupdateinfield' => {'DataLength' => '', 'Desc' => 'RoutineControl_StartRoutine_startmackeyupdateinfield', 'DoorsIDs' => ['SPS_ConfigTable789'], 'Mode' => 'relax', 'Response' => '71 01 10 10', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooHighCheck', 'VoltageTooLowCheck', 'InitTestNotCompletedCheck', 'CustFailureCounterCheck '],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},													
#----------------------------------------------------------------------------------#														
	'RoutineControl_StartRoutine_startmackeyupdateinplant' => {													
					'Requests' => {									
						'REQ_RoutineControl_StartRoutine_startmackeyupdateinplant' => {'Request' => '31 01 10 0E ', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_StartRoutine_startmackeyupdateinplant' => {'DataLength' => '', 'Desc' => 'RoutineControl_StartRoutine_startmackeyupdateinplant', 'DoorsIDs' => ['SPS_ConfigTable785'], 'Mode' => 'relax', 'Response' => '71 01 10 0E', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooHighCheck', 'VoltageTooLowCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},		
#----------------------------------------------------------------------------------#														
	'RoutineControl_StartRoutine_startmackeyupdateinplant_WithSuppression' => {													
					'Requests' => {									
						'REQ_RoutineControl_StartRoutine_startmackeyupdateinplant_WithSuppression' => {'Request' => '31 81 10 0E ', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_StartRoutine_startmackeyupdateinplant_WithSuppression' => {'DataLength' => '', 'Desc' => 'RoutineControl_StartRoutine_startmackeyupdateinplant_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable785'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooHighCheck', 'VoltageTooLowCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},			
#----------------------------------------------------------------------------------#														
	'RoutineControl_StartRoutine_startmackeyverificationinplant' => {													
					'Requests' => {									
						'REQ_RoutineControl_StartRoutine_startmackeyverificationinplant' => {'Request' => '31 01 10 0F ', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_StartRoutine_startmackeyverificationinplant' => {'DataLength' => '', 'Desc' => 'RoutineControl_StartRoutine_startmackeyverificationinplant', 'DoorsIDs' => ['SPS_ConfigTable787'], 'Mode' => 'relax', 'Response' => '71 01 10 0F', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooHighCheck', 'VoltageTooLowCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},
#----------------------------------------------------------------------------------#														
	'RoutineControl_StartRoutine_startmackeyverificationinplant_WithSuppression' => {													
					'Requests' => {									
						'REQ_RoutineControl_StartRoutine_startmackeyverificationinplant_WithSuppression' => {'Request' => '31 81 10 0F ', },								
					},									
					'POS_Responses' => {									
						'PR_RoutineControl_StartRoutine_startmackeyverificationinplant_WithSuppression' => {'DataLength' => '', 'Desc' => 'RoutineControl_StartRoutine_startmackeyverificationinplant_WithSuppression', 'DoorsIDs' => ['SPS_ConfigTable787'], 'Mode' => 'quiet', 'Response' => '', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooHighCheck', 'VoltageTooLowCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession'],									
					'allowed_in_addressingmodes' => ['functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => '0x0000',									
	},		
#----------------------------------------------------------------------------------#														
	'SecurityAccess_RequestSeed_31' => {													
					'Requests' => {									
						'REQ_SecurityAccess_RequestSeed_31' => {'Request' => '27 31', },								
					},									
					'POS_Responses' => {									
						'PR_SecurityAccess_RequestSeed_31' => {'DataLength' => '', 'Desc' => 'SecurityAccess_RequestSeed_31', 'DoorsIDs' => ['SPS_ConfigTable777'], 'Mode' => 'relax', 'Response' => '67 31', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck', 'CustSecurityCheckMask'],									
					'allowed_in_sessions' => ['ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical'],	# update base on Problem 2276844								
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'SecurityAccess_RequestSeed_33' => {													
					'Requests' => {									
						'REQ_SecurityAccess_RequestSeed_33' => {'Request' => '27 33', },								
					},									
					'POS_Responses' => {									
						'PR_SecurityAccess_RequestSeed_33' => {'DataLength' => '', 'Desc' => 'SecurityAccess_RequestSeed_33', 'DoorsIDs' => ['SPS_ConfigTable779'], 'Mode' => 'relax', 'Response' => '67 33', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck', 'CustSecurityCheckMask'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical'],	# update base on Problem 2276844							
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'SecurityAccess_RequestSeed_33_SPRMIB' => {													
					'Requests' => {									
						'REQ_SecurityAccess_RequestSeed_33_SPRMIB' => {'Request' => '27 B3', },								
					},									
					'POS_Responses' => {									
						'NoResponse_SecurityAccess_RequestSeed_33_SPRMIB' => {'DataLength' => '', 'Desc' => 'SecurityAccess_RequestSeed_33_SPRMIB', 'DoorsIDs' => ['SPS_ConfigTable779'], 'Mode' => 'quiet', 'Response' => '67 B3', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck', 'CustSecurityCheckMask'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical'], # update base on Problem 2276844								
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'SecurityAccess_RequestSeed_Deployment' => {													
					'Requests' => {									
						'REQ_SecurityAccess_RequestSeed_Deployment' => {'Request' => '27 5F', },								
					},									
					'POS_Responses' => {									
						'PR_SecurityAccess_RequestSeed_Deployment' => {'DataLength' => '', 'Desc' => 'SecurityAccess_RequestSeed_Deployment', 'DoorsIDs' => ['SPS_ConfigTable142'], 'Mode' => 'relax', 'Response' => '67 5F', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['---'],									
					'allowed_in_sessions' => ['SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'SecurityAccess_SendKey_03' => {													
		'Requests'      => { 'REQ_SecurityAccess_SendKey_03' => { 'Request'    => '27 04 Key', }, },												
		'POS_Responses' => { 'PR_SecurityAccess_SendKey_03'  => { 'DataLength' => '', 'Desc' => 'SecurityAccess_SendKey_03', 'DoorsIDs' => ['SPS_ConfigTable719'], 'Mode' => 'relax', 'Response' => '67 04', }, },												
		'protocol'                            => 'UDS',												
		'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck'],												
		'allowed_in_sessions'                 => ['ExtendedSession'],												
		'allowed_in_addressingmodes'          => [ 'physical', 'functional' ],												
		'allowed_in_securitylevels'           => ['None'],												
		'additional_parameter'                => 'n/a',												
	},													
#----------------------------------------------------------------------------------#														
	'SecurityAccess_SendKey_31' => {													
					'Requests' => {									
						'REQ_SecurityAccess_SendKey_31' => {'Request' => '27 32 Key', },								
					},									
					'POS_Responses' => {									
						'PR_SecurityAccess_SendKey_31' => {'DataLength' => '', 'Desc' => 'SecurityAccess_SendKey_31', 'DoorsIDs' => ['SPS_ConfigTable778'], 'Mode' => 'relax', 'Response' => '67 32', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck', 'CustSecurityCheckMask'],									
					'allowed_in_sessions' => ['ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical'],		# update base on Problem 2276844							
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'SecurityAccess_SendKey_33' => {													
					'Requests' => {									
						'REQ_SecurityAccess_SendKey_33' => {'Request' => '27 34 Key', },								
					},									
					'POS_Responses' => {									
						'PR_SecurityAccess_SendKey_33' => {'DataLength' => '', 'Desc' => 'SecurityAccess_SendKey_33', 'DoorsIDs' => ['SPS_ConfigTable780'], 'Mode' => 'relax', 'Response' => '67 34', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck', 'CustSecurityCheckMask'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical'],	# update base on Problem 2276844								
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'SecurityAccess_SendKey_33_SPRMIB' => {													
					'Requests' => {									
						'REQ_SecurityAccess_SendKey_33_SPRMIB' => {'Request' => '27 B4 Key', },								
					},									
					'POS_Responses' => {									
						'NoResponse_SecurityAccess_SendKey_33_SPRMIB' => {'DataLength' => '', 'Desc' => 'SecurityAccess_SendKey_33_SPRMIB', 'DoorsIDs' => ['SPS_ConfigTable780'], 'Mode' => 'quiet', 'Response' => '67 B4', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VehicleSpeedTooHighCheck', 'CustSecurityCheckMask'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical'],  # update base on Problem 2276844								
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'SecurityAccess_SendKey_Deployment' => {													
					'Requests' => {									
						'REQ_SecurityAccess_SendKey_Deployment' => {'Request' => '27 60 Key', },								
					},									
					'POS_Responses' => {									
						'PR_SecurityAccess_SendKey_Deployment' => {'DataLength' => '', 'Desc' => 'SecurityAccess_SendKey_Deployment', 'DoorsIDs' => ['SPS_ConfigTable143'], 'Mode' => 'relax', 'Response' => '67 60', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['---'],									
					'allowed_in_sessions' => ['SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'TesterPresent_zeroSubfunction' => {													
					'Requests' => {									
						'REQ_TesterPresent_zeroSubfunction' => {'Request' => '3E 00', },								
					},									
					'POS_Responses' => {									
						'PR_TesterPresent_zeroSubfunction' => {'DataLength' => '', 'Desc' => 'TesterPresent_zeroSubfunction', 'DoorsIDs' => ['SPS_ConfigTable217'], 'Mode' => 'relax', 'Response' => '7E 00', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['n/a'],									
					'allowed_in_sessions' => ['DefaultSession', 'ExtendedSession', 'ProgrammingSession'],									
					'allowed_in_addressingmodes' => ['physical', 'functional'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'TesterPresent_zeroSubfunction_ForDisposal' => {													
					'Requests' => {									
						'REQ_TesterPresent_zeroSubfunction_ForDisposal' => {'Request' => '3E 00', },								
					},									
					'POS_Responses' => {									
						'PR_TesterPresent_zeroSubfunction_ForDisposal' => {'DataLength' => '', 'Desc' => 'TesterPresent_zeroSubfunction_ForDisposal', 'DoorsIDs' => ['SPS_ConfigTable158'], 'Mode' => 'relax', 'Response' => '7E 00', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['n/a'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'WriteDataByIdentifier_DismantlerInfo' => {													
					'Requests' => {									
						'REQ_WriteDataByIdentifier_DismantlerInfo' => {'Request' => '2E FA 07 Data', },								
					},									
					'POS_Responses' => {									
						'PR_WriteDataByIdentifier_DismantlerInfo' => {'DataLength' => '', 'Desc' => 'WriteDataByIdentifier_DismantlerInfo', 'DoorsIDs' => ['SPS_ConfigTable147'], 'Mode' => 'relax', 'Response' => '6E FA 07', },								
					},									
					'protocol' => 'Disposal',									
					'preconditions_prohibiting_execution' => ['IdleModeCheck'],									
					'allowed_in_sessions' => ['DefaultSession', 'SafetySession'],									
					'allowed_in_addressingmodes' => ['disposal'],									
					'allowed_in_securitylevels' => ['None'],									
					'additional_parameter' => 'n/a',									
	},													
#----------------------------------------------------------------------------------#														
	'WriteDataByIdentifier_EOLConfiguration' => {													
					'Requests' => {									
						'REQ_WriteDataByIdentifier_EOLConfiguration' => {'Request' => '2E DE 00 Data', },								
					},									
					'POS_Responses' => {									
						'PR_WriteDataByIdentifier_EOLConfiguration' => {'DataLength' => '', 'Desc' => 'WriteDataByIdentifier_EOLConfiguration', 'DoorsIDs' => ['SPS_ConfigTable304'], 'Mode' => 'relax', 'Response' => '6E DE 00', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooHighCheck', 'VoltageTooLowCheck', 'ProductionModeActiveCheck', 'CustRAMROMFailure', 'CustInternalFailure'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical'],									
					'allowed_in_securitylevels' => ['Level1A'],									
					'additional_parameter' => '[EOLConfiguration]',									
	},													
#----------------------------------------------------------------------------------#														
	'WriteDataByIdentifier_TVV' => {													
					'Requests' => {									
						'REQ_WriteDataByIdentifier_TVV' => {'Request' => '2E F1 96 Data', },								
					},									
					'POS_Responses' => {									
						'PR_WriteDataByIdentifier_TVV' => {'DataLength' => '', 'Desc' => 'WriteDataByIdentifier_TVV', 'DoorsIDs' => ['SPS_ConfigTable797'], 'Mode' => 'relax', 'Response' => '6E F1 96', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooLowCheck', 'CustRAMROMFailure'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical'],									
					'allowed_in_securitylevels' => ['Level1A'],									
					'additional_parameter' => '[NVMBlockID = NvMConf_NvMBlockDescriptor_NVM_ID_dwdi_TVVData],[Offset = 0]',									
	},													
#----------------------------------------------------------------------------------#														
	'WriteDataByIdentifier_VIN' => {													
					'Requests' => {									
						'REQ_WriteDataByIdentifier_VIN' => {'Request' => '2E F1 90 Data', },								
					},									
					'POS_Responses' => {									
						'PR_WriteDataByIdentifier_VIN' => {'DataLength' => '', 'Desc' => 'WriteDataByIdentifier_VIN', 'DoorsIDs' => ['SPS_ConfigTable258'], 'Mode' => 'relax', 'Response' => '6E F1 90', },								
					},									
					'protocol' => 'UDS',									
					'preconditions_prohibiting_execution' => ['VoltageTooLowCheck', 'CustRAMROMFailure'],									
					'allowed_in_sessions' => ['ExtendedSession'],									
					'allowed_in_addressingmodes' => ['physical'],									
					'allowed_in_securitylevels' => ['Level1A'],									
					'additional_parameter' => '[NVMBlockID = NvMConf_NvMBlockDescriptor_NVM_ID_dwdi_VINData],[Offset = 0]',									
	},													
#----------------------------------------------------------------------------------#														
														
},														
##### END OF Request Response Section #######														
														
														
														
############# GlobalNRC ##################														
														
'GlobalNRC' => {														
	'10' => 'generalReject',													
	'11' => 'serviceNotSupported',													
	'12' => 'subFunctionNotSupported',													
	'13' => 'incorrectMessageLengthOrInvalidFormat',													
	'14' => 'responseTooLong',													
	'21' => 'busyRepeatRequest',													
	'22' => 'conditionsNotCorrect',													
	'24' => 'requestSequenceError',													
	'25' => 'noResponseFromSubnetComponent',													
	'26' => 'failurePreventsExecutionOfRequestedAction',													
	'31' => 'requestOutOfRange',													
	'33' => 'securityAccessDenied',													
	'35' => 'invalidKey',													
	'36' => 'exceedNumberOfAttempts',													
	'37' => 'requiredTimeDelayNotExpired',													
	'70' => 'uploadDownloadNotAccepted',													
	'71' => 'transferDataSuspended',													
	'72' => 'generalProgrammingFailure',													
	'73' => 'wrongBlockSequenceCounter',													
	'78' => 'requestCorrectlyReceived_ResponsePending',													
	'7E' => 'subFunctionNotSupportedInActiveSession',													
	'7F' => 'serviceNotSupportedInActiveSession',													
	'81' => 'rpmTooHigh',													
	'82' => 'rpmTooLow',													
	'83' => 'engineIsRunning',													
	'84' => 'engineIsNotRunning',													
	'85' => 'engineRunTimeTooLow',													
	'86' => 'temperatureTooHigh',													
	'87' => 'temperatureTooLow',													
	'88' => 'vehicleSpeedTooHigh',													
	'89' => 'vehicleSpeedTooLow',													
	'8A' => 'throttle_PedalTooHigh',													
	'8B' => 'throttle_PedalTooLow',													
	'8C' => 'transmissionRangeNotInNeutral',													
	'8D' => 'transmissionRangeNotInGear',													
	'8F' => 'brakeSwitchNotClosed',													
	'90' => 'shifterLeverNotInPark',													
	'91' => 'torqueConverterClutchLocked',													
	'92' => 'voltageTooHigh',													
	'93' => 'voltageTooLow',													
},														
#---------------------------------------------------------#														
														
};    #end of Mapping_DIAG														
1;														
