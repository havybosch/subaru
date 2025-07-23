###############################
$VERSION = q$Revision: 1.2 $;
$HEADER = q$Header: config/Mapping_StaticBit.pm 1.0 11/3/2023 4:50:35 PM Ly Kim Nguyen Ban (MS/EAA43-CC) develop $;
###############################


$Defaults->{'DEVICE_CONFIG'} = {
	'IsRightHandDriver'		=>	'IsRightHandDriver',
	'ActiveSafety'		=>	'ActiveSafety',
	'COMess340and33E'		=>	'CustIsCrashOutputMessage340and33ESupported',
	'COMess04A'		=>	'CustIsCrashOutputMessage04ASupported',
	'ECall'		=>	'ENSEcallSupported',
	'DoorUnlock'		=>	'ENSDoorUnlockSupported',
	'ISODisposal'		=>	'IsISODisposalSupported',
	'VehDynamicSensor'		=>	'CustIsVehicleDynamicSensorSupported',
	'OCS'		=>	'CustIsOCSConfigured',
	'PADIOFF'		=>	'CustIsPADIOffSupported',
	'PADION'		=>	'CustIsPADIOnSupported',
	'OCSCAN'		=>	'CustIsOccupantClassificationSystemCANSupported',
	'OCSKline'		=>	'CustIsOccupantClassificationSystemKlineSupported',
	'SeatBeltWIDRV'		=>	'CustIsSeatBeltWarningIndicatorDriverSupported',
	'SeatBeltWIPGR'		=>	'CustIsSeatBeltWarningIndicatorPassengerSupported',
	'SeatBeltWIREAR'		=>	'CustIsSeatBeltWarningIndicatorRearSupported',
	'ParamA'		=>	'CustIsAlgoParameterASupported',
	'ParamB'		=>	'CustIsAlgoParameterBSupported',
	'ConnectorA'		=>	'ConnectorLockA',
	'SecurityOEM1'		=>	'CustIsSecurityAccessOEM1Supported',
	'SecurityOEM2'		=>	'CustIsSecurityAccessOEM2Supported',
	'SecurityOEM3'		=>	'CustIsSecurityAccessOEM3Supported',
	'SecurityOEM4'		=>	'CustIsSecurityAccessOEM4Supported',
	'StaticRollover'		=>	'DisableAlgoStaticRollover',
	'RPMOnly'		=>	'CustIsEngineRPMOnly',
},
