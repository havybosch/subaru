# --------------------------------------------------------------------------
#
#  Copyright (c) 2017 Robert Bosch GmbH, Germany
#  All rights reserved.
#
# --------------------------------------------------------------------------
#                AB12_SystemTest_SYC.pm
#
# Description:
#  Export of all parameter settings of the AB12 SYC model
#  that are needed by system test.
#
#  $Source: SYC_Exports/SystemTestingExports/input/AB12_SystemTest_SYC.pm_pvt $
#  $Revision: 1.2 $
#  $Author: Schwibus Dirk (CC-PS/EPS2) (SDW2BUE) $
#
# --------------------------------------------------------------------------
package SystemTest_SYC_Export;

$SYC_Export = {
VariantModelInformation => "SystemTesting_MZ_G7_H2_J30A24CY_KKTS",

# --------------------------------------------------------------------------
# Actuators
# --------------------------------------------------------------------------
Actuators => {
GeneralData =>
{
RepetitionTime_ms => 278,TestCurrent_mA => 40,ResistanceShort2Bat_kOhm => 5
},
DeviceData =>
{
AB1FD => {asicNo => 1, loopNo => 3, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
AB1FP => {asicNo => 1, loopNo => 4, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "true", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
AB2FD => {asicNo => 2, loopNo => 7, configured => "false", onlyMonitored => "true", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
AB2FP => {asicNo => 2, loopNo => 8, configured => "false", onlyMonitored => "true", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "true", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
BT1FD => {asicNo => 1, loopNo => 1, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
BT1FP => {asicNo => 1, loopNo => 2, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "true", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
ALLFD => {asicNo => 2, loopNo => 5, configured => "false", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
ALLFP => {asicNo => 2, loopNo => 6, configured => "false", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
KA1FD => {asicNo => 1, loopNo => 9, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
KA1FP => {asicNo => 2, loopNo => 9, configured => "false", onlyMonitored => "true", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "true", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
SA1FD => {asicNo => 1, loopNo => 7, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 9, ResistanceOk_UpperThreshold_Ohm => 8, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
SA1FP => {asicNo => 1, loopNo => 8, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "true", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 9, ResistanceOk_UpperThreshold_Ohm => 8, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
IC1FD => {asicNo => 1, loopNo => 5, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
IC1FP => {asicNo => 1, loopNo => 6, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
BT1RD => {asicNo => 1, loopNo => 11, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
BT1RP => {asicNo => 1, loopNo => 12, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
SA1RD => {asicNo => 2, loopNo => 1, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 9, ResistanceOk_UpperThreshold_Ohm => 8, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
SA1RP => {asicNo => 2, loopNo => 2, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 9, ResistanceOk_UpperThreshold_Ohm => 8, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
FS1FD => {asicNo => 1, loopNo => 10, configured => "true", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 9, ResistanceOk_UpperThreshold_Ohm => 8, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
AB1RD => {asicNo => 2, loopNo => 10, configured => "false", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
AB1RP => {asicNo => 2, loopNo => 11, configured => "false", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
ALLRD => {asicNo => 2, loopNo => 3, configured => "false", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1},
ALLRP => {asicNo => 2, loopNo => 4, configured => "false", onlyMonitored => "false", crossCoupling => "true", IsDeactivatedByPassengerAirbagDeactivation => "false", firingMode => "mode II", ActuatorType => "Squib", ResistanceHigh_LowerThreshold_Ohm => 7, ResistanceOk_UpperThreshold_Ohm => 5, ResistanceOk_LowerThreshold_Ohm => 1.5, ResistanceLow_UpperThreshold_Ohm => 1}
},
},
# --------------------------------------------------------------------------
# Analogue Outputs
# --------------------------------------------------------------------------
AnalogueOutputs => {
DeviceData =>
{
CrashOutput1 => {configured => "true", onlyMonitored => "false", lowSideDriver => "false", highSideDriver => "false", ASIC => "true"},
CrashOutput2 => {configured => "true", onlyMonitored => "false", lowSideDriver => "false", highSideDriver => "false", ASIC => "true"},
CrashOutput3 => {configured => "false", onlyMonitored => "false", lowSideDriver => "false", highSideDriver => "false", ASIC => "true"}
},
},
# --------------------------------------------------------------------------
# ASICs
# --------------------------------------------------------------------------
ASICs => {
DeviceData =>
{
MasterAsicType => "CG903",
Slave1AsicType => "CG903",
Slave2AsicType => "N/A"
},
},
# --------------------------------------------------------------------------
# Communication Interfaces
# --------------------------------------------------------------------------
Communication_Interfaces => {
Can =>
{
FirstCommunication_Time_ms => 200,
},
FlexRay =>
{
FirstCommunication_Time_ms => "N/A",
},
Lin =>
{
FirstCommunication_Time_ms => "N/A",
},
},
# --------------------------------------------------------------------------
# EDR
# --------------------------------------------------------------------------
EDR => {
GeneralData =>
{
EDR_ALLOW_ONLINE_DIAG => "false",
EDR_ME_HANDLING => "Drop",
NumberOfEventsToBeStored => 3,
NumberOfParallelEvents => 4,
ThresholdValueForInternalError      => 2,
EDR_SECTION_CRC                     => "true",
EDR_SPECIAL_EVENT_SET => "N/A",
NumberOfEventsToBeStoredPEP => "N/A",
NumberOfParallelEventsPEP => "N/A",
ThresholdValueForInternalErrorPEP => "N/A",
EDR_TRIGGER_THRESHOLD_SPEED => 8,
EDR_TRIGGER_THRESHOLD_TIME => 150,
Type => "NHTSA",
DevicesLeadingToLockingOfRecord     => ["AB1FD","AB1FP","AB2FD","AB2FP","BT1FD","BT1FP","ALLFD","ALLFP","KA1FD","KA1FP","SA1FD","SA1FP","IC1FD","IC1FP","BT1RD","BT1RP","SA1RD","SA1RP","FS1FD","AB1RD","AB1RP","ALLRD","ALLRP"],

},
},
# --------------------------------------------------------------------------
# FaultRecording
# --------------------------------------------------------------------------
FaultRecording => {
GeneralData =>
{
BoschMemorySize => 20,
DemDisturbanceMemorySize => 15,
DemMaxNumberEventEntryPrimary => 20
},
},
# --------------------------------------------------------------------------
# PassengerAirbagDeactivation
# --------------------------------------------------------------------------
PassengerAirbagDeactivation => {
GeneralData =>
{
PadStateIfNotConfigured => "activated",
PadStateIfDataInvalid => "deactivated",
PadStateInit => "deactivated",
RedundantHwPath => "NA",
MeasurementRepetition => "NA",
PadStateIfFault => "NA",

},
},
# --------------------------------------------------------------------------
# PowerSupply
# --------------------------------------------------------------------------
PowerSupply => {
GeneralData =>
{
HighVoltageDetectionLimit_V         => 16,
LowVoltageDetectionLimit_V          => 8,
MinAutarkyTime_ms                   => 615,
NumberOfSupplyLines                 => 1,
ReverseVoltageTest_voltage_V        => -14,
ReverseVoltageTest_duration_s       => 60,
ReverseVoltageTest_temperature_C    => 50,

},
},
# --------------------------------------------------------------------------
# InternalSensors
# --------------------------------------------------------------------------
InternalSensors => {
DeviceData =>
{
AccelerationSensor1 => 'SMA760_MasterData',
AccelerationSensor2 => 'SMA720_MasterData',
InertialSensor1 => 'SMI860_MasterData',

},
},
# --------------------------------------------------------------------------
# Sensors
# --------------------------------------------------------------------------
Sensors => {
DeviceData =>
{
UFSD => {
"Channel1" => {configured => "true", onlyMonitored => "false"}
},
UFSP => {
"Channel1" => {configured => "true", onlyMonitored => "false"}
},
PASFD => {
"Channel1" => {configured => "true", onlyMonitored => "false"}
},
PASFP => {
"Channel1" => {configured => "true", onlyMonitored => "false"}
},
PASMD => {
"Channel1" => {configured => "true", onlyMonitored => "false"}
},
PASMP => {
"Channel1" => {configured => "true", onlyMonitored => "false"}
},
PPSFD => {
"Channel1" => {configured => "true", onlyMonitored => "false"}
},
PPSFP => {
"Channel1" => {configured => "true", onlyMonitored => "false"}
},
UFSC => {
"Channel1" => {configured => "false", onlyMonitored => "true"}
},
PASRC => {
"Channel1" => {configured => "false", onlyMonitored => "false"}
}
},
},
# --------------------------------------------------------------------------
# Switches
# --------------------------------------------------------------------------
Switches => {
GeneralData =>
{
RepetitionTime_ms => 100,SwitchInput_InitTime_ms => 250,
},
DeviceData =>
{
BLFD => {asicNo => "N/A", loopNo => "N/A", configured => "true", onlyMonitored => "false", SwitchType => "Bus Switch"},
BLFP => {asicNo => 1, loopNo => 1, configured => "true", onlyMonitored => "false", SwitchType => "Mechanical Switch", InitialCondition => "Position B", FaultReaction => "keep last condition", MeasurementMode => "voltage measurement", crossCoupling => "false", PositionA_Type => "Threshold", PositionA_Low => "N/A", PositionA_High => "N/A", PositionA_ThresholdValue_Ohm => 300, PositionB_Type => "Threshold", PositionB_Low => "N/A", PositionB_High => "N/A", PositionB_ThresholdValue_Ohm => 300, Threshold_A_Below_B => "true", OpenLineValue => "NA", UndefinedValue_Low => "NA", UndefinedValue_High => "NA", Short2GndValue => "NA", ConstantCurrent => 10, MaxMeasurementLimit => 1250, MeasurementRepetition => 4},
SPSFD => {asicNo => 1, loopNo => 6, configured => "false", onlyMonitored => "true", SwitchType => "Hall Switch", InitialCondition => "Position B", FaultReaction => "keep last condition", MeasurementMode => "current measurement", crossCoupling => "true", PositionA_Type => "Range", PositionA_Low => 3.9, PositionA_High => 6.9, PositionA_ThresholdValue_Ohm => "N/A", PositionB_Type => "Range", PositionB_Low => 11, PositionB_High => 19.4, PositionB_ThresholdValue_Ohm => "N/A", Threshold_A_Below_B => "N/A", OpenLineValue => 3.075, UndefinedValue_Low => 7.981, UndefinedValue_High => 9.766, Short2GndValue => 21.253, ConstantCurrent => "N/A", MaxMeasurementLimit => 30, MeasurementRepetition => 5},
SPSFP => {asicNo => 1, loopNo => 10, configured => "false", onlyMonitored => "true", SwitchType => "Hall Switch", InitialCondition => "Position B", FaultReaction => "keep last condition", MeasurementMode => "current measurement", crossCoupling => "true", PositionA_Type => "Range", PositionA_Low => 3.9, PositionA_High => 6.9, PositionA_ThresholdValue_Ohm => "N/A", PositionB_Type => "Range", PositionB_Low => 11, PositionB_High => 19.4, PositionB_ThresholdValue_Ohm => "N/A", Threshold_A_Below_B => "N/A", OpenLineValue => 3.075, UndefinedValue_Low => 7.981, UndefinedValue_High => 9.766, Short2GndValue => 21.253, ConstantCurrent => "N/A", MaxMeasurementLimit => 30, MeasurementRepetition => 5},
OPSFP => {asicNo => 1, loopNo => 9, configured => "true", onlyMonitored => "false", SwitchType => "Mechanical Switch", InitialCondition => "Position A", FaultReaction => "keep last condition", MeasurementMode => "voltage measurement", crossCoupling => "false", PositionA_Type => "Threshold", PositionA_Low => "N/A", PositionA_High => "N/A", PositionA_ThresholdValue_Ohm => 300, PositionB_Type => "Threshold", PositionB_Low => "N/A", PositionB_High => "N/A", PositionB_ThresholdValue_Ohm => 300, Threshold_A_Below_B => "false", OpenLineValue => "NA", UndefinedValue_Low => "NA", UndefinedValue_High => "NA", Short2GndValue => "NA", ConstantCurrent => 10, MaxMeasurementLimit => 1250, MeasurementRepetition => 20},
RSD => {asicNo => 1, loopNo => 8, configured => "false", onlyMonitored => "false", SwitchType => "Hall Switch", InitialCondition => "Position B", FaultReaction => "keep last condition", MeasurementMode => "current measurement", crossCoupling => "true", PositionA_Type => "Range", PositionA_Low => 3.9, PositionA_High => 6.9, PositionA_ThresholdValue_Ohm => "N/A", PositionB_Type => "Range", PositionB_Low => 11, PositionB_High => 19.4, PositionB_ThresholdValue_Ohm => "N/A", Threshold_A_Below_B => "N/A", OpenLineValue => 3.075, UndefinedValue_Low => 7.981, UndefinedValue_High => 9.766, Short2GndValue => 21.253, ConstantCurrent => "N/A", MaxMeasurementLimit => 30, MeasurementRepetition => 5},
RSP => {asicNo => 2, loopNo => 7, configured => "false", onlyMonitored => "false", SwitchType => "Hall Switch", InitialCondition => "Position B", FaultReaction => "keep last condition", MeasurementMode => "current measurement", crossCoupling => "true", PositionA_Type => "Range", PositionA_Low => 3.9, PositionA_High => 6.9, PositionA_ThresholdValue_Ohm => "N/A", PositionB_Type => "Range", PositionB_Low => 11, PositionB_High => 19.4, PositionB_ThresholdValue_Ohm => "N/A", Threshold_A_Below_B => "N/A", OpenLineValue => 3.075, UndefinedValue_Low => 7.981, UndefinedValue_High => 9.766, Short2GndValue => 21.253, ConstantCurrent => "N/A", MaxMeasurementLimit => 30, MeasurementRepetition => 5},
ConnectorLockA => {asicNo => 1, loopNo => 5, configured => "true", onlyMonitored => "false", SwitchType => "Mechanical Switch", InitialCondition => "Position B", FaultReaction => "keep last condition", MeasurementMode => "voltage measurement", crossCoupling => "false", PositionA_Type => "Threshold", PositionA_Low => "N/A", PositionA_High => "N/A", PositionA_ThresholdValue_Ohm => 300, PositionB_Type => "Threshold", PositionB_Low => "N/A", PositionB_High => "N/A", PositionB_ThresholdValue_Ohm => 300, Threshold_A_Below_B => "true", OpenLineValue => "NA", UndefinedValue_Low => "NA", UndefinedValue_High => "NA", Short2GndValue => "NA", ConstantCurrent => 10, MaxMeasurementLimit => 1250, MeasurementRepetition => 3},
ConnectorLockB => {asicNo => 1, loopNo => 2, configured => "true", onlyMonitored => "false", SwitchType => "Mechanical Switch", InitialCondition => "Position B", FaultReaction => "keep last condition", MeasurementMode => "voltage measurement", crossCoupling => "false", PositionA_Type => "Threshold", PositionA_Low => "N/A", PositionA_High => "N/A", PositionA_ThresholdValue_Ohm => 300, PositionB_Type => "Threshold", PositionB_Low => "N/A", PositionB_High => "N/A", PositionB_ThresholdValue_Ohm => 300, Threshold_A_Below_B => "true", OpenLineValue => "NA", UndefinedValue_Low => "NA", UndefinedValue_High => "NA", Short2GndValue => "NA", ConstantCurrent => 10, MaxMeasurementLimit => 1250, MeasurementRepetition => 3},
ConnectorLockC => {asicNo => 1, loopNo => 3, configured => "true", onlyMonitored => "false", SwitchType => "Mechanical Switch", InitialCondition => "Position B", FaultReaction => "keep last condition", MeasurementMode => "voltage measurement", crossCoupling => "false", PositionA_Type => "Threshold", PositionA_Low => "N/A", PositionA_High => "N/A", PositionA_ThresholdValue_Ohm => 300, PositionB_Type => "Threshold", PositionB_Low => "N/A", PositionB_High => "N/A", PositionB_ThresholdValue_Ohm => 300, Threshold_A_Below_B => "true", OpenLineValue => "NA", UndefinedValue_Low => "NA", UndefinedValue_High => "NA", Short2GndValue => "NA", ConstantCurrent => 10, MaxMeasurementLimit => 1250, MeasurementRepetition => 3},
PADS1 => {asicNo => "N/A", loopNo => "N/A", configured => "false", onlyMonitored => "false"},
PADS2 => {asicNo => "N/A", loopNo => "N/A", configured => "false", onlyMonitored => "false"}
},
},
# --------------------------------------------------------------------------
# OperatingModes
# --------------------------------------------------------------------------
OperatingModes => {
EcuInitTime_s => 8
},

# --------------------------------------------------------------------------
# PlantTopics
# --------------------------------------------------------------------------
"Plant_PlantConfiguration" => {"selected" => "false"},

# --------------------------------------------------------------------------
# Configutation
# --------------------------------------------------------------------------
'Configuration_Management' => {
'selected' => 'true',
'Calibration_and_Configuration_Data' => {
'selected' => 'true',
'NumberOfContainers' => '4',
},
'Data_Set_Containers' => {
'selected' => 'true',
'DataSetContainerConfigurationType' => {
'selected' => 'true',
'DataSetContainerConfigurationType_Type1' => {
'selected' => 'false',
},
'DataSetContainerConfigurationType_Type2' => {
'selected' => 'false',
},
'DataSetContainerConfigurationType_Type3' => {
'selected' => 'false',
},
'DataSetContainerConfigurationType_Type4' => {
'selected' => 'false',
},
'DataSetContainerConfigurationType_Type5' => {
'selected' => 'true',
},
},
},
'Static_and_dynamic_behaviour_bits' => {
'selected' => 'true',
'Static_behaviour_bits' => {
'selected' => 'true',
'SBB_ItmDebugDelay' => {
'selected' => 'true',
'SBB_ItmDebugDelay_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_DisableAlgoParts' => {
'selected' => 'true',
'SBB_DisableAlgoRollover' => {
'selected' => 'true',
'SBB_DisableAlgoRollover_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_DisableAlgoStaticRollover' => {
'selected' => 'true',
'SBB_DisableAlgoStaticRollover_bitEnabled' => {
'selected' => 'true',
},
},
'SBB_DisableAlgoPitch' => {
'selected' => 'false',
'SBB_DisableAlgoPitch_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_DisableAlgoPep' => {
'selected' => 'false',
'SBB_DisableAlgoPep_bitEnabled' => {
'selected' => 'false',
},
},
},
'RhdBitUsed' => {
'selected' => 'true',
'RightHandDriverBitSet' => {
'selected' => 'false',
},
},
'SBB_IsoDisposal' => {
'selected' => 'true',
'SBB_IsoDisposal_bitEnabled' => {
'selected' => 'true',
},
},
'SBB_IDF' => {
'selected' => 'false',
'SBB_IDF_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_PCP' => {
'selected' => 'false',
'SBB_PCP_bitEnabled' => {
'selected' => 'false',
},
'SBB_PCP_MsbFDConfig_bitEnabled' => {
'selected' => 'false',
},
'SBB_PCP_MsbFPConfig_bitEnabled' => {
'selected' => 'false',
},
'SBB_PCP_MsbRDConfig_bitEnabled' => {
'selected' => 'false',
},
'SBB_PCP_MsbRPConfig_bitEnabled' => {
'selected' => 'false',
},
'SBB_PCP_MsbRCConfig_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_SCM' => {
'selected' => 'false',
'SBB_SCM_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_Cust' => {
'selected' => 'true',
'CustIsOCSConfigured' => {
'selected' => 'true',
'CustIsOCSConfigured:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsOCSConfigured:BitEnabled' => {
'selected' => 'true',
},
'CustIsOCSConfigured:Sbb_Effects' => {
'selected' => 'false',
'CustIsOCSConfigured:AlgoAll' => {
'selected' => 'false',
},
'CustIsOCSConfigured:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsOCSConfigured:AlgoSide' => {
'selected' => 'false',
},
'CustIsOCSConfigured:AlgoRose' => {
'selected' => 'false',
},
'CustIsOCSConfigured:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsOCSConfigured:AlgoPitch' => {
'selected' => 'false',
},
'CustIsOCSConfigured:AlgoEPP' => {
'selected' => 'false',
},
'CustIsOCSConfigured:SWFiring' => {
'selected' => 'false',
},
'CustIsOCSConfigured:CustSpecific' => {
'selected' => 'false',
},
'CustIsOCSConfigured:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsCrashOutputMessage340and33ESupported' => {
'selected' => 'true',
'CustIsCrashOutputMessage340and33ESupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsCrashOutputMessage340and33ESupported:BitEnabled' => {
'selected' => 'true',
},
'CustIsCrashOutputMessage340and33ESupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsCrashOutputMessage340and33ESupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage340and33ESupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage340and33ESupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage340and33ESupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage340and33ESupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage340and33ESupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage340and33ESupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage340and33ESupported:SWFiring' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage340and33ESupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage340and33ESupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsCrashOutputMessage04ASupported' => {
'selected' => 'true',
'CustIsCrashOutputMessage04ASupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsCrashOutputMessage04ASupported:BitEnabled' => {
'selected' => 'true',
},
'CustIsCrashOutputMessage04ASupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsCrashOutputMessage04ASupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage04ASupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage04ASupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage04ASupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage04ASupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage04ASupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage04ASupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage04ASupported:SWFiring' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage04ASupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsCrashOutputMessage04ASupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsVehicleDynamicSensorSupported' => {
'selected' => 'true',
'CustIsVehicleDynamicSensorSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsVehicleDynamicSensorSupported:BitEnabled' => {
'selected' => 'true',
},
'CustIsVehicleDynamicSensorSupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsVehicleDynamicSensorSupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsVehicleDynamicSensorSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsVehicleDynamicSensorSupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsVehicleDynamicSensorSupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsVehicleDynamicSensorSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsVehicleDynamicSensorSupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsVehicleDynamicSensorSupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsVehicleDynamicSensorSupported:SWFiring' => {
'selected' => 'false',
},
'CustIsVehicleDynamicSensorSupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsVehicleDynamicSensorSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsPADIOffSupported' => {
'selected' => 'true',
'CustIsPADIOffSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsPADIOffSupported:BitEnabled' => {
'selected' => 'true',
},
'CustIsPADIOffSupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsPADIOffSupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsPADIOffSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsPADIOffSupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsPADIOffSupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsPADIOffSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsPADIOffSupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsPADIOffSupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsPADIOffSupported:SWFiring' => {
'selected' => 'false',
},
'CustIsPADIOffSupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsPADIOffSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsPADIOnSupported' => {
'selected' => 'true',
'CustIsPADIOnSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsPADIOnSupported:BitEnabled' => {
'selected' => 'true',
},
'CustIsPADIOnSupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsPADIOnSupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsPADIOnSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsPADIOnSupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsPADIOnSupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsPADIOnSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsPADIOnSupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsPADIOnSupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsPADIOnSupported:SWFiring' => {
'selected' => 'false',
},
'CustIsPADIOnSupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsPADIOnSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsOccupantClassificationSystemCANSupported' => {
'selected' => 'true',
'CustIsOccupantClassificationSystemCANSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsOccupantClassificationSystemCANSupported:BitEnabled' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemCANSupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsOccupantClassificationSystemCANSupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemCANSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemCANSupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemCANSupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemCANSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemCANSupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemCANSupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemCANSupported:SWFiring' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemCANSupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemCANSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsOccupantClassificationSystemKlineSupported' => {
'selected' => 'true',
'CustIsOccupantClassificationSystemKlineSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsOccupantClassificationSystemKlineSupported:BitEnabled' => {
'selected' => 'true',
},
'CustIsOccupantClassificationSystemKlineSupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsOccupantClassificationSystemKlineSupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemKlineSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemKlineSupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemKlineSupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemKlineSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemKlineSupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemKlineSupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemKlineSupported:SWFiring' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemKlineSupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsOccupantClassificationSystemKlineSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsSeatBeltWarningIndicatorDriverSupported' => {
'selected' => 'true',
'CustIsSeatBeltWarningIndicatorDriverSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsSeatBeltWarningIndicatorDriverSupported:BitEnabled' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorDriverSupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsSeatBeltWarningIndicatorDriverSupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorDriverSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorDriverSupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorDriverSupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorDriverSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorDriverSupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorDriverSupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorDriverSupported:SWFiring' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorDriverSupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorDriverSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsSeatBeltWarningIndicatorPassengerSupported' => {
'selected' => 'true',
'CustIsSeatBeltWarningIndicatorPassengerSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsSeatBeltWarningIndicatorPassengerSupported:BitEnabled' => {
'selected' => 'true',
},
'CustIsSeatBeltWarningIndicatorPassengerSupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsSeatBeltWarningIndicatorPassengerSupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorPassengerSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorPassengerSupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorPassengerSupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorPassengerSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorPassengerSupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorPassengerSupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorPassengerSupported:SWFiring' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorPassengerSupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorPassengerSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsSeatBeltWarningIndicatorRearSupported' => {
'selected' => 'true',
'CustIsSeatBeltWarningIndicatorRearSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsSeatBeltWarningIndicatorRearSupported:BitEnabled' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorRearSupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsSeatBeltWarningIndicatorRearSupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorRearSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorRearSupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorRearSupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorRearSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorRearSupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorRearSupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorRearSupported:SWFiring' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorRearSupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsSeatBeltWarningIndicatorRearSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsAlgoParameterASupported' => {
'selected' => 'true',
'CustIsAlgoParameterASupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsAlgoParameterASupported:BitEnabled' => {
'selected' => 'true',
},
'CustIsAlgoParameterASupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsAlgoParameterASupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsAlgoParameterASupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsAlgoParameterASupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsAlgoParameterASupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsAlgoParameterASupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsAlgoParameterASupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsAlgoParameterASupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsAlgoParameterASupported:SWFiring' => {
'selected' => 'false',
},
'CustIsAlgoParameterASupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsAlgoParameterASupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsAlgoParameterBSupported' => {
'selected' => 'true',
'CustIsAlgoParameterBSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsAlgoParameterBSupported:BitEnabled' => {
'selected' => 'true',
},
'CustIsAlgoParameterBSupported:Sbb_Effects' => {
'selected' => 'false',
'CustIsAlgoParameterBSupported:AlgoAll' => {
'selected' => 'false',
},
'CustIsAlgoParameterBSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsAlgoParameterBSupported:AlgoSide' => {
'selected' => 'false',
},
'CustIsAlgoParameterBSupported:AlgoRose' => {
'selected' => 'false',
},
'CustIsAlgoParameterBSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsAlgoParameterBSupported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsAlgoParameterBSupported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsAlgoParameterBSupported:SWFiring' => {
'selected' => 'false',
},
'CustIsAlgoParameterBSupported:CustSpecific' => {
'selected' => 'false',
},
'CustIsAlgoParameterBSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsSecurityAccessOEM1Supported' => {
'selected' => 'true',
'CustIsSecurityAccessOEM1Supported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsSecurityAccessOEM1Supported:BitEnabled' => {
'selected' => 'true',
},
'CustIsSecurityAccessOEM1Supported:Sbb_Effects' => {
'selected' => 'false',
'CustIsSecurityAccessOEM1Supported:AlgoAll' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM1Supported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM1Supported:AlgoSide' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM1Supported:AlgoRose' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM1Supported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM1Supported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM1Supported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM1Supported:SWFiring' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM1Supported:CustSpecific' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM1Supported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsSecurityAccessOEM2Supported' => {
'selected' => 'true',
'CustIsSecurityAccessOEM2Supported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsSecurityAccessOEM2Supported:BitEnabled' => {
'selected' => 'true',
},
'CustIsSecurityAccessOEM2Supported:Sbb_Effects' => {
'selected' => 'false',
'CustIsSecurityAccessOEM2Supported:AlgoAll' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM2Supported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM2Supported:AlgoSide' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM2Supported:AlgoRose' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM2Supported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM2Supported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM2Supported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM2Supported:SWFiring' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM2Supported:CustSpecific' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM2Supported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsSecurityAccessOEM3Supported' => {
'selected' => 'true',
'CustIsSecurityAccessOEM3Supported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsSecurityAccessOEM3Supported:BitEnabled' => {
'selected' => 'true',
},
'CustIsSecurityAccessOEM3Supported:Sbb_Effects' => {
'selected' => 'false',
'CustIsSecurityAccessOEM3Supported:AlgoAll' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM3Supported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM3Supported:AlgoSide' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM3Supported:AlgoRose' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM3Supported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM3Supported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM3Supported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM3Supported:SWFiring' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM3Supported:CustSpecific' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM3Supported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsSecurityAccessOEM4Supported' => {
'selected' => 'true',
'CustIsSecurityAccessOEM4Supported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsSecurityAccessOEM4Supported:BitEnabled' => {
'selected' => 'true',
},
'CustIsSecurityAccessOEM4Supported:Sbb_Effects' => {
'selected' => 'false',
'CustIsSecurityAccessOEM4Supported:AlgoAll' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM4Supported:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM4Supported:AlgoSide' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM4Supported:AlgoRose' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM4Supported:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM4Supported:AlgoPitch' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM4Supported:AlgoEPP' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM4Supported:SWFiring' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM4Supported:CustSpecific' => {
'selected' => 'false',
},
'CustIsSecurityAccessOEM4Supported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'ActiveSafety' => {
'selected' => 'true',
'ActiveSafety:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'ActiveSafety:BitEnabled' => {
'selected' => 'false',
},
'ActiveSafety:Sbb_Effects' => {
'selected' => 'false',
'ActiveSafety:AlgoAll' => {
'selected' => 'false',
},
'ActiveSafety:AlgoFrontRear' => {
'selected' => 'false',
},
'ActiveSafety:AlgoSide' => {
'selected' => 'false',
},
'ActiveSafety:AlgoRose' => {
'selected' => 'false',
},
'ActiveSafety:AlgoStaticRollover' => {
'selected' => 'false',
},
'ActiveSafety:AlgoPitch' => {
'selected' => 'false',
},
'ActiveSafety:AlgoEPP' => {
'selected' => 'false',
},
'ActiveSafety:SWFiring' => {
'selected' => 'false',
},
'ActiveSafety:CustSpecific' => {
'selected' => 'false',
},
'ActiveSafety:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'ENSDoorUnlockSupported' => {
'selected' => 'true',
'ENSDoorUnlockSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'ENSDoorUnlockSupported:BitEnabled' => {
'selected' => 'true',
},
'ENSDoorUnlockSupported:Sbb_Effects' => {
'selected' => 'false',
'ENSDoorUnlockSupported:AlgoAll' => {
'selected' => 'false',
},
'ENSDoorUnlockSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'ENSDoorUnlockSupported:AlgoSide' => {
'selected' => 'false',
},
'ENSDoorUnlockSupported:AlgoRose' => {
'selected' => 'false',
},
'ENSDoorUnlockSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'ENSDoorUnlockSupported:AlgoPitch' => {
'selected' => 'false',
},
'ENSDoorUnlockSupported:AlgoEPP' => {
'selected' => 'false',
},
'ENSDoorUnlockSupported:SWFiring' => {
'selected' => 'false',
},
'ENSDoorUnlockSupported:CustSpecific' => {
'selected' => 'false',
},
'ENSDoorUnlockSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'ENSEcallSupported' => {
'selected' => 'true',
'ENSEcallSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'ENSEcallSupported:BitEnabled' => {
'selected' => 'true',
},
'ENSEcallSupported:Sbb_Effects' => {
'selected' => 'false',
'ENSEcallSupported:AlgoAll' => {
'selected' => 'false',
},
'ENSEcallSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'ENSEcallSupported:AlgoSide' => {
'selected' => 'false',
},
'ENSEcallSupported:AlgoRose' => {
'selected' => 'false',
},
'ENSEcallSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'ENSEcallSupported:AlgoPitch' => {
'selected' => 'false',
},
'ENSEcallSupported:AlgoEPP' => {
'selected' => 'false',
},
'ENSEcallSupported:SWFiring' => {
'selected' => 'false',
},
'ENSEcallSupported:CustSpecific' => {
'selected' => 'false',
},
'ENSEcallSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'ENSHvCutSupported' => {
'selected' => 'true',
'ENSHvCutSupported:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'ENSHvCutSupported:BitEnabled' => {
'selected' => 'false',
},
'ENSHvCutSupported:Sbb_Effects' => {
'selected' => 'false',
'ENSHvCutSupported:AlgoAll' => {
'selected' => 'false',
},
'ENSHvCutSupported:AlgoFrontRear' => {
'selected' => 'false',
},
'ENSHvCutSupported:AlgoSide' => {
'selected' => 'false',
},
'ENSHvCutSupported:AlgoRose' => {
'selected' => 'false',
},
'ENSHvCutSupported:AlgoStaticRollover' => {
'selected' => 'false',
},
'ENSHvCutSupported:AlgoPitch' => {
'selected' => 'false',
},
'ENSHvCutSupported:AlgoEPP' => {
'selected' => 'false',
},
'ENSHvCutSupported:SWFiring' => {
'selected' => 'false',
},
'ENSHvCutSupported:CustSpecific' => {
'selected' => 'false',
},
'ENSHvCutSupported:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'IsEngineType' => {
'selected' => 'true',
'IsEngineType:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'IsEngineType:BitEnabled' => {
'selected' => 'false',
},
'IsEngineType:Sbb_Effects' => {
'selected' => 'false',
'IsEngineType:AlgoAll' => {
'selected' => 'false',
},
'IsEngineType:AlgoFrontRear' => {
'selected' => 'false',
},
'IsEngineType:AlgoSide' => {
'selected' => 'false',
},
'IsEngineType:AlgoRose' => {
'selected' => 'false',
},
'IsEngineType:AlgoStaticRollover' => {
'selected' => 'false',
},
'IsEngineType:AlgoPitch' => {
'selected' => 'false',
},
'IsEngineType:AlgoEPP' => {
'selected' => 'false',
},
'IsEngineType:SWFiring' => {
'selected' => 'false',
},
'IsEngineType:CustSpecific' => {
'selected' => 'false',
},
'IsEngineType:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustDisableSquibFiring' => {
'selected' => 'true',
'CustDisableSquibFiring:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => '',
'CustDisableSquibFiring:BitEnabled' => {
'selected' => 'false',
},
'CustDisableSquibFiring:Sbb_Effects' => {
'selected' => 'true',
'CustDisableSquibFiring:AlgoAll' => {
'selected' => 'false',
},
'CustDisableSquibFiring:AlgoFrontRear' => {
'selected' => 'false',
},
'CustDisableSquibFiring:AlgoSide' => {
'selected' => 'false',
},
'CustDisableSquibFiring:AlgoRose' => {
'selected' => 'false',
},
'CustDisableSquibFiring:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustDisableSquibFiring:AlgoPitch' => {
'selected' => 'false',
},
'CustDisableSquibFiring:AlgoEPP' => {
'selected' => 'false',
},
'CustDisableSquibFiring:SWFiring' => {
'selected' => 'true',
},
'CustDisableSquibFiring:CustSpecific' => {
'selected' => 'false',
},
'CustDisableSquibFiring:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CustIsEngineRPMOnly' => {
'selected' => 'true',
'CustIsEngineRPMOnly:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'EOL configuration support',
'CustIsEngineRPMOnly:BitEnabled' => {
'selected' => 'false',
},
'CustIsEngineRPMOnly:Sbb_Effects' => {
'selected' => 'false',
'CustIsEngineRPMOnly:AlgoAll' => {
'selected' => 'false',
},
'CustIsEngineRPMOnly:AlgoFrontRear' => {
'selected' => 'false',
},
'CustIsEngineRPMOnly:AlgoSide' => {
'selected' => 'false',
},
'CustIsEngineRPMOnly:AlgoRose' => {
'selected' => 'false',
},
'CustIsEngineRPMOnly:AlgoStaticRollover' => {
'selected' => 'false',
},
'CustIsEngineRPMOnly:AlgoPitch' => {
'selected' => 'false',
},
'CustIsEngineRPMOnly:AlgoEPP' => {
'selected' => 'false',
},
'CustIsEngineRPMOnly:SWFiring' => {
'selected' => 'false',
},
'CustIsEngineRPMOnly:CustSpecific' => {
'selected' => 'false',
},
'CustIsEngineRPMOnly:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
},
'SBB_EDR_deactivate' => {
'selected' => 'false',
'SBB_EDR_deactivate_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_EDR_Regulation_Feature' => {
'selected' => 'false',
'SBB_EDR_NHTSA_Feature' => {
'selected' => 'false',
'SBB_EDR_NHTSA_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_EDR_AKLV_Feature' => {
'selected' => 'false',
'SBB_EDR_AKLV_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_EDR_CNEDR_Feature' => {
'selected' => 'false',
'SBB_EDR_CNEDR_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_EDR_UNseries00_Feature' => {
'selected' => 'false',
'SBB_EDR_UNseries00_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_EDR_UNseries01_Feature' => {
'selected' => 'false',
'SBB_EDR_UNseries01_bitEnabled' => {
'selected' => 'false',
},
},
'SBB_EDR_EU_Feature' => {
'selected' => 'false',
'SBB_EDR_EU_bitEnabled' => {
'selected' => 'false',
},
},
},
},
'DynamicBehaviorBits' => {
'selected' => 'true',
'AACN' => {
'selected' => 'true',
'AACN:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'to enable AACN via CAN',
'AACN:BitEnabled' => {
'selected' => 'true',
},
'AACN:Sbb_Effects' => {
'selected' => 'false',
'AACN:AlgoAll' => {
'selected' => 'false',
},
'AACN:AlgoFrontRear' => {
'selected' => 'false',
},
'AACN:AlgoSide' => {
'selected' => 'false',
},
'AACN:AlgoRose' => {
'selected' => 'false',
},
'AACN:AlgoStaticRollover' => {
'selected' => 'false',
},
'AACN:AlgoPitch' => {
'selected' => 'false',
},
'AACN:AlgoEPP' => {
'selected' => 'false',
},
'AACN:SWFiring' => {
'selected' => 'false',
},
'AACN:CustSpecific' => {
'selected' => 'false',
},
'AACN:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'EnableADAS' => {
'selected' => 'true',
'EnableADAS:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'to enable ADAS Crashoutput',
'EnableADAS:BitEnabled' => {
'selected' => 'true',
},
'EnableADAS:Sbb_Effects' => {
'selected' => 'false',
'EnableADAS:AlgoAll' => {
'selected' => 'false',
},
'EnableADAS:AlgoFrontRear' => {
'selected' => 'false',
},
'EnableADAS:AlgoSide' => {
'selected' => 'false',
},
'EnableADAS:AlgoRose' => {
'selected' => 'false',
},
'EnableADAS:AlgoStaticRollover' => {
'selected' => 'false',
},
'EnableADAS:AlgoPitch' => {
'selected' => 'false',
},
'EnableADAS:AlgoEPP' => {
'selected' => 'false',
},
'EnableADAS:SWFiring' => {
'selected' => 'false',
},
'EnableADAS:CustSpecific' => {
'selected' => 'false',
},
'EnableADAS:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'CDTCrashOutput' => {
'selected' => 'true',
'CDTCrashOutput:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'to enable CDT crashoutput transmission',
'CDTCrashOutput:BitEnabled' => {
'selected' => 'false',
},
'CDTCrashOutput:Sbb_Effects' => {
'selected' => 'false',
'CDTCrashOutput:AlgoAll' => {
'selected' => 'false',
},
'CDTCrashOutput:AlgoFrontRear' => {
'selected' => 'false',
},
'CDTCrashOutput:AlgoSide' => {
'selected' => 'false',
},
'CDTCrashOutput:AlgoRose' => {
'selected' => 'false',
},
'CDTCrashOutput:AlgoStaticRollover' => {
'selected' => 'false',
},
'CDTCrashOutput:AlgoPitch' => {
'selected' => 'false',
},
'CDTCrashOutput:AlgoEPP' => {
'selected' => 'false',
},
'CDTCrashOutput:SWFiring' => {
'selected' => 'false',
},
'CDTCrashOutput:CustSpecific' => {
'selected' => 'false',
},
'CDTCrashOutput:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'EnableConnectedEDR' => {
'selected' => 'true',
'EnableConnectedEDR:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'to enable connected EDR',
'EnableConnectedEDR:BitEnabled' => {
'selected' => 'false',
},
'EnableConnectedEDR:Sbb_Effects' => {
'selected' => 'false',
'EnableConnectedEDR:AlgoAll' => {
'selected' => 'false',
},
'EnableConnectedEDR:AlgoFrontRear' => {
'selected' => 'false',
},
'EnableConnectedEDR:AlgoSide' => {
'selected' => 'false',
},
'EnableConnectedEDR:AlgoRose' => {
'selected' => 'false',
},
'EnableConnectedEDR:AlgoStaticRollover' => {
'selected' => 'false',
},
'EnableConnectedEDR:AlgoPitch' => {
'selected' => 'false',
},
'EnableConnectedEDR:AlgoEPP' => {
'selected' => 'false',
},
'EnableConnectedEDR:SWFiring' => {
'selected' => 'false',
},
'EnableConnectedEDR:CustSpecific' => {
'selected' => 'false',
},
'EnableConnectedEDR:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
'EnableSecOC' => {
'selected' => 'true',
'EnableSecOC:BehaviorBit' => {
'selected' => 'true',
'DiagSymDescription' => 'Enable Secure OC feature',
'EnableSecOC:BitEnabled' => {
'selected' => 'true',
},
'EnableSecOC:Sbb_Effects' => {
'selected' => 'false',
'EnableSecOC:AlgoAll' => {
'selected' => 'false',
},
'EnableSecOC:AlgoFrontRear' => {
'selected' => 'false',
},
'EnableSecOC:AlgoSide' => {
'selected' => 'false',
},
'EnableSecOC:AlgoRose' => {
'selected' => 'false',
},
'EnableSecOC:AlgoStaticRollover' => {
'selected' => 'false',
},
'EnableSecOC:AlgoPitch' => {
'selected' => 'false',
},
'EnableSecOC:AlgoEPP' => {
'selected' => 'false',
},
'EnableSecOC:SWFiring' => {
'selected' => 'false',
},
'EnableSecOC:CustSpecific' => {
'selected' => 'false',
},
'EnableSecOC:TriggerWimOn' => {
'selected' => 'false',
},
},
},
},
},
},
},


# --------------------------------------------------------------------------
};