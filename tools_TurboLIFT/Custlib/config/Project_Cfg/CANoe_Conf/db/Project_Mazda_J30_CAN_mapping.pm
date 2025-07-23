### file generated with Mappingfile_Generators/CANMapping/LIFT_prepare_CAN_mapping.pl 1.8 2017/06/15 15:29:22IST Prabhu Pallavi Maruti (RBEI/ESA-PP3) (RBP6KOR) release  
### input dbc files:
### C:/Users/nyv81hc/Desktop/Sanboxes/Mazda_J30/Custlib/config/Tools/CANoe_Conf/db/G70L_CANFD_R01h_withVehicle_MNOS .dbc
package LIFT_PROJECT;

$Defaults->{"Mapping_CAN"} = {
'NODE_UNDER_TEST'       => 'Airbag',

'Diag_Byte_1'  =>
               {
               'SIGNAL_NAME'   => 'Diag_Byte_1',
               'SENDER'        => 'AB_ECU',
               'MESSAGE'       => 'Can_ABECU_2_Diag',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               },

'Diag_Byte_2'  =>
               {
               'SIGNAL_NAME'   => 'Diag_Byte_2',
               'SENDER'        => 'AB_ECU',
               'MESSAGE'       => 'Can_ABECU_2_Diag',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               },
'Diag_Byte_3'  =>
               {
               'SIGNAL_NAME'   => 'Diag_Byte_3',
               'SENDER'        => 'AB_ECU',
               'MESSAGE'       => 'Can_ABECU_2_Diag',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               },
'Diag_Byte_4'  =>
               {
               'SIGNAL_NAME'   => 'Diag_Byte_4',
               'SENDER'        => 'AB_ECU',
               'MESSAGE'       => 'Can_ABECU_2_Diag',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               },
'Diag_Byte_5'  =>
               {
               'SIGNAL_NAME'   => 'Diag_Byte_5',
               'SENDER'        => 'AB_ECU',
               'MESSAGE'       => 'Can_ABECU_2_Diag',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               },
'Diag_Byte_6'  =>
               {
               'SIGNAL_NAME'   => 'Diag_Byte_6',
               'SENDER'        => 'AB_ECU',
               'MESSAGE'       => 'Can_ABECU_2_Diag',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               },
'Diag_Byte_7'  =>
               {
               'SIGNAL_NAME'   => 'Diag_Byte_7',
               'SENDER'        => 'AB_ECU',
               'MESSAGE'       => 'Can_ABECU_2_Diag',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               },
'Diag_Byte_8'  =>
               {
               'SIGNAL_NAME'   => 'Diag_Byte_8',
               'SENDER'        => 'AB_ECU',
               'MESSAGE'       => 'Can_ABECU_2_Diag',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               },

'PD_req_2' =>
               {
               'SIGNAL_NAME'   => 'PD_req_2',  
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'Can_PDiag_2_ABECU',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               },

'CAN_MESSAGES'  => {
       'MLC_A3'  =>
                      {
                        'ID'            => 163,
                        'DLC'           => 6,
                        'SENDER'        => 'MLC',
                        'CAN_BUS_NBR'   => 2,
                        'CYCLE'         => 10,
                      },
       'MLC_A2'  =>
                      {
                        'ID'            => 162,
                        'DLC'           => 6,
                        'SENDER'        => 'MLC',
                        'CAN_BUS_NBR'   => 2,
                        'CYCLE'         => 10,
                      },
       'MLC_A1'  =>
                      {
                        'ID'            => 161,
                        'DLC'           => 6,
                        'SENDER'        => 'MLC',
                        'CAN_BUS_NBR'   => 2,
                        'CYCLE'         => 10,
                      },
       'MLC_A4'  =>
                      {
                        'ID'            => 164,
                        'DLC'           => 6,
                        'SENDER'        => 'MLC',
                        'CAN_BUS_NBR'   => 2,
                        'CYCLE'         => 10,
                      },
       'MLC_110'  =>
                      {
                        'ID'            => 272,
                        'DLC'           => 6,
                        'SENDER'        => 'MLC',
                        'CAN_BUS_NBR'   => 2,
                        'CYCLE'         => 10,
                      },
       'IDX_101'  =>
                      {
                        'ID'            => 257,
                        'DLC'           => 6,
                        'SENDER'        => 'IDX',
                        'CAN_BUS_NBR'   => 2,
                        'CYCLE'         => 10,
                      },
       'IDX_102'  =>
                      {
                        'ID'            => 258,
                        'DLC'           => 6,
                        'SENDER'        => 'IDX',
                        'CAN_BUS_NBR'   => 2,
                        'CYCLE'         => 10,
                      },
       'IDX_201'  =>
                      {
                        'ID'            => 513,
                        'DLC'           => 6,
                        'SENDER'        => 'IDX',
                        'CAN_BUS_NBR'   => 2,
                        'CYCLE'         => 10,
                      },
       'IDX_202'  =>
                      {
                        'ID'            => 514,
                        'DLC'           => 6,
                        'SENDER'        => 'IDX',
                        'CAN_BUS_NBR'   => 2,
                        'CYCLE'         => 10,
                      },

       'MACKSEND1'  =>
                      {
                        'ID'            => 16,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKSEND1To_' ,
                        'CANOE_DLC'     => 'EnvMACKSEND1Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKSEND1Time_' ,
                      },
       'MACKSEND2'  =>
                      {
                        'ID'            => 17,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKSEND2To_' ,
                        'CANOE_DLC'     => 'EnvMACKSEND2Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKSEND2Time_' ,
                      },
       'MACKSEND3'  =>
                      {
                        'ID'            => 18,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKSEND3To_' ,
                        'CANOE_DLC'     => 'EnvMACKSEND3Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKSEND3Time_' ,
                      },
       'MACKSEND4'  =>
                      {
                        'ID'            => 19,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKSEND4To_' ,
                        'CANOE_DLC'     => 'EnvMACKSEND4Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKSEND4Time_' ,
                      },
       'MACKSEND5'  =>
                      {
                        'ID'            => 20,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKSEND5To_' ,
                        'CANOE_DLC'     => 'EnvMACKSEND5Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKSEND5Time_' ,
                      },
       'MACKSEND6'  =>
                      {
                        'ID'            => 21,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKSEND6To_' ,
                        'CANOE_DLC'     => 'EnvMACKSEND6Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKSEND6Time_' ,
                      },
       'MACKSEND7'  =>
                      {
                        'ID'            => 22,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKSEND7To_' ,
                        'CANOE_DLC'     => 'EnvMACKSEND7Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKSEND7Time_' ,
                      },
       'MACKSEND8'  =>
                      {
                        'ID'            => 23,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKSEND8To_' ,
                        'CANOE_DLC'     => 'EnvMACKSEND8Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKSEND8Time_' ,
                      },
       'MACKID_MACKUSAGE'  =>
                      {
                        'ID'            => 24,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKID_MACKUSAGETo_' ,
                        'CANOE_DLC'     => 'EnvMACKID_MACKUSAGEDlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKID_MACKUSAGETime_' ,
                      },
       'MACKVERI1'  =>
                      {
                        'ID'            => 25,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKVERI1To_' ,
                        'CANOE_DLC'     => 'EnvMACKVERI1Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKVERI1Time_' ,
                      },
       'MACKVERI2'  =>
                      {
                        'ID'            => 26,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKVERI2To_' ,
                        'CANOE_DLC'     => 'EnvMACKVERI2Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKVERI2Time_' ,
                      },
       'MACKVERI3'  =>
                      {
                        'ID'            => 27,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKVERI3To_' ,
                        'CANOE_DLC'     => 'EnvMACKVERI3Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKVERI3Time_' ,
                      },
       'MACKVERI4'  =>
                      {
                        'ID'            => 28,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvMACKVERI4To_' ,
                        'CANOE_DLC'     => 'EnvMACKVERI4Dlc_' ,
                        'CANOE_TIMING'  => 'EnvMACKVERI4Time_' ,
                      },
       'CGW_Sync'  =>
                      {
                        'ID'            => 32,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvCGW_SyncTo_' ,
                        'CANOE_DLC'     => 'EnvCGW_SyncDlc_' ,
                        'CANOE_TIMING'  => 'EnvCGW_SyncTime_' ,
                      },
       'RCMStatusMessage_2_MAC'  =>
                      {
                        'ID'            => 74,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvRCMStatusMessage_2_MACTo_' ,
                        'CANOE_DLC'     => 'EnvRCMStatusMessage_2_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCMStatusMessage_2_MACTime_' ,
                      },
       'Push_Start_Status'  =>
                      {
                        'ID'            => 80,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvPush_Start_StatusTo_' ,
                        'CANOE_DLC'     => 'EnvPush_Start_StatusDlc_' ,
                        'CANOE_TIMING'  => 'EnvPush_Start_StatusTime_' ,
                      },
       'RCM_Yaw_Rate_MAC'  =>
                      {
                        'ID'            => 112,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvRCM_Yaw_Rate_MACTo_' ,
                        'CANOE_DLC'     => 'EnvRCM_Yaw_Rate_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCM_Yaw_Rate_MACTime_' ,
                      },
       'RCM_Late_Acc_MAC'  =>
                      {
                        'ID'            => 113,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvRCM_Late_Acc_MACTo_' ,
                        'CANOE_DLC'     => 'EnvRCM_Late_Acc_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCM_Late_Acc_MACTime_' ,
                      },
       'RCM_Long_Acc_MAC'  =>
                      {
                        'ID'            => 114,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvRCM_Long_Acc_MACTo_' ,
                        'CANOE_DLC'     => 'EnvRCM_Long_Acc_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCM_Long_Acc_MACTime_' ,
                      },
       'YAW_Rate_Brake_Control_1_1_MAC'  =>
                      {
                        'ID'            => 115,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvYAW_Rate_Brake_Control_1_1_MACTo_' ,
                        'CANOE_DLC'     => 'EnvYAW_Rate_Brake_Control_1_1_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvYAW_Rate_Brake_Control_1_1_MACTime_' ,
                      },
       'YAW_Rate_Brake_Control_1_2_MAC'  =>
                      {
                        'ID'            => 116,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvYAW_Rate_Brake_Control_1_2_MACTo_' ,
                        'CANOE_DLC'     => 'EnvYAW_Rate_Brake_Control_1_2_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvYAW_Rate_Brake_Control_1_2_MACTime_' ,
                      },
       'YAW_Rate_Brake_Control_2_1_MAC'  =>
                      {
                        'ID'            => 124,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvYAW_Rate_Brake_Control_2_1_MACTo_' ,
                        'CANOE_DLC'     => 'EnvYAW_Rate_Brake_Control_2_1_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvYAW_Rate_Brake_Control_2_1_MACTime_' ,
                      },
       'YAW_Rate_Brake_Control_2_2_MAC'  =>
                      {
                        'ID'            => 125,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvYAW_Rate_Brake_Control_2_2_MACTo_' ,
                        'CANOE_DLC'     => 'EnvYAW_Rate_Brake_Control_2_2_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvYAW_Rate_Brake_Control_2_2_MACTime_' ,
                      },
       'YAW_Rate_Brake_Control'  =>
                      {
                        'ID'            => 126,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvYAW_Rate_Brake_ControlTo_' ,
                        'CANOE_DLC'     => 'EnvYAW_Rate_Brake_ControlDlc_' ,
                        'CANOE_TIMING'  => 'EnvYAW_Rate_Brake_ControlTime_' ,
                      },
       'Steering_Wheel_Angle'  =>
                      {
                        'ID'            => 130,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvSteering_Wheel_AngleTo_' ,
                        'CANOE_DLC'     => 'EnvSteering_Wheel_AngleDlc_' ,
                        'CANOE_TIMING'  => 'EnvSteering_Wheel_AngleTime_' ,
                      },
       'EPAS_SAS_Info_1_MAC'  =>
                      {
                        'ID'            => 132,
                        'DLC'           => 8,
                        'SENDER'        => 'EPAS',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 12,
                        'CANOE_DISABLE' => 'EnvEPAS_SAS_Info_1_MACTo_' ,
                        'CANOE_DLC'     => 'EnvEPAS_SAS_Info_1_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvEPAS_SAS_Info_1_MACTime_' ,
                      },
       'ADAS_SteeringCtrlReq_Data'  =>
                      {
                        'ID'            => 133,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvADAS_SteeringCtrlReq_DataTo_' ,
                        'CANOE_DLC'     => 'EnvADAS_SteeringCtrlReq_DataDlc_' ,
                        'CANOE_TIMING'  => 'EnvADAS_SteeringCtrlReq_DataTime_' ,
                      },
       'EPAS_SAS_Info_2_MAC'  =>
                      {
                        'ID'            => 135,
                        'DLC'           => 8,
                        'SENDER'        => 'EPAS',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 12,
                        'CANOE_DISABLE' => 'EnvEPAS_SAS_Info_2_MACTo_' ,
                        'CANOE_DLC'     => 'EnvEPAS_SAS_Info_2_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvEPAS_SAS_Info_2_MACTime_' ,
                      },
       'ADAS_SteeringCtrl_Data'  =>
                      {
                        'ID'            => 136,
                        'DLC'           => 8,
                        'SENDER'        => 'EPAS',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvADAS_SteeringCtrl_DataTo_' ,
                        'CANOE_DLC'     => 'EnvADAS_SteeringCtrl_DataDlc_' ,
                        'CANOE_TIMING'  => 'EnvADAS_SteeringCtrl_DataTime_' ,
                      },
       'Steering_Column_Switch'  =>
                      {
                        'ID'            => 145,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvSteering_Column_SwitchTo_' ,
                        'CANOE_DLC'     => 'EnvSteering_Column_SwitchDlc_' ,
                        'CANOE_TIMING'  => 'EnvSteering_Column_SwitchTime_' ,
                      },
       'BCM_Information1_MAC'  =>
                      {
                        'ID'            => 146,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvBCM_Information1_MACTo_' ,
                        'CANOE_DLC'     => 'EnvBCM_Information1_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvBCM_Information1_MACTime_' ,
                      },
       'Cruise_Multi_Switch_1_MAC'  =>
                      {
                        'ID'            => 148,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvCruise_Multi_Switch_1_MACTo_' ,
                        'CANOE_DLC'     => 'EnvCruise_Multi_Switch_1_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvCruise_Multi_Switch_1_MACTime_' ,
                      },
       'Cruise_Multi_Switch_2_MAC'  =>
                      {
                        'ID'            => 150,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvCruise_Multi_Switch_2_MACTo_' ,
                        'CANOE_DLC'     => 'EnvCruise_Multi_Switch_2_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvCruise_Multi_Switch_2_MACTime_' ,
                      },
       'WheelData_1_MAC'  =>
                      {
                        'ID'            => 151,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvWheelData_1_MACTo_' ,
                        'CANOE_DLC'     => 'EnvWheelData_1_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvWheelData_1_MACTime_' ,
                      },
       'WheelData_2_MAC'  =>
                      {
                        'ID'            => 152,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvWheelData_2_MACTo_' ,
                        'CANOE_DLC'     => 'EnvWheelData_2_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvWheelData_2_MACTime_' ,
                      },
       'BCM_Information1'  =>
                      {
                        'ID'            => 154,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvBCM_Information1To_' ,
                        'CANOE_DLC'     => 'EnvBCM_Information1Dlc_' ,
                        'CANOE_TIMING'  => 'EnvBCM_Information1Time_' ,
                      },
       'CBCM_IllumStatus'  =>
                      {
                        'ID'            => 159,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 200,
                        'CANOE_DISABLE' => 'EnvCBCM_IllumStatusTo_' ,
                        'CANOE_DLC'     => 'EnvCBCM_IllumStatusDlc_' ,
                        'CANOE_TIMING'  => 'EnvCBCM_IllumStatusTime_' ,
                      },
       'CBCM_DriveSelection_Info'  =>
                      {
                        'ID'            => 192,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 200,
                        'CANOE_DISABLE' => 'EnvCBCM_DriveSelection_InfoTo_' ,
                        'CANOE_DLC'     => 'EnvCBCM_DriveSelection_InfoDlc_' ,
                        'CANOE_TIMING'  => 'EnvCBCM_DriveSelection_InfoTime_' ,
                      },
       'ECM_Status'  =>
                      {
                        'ID'            => 253,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvECM_StatusTo_' ,
                        'CANOE_DLC'     => 'EnvECM_StatusDlc_' ,
                        'CANOE_TIMING'  => 'EnvECM_StatusTime_' ,
                      },
       'SISS_Rqst'  =>
                      {
                        'ID'            => 304,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvSISS_RqstTo_' ,
                        'CANOE_DLC'     => 'EnvSISS_RqstDlc_' ,
                        'CANOE_TIMING'  => 'EnvSISS_RqstTime_' ,
                      },
       'EngControlData'  =>
                      {
                        'ID'            => 357,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvEngControlDataTo_' ,
                        'CANOE_DLC'     => 'EnvEngControlDataDlc_' ,
                        'CANOE_TIMING'  => 'EnvEngControlDataTime_' ,
                      },
       'EngVehicleSpThrottle'  =>
                      {
                        'ID'            => 514,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvEngVehicleSpThrottleTo_' ,
                        'CANOE_DLC'     => 'EnvEngVehicleSpThrottleDlc_' ,
                        'CANOE_TIMING'  => 'EnvEngVehicleSpThrottleTime_' ,
                      },
       'DesiredTorqBrk_MAC'  =>
                      {
                        'ID'            => 520,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvDesiredTorqBrk_MACTo_' ,
                        'CANOE_DLC'     => 'EnvDesiredTorqBrk_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvDesiredTorqBrk_MACTime_' ,
                      },
       'AEB_Longitudinal_Req_Brk_MAC'  =>
                      {
                        'ID'            => 530,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvAEB_Longitudinal_Req_Brk_MACTo_' ,
                        'CANOE_DLC'     => 'EnvAEB_Longitudinal_Req_Brk_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvAEB_Longitudinal_Req_Brk_MACTime_' ,
                      },
       'AEB_Longitudinal_Request_Pt_MAC'  =>
                      {
                        'ID'            => 531,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvAEB_Longitudinal_Request_Pt_MACTo_' ,
                        'CANOE_DLC'     => 'EnvAEB_Longitudinal_Request_Pt_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvAEB_Longitudinal_Request_Pt_MACTime_' ,
                      },
       'ADAS_Longitudinal_Req_Brk_MAC'  =>
                      {
                        'ID'            => 532,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvADAS_Longitudinal_Req_Brk_MACTo_' ,
                        'CANOE_DLC'     => 'EnvADAS_Longitudinal_Req_Brk_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvADAS_Longitudinal_Req_Brk_MACTime_' ,
                      },
       'WheelSpeed'  =>
                      {
                        'ID'            => 533,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvWheelSpeedTo_' ,
                        'CANOE_DLC'     => 'EnvWheelSpeedDlc_' ,
                        'CANOE_TIMING'  => 'EnvWheelSpeedTime_' ,
                      },
       'WheelData2'  =>
                      {
                        'ID'            => 537,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvWheelData2To_' ,
                        'CANOE_DLC'     => 'EnvWheelData2Dlc_' ,
                        'CANOE_TIMING'  => 'EnvWheelData2Time_' ,
                      },
       'TransGearData'  =>
                      {
                        'ID'            => 552,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 20,
                        'CANOE_DISABLE' => 'EnvTransGearDataTo_' ,
                        'CANOE_DLC'     => 'EnvTransGearDataDlc_' ,
                        'CANOE_TIMING'  => 'EnvTransGearDataTime_' ,
                      },
       'EPAS_Info_MAC'  =>
                      {
                        'ID'            => 570,
                        'DLC'           => 8,
                        'SENDER'        => 'EPAS',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 12,
                        'CANOE_DISABLE' => 'EnvEPAS_Info_MACTo_' ,
                        'CANOE_DLC'     => 'EnvEPAS_Info_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvEPAS_Info_MACTime_' ,
                      },
       'EPAS_Info'  =>
                      {
                        'ID'            => 576,
                        'DLC'           => 8,
                        'SENDER'        => 'EPAS',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 12,
                        'CANOE_DISABLE' => 'EnvEPAS_InfoTo_' ,
                        'CANOE_DLC'     => 'EnvEPAS_InfoDlc_' ,
                        'CANOE_TIMING'  => 'EnvEPAS_InfoTime_' ,
                      },
       'SmartKeylessRequest'  =>
                      {
                        'ID'            => 628,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvSmartKeylessRequestTo_' ,
                        'CANOE_DLC'     => 'EnvSmartKeylessRequestDlc_' ,
                        'CANOE_TIMING'  => 'EnvSmartKeylessRequestTime_' ,
                      },
       'crashoutput_MAC'  =>
                      {
                        'ID'            => 830,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'Envcrashoutput_MACTo_' ,
                        'CANOE_DLC'     => 'Envcrashoutput_MACDlc_' ,
                        'CANOE_TIMING'  => 'Envcrashoutput_MACTime_' ,
                      },
       'crashoutput_brk_MAC'  =>
                      {
                        'ID'            => 831,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'Envcrashoutput_brk_MACTo_' ,
                        'CANOE_DLC'     => 'Envcrashoutput_brk_MACDlc_' ,
                        'CANOE_TIMING'  => 'Envcrashoutput_brk_MACTime_' ,
                      },
       'RCMStatusMessage_MAC'  =>
                      {
                        'ID'            => 832,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvRCMStatusMessage_MACTo_' ,
                        'CANOE_DLC'     => 'EnvRCMStatusMessage_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCMStatusMessage_MACTime_' ,
                      },
       'Longitudinal_Lateral_deltaV'  =>
                      {
                        'ID'            => 834,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvLongitudinal_Lateral_deltaVTo_' ,
                        'CANOE_DLC'     => 'EnvLongitudinal_Lateral_deltaVDlc_' ,
                        'CANOE_TIMING'  => 'EnvLongitudinal_Lateral_deltaVTime_' ,
                      },
       'GCC_Config_Mgmt'  =>
                      {
                        'ID'            => 1034,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 50,
                        'CANOE_DISABLE' => 'EnvGCC_Config_MgmtTo_' ,
                        'CANOE_DLC'     => 'EnvGCC_Config_MgmtDlc_' ,
                        'CANOE_TIMING'  => 'EnvGCC_Config_MgmtTime_' ,
                      },
       'BrakeSysFeatures_MAC'  =>
                      {
                        'ID'            => 1044,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvBrakeSysFeatures_MACTo_' ,
                        'CANOE_DLC'     => 'EnvBrakeSysFeatures_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvBrakeSysFeatures_MACTime_' ,
                      },
       'BrakeSysFeatures'  =>
                      {
                        'ID'            => 1045,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvBrakeSysFeaturesTo_' ,
                        'CANOE_DLC'     => 'EnvBrakeSysFeaturesDlc_' ,
                        'CANOE_TIMING'  => 'EnvBrakeSysFeaturesTime_' ,
                      },
       'Hvac_Control_Information2_MAC'  =>
                      {
                        'ID'            => 1066,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 50,
                        'CANOE_DISABLE' => 'EnvHvac_Control_Information2_MACTo_' ,
                        'CANOE_DLC'     => 'EnvHvac_Control_Information2_MACDlc_' ,
                        'CANOE_TIMING'  => 'EnvHvac_Control_Information2_MACTime_' ,
                      },
       'Hvac_Control_Information2'  =>
                      {
                        'ID'            => 1078,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 50,
                        'CANOE_DISABLE' => 'EnvHvac_Control_Information2To_' ,
                        'CANOE_DLC'     => 'EnvHvac_Control_Information2Dlc_' ,
                        'CANOE_TIMING'  => 'EnvHvac_Control_Information2Time_' ,
                      },
       'LocateTime_Info'  =>
                      {
                        'ID'            => 1081,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvLocateTime_InfoTo_' ,
                        'CANOE_DLC'     => 'EnvLocateTime_InfoDlc_' ,
                        'CANOE_TIMING'  => 'EnvLocateTime_InfoTime_' ,
                      },
       'Door_D_Message'  =>
                      {
                        'ID'            => 1088,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 50,
                        'CANOE_DISABLE' => 'EnvDoor_D_MessageTo_' ,
                        'CANOE_DLC'     => 'EnvDoor_D_MessageDlc_' ,
                        'CANOE_TIMING'  => 'EnvDoor_D_MessageTime_' ,
                      },
       'ADAS_HMI_Information1'  =>
                      {
                        'ID'            => 1095,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvADAS_HMI_Information1To_' ,
                        'CANOE_DLC'     => 'EnvADAS_HMI_Information1Dlc_' ,
                        'CANOE_TIMING'  => 'EnvADAS_HMI_Information1Time_' ,
                      },
       'ADAS_HMI_Information4'  =>
                      {
                        'ID'            => 1098,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvADAS_HMI_Information4To_' ,
                        'CANOE_DLC'     => 'EnvADAS_HMI_Information4Dlc_' ,
                        'CANOE_TIMING'  => 'EnvADAS_HMI_Information4Time_' ,
                      },
       'ADAS_HMI_Information5'  =>
                      {
                        'ID'            => 1099,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 100,
                        'CANOE_DISABLE' => 'EnvADAS_HMI_Information5To_' ,
                        'CANOE_DLC'     => 'EnvADAS_HMI_Information5Dlc_' ,
                        'CANOE_TIMING'  => 'EnvADAS_HMI_Information5Time_' ,
                      },
       'RBCM_Information2'  =>
                      {
                        'ID'            => 1120,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 50,
                        'CANOE_DISABLE' => 'EnvRBCM_Information2To_' ,
                        'CANOE_DLC'     => 'EnvRBCM_Information2Dlc_' ,
                        'CANOE_TIMING'  => 'EnvRBCM_Information2Time_' ,
                      },
       'RCMSerialNumber'  =>
                      {
                        'ID'            => 1121,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 1000,
                        'CANOE_DISABLE' => 'EnvRCMSerialNumberTo_' ,
                        'CANOE_DLC'     => 'EnvRCMSerialNumberDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCMSerialNumberTime_' ,
                      },
       'VDT_Trigger_Control2'  =>
                      {
                        'ID'            => 1254,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 1000,
                        'CANOE_DISABLE' => 'EnvVDT_Trigger_Control2To_' ,
                        'CANOE_DLC'     => 'EnvVDT_Trigger_Control2Dlc_' ,
                        'CANOE_TIMING'  => 'EnvVDT_Trigger_Control2Time_' ,
                      },
       'Engine_Conf'  =>
                      {
                        'ID'            => 1264,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 1000,
                        'CANOE_DISABLE' => 'EnvEngine_ConfTo_' ,
                        'CANOE_DLC'     => 'EnvEngine_ConfDlc_' ,
                        'CANOE_TIMING'  => 'EnvEngine_ConfTime_' ,
                      },
       'VDT_RCM_EDR'  =>
                      {
                        'ID'            => 1280,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvVDT_RCM_EDRTo_' ,
                        'CANOE_DLC'     => 'EnvVDT_RCM_EDRDlc_' ,
                        'CANOE_TIMING'  => 'EnvVDT_RCM_EDRTime_' ,
                      },
       'EPAS_Bus_Status'  =>
                      {
                        'ID'            => 1324,
                        'DLC'           => 8,
                        'SENDER'        => 'EPAS',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 500,
                        'CANOE_DISABLE' => 'EnvEPAS_Bus_StatusTo_' ,
                        'CANOE_DLC'     => 'EnvEPAS_Bus_StatusDlc_' ,
                        'CANOE_TIMING'  => 'EnvEPAS_Bus_StatusTime_' ,
                      },
       'RCM_Bus_Status'  =>
                      {
                        'ID'            => 1325,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 500,
                        'CANOE_DISABLE' => 'EnvRCM_Bus_StatusTo_' ,
                        'CANOE_DLC'     => 'EnvRCM_Bus_StatusDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCM_Bus_StatusTime_' ,
                      },
       'CBCM_Autosar_NM'  =>
                      {
                        'ID'            => 1409,
                        'DLC'           => 8,
                        'SENDER'        => 'CGW',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvCBCM_Autosar_NMTo_' ,
                        'CANOE_DLC'     => 'EnvCBCM_Autosar_NMDlc_' ,
                        'CANOE_TIMING'  => 'EnvCBCM_Autosar_NMTime_' ,
                      },
       'ABS_Autosar_NM'  =>
                      {
                        'ID'            => 1430,
                        'DLC'           => 8,
                        'SENDER'        => 'DSC',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvABS_Autosar_NMTo_' ,
                        'CANOE_DLC'     => 'EnvABS_Autosar_NMDlc_' ,
                        'CANOE_TIMING'  => 'EnvABS_Autosar_NMTime_' ,
                      },
       'EPAS_CCP_Rx'  =>
                      {
                        'ID'            => 1542,
                        'DLC'           => 8,
                        'SENDER'        => 'Tester',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvEPAS_CCP_RxTo_' ,
                        'CANOE_DLC'     => 'EnvEPAS_CCP_RxDlc_' ,
                        'CANOE_TIMING'  => 'EnvEPAS_CCP_RxTime_' ,
                      },
       'EPAS_CCP_Tx'  =>
                      {
                        'ID'            => 1543,
                        'DLC'           => 8,
                        'SENDER'        => 'EPAS',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvEPAS_CCP_TxTo_' ,
                        'CANOE_DLC'     => 'EnvEPAS_CCP_TxDlc_' ,
                        'CANOE_TIMING'  => 'EnvEPAS_CCP_TxTime_' ,
                      },
       'EPAS_Diag_Rx'  =>
                      {
                        'ID'            => 1840,
                        'DLC'           => 8,
                        'SENDER'        => 'Tester',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvEPAS_Diag_RxTo_' ,
                        'CANOE_DLC'     => 'EnvEPAS_Diag_RxDlc_' ,
                        'CANOE_TIMING'  => 'EnvEPAS_Diag_RxTime_' ,
                      },
       'RCM_Diag_Rx'  =>
                      {
                        'ID'            => 1847,
                        'DLC'           => 8,
                        'SENDER'        => 'Tester',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvRCM_Diag_RxTo_' ,
                        'CANOE_DLC'     => 'EnvRCM_Diag_RxDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCM_Diag_RxTime_' ,
                      },
       'EPAS_Diag_Tx'  =>
                      {
                        'ID'            => 1848,
                        'DLC'           => 8,
                        'SENDER'        => 'EPAS',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvEPAS_Diag_TxTo_' ,
                        'CANOE_DLC'     => 'EnvEPAS_Diag_TxDlc_' ,
                        'CANOE_TIMING'  => 'EnvEPAS_Diag_TxTime_' ,
                      },
       'RCM_Diag_Tx'  =>
                      {
                        'ID'            => 1855,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvRCM_Diag_TxTo_' ,
                        'CANOE_DLC'     => 'EnvRCM_Diag_TxDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCM_Diag_TxTime_' ,
                      },
       'Functional_Diag_Request'  =>
                      {
                        'ID'            => 2015,
                        'DLC'           => 8,
                        'SENDER'        => 'Tester',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvFunctional_Diag_RequestTo_' ,
                        'CANOE_DLC'     => 'EnvFunctional_Diag_RequestDlc_' ,
                        'CANOE_TIMING'  => 'EnvFunctional_Diag_RequestTime_' ,
                      },
       'RCM_ISO_SCRAP_Rx'  =>
                      {
                        'ID'            => 2033,
                        'DLC'           => 8,
                        'SENDER'        => 'Tester',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvRCM_ISO_SCRAP_RxTo_' ,
                        'CANOE_DLC'     => 'EnvRCM_ISO_SCRAP_RxDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCM_ISO_SCRAP_RxTime_' ,
                      },
       'RCM_ISO_SCRAP_Tx'  =>
                      {
                        'ID'            => 2041,
                        'DLC'           => 8,
                        'SENDER'        => 'RCM',
                        'CAN_BUS_NBR'   => 1,
                        'CYCLE'         => 10,
                        'CANOE_DISABLE' => 'EnvRCM_ISO_SCRAP_TxTo_' ,
                        'CANOE_DLC'     => 'EnvRCM_ISO_SCRAP_TxDlc_' ,
                        'CANOE_TIMING'  => 'EnvRCM_ISO_SCRAP_TxTime_' ,
                      },
           },

############################################# 

## --- Signal List (msg by msg , IDs ascending) of System under Test node 

############################################# 

## Signal List (msg by msg , IDs ascending) from Simulator 

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKSEND1 (CGW) ID: 16 (0x10), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKSEND1_1' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND1_1',      'CANOE_ENV_VAR' => 'EnvMACKSEND1_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND1_1.MACKSEND1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND1_1.MACKSEND1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKSEND1_2' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND1_2',      'CANOE_ENV_VAR' => 'EnvMACKSEND1_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND1_2.MACKSEND1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND1_2.MACKSEND1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKSEND2 (CGW) ID: 17 (0x11), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKSEND2_1' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND2_1',      'CANOE_ENV_VAR' => 'EnvMACKSEND2_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND2_1.MACKSEND2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND2_1.MACKSEND2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKSEND2_2' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND2_2',      'CANOE_ENV_VAR' => 'EnvMACKSEND2_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND2_2.MACKSEND2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND2_2.MACKSEND2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKSEND3 (CGW) ID: 18 (0x12), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKSEND3_1' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND3_1',      'CANOE_ENV_VAR' => 'EnvMACKSEND3_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND3',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND3_1.MACKSEND3.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND3_1.MACKSEND3.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKSEND3_2' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND3_2',      'CANOE_ENV_VAR' => 'EnvMACKSEND3_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND3',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND3_2.MACKSEND3.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND3_2.MACKSEND3.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKSEND4 (CGW) ID: 19 (0x13), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKSEND4_1' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND4_1',      'CANOE_ENV_VAR' => 'EnvMACKSEND4_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND4_1.MACKSEND4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND4_1.MACKSEND4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKSEND4_2' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND4_2',      'CANOE_ENV_VAR' => 'EnvMACKSEND4_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND4_2.MACKSEND4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND4_2.MACKSEND4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKSEND5 (CGW) ID: 20 (0x14), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKSEND5_1' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND5_1',      'CANOE_ENV_VAR' => 'EnvMACKSEND5_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND5_1.MACKSEND5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND5_1.MACKSEND5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKSEND5_2' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND5_2',      'CANOE_ENV_VAR' => 'EnvMACKSEND5_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND5_2.MACKSEND5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND5_2.MACKSEND5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKSEND6 (CGW) ID: 21 (0x15), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKSEND6_1' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND6_1',      'CANOE_ENV_VAR' => 'EnvMACKSEND6_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND6',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND6_1.MACKSEND6.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND6_1.MACKSEND6.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKSEND6_2' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND6_2',      'CANOE_ENV_VAR' => 'EnvMACKSEND6_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND6',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND6_2.MACKSEND6.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND6_2.MACKSEND6.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKSEND7 (CGW) ID: 22 (0x16), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKSEND7_1' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND7_1',      'CANOE_ENV_VAR' => 'EnvMACKSEND7_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND7',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND7_1.MACKSEND7.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND7_1.MACKSEND7.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKSEND7_2' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND7_2',      'CANOE_ENV_VAR' => 'EnvMACKSEND7_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND7',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND7_2.MACKSEND7.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND7_2.MACKSEND7.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKSEND8 (CGW) ID: 23 (0x17), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKSEND8_1' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND8_1',      'CANOE_ENV_VAR' => 'EnvMACKSEND8_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND8',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND8_1.MACKSEND8.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND8_1.MACKSEND8.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKSEND8_2' =>
               {
               'SIGNAL_NAME'   => 'MACKSEND8_2',      'CANOE_ENV_VAR' => 'EnvMACKSEND8_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKSEND8',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKSEND8_2.MACKSEND8.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKSEND8_2.MACKSEND8.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKID_MACKUSAGE (CGW) ID: 24 (0x18), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKID' =>
               {
               'SIGNAL_NAME'   => 'MACKID',      'CANOE_ENV_VAR' => 'EnvMACKID_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKID_MACKUSAGE',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKID.MACKID_MACKUSAGE.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKID.MACKID_MACKUSAGE.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKUSAGE' =>
               {
               'SIGNAL_NAME'   => 'MACKUSAGE',      'CANOE_ENV_VAR' => 'EnvMACKUSAGE_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKID_MACKUSAGE',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKUSAGE.MACKID_MACKUSAGE.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKUSAGE.MACKID_MACKUSAGE.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKVERI1 (CGW) ID: 25 (0x19), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKVERI1_1' =>
               {
               'SIGNAL_NAME'   => 'MACKVERI1_1',      'CANOE_ENV_VAR' => 'EnvMACKVERI1_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKVERI1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKVERI1_1.MACKVERI1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKVERI1_1.MACKVERI1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKVERI1_2' =>
               {
               'SIGNAL_NAME'   => 'MACKVERI1_2',      'CANOE_ENV_VAR' => 'EnvMACKVERI1_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKVERI1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKVERI1_2.MACKVERI1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKVERI1_2.MACKVERI1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKVERI2 (CGW) ID: 26 (0x1a), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKVERI2_1' =>
               {
               'SIGNAL_NAME'   => 'MACKVERI2_1',      'CANOE_ENV_VAR' => 'EnvMACKVERI2_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKVERI2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKVERI2_1.MACKVERI2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKVERI2_1.MACKVERI2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKVERI2_2' =>
               {
               'SIGNAL_NAME'   => 'MACKVERI2_2',      'CANOE_ENV_VAR' => 'EnvMACKVERI2_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKVERI2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKVERI2_2.MACKVERI2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKVERI2_2.MACKVERI2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKVERI3 (CGW) ID: 27 (0x1b), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKVERI3_1' =>
               {
               'SIGNAL_NAME'   => 'MACKVERI3_1',      'CANOE_ENV_VAR' => 'EnvMACKVERI3_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKVERI3',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKVERI3_1.MACKVERI3.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKVERI3_1.MACKVERI3.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKVERI3_2' =>
               {
               'SIGNAL_NAME'   => 'MACKVERI3_2',      'CANOE_ENV_VAR' => 'EnvMACKVERI3_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKVERI3',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKVERI3_2.MACKVERI3.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKVERI3_2.MACKVERI3.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: MACKVERI4 (CGW) ID: 28 (0x1c), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'MACKVERI4_1' =>
               {
               'SIGNAL_NAME'   => 'MACKVERI4_1',      'CANOE_ENV_VAR' => 'EnvMACKVERI4_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKVERI4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKVERI4_1.MACKVERI4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKVERI4_1.MACKVERI4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MACKVERI4_2' =>
               {
               'SIGNAL_NAME'   => 'MACKVERI4_2',      'CANOE_ENV_VAR' => 'EnvMACKVERI4_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'MACKVERI4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 32, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MACKVERI4_2.MACKVERI4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MACKVERI4_2.MACKVERI4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: CGW_Sync (CGW) ID: 32 (0x20), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'CGW_Sync_MACTx' =>
               {
               'SIGNAL_NAME'   => 'CGW_Sync_MACTx',      'CANOE_ENV_VAR' => 'EnvCGW_Sync_MACTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CGW_Sync',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_Sync_MACTx.CGW_Sync.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_Sync_MACTx.CGW_Sync.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CGW_Sync_ResetCnt' =>
               {
               'SIGNAL_NAME'   => 'CGW_Sync_ResetCnt',      'CANOE_ENV_VAR' => 'EnvCGW_Sync_ResetCnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CGW_Sync',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 20, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_Sync_ResetCnt.CGW_Sync.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_Sync_ResetCnt.CGW_Sync.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CGW_Sync_TripCnt' =>
               {
               'SIGNAL_NAME'   => 'CGW_Sync_TripCnt',      'CANOE_ENV_VAR' => 'EnvCGW_Sync_TripCnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CGW_Sync',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 16, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_Sync_TripCnt.CGW_Sync.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_Sync_TripCnt.CGW_Sync.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCMStatusMessage_2_MAC (RCM) ID: 74 (0x4a), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'RCMStatusMessage_2_FVTx' =>
               {
               'SIGNAL_NAME'   => 'RCMStatusMessage_2_FVTx',      'CANOE_ENV_VAR' => 'EnvRCMStatusMessage_2_FVTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMStatusMessage_2_FVTx.RCMStatusMessage_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMStatusMessage_2_FVTx.RCMStatusMessage_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCMStatusMessage_2_MACTx' =>
               {
               'SIGNAL_NAME'   => 'RCMStatusMessage_2_MACTx',      'CANOE_ENV_VAR' => 'EnvRCMStatusMessage_2_MACTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMStatusMessage_2_MACTx.RCMStatusMessage_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMStatusMessage_2_MACTx.RCMStatusMessage_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_over_fst' =>
               {
               'SIGNAL_NAME'   => 'threshold_over_fst',      'CANOE_ENV_VAR' => 'Envthreshold_over_fst_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_over_fst.RCMStatusMessage_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_over_fst.RCMStatusMessage_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Push_Start_Status (CGW) ID: 80 (0x50), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AutoP_Request' =>
               {
               'SIGNAL_NAME'   => 'AutoP_Request',      'CANOE_ENV_VAR' => 'EnvAutoP_Request_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Push_Start_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AutoP_Request.Push_Start_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AutoP_Request.Push_Start_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Clutch_Cut_Switch_Status' =>
               {
               'SIGNAL_NAME'   => 'Clutch_Cut_Switch_Status',      'CANOE_ENV_VAR' => 'EnvClutch_Cut_Switch_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Push_Start_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 25, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Clutch_Cut_Switch_Status.Push_Start_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Clutch_Cut_Switch_Status.Push_Start_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CrankStat_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'CrankStat_B_Actl',      'CANOE_ENV_VAR' => 'EnvCrankStat_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Push_Start_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CrankStat_B_Actl.Push_Start_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CrankStat_B_Actl.Push_Start_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'IG_OFF_Delay_State' =>
               {
               'SIGNAL_NAME'   => 'IG_OFF_Delay_State',      'CANOE_ENV_VAR' => 'EnvIG_OFF_Delay_State_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Push_Start_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'IG_OFF_Delay_State.Push_Start_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'IG_OFF_Delay_State.Push_Start_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'IG_mode' =>
               {
               'SIGNAL_NAME'   => 'IG_mode',      'CANOE_ENV_VAR' => 'EnvIG_mode_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Push_Start_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'IG_mode.Push_Start_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'IG_mode.Push_Start_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PowerCon_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'PowerCon_No_Cs',      'CANOE_ENV_VAR' => 'EnvPowerCon_No_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Push_Start_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PowerCon_No_Cs.Push_Start_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PowerCon_No_Cs.Push_Start_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PowerControlStatus' =>
               {
               'SIGNAL_NAME'   => 'PowerControlStatus',      'CANOE_ENV_VAR' => 'EnvPowerControlStatus_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Push_Start_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PowerControlStatus.Push_Start_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PowerControlStatus.Push_Start_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SKE_IR_Request' =>
               {
               'SIGNAL_NAME'   => 'SKE_IR_Request',      'CANOE_ENV_VAR' => 'EnvSKE_IR_Request_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Push_Start_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 28, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SKE_IR_Request.Push_Start_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SKE_IR_Request.Push_Start_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SKE_SISS_Mode' =>
               {
               'SIGNAL_NAME'   => 'SKE_SISS_Mode',      'CANOE_ENV_VAR' => 'EnvSKE_SISS_Mode_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Push_Start_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SKE_SISS_Mode.Push_Start_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SKE_SISS_Mode.Push_Start_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SKE_SISS_Status' =>
               {
               'SIGNAL_NAME'   => 'SKE_SISS_Status',      'CANOE_ENV_VAR' => 'EnvSKE_SISS_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Push_Start_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SKE_SISS_Status.Push_Start_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SKE_SISS_Status.Push_Start_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCM_Yaw_Rate_MAC (RCM) ID: 112 (0x70), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ID070_E2E_CNTProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID070_E2E_CNTProfile2',      'CANOE_ENV_VAR' => 'EnvID070_E2E_CNTProfile2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Yaw_Rate_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID070_E2E_CNTProfile2.RCM_Yaw_Rate_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID070_E2E_CNTProfile2.RCM_Yaw_Rate_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID070_E2E_CRCProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID070_E2E_CRCProfile2',      'CANOE_ENV_VAR' => 'EnvID070_E2E_CRCProfile2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Yaw_Rate_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID070_E2E_CRCProfile2.RCM_Yaw_Rate_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID070_E2E_CRCProfile2.RCM_Yaw_Rate_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCM_Yaw_Rate_FVTx' =>
               {
               'SIGNAL_NAME'   => 'RCM_Yaw_Rate_FVTx',      'CANOE_ENV_VAR' => 'EnvRCM_Yaw_Rate_FVTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Yaw_Rate_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCM_Yaw_Rate_FVTx.RCM_Yaw_Rate_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCM_Yaw_Rate_FVTx.RCM_Yaw_Rate_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCM_Yaw_Rate_MACTx' =>
               {
               'SIGNAL_NAME'   => 'RCM_Yaw_Rate_MACTx',      'CANOE_ENV_VAR' => 'EnvRCM_Yaw_Rate_MACTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Yaw_Rate_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCM_Yaw_Rate_MACTx.RCM_Yaw_Rate_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCM_Yaw_Rate_MACTx.RCM_Yaw_Rate_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Signal_State_Yaw_Rate' =>
               {
               'SIGNAL_NAME'   => 'Signal_State_Yaw_Rate',      'CANOE_ENV_VAR' => 'EnvSignal_State_Yaw_Rate_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Yaw_Rate_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Signal_State_Yaw_Rate.RCM_Yaw_Rate_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Signal_State_Yaw_Rate.RCM_Yaw_Rate_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Yaw_Rate' =>
               {
               'SIGNAL_NAME'   => 'Yaw_Rate',      'CANOE_ENV_VAR' => 'EnvYaw_Rate_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Yaw_Rate_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 16, 'OFFSET' => -180.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'deg/sec',
               'LC_READ_PHYS'  => 'Yaw_Rate.RCM_Yaw_Rate_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Yaw_Rate.RCM_Yaw_Rate_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCM_Late_Acc_MAC (RCM) ID: 113 (0x71), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ID071_E2E_CNTProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID071_E2E_CNTProfile2',      'CANOE_ENV_VAR' => 'EnvID071_E2E_CNTProfile2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Late_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID071_E2E_CNTProfile2.RCM_Late_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID071_E2E_CNTProfile2.RCM_Late_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID071_E2E_CRCProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID071_E2E_CRCProfile2',      'CANOE_ENV_VAR' => 'EnvID071_E2E_CRCProfile2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Late_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID071_E2E_CRCProfile2.RCM_Late_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID071_E2E_CRCProfile2.RCM_Late_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Lateral_Acceleration' =>
               {
               'SIGNAL_NAME'   => 'Lateral_Acceleration',      'CANOE_ENV_VAR' => 'EnvLateral_Acceleration_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Late_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 16, 'OFFSET' => -2.000000, 'FACTOR' => 0.001000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'g',
               'LC_READ_PHYS'  => 'Lateral_Acceleration.RCM_Late_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Lateral_Acceleration.RCM_Late_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCM_Late_Acc_FVTx' =>
               {
               'SIGNAL_NAME'   => 'RCM_Late_Acc_FVTx',      'CANOE_ENV_VAR' => 'EnvRCM_Late_Acc_FVTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Late_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCM_Late_Acc_FVTx.RCM_Late_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCM_Late_Acc_FVTx.RCM_Late_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCM_Late_Acc_MACTx' =>
               {
               'SIGNAL_NAME'   => 'RCM_Late_Acc_MACTx',      'CANOE_ENV_VAR' => 'EnvRCM_Late_Acc_MACTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Late_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCM_Late_Acc_MACTx.RCM_Late_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCM_Late_Acc_MACTx.RCM_Late_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Signal_State_Lateral_Acceleratio' =>
               {
               'SIGNAL_NAME'   => 'Signal_State_Lateral_Acceleratio',      'CANOE_ENV_VAR' => 'EnvSignal_State_Lateral_Acceleratio_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Late_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Signal_State_Lateral_Acceleratio.RCM_Late_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Signal_State_Lateral_Acceleratio.RCM_Late_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCM_Long_Acc_MAC (RCM) ID: 114 (0x72), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ID072_E2E_CNTProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID072_E2E_CNTProfile2',      'CANOE_ENV_VAR' => 'EnvID072_E2E_CNTProfile2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Long_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID072_E2E_CNTProfile2.RCM_Long_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID072_E2E_CNTProfile2.RCM_Long_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID072_E2E_CRCProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID072_E2E_CRCProfile2',      'CANOE_ENV_VAR' => 'EnvID072_E2E_CRCProfile2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Long_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID072_E2E_CRCProfile2.RCM_Long_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID072_E2E_CRCProfile2.RCM_Long_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Longitudinal_Acceleration' =>
               {
               'SIGNAL_NAME'   => 'Longitudinal_Acceleration',      'CANOE_ENV_VAR' => 'EnvLongitudinal_Acceleration_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Long_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 16, 'OFFSET' => -2.000000, 'FACTOR' => 0.001000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'g',
               'LC_READ_PHYS'  => 'Longitudinal_Acceleration.RCM_Long_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Longitudinal_Acceleration.RCM_Long_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCM_Long_Acc_FVTx' =>
               {
               'SIGNAL_NAME'   => 'RCM_Long_Acc_FVTx',      'CANOE_ENV_VAR' => 'EnvRCM_Long_Acc_FVTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Long_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCM_Long_Acc_FVTx.RCM_Long_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCM_Long_Acc_FVTx.RCM_Long_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCM_Long_Acc_MACTx' =>
               {
               'SIGNAL_NAME'   => 'RCM_Long_Acc_MACTx',      'CANOE_ENV_VAR' => 'EnvRCM_Long_Acc_MACTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Long_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCM_Long_Acc_MACTx.RCM_Long_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCM_Long_Acc_MACTx.RCM_Long_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Signal_State_Longitudinal_Accele' =>
               {
               'SIGNAL_NAME'   => 'Signal_State_Longitudinal_Accele',      'CANOE_ENV_VAR' => 'EnvSignal_State_Longitudinal_Accele_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Long_Acc_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Signal_State_Longitudinal_Accele.RCM_Long_Acc_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Signal_State_Longitudinal_Accele.RCM_Long_Acc_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: YAW_Rate_Brake_Control_1_1_MAC (DSC) ID: 115 (0x73), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'StopLamp_D_RqArb' =>
               {
               'SIGNAL_NAME'   => 'StopLamp_D_RqArb',      'CANOE_ENV_VAR' => 'EnvStopLamp_D_RqArb_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'StopLamp_D_RqArb.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'StopLamp_D_RqArb.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' , 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehLongAActl_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'VehLongAActl_D_Qf',      'CANOE_ENV_VAR' => 'EnvVehLongAActl_D_Qf_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehLongAActl_D_Qf.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehLongAActl_D_Qf.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehLong_A_Actl' =>
               {
               'SIGNAL_NAME'   => 'VehLong_A_Actl',      'CANOE_ENV_VAR' => 'EnvVehLong_A_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 13, 'OFFSET' => -40.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'm/s^2',
               'LC_READ_PHYS'  => 'VehLong_A_Actl.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehLong_A_Actl.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00111111' , 1 => '0b11111110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehSensSig_1_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'VehSensSig_1_No_Cnt',      'CANOE_ENV_VAR' => 'EnvVehSensSig_1_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehSensSig_1_No_Cnt.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehSensSig_1_No_Cnt.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehSensSig_1_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'VehSensSig_1_No_Cs',      'CANOE_ENV_VAR' => 'EnvVehSensSig_1_No_Cs_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehSensSig_1_No_Cs.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehSensSig_1_No_Cs.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'YAW_Rate_Brake_Control_1_1_FVTx' =>
               {
               'SIGNAL_NAME'   => 'YAW_Rate_Brake_Control_1_1_FVTx',      'CANOE_ENV_VAR' => 'EnvYAW_Rate_Brake_Control_1_1_FVTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'YAW_Rate_Brake_Control_1_1_FVTx.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'YAW_Rate_Brake_Control_1_1_FVTx.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'YAW_Rate_Brake_Control_1_1_MACTx' =>
               {
               'SIGNAL_NAME'   => 'YAW_Rate_Brake_Control_1_1_MACTx',      'CANOE_ENV_VAR' => 'EnvYAW_Rate_Brake_Control_1_1_MACTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'YAW_Rate_Brake_Control_1_1_MACTx.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'YAW_Rate_Brake_Control_1_1_MACTx.YAW_Rate_Brake_Control_1_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: YAW_Rate_Brake_Control_1_2_MAC (DSC) ID: 116 (0x74), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'BrkMstAActl_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'BrkMstAActl_D_Qf',      'CANOE_ENV_VAR' => 'EnvBrkMstAActl_D_Qf_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrkMstAActl_D_Qf.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrkMstAActl_D_Qf.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrkMstPrs_A_Actl' =>
               {
               'SIGNAL_NAME'   => 'BrkMstPrs_A_Actl',      'CANOE_ENV_VAR' => 'EnvBrkMstPrs_A_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 13, 'OFFSET' => -5.000000, 'FACTOR' => 0.032768,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'MPa',
               'LC_READ_PHYS'  => 'BrkMstPrs_A_Actl.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrkMstPrs_A_Actl.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SlaCtl_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'SlaCtl_D_Actl',      'CANOE_ENV_VAR' => 'EnvSlaCtl_D_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SlaCtl_D_Actl.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SlaCtl_D_Actl.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' , 2 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehSensSig_2_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'VehSensSig_2_No_Cnt',      'CANOE_ENV_VAR' => 'EnvVehSensSig_2_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehSensSig_2_No_Cnt.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehSensSig_2_No_Cnt.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehSensSig_2_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'VehSensSig_2_No_Cs',      'CANOE_ENV_VAR' => 'EnvVehSensSig_2_No_Cs_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehSensSig_2_No_Cs.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehSensSig_2_No_Cs.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'YAW_Rate_Brake_Control_1_2_FVTx' =>
               {
               'SIGNAL_NAME'   => 'YAW_Rate_Brake_Control_1_2_FVTx',      'CANOE_ENV_VAR' => 'EnvYAW_Rate_Brake_Control_1_2_FVTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'YAW_Rate_Brake_Control_1_2_FVTx.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'YAW_Rate_Brake_Control_1_2_FVTx.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'YAW_Rate_Brake_Control_1_2_MACTx' =>
               {
               'SIGNAL_NAME'   => 'YAW_Rate_Brake_Control_1_2_MACTx',      'CANOE_ENV_VAR' => 'EnvYAW_Rate_Brake_Control_1_2_MACTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_1_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'YAW_Rate_Brake_Control_1_2_MACTx.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'YAW_Rate_Brake_Control_1_2_MACTx.YAW_Rate_Brake_Control_1_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: YAW_Rate_Brake_Control_2_1_MAC (DSC) ID: 124 (0x7c), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'HydraulicHoldCtl_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'HydraulicHoldCtl_D_Actl',      'CANOE_ENV_VAR' => 'EnvHydraulicHoldCtl_D_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HydraulicHoldCtl_D_Actl.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HydraulicHoldCtl_D_Actl.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' , 2 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehLatAActl_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'VehLatAActl_D_Qf',      'CANOE_ENV_VAR' => 'EnvVehLatAActl_D_Qf_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehLatAActl_D_Qf.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehLatAActl_D_Qf.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehLat_A_Actl' =>
               {
               'SIGNAL_NAME'   => 'VehLat_A_Actl',      'CANOE_ENV_VAR' => 'EnvVehLat_A_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 13, 'OFFSET' => -40.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'm/s^2',
               'LC_READ_PHYS'  => 'VehLat_A_Actl.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehLat_A_Actl.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00111111' , 1 => '0b11111110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehSensSig2_1_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'VehSensSig2_1_No_Cnt',      'CANOE_ENV_VAR' => 'EnvVehSensSig2_1_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehSensSig2_1_No_Cnt.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehSensSig2_1_No_Cnt.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehSensSig2_1_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'VehSensSig2_1_No_Cs',      'CANOE_ENV_VAR' => 'EnvVehSensSig2_1_No_Cs_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehSensSig2_1_No_Cs.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehSensSig2_1_No_Cs.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'YAW_Rate_Brake_Control_2_1_FVTx' =>
               {
               'SIGNAL_NAME'   => 'YAW_Rate_Brake_Control_2_1_FVTx',      'CANOE_ENV_VAR' => 'EnvYAW_Rate_Brake_Control_2_1_FVTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'YAW_Rate_Brake_Control_2_1_FVTx.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'YAW_Rate_Brake_Control_2_1_FVTx.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'YAW_Rate_Brake_Control_2_1_MACTx' =>
               {
               'SIGNAL_NAME'   => 'YAW_Rate_Brake_Control_2_1_MACTx',      'CANOE_ENV_VAR' => 'EnvYAW_Rate_Brake_Control_2_1_MACTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'YAW_Rate_Brake_Control_2_1_MACTx.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'YAW_Rate_Brake_Control_2_1_MACTx.YAW_Rate_Brake_Control_2_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: YAW_Rate_Brake_Control_2_2_MAC (DSC) ID: 125 (0x7d), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'VehSensSig2_2_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'VehSensSig2_2_No_Cnt',      'CANOE_ENV_VAR' => 'EnvVehSensSig2_2_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehSensSig2_2_No_Cnt.YAW_Rate_Brake_Control_2_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehSensSig2_2_No_Cnt.YAW_Rate_Brake_Control_2_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehSensSig2_2_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'VehSensSig2_2_No_Cs',      'CANOE_ENV_VAR' => 'EnvVehSensSig2_2_No_Cs_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehSensSig2_2_No_Cs.YAW_Rate_Brake_Control_2_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehSensSig2_2_No_Cs.YAW_Rate_Brake_Control_2_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehYawComp_W_Actl_2' =>
               {
               'SIGNAL_NAME'   => 'VehYawComp_W_Actl_2',      'CANOE_ENV_VAR' => 'EnvVehYawComp_W_Actl_2_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 12, 'OFFSET' => -74.981610, 'FACTOR' => 0.036630,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'degrees/second',
               'LC_READ_PHYS'  => 'VehYawComp_W_Actl_2.YAW_Rate_Brake_Control_2_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehYawComp_W_Actl_2.YAW_Rate_Brake_Control_2_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'YAW_Rate_Brake_Control_2_2_FVTx' =>
               {
               'SIGNAL_NAME'   => 'YAW_Rate_Brake_Control_2_2_FVTx',      'CANOE_ENV_VAR' => 'EnvYAW_Rate_Brake_Control_2_2_FVTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'YAW_Rate_Brake_Control_2_2_FVTx.YAW_Rate_Brake_Control_2_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'YAW_Rate_Brake_Control_2_2_FVTx.YAW_Rate_Brake_Control_2_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'YAW_Rate_Brake_Control_2_2_MACTx' =>
               {
               'SIGNAL_NAME'   => 'YAW_Rate_Brake_Control_2_2_MACTx',      'CANOE_ENV_VAR' => 'EnvYAW_Rate_Brake_Control_2_2_MACTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control_2_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'YAW_Rate_Brake_Control_2_2_MACTx.YAW_Rate_Brake_Control_2_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'YAW_Rate_Brake_Control_2_2_MACTx.YAW_Rate_Brake_Control_2_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: YAW_Rate_Brake_Control (DSC) ID: 126 (0x7e), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'DYC_StatusFlag' =>
               {
               'SIGNAL_NAME'   => 'DYC_StatusFlag',      'CANOE_ENV_VAR' => 'EnvDYC_StatusFlag_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DYC_StatusFlag.YAW_Rate_Brake_Control.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DYC_StatusFlag.YAW_Rate_Brake_Control.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Normal_Req_DSC' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Normal_Req_DSC',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Normal_Req_DSC_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Normal_Req_DSC.YAW_Rate_Brake_Control.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Normal_Req_DSC.YAW_Rate_Brake_Control.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_OffRoad_Req_DSC' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_OffRoad_Req_DSC',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_OffRoad_Req_DSC_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 37, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_OffRoad_Req_DSC.YAW_Rate_Brake_Control.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_OffRoad_Req_DSC.YAW_Rate_Brake_Control.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Towing_Req_DSC' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Towing_Req_DSC',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Towing_Req_DSC_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Towing_Req_DSC.YAW_Rate_Brake_Control.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Towing_Req_DSC.YAW_Rate_Brake_Control.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HlaCtl_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'HlaCtl_D_Actl',      'CANOE_ENV_VAR' => 'EnvHlaCtl_D_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HlaCtl_D_Actl.YAW_Rate_Brake_Control.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HlaCtl_D_Actl.YAW_Rate_Brake_Control.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VacRelativePres' =>
               {
               'SIGNAL_NAME'   => 'VacRelativePres',      'CANOE_ENV_VAR' => 'EnvVacRelativePres_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 10, 'OFFSET' => -100.000000, 'FACTOR' => 0.100000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Kpa',
               'LC_READ_PHYS'  => 'VacRelativePres.YAW_Rate_Brake_Control.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VacRelativePres.YAW_Rate_Brake_Control.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' , 3 => '0b11111100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VacRelativePres_QF' =>
               {
               'SIGNAL_NAME'   => 'VacRelativePres_QF',      'CANOE_ENV_VAR' => 'EnvVacRelativePres_QF_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 25, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VacRelativePres_QF.YAW_Rate_Brake_Control.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VacRelativePres_QF.YAW_Rate_Brake_Control.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehYawComp_W_Actl_1' =>
               {
               'SIGNAL_NAME'   => 'VehYawComp_W_Actl_1',      'CANOE_ENV_VAR' => 'EnvVehYawComp_W_Actl_1_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 12, 'OFFSET' => -74.981610, 'FACTOR' => 0.036630,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'degrees/second',
               'LC_READ_PHYS'  => 'VehYawComp_W_Actl_1.YAW_Rate_Brake_Control.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehYawComp_W_Actl_1.YAW_Rate_Brake_Control.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'YAW_Rate_Brake_Control_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'YAW_Rate_Brake_Control_No_Cnt',      'CANOE_ENV_VAR' => 'EnvYAW_Rate_Brake_Control_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 51, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'YAW_Rate_Brake_Control_No_Cnt.YAW_Rate_Brake_Control.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'YAW_Rate_Brake_Control_No_Cnt.YAW_Rate_Brake_Control.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'YAW_Rate_Brake_Control_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'YAW_Rate_Brake_Control_No_Cs',      'CANOE_ENV_VAR' => 'EnvYAW_Rate_Brake_Control_No_Cs_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'YAW_Rate_Brake_Control',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'YAW_Rate_Brake_Control_No_Cs.YAW_Rate_Brake_Control.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'YAW_Rate_Brake_Control_No_Cs.YAW_Rate_Brake_Control.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Steering_Wheel_Angle (CGW) ID: 130 (0x82), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'SteWhlAn_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'SteWhlAn_No_Cnt',      'CANOE_ENV_VAR' => 'EnvSteWhlAn_No_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Wheel_Angle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Counts',
               'LC_READ_PHYS'  => 'SteWhlAn_No_Cnt.Steering_Wheel_Angle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteWhlAn_No_Cnt.Steering_Wheel_Angle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteWhlAn_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'SteWhlAn_No_Cs',      'CANOE_ENV_VAR' => 'EnvSteWhlAn_No_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Wheel_Angle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteWhlAn_No_Cs.Steering_Wheel_Angle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteWhlAn_No_Cs.Steering_Wheel_Angle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteWhlRelCalib_An_Sns' =>
               {
               'SIGNAL_NAME'   => 'SteWhlRelCalib_An_Sns',      'CANOE_ENV_VAR' => 'EnvSteWhlRelCalib_An_Sns_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Wheel_Angle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 15, 'OFFSET' => -1600.000000, 'FACTOR' => 0.100000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Deg',
               'LC_READ_PHYS'  => 'SteWhlRelCalib_An_Sns.Steering_Wheel_Angle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteWhlRelCalib_An_Sns.Steering_Wheel_Angle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11111110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteWhl_CalibRes' =>
               {
               'SIGNAL_NAME'   => 'SteWhl_CalibRes',      'CANOE_ENV_VAR' => 'EnvSteWhl_CalibRes_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Wheel_Angle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteWhl_CalibRes.Steering_Wheel_Angle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteWhl_CalibRes.Steering_Wheel_Angle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteWhl_CalibStatus' =>
               {
               'SIGNAL_NAME'   => 'SteWhl_CalibStatus',      'CANOE_ENV_VAR' => 'EnvSteWhl_CalibStatus_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Wheel_Angle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 42, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteWhl_CalibStatus.Steering_Wheel_Angle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteWhl_CalibStatus.Steering_Wheel_Angle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteWhl_ChangeRate' =>
               {
               'SIGNAL_NAME'   => 'SteWhl_ChangeRate',      'CANOE_ENV_VAR' => 'EnvSteWhl_ChangeRate_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Wheel_Angle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 15, 'OFFSET' => 0.000000, 'FACTOR' => 0.061040,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'deg/s',
               'LC_READ_PHYS'  => 'SteWhl_ChangeRate.Steering_Wheel_Angle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteWhl_ChangeRate.Steering_Wheel_Angle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' , 7 => '0b11111110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteWhl_ChangeRateSign' =>
               {
               'SIGNAL_NAME'   => 'SteWhl_ChangeRateSign',      'CANOE_ENV_VAR' => 'EnvSteWhl_ChangeRateSign_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Wheel_Angle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 56, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteWhl_ChangeRateSign.Steering_Wheel_Angle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteWhl_ChangeRateSign.Steering_Wheel_Angle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteWhl_FailureStatus' =>
               {
               'SIGNAL_NAME'   => 'SteWhl_FailureStatus',      'CANOE_ENV_VAR' => 'EnvSteWhl_FailureStatus_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Wheel_Angle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 43, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteWhl_FailureStatus.Steering_Wheel_Angle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteWhl_FailureStatus.Steering_Wheel_Angle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EPAS_SAS_Info_1_MAC (EPAS) ID: 132 (0x84), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'EPAS_SAS_Info_1_FVTx' =>
               {
               'SIGNAL_NAME'   => 'EPAS_SAS_Info_1_FVTx',      'CANOE_ENV_VAR' => 'EnvEPAS_SAS_Info_1_FVTx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPAS_SAS_Info_1_FVTx.EPAS_SAS_Info_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPAS_SAS_Info_1_FVTx.EPAS_SAS_Info_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPAS_SAS_Info_1_MACTx' =>
               {
               'SIGNAL_NAME'   => 'EPAS_SAS_Info_1_MACTx',      'CANOE_ENV_VAR' => 'EnvEPAS_SAS_Info_1_MACTx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPAS_SAS_Info_1_MACTx.EPAS_SAS_Info_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPAS_SAS_Info_1_MACTx.EPAS_SAS_Info_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteAngRelAn_No_CRC' =>
               {
               'SIGNAL_NAME'   => 'SteAngRelAn_No_CRC',      'CANOE_ENV_VAR' => 'EnvSteAngRelAn_No_CRC_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteAngRelAn_No_CRC.EPAS_SAS_Info_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteAngRelAn_No_CRC.EPAS_SAS_Info_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteAngRelAn_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'SteAngRelAn_No_Cnt',      'CANOE_ENV_VAR' => 'EnvSteAngRelAn_No_Cnt_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteAngRelAn_No_Cnt.EPAS_SAS_Info_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteAngRelAn_No_Cnt.EPAS_SAS_Info_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteAngReltvAnSns_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'SteAngReltvAnSns_D_Qf',      'CANOE_ENV_VAR' => 'EnvSteAngReltvAnSns_D_Qf_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteAngReltvAnSns_D_Qf.EPAS_SAS_Info_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteAngReltvAnSns_D_Qf.EPAS_SAS_Info_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteAngReltv_An_Sns' =>
               {
               'SIGNAL_NAME'   => 'SteAngReltv_An_Sns',      'CANOE_ENV_VAR' => 'EnvSteAngReltv_An_Sns_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 15, 'OFFSET' => -1600.000000, 'FACTOR' => 0.100000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'deg',
               'LC_READ_PHYS'  => 'SteAngReltv_An_Sns.EPAS_SAS_Info_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteAngReltv_An_Sns.EPAS_SAS_Info_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteAng_CalStart' =>
               {
               'SIGNAL_NAME'   => 'SteAng_CalStart',      'CANOE_ENV_VAR' => 'EnvSteAng_CalStart_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteAng_CalStart.EPAS_SAS_Info_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteAng_CalStart.EPAS_SAS_Info_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteAng_CalibStatus' =>
               {
               'SIGNAL_NAME'   => 'SteAng_CalibStatus',      'CANOE_ENV_VAR' => 'EnvSteAng_CalibStatus_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteAng_CalibStatus.EPAS_SAS_Info_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteAng_CalibStatus.EPAS_SAS_Info_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: ADAS_SteeringCtrlReq_Data (CGW) ID: 133 (0x85), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ADAS_SteCtlCancl_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteCtlCancl_D_Actl',      'CANOE_ENV_VAR' => 'EnvADAS_SteCtlCancl_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_SteeringCtrlReq_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_SteCtlCancl_D_Actl.ADAS_SteeringCtrlReq_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteCtlCancl_D_Actl.ADAS_SteeringCtrlReq_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteCtlEnbl_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteCtlEnbl_D_Actl',      'CANOE_ENV_VAR' => 'EnvADAS_SteCtlEnbl_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_SteeringCtrlReq_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_SteCtlEnbl_D_Actl.ADAS_SteeringCtrlReq_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteCtlEnbl_D_Actl.ADAS_SteeringCtrlReq_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteCtlFail_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteCtlFail_D_Actl',      'CANOE_ENV_VAR' => 'EnvADAS_SteCtlFail_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_SteeringCtrlReq_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_SteCtlFail_D_Actl.ADAS_SteeringCtrlReq_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteCtlFail_D_Actl.ADAS_SteeringCtrlReq_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteCtlReq_No_CRC' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteCtlReq_No_CRC',      'CANOE_ENV_VAR' => 'EnvADAS_SteCtlReq_No_CRC_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_SteeringCtrlReq_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_SteCtlReq_No_CRC.ADAS_SteeringCtrlReq_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteCtlReq_No_CRC.ADAS_SteeringCtrlReq_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteCtlReq_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteCtlReq_No_Cnt',      'CANOE_ENV_VAR' => 'EnvADAS_SteCtlReq_No_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_SteeringCtrlReq_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_SteCtlReq_No_Cnt.ADAS_SteeringCtrlReq_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteCtlReq_No_Cnt.ADAS_SteeringCtrlReq_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteCtlTrgt_AnV_Req' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteCtlTrgt_AnV_Req',      'CANOE_ENV_VAR' => 'EnvADAS_SteCtlTrgt_AnV_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_SteeringCtrlReq_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 34, 'LENGTH' => 16, 'OFFSET' => -2000.097680, 'FACTOR' => 0.061040,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'deg/s',
               'LC_READ_PHYS'  => 'ADAS_SteCtlTrgt_AnV_Req.ADAS_SteeringCtrlReq_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteCtlTrgt_AnV_Req.ADAS_SteeringCtrlReq_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000111' , 5 => '0b11111111' , 6 => '0b11111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteCtlTrgt_An_Req' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteCtlTrgt_An_Req',      'CANOE_ENV_VAR' => 'EnvADAS_SteCtlTrgt_An_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_SteeringCtrlReq_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 20, 'OFFSET' => -786.430500, 'FACTOR' => 0.001500,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'deg',
               'LC_READ_PHYS'  => 'ADAS_SteCtlTrgt_An_Req.ADAS_SteeringCtrlReq_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteCtlTrgt_An_Req.ADAS_SteeringCtrlReq_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01111111' , 3 => '0b11111111' , 4 => '0b11111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteLdwCtl_D_Req' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteLdwCtl_D_Req',      'CANOE_ENV_VAR' => 'EnvADAS_SteLdwCtl_D_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_SteeringCtrlReq_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_SteLdwCtl_D_Req.ADAS_SteeringCtrlReq_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteLdwCtl_D_Req.ADAS_SteeringCtrlReq_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_TqFactr_Req' =>
               {
               'SIGNAL_NAME'   => 'ADAS_TqFactr_Req',      'CANOE_ENV_VAR' => 'EnvADAS_TqFactr_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_SteeringCtrlReq_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 0.005000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_TqFactr_Req.ADAS_SteeringCtrlReq_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_TqFactr_Req.ADAS_SteeringCtrlReq_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_Types_Str' =>
               {
               'SIGNAL_NAME'   => 'ADAS_Types_Str',      'CANOE_ENV_VAR' => 'EnvADAS_Types_Str_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_SteeringCtrlReq_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 50, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_Types_Str.ADAS_SteeringCtrlReq_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_Types_Str.ADAS_SteeringCtrlReq_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00000111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EPAS_SAS_Info_2_MAC (EPAS) ID: 135 (0x87), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'EPAS_SAS_Info_2_FVTx' =>
               {
               'SIGNAL_NAME'   => 'EPAS_SAS_Info_2_FVTx',      'CANOE_ENV_VAR' => 'EnvEPAS_SAS_Info_2_FVTx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPAS_SAS_Info_2_FVTx.EPAS_SAS_Info_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPAS_SAS_Info_2_FVTx.EPAS_SAS_Info_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPAS_SAS_Info_2_MACTx' =>
               {
               'SIGNAL_NAME'   => 'EPAS_SAS_Info_2_MACTx',      'CANOE_ENV_VAR' => 'EnvEPAS_SAS_Info_2_MACTx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPAS_SAS_Info_2_MACTx.EPAS_SAS_Info_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPAS_SAS_Info_2_MACTx.EPAS_SAS_Info_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SasCntComplt_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'SasCntComplt_B_Actl',      'CANOE_ENV_VAR' => 'EnvSasCntComplt_B_Actl_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SasCntComplt_B_Actl.EPAS_SAS_Info_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SasCntComplt_B_Actl.EPAS_SAS_Info_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Sas_FailStatus' =>
               {
               'SIGNAL_NAME'   => 'Sas_FailStatus',      'CANOE_ENV_VAR' => 'EnvSas_FailStatus_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Sas_FailStatus.EPAS_SAS_Info_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Sas_FailStatus.EPAS_SAS_Info_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteAngEstAn_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'SteAngEstAn_No_Cnt',      'CANOE_ENV_VAR' => 'EnvSteAngEstAn_No_Cnt_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteAngEstAn_No_Cnt.EPAS_SAS_Info_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteAngEstAn_No_Cnt.EPAS_SAS_Info_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteAngEstAn_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'SteAngEstAn_No_Cs',      'CANOE_ENV_VAR' => 'EnvSteAngEstAn_No_Cs_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteAngEstAn_No_Cs.EPAS_SAS_Info_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteAngEstAn_No_Cs.EPAS_SAS_Info_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteWhlCompAnEst_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'SteWhlCompAnEst_D_Qf',      'CANOE_ENV_VAR' => 'EnvSteWhlCompAnEst_D_Qf_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteWhlCompAnEst_D_Qf.EPAS_SAS_Info_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteWhlCompAnEst_D_Qf.EPAS_SAS_Info_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteWhlComp_An_Est' =>
               {
               'SIGNAL_NAME'   => 'SteWhlComp_An_Est',      'CANOE_ENV_VAR' => 'EnvSteWhlComp_An_Est_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_SAS_Info_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 15, 'OFFSET' => -1600.000000, 'FACTOR' => 0.100000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'deg',
               'LC_READ_PHYS'  => 'SteWhlComp_An_Est.EPAS_SAS_Info_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteWhlComp_An_Est.EPAS_SAS_Info_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: ADAS_SteeringCtrl_Data (EPAS) ID: 136 (0x88), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ADAS_Assist_Tq_Actl' =>
               {
               'SIGNAL_NAME'   => 'ADAS_Assist_Tq_Actl',      'CANOE_ENV_VAR' => 'EnvADAS_Assist_Tq_Actl_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'ADAS_SteeringCtrl_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 13, 'OFFSET' => -204.750000, 'FACTOR' => 0.050000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Nm',
               'LC_READ_PHYS'  => 'ADAS_Assist_Tq_Actl.ADAS_SteeringCtrl_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_Assist_Tq_Actl.ADAS_SteeringCtrl_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' , 3 => '0b11111111' , 4 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_Eps_Final_Tq_Actl' =>
               {
               'SIGNAL_NAME'   => 'ADAS_Eps_Final_Tq_Actl',      'CANOE_ENV_VAR' => 'EnvADAS_Eps_Final_Tq_Actl_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'ADAS_SteeringCtrl_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 44, 'LENGTH' => 13, 'OFFSET' => -204.750000, 'FACTOR' => 0.050000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Nm',
               'LC_READ_PHYS'  => 'ADAS_Eps_Final_Tq_Actl.ADAS_SteeringCtrl_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_Eps_Final_Tq_Actl.ADAS_SteeringCtrl_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00011111' , 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_Lock2Lock_An_Const' =>
               {
               'SIGNAL_NAME'   => 'ADAS_Lock2Lock_An_Const',      'CANOE_ENV_VAR' => 'EnvADAS_Lock2Lock_An_Const_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'ADAS_SteeringCtrl_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 38, 'LENGTH' => 10, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Angle',
               'LC_READ_PHYS'  => 'ADAS_Lock2Lock_An_Const.ADAS_SteeringCtrl_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_Lock2Lock_An_Const.ADAS_SteeringCtrl_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b01111111' , 5 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteCtlActv_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteCtlActv_D_Actl',      'CANOE_ENV_VAR' => 'EnvADAS_SteCtlActv_D_Actl_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'ADAS_SteeringCtrl_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_SteCtlActv_D_Actl.ADAS_SteeringCtrl_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteCtlActv_D_Actl.ADAS_SteeringCtrl_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteCtlData_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteCtlData_No_Cnt',      'CANOE_ENV_VAR' => 'EnvADAS_SteCtlData_No_Cnt_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'ADAS_SteeringCtrl_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_SteCtlData_No_Cnt.ADAS_SteeringCtrl_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteCtlData_No_Cnt.ADAS_SteeringCtrl_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteInhbt_B_Flag' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteInhbt_B_Flag',      'CANOE_ENV_VAR' => 'EnvADAS_SteInhbt_B_Flag_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'ADAS_SteeringCtrl_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_SteInhbt_B_Flag.ADAS_SteeringCtrl_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteInhbt_B_Flag.ADAS_SteeringCtrl_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_SteOnOff_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'ADAS_SteOnOff_D_Actl',      'CANOE_ENV_VAR' => 'EnvADAS_SteOnOff_D_Actl_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'ADAS_SteeringCtrl_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_SteOnOff_D_Actl.ADAS_SteeringCtrl_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_SteOnOff_D_Actl.ADAS_SteeringCtrl_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_StrCtrData_No_CRC' =>
               {
               'SIGNAL_NAME'   => 'ADAS_StrCtrData_No_CRC',      'CANOE_ENV_VAR' => 'EnvADAS_StrCtrData_No_CRC_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'ADAS_SteeringCtrl_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_StrCtrData_No_CRC.ADAS_SteeringCtrl_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_StrCtrData_No_CRC.ADAS_SteeringCtrl_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPS_State_ADAS' =>
               {
               'SIGNAL_NAME'   => 'EPS_State_ADAS',      'CANOE_ENV_VAR' => 'EnvEPS_State_ADAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'ADAS_SteeringCtrl_Data',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPS_State_ADAS.ADAS_SteeringCtrl_Data.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPS_State_ADAS.ADAS_SteeringCtrl_Data.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Steering_Column_Switch (CGW) ID: 145 (0x91), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AEB_HEC_Fail_Flag' =>
               {
               'SIGNAL_NAME'   => 'AEB_HEC_Fail_Flag',      'CANOE_ENV_VAR' => 'EnvAEB_HEC_Fail_Flag_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 52, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_HEC_Fail_Flag.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_HEC_Fail_Flag.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ALH_HBC_Sw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'ALH_HBC_Sw_B_Actl',      'CANOE_ENV_VAR' => 'EnvALH_HBC_Sw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ALH_HBC_Sw_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ALH_HBC_Sw_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AvgFuelEco_Rst_HEC' =>
               {
               'SIGNAL_NAME'   => 'AvgFuelEco_Rst_HEC',      'CANOE_ENV_VAR' => 'EnvAvgFuelEco_Rst_HEC_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 34, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AvgFuelEco_Rst_HEC.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AvgFuelEco_Rst_HEC.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FrntWasherSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'FrntWasherSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvFrntWasherSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 17, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FrntWasherSw_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FrntWasherSw_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FrntWiprInt_V_Actl' =>
               {
               'SIGNAL_NAME'   => 'FrntWiprInt_V_Actl',      'CANOE_ENV_VAR' => 'EnvFrntWiprInt_V_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Percent',
               'LC_READ_PHYS'  => 'FrntWiprInt_V_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FrntWiprInt_V_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FrntWiprStats_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'FrntWiprStats_D_Actl',      'CANOE_ENV_VAR' => 'EnvFrntWiprStats_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FrntWiprStats_D_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FrntWiprStats_D_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HECSwtchA_Cnt' =>
               {
               'SIGNAL_NAME'   => 'HECSwtchA_Cnt',      'CANOE_ENV_VAR' => 'EnvHECSwtchA_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 51, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HECSwtchA_Cnt.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HECSwtchA_Cnt.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HECSwtchA_Cs' =>
               {
               'SIGNAL_NAME'   => 'HECSwtchA_Cs',      'CANOE_ENV_VAR' => 'EnvHECSwtchA_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HECSwtchA_Cs.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HECSwtchA_Cs.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HeadLghtHiSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'HeadLghtHiSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvHeadLghtHiSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HeadLghtHiSw_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HeadLghtHiSw_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HeadLghtLoSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'HeadLghtLoSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvHeadLghtLoSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 4, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HeadLghtLoSw_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HeadLghtLoSw_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HeadLghtOffSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'HeadLghtOffSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvHeadLghtOffSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HeadLghtOffSw_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HeadLghtOffSw_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Info_Status_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'Info_Status_B_Actl',      'CANOE_ENV_VAR' => 'EnvInfo_Status_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 53, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Info_Status_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Info_Status_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LghtSw_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'LghtSw_D_Qf',      'CANOE_ENV_VAR' => 'EnvLghtSw_D_Qf_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LghtSw_D_Qf.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LghtSw_D_Qf.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Mfs_Turn_Stalk_SW_Status' =>
               {
               'SIGNAL_NAME'   => 'Mfs_Turn_Stalk_SW_Status',      'CANOE_ENV_VAR' => 'EnvMfs_Turn_Stalk_SW_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Mfs_Turn_Stalk_SW_Status.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Mfs_Turn_Stalk_SW_Status.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PaddleShiftDwn_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'PaddleShiftDwn_D_Actl',      'CANOE_ENV_VAR' => 'EnvPaddleShiftDwn_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 29, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PaddleShiftDwn_D_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PaddleShiftDwn_D_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PaddleShiftUp_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'PaddleShiftUp_D_Actl',      'CANOE_ENV_VAR' => 'EnvPaddleShiftUp_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PaddleShiftUp_D_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PaddleShiftUp_D_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PanelCont_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'PanelCont_D_Actl',      'CANOE_ENV_VAR' => 'EnvPanelCont_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 33, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PanelCont_D_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PanelCont_D_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PassngSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'PassngSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvPassngSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PassngSw_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PassngSw_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RearFogSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'RearFogSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvRearFogSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RearFogSw_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RearFogSw_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RearWasherSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'RearWasherSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvRearWasherSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 16, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RearWasherSw_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RearWasherSw_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RearWiprStats_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'RearWiprStats_D_Actl',      'CANOE_ENV_VAR' => 'EnvRearWiprStats_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RearWiprStats_D_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RearWiprStats_D_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SpAlarm_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'SpAlarm_B_Actl',      'CANOE_ENV_VAR' => 'EnvSpAlarm_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SpAlarm_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SpAlarm_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TnsSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'TnsSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvTnsSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TnsSw_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TnsSw_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Veh_speed' =>
               {
               'SIGNAL_NAME'   => 'Veh_speed',      'CANOE_ENV_VAR' => 'EnvVeh_speed_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 27, 'LENGTH' => 9, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Veh_speed.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Veh_speed.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001111' , 4 => '0b11111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Veh_speed_Fault' =>
               {
               'SIGNAL_NAME'   => 'Veh_speed_Fault',      'CANOE_ENV_VAR' => 'EnvVeh_speed_Fault_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Veh_speed_Fault.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Veh_speed_Fault.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Veh_speed_Unit' =>
               {
               'SIGNAL_NAME'   => 'Veh_speed_Unit',      'CANOE_ENV_VAR' => 'EnvVeh_speed_Unit_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Veh_speed_Unit.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Veh_speed_Unit.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WiprSw_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'WiprSw_D_Qf',      'CANOE_ENV_VAR' => 'EnvWiprSw_D_Qf_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WiprSw_D_Qf.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WiprSw_D_Qf.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WiprTestMode_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'WiprTestMode_B_Actl',      'CANOE_ENV_VAR' => 'EnvWiprTestMode_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Steering_Column_Switch',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 54, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WiprTestMode_B_Actl.Steering_Column_Switch.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WiprTestMode_B_Actl.Steering_Column_Switch.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: BCM_Information1_MAC (CGW) ID: 146 (0x92), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'BCMINFO1_MAC_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'BCMINFO1_MAC_No_Cnt',      'CANOE_ENV_VAR' => 'EnvBCMINFO1_MAC_No_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BCMINFO1_MAC_No_Cnt.BCM_Information1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BCMINFO1_MAC_No_Cnt.BCM_Information1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BCMINFO1_MAC_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'BCMINFO1_MAC_No_Cs',      'CANOE_ENV_VAR' => 'EnvBCMINFO1_MAC_No_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BCMINFO1_MAC_No_Cs.BCM_Information1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BCMINFO1_MAC_No_Cs.BCM_Information1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BCM_Information1_FVTx' =>
               {
               'SIGNAL_NAME'   => 'BCM_Information1_FVTx',      'CANOE_ENV_VAR' => 'EnvBCM_Information1_FVTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BCM_Information1_FVTx.BCM_Information1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BCM_Information1_FVTx.BCM_Information1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BCM_Information1_MACTx' =>
               {
               'SIGNAL_NAME'   => 'BCM_Information1_MACTx',      'CANOE_ENV_VAR' => 'EnvBCM_Information1_MACTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BCM_Information1_MACTx.BCM_Information1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BCM_Information1_MACTx.BCM_Information1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PADI_Stat' =>
               {
               'SIGNAL_NAME'   => 'PADI_Stat',      'CANOE_ENV_VAR' => 'EnvPADI_Stat_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PADI_Stat.BCM_Information1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PADI_Stat.BCM_Information1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Cruise_Multi_Switch_1_MAC (CGW) ID: 148 (0x94), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ASC_Swtch_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'ASC_Swtch_B_Actl',      'CANOE_ENV_VAR' => 'EnvASC_Swtch_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ASC_Swtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ASC_Swtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CancelSwtch_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'CancelSwtch_B_Actl',      'CANOE_ENV_VAR' => 'EnvCancelSwtch_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CancelSwtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CancelSwtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CruiseSwtch_Qf' =>
               {
               'SIGNAL_NAME'   => 'CruiseSwtch_Qf',      'CANOE_ENV_VAR' => 'EnvCruiseSwtch_Qf_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CruiseSwtch_Qf.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CruiseSwtch_Qf.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Cruise_Multi_Switch_1_FVTx' =>
               {
               'SIGNAL_NAME'   => 'Cruise_Multi_Switch_1_FVTx',      'CANOE_ENV_VAR' => 'EnvCruise_Multi_Switch_1_FVTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Cruise_Multi_Switch_1_FVTx.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Cruise_Multi_Switch_1_FVTx.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Cruise_Multi_Switch_1_MACTx' =>
               {
               'SIGNAL_NAME'   => 'Cruise_Multi_Switch_1_MACTx',      'CANOE_ENV_VAR' => 'EnvCruise_Multi_Switch_1_MACTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Cruise_Multi_Switch_1_MACTx.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Cruise_Multi_Switch_1_MACTx.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DHS_RIL_STAT' =>
               {
               'SIGNAL_NAME'   => 'DHS_RIL_STAT',      'CANOE_ENV_VAR' => 'EnvDHS_RIL_STAT_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DHS_RIL_STAT.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DHS_RIL_STAT.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DistanceMinus_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'DistanceMinus_B_Actl',      'CANOE_ENV_VAR' => 'EnvDistanceMinus_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DistanceMinus_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DistanceMinus_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DistancePlus_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'DistancePlus_B_Actl',      'CANOE_ENV_VAR' => 'EnvDistancePlus_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DistancePlus_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DistancePlus_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HECSwtchB_1_Cnt' =>
               {
               'SIGNAL_NAME'   => 'HECSwtchB_1_Cnt',      'CANOE_ENV_VAR' => 'EnvHECSwtchB_1_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HECSwtchB_1_Cnt.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HECSwtchB_1_Cnt.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HECSwtchB_1_Cs' =>
               {
               'SIGNAL_NAME'   => 'HECSwtchB_1_Cs',      'CANOE_ENV_VAR' => 'EnvHECSwtchB_1_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HECSwtchB_1_Cs.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HECSwtchB_1_Cs.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LIM_Swtch_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'LIM_Swtch_B_Actl',      'CANOE_ENV_VAR' => 'EnvLIM_Swtch_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LIM_Swtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LIM_Swtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MRCC_Swtch_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'MRCC_Swtch_B_Actl',      'CANOE_ENV_VAR' => 'EnvMRCC_Swtch_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MRCC_Swtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MRCC_Swtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MntSet_Oil_HEC_Req' =>
               {
               'SIGNAL_NAME'   => 'MntSet_Oil_HEC_Req',      'CANOE_ENV_VAR' => 'EnvMntSet_Oil_HEC_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MntSet_Oil_HEC_Req.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MntSet_Oil_HEC_Req.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'OffSwtch_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'OffSwtch_B_Actl',      'CANOE_ENV_VAR' => 'EnvOffSwtch_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'OffSwtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'OffSwtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RIL_STAT' =>
               {
               'SIGNAL_NAME'   => 'RIL_STAT',      'CANOE_ENV_VAR' => 'EnvRIL_STAT_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RIL_STAT.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RIL_STAT.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000011' , 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ResumeSwtch_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'ResumeSwtch_B_Actl',      'CANOE_ENV_VAR' => 'EnvResumeSwtch_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 2, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ResumeSwtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ResumeSwtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SetMinusSwtch_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'SetMinusSwtch_B_Actl',      'CANOE_ENV_VAR' => 'EnvSetMinusSwtch_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SetMinusSwtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SetMinusSwtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SetPlusSwtch_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'SetPlusSwtch_B_Actl',      'CANOE_ENV_VAR' => 'EnvSetPlusSwtch_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 4, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SetPlusSwtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SetPlusSwtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TJA_Swtch_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'TJA_Swtch_B_Actl',      'CANOE_ENV_VAR' => 'EnvTJA_Swtch_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TJA_Swtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TJA_Swtch_B_Actl.Cruise_Multi_Switch_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Cruise_Multi_Switch_2_MAC (CGW) ID: 150 (0x96), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ADASOfSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'ADASOfSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvADASOfSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADASOfSw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADASOfSw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Cruise_Multi_Switch_2_FVTx' =>
               {
               'SIGNAL_NAME'   => 'Cruise_Multi_Switch_2_FVTx',      'CANOE_ENV_VAR' => 'EnvCruise_Multi_Switch_2_FVTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Cruise_Multi_Switch_2_FVTx.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Cruise_Multi_Switch_2_FVTx.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Cruise_Multi_Switch_2_MACTx' =>
               {
               'SIGNAL_NAME'   => 'Cruise_Multi_Switch_2_MACTx',      'CANOE_ENV_VAR' => 'EnvCruise_Multi_Switch_2_MACTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Cruise_Multi_Switch_2_MACTx.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Cruise_Multi_Switch_2_MACTx.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DSCOfSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'DSCOfSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvDSCOfSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 2, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSCOfSw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSCOfSw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DposDrv1_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'DposDrv1_B_Actl',      'CANOE_ENV_VAR' => 'EnvDposDrv1_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DposDrv1_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DposDrv1_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DposDrv2_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'DposDrv2_B_Actl',      'CANOE_ENV_VAR' => 'EnvDposDrv2_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DposDrv2_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DposDrv2_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DposSet_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'DposSet_B_Actl',      'CANOE_ENV_VAR' => 'EnvDposSet_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DposSet_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DposSet_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FuelLidOpen_Rq_SW_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'FuelLidOpen_Rq_SW_B_Actl',      'CANOE_ENV_VAR' => 'EnvFuelLidOpen_Rq_SW_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FuelLidOpen_Rq_SW_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FuelLidOpen_Rq_SW_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HECSwtchB_2_Cnt' =>
               {
               'SIGNAL_NAME'   => 'HECSwtchB_2_Cnt',      'CANOE_ENV_VAR' => 'EnvHECSwtchB_2_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HECSwtchB_2_Cnt.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HECSwtchB_2_Cnt.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HECSwtchB_2_Cs' =>
               {
               'SIGNAL_NAME'   => 'HECSwtchB_2_Cs',      'CANOE_ENV_VAR' => 'EnvHECSwtchB_2_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HECSwtchB_2_Cs.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HECSwtchB_2_Cs.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HEC_HUD_Disp_MRCC_Status' =>
               {
               'SIGNAL_NAME'   => 'HEC_HUD_Disp_MRCC_Status',      'CANOE_ENV_VAR' => 'EnvHEC_HUD_Disp_MRCC_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HEC_HUD_Disp_MRCC_Status.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HEC_HUD_Disp_MRCC_Status.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HEC_HUD_Disp_MRCC_Status2' =>
               {
               'SIGNAL_NAME'   => 'HEC_HUD_Disp_MRCC_Status2',      'CANOE_ENV_VAR' => 'EnvHEC_HUD_Disp_MRCC_Status2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HEC_HUD_Disp_MRCC_Status2.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HEC_HUD_Disp_MRCC_Status2.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'IStpRexSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'IStpRexSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvIStpRexSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'IStpRexSw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'IStpRexSw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MultiSw_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'MultiSw_D_Qf',      'CANOE_ENV_VAR' => 'EnvMultiSw_D_Qf_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MultiSw_D_Qf.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MultiSw_D_Qf.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PSM_OfSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'PSM_OfSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvPSM_OfSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PSM_OfSw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PSM_OfSw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PsunOfSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'PsunOfSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvPsunOfSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PsunOfSw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PsunOfSw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SP_DATE_No' =>
               {
               'SIGNAL_NAME'   => 'SP_DATE_No',      'CANOE_ENV_VAR' => 'EnvSP_DATE_No_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SP_DATE_No.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SP_DATE_No.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TLO_PLG_Sw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'TLO_PLG_Sw_B_Actl',      'CANOE_ENV_VAR' => 'EnvTLO_PLG_Sw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TLO_PLG_Sw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TLO_PLG_Sw_B_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TmpLoAlrmB_Actl' =>
               {
               'SIGNAL_NAME'   => 'TmpLoAlrmB_Actl',      'CANOE_ENV_VAR' => 'EnvTmpLoAlrmB_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Cruise_Multi_Switch_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TmpLoAlrmB_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TmpLoAlrmB_Actl.Cruise_Multi_Switch_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: WheelData_1_MAC (DSC) ID: 151 (0x97), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'WheelData_1_FVTx' =>
               {
               'SIGNAL_NAME'   => 'WheelData_1_FVTx',      'CANOE_ENV_VAR' => 'EnvWheelData_1_FVTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WheelData_1_FVTx.WheelData_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WheelData_1_FVTx.WheelData_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WheelData_1_MACTx' =>
               {
               'SIGNAL_NAME'   => 'WheelData_1_MACTx',      'CANOE_ENV_VAR' => 'EnvWheelData_1_MACTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WheelData_1_MACTx.WheelData_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WheelData_1_MACTx.WheelData_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatFl_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatFl_No_Cnt',      'CANOE_ENV_VAR' => 'EnvWhlRotatFl_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatFl_No_Cnt.WheelData_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatFl_No_Cnt.WheelData_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatFr_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatFr_No_Cnt',      'CANOE_ENV_VAR' => 'EnvWhlRotatFr_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatFr_No_Cnt.WheelData_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatFr_No_Cnt.WheelData_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatRl_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatRl_No_Cnt',      'CANOE_ENV_VAR' => 'EnvWhlRotatRl_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatRl_No_Cnt.WheelData_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatRl_No_Cnt.WheelData_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatRr_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatRr_No_Cnt',      'CANOE_ENV_VAR' => 'EnvWhlRotatRr_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_1_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatRr_No_Cnt.WheelData_1_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatRr_No_Cnt.WheelData_1_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: WheelData_2_MAC (DSC) ID: 152 (0x98), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'VehVActlBrk_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'VehVActlBrk_D_Qf',      'CANOE_ENV_VAR' => 'EnvVehVActlBrk_D_Qf_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehVActlBrk_D_Qf.WheelData_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehVActlBrk_D_Qf.WheelData_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehVActlBrk_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'VehVActlBrk_No_Cnt',      'CANOE_ENV_VAR' => 'EnvVehVActlBrk_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehVActlBrk_No_Cnt.WheelData_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehVActlBrk_No_Cnt.WheelData_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehVActlBrk_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'VehVActlBrk_No_Cs',      'CANOE_ENV_VAR' => 'EnvVehVActlBrk_No_Cs_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehVActlBrk_No_Cs.WheelData_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehVActlBrk_No_Cs.WheelData_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Veh_V_ActlBrk' =>
               {
               'SIGNAL_NAME'   => 'Veh_V_ActlBrk',      'CANOE_ENV_VAR' => 'EnvVeh_V_ActlBrk_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 16, 'OFFSET' => 0.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'kph',
               'LC_READ_PHYS'  => 'Veh_V_ActlBrk.WheelData_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Veh_V_ActlBrk.WheelData_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Vehicle_Stationary' =>
               {
               'SIGNAL_NAME'   => 'Vehicle_Stationary',      'CANOE_ENV_VAR' => 'EnvVehicle_Stationary_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Vehicle_Stationary.WheelData_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Vehicle_Stationary.WheelData_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WheelData_2_FVTx' =>
               {
               'SIGNAL_NAME'   => 'WheelData_2_FVTx',      'CANOE_ENV_VAR' => 'EnvWheelData_2_FVTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WheelData_2_FVTx.WheelData_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WheelData_2_FVTx.WheelData_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WheelData_2_MACTx' =>
               {
               'SIGNAL_NAME'   => 'WheelData_2_MACTx',      'CANOE_ENV_VAR' => 'EnvWheelData_2_MACTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData_2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WheelData_2_MACTx.WheelData_2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WheelData_2_MACTx.WheelData_2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: BCM_Information1 (CGW) ID: 154 (0x9a), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AutoWiprIND_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'AutoWiprIND_B_Rq',      'CANOE_ENV_VAR' => 'EnvAutoWiprIND_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AutoWiprIND_B_Rq.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AutoWiprIND_B_Rq.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BCMINFO1_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'BCMINFO1_No_Cnt',      'CANOE_ENV_VAR' => 'EnvBCMINFO1_No_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 51, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BCMINFO1_No_Cnt.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BCMINFO1_No_Cnt.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BCMINFO1_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'BCMINFO1_No_Cs',      'CANOE_ENV_VAR' => 'EnvBCMINFO1_No_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BCMINFO1_No_Cs.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BCMINFO1_No_Cs.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BlwCont_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'BlwCont_B_Actl',      'CANOE_ENV_VAR' => 'EnvBlwCont_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 38, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BlwCont_B_Actl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BlwCont_B_Actl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BmotCutLvl' =>
               {
               'SIGNAL_NAME'   => 'BmotCutLvl',      'CANOE_ENV_VAR' => 'EnvBmotCutLvl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 30, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BmotCutLvl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BmotCutLvl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BurglarHorn_B_Req' =>
               {
               'SIGNAL_NAME'   => 'BurglarHorn_B_Req',      'CANOE_ENV_VAR' => 'EnvBurglarHorn_B_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 33, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BurglarHorn_B_Req.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BurglarHorn_B_Req.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DRL_Tail_Lamp_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'DRL_Tail_Lamp_B_Rq',      'CANOE_ENV_VAR' => 'EnvDRL_Tail_Lamp_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 44, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DRL_Tail_Lamp_B_Rq.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DRL_Tail_Lamp_B_Rq.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FrntWipr_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'FrntWipr_D_Actl',      'CANOE_ENV_VAR' => 'EnvFrntWipr_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 24, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FrntWipr_D_Actl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FrntWipr_D_Actl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000001' , 4 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HiBeamIpcDsply_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'HiBeamIpcDsply_B_Rq',      'CANOE_ENV_VAR' => 'EnvHiBeamIpcDsply_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HiBeamIpcDsply_B_Rq.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HiBeamIpcDsply_B_Rq.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LightWarning_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'LightWarning_D_Rq',      'CANOE_ENV_VAR' => 'EnvLightWarning_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LightWarning_D_Rq.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LightWarning_D_Rq.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PtcCutLvl' =>
               {
               'SIGNAL_NAME'   => 'PtcCutLvl',      'CANOE_ENV_VAR' => 'EnvPtcCutLvl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 28, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PtcCutLvl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PtcCutLvl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RdefCutLvl' =>
               {
               'SIGNAL_NAME'   => 'RdefCutLvl',      'CANOE_ENV_VAR' => 'EnvRdefCutLvl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 18, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RdefCutLvl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RdefCutLvl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RearFogIpcDsply_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'RearFogIpcDsply_B_Rq',      'CANOE_ENV_VAR' => 'EnvRearFogIpcDsply_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 6, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RearFogIpcDsply_B_Rq.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RearFogIpcDsply_B_Rq.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RearWiprLo_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'RearWiprLo_B_Rq',      'CANOE_ENV_VAR' => 'EnvRearWiprLo_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 4, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RearWiprLo_B_Rq.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RearWiprLo_B_Rq.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ResEngCont_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'ResEngCont_B_Actl',      'CANOE_ENV_VAR' => 'EnvResEngCont_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ResEngCont_B_Actl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ResEngCont_B_Actl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ResHeatCont_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'ResHeatCont_B_Actl',      'CANOE_ENV_VAR' => 'EnvResHeatCont_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ResHeatCont_B_Actl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ResHeatCont_B_Actl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SeatHeatCutLvl' =>
               {
               'SIGNAL_NAME'   => 'SeatHeatCutLvl',      'CANOE_ENV_VAR' => 'EnvSeatHeatCutLvl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 16, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SeatHeatCutLvl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SeatHeatCutLvl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000001' , 3 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SndFSP_Fail_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'SndFSP_Fail_B_Actl',      'CANOE_ENV_VAR' => 'EnvSndFSP_Fail_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SndFSP_Fail_B_Actl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SndFSP_Fail_B_Actl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SndRSP_Fail_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'SndRSP_Fail_B_Actl',      'CANOE_ENV_VAR' => 'EnvSndRSP_Fail_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 54, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SndRSP_Fail_B_Actl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SndRSP_Fail_B_Actl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteeringHeatCutLvl' =>
               {
               'SIGNAL_NAME'   => 'SteeringHeatCutLvl',      'CANOE_ENV_VAR' => 'EnvSteeringHeatCutLvl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 26, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteeringHeatCutLvl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteeringHeatCutLvl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TNS_Buzzer_Cntl_Req' =>
               {
               'SIGNAL_NAME'   => 'TNS_Buzzer_Cntl_Req',      'CANOE_ENV_VAR' => 'EnvTNS_Buzzer_Cntl_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 45, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TNS_Buzzer_Cntl_Req.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TNS_Buzzer_Cntl_Req.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TNS_IpcDsply_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'TNS_IpcDsply_D_Rq',      'CANOE_ENV_VAR' => 'EnvTNS_IpcDsply_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TNS_IpcDsply_D_Rq.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TNS_IpcDsply_D_Rq.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' , 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Turn_Ind_Cmd_Left' =>
               {
               'SIGNAL_NAME'   => 'Turn_Ind_Cmd_Left',      'CANOE_ENV_VAR' => 'EnvTurn_Ind_Cmd_Left_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Turn_Ind_Cmd_Left.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Turn_Ind_Cmd_Left.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Turn_Ind_Cmd_Right' =>
               {
               'SIGNAL_NAME'   => 'Turn_Ind_Cmd_Right',      'CANOE_ENV_VAR' => 'EnvTurn_Ind_Cmd_Right_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Turn_Ind_Cmd_Right.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Turn_Ind_Cmd_Right.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Turn_Snd_Cmd_Left' =>
               {
               'SIGNAL_NAME'   => 'Turn_Snd_Cmd_Left',      'CANOE_ENV_VAR' => 'EnvTurn_Snd_Cmd_Left_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 46, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Turn_Snd_Cmd_Left.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Turn_Snd_Cmd_Left.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Turn_Snd_Cmd_Right' =>
               {
               'SIGNAL_NAME'   => 'Turn_Snd_Cmd_Right',      'CANOE_ENV_VAR' => 'EnvTurn_Snd_Cmd_Right_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Turn_Snd_Cmd_Right.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Turn_Snd_Cmd_Right.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Turnlamp_ESS_B_Req' =>
               {
               'SIGNAL_NAME'   => 'Turnlamp_ESS_B_Req',      'CANOE_ENV_VAR' => 'EnvTurnlamp_ESS_B_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Turnlamp_ESS_B_Req.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Turnlamp_ESS_B_Req.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Turnlamp_KoDo_B_Req' =>
               {
               'SIGNAL_NAME'   => 'Turnlamp_KoDo_B_Req',      'CANOE_ENV_VAR' => 'EnvTurnlamp_KoDo_B_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Turnlamp_KoDo_B_Req.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Turnlamp_KoDo_B_Req.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WiprGuid_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'WiprGuid_B_Rq',      'CANOE_ENV_VAR' => 'EnvWiprGuid_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 32, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WiprGuid_B_Rq.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WiprGuid_B_Rq.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WshrLvl_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'WshrLvl_D_Actl',      'CANOE_ENV_VAR' => 'EnvWshrLvl_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'BCM_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WshrLvl_D_Actl.BCM_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WshrLvl_D_Actl.BCM_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: CBCM_IllumStatus (CGW) ID: 159 (0x9f), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AudioMute_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'AudioMute_B_Actl',      'CANOE_ENV_VAR' => 'EnvAudioMute_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AudioMute_B_Actl.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AudioMute_B_Actl.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BpedDrvAppl_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'BpedDrvAppl_D_Actl',      'CANOE_ENV_VAR' => 'EnvBpedDrvAppl_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 59, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BpedDrvAppl_D_Actl.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BpedDrvAppl_D_Actl.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CBCM_Control_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'CBCM_Control_No_Cnt',      'CANOE_ENV_VAR' => 'EnvCBCM_Control_No_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 44, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CBCM_Control_No_Cnt.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CBCM_Control_No_Cnt.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00011110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CarMde_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'CarMde_D_Actl',      'CANOE_ENV_VAR' => 'EnvCarMde_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CarMde_D_Actl.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CarMde_D_Actl.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CargoLamp_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'CargoLamp_D_Rq',      'CANOE_ENV_VAR' => 'EnvCargoLamp_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 40, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CargoLamp_D_Rq.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CargoLamp_D_Rq.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000001' , 6 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DimmerCancel' =>
               {
               'SIGNAL_NAME'   => 'DimmerCancel',      'CANOE_ENV_VAR' => 'EnvDimmerCancel_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 46, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DimmerCancel.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DimmerCancel.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DoorCourtesyLamp_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'DoorCourtesyLamp_D_Rq',      'CANOE_ENV_VAR' => 'EnvDoorCourtesyLamp_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 54, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DoorCourtesyLamp_D_Rq.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DoorCourtesyLamp_D_Rq.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Enabled' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Enabled',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Enabled_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 18, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Enabled.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Enabled.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_FlashReq' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_FlashReq',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_FlashReq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 16, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_FlashReq.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_FlashReq.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000001' , 3 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EngOff_T_Actl' =>
               {
               'SIGNAL_NAME'   => 'EngOff_T_Actl',      'CANOE_ENV_VAR' => 'EnvEngOff_T_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 30, 'LENGTH' => 16, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EngOff_T_Actl.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EngOff_T_Actl.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b01111111' , 4 => '0b11111111' , 5 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FootLamp_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'FootLamp_D_Rq',      'CANOE_ENV_VAR' => 'EnvFootLamp_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 52, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FootLamp_D_Rq.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FootLamp_D_Rq.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00011100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Illum_PowerControlStatus' =>
               {
               'SIGNAL_NAME'   => 'Illum_PowerControlStatus',      'CANOE_ENV_VAR' => 'EnvIllum_PowerControlStatus_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 4, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Illum_PowerControlStatus.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Illum_PowerControlStatus.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'IlumiMde_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'IlumiMde_D_Actl',      'CANOE_ENV_VAR' => 'EnvIlumiMde_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'IlumiMde_D_Actl.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'IlumiMde_D_Actl.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'IndirectIllumination_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'IndirectIllumination_D_Rq',      'CANOE_ENV_VAR' => 'EnvIndirectIllumination_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'IndirectIllumination_D_Rq.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'IndirectIllumination_D_Rq.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PanelBrightLevel_Pc_Actl' =>
               {
               'SIGNAL_NAME'   => 'PanelBrightLevel_Pc_Actl',      'CANOE_ENV_VAR' => 'EnvPanelBrightLevel_Pc_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '%',
               'LC_READ_PHYS'  => 'PanelBrightLevel_Pc_Actl.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PanelBrightLevel_Pc_Actl.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01111111' , 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Reverselamp_B_Req' =>
               {
               'SIGNAL_NAME'   => 'Reverselamp_B_Req',      'CANOE_ENV_VAR' => 'EnvReverselamp_B_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Reverselamp_B_Req.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Reverselamp_B_Req.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RoomFuseStat_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'RoomFuseStat_D_Actl',      'CANOE_ENV_VAR' => 'EnvRoomFuseStat_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RoomFuseStat_D_Actl.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RoomFuseStat_D_Actl.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WelcomIllumination_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'WelcomIllumination_D_Rq',      'CANOE_ENV_VAR' => 'EnvWelcomIllumination_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_IllumStatus',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 49, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WelcomIllumination_D_Rq.CBCM_IllumStatus.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WelcomIllumination_D_Rq.CBCM_IllumStatus.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: CBCM_DriveSelection_Info (CGW) ID: 192 (0xc0), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'Auto_Normal_Mode_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'Auto_Normal_Mode_D_Rq',      'CANOE_ENV_VAR' => 'EnvAuto_Normal_Mode_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 37, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Auto_Normal_Mode_D_Rq.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Auto_Normal_Mode_D_Rq.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Auto_XevNormal_Mode_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'Auto_XevNormal_Mode_D_Rq',      'CANOE_ENV_VAR' => 'EnvAuto_XevNormal_Mode_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Auto_XevNormal_Mode_D_Rq.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Auto_XevNormal_Mode_D_Rq.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_List_Info' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_List_Info',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_List_Info_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_List_Info.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_List_Info.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_List_Popup' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_List_Popup',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_List_Popup_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_List_Popup.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_List_Popup.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Normal_Permission' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Normal_Permission',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Normal_Permission_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Normal_Permission.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Normal_Permission.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Offroad_Permission' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Offroad_Permission',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Offroad_Permission_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Offroad_Permission.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Offroad_Permission.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Sport_Permission' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Sport_Permission',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Sport_Permission_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Sport_Permission.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Sport_Permission.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Status' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Status',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Status.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Status.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Towing_Permission' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Towing_Permission',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Towing_Permission_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Towing_Permission.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Towing_Permission.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Not_Select_Drivemode_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'Not_Select_Drivemode_D_Rq',      'CANOE_ENV_VAR' => 'EnvNot_Select_Drivemode_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 24, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Not_Select_Drivemode_D_Rq.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Not_Select_Drivemode_D_Rq.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000001' , 4 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Not_Select_Xevmode_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'Not_Select_Xevmode_D_Rq',      'CANOE_ENV_VAR' => 'EnvNot_Select_Xevmode_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 34, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Not_Select_Xevmode_D_Rq.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Not_Select_Xevmode_D_Rq.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Trailer_Connect_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'Trailer_Connect_D_Rq',      'CANOE_ENV_VAR' => 'EnvTrailer_Connect_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 27, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Trailer_Connect_D_Rq.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Trailer_Connect_D_Rq.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Xev_Mode_Charge_Permission' =>
               {
               'SIGNAL_NAME'   => 'Xev_Mode_Charge_Permission',      'CANOE_ENV_VAR' => 'EnvXev_Mode_Charge_Permission_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 17, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Xev_Mode_Charge_Permission.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Xev_Mode_Charge_Permission.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Xev_Mode_Ev_Permission' =>
               {
               'SIGNAL_NAME'   => 'Xev_Mode_Ev_Permission',      'CANOE_ENV_VAR' => 'EnvXev_Mode_Ev_Permission_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Xev_Mode_Ev_Permission.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Xev_Mode_Ev_Permission.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Xev_Mode_Status' =>
               {
               'SIGNAL_NAME'   => 'Xev_Mode_Status',      'CANOE_ENV_VAR' => 'EnvXev_Mode_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_DriveSelection_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Xev_Mode_Status.CBCM_DriveSelection_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Xev_Mode_Status.CBCM_DriveSelection_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: ECM_Status (CGW) ID: 253 (0xfd), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ATFalseStartWarning' =>
               {
               'SIGNAL_NAME'   => 'ATFalseStartWarning',      'CANOE_ENV_VAR' => 'EnvATFalseStartWarning_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 40, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ATFalseStartWarning.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ATFalseStartWarning.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ApedOnN_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'ApedOnN_B_Rq',      'CANOE_ENV_VAR' => 'EnvApedOnN_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 38, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ApedOnN_B_Rq.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ApedOnN_B_Rq.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BOS_Active_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'BOS_Active_B_Actl',      'CANOE_ENV_VAR' => 'EnvBOS_Active_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 46, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BOS_Active_B_Actl.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BOS_Active_B_Actl.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BattRgenStat_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'BattRgenStat_B_Actl',      'CANOE_ENV_VAR' => 'EnvBattRgenStat_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 41, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BattRgenStat_B_Actl.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BattRgenStat_B_Actl.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BmsWarn_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'BmsWarn_B_Rq',      'CANOE_ENV_VAR' => 'EnvBmsWarn_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 43, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BmsWarn_B_Rq.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BmsWarn_B_Rq.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrakeSw_Fail_Warning' =>
               {
               'SIGNAL_NAME'   => 'BrakeSw_Fail_Warning',      'CANOE_ENV_VAR' => 'EnvBrakeSw_Fail_Warning_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 45, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrakeSw_Fail_Warning.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrakeSw_Fail_Warning.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Crank_wait' =>
               {
               'SIGNAL_NAME'   => 'Crank_wait',      'CANOE_ENV_VAR' => 'EnvCrank_wait_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Crank_wait.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Crank_wait.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CrankingTime' =>
               {
               'SIGNAL_NAME'   => 'CrankingTime',      'CANOE_ENV_VAR' => 'EnvCrankingTime_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 37, 'LENGTH' => 5, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'sec',
               'LC_READ_PHYS'  => 'CrankingTime.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CrankingTime.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00111110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DriveMode_Hold_Rq_PCM' =>
               {
               'SIGNAL_NAME'   => 'DriveMode_Hold_Rq_PCM',      'CANOE_ENV_VAR' => 'EnvDriveMode_Hold_Rq_PCM_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 16, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DriveMode_Hold_Rq_PCM.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DriveMode_Hold_Rq_PCM.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Normal_Req_PCM' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Normal_Req_PCM',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Normal_Req_PCM_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Normal_Req_PCM.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Normal_Req_PCM.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_OffRoad_Req_PCM' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_OffRoad_Req_PCM',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_OffRoad_Req_PCM_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 51, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_OffRoad_Req_PCM.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_OffRoad_Req_PCM.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Req_PCM' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Req_PCM',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Req_PCM_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Req_PCM.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Req_PCM.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Sport_Req_PCM' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Sport_Req_PCM',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Sport_Req_PCM_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 53, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Sport_Req_PCM.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Sport_Req_PCM.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Towing_Req_PCM' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Towing_Req_PCM',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Towing_Req_PCM_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 49, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Towing_Req_PCM.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Towing_Req_PCM.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'GlobalConfgWarn_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'GlobalConfgWarn_B_Rq',      'CANOE_ENV_VAR' => 'EnvGlobalConfgWarn_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'GlobalConfgWarn_B_Rq.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'GlobalConfgWarn_B_Rq.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'IG_OFF_Delay_Request' =>
               {
               'SIGNAL_NAME'   => 'IG_OFF_Delay_Request',      'CANOE_ENV_VAR' => 'EnvIG_OFF_Delay_Request_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'IG_OFF_Delay_Request.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'IG_OFF_Delay_Request.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'KeyState' =>
               {
               'SIGNAL_NAME'   => 'KeyState',      'CANOE_ENV_VAR' => 'EnvKeyState_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 2, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'KeyState.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'KeyState.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PTGeneralWarn_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'PTGeneralWarn_B_Rq',      'CANOE_ENV_VAR' => 'EnvPTGeneralWarn_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PTGeneralWarn_B_Rq.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PTGeneralWarn_B_Rq.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PTGeneralWarn_Mirror' =>
               {
               'SIGNAL_NAME'   => 'PTGeneralWarn_Mirror',      'CANOE_ENV_VAR' => 'EnvPTGeneralWarn_Mirror_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 59, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PTGeneralWarn_Mirror.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PTGeneralWarn_Mirror.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PowerSourceStatus' =>
               {
               'SIGNAL_NAME'   => 'PowerSourceStatus',      'CANOE_ENV_VAR' => 'EnvPowerSourceStatus_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PowerSourceStatus.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PowerSourceStatus.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RegenBrkFailWarning' =>
               {
               'SIGNAL_NAME'   => 'RegenBrkFailWarning',      'CANOE_ENV_VAR' => 'EnvRegenBrkFailWarning_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 42, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RegenBrkFailWarning.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RegenBrkFailWarning.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SRLY_state' =>
               {
               'SIGNAL_NAME'   => 'SRLY_state',      'CANOE_ENV_VAR' => 'EnvSRLY_state_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SRLY_state.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SRLY_state.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ShiftIndicatorLight' =>
               {
               'SIGNAL_NAME'   => 'ShiftIndicatorLight',      'CANOE_ENV_VAR' => 'EnvShiftIndicatorLight_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 4, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ShiftIndicatorLight.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ShiftIndicatorLight.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SilGearPosActl_D_Dsply' =>
               {
               'SIGNAL_NAME'   => 'SilGearPosActl_D_Dsply',      'CANOE_ENV_VAR' => 'EnvSilGearPosActl_D_Dsply_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SilGearPosActl_D_Dsply.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SilGearPosActl_D_Dsply.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SilGearPos_D_Dsply' =>
               {
               'SIGNAL_NAME'   => 'SilGearPos_D_Dsply',      'CANOE_ENV_VAR' => 'EnvSilGearPos_D_Dsply_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SilGearPos_D_Dsply.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SilGearPos_D_Dsply.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SmtAclInh_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'SmtAclInh_B_Actl',      'CANOE_ENV_VAR' => 'EnvSmtAclInh_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 44, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SmtAclInh_B_Actl.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SmtAclInh_B_Actl.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VspLmtAlarm_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'VspLmtAlarm_B_Rq',      'CANOE_ENV_VAR' => 'EnvVspLmtAlarm_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VspLmtAlarm_B_Rq.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VspLmtAlarm_B_Rq.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VspLmtWarn_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'VspLmtWarn_B_Rq',      'CANOE_ENV_VAR' => 'EnvVspLmtWarn_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VspLmtWarn_B_Rq.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VspLmtWarn_B_Rq.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Xev_Charge_Req_PCM' =>
               {
               'SIGNAL_NAME'   => 'Xev_Charge_Req_PCM',      'CANOE_ENV_VAR' => 'EnvXev_Charge_Req_PCM_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 58, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Xev_Charge_Req_PCM.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Xev_Charge_Req_PCM.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b00000111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Xev_Ev_Req_PCM' =>
               {
               'SIGNAL_NAME'   => 'Xev_Ev_Req_PCM',      'CANOE_ENV_VAR' => 'EnvXev_Ev_Req_PCM_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ECM_Status',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Xev_Ev_Req_PCM.ECM_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Xev_Ev_Req_PCM.ECM_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: SISS_Rqst (CGW) ID: 304 (0x130), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'BatteryWeakenFlag' =>
               {
               'SIGNAL_NAME'   => 'BatteryWeakenFlag',      'CANOE_ENV_VAR' => 'EnvBatteryWeakenFlag_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 26, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BatteryWeakenFlag.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BatteryWeakenFlag.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Clutch_Stroke' =>
               {
               'SIGNAL_NAME'   => 'Clutch_Stroke',      'CANOE_ENV_VAR' => 'EnvClutch_Stroke_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 0.500000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '%',
               'LC_READ_PHYS'  => 'Clutch_Stroke.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Clutch_Stroke.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EngAout_N_RqTacho' =>
               {
               'SIGNAL_NAME'   => 'EngAout_N_RqTacho',      'CANOE_ENV_VAR' => 'EnvEngAout_N_RqTacho_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 44, 'LENGTH' => 13, 'OFFSET' => 0.000000, 'FACTOR' => 2.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'RPM',
               'LC_READ_PHYS'  => 'EngAout_N_RqTacho.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EngAout_N_RqTacho.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00011111' , 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PTiStpRdy_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'PTiStpRdy_B_Actl',      'CANOE_ENV_VAR' => 'EnvPTiStpRdy_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 32, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PTiStpRdy_B_Actl.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PTiStpRdy_B_Actl.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SISSStatus' =>
               {
               'SIGNAL_NAME'   => 'SISSStatus',      'CANOE_ENV_VAR' => 'EnvSISSStatus_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SISSStatus.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SISSStatus.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SISS_AlarmBuzzer' =>
               {
               'SIGNAL_NAME'   => 'SISS_AlarmBuzzer',      'CANOE_ENV_VAR' => 'EnvSISS_AlarmBuzzer_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SISS_AlarmBuzzer.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SISS_AlarmBuzzer.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SISS_EngineState' =>
               {
               'SIGNAL_NAME'   => 'SISS_EngineState',      'CANOE_ENV_VAR' => 'EnvSISS_EngineState_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SISS_EngineState.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SISS_EngineState.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SISS_IRCutReq' =>
               {
               'SIGNAL_NAME'   => 'SISS_IRCutReq',      'CANOE_ENV_VAR' => 'EnvSISS_IRCutReq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 16, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SISS_IRCutReq.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SISS_IRCutReq.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SISS_Mode_for_SKE' =>
               {
               'SIGNAL_NAME'   => 'SISS_Mode_for_SKE',      'CANOE_ENV_VAR' => 'EnvSISS_Mode_for_SKE_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SISS_Mode_for_SKE.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SISS_Mode_for_SKE.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SISS_WarningLamp_G' =>
               {
               'SIGNAL_NAME'   => 'SISS_WarningLamp_G',      'CANOE_ENV_VAR' => 'EnvSISS_WarningLamp_G_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SISS_WarningLamp_G.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SISS_WarningLamp_G.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00011100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SISS_WarningLamp_R' =>
               {
               'SIGNAL_NAME'   => 'SISS_WarningLamp_R',      'CANOE_ENV_VAR' => 'EnvSISS_WarningLamp_R_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SISS_WarningLamp_R.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SISS_WarningLamp_R.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000011' , 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SKE_Control' =>
               {
               'SIGNAL_NAME'   => 'SKE_Control',      'CANOE_ENV_VAR' => 'EnvSKE_Control_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 18, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SKE_Control.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SKE_Control.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SlaCtl_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'SlaCtl_B_Rq',      'CANOE_ENV_VAR' => 'EnvSlaCtl_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SlaCtl_B_Rq.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SlaCtl_B_Rq.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'iStpDenyAC_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'iStpDenyAC_B_Actl',      'CANOE_ENV_VAR' => 'EnviStpDenyAC_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 36, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'iStpDenyAC_B_Actl.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'iStpDenyAC_B_Actl.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'iStpDenyBatt_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'iStpDenyBatt_B_Actl',      'CANOE_ENV_VAR' => 'EnviStpDenyBatt_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'iStpDenyBatt_B_Actl.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'iStpDenyBatt_B_Actl.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'iStpDenyBrk_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'iStpDenyBrk_B_Actl',      'CANOE_ENV_VAR' => 'EnviStpDenyBrk_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 33, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'iStpDenyBrk_B_Actl.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'iStpDenyBrk_B_Actl.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'iStpDenyDPF_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'iStpDenyDPF_B_Actl',      'CANOE_ENV_VAR' => 'EnviStpDenyDPF_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 38, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'iStpDenyDPF_B_Actl.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'iStpDenyDPF_B_Actl.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'iStpDenyNrange_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'iStpDenyNrange_B_Actl',      'CANOE_ENV_VAR' => 'EnviStpDenyNrange_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 37, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'iStpDenyNrange_B_Actl.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'iStpDenyNrange_B_Actl.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'iStpDenyPwStr_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'iStpDenyPwStr_B_Actl',      'CANOE_ENV_VAR' => 'EnviStpDenyPwStr_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 34, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'iStpDenyPwStr_B_Actl.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'iStpDenyPwStr_B_Actl.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'iStpDoorOpen_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'iStpDoorOpen_B_Actl',      'CANOE_ENV_VAR' => 'EnviStpDoorOpen_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 27, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'iStpDoorOpen_B_Actl.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'iStpDoorOpen_B_Actl.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'iStpKeySta_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'iStpKeySta_B_Actl',      'CANOE_ENV_VAR' => 'EnviStpKeySta_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'iStpKeySta_B_Actl.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'iStpKeySta_B_Actl.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'iStpReady_Rq' =>
               {
               'SIGNAL_NAME'   => 'iStpReady_Rq',      'CANOE_ENV_VAR' => 'EnviStpReady_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SISS_Rqst',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'iStpReady_Rq.SISS_Rqst.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'iStpReady_Rq.SISS_Rqst.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EngControlData (CGW) ID: 357 (0x165), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AirCondRec_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'AirCondRec_B_Rq',      'CANOE_ENV_VAR' => 'EnvAirCondRec_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngControlData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 42, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AirCondRec_B_Rq.EngControlData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AirCondRec_B_Rq.EngControlData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrkOnOffSwtch_D_Actl_2' =>
               {
               'SIGNAL_NAME'   => 'BrkOnOffSwtch_D_Actl_2',      'CANOE_ENV_VAR' => 'EnvBrkOnOffSwtch_D_Actl_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngControlData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrkOnOffSwtch_D_Actl_2.EngControlData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrkOnOffSwtch_D_Actl_2.EngControlData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' , 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EngAoutIdl_N_RqVsc' =>
               {
               'SIGNAL_NAME'   => 'EngAoutIdl_N_RqVsc',      'CANOE_ENV_VAR' => 'EnvEngAoutIdl_N_RqVsc_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngControlData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 11, 'OFFSET' => 0.000000, 'FACTOR' => 2.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'rpm',
               'LC_READ_PHYS'  => 'EngAoutIdl_N_RqVsc.EngControlData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EngAoutIdl_N_RqVsc.EngControlData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01111111' , 3 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'GearPos_D_TrgMt' =>
               {
               'SIGNAL_NAME'   => 'GearPos_D_TrgMt',      'CANOE_ENV_VAR' => 'EnvGearPos_D_TrgMt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngControlData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 24, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'GearPos_D_TrgMt.EngControlData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'GearPos_D_TrgMt.EngControlData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000001' , 4 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'GearRvrseActv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'GearRvrseActv_B_Actl',      'CANOE_ENV_VAR' => 'EnvGearRvrseActv_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngControlData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 25, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'GearRvrseActv_B_Actl.EngControlData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'GearRvrseActv_B_Actl.EngControlData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'NeutralSwActv_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'NeutralSwActv_D_Actl',      'CANOE_ENV_VAR' => 'EnvNeutralSwActv_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngControlData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 36, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'NeutralSwActv_D_Actl.EngControlData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'NeutralSwActv_D_Actl.EngControlData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TrnTotTq_Rt_Est' =>
               {
               'SIGNAL_NAME'   => 'TrnTotTq_Rt_Est',      'CANOE_ENV_VAR' => 'EnvTrnTotTq_Rt_Est_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngControlData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 16, 'OFFSET' => 0.000000, 'FACTOR' => 0.001000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TrnTotTq_Rt_Est.EngControlData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TrnTotTq_Rt_Est.EngControlData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehVLim_OverVS_KD' =>
               {
               'SIGNAL_NAME'   => 'VehVLim_OverVS_KD',      'CANOE_ENV_VAR' => 'EnvVehVLim_OverVS_KD_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngControlData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 33, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehVLim_OverVS_KD.EngControlData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehVLim_OverVS_KD.EngControlData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehVLim_Warning' =>
               {
               'SIGNAL_NAME'   => 'VehVLim_Warning',      'CANOE_ENV_VAR' => 'EnvVehVLim_Warning_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngControlData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 41, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehVLim_Warning.EngControlData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehVLim_Warning.EngControlData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EngVehicleSpThrottle (CGW) ID: 514 (0x202), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ApedPosPcActl_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'ApedPosPcActl_D_Qf',      'CANOE_ENV_VAR' => 'EnvApedPosPcActl_D_Qf_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngVehicleSpThrottle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 52, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ApedPosPcActl_D_Qf.EngVehicleSpThrottle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ApedPosPcActl_D_Qf.EngVehicleSpThrottle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ApedPos_Pc_ActlArb' =>
               {
               'SIGNAL_NAME'   => 'ApedPos_Pc_ActlArb',      'CANOE_ENV_VAR' => 'EnvApedPos_Pc_ActlArb_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngVehicleSpThrottle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 10, 'OFFSET' => 0.000000, 'FACTOR' => 0.100000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '%',
               'LC_READ_PHYS'  => 'ApedPos_Pc_ActlArb.EngVehicleSpThrottle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ApedPos_Pc_ActlArb.EngVehicleSpThrottle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EngAout_D_ReqTachoGain' =>
               {
               'SIGNAL_NAME'   => 'EngAout_D_ReqTachoGain',      'CANOE_ENV_VAR' => 'EnvEngAout_D_ReqTachoGain_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngVehicleSpThrottle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EngAout_D_ReqTachoGain.EngVehicleSpThrottle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EngAout_D_ReqTachoGain.EngVehicleSpThrottle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EngAout_N_Actl' =>
               {
               'SIGNAL_NAME'   => 'EngAout_N_Actl',      'CANOE_ENV_VAR' => 'EnvEngAout_N_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngVehicleSpThrottle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 13, 'OFFSET' => 0.000000, 'FACTOR' => 2.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'rpm',
               'LC_READ_PHYS'  => 'EngAout_N_Actl.EngVehicleSpThrottle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EngAout_N_Actl.EngVehicleSpThrottle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EngAout_N_ReqTacho' =>
               {
               'SIGNAL_NAME'   => 'EngAout_N_ReqTacho',      'CANOE_ENV_VAR' => 'EnvEngAout_N_ReqTacho_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngVehicleSpThrottle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 13, 'OFFSET' => 0.000000, 'FACTOR' => 2.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'rpm',
               'LC_READ_PHYS'  => 'EngAout_N_ReqTacho.EngVehicleSpThrottle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EngAout_N_ReqTacho.EngVehicleSpThrottle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00011111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID202_E2E_CNTProfile1' =>
               {
               'SIGNAL_NAME'   => 'ID202_E2E_CNTProfile1',      'CANOE_ENV_VAR' => 'EnvID202_E2E_CNTProfile1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngVehicleSpThrottle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 43, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID202_E2E_CNTProfile1.EngVehicleSpThrottle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID202_E2E_CNTProfile1.EngVehicleSpThrottle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID202_E2E_CRCProfile1' =>
               {
               'SIGNAL_NAME'   => 'ID202_E2E_CRCProfile1',      'CANOE_ENV_VAR' => 'EnvID202_E2E_CRCProfile1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'EngVehicleSpThrottle',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID202_E2E_CRCProfile1.EngVehicleSpThrottle.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID202_E2E_CRCProfile1.EngVehicleSpThrottle.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: DesiredTorqBrk_MAC (DSC) ID: 520 (0x208), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AbsActv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'AbsActv_B_Actl',      'CANOE_ENV_VAR' => 'EnvAbsActv_B_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 6, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AbsActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AbsActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Abs_B_Falt' =>
               {
               'SIGNAL_NAME'   => 'Abs_B_Falt',      'CANOE_ENV_VAR' => 'EnvAbs_B_Falt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Abs_B_Falt.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Abs_B_Falt.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrkAsst_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'BrkAsst_B_Actl',      'CANOE_ENV_VAR' => 'EnvBrkAsst_B_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrkAsst_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrkAsst_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DSC_OnOff_status_1' =>
               {
               'SIGNAL_NAME'   => 'DSC_OnOff_status_1',      'CANOE_ENV_VAR' => 'EnvDSC_OnOff_status_1_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSC_OnOff_status_1.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSC_OnOff_status_1.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DesiredTorqBrk_FVTx' =>
               {
               'SIGNAL_NAME'   => 'DesiredTorqBrk_FVTx',      'CANOE_ENV_VAR' => 'EnvDesiredTorqBrk_FVTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DesiredTorqBrk_FVTx.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DesiredTorqBrk_FVTx.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DesiredTorqBrk_MACTx' =>
               {
               'SIGNAL_NAME'   => 'DesiredTorqBrk_MACTx',      'CANOE_ENV_VAR' => 'EnvDesiredTorqBrk_MACTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DesiredTorqBrk_MACTx.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DesiredTorqBrk_MACTx.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EbdActv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'EbdActv_B_Actl',      'CANOE_ENV_VAR' => 'EnvEbdActv_B_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EbdActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EbdActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PrplDrgCtlActv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'PrplDrgCtlActv_B_Actl',      'CANOE_ENV_VAR' => 'EnvPrplDrgCtlActv_B_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PrplDrgCtlActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PrplDrgCtlActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PrplWhlTqRqMn_MAC_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'PrplWhlTqRqMn_MAC_No_Cnt',      'CANOE_ENV_VAR' => 'EnvPrplWhlTqRqMn_MAC_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PrplWhlTqRqMn_MAC_No_Cnt.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PrplWhlTqRqMn_MAC_No_Cnt.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PrplWhlTqRqMn_MAC_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'PrplWhlTqRqMn_MAC_No_Cs',      'CANOE_ENV_VAR' => 'EnvPrplWhlTqRqMn_MAC_No_Cs_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PrplWhlTqRqMn_MAC_No_Cs.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PrplWhlTqRqMn_MAC_No_Cs.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RolStabCtlActv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'RolStabCtlActv_B_Actl',      'CANOE_ENV_VAR' => 'EnvRolStabCtlActv_B_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RolStabCtlActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RolStabCtlActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'StabCtlBrkActv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'StabCtlBrkActv_B_Actl',      'CANOE_ENV_VAR' => 'EnvStabCtlBrkActv_B_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 4, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'StabCtlBrkActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'StabCtlBrkActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TracCtlBrkActv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'TracCtlBrkActv_B_Actl',      'CANOE_ENV_VAR' => 'EnvTracCtlBrkActv_B_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 2, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TracCtlBrkActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TracCtlBrkActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TracCtlPtActv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'TracCtlPtActv_B_Actl',      'CANOE_ENV_VAR' => 'EnvTracCtlPtActv_B_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TracCtlPtActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TracCtlPtActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TsaCtlActv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'TsaCtlActv_B_Actl',      'CANOE_ENV_VAR' => 'EnvTsaCtlActv_B_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'DesiredTorqBrk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TsaCtlActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TsaCtlActv_B_Actl.DesiredTorqBrk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: AEB_Longitudinal_Req_Brk_MAC (CGW) ID: 530 (0x212), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AEB_BA_Level' =>
               {
               'SIGNAL_NAME'   => 'AEB_BA_Level',      'CANOE_ENV_VAR' => 'EnvAEB_BA_Level_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 29, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_BA_Level.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_BA_Level.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_Fail_Flag_Brk' =>
               {
               'SIGNAL_NAME'   => 'AEB_Fail_Flag_Brk',      'CANOE_ENV_VAR' => 'EnvAEB_Fail_Flag_Brk_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 24, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_Fail_Flag_Brk.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_Fail_Flag_Brk.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_Longitudinal_Req_Brk_FVTx' =>
               {
               'SIGNAL_NAME'   => 'AEB_Longitudinal_Req_Brk_FVTx',      'CANOE_ENV_VAR' => 'EnvAEB_Longitudinal_Req_Brk_FVTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_Longitudinal_Req_Brk_FVTx.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_Longitudinal_Req_Brk_FVTx.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_Longitudinal_Req_Brk_MACTx' =>
               {
               'SIGNAL_NAME'   => 'AEB_Longitudinal_Req_Brk_MACTx',      'CANOE_ENV_VAR' => 'EnvAEB_Longitudinal_Req_Brk_MACTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_Longitudinal_Req_Brk_MACTx.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_Longitudinal_Req_Brk_MACTx.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_Prefill_Level' =>
               {
               'SIGNAL_NAME'   => 'AEB_Prefill_Level',      'CANOE_ENV_VAR' => 'EnvAEB_Prefill_Level_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 27, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_Prefill_Level.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_Prefill_Level.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_Types_brk' =>
               {
               'SIGNAL_NAME'   => 'AEB_Types_brk',      'CANOE_ENV_VAR' => 'EnvAEB_Types_brk_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_Types_brk.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_Types_brk.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_Warning_Jerk_Flag' =>
               {
               'SIGNAL_NAME'   => 'AEB_Warning_Jerk_Flag',      'CANOE_ENV_VAR' => 'EnvAEB_Warning_Jerk_Flag_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 25, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_Warning_Jerk_Flag.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_Warning_Jerk_Flag.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID212_E2E_CNTProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID212_E2E_CNTProfile2',      'CANOE_ENV_VAR' => 'EnvID212_E2E_CNTProfile2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID212_E2E_CNTProfile2.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID212_E2E_CNTProfile2.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID212_E2E_CRCProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID212_E2E_CRCProfile2',      'CANOE_ENV_VAR' => 'EnvID212_E2E_CRCProfile2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID212_E2E_CRCProfile2.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID212_E2E_CRCProfile2.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Request_AEB_B_Deceleration' =>
               {
               'SIGNAL_NAME'   => 'Request_AEB_B_Deceleration',      'CANOE_ENV_VAR' => 'EnvRequest_AEB_B_Deceleration_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 10, 'OFFSET' => 0.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'm/sec2',
               'LC_READ_PHYS'  => 'Request_AEB_B_Deceleration.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Request_AEB_B_Deceleration.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Request_AEB_B_Flag' =>
               {
               'SIGNAL_NAME'   => 'Request_AEB_B_Flag',      'CANOE_ENV_VAR' => 'EnvRequest_AEB_B_Flag_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Request_AEB_B_Flag.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Request_AEB_B_Flag.AEB_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: AEB_Longitudinal_Request_Pt_MAC (CGW) ID: 531 (0x213), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AEB_Fail_Flag_Pt' =>
               {
               'SIGNAL_NAME'   => 'AEB_Fail_Flag_Pt',      'CANOE_ENV_VAR' => 'EnvAEB_Fail_Flag_Pt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Request_Pt_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_Fail_Flag_Pt.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_Fail_Flag_Pt.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_Longitudinal_Req_Pt_FVTx' =>
               {
               'SIGNAL_NAME'   => 'AEB_Longitudinal_Req_Pt_FVTx',      'CANOE_ENV_VAR' => 'EnvAEB_Longitudinal_Req_Pt_FVTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Request_Pt_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_Longitudinal_Req_Pt_FVTx.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_Longitudinal_Req_Pt_FVTx.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_Longitudinal_Req_Pt_MACTx' =>
               {
               'SIGNAL_NAME'   => 'AEB_Longitudinal_Req_Pt_MACTx',      'CANOE_ENV_VAR' => 'EnvAEB_Longitudinal_Req_Pt_MACTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Request_Pt_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_Longitudinal_Req_Pt_MACTx.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_Longitudinal_Req_Pt_MACTx.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_Types_pt' =>
               {
               'SIGNAL_NAME'   => 'AEB_Types_pt',      'CANOE_ENV_VAR' => 'EnvAEB_Types_pt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Request_Pt_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_Types_pt.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_Types_pt.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID213_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'ID213_No_Cnt',      'CANOE_ENV_VAR' => 'EnvID213_No_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Request_Pt_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID213_No_Cnt.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID213_No_Cnt.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID213_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'ID213_No_Cs',      'CANOE_ENV_VAR' => 'EnvID213_No_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Request_Pt_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID213_No_Cs.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID213_No_Cs.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Request_AEB_Acceleration' =>
               {
               'SIGNAL_NAME'   => 'Request_AEB_Acceleration',      'CANOE_ENV_VAR' => 'EnvRequest_AEB_Acceleration_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Request_Pt_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 12, 'OFFSET' => -10.000000, 'FACTOR' => 0.005000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'm/sec2',
               'LC_READ_PHYS'  => 'Request_AEB_Acceleration.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Request_AEB_Acceleration.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00011111' , 3 => '0b11111110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Request_AEB_Set_Flag' =>
               {
               'SIGNAL_NAME'   => 'Request_AEB_Set_Flag',      'CANOE_ENV_VAR' => 'EnvRequest_AEB_Set_Flag_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'AEB_Longitudinal_Request_Pt_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 24, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Request_AEB_Set_Flag.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Request_AEB_Set_Flag.AEB_Longitudinal_Request_Pt_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: ADAS_Longitudinal_Req_Brk_MAC (CGW) ID: 532 (0x214), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ADAS_DSC_Request_ON_Flag' =>
               {
               'SIGNAL_NAME'   => 'ADAS_DSC_Request_ON_Flag',      'CANOE_ENV_VAR' => 'EnvADAS_DSC_Request_ON_Flag_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_DSC_Request_ON_Flag.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_DSC_Request_ON_Flag.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_Hold_Release_Request_Flag' =>
               {
               'SIGNAL_NAME'   => 'ADAS_Hold_Release_Request_Flag',      'CANOE_ENV_VAR' => 'EnvADAS_Hold_Release_Request_Flag_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_Hold_Release_Request_Flag.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_Hold_Release_Request_Flag.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_Hold_Request_Flag' =>
               {
               'SIGNAL_NAME'   => 'ADAS_Hold_Request_Flag',      'CANOE_ENV_VAR' => 'EnvADAS_Hold_Request_Flag_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_Hold_Request_Flag.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_Hold_Request_Flag.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_Longitudinal_Req_Brk_FVTx' =>
               {
               'SIGNAL_NAME'   => 'ADAS_Longitudinal_Req_Brk_FVTx',      'CANOE_ENV_VAR' => 'EnvADAS_Longitudinal_Req_Brk_FVTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_Longitudinal_Req_Brk_FVTx.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_Longitudinal_Req_Brk_FVTx.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_Longitudinal_Req_Brk_MACTx' =>
               {
               'SIGNAL_NAME'   => 'ADAS_Longitudinal_Req_Brk_MACTx',      'CANOE_ENV_VAR' => 'EnvADAS_Longitudinal_Req_Brk_MACTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_Longitudinal_Req_Brk_MACTx.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_Longitudinal_Req_Brk_MACTx.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_Stop_Request_Flag' =>
               {
               'SIGNAL_NAME'   => 'ADAS_Stop_Request_Flag',      'CANOE_ENV_VAR' => 'EnvADAS_Stop_Request_Flag_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_Stop_Request_Flag.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_Stop_Request_Flag.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ADAS_Types_brk' =>
               {
               'SIGNAL_NAME'   => 'ADAS_Types_brk',      'CANOE_ENV_VAR' => 'EnvADAS_Types_brk_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ADAS_Types_brk.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ADAS_Types_brk.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_ExternalApply_D_Rq_VCM' =>
               {
               'SIGNAL_NAME'   => 'EPB_ExternalApply_D_Rq_VCM',      'CANOE_ENV_VAR' => 'EnvEPB_ExternalApply_D_Rq_VCM_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_ExternalApply_D_Rq_VCM.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_ExternalApply_D_Rq_VCM.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID214_E2E_CNTProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID214_E2E_CNTProfile2',      'CANOE_ENV_VAR' => 'EnvID214_E2E_CNTProfile2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID214_E2E_CNTProfile2.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID214_E2E_CNTProfile2.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID214_E2E_CRCProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID214_E2E_CRCProfile2',      'CANOE_ENV_VAR' => 'EnvID214_E2E_CRCProfile2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_Longitudinal_Req_Brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID214_E2E_CRCProfile2.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID214_E2E_CRCProfile2.ADAS_Longitudinal_Req_Brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: WheelSpeed (CGW) ID: 533 (0x215), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'FLwheelSpeed' =>
               {
               'SIGNAL_NAME'   => 'FLwheelSpeed',      'CANOE_ENV_VAR' => 'EnvFLwheelSpeed_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'WheelSpeed',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 16, 'OFFSET' => -100.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'km/h',
               'LC_READ_PHYS'  => 'FLwheelSpeed.WheelSpeed.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FLwheelSpeed.WheelSpeed.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FRwheelSpeed' =>
               {
               'SIGNAL_NAME'   => 'FRwheelSpeed',      'CANOE_ENV_VAR' => 'EnvFRwheelSpeed_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'WheelSpeed',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 16, 'OFFSET' => -100.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'km/h',
               'LC_READ_PHYS'  => 'FRwheelSpeed.WheelSpeed.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FRwheelSpeed.WheelSpeed.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RLwheelSpeed' =>
               {
               'SIGNAL_NAME'   => 'RLwheelSpeed',      'CANOE_ENV_VAR' => 'EnvRLwheelSpeed_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'WheelSpeed',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 16, 'OFFSET' => -100.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'km/h',
               'LC_READ_PHYS'  => 'RLwheelSpeed.WheelSpeed.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RLwheelSpeed.WheelSpeed.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RRwheelSpeed' =>
               {
               'SIGNAL_NAME'   => 'RRwheelSpeed',      'CANOE_ENV_VAR' => 'EnvRRwheelSpeed_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'WheelSpeed',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 16, 'OFFSET' => -100.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'km/h',
               'LC_READ_PHYS'  => 'RRwheelSpeed.WheelSpeed.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RRwheelSpeed.WheelSpeed.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: WheelData2 (DSC) ID: 537 (0x219), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'VehVActlBrk2_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'VehVActlBrk2_No_Cnt',      'CANOE_ENV_VAR' => 'EnvVehVActlBrk2_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehVActlBrk2_No_Cnt.WheelData2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehVActlBrk2_No_Cnt.WheelData2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VehVActlBrk2_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'VehVActlBrk2_No_Cs',      'CANOE_ENV_VAR' => 'EnvVehVActlBrk2_No_Cs_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 43, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VehVActlBrk2_No_Cs.WheelData2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VehVActlBrk2_No_Cs.WheelData2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00001111' , 6 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatFl2_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatFl2_No_Cnt',      'CANOE_ENV_VAR' => 'EnvWhlRotatFl2_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatFl2_No_Cnt.WheelData2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatFl2_No_Cnt.WheelData2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatFl_Direction' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatFl_Direction',      'CANOE_ENV_VAR' => 'EnvWhlRotatFl_Direction_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 37, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatFl_Direction.WheelData2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatFl_Direction.WheelData2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatFr2_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatFr2_No_Cnt',      'CANOE_ENV_VAR' => 'EnvWhlRotatFr2_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatFr2_No_Cnt.WheelData2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatFr2_No_Cnt.WheelData2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatFr_Direction' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatFr_Direction',      'CANOE_ENV_VAR' => 'EnvWhlRotatFr_Direction_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatFr_Direction.WheelData2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatFr_Direction.WheelData2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatRl2_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatRl2_No_Cnt',      'CANOE_ENV_VAR' => 'EnvWhlRotatRl2_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatRl2_No_Cnt.WheelData2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatRl2_No_Cnt.WheelData2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatRl_Direction' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatRl_Direction',      'CANOE_ENV_VAR' => 'EnvWhlRotatRl_Direction_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 33, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatRl_Direction.WheelData2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatRl_Direction.WheelData2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatRr2_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatRr2_No_Cnt',      'CANOE_ENV_VAR' => 'EnvWhlRotatRr2_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatRr2_No_Cnt.WheelData2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatRr2_No_Cnt.WheelData2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'WhlRotatRr_Direction' =>
               {
               'SIGNAL_NAME'   => 'WhlRotatRr_Direction',      'CANOE_ENV_VAR' => 'EnvWhlRotatRr_Direction_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'WheelData2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'WhlRotatRr_Direction.WheelData2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'WhlRotatRr_Direction.WheelData2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: TransGearData (CGW) ID: 552 (0x228), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AT_FailSafeLvl_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'AT_FailSafeLvl_D_Rq',      'CANOE_ENV_VAR' => 'EnvAT_FailSafeLvl_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 25, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AT_FailSafeLvl_D_Rq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AT_FailSafeLvl_D_Rq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AT_INDLvl_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'AT_INDLvl_D_Rq',      'CANOE_ENV_VAR' => 'EnvAT_INDLvl_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AT_INDLvl_D_Rq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AT_INDLvl_D_Rq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AT_OILTEMPHi_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'AT_OILTEMPHi_D_Rq',      'CANOE_ENV_VAR' => 'EnvAT_OILTEMPHi_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AT_OILTEMPHi_D_Rq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AT_OILTEMPHi_D_Rq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DispAtLvrPos_ArrowReq' =>
               {
               'SIGNAL_NAME'   => 'DispAtLvrPos_ArrowReq',      'CANOE_ENV_VAR' => 'EnvDispAtLvrPos_ArrowReq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 32, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DispAtLvrPos_ArrowReq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DispAtLvrPos_ArrowReq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DispAtLvrPos_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'DispAtLvrPos_D_Rq',      'CANOE_ENV_VAR' => 'EnvDispAtLvrPos_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DispAtLvrPos_D_Rq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DispAtLvrPos_D_Rq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DispAtLvrPos_FlashReq' =>
               {
               'SIGNAL_NAME'   => 'DispAtLvrPos_FlashReq',      'CANOE_ENV_VAR' => 'EnvDispAtLvrPos_FlashReq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DispAtLvrPos_FlashReq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DispAtLvrPos_FlashReq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DispAtLvrPos_Off_Req' =>
               {
               'SIGNAL_NAME'   => 'DispAtLvrPos_Off_Req',      'CANOE_ENV_VAR' => 'EnvDispAtLvrPos_Off_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 37, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DispAtLvrPos_Off_Req.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DispAtLvrPos_Off_Req.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DispGearPos_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'DispGearPos_D_Rq',      'CANOE_ENV_VAR' => 'EnvDispGearPos_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DispGearPos_D_Rq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DispGearPos_D_Rq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DispGearPos_FlashReq' =>
               {
               'SIGNAL_NAME'   => 'DispGearPos_FlashReq',      'CANOE_ENV_VAR' => 'EnvDispGearPos_FlashReq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DispGearPos_FlashReq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DispGearPos_FlashReq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID228_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'ID228_No_Cnt',      'CANOE_ENV_VAR' => 'EnvID228_No_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 51, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID228_No_Cnt.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID228_No_Cnt.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID228_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'ID228_No_Cs',      'CANOE_ENV_VAR' => 'EnvID228_No_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID228_No_Cs.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID228_No_Cs.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'OD_Hold_Sport_Flash' =>
               {
               'SIGNAL_NAME'   => 'OD_Hold_Sport_Flash',      'CANOE_ENV_VAR' => 'EnvOD_Hold_Sport_Flash_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'OD_Hold_Sport_Flash.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'OD_Hold_Sport_Flash.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ParkLockWarning_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'ParkLockWarning_D_Rq',      'CANOE_ENV_VAR' => 'EnvParkLockWarning_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ParkLockWarning_D_Rq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ParkLockWarning_D_Rq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PwrDwn_D_Req_ByTCM' =>
               {
               'SIGNAL_NAME'   => 'PwrDwn_D_Req_ByTCM',      'CANOE_ENV_VAR' => 'EnvPwrDwn_D_Req_ByTCM_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 27, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PwrDwn_D_Req_ByTCM.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PwrDwn_D_Req_ByTCM.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SBW_INDLvl_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'SBW_INDLvl_D_Rq',      'CANOE_ENV_VAR' => 'EnvSBW_INDLvl_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 29, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SBW_INDLvl_D_Rq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SBW_INDLvl_D_Rq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SbwWarningLamp_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'SbwWarningLamp_B_Rq',      'CANOE_ENV_VAR' => 'EnvSbwWarningLamp_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 18, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SbwWarningLamp_B_Rq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SbwWarningLamp_B_Rq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ShiftOpeWarning_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'ShiftOpeWarning_D_Rq',      'CANOE_ENV_VAR' => 'EnvShiftOpeWarning_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ShiftOpeWarning_D_Rq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ShiftOpeWarning_D_Rq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ShiftPos_D_Act' =>
               {
               'SIGNAL_NAME'   => 'ShiftPos_D_Act',      'CANOE_ENV_VAR' => 'EnvShiftPos_D_Act_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 43, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ShiftPos_D_Act.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ShiftPos_D_Act.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ShiftPos_D_Trg' =>
               {
               'SIGNAL_NAME'   => 'ShiftPos_D_Trg',      'CANOE_ENV_VAR' => 'EnvShiftPos_D_Trg_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 36, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ShiftPos_D_Trg.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ShiftPos_D_Trg.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00011110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ShiftrPos_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'ShiftrPos_D_Qf',      'CANOE_ENV_VAR' => 'EnvShiftrPos_D_Qf_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 17, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ShiftrPos_D_Qf.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ShiftrPos_D_Qf.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TransmChangeLeverPosition' =>
               {
               'SIGNAL_NAME'   => 'TransmChangeLeverPosition',      'CANOE_ENV_VAR' => 'EnvTransmChangeLeverPosition_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TransmChangeLeverPosition.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TransmChangeLeverPosition.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TransmParking_D_Act' =>
               {
               'SIGNAL_NAME'   => 'TransmParking_D_Act',      'CANOE_ENV_VAR' => 'EnvTransmParking_D_Act_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TransmParking_D_Act.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TransmParking_D_Act.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TrnCnvtClu_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'TrnCnvtClu_D_Actl',      'CANOE_ENV_VAR' => 'EnvTrnCnvtClu_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TrnCnvtClu_D_Actl.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TrnCnvtClu_D_Actl.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TrnShifActv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'TrnShifActv_B_Actl',      'CANOE_ENV_VAR' => 'EnvTrnShifActv_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TrnShifActv_B_Actl.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TrnShifActv_B_Actl.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TrnSlaCtlFlag' =>
               {
               'SIGNAL_NAME'   => 'TrnSlaCtlFlag',      'CANOE_ENV_VAR' => 'EnvTrnSlaCtlFlag_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TrnSlaCtlFlag.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TrnSlaCtlFlag.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TrnSlaCtl_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'TrnSlaCtl_B_Rq',      'CANOE_ENV_VAR' => 'EnvTrnSlaCtl_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'TransGearData',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TrnSlaCtl_B_Rq.TransGearData.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TrnSlaCtl_B_Rq.TransGearData.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EPAS_Info_MAC (EPAS) ID: 570 (0x23a), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'EPAS_Info_FVTx' =>
               {
               'SIGNAL_NAME'   => 'EPAS_Info_FVTx',      'CANOE_ENV_VAR' => 'EnvEPAS_Info_FVTx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Info_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPAS_Info_FVTx.EPAS_Info_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPAS_Info_FVTx.EPAS_Info_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPAS_Info_MACTx' =>
               {
               'SIGNAL_NAME'   => 'EPAS_Info_MACTx',      'CANOE_ENV_VAR' => 'EnvEPAS_Info_MACTx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Info_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPAS_Info_MACTx.EPAS_Info_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPAS_Info_MACTx.EPAS_Info_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Epas_ContStatus' =>
               {
               'SIGNAL_NAME'   => 'Epas_ContStatus',      'CANOE_ENV_VAR' => 'EnvEpas_ContStatus_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Info_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Epas_ContStatus.EPAS_Info_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Epas_ContStatus.EPAS_Info_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteAngChRate_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'SteAngChRate_No_Cnt',      'CANOE_ENV_VAR' => 'EnvSteAngChRate_No_Cnt_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Info_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteAngChRate_No_Cnt.EPAS_Info_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteAngChRate_No_Cnt.EPAS_Info_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteeringAngleChangeRate' =>
               {
               'SIGNAL_NAME'   => 'SteeringAngleChangeRate',      'CANOE_ENV_VAR' => 'EnvSteeringAngleChangeRate_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Info_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 16, 'OFFSET' => 0.000000, 'FACTOR' => 0.100000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'SIGNED', 'UNIT' => 'deg/s',
               'LC_READ_PHYS'  => 'SteeringAngleChangeRate.EPAS_Info_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteeringAngleChangeRate.EPAS_Info_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteeringColumnTorque' =>
               {
               'SIGNAL_NAME'   => 'SteeringColumnTorque',      'CANOE_ENV_VAR' => 'EnvSteeringColumnTorque_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Info_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => -12.700000, 'FACTOR' => 0.100000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Nm',
               'LC_READ_PHYS'  => 'SteeringColumnTorque.EPAS_Info_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteeringColumnTorque.EPAS_Info_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EPAS_Info (EPAS) ID: 576 (0x240), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'SteerMtrCurrent_I_Actl' =>
               {
               'SIGNAL_NAME'   => 'SteerMtrCurrent_I_Actl',      'CANOE_ENV_VAR' => 'EnvSteerMtrCurrent_I_Actl_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Info',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 9, 'OFFSET' => -127.500000, 'FACTOR' => 0.500000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Ampere',
               'LC_READ_PHYS'  => 'SteerMtrCurrent_I_Actl.EPAS_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteerMtrCurrent_I_Actl.EPAS_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: SmartKeylessRequest (CGW) ID: 628 (0x274), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ABS_Tx_Request' =>
               {
               'SIGNAL_NAME'   => 'ABS_Tx_Request',      'CANOE_ENV_VAR' => 'EnvABS_Tx_Request_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 42, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ABS_Tx_Request.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ABS_Tx_Request.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ESCL_Display' =>
               {
               'SIGNAL_NAME'   => 'ESCL_Display',      'CANOE_ENV_VAR' => 'EnvESCL_Display_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ESCL_Display.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ESCL_Display.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Eng_start_Display' =>
               {
               'SIGNAL_NAME'   => 'Eng_start_Display',      'CANOE_ENV_VAR' => 'EnvEng_start_Display_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 17, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Eng_start_Display.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Eng_start_Display.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Key_Battery_Low' =>
               {
               'SIGNAL_NAME'   => 'Key_Battery_Low',      'CANOE_ENV_VAR' => 'EnvKey_Battery_Low_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Key_Battery_Low.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Key_Battery_Low.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Key_Not_Found' =>
               {
               'SIGNAL_NAME'   => 'Key_Not_Found',      'CANOE_ENV_VAR' => 'EnvKey_Not_Found_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 38, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Key_Not_Found.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Key_Not_Found.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b01110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Lamp_KEY_GREEN_Control' =>
               {
               'SIGNAL_NAME'   => 'Lamp_KEY_GREEN_Control',      'CANOE_ENV_VAR' => 'EnvLamp_KEY_GREEN_Control_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Lamp_KEY_GREEN_Control.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Lamp_KEY_GREEN_Control.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Lamp_KEY_RED_Control' =>
               {
               'SIGNAL_NAME'   => 'Lamp_KEY_RED_Control',      'CANOE_ENV_VAR' => 'EnvLamp_KEY_RED_Control_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Lamp_KEY_RED_Control.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Lamp_KEY_RED_Control.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000111' , 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Power_Not_Off' =>
               {
               'SIGNAL_NAME'   => 'Power_Not_Off',      'CANOE_ENV_VAR' => 'EnvPower_Not_Off_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 24, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Power_Not_Off.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Power_Not_Off.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Press_pedal_Display' =>
               {
               'SIGNAL_NAME'   => 'Press_pedal_Display',      'CANOE_ENV_VAR' => 'EnvPress_pedal_Display_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Press_pedal_Display.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Press_pedal_Display.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Shift_lever_Display' =>
               {
               'SIGNAL_NAME'   => 'Shift_lever_Display',      'CANOE_ENV_VAR' => 'EnvShift_lever_Display_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Shift_lever_Display.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Shift_lever_Display.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Shift_position_Display' =>
               {
               'SIGNAL_NAME'   => 'Shift_position_Display',      'CANOE_ENV_VAR' => 'EnvShift_position_Display_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Shift_position_Display.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Shift_position_Display.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'System_Check' =>
               {
               'SIGNAL_NAME'   => 'System_Check',      'CANOE_ENV_VAR' => 'EnvSystem_Check_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'SmartKeylessRequest',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 41, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'System_Check.SmartKeylessRequest.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'System_Check.SmartKeylessRequest.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: crashoutput_MAC (RCM) ID: 830 (0x33e), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'FuelCutoffReq' =>
               {
               'SIGNAL_NAME'   => 'FuelCutoffReq',      'CANOE_ENV_VAR' => 'EnvFuelCutoffReq_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FuelCutoffReq.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FuelCutoffReq.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00111100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID33E_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'ID33E_No_Cnt',      'CANOE_ENV_VAR' => 'EnvID33E_No_Cnt_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID33E_No_Cnt.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID33E_No_Cnt.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID33E_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'ID33E_No_Cs',      'CANOE_ENV_VAR' => 'EnvID33E_No_Cs_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID33E_No_Cs.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID33E_No_Cs.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RcmStat_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'RcmStat_B_Actl',      'CANOE_ENV_VAR' => 'EnvRcmStat_B_Actl_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RcmStat_B_Actl.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RcmStat_B_Actl.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'crashoutput_FVTx' =>
               {
               'SIGNAL_NAME'   => 'crashoutput_FVTx',      'CANOE_ENV_VAR' => 'Envcrashoutput_FVTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'crashoutput_FVTx.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'crashoutput_FVTx.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'crashoutput_MACTx' =>
               {
               'SIGNAL_NAME'   => 'crashoutput_MACTx',      'CANOE_ENV_VAR' => 'Envcrashoutput_MACTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'crashoutput_MACTx.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'crashoutput_MACTx.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_over_front' =>
               {
               'SIGNAL_NAME'   => 'threshold_over_front',      'CANOE_ENV_VAR' => 'Envthreshold_over_front_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_over_front.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_over_front.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_over_rear' =>
               {
               'SIGNAL_NAME'   => 'threshold_over_rear',      'CANOE_ENV_VAR' => 'Envthreshold_over_rear_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_over_rear.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_over_rear.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_over_rollover' =>
               {
               'SIGNAL_NAME'   => 'threshold_over_rollover',      'CANOE_ENV_VAR' => 'Envthreshold_over_rollover_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_over_rollover.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_over_rollover.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_over_rollover_static' =>
               {
               'SIGNAL_NAME'   => 'threshold_over_rollover_static',      'CANOE_ENV_VAR' => 'Envthreshold_over_rollover_static_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_over_rollover_static.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_over_rollover_static.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_over_side_Driver' =>
               {
               'SIGNAL_NAME'   => 'threshold_over_side_Driver',      'CANOE_ENV_VAR' => 'Envthreshold_over_side_Driver_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_over_side_Driver.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_over_side_Driver.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_over_side_passenger' =>
               {
               'SIGNAL_NAME'   => 'threshold_over_side_passenger',      'CANOE_ENV_VAR' => 'Envthreshold_over_side_passenger_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_over_side_passenger.crashoutput_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_over_side_passenger.crashoutput_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: crashoutput_brk_MAC (RCM) ID: 831 (0x33f), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ID33F_E2E_CNTProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID33F_E2E_CNTProfile2',      'CANOE_ENV_VAR' => 'EnvID33F_E2E_CNTProfile2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID33F_E2E_CNTProfile2.crashoutput_brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID33F_E2E_CNTProfile2.crashoutput_brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID33F_E2E_CRCProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID33F_E2E_CRCProfile2',      'CANOE_ENV_VAR' => 'EnvID33F_E2E_CRCProfile2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID33F_E2E_CRCProfile2.crashoutput_brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID33F_E2E_CRCProfile2.crashoutput_brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RcmStat_B_Actl_brk' =>
               {
               'SIGNAL_NAME'   => 'RcmStat_B_Actl_brk',      'CANOE_ENV_VAR' => 'EnvRcmStat_B_Actl_brk_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 17, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RcmStat_B_Actl_brk.crashoutput_brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RcmStat_B_Actl_brk.crashoutput_brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'crashoutput_brk_FVTx' =>
               {
               'SIGNAL_NAME'   => 'crashoutput_brk_FVTx',      'CANOE_ENV_VAR' => 'Envcrashoutput_brk_FVTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'crashoutput_brk_FVTx.crashoutput_brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'crashoutput_brk_FVTx.crashoutput_brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'crashoutput_brk_MACTx' =>
               {
               'SIGNAL_NAME'   => 'crashoutput_brk_MACTx',      'CANOE_ENV_VAR' => 'Envcrashoutput_brk_MACTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'crashoutput_brk_MACTx.crashoutput_brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'crashoutput_brk_MACTx.crashoutput_brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_ovr_front_brk' =>
               {
               'SIGNAL_NAME'   => 'threshold_ovr_front_brk',      'CANOE_ENV_VAR' => 'Envthreshold_ovr_front_brk_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_ovr_front_brk.crashoutput_brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_ovr_front_brk.crashoutput_brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_ovr_rear_brk' =>
               {
               'SIGNAL_NAME'   => 'threshold_ovr_rear_brk',      'CANOE_ENV_VAR' => 'Envthreshold_ovr_rear_brk_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_ovr_rear_brk.crashoutput_brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_ovr_rear_brk.crashoutput_brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_ovr_rollover_brk' =>
               {
               'SIGNAL_NAME'   => 'threshold_ovr_rollover_brk',      'CANOE_ENV_VAR' => 'Envthreshold_ovr_rollover_brk_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_ovr_rollover_brk.crashoutput_brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_ovr_rollover_brk.crashoutput_brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_ovr_side_Driver_brk' =>
               {
               'SIGNAL_NAME'   => 'threshold_ovr_side_Driver_brk',      'CANOE_ENV_VAR' => 'Envthreshold_ovr_side_Driver_brk_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_ovr_side_Driver_brk.crashoutput_brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_ovr_side_Driver_brk.crashoutput_brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'threshold_ovr_side_pass_brk' =>
               {
               'SIGNAL_NAME'   => 'threshold_ovr_side_pass_brk',      'CANOE_ENV_VAR' => 'Envthreshold_ovr_side_pass_brk_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'crashoutput_brk_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'threshold_ovr_side_pass_brk.crashoutput_brk_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'threshold_ovr_side_pass_brk.crashoutput_brk_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCMStatusMessage_MAC (RCM) ID: 832 (0x340), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ConnectedEDRTrigger' =>
               {
               'SIGNAL_NAME'   => 'ConnectedEDRTrigger',      'CANOE_ENV_VAR' => 'EnvConnectedEDRTrigger_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ConnectedEDRTrigger.RCMStatusMessage_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ConnectedEDRTrigger.RCMStatusMessage_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DHS_RILReq' =>
               {
               'SIGNAL_NAME'   => 'DHS_RILReq',      'CANOE_ENV_VAR' => 'EnvDHS_RILReq_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DHS_RILReq.RCMStatusMessage_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DHS_RILReq.RCMStatusMessage_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FirstRowBucklePsngr' =>
               {
               'SIGNAL_NAME'   => 'FirstRowBucklePsngr',      'CANOE_ENV_VAR' => 'EnvFirstRowBucklePsngr_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FirstRowBucklePsngr.RCMStatusMessage_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FirstRowBucklePsngr.RCMStatusMessage_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' , 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID340_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'ID340_No_Cnt',      'CANOE_ENV_VAR' => 'EnvID340_No_Cnt_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID340_No_Cnt.RCMStatusMessage_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID340_No_Cnt.RCMStatusMessage_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID340_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'ID340_No_Cs',      'CANOE_ENV_VAR' => 'EnvID340_No_Cs_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID340_No_Cs.RCMStatusMessage_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID340_No_Cs.RCMStatusMessage_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'OCS_Status' =>
               {
               'SIGNAL_NAME'   => 'OCS_Status',      'CANOE_ENV_VAR' => 'EnvOCS_Status_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 2, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'OCS_Status.RCMStatusMessage_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'OCS_Status.RCMStatusMessage_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PAD_Ind_Req' =>
               {
               'SIGNAL_NAME'   => 'PAD_Ind_Req',      'CANOE_ENV_VAR' => 'EnvPAD_Ind_Req_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PAD_Ind_Req.RCMStatusMessage_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PAD_Ind_Req.RCMStatusMessage_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCMStatusMessage_FVTx' =>
               {
               'SIGNAL_NAME'   => 'RCMStatusMessage_FVTx',      'CANOE_ENV_VAR' => 'EnvRCMStatusMessage_FVTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMStatusMessage_FVTx.RCMStatusMessage_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMStatusMessage_FVTx.RCMStatusMessage_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCMStatusMessage_MACTx' =>
               {
               'SIGNAL_NAME'   => 'RCMStatusMessage_MACTx',      'CANOE_ENV_VAR' => 'EnvRCMStatusMessage_MACTx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMStatusMessage_MACTx.RCMStatusMessage_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMStatusMessage_MACTx.RCMStatusMessage_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RILReq' =>
               {
               'SIGNAL_NAME'   => 'RILReq',      'CANOE_ENV_VAR' => 'EnvRILReq_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMStatusMessage_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RILReq.RCMStatusMessage_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RILReq.RCMStatusMessage_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Longitudinal_Lateral_deltaV (RCM) ID: 834 (0x342), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'Maximum_Lateral_deltaV_1' =>
               {
               'SIGNAL_NAME'   => 'Maximum_Lateral_deltaV_1',      'CANOE_ENV_VAR' => 'EnvMaximum_Lateral_deltaV_1_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'Longitudinal_Lateral_deltaV',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => -100.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'km/h',
               'LC_READ_PHYS'  => 'Maximum_Lateral_deltaV_1.Longitudinal_Lateral_deltaV.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Maximum_Lateral_deltaV_1.Longitudinal_Lateral_deltaV.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Maximum_Lateral_deltaV_2' =>
               {
               'SIGNAL_NAME'   => 'Maximum_Lateral_deltaV_2',      'CANOE_ENV_VAR' => 'EnvMaximum_Lateral_deltaV_2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'Longitudinal_Lateral_deltaV',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 29, 'LENGTH' => 8, 'OFFSET' => -100.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'km/h',
               'LC_READ_PHYS'  => 'Maximum_Lateral_deltaV_2.Longitudinal_Lateral_deltaV.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Maximum_Lateral_deltaV_2.Longitudinal_Lateral_deltaV.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00111111' , 4 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Maximum_Longitudinal_deltaV_1' =>
               {
               'SIGNAL_NAME'   => 'Maximum_Longitudinal_deltaV_1',      'CANOE_ENV_VAR' => 'EnvMaximum_Longitudinal_deltaV_1_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'Longitudinal_Lateral_deltaV',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => -100.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'km/h',
               'LC_READ_PHYS'  => 'Maximum_Longitudinal_deltaV_1.Longitudinal_Lateral_deltaV.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Maximum_Longitudinal_deltaV_1.Longitudinal_Lateral_deltaV.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Maximum_Longitudinal_deltaV_2' =>
               {
               'SIGNAL_NAME'   => 'Maximum_Longitudinal_deltaV_2',      'CANOE_ENV_VAR' => 'EnvMaximum_Longitudinal_deltaV_2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'Longitudinal_Lateral_deltaV',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 8, 'OFFSET' => -100.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'km/h',
               'LC_READ_PHYS'  => 'Maximum_Longitudinal_deltaV_2.Longitudinal_Lateral_deltaV.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Maximum_Longitudinal_deltaV_2.Longitudinal_Lateral_deltaV.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00111111' , 3 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: GCC_Config_Mgmt (CGW) ID: 1034 (0x40a), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'BODY' =>
               {
               'SIGNAL_NAME'   => 'BODY',      'CANOE_ENV_VAR' => 'EnvBODY_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BODY.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BODY.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BRAND' =>
               {
               'SIGNAL_NAME'   => 'BRAND',      'CANOE_ENV_VAR' => 'EnvBRAND_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 23, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BRAND.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BRAND.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DEVELOPMENT_FUEL' =>
               {
               'SIGNAL_NAME'   => 'DEVELOPMENT_FUEL',      'CANOE_ENV_VAR' => 'EnvDEVELOPMENT_FUEL_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 43, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DEVELOPMENT_FUEL.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DEVELOPMENT_FUEL.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DRIVE' =>
               {
               'SIGNAL_NAME'   => 'DRIVE',      'CANOE_ENV_VAR' => 'EnvDRIVE_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 27, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DRIVE.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DRIVE.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ENGINE' =>
               {
               'SIGNAL_NAME'   => 'ENGINE',      'CANOE_ENV_VAR' => 'EnvENGINE_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 31, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ENGINE.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ENGINE.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'GCC_CfgParam' =>
               {
               'SIGNAL_NAME'   => 'GCC_CfgParam',      'CANOE_ENV_VAR' => 'EnvGCC_CfgParam_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' },
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'GCC_CfgParam.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'GCC_CfgParam.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MARKET' =>
               {
               'SIGNAL_NAME'   => 'MARKET',      'CANOE_ENV_VAR' => 'EnvMARKET_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MARKET.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MARKET.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Outer_Color_1' =>
               {
               'SIGNAL_NAME'   => 'Outer_Color_1',      'CANOE_ENV_VAR' => 'EnvOuter_Color_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 4 },
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Outer_Color_1.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Outer_Color_1.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Outer_Color_2' =>
               {
               'SIGNAL_NAME'   => 'Outer_Color_2',      'CANOE_ENV_VAR' => 'EnvOuter_Color_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 4 },
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Outer_Color_2.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Outer_Color_2.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Outer_Color_3' =>
               {
               'SIGNAL_NAME'   => 'Outer_Color_3',      'CANOE_ENV_VAR' => 'EnvOuter_Color_3_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 4 },
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Outer_Color_3.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Outer_Color_3.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PLANT' =>
               {
               'SIGNAL_NAME'   => 'PLANT',      'CANOE_ENV_VAR' => 'EnvPLANT_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 47, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PLANT.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PLANT.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Project_Code_1st' =>
               {
               'SIGNAL_NAME'   => 'Project_Code_1st',      'CANOE_ENV_VAR' => 'EnvProject_Code_1st_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 5 },
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Project_Code_1st.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Project_Code_1st.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Project_Code_2nd' =>
               {
               'SIGNAL_NAME'   => 'Project_Code_2nd',      'CANOE_ENV_VAR' => 'EnvProject_Code_2nd_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 5 },
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Project_Code_2nd.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Project_Code_2nd.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Project_Code_3rd' =>
               {
               'SIGNAL_NAME'   => 'Project_Code_3rd',      'CANOE_ENV_VAR' => 'EnvProject_Code_3rd_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 5 },
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Project_Code_3rd.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Project_Code_3rd.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Project_Code_4th' =>
               {
               'SIGNAL_NAME'   => 'Project_Code_4th',      'CANOE_ENV_VAR' => 'EnvProject_Code_4th_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 5 },
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Project_Code_4th.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Project_Code_4th.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ROOF' =>
               {
               'SIGNAL_NAME'   => 'ROOF',      'CANOE_ENV_VAR' => 'EnvROOF_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ROOF.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ROOF.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Reserved_05_1' =>
               {
               'SIGNAL_NAME'   => 'Reserved_05_1',      'CANOE_ENV_VAR' => 'EnvReserved_05_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 5 },
               'STARTBIT'      => 47, 'LENGTH' => 24, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Reserved_05_1.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Reserved_05_1.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Reserved_06_1' =>
               {
               'SIGNAL_NAME'   => 'Reserved_06_1',      'CANOE_ENV_VAR' => 'EnvReserved_06_1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 33, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Reserved_06_1.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Reserved_06_1.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Reserved_06_2' =>
               {
               'SIGNAL_NAME'   => 'Reserved_06_2',      'CANOE_ENV_VAR' => 'EnvReserved_06_2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 55, 'LENGTH' => 16, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Reserved_06_2.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Reserved_06_2.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Steering_Position' =>
               {
               'SIGNAL_NAME'   => 'Steering_Position',      'CANOE_ENV_VAR' => 'EnvSteering_Position_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 35, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Steering_Position.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Steering_Position.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TRANSMISSION' =>
               {
               'SIGNAL_NAME'   => 'TRANSMISSION',      'CANOE_ENV_VAR' => 'EnvTRANSMISSION_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 6 },
               'STARTBIT'      => 25, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TRANSMISSION.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TRANSMISSION.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Unit_Car_Line' =>
               {
               'SIGNAL_NAME'   => 'Unit_Car_Line',      'CANOE_ENV_VAR' => 'EnvUnit_Car_Line_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 4 },
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Unit_Car_Line.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Unit_Car_Line.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Unit_Destination' =>
               {
               'SIGNAL_NAME'   => 'Unit_Destination',      'CANOE_ENV_VAR' => 'EnvUnit_Destination_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 4 },
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Unit_Destination.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Unit_Destination.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Unit_Serial_Number' =>
               {
               'SIGNAL_NAME'   => 'Unit_Serial_Number',      'CANOE_ENV_VAR' => 'EnvUnit_Serial_Number_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 4 },
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Unit_Serial_Number.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Unit_Serial_Number.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Unit_Series' =>
               {
               'SIGNAL_NAME'   => 'Unit_Series',      'CANOE_ENV_VAR' => 'EnvUnit_Series_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 4 },
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Unit_Series.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Unit_Series.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_01' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_01',      'CANOE_ENV_VAR' => 'EnvVIN_Character_01_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 1 },
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_01.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_01.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_02' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_02',      'CANOE_ENV_VAR' => 'EnvVIN_Character_02_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 1 },
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_02.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_02.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_03' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_03',      'CANOE_ENV_VAR' => 'EnvVIN_Character_03_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 1 },
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_03.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_03.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_04' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_04',      'CANOE_ENV_VAR' => 'EnvVIN_Character_04_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 1 },
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_04.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_04.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_05' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_05',      'CANOE_ENV_VAR' => 'EnvVIN_Character_05_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 1 },
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_05.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_05.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_06' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_06',      'CANOE_ENV_VAR' => 'EnvVIN_Character_06_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 1 },
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_06.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_06.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_07' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_07',      'CANOE_ENV_VAR' => 'EnvVIN_Character_07_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 1 },
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_07.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_07.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_08' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_08',      'CANOE_ENV_VAR' => 'EnvVIN_Character_08_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 2 },
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_08.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_08.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_09' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_09',      'CANOE_ENV_VAR' => 'EnvVIN_Character_09_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 2 },
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_09.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_09.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_10' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_10',      'CANOE_ENV_VAR' => 'EnvVIN_Character_10_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 2 },
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_10.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_10.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_11' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_11',      'CANOE_ENV_VAR' => 'EnvVIN_Character_11_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 2 },
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_11.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_11.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_12' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_12',      'CANOE_ENV_VAR' => 'EnvVIN_Character_12_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 2 },
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_12.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_12.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_13' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_13',      'CANOE_ENV_VAR' => 'EnvVIN_Character_13_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 2 },
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_13.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_13.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_14' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_14',      'CANOE_ENV_VAR' => 'EnvVIN_Character_14_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 2 },
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_14.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_14.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_15' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_15',      'CANOE_ENV_VAR' => 'EnvVIN_Character_15_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 3 },
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_15.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_15.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_16' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_16',      'CANOE_ENV_VAR' => 'EnvVIN_Character_16_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 3 },
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_16.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_16.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_17' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_17',      'CANOE_ENV_VAR' => 'EnvVIN_Character_17_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 3 },
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_17.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_17.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_18' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_18',      'CANOE_ENV_VAR' => 'EnvVIN_Character_18_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 3 },
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_18.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_18.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_19' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_19',      'CANOE_ENV_VAR' => 'EnvVIN_Character_19_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 3 },
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_19.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_19.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_20' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_20',      'CANOE_ENV_VAR' => 'EnvVIN_Character_20_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 3 },
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_20.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_20.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VIN_Character_21' =>
               {
               'SIGNAL_NAME'   => 'VIN_Character_21',      'CANOE_ENV_VAR' => 'EnvVIN_Character_21_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'GCC_Config_Mgmt',
               'MULTIPLEX'     => { 'MASTER' => 'GCC_CfgParam' , 'CODE' => 3 },
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VIN_Character_21.GCC_Config_Mgmt.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VIN_Character_21.GCC_Config_Mgmt.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: BrakeSysFeatures_MAC (DSC) ID: 1044 (0x414), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'BrakeSysFeatures_FVTx' =>
               {
               'SIGNAL_NAME'   => 'BrakeSysFeatures_FVTx',      'CANOE_ENV_VAR' => 'EnvBrakeSysFeatures_FVTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrakeSysFeatures_FVTx.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrakeSysFeatures_FVTx.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrakeSysFeatures_MACTx' =>
               {
               'SIGNAL_NAME'   => 'BrakeSysFeatures_MACTx',      'CANOE_ENV_VAR' => 'EnvBrakeSysFeatures_MACTx_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrakeSysFeatures_MACTx.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrakeSysFeatures_MACTx.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrakeSysFeatures_MAC_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'BrakeSysFeatures_MAC_No_Cnt',      'CANOE_ENV_VAR' => 'EnvBrakeSysFeatures_MAC_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrakeSysFeatures_MAC_No_Cnt.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrakeSysFeatures_MAC_No_Cnt.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrakeSysFeatures_MAC_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'BrakeSysFeatures_MAC_No_Cs',      'CANOE_ENV_VAR' => 'EnvBrakeSysFeatures_MAC_No_Cs_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrakeSysFeatures_MAC_No_Cs.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrakeSysFeatures_MAC_No_Cs.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrkCtlLamp_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'BrkCtlLamp_D_Rq',      'CANOE_ENV_VAR' => 'EnvBrkCtlLamp_D_Rq_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 4, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrkCtlLamp_D_Rq.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrkCtlLamp_D_Rq.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrkLamp_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'BrkLamp_B_Rq',      'CANOE_ENV_VAR' => 'EnvBrkLamp_B_Rq_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrkLamp_B_Rq.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrkLamp_B_Rq.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrvAntiLckLamp_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'DrvAntiLckLamp_D_Rq',      'CANOE_ENV_VAR' => 'EnvDrvAntiLckLamp_D_Rq_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 2, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrvAntiLckLamp_D_Rq.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrvAntiLckLamp_D_Rq.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrvSlipCtlLamp_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'DrvSlipCtlLamp_D_Rq',      'CANOE_ENV_VAR' => 'EnvDrvSlipCtlLamp_D_Rq_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrvSlipCtlLamp_D_Rq.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrvSlipCtlLamp_D_Rq.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' , 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrvSlipCtlMde_D_Ind' =>
               {
               'SIGNAL_NAME'   => 'DrvSlipCtlMde_D_Ind',      'CANOE_ENV_VAR' => 'EnvDrvSlipCtlMde_D_Ind_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrvSlipCtlMde_D_Ind.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrvSlipCtlMde_D_Ind.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ParkBrkTelltale_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'ParkBrkTelltale_B_Actl',      'CANOE_ENV_VAR' => 'EnvParkBrkTelltale_B_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 6, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ParkBrkTelltale_B_Actl.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ParkBrkTelltale_B_Actl.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PrkBrkActv_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'PrkBrkActv_D_Actl',      'CANOE_ENV_VAR' => 'EnvPrkBrkActv_D_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PrkBrkActv_D_Actl.BrakeSysFeatures_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PrkBrkActv_D_Actl.BrakeSysFeatures_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: BrakeSysFeatures (DSC) ID: 1045 (0x415), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AutoHoldStdbyLamp_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'AutoHoldStdbyLamp_D_Rq',      'CANOE_ENV_VAR' => 'EnvAutoHoldStdbyLamp_D_Rq_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AutoHoldStdbyLamp_D_Rq.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AutoHoldStdbyLamp_D_Rq.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrakeSysFeatures_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'BrakeSysFeatures_No_Cnt',      'CANOE_ENV_VAR' => 'EnvBrakeSysFeatures_No_Cnt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 51, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrakeSysFeatures_No_Cnt.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrakeSysFeatures_No_Cnt.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrakeSysFeatures_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'BrakeSysFeatures_No_Cs',      'CANOE_ENV_VAR' => 'EnvBrakeSysFeatures_No_Cs_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrakeSysFeatures_No_Cs.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrakeSysFeatures_No_Cs.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BrkFluidLvl_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'BrkFluidLvl_D_Actl',      'CANOE_ENV_VAR' => 'EnvBrkFluidLvl_D_Actl_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 32, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BrkFluidLvl_D_Actl.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BrkFluidLvl_D_Actl.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000001' , 5 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DSC_OnOff_status' =>
               {
               'SIGNAL_NAME'   => 'DSC_OnOff_status',      'CANOE_ENV_VAR' => 'EnvDSC_OnOff_status_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 33, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSC_OnOff_status.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSC_OnOff_status.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrvAntiLckGuid_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'DrvAntiLckGuid_D_Rq',      'CANOE_ENV_VAR' => 'EnvDrvAntiLckGuid_D_Rq_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 6, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrvAntiLckGuid_D_Rq.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrvAntiLckGuid_D_Rq.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrvEBDGuid_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'DrvEBDGuid_D_Rq',      'CANOE_ENV_VAR' => 'EnvDrvEBDGuid_D_Rq_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrvEBDGuid_D_Rq.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrvEBDGuid_D_Rq.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrvSlipCtlGuid_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'DrvSlipCtlGuid_D_Rq',      'CANOE_ENV_VAR' => 'EnvDrvSlipCtlGuid_D_Rq_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrvSlipCtlGuid_D_Rq.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrvSlipCtlGuid_D_Rq.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Dsc_B_Falt' =>
               {
               'SIGNAL_NAME'   => 'Dsc_B_Falt',      'CANOE_ENV_VAR' => 'EnvDsc_B_Falt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 36, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Dsc_B_Falt.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Dsc_B_Falt.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EBB_DisplayRequestA' =>
               {
               'SIGNAL_NAME'   => 'EBB_DisplayRequestA',      'CANOE_ENV_VAR' => 'EnvEBB_DisplayRequestA_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EBB_DisplayRequestA.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EBB_DisplayRequestA.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EBB_DisplayRequestB' =>
               {
               'SIGNAL_NAME'   => 'EBB_DisplayRequestB',      'CANOE_ENV_VAR' => 'EnvEBB_DisplayRequestB_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EBB_DisplayRequestB.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EBB_DisplayRequestB.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_DisplayRequest1' =>
               {
               'SIGNAL_NAME'   => 'EPB_DisplayRequest1',      'CANOE_ENV_VAR' => 'EnvEPB_DisplayRequest1_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_DisplayRequest1.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_DisplayRequest1.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_DisplayRequest2' =>
               {
               'SIGNAL_NAME'   => 'EPB_DisplayRequest2',      'CANOE_ENV_VAR' => 'EnvEPB_DisplayRequest2_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_DisplayRequest2.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_DisplayRequest2.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_DisplayRequest3' =>
               {
               'SIGNAL_NAME'   => 'EPB_DisplayRequest3',      'CANOE_ENV_VAR' => 'EnvEPB_DisplayRequest3_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_DisplayRequest3.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_DisplayRequest3.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_DisplayRequest4' =>
               {
               'SIGNAL_NAME'   => 'EPB_DisplayRequest4',      'CANOE_ENV_VAR' => 'EnvEPB_DisplayRequest4_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_DisplayRequest4.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_DisplayRequest4.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_DisplayRequest5' =>
               {
               'SIGNAL_NAME'   => 'EPB_DisplayRequest5',      'CANOE_ENV_VAR' => 'EnvEPB_DisplayRequest5_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_DisplayRequest5.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_DisplayRequest5.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_EnableDecelRequest' =>
               {
               'SIGNAL_NAME'   => 'EPB_EnableDecelRequest',      'CANOE_ENV_VAR' => 'EnvEPB_EnableDecelRequest_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 27, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_EnableDecelRequest.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_EnableDecelRequest.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_EnableExternalApply' =>
               {
               'SIGNAL_NAME'   => 'EPB_EnableExternalApply',      'CANOE_ENV_VAR' => 'EnvEPB_EnableExternalApply_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 26, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_EnableExternalApply.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_EnableExternalApply.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_IGoff_Apply_Buzzer' =>
               {
               'SIGNAL_NAME'   => 'EPB_IGoff_Apply_Buzzer',      'CANOE_ENV_VAR' => 'EnvEPB_IGoff_Apply_Buzzer_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_IGoff_Apply_Buzzer.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_IGoff_Apply_Buzzer.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_IGoff_Apply_Inhibit' =>
               {
               'SIGNAL_NAME'   => 'EPB_IGoff_Apply_Inhibit',      'CANOE_ENV_VAR' => 'EnvEPB_IGoff_Apply_Inhibit_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 44, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_IGoff_Apply_Inhibit.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_IGoff_Apply_Inhibit.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_Status' =>
               {
               'SIGNAL_NAME'   => 'EPB_Status',      'CANOE_ENV_VAR' => 'EnvEPB_Status_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_Status.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_Status.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_SwitchPosition' =>
               {
               'SIGNAL_NAME'   => 'EPB_SwitchPosition',      'CANOE_ENV_VAR' => 'EnvEPB_SwitchPosition_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 25, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_SwitchPosition.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_SwitchPosition.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EPB_TrqRequire' =>
               {
               'SIGNAL_NAME'   => 'EPB_TrqRequire',      'CANOE_ENV_VAR' => 'EnvEPB_TrqRequire_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 43, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPB_TrqRequire.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPB_TrqRequire.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HydraulicHoldActLamp_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'HydraulicHoldActLamp_D_Rq',      'CANOE_ENV_VAR' => 'EnvHydraulicHoldActLamp_D_Rq_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 4, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HydraulicHoldActLamp_D_Rq.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HydraulicHoldActLamp_D_Rq.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HydraulicHoldDis_B_Rq1' =>
               {
               'SIGNAL_NAME'   => 'HydraulicHoldDis_B_Rq1',      'CANOE_ENV_VAR' => 'EnvHydraulicHoldDis_B_Rq1_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HydraulicHoldDis_B_Rq1.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HydraulicHoldDis_B_Rq1.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HydraulicHoldDis_B_Rq2' =>
               {
               'SIGNAL_NAME'   => 'HydraulicHoldDis_B_Rq2',      'CANOE_ENV_VAR' => 'EnvHydraulicHoldDis_B_Rq2_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 2, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HydraulicHoldDis_B_Rq2.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HydraulicHoldDis_B_Rq2.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HydraulicHoldDis_B_Rq3' =>
               {
               'SIGNAL_NAME'   => 'HydraulicHoldDis_B_Rq3',      'CANOE_ENV_VAR' => 'EnvHydraulicHoldDis_B_Rq3_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HydraulicHoldDis_B_Rq3.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HydraulicHoldDis_B_Rq3.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HydraulicHoldDis_B_Rq4' =>
               {
               'SIGNAL_NAME'   => 'HydraulicHoldDis_B_Rq4',      'CANOE_ENV_VAR' => 'EnvHydraulicHoldDis_B_Rq4_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HydraulicHoldDis_B_Rq4.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HydraulicHoldDis_B_Rq4.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LDA_B_Falt' =>
               {
               'SIGNAL_NAME'   => 'LDA_B_Falt',      'CANOE_ENV_VAR' => 'EnvLDA_B_Falt_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 46, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LDA_B_Falt.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LDA_B_Falt.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'OffSwitch_Info' =>
               {
               'SIGNAL_NAME'   => 'OffSwitch_Info',      'CANOE_ENV_VAR' => 'EnvOffSwitch_Info_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'OffSwitch_Info.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'OffSwitch_Info.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RGN_StpLmp_Fail_Flag' =>
               {
               'SIGNAL_NAME'   => 'RGN_StpLmp_Fail_Flag',      'CANOE_ENV_VAR' => 'EnvRGN_StpLmp_Fail_Flag_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 45, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RGN_StpLmp_Fail_Flag.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RGN_StpLmp_Fail_Flag.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TCS_BRK_FAILD' =>
               {
               'SIGNAL_NAME'   => 'TCS_BRK_FAILD',      'CANOE_ENV_VAR' => 'EnvTCS_BRK_FAILD_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TCS_BRK_FAILD.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TCS_BRK_FAILD.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TCS_ENG_FAILD' =>
               {
               'SIGNAL_NAME'   => 'TCS_ENG_FAILD',      'CANOE_ENV_VAR' => 'EnvTCS_ENG_FAILD_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'BrakeSysFeatures',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 34, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TCS_ENG_FAILD.BrakeSysFeatures.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TCS_ENG_FAILD.BrakeSysFeatures.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Hvac_Control_Information2_MAC (CGW) ID: 1066 (0x42a), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'FirstRowBuckleDriver' =>
               {
               'SIGNAL_NAME'   => 'FirstRowBuckleDriver',      'CANOE_ENV_VAR' => 'EnvFirstRowBuckleDriver_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 30, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FirstRowBuckleDriver.Hvac_Control_Information2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FirstRowBuckleDriver.Hvac_Control_Information2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HdcSw_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'HdcSw_D_Actl',      'CANOE_ENV_VAR' => 'EnvHdcSw_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 28, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HdcSw_D_Actl.Hvac_Control_Information2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HdcSw_D_Actl.Hvac_Control_Information2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Hvac_Control_Information2_FVTx' =>
               {
               'SIGNAL_NAME'   => 'Hvac_Control_Information2_FVTx',      'CANOE_ENV_VAR' => 'EnvHvac_Control_Information2_FVTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Hvac_Control_Information2_FVTx.Hvac_Control_Information2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Hvac_Control_Information2_FVTx.Hvac_Control_Information2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Hvac_Control_Information2_MACTx' =>
               {
               'SIGNAL_NAME'   => 'Hvac_Control_Information2_MACTx',      'CANOE_ENV_VAR' => 'EnvHvac_Control_Information2_MACTx_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 28, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Hvac_Control_Information2_MACTx.Hvac_Control_Information2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Hvac_Control_Information2_MACTx.Hvac_Control_Information2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID42A_E2E_CNTProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID42A_E2E_CNTProfile2',      'CANOE_ENV_VAR' => 'EnvID42A_E2E_CNTProfile2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID42A_E2E_CNTProfile2.Hvac_Control_Information2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID42A_E2E_CNTProfile2.Hvac_Control_Information2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID42A_E2E_CRCProfile2' =>
               {
               'SIGNAL_NAME'   => 'ID42A_E2E_CRCProfile2',      'CANOE_ENV_VAR' => 'EnvID42A_E2E_CRCProfile2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID42A_E2E_CRCProfile2.Hvac_Control_Information2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID42A_E2E_CRCProfile2.Hvac_Control_Information2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'View_RPC_APS_Sw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'View_RPC_APS_Sw_B_Actl',      'CANOE_ENV_VAR' => 'EnvView_RPC_APS_Sw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 26, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'View_RPC_APS_Sw_B_Actl.Hvac_Control_Information2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'View_RPC_APS_Sw_B_Actl.Hvac_Control_Information2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'View_RPC_APS_Sw_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'View_RPC_APS_Sw_D_Qf',      'CANOE_ENV_VAR' => 'EnvView_RPC_APS_Sw_D_Qf_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2_MAC',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 25, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'View_RPC_APS_Sw_D_Qf.Hvac_Control_Information2_MAC.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'View_RPC_APS_Sw_D_Qf.Hvac_Control_Information2_MAC.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Hvac_Control_Information2 (CGW) ID: 1078 (0x436), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'BlowerSpeed' =>
               {
               'SIGNAL_NAME'   => 'BlowerSpeed',      'CANOE_ENV_VAR' => 'EnvBlowerSpeed_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'BlowerSpeed.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BlowerSpeed.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000011' , 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Charge_Mode_Enabled_SW' =>
               {
               'SIGNAL_NAME'   => 'Charge_Mode_Enabled_SW',      'CANOE_ENV_VAR' => 'EnvCharge_Mode_Enabled_SW_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 40, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Charge_Mode_Enabled_SW.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Charge_Mode_Enabled_SW.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000001' , 6 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Drive_Mode_Enabled_Switch' =>
               {
               'SIGNAL_NAME'   => 'Drive_Mode_Enabled_Switch',      'CANOE_ENV_VAR' => 'EnvDrive_Mode_Enabled_Switch_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 42, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Drive_Mode_Enabled_Switch.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Drive_Mode_Enabled_Switch.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HvacAirCond_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'HvacAirCond_B_Rq',      'CANOE_ENV_VAR' => 'EnvHvacAirCond_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HvacAirCond_B_Rq.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HvacAirCond_B_Rq.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HvacEngStopCtrl_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'HvacEngStopCtrl_D_Actl',      'CANOE_ENV_VAR' => 'EnvHvacEngStopCtrl_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HvacEngStopCtrl_D_Actl.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HvacEngStopCtrl_D_Actl.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HvacEngStopDis_B_Rq' =>
               {
               'SIGNAL_NAME'   => 'HvacEngStopDis_B_Rq',      'CANOE_ENV_VAR' => 'EnvHvacEngStopDis_B_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HvacEngStopDis_B_Rq.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HvacEngStopDis_B_Rq.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HvacEngStopDis_B_Rq_exceptTEva' =>
               {
               'SIGNAL_NAME'   => 'HvacEngStopDis_B_Rq_exceptTEva',      'CANOE_ENV_VAR' => 'EnvHvacEngStopDis_B_Rq_exceptTEva_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 6, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HvacEngStopDis_B_Rq_exceptTEva.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HvacEngStopDis_B_Rq_exceptTEva.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HvacEngStopInputFail_D_Rq' =>
               {
               'SIGNAL_NAME'   => 'HvacEngStopInputFail_D_Rq',      'CANOE_ENV_VAR' => 'EnvHvacEngStopInputFail_D_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 4, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'HvacEngStopInputFail_D_Rq.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HvacEngStopInputFail_D_Rq.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00011100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SeatHeatIndicFl_D_Req' =>
               {
               'SIGNAL_NAME'   => 'SeatHeatIndicFl_D_Req',      'CANOE_ENV_VAR' => 'EnvSeatHeatIndicFl_D_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 25, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SeatHeatIndicFl_D_Req.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SeatHeatIndicFl_D_Req.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000011' , 4 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SeatHeatIndicFr_D_Req' =>
               {
               'SIGNAL_NAME'   => 'SeatHeatIndicFr_D_Req',      'CANOE_ENV_VAR' => 'EnvSeatHeatIndicFr_D_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 38, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SeatHeatIndicFr_D_Req.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SeatHeatIndicFr_D_Req.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b01110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SeatVentIndicFl_D_Req' =>
               {
               'SIGNAL_NAME'   => 'SeatVentIndicFl_D_Req',      'CANOE_ENV_VAR' => 'EnvSeatVentIndicFl_D_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SeatVentIndicFl_D_Req.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SeatVentIndicFl_D_Req.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SeatVentIndicFr_D_Req' =>
               {
               'SIGNAL_NAME'   => 'SeatVentIndicFr_D_Req',      'CANOE_ENV_VAR' => 'EnvSeatVentIndicFr_D_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 32, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SeatVentIndicFr_D_Req.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SeatVentIndicFr_D_Req.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000001' , 5 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SteerHeatIndic_D_Req' =>
               {
               'SIGNAL_NAME'   => 'SteerHeatIndic_D_Req',      'CANOE_ENV_VAR' => 'EnvSteerHeatIndic_D_Req_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 57, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SteerHeatIndic_D_Req.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SteerHeatIndic_D_Req.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'atcACmodeDisp' =>
               {
               'SIGNAL_NAME'   => 'atcACmodeDisp',      'CANOE_ENV_VAR' => 'EnvatcACmodeDisp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 28, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'atcACmodeDisp.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'atcACmodeDisp.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00011100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'atcADmodeDisp' =>
               {
               'SIGNAL_NAME'   => 'atcADmodeDisp',      'CANOE_ENV_VAR' => 'EnvatcADmodeDisp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'atcADmodeDisp.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'atcADmodeDisp.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00011110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'atcAImodeDisp' =>
               {
               'SIGNAL_NAME'   => 'atcAImodeDisp',      'CANOE_ENV_VAR' => 'EnvatcAImodeDisp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 16, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'atcAImodeDisp.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'atcAImodeDisp.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000001' , 3 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'atcBlwLvlDisp' =>
               {
               'SIGNAL_NAME'   => 'atcBlwLvlDisp',      'CANOE_ENV_VAR' => 'EnvatcBlwLvlDisp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'atcBlwLvlDisp.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'atcBlwLvlDisp.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' , 2 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'atcControlStatus' =>
               {
               'SIGNAL_NAME'   => 'atcControlStatus',      'CANOE_ENV_VAR' => 'EnvatcControlStatus_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Hvac_Control_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 45, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'atcControlStatus.Hvac_Control_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'atcControlStatus.Hvac_Control_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: LocateTime_Info (CGW) ID: 1081 (0x439), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'Curnt_Date_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'Curnt_Date_ByGPS',      'CANOE_ENV_VAR' => 'EnvCurnt_Date_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 0 },
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'day',
               'LC_READ_PHYS'  => 'Curnt_Date_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Curnt_Date_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Curnt_Hour_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'Curnt_Hour_ByGPS',      'CANOE_ENV_VAR' => 'EnvCurnt_Hour_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 1 },
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Hour',
               'LC_READ_PHYS'  => 'Curnt_Hour_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Curnt_Hour_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Curnt_Minutes_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'Curnt_Minutes_ByGPS',      'CANOE_ENV_VAR' => 'EnvCurnt_Minutes_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 1 },
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Minute',
               'LC_READ_PHYS'  => 'Curnt_Minutes_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Curnt_Minutes_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Curnt_Month_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'Curnt_Month_ByGPS',      'CANOE_ENV_VAR' => 'EnvCurnt_Month_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 0 },
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'month',
               'LC_READ_PHYS'  => 'Curnt_Month_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Curnt_Month_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Curnt_Second_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'Curnt_Second_ByGPS',      'CANOE_ENV_VAR' => 'EnvCurnt_Second_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 1 },
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Second',
               'LC_READ_PHYS'  => 'Curnt_Second_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Curnt_Second_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Curnt_Year_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'Curnt_Year_ByGPS',      'CANOE_ENV_VAR' => 'EnvCurnt_Year_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 0 },
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 2018.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'year',
               'LC_READ_PHYS'  => 'Curnt_Year_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Curnt_Year_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'GMT_Date_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'GMT_Date_ByGPS',      'CANOE_ENV_VAR' => 'EnvGMT_Date_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 3 },
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'day',
               'LC_READ_PHYS'  => 'GMT_Date_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'GMT_Date_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'GMT_Hour_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'GMT_Hour_ByGPS',      'CANOE_ENV_VAR' => 'EnvGMT_Hour_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 3 },
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Hour',
               'LC_READ_PHYS'  => 'GMT_Hour_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'GMT_Hour_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'GMT_Minutes_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'GMT_Minutes_ByGPS',      'CANOE_ENV_VAR' => 'EnvGMT_Minutes_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 3 },
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Minute',
               'LC_READ_PHYS'  => 'GMT_Minutes_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'GMT_Minutes_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'GMT_Month_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'GMT_Month_ByGPS',      'CANOE_ENV_VAR' => 'EnvGMT_Month_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 3 },
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'month',
               'LC_READ_PHYS'  => 'GMT_Month_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'GMT_Month_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'GMT_Second_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'GMT_Second_ByGPS',      'CANOE_ENV_VAR' => 'EnvGMT_Second_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 3 },
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Second',
               'LC_READ_PHYS'  => 'GMT_Second_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'GMT_Second_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'GMT_Year_ByGPS' =>
               {
               'SIGNAL_NAME'   => 'GMT_Year_ByGPS',      'CANOE_ENV_VAR' => 'EnvGMT_Year_ByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 3 },
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 2018.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'year',
               'LC_READ_PHYS'  => 'GMT_Year_ByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'GMT_Year_ByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'HorizonByGPS' =>
               {
               'SIGNAL_NAME'   => 'HorizonByGPS',      'CANOE_ENV_VAR' => 'EnvHorizonByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 2 },
               'STARTBIT'      => 15, 'LENGTH' => 32, 'OFFSET' => -10000.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'meter',
               'LC_READ_PHYS'  => 'HorizonByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'HorizonByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LatitudeByGPS' =>
               {
               'SIGNAL_NAME'   => 'LatitudeByGPS',      'CANOE_ENV_VAR' => 'EnvLatitudeByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 0 },
               'STARTBIT'      => 15, 'LENGTH' => 32, 'OFFSET' => -90.000000, 'FACTOR' => 0.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'degree',
               'LC_READ_PHYS'  => 'LatitudeByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LatitudeByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LocateTime_Info_Data_Number' =>
               {
               'SIGNAL_NAME'   => 'LocateTime_Info_Data_Number',      'CANOE_ENV_VAR' => 'EnvLocateTime_Info_Data_Number_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' },
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LocateTime_Info_Data_Number.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LocateTime_Info_Data_Number.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LongitudeByGPS' =>
               {
               'SIGNAL_NAME'   => 'LongitudeByGPS',      'CANOE_ENV_VAR' => 'EnvLongitudeByGPS_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'LocateTime_Info',
               'MULTIPLEX'     => { 'MASTER' => 'LocateTime_Info_Data_Number' , 'CODE' => 1 },
               'STARTBIT'      => 15, 'LENGTH' => 32, 'OFFSET' => -180.000000, 'FACTOR' => 0.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'degree',
               'LC_READ_PHYS'  => 'LongitudeByGPS.LocateTime_Info.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LongitudeByGPS.LocateTime_Info.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Door_D_Message (CGW) ID: 1088 (0x440), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'BackupBatteryOut_Drv_U_Act' =>
               {
               'SIGNAL_NAME'   => 'BackupBatteryOut_Drv_U_Act',      'CANOE_ENV_VAR' => 'EnvBackupBatteryOut_Drv_U_Act_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 10, 'OFFSET' => 0.000000, 'FACTOR' => 0.020000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'V',
               'LC_READ_PHYS'  => 'BackupBatteryOut_Drv_U_Act.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BackupBatteryOut_Drv_U_Act.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' , 6 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Ctrl_DLSw_Drv_Stat' =>
               {
               'SIGNAL_NAME'   => 'Ctrl_DLSw_Drv_Stat',      'CANOE_ENV_VAR' => 'EnvCtrl_DLSw_Drv_Stat_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Ctrl_DLSw_Drv_Stat.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Ctrl_DLSw_Drv_Stat.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DOORDMSG_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'DOORDMSG_No_Cnt',      'CANOE_ENV_VAR' => 'EnvDOORDMSG_No_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 51, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DOORDMSG_No_Cnt.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DOORDMSG_No_Cnt.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DOORDMSG_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'DOORDMSG_No_Cs',      'CANOE_ENV_VAR' => 'EnvDOORDMSG_No_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DOORDMSG_No_Cs.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DOORDMSG_No_Cs.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrLock_Message_D_Rsp' =>
               {
               'SIGNAL_NAME'   => 'DrLock_Message_D_Rsp',      'CANOE_ENV_VAR' => 'EnvDrLock_Message_D_Rsp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 34, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrLock_Message_D_Rsp.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrLock_Message_D_Rsp.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrStatDrv_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'DrStatDrv_B_Actl',      'CANOE_ENV_VAR' => 'EnvDrStatDrv_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrStatDrv_B_Actl.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrStatDrv_B_Actl.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrStatDrv_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'DrStatDrv_D_Qf',      'CANOE_ENV_VAR' => 'EnvDrStatDrv_D_Qf_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 6, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrStatDrv_D_Qf.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrStatDrv_D_Qf.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrivingPositionRequest' =>
               {
               'SIGNAL_NAME'   => 'DrivingPositionRequest',      'CANOE_ENV_VAR' => 'EnvDrivingPositionRequest_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 36, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrivingPositionRequest.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrivingPositionRequest.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrvDLMotorDriveStat' =>
               {
               'SIGNAL_NAME'   => 'DrvDLMotorDriveStat',      'CANOE_ENV_VAR' => 'EnvDrvDLMotorDriveStat_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrvDLMotorDriveStat.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrvDLMotorDriveStat.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Erase_MirrorMem_Res' =>
               {
               'SIGNAL_NAME'   => 'Erase_MirrorMem_Res',      'CANOE_ENV_VAR' => 'EnvErase_MirrorMem_Res_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Erase_MirrorMem_Res.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Erase_MirrorMem_Res.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LockLinkSwDrv_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'LockLinkSwDrv_D_Actl',      'CANOE_ENV_VAR' => 'EnvLockLinkSwDrv_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LockLinkSwDrv_D_Actl.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LockLinkSwDrv_D_Actl.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MirrorAdjst_Manual_Status' =>
               {
               'SIGNAL_NAME'   => 'MirrorAdjst_Manual_Status',      'CANOE_ENV_VAR' => 'EnvMirrorAdjst_Manual_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 28, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MirrorAdjst_Manual_Status.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MirrorAdjst_Manual_Status.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MirrorAdjst_Status' =>
               {
               'SIGNAL_NAME'   => 'MirrorAdjst_Status',      'CANOE_ENV_VAR' => 'EnvMirrorAdjst_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 29, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MirrorAdjst_Status.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MirrorAdjst_Status.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MirrorAdjustRequest' =>
               {
               'SIGNAL_NAME'   => 'MirrorAdjustRequest',      'CANOE_ENV_VAR' => 'EnvMirrorAdjustRequest_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 27, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MirrorAdjustRequest.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MirrorAdjustRequest.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MirrorFoldRequest' =>
               {
               'SIGNAL_NAME'   => 'MirrorFoldRequest',      'CANOE_ENV_VAR' => 'EnvMirrorFoldRequest_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 24, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MirrorFoldRequest.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MirrorFoldRequest.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000001' , 4 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'MirrorLED1_status' =>
               {
               'SIGNAL_NAME'   => 'MirrorLED1_status',      'CANOE_ENV_VAR' => 'EnvMirrorLED1_status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 32, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'MirrorLED1_status.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'MirrorLED1_status.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Mirror_AjustSelSW_Status' =>
               {
               'SIGNAL_NAME'   => 'Mirror_AjustSelSW_Status',      'CANOE_ENV_VAR' => 'EnvMirror_AjustSelSW_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 38, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Mirror_AjustSelSW_Status.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Mirror_AjustSelSW_Status.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Move_AutoDposMirror_Res' =>
               {
               'SIGNAL_NAME'   => 'Move_AutoDposMirror_Res',      'CANOE_ENV_VAR' => 'EnvMove_AutoDposMirror_Res_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 53, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Move_AutoDposMirror_Res.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Move_AutoDposMirror_Res.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PW_Move_P' =>
               {
               'SIGNAL_NAME'   => 'PW_Move_P',      'CANOE_ENV_VAR' => 'EnvPW_Move_P_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PW_Move_P.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PW_Move_P.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000011' , 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PW_Move_R' =>
               {
               'SIGNAL_NAME'   => 'PW_Move_R',      'CANOE_ENV_VAR' => 'EnvPW_Move_R_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PW_Move_R.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PW_Move_R.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Recall_MirrorMem_Res' =>
               {
               'SIGNAL_NAME'   => 'Recall_MirrorMem_Res',      'CANOE_ENV_VAR' => 'EnvRecall_MirrorMem_Res_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 17, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Recall_MirrorMem_Res.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Recall_MirrorMem_Res.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Record_MirrorMem_Res' =>
               {
               'SIGNAL_NAME'   => 'Record_MirrorMem_Res',      'CANOE_ENV_VAR' => 'EnvRecord_MirrorMem_Res_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Door_D_Message',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Record_MirrorMem_Res.Door_D_Message.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Record_MirrorMem_Res.Door_D_Message.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: ADAS_HMI_Information1 (CGW) ID: 1095 (0x447), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AEB_EV_notification' =>
               {
               'SIGNAL_NAME'   => 'AEB_EV_notification',      'CANOE_ENV_VAR' => 'EnvAEB_EV_notification_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_EV_notification.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_EV_notification.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_EV_off' =>
               {
               'SIGNAL_NAME'   => 'AEB_EV_off',      'CANOE_ENV_VAR' => 'EnvAEB_EV_off_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_EV_off.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_EV_off.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_fallback' =>
               {
               'SIGNAL_NAME'   => 'AEB_fallback',      'CANOE_ENV_VAR' => 'EnvAEB_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_fallback.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_fallback.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'AEB_state' =>
               {
               'SIGNAL_NAME'   => 'AEB_state',      'CANOE_ENV_VAR' => 'EnvAEB_state_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AEB_state.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AEB_state.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CTB_EV_failure' =>
               {
               'SIGNAL_NAME'   => 'CTB_EV_failure',      'CANOE_ENV_VAR' => 'EnvCTB_EV_failure_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 41, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CTB_EV_failure.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CTB_EV_failure.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CTB_EV_fallback' =>
               {
               'SIGNAL_NAME'   => 'CTB_EV_fallback',      'CANOE_ENV_VAR' => 'EnvCTB_EV_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 43, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CTB_EV_fallback.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CTB_EV_fallback.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CTB_EV_notification' =>
               {
               'SIGNAL_NAME'   => 'CTB_EV_notification',      'CANOE_ENV_VAR' => 'EnvCTB_EV_notification_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 44, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CTB_EV_notification.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CTB_EV_notification.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CTB_EV_off' =>
               {
               'SIGNAL_NAME'   => 'CTB_EV_off',      'CANOE_ENV_VAR' => 'EnvCTB_EV_off_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 46, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CTB_EV_off.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CTB_EV_off.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CTB_EV_tmp_failure' =>
               {
               'SIGNAL_NAME'   => 'CTB_EV_tmp_failure',      'CANOE_ENV_VAR' => 'EnvCTB_EV_tmp_failure_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 42, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CTB_EV_tmp_failure.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CTB_EV_tmp_failure.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CTB_EV_warning' =>
               {
               'SIGNAL_NAME'   => 'CTB_EV_warning',      'CANOE_ENV_VAR' => 'EnvCTB_EV_warning_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 45, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CTB_EV_warning.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CTB_EV_warning.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CTB_fallback' =>
               {
               'SIGNAL_NAME'   => 'CTB_fallback',      'CANOE_ENV_VAR' => 'EnvCTB_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 32, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CTB_fallback.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CTB_fallback.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000001' , 5 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CTB_state' =>
               {
               'SIGNAL_NAME'   => 'CTB_state',      'CANOE_ENV_VAR' => 'EnvCTB_state_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 36, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CTB_state.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CTB_state.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00011110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CTB_target_lh' =>
               {
               'SIGNAL_NAME'   => 'CTB_target_lh',      'CANOE_ENV_VAR' => 'EnvCTB_target_lh_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 54, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CTB_target_lh.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CTB_target_lh.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b01100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CTB_target_rh' =>
               {
               'SIGNAL_NAME'   => 'CTB_target_rh',      'CANOE_ENV_VAR' => 'EnvCTB_target_rh_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 40, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CTB_target_rh.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CTB_target_rh.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000001' , 6 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FCTA_EV_failure' =>
               {
               'SIGNAL_NAME'   => 'FCTA_EV_failure',      'CANOE_ENV_VAR' => 'EnvFCTA_EV_failure_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 27, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FCTA_EV_failure.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FCTA_EV_failure.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FCTA_EV_fallback' =>
               {
               'SIGNAL_NAME'   => 'FCTA_EV_fallback',      'CANOE_ENV_VAR' => 'EnvFCTA_EV_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 29, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FCTA_EV_fallback.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FCTA_EV_fallback.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FCTA_EV_tmp_failure' =>
               {
               'SIGNAL_NAME'   => 'FCTA_EV_tmp_failure',      'CANOE_ENV_VAR' => 'EnvFCTA_EV_tmp_failure_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 28, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FCTA_EV_tmp_failure.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FCTA_EV_tmp_failure.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FCTA_EV_warning2_lh' =>
               {
               'SIGNAL_NAME'   => 'FCTA_EV_warning2_lh',      'CANOE_ENV_VAR' => 'EnvFCTA_EV_warning2_lh_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FCTA_EV_warning2_lh.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FCTA_EV_warning2_lh.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FCTA_EV_warning2_rh' =>
               {
               'SIGNAL_NAME'   => 'FCTA_EV_warning2_rh',      'CANOE_ENV_VAR' => 'EnvFCTA_EV_warning2_rh_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 30, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FCTA_EV_warning2_rh.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FCTA_EV_warning2_rh.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FCTA_fallback' =>
               {
               'SIGNAL_NAME'   => 'FCTA_fallback',      'CANOE_ENV_VAR' => 'EnvFCTA_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 16, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FCTA_fallback.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FCTA_fallback.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FCTA_state' =>
               {
               'SIGNAL_NAME'   => 'FCTA_state',      'CANOE_ENV_VAR' => 'EnvFCTA_state_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FCTA_state.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FCTA_state.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00011110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FCTA_target_lh' =>
               {
               'SIGNAL_NAME'   => 'FCTA_target_lh',      'CANOE_ENV_VAR' => 'EnvFCTA_target_lh_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 24, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FCTA_target_lh.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FCTA_target_lh.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000001' , 4 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FCTA_target_rh' =>
               {
               'SIGNAL_NAME'   => 'FCTA_target_rh',      'CANOE_ENV_VAR' => 'EnvFCTA_target_rh_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 26, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FCTA_target_rh.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FCTA_target_rh.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID447_No_Cnt' =>
               {
               'SIGNAL_NAME'   => 'ID447_No_Cnt',      'CANOE_ENV_VAR' => 'EnvID447_No_Cnt_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 51, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID447_No_Cnt.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID447_No_Cnt.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ID447_No_Cs' =>
               {
               'SIGNAL_NAME'   => 'ID447_No_Cs',      'CANOE_ENV_VAR' => 'EnvID447_No_Cs_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ID447_No_Cs.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ID447_No_Cs.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PTC_EV_notification' =>
               {
               'SIGNAL_NAME'   => 'PTC_EV_notification',      'CANOE_ENV_VAR' => 'EnvPTC_EV_notification_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PTC_EV_notification.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PTC_EV_notification.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PTC_EV_off' =>
               {
               'SIGNAL_NAME'   => 'PTC_EV_off',      'CANOE_ENV_VAR' => 'EnvPTC_EV_off_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PTC_EV_off.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PTC_EV_off.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PTC_fallback' =>
               {
               'SIGNAL_NAME'   => 'PTC_fallback',      'CANOE_ENV_VAR' => 'EnvPTC_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PTC_fallback.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PTC_fallback.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'PTC_state' =>
               {
               'SIGNAL_NAME'   => 'PTC_state',      'CANOE_ENV_VAR' => 'EnvPTC_state_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information1',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 14, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'PTC_state.ADAS_HMI_Information1.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'PTC_state.ADAS_HMI_Information1.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b01111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: ADAS_HMI_Information4 (CGW) ID: 1098 (0x44a), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ACC_EV_accept' =>
               {
               'SIGNAL_NAME'   => 'ACC_EV_accept',      'CANOE_ENV_VAR' => 'EnvACC_EV_accept_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_EV_accept.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_EV_accept.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_EV_dassw_reject' =>
               {
               'SIGNAL_NAME'   => 'ACC_EV_dassw_reject',      'CANOE_ENV_VAR' => 'EnvACC_EV_dassw_reject_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_EV_dassw_reject.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_EV_dassw_reject.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_EV_failure' =>
               {
               'SIGNAL_NAME'   => 'ACC_EV_failure',      'CANOE_ENV_VAR' => 'EnvACC_EV_failure_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 17, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_EV_failure.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_EV_failure.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_EV_fallback1' =>
               {
               'SIGNAL_NAME'   => 'ACC_EV_fallback1',      'CANOE_ENV_VAR' => 'EnvACC_EV_fallback1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_EV_fallback1.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_EV_fallback1.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_EV_fallback2' =>
               {
               'SIGNAL_NAME'   => 'ACC_EV_fallback2',      'CANOE_ENV_VAR' => 'EnvACC_EV_fallback2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_EV_fallback2.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_EV_fallback2.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_EV_reject' =>
               {
               'SIGNAL_NAME'   => 'ACC_EV_reject',      'CANOE_ENV_VAR' => 'EnvACC_EV_reject_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_EV_reject.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_EV_reject.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_EV_set_dist' =>
               {
               'SIGNAL_NAME'   => 'ACC_EV_set_dist',      'CANOE_ENV_VAR' => 'EnvACC_EV_set_dist_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 16, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_EV_set_dist.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_EV_set_dist.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_EV_start' =>
               {
               'SIGNAL_NAME'   => 'ACC_EV_start',      'CANOE_ENV_VAR' => 'EnvACC_EV_start_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_EV_start.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_EV_start.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_EV_suspended' =>
               {
               'SIGNAL_NAME'   => 'ACC_EV_suspended',      'CANOE_ENV_VAR' => 'EnvACC_EV_suspended_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_EV_suspended.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_EV_suspended.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_EV_tmp_failure' =>
               {
               'SIGNAL_NAME'   => 'ACC_EV_tmp_failure',      'CANOE_ENV_VAR' => 'EnvACC_EV_tmp_failure_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 18, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_EV_tmp_failure.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_EV_tmp_failure.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_fallback' =>
               {
               'SIGNAL_NAME'   => 'ACC_fallback',      'CANOE_ENV_VAR' => 'EnvACC_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 13, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_fallback.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_fallback.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_set_distance' =>
               {
               'SIGNAL_NAME'   => 'ACC_set_distance',      'CANOE_ENV_VAR' => 'EnvACC_set_distance_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 38, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_set_distance.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_set_distance.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b01110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_set_velocity' =>
               {
               'SIGNAL_NAME'   => 'ACC_set_velocity',      'CANOE_ENV_VAR' => 'EnvACC_set_velocity_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 30, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Unitless',
               'LC_READ_PHYS'  => 'ACC_set_velocity.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_set_velocity.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b01111111' , 4 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_shift_position' =>
               {
               'SIGNAL_NAME'   => 'ACC_shift_position',      'CANOE_ENV_VAR' => 'EnvACC_shift_position_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_shift_position.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_shift_position.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' , 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_sign' =>
               {
               'SIGNAL_NAME'   => 'ACC_sign',      'CANOE_ENV_VAR' => 'EnvACC_sign_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_sign.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_sign.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_state' =>
               {
               'SIGNAL_NAME'   => 'ACC_state',      'CANOE_ENV_VAR' => 'EnvACC_state_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_state.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_state.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_stop' =>
               {
               'SIGNAL_NAME'   => 'ACC_stop',      'CANOE_ENV_VAR' => 'EnvACC_stop_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_stop.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_stop.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_target' =>
               {
               'SIGNAL_NAME'   => 'ACC_target',      'CANOE_ENV_VAR' => 'EnvACC_target_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_target.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_target.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_target_distance' =>
               {
               'SIGNAL_NAME'   => 'ACC_target_distance',      'CANOE_ENV_VAR' => 'EnvACC_target_distance_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_target_distance.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_target_distance.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ACC_warning' =>
               {
               'SIGNAL_NAME'   => 'ACC_warning',      'CANOE_ENV_VAR' => 'EnvACC_warning_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ACC_warning.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ACC_warning.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_EV_dassw_reject' =>
               {
               'SIGNAL_NAME'   => 'LKA_EV_dassw_reject',      'CANOE_ENV_VAR' => 'EnvLKA_EV_dassw_reject_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 61, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_EV_dassw_reject.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_EV_dassw_reject.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_EV_failure' =>
               {
               'SIGNAL_NAME'   => 'LKA_EV_failure',      'CANOE_ENV_VAR' => 'EnvLKA_EV_failure_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 62, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_EV_failure.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_EV_failure.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_EV_fallback' =>
               {
               'SIGNAL_NAME'   => 'LKA_EV_fallback',      'CANOE_ENV_VAR' => 'EnvLKA_EV_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 48, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_EV_fallback.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_EV_fallback.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_EV_inactive_handsfree' =>
               {
               'SIGNAL_NAME'   => 'LKA_EV_inactive_handsfree',      'CANOE_ENV_VAR' => 'EnvLKA_EV_inactive_handsfree_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 42, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_EV_inactive_handsfree.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_EV_inactive_handsfree.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_EV_inactive_handson' =>
               {
               'SIGNAL_NAME'   => 'LKA_EV_inactive_handson',      'CANOE_ENV_VAR' => 'EnvLKA_EV_inactive_handson_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 43, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_EV_inactive_handson.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_EV_inactive_handson.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_EV_reject' =>
               {
               'SIGNAL_NAME'   => 'LKA_EV_reject',      'CANOE_ENV_VAR' => 'EnvLKA_EV_reject_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 53, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_EV_reject.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_EV_reject.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_EV_suspended' =>
               {
               'SIGNAL_NAME'   => 'LKA_EV_suspended',      'CANOE_ENV_VAR' => 'EnvLKA_EV_suspended_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 49, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_EV_suspended.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_EV_suspended.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_EV_tmp_failure' =>
               {
               'SIGNAL_NAME'   => 'LKA_EV_tmp_failure',      'CANOE_ENV_VAR' => 'EnvLKA_EV_tmp_failure_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_EV_tmp_failure.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_EV_tmp_failure.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_control_limit_lh' =>
               {
               'SIGNAL_NAME'   => 'LKA_control_limit_lh',      'CANOE_ENV_VAR' => 'EnvLKA_control_limit_lh_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_control_limit_lh.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_control_limit_lh.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_control_limit_rh' =>
               {
               'SIGNAL_NAME'   => 'LKA_control_limit_rh',      'CANOE_ENV_VAR' => 'EnvLKA_control_limit_rh_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 54, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_control_limit_rh.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_control_limit_rh.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_fallback' =>
               {
               'SIGNAL_NAME'   => 'LKA_fallback',      'CANOE_ENV_VAR' => 'EnvLKA_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 41, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_fallback.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_fallback.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_handsfree' =>
               {
               'SIGNAL_NAME'   => 'LKA_handsfree',      'CANOE_ENV_VAR' => 'EnvLKA_handsfree_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 52, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_handsfree.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_handsfree.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b00011100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_state' =>
               {
               'SIGNAL_NAME'   => 'LKA_state',      'CANOE_ENV_VAR' => 'EnvLKA_state_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_state.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_state.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'LKA_target' =>
               {
               'SIGNAL_NAME'   => 'LKA_target',      'CANOE_ENV_VAR' => 'EnvLKA_target_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information4',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 60, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'LKA_target.ADAS_HMI_Information4.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'LKA_target.ADAS_HMI_Information4.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b00011100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: ADAS_HMI_Information5 (CGW) ID: 1099 (0x44b), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'ASC_EV_accept' =>
               {
               'SIGNAL_NAME'   => 'ASC_EV_accept',      'CANOE_ENV_VAR' => 'EnvASC_EV_accept_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ASC_EV_accept.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ASC_EV_accept.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ASC_EV_failure' =>
               {
               'SIGNAL_NAME'   => 'ASC_EV_failure',      'CANOE_ENV_VAR' => 'EnvASC_EV_failure_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ASC_EV_failure.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ASC_EV_failure.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ASC_EV_fallback' =>
               {
               'SIGNAL_NAME'   => 'ASC_EV_fallback',      'CANOE_ENV_VAR' => 'EnvASC_EV_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 0, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ASC_EV_fallback.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ASC_EV_fallback.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ASC_EV_reject' =>
               {
               'SIGNAL_NAME'   => 'ASC_EV_reject',      'CANOE_ENV_VAR' => 'EnvASC_EV_reject_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 2, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ASC_EV_reject.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ASC_EV_reject.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ASC_EV_suspended' =>
               {
               'SIGNAL_NAME'   => 'ASC_EV_suspended',      'CANOE_ENV_VAR' => 'EnvASC_EV_suspended_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 1, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ASC_EV_suspended.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ASC_EV_suspended.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ASC_state' =>
               {
               'SIGNAL_NAME'   => 'ASC_state',      'CANOE_ENV_VAR' => 'EnvASC_state_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ASC_state.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ASC_state.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ISA_EV_failure' =>
               {
               'SIGNAL_NAME'   => 'ISA_EV_failure',      'CANOE_ENV_VAR' => 'EnvISA_EV_failure_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 33, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ISA_EV_failure.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ISA_EV_failure.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ISA_EV_fallback' =>
               {
               'SIGNAL_NAME'   => 'ISA_EV_fallback',      'CANOE_ENV_VAR' => 'EnvISA_EV_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 34, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ISA_EV_fallback.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ISA_EV_fallback.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ISA_EV_kickdown' =>
               {
               'SIGNAL_NAME'   => 'ISA_EV_kickdown',      'CANOE_ENV_VAR' => 'EnvISA_EV_kickdown_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ISA_EV_kickdown.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ISA_EV_kickdown.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ISA_EV_reject' =>
               {
               'SIGNAL_NAME'   => 'ISA_EV_reject',      'CANOE_ENV_VAR' => 'EnvISA_EV_reject_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 38, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ISA_EV_reject.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ISA_EV_reject.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ISA_EV_spd_autoset' =>
               {
               'SIGNAL_NAME'   => 'ISA_EV_spd_autoset',      'CANOE_ENV_VAR' => 'EnvISA_EV_spd_autoset_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ISA_EV_spd_autoset.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ISA_EV_spd_autoset.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ISA_fallback' =>
               {
               'SIGNAL_NAME'   => 'ISA_fallback',      'CANOE_ENV_VAR' => 'EnvISA_fallback_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 17, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ISA_fallback.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ISA_fallback.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ISA_overspeed' =>
               {
               'SIGNAL_NAME'   => 'ISA_overspeed',      'CANOE_ENV_VAR' => 'EnvISA_overspeed_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 25, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ISA_overspeed.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ISA_overspeed.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ISA_sign' =>
               {
               'SIGNAL_NAME'   => 'ISA_sign',      'CANOE_ENV_VAR' => 'EnvISA_sign_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 27, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ISA_sign.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ISA_sign.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ISA_state' =>
               {
               'SIGNAL_NAME'   => 'ISA_state',      'CANOE_ENV_VAR' => 'EnvISA_state_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ISA_state.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ISA_state.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'REDKEY_EV_on' =>
               {
               'SIGNAL_NAME'   => 'REDKEY_EV_on',      'CANOE_ENV_VAR' => 'EnvREDKEY_EV_on_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 56, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'REDKEY_EV_on.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'REDKEY_EV_on.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'REDKEY_state' =>
               {
               'SIGNAL_NAME'   => 'REDKEY_state',      'CANOE_ENV_VAR' => 'EnvREDKEY_state_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'ADAS_HMI_Information5',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 60, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'REDKEY_state.ADAS_HMI_Information5.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'REDKEY_state.ADAS_HMI_Information5.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b00011110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RBCM_Information2 (CGW) ID: 1120 (0x460), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AutoHoldSw_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'AutoHoldSw_B_Actl',      'CANOE_ENV_VAR' => 'EnvAutoHoldSw_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AutoHoldSw_B_Actl.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AutoHoldSw_B_Actl.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'BackupBatteryMid_U_Actl' =>
               {
               'SIGNAL_NAME'   => 'BackupBatteryMid_U_Actl',      'CANOE_ENV_VAR' => 'EnvBackupBatteryMid_U_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 10, 'OFFSET' => 0.000000, 'FACTOR' => 0.020000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'V',
               'LC_READ_PHYS'  => 'BackupBatteryMid_U_Actl.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'BackupBatteryMid_U_Actl.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' , 5 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrLock_Message_R_Rsp' =>
               {
               'SIGNAL_NAME'   => 'DrLock_Message_R_Rsp',      'CANOE_ENV_VAR' => 'EnvDrLock_Message_R_Rsp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 25, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrLock_Message_R_Rsp.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrLock_Message_R_Rsp.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00000011' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrStatR_D_Qf' =>
               {
               'SIGNAL_NAME'   => 'DrStatR_D_Qf',      'CANOE_ENV_VAR' => 'EnvDrStatR_D_Qf_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 18, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrStatR_D_Qf.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrStatR_D_Qf.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrStatRl_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'DrStatRl_B_Actl',      'CANOE_ENV_VAR' => 'EnvDrStatRl_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 16, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrStatRl_B_Actl.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrStatRl_B_Actl.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DrStatTrnkLg_B_Actl' =>
               {
               'SIGNAL_NAME'   => 'DrStatTrnkLg_B_Actl',      'CANOE_ENV_VAR' => 'EnvDrStatTrnkLg_B_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DrStatTrnkLg_B_Actl.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DrStatTrnkLg_B_Actl.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Fuel_Lid_Open_Status' =>
               {
               'SIGNAL_NAME'   => 'Fuel_Lid_Open_Status',      'CANOE_ENV_VAR' => 'EnvFuel_Lid_Open_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Fuel_Lid_Open_Status.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Fuel_Lid_Open_Status.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'ParkBrkActv_D_Actl2' =>
               {
               'SIGNAL_NAME'   => 'ParkBrkActv_D_Actl2',      'CANOE_ENV_VAR' => 'EnvParkBrkActv_D_Actl2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 5, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'ParkBrkActv_D_Actl2.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'ParkBrkActv_D_Actl2.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RC_OCS_Stat_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'RC_OCS_Stat_D_Actl',      'CANOE_ENV_VAR' => 'EnvRC_OCS_Stat_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 29, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RC_OCS_Stat_D_Actl.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RC_OCS_Stat_D_Actl.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RL_OCS_Stat_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'RL_OCS_Stat_D_Actl',      'CANOE_ENV_VAR' => 'EnvRL_OCS_Stat_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RL_OCS_Stat_D_Actl.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RL_OCS_Stat_D_Actl.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RR_OCS_Stat_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'RR_OCS_Stat_D_Actl',      'CANOE_ENV_VAR' => 'EnvRR_OCS_Stat_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 27, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RR_OCS_Stat_D_Actl.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RR_OCS_Stat_D_Actl.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SeatBeltStat_D_Actl' =>
               {
               'SIGNAL_NAME'   => 'SeatBeltStat_D_Actl',      'CANOE_ENV_VAR' => 'EnvSeatBeltStat_D_Actl_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 2, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SeatBeltStat_D_Actl.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SeatBeltStat_D_Actl.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00000111' , 1 => '0b11111000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'StopLampCon_Status' =>
               {
               'SIGNAL_NAME'   => 'StopLampCon_Status',      'CANOE_ENV_VAR' => 'EnvStopLampCon_Status_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 10, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'StopLampCon_Status.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'StopLampCon_Status.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000110' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TrnkLg_Motor_Stat' =>
               {
               'SIGNAL_NAME'   => 'TrnkLg_Motor_Stat',      'CANOE_ENV_VAR' => 'EnvTrnkLg_Motor_Stat_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'RBCM_Information2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TrnkLg_Motor_Stat.RBCM_Information2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TrnkLg_Motor_Stat.RBCM_Information2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00011000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCMSerialNumber (RCM) ID: 1121 (0x461), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'RCMSerialNoByte1' =>
               {
               'SIGNAL_NAME'   => 'RCMSerialNoByte1',      'CANOE_ENV_VAR' => 'EnvRCMSerialNoByte1_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMSerialNumber',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMSerialNoByte1.RCMSerialNumber.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMSerialNoByte1.RCMSerialNumber.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCMSerialNoByte2' =>
               {
               'SIGNAL_NAME'   => 'RCMSerialNoByte2',      'CANOE_ENV_VAR' => 'EnvRCMSerialNoByte2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMSerialNumber',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMSerialNoByte2.RCMSerialNumber.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMSerialNoByte2.RCMSerialNumber.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCMSerialNoByte3' =>
               {
               'SIGNAL_NAME'   => 'RCMSerialNoByte3',      'CANOE_ENV_VAR' => 'EnvRCMSerialNoByte3_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMSerialNumber',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMSerialNoByte3.RCMSerialNumber.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMSerialNoByte3.RCMSerialNumber.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCMSerialNoByte4' =>
               {
               'SIGNAL_NAME'   => 'RCMSerialNoByte4',      'CANOE_ENV_VAR' => 'EnvRCMSerialNoByte4_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMSerialNumber',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMSerialNoByte4.RCMSerialNumber.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMSerialNoByte4.RCMSerialNumber.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCMSerialNoByte5' =>
               {
               'SIGNAL_NAME'   => 'RCMSerialNoByte5',      'CANOE_ENV_VAR' => 'EnvRCMSerialNoByte5_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMSerialNumber',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMSerialNoByte5.RCMSerialNumber.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMSerialNoByte5.RCMSerialNumber.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCMSerialNoByte6' =>
               {
               'SIGNAL_NAME'   => 'RCMSerialNoByte6',      'CANOE_ENV_VAR' => 'EnvRCMSerialNoByte6_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMSerialNumber',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMSerialNoByte6.RCMSerialNumber.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMSerialNoByte6.RCMSerialNumber.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCMSerialNoByte7' =>
               {
               'SIGNAL_NAME'   => 'RCMSerialNoByte7',      'CANOE_ENV_VAR' => 'EnvRCMSerialNoByte7_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMSerialNumber',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMSerialNoByte7.RCMSerialNumber.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMSerialNoByte7.RCMSerialNumber.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'RCMSerialNoByte8' =>
               {
               'SIGNAL_NAME'   => 'RCMSerialNoByte8',      'CANOE_ENV_VAR' => 'EnvRCMSerialNoByte8_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCMSerialNumber',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCMSerialNoByte8.RCMSerialNumber.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCMSerialNoByte8.RCMSerialNumber.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: VDT_Trigger_Control2 (CGW) ID: 1254 (0x4e6), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'TCU_SW_Update_Resp' =>
               {
               'SIGNAL_NAME'   => 'TCU_SW_Update_Resp',      'CANOE_ENV_VAR' => 'EnvTCU_SW_Update_Resp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 9, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TCU_SW_Update_Resp.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TCU_SW_Update_Resp.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_Cancel_Charge_Resp' =>
               {
               'SIGNAL_NAME'   => 'VDT_Cancel_Charge_Resp',      'CANOE_ENV_VAR' => 'EnvVDT_Cancel_Charge_Resp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 3, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_Cancel_Charge_Resp.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_Cancel_Charge_Resp.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_Cancel_PreAC_Resp' =>
               {
               'SIGNAL_NAME'   => 'VDT_Cancel_PreAC_Resp',      'CANOE_ENV_VAR' => 'EnvVDT_Cancel_PreAC_Resp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 12, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_Cancel_PreAC_Resp.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_Cancel_PreAC_Resp.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00011100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_Cancel_Resp_Counter2' =>
               {
               'SIGNAL_NAME'   => 'VDT_Cancel_Resp_Counter2',      'CANOE_ENV_VAR' => 'EnvVDT_Cancel_Resp_Counter2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_Cancel_Resp_Counter2.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_Cancel_Resp_Counter2.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_Charge_Resp' =>
               {
               'SIGNAL_NAME'   => 'VDT_Charge_Resp',      'CANOE_ENV_VAR' => 'EnvVDT_Charge_Resp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_Charge_Resp.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_Charge_Resp.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_ECM_ODR1_ReqTCU' =>
               {
               'SIGNAL_NAME'   => 'VDT_ECM_ODR1_ReqTCU',      'CANOE_ENV_VAR' => 'EnvVDT_ECM_ODR1_ReqTCU_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 21, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_ECM_ODR1_ReqTCU.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_ECM_ODR1_ReqTCU.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_ECM_ODR1_Rq' =>
               {
               'SIGNAL_NAME'   => 'VDT_ECM_ODR1_Rq',      'CANOE_ENV_VAR' => 'EnvVDT_ECM_ODR1_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 22, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_ECM_ODR1_Rq.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_ECM_ODR1_Rq.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_INV_ODR2_ReqTCU' =>
               {
               'SIGNAL_NAME'   => 'VDT_INV_ODR2_ReqTCU',      'CANOE_ENV_VAR' => 'EnvVDT_INV_ODR2_ReqTCU_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 19, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_INV_ODR2_ReqTCU.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_INV_ODR2_ReqTCU.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00001000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_INV_ODR2_Rq' =>
               {
               'SIGNAL_NAME'   => 'VDT_INV_ODR2_Rq',      'CANOE_ENV_VAR' => 'EnvVDT_INV_ODR2_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 20, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_INV_ODR2_Rq.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_INV_ODR2_Rq.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_PreAC_Resp' =>
               {
               'SIGNAL_NAME'   => 'VDT_PreAC_Resp',      'CANOE_ENV_VAR' => 'EnvVDT_PreAC_Resp_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 3, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_PreAC_Resp.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_PreAC_Resp.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_RCM_ODR1_ReqTCU' =>
               {
               'SIGNAL_NAME'   => 'VDT_RCM_ODR1_ReqTCU',      'CANOE_ENV_VAR' => 'EnvVDT_RCM_ODR1_ReqTCU_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_RCM_ODR1_ReqTCU.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_RCM_ODR1_ReqTCU.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_RCM_ODR1_Rq' =>
               {
               'SIGNAL_NAME'   => 'VDT_RCM_ODR1_Rq',      'CANOE_ENV_VAR' => 'EnvVDT_RCM_ODR1_Rq_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_RCM_ODR1_Rq.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_RCM_ODR1_Rq.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_Resp_Counter2' =>
               {
               'SIGNAL_NAME'   => 'VDT_Resp_Counter2',      'CANOE_ENV_VAR' => 'EnvVDT_Resp_Counter2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'VDT_Trigger_Control2',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 35, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_Resp_Counter2.VDT_Trigger_Control2.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_Resp_Counter2.VDT_Trigger_Control2.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Engine_Conf (CGW) ID: 1264 (0x4f0), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'AxleRatioFront' =>
               {
               'SIGNAL_NAME'   => 'AxleRatioFront',      'CANOE_ENV_VAR' => 'EnvAxleRatioFront_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 16, 'OFFSET' => 0.000000, 'FACTOR' => 0.010000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'AxleRatioFront.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'AxleRatioFront.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CylinderDeactivation_Variants' =>
               {
               'SIGNAL_NAME'   => 'CylinderDeactivation_Variants',      'CANOE_ENV_VAR' => 'EnvCylinderDeactivation_Variants_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 46, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CylinderDeactivation_Variants.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CylinderDeactivation_Variants.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EngCltFlow_Cnt_Vlv_Variants' =>
               {
               'SIGNAL_NAME'   => 'EngCltFlow_Cnt_Vlv_Variants',      'CANOE_ENV_VAR' => 'EnvEngCltFlow_Cnt_Vlv_Variants_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 45, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EngCltFlow_Cnt_Vlv_Variants.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EngCltFlow_Cnt_Vlv_Variants.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00100000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EngineDisplacement' =>
               {
               'SIGNAL_NAME'   => 'EngineDisplacement',      'CANOE_ENV_VAR' => 'EnvEngineDisplacement_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 0.100000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'Litres',
               'LC_READ_PHYS'  => 'EngineDisplacement.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EngineDisplacement.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'EngineType_Calibration' =>
               {
               'SIGNAL_NAME'   => 'EngineType_Calibration',      'CANOE_ENV_VAR' => 'EnvEngineType_Calibration_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EngineType_Calibration.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EngineType_Calibration.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Filter_Variants' =>
               {
               'SIGNAL_NAME'   => 'Filter_Variants',      'CANOE_ENV_VAR' => 'EnvFilter_Variants_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 43, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Filter_Variants.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Filter_Variants.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00001100' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'FuelType_Delivery' =>
               {
               'SIGNAL_NAME'   => 'FuelType_Delivery',      'CANOE_ENV_VAR' => 'EnvFuelType_Delivery_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'FuelType_Delivery.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'FuelType_Delivery.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11110000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'OLS_Monitor_Variants' =>
               {
               'SIGNAL_NAME'   => 'OLS_Monitor_Variants',      'CANOE_ENV_VAR' => 'EnvOLS_Monitor_Variants_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 32, 'LENGTH' => 2, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'OLS_Monitor_Variants.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'OLS_Monitor_Variants.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b00000001' , 5 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'SCR_Variants' =>
               {
               'SIGNAL_NAME'   => 'SCR_Variants',      'CANOE_ENV_VAR' => 'EnvSCR_Variants_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 41, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'SCR_Variants.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'SCR_Variants.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00000010' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TransmissionType' =>
               {
               'SIGNAL_NAME'   => 'TransmissionType',      'CANOE_ENV_VAR' => 'EnvTransmissionType_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 11, 'LENGTH' => 4, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TransmissionType.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TransmissionType.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00001111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'Turbo_Variants' =>
               {
               'SIGNAL_NAME'   => 'Turbo_Variants',      'CANOE_ENV_VAR' => 'EnvTurbo_Variants_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'Engine_Conf',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 44, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'Turbo_Variants.Engine_Conf.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'Turbo_Variants.Engine_Conf.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b00010000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: VDT_RCM_EDR (RCM) ID: 1280 (0x500), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'VDT_RCM_EDR1' =>
               {
               'SIGNAL_NAME'   => 'VDT_RCM_EDR1',      'CANOE_ENV_VAR' => 'EnvVDT_RCM_EDR1_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'VDT_RCM_EDR',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_RCM_EDR1.VDT_RCM_EDR.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_RCM_EDR1.VDT_RCM_EDR.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_RCM_EDR2' =>
               {
               'SIGNAL_NAME'   => 'VDT_RCM_EDR2',      'CANOE_ENV_VAR' => 'EnvVDT_RCM_EDR2_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'VDT_RCM_EDR',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_RCM_EDR2.VDT_RCM_EDR.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_RCM_EDR2.VDT_RCM_EDR.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_RCM_EDR3' =>
               {
               'SIGNAL_NAME'   => 'VDT_RCM_EDR3',      'CANOE_ENV_VAR' => 'EnvVDT_RCM_EDR3_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'VDT_RCM_EDR',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_RCM_EDR3.VDT_RCM_EDR.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_RCM_EDR3.VDT_RCM_EDR.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_RCM_EDR4' =>
               {
               'SIGNAL_NAME'   => 'VDT_RCM_EDR4',      'CANOE_ENV_VAR' => 'EnvVDT_RCM_EDR4_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'VDT_RCM_EDR',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_RCM_EDR4.VDT_RCM_EDR.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_RCM_EDR4.VDT_RCM_EDR.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_RCM_EDR5' =>
               {
               'SIGNAL_NAME'   => 'VDT_RCM_EDR5',      'CANOE_ENV_VAR' => 'EnvVDT_RCM_EDR5_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'VDT_RCM_EDR',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_RCM_EDR5.VDT_RCM_EDR.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_RCM_EDR5.VDT_RCM_EDR.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_RCM_EDR6' =>
               {
               'SIGNAL_NAME'   => 'VDT_RCM_EDR6',      'CANOE_ENV_VAR' => 'EnvVDT_RCM_EDR6_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'VDT_RCM_EDR',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_RCM_EDR6.VDT_RCM_EDR.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_RCM_EDR6.VDT_RCM_EDR.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_RCM_EDR7' =>
               {
               'SIGNAL_NAME'   => 'VDT_RCM_EDR7',      'CANOE_ENV_VAR' => 'EnvVDT_RCM_EDR7_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'VDT_RCM_EDR',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_RCM_EDR7.VDT_RCM_EDR.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_RCM_EDR7.VDT_RCM_EDR.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'VDT_RCM_EDR8' =>
               {
               'SIGNAL_NAME'   => 'VDT_RCM_EDR8',      'CANOE_ENV_VAR' => 'EnvVDT_RCM_EDR8_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'VDT_RCM_EDR',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'VDT_RCM_EDR8.VDT_RCM_EDR.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'VDT_RCM_EDR8.VDT_RCM_EDR.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EPAS_Bus_Status (EPAS) ID: 1324 (0x52c), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'DTC1_Nbr_EPAS' =>
               {
               'SIGNAL_NAME'   => 'DTC1_Nbr_EPAS',      'CANOE_ENV_VAR' => 'EnvDTC1_Nbr_EPAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_EPAS' , 'CODE' => 0 },
               'STARTBIT'      => 15, 'LENGTH' => 24, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC1_Nbr_EPAS.EPAS_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC1_Nbr_EPAS.EPAS_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DTC1_Sts_EPAS' =>
               {
               'SIGNAL_NAME'   => 'DTC1_Sts_EPAS',      'CANOE_ENV_VAR' => 'EnvDTC1_Sts_EPAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_EPAS' , 'CODE' => 0 },
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC1_Sts_EPAS.EPAS_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC1_Sts_EPAS.EPAS_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DTC2_Nbr_EPAS' =>
               {
               'SIGNAL_NAME'   => 'DTC2_Nbr_EPAS',      'CANOE_ENV_VAR' => 'EnvDTC2_Nbr_EPAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_EPAS' , 'CODE' => 0 },
               'STARTBIT'      => 47, 'LENGTH' => 24, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC2_Nbr_EPAS.EPAS_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC2_Nbr_EPAS.EPAS_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DTC2_Sts_EPAS' =>
               {
               'SIGNAL_NAME'   => 'DTC2_Sts_EPAS',      'CANOE_ENV_VAR' => 'EnvDTC2_Sts_EPAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_EPAS' , 'CODE' => 1 },
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC2_Sts_EPAS.EPAS_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC2_Sts_EPAS.EPAS_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DTC3_Nbr_EPAS' =>
               {
               'SIGNAL_NAME'   => 'DTC3_Nbr_EPAS',      'CANOE_ENV_VAR' => 'EnvDTC3_Nbr_EPAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_EPAS' , 'CODE' => 1 },
               'STARTBIT'      => 23, 'LENGTH' => 24, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC3_Nbr_EPAS.EPAS_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC3_Nbr_EPAS.EPAS_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DTC3_Sts_EPAS' =>
               {
               'SIGNAL_NAME'   => 'DTC3_Sts_EPAS',      'CANOE_ENV_VAR' => 'EnvDTC3_Sts_EPAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_EPAS' , 'CODE' => 1 },
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC3_Sts_EPAS.EPAS_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC3_Sts_EPAS.EPAS_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DataNumber_EPAS' =>
               {
               'SIGNAL_NAME'   => 'DataNumber_EPAS',      'CANOE_ENV_VAR' => 'EnvDataNumber_EPAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_EPAS' },
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DataNumber_EPAS.EPAS_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DataNumber_EPAS.EPAS_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DiagSupt_Status_EPAS' =>
               {
               'SIGNAL_NAME'   => 'DiagSupt_Status_EPAS',      'CANOE_ENV_VAR' => 'EnvDiagSupt_Status_EPAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_EPAS' , 'CODE' => 1 },
               'STARTBIT'      => 62, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DiagSupt_Status_EPAS.EPAS_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DiagSupt_Status_EPAS.EPAS_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TrigPriority_EPAS' =>
               {
               'SIGNAL_NAME'   => 'TrigPriority_EPAS',      'CANOE_ENV_VAR' => 'EnvTrigPriority_EPAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_EPAS' , 'CODE' => 1 },
               'STARTBIT'      => 54, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'TrigPriority_EPAS.EPAS_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TrigPriority_EPAS.EPAS_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b01111111' , 7 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TrigReq_EPAS' =>
               {
               'SIGNAL_NAME'   => 'TrigReq_EPAS',      'CANOE_ENV_VAR' => 'EnvTrigReq_EPAS_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_EPAS' , 'CODE' => 1 },
               'STARTBIT'      => 55, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TrigReq_EPAS.EPAS_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TrigReq_EPAS.EPAS_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCM_Bus_Status (RCM) ID: 1325 (0x52d), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'DTC1_Nbr_RCM' =>
               {
               'SIGNAL_NAME'   => 'DTC1_Nbr_RCM',      'CANOE_ENV_VAR' => 'EnvDTC1_Nbr_RCM_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_RCM' , 'CODE' => 0 },
               'STARTBIT'      => 15, 'LENGTH' => 24, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC1_Nbr_RCM.RCM_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC1_Nbr_RCM.RCM_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DTC1_Sts_RCM' =>
               {
               'SIGNAL_NAME'   => 'DTC1_Sts_RCM',      'CANOE_ENV_VAR' => 'EnvDTC1_Sts_RCM_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_RCM' , 'CODE' => 0 },
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC1_Sts_RCM.RCM_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC1_Sts_RCM.RCM_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DTC2_Nbr_RCM' =>
               {
               'SIGNAL_NAME'   => 'DTC2_Nbr_RCM',      'CANOE_ENV_VAR' => 'EnvDTC2_Nbr_RCM_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_RCM' , 'CODE' => 0 },
               'STARTBIT'      => 47, 'LENGTH' => 24, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC2_Nbr_RCM.RCM_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC2_Nbr_RCM.RCM_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DTC2_Sts_RCM' =>
               {
               'SIGNAL_NAME'   => 'DTC2_Sts_RCM',      'CANOE_ENV_VAR' => 'EnvDTC2_Sts_RCM_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_RCM' , 'CODE' => 1 },
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC2_Sts_RCM.RCM_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC2_Sts_RCM.RCM_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DTC3_Nbr_RCM' =>
               {
               'SIGNAL_NAME'   => 'DTC3_Nbr_RCM',      'CANOE_ENV_VAR' => 'EnvDTC3_Nbr_RCM_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_RCM' , 'CODE' => 1 },
               'STARTBIT'      => 23, 'LENGTH' => 24, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC3_Nbr_RCM.RCM_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC3_Nbr_RCM.RCM_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DTC3_Sts_RCM' =>
               {
               'SIGNAL_NAME'   => 'DTC3_Sts_RCM',      'CANOE_ENV_VAR' => 'EnvDTC3_Sts_RCM_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_RCM' , 'CODE' => 1 },
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'DTC3_Sts_RCM.RCM_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DTC3_Sts_RCM.RCM_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DataNumber_RCM' =>
               {
               'SIGNAL_NAME'   => 'DataNumber_RCM',      'CANOE_ENV_VAR' => 'EnvDataNumber_RCM_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_RCM' },
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DataNumber_RCM.RCM_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DataNumber_RCM.RCM_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DiagSupt_Status_RCM' =>
               {
               'SIGNAL_NAME'   => 'DiagSupt_Status_RCM',      'CANOE_ENV_VAR' => 'EnvDiagSupt_Status_RCM_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_RCM' , 'CODE' => 1 },
               'STARTBIT'      => 62, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DiagSupt_Status_RCM.RCM_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DiagSupt_Status_RCM.RCM_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b01000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TrigPriority_RCM' =>
               {
               'SIGNAL_NAME'   => 'TrigPriority_RCM',      'CANOE_ENV_VAR' => 'EnvTrigPriority_RCM_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_RCM' , 'CODE' => 1 },
               'STARTBIT'      => 54, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => 'HEX',
               'LC_READ_PHYS'  => 'TrigPriority_RCM.RCM_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TrigPriority_RCM.RCM_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b01111111' , 7 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'TrigReq_RCM' =>
               {
               'SIGNAL_NAME'   => 'TrigReq_RCM',      'CANOE_ENV_VAR' => 'EnvTrigReq_RCM_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Bus_Status',
               'MULTIPLEX'     => { 'MASTER' => 'DataNumber_RCM' , 'CODE' => 1 },
               'STARTBIT'      => 55, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'TrigReq_RCM.RCM_Bus_Status.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'TrigReq_RCM.RCM_Bus_Status.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b10000000' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: CBCM_Autosar_NM (CGW) ID: 1409 (0x581), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'CGW_NM_RptMsgRequest' =>
               {
               'SIGNAL_NAME'   => 'CGW_NM_RptMsgRequest',      'CANOE_ENV_VAR' => 'EnvCGW_NM_RptMsgRequest_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_NM_RptMsgRequest.CBCM_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_NM_RptMsgRequest.CBCM_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CGW_NM_SourceNodeID' =>
               {
               'SIGNAL_NAME'   => 'CGW_NM_SourceNodeID',      'CANOE_ENV_VAR' => 'EnvCGW_NM_SourceNodeID_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_NM_SourceNodeID.CBCM_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_NM_SourceNodeID.CBCM_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CGW_NM_UserData0' =>
               {
               'SIGNAL_NAME'   => 'CGW_NM_UserData0',      'CANOE_ENV_VAR' => 'EnvCGW_NM_UserData0_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_NM_UserData0.CBCM_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_NM_UserData0.CBCM_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CGW_NM_UserData1' =>
               {
               'SIGNAL_NAME'   => 'CGW_NM_UserData1',      'CANOE_ENV_VAR' => 'EnvCGW_NM_UserData1_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_NM_UserData1.CBCM_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_NM_UserData1.CBCM_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CGW_NM_UserData2' =>
               {
               'SIGNAL_NAME'   => 'CGW_NM_UserData2',      'CANOE_ENV_VAR' => 'EnvCGW_NM_UserData2_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_NM_UserData2.CBCM_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_NM_UserData2.CBCM_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CGW_NM_UserData3' =>
               {
               'SIGNAL_NAME'   => 'CGW_NM_UserData3',      'CANOE_ENV_VAR' => 'EnvCGW_NM_UserData3_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_NM_UserData3.CBCM_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_NM_UserData3.CBCM_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CGW_NM_UserData4' =>
               {
               'SIGNAL_NAME'   => 'CGW_NM_UserData4',      'CANOE_ENV_VAR' => 'EnvCGW_NM_UserData4_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_NM_UserData4.CBCM_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_NM_UserData4.CBCM_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CGW_NM_UserData5' =>
               {
               'SIGNAL_NAME'   => 'CGW_NM_UserData5',      'CANOE_ENV_VAR' => 'EnvCGW_NM_UserData5_',
               'SENDER'        => 'CGW',
               'MESSAGE'       => 'CBCM_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CGW_NM_UserData5.CBCM_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CGW_NM_UserData5.CBCM_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: ABS_Autosar_NM (DSC) ID: 1430 (0x596), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'DSC_NM_RptMsgRequest' =>
               {
               'SIGNAL_NAME'   => 'DSC_NM_RptMsgRequest',      'CANOE_ENV_VAR' => 'EnvDSC_NM_RptMsgRequest_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'ABS_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 8, 'LENGTH' => 1, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSC_NM_RptMsgRequest.ABS_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSC_NM_RptMsgRequest.ABS_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b00000001' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DSC_NM_SourceNodeID' =>
               {
               'SIGNAL_NAME'   => 'DSC_NM_SourceNodeID',      'CANOE_ENV_VAR' => 'EnvDSC_NM_SourceNodeID_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'ABS_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSC_NM_SourceNodeID.ABS_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSC_NM_SourceNodeID.ABS_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DSC_NM_UserData0' =>
               {
               'SIGNAL_NAME'   => 'DSC_NM_UserData0',      'CANOE_ENV_VAR' => 'EnvDSC_NM_UserData0_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'ABS_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSC_NM_UserData0.ABS_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSC_NM_UserData0.ABS_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DSC_NM_UserData1' =>
               {
               'SIGNAL_NAME'   => 'DSC_NM_UserData1',      'CANOE_ENV_VAR' => 'EnvDSC_NM_UserData1_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'ABS_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSC_NM_UserData1.ABS_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSC_NM_UserData1.ABS_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DSC_NM_UserData2' =>
               {
               'SIGNAL_NAME'   => 'DSC_NM_UserData2',      'CANOE_ENV_VAR' => 'EnvDSC_NM_UserData2_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'ABS_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSC_NM_UserData2.ABS_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSC_NM_UserData2.ABS_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DSC_NM_UserData3' =>
               {
               'SIGNAL_NAME'   => 'DSC_NM_UserData3',      'CANOE_ENV_VAR' => 'EnvDSC_NM_UserData3_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'ABS_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSC_NM_UserData3.ABS_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSC_NM_UserData3.ABS_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DSC_NM_UserData4' =>
               {
               'SIGNAL_NAME'   => 'DSC_NM_UserData4',      'CANOE_ENV_VAR' => 'EnvDSC_NM_UserData4_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'ABS_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSC_NM_UserData4.ABS_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSC_NM_UserData4.ABS_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'DSC_NM_UserData5' =>
               {
               'SIGNAL_NAME'   => 'DSC_NM_UserData5',      'CANOE_ENV_VAR' => 'EnvDSC_NM_UserData5_',
               'SENDER'        => 'DSC',
               'MESSAGE'       => 'ABS_Autosar_NM',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'DSC_NM_UserData5.ABS_Autosar_NM.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'DSC_NM_UserData5.ABS_Autosar_NM.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EPAS_CCP_Rx (Tester) ID: 1542 (0x606), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'CCPMessageDataEPAS1_Rx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS1_Rx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS1_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'EPAS_CCP_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS1_Rx.EPAS_CCP_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS1_Rx.EPAS_CCP_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS2_Rx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS2_Rx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS2_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'EPAS_CCP_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS2_Rx.EPAS_CCP_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS2_Rx.EPAS_CCP_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS3_Rx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS3_Rx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS3_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'EPAS_CCP_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS3_Rx.EPAS_CCP_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS3_Rx.EPAS_CCP_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS4_Rx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS4_Rx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS4_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'EPAS_CCP_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS4_Rx.EPAS_CCP_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS4_Rx.EPAS_CCP_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS5_Rx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS5_Rx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS5_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'EPAS_CCP_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS5_Rx.EPAS_CCP_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS5_Rx.EPAS_CCP_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS6_Rx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS6_Rx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS6_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'EPAS_CCP_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS6_Rx.EPAS_CCP_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS6_Rx.EPAS_CCP_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS7_Rx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS7_Rx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS7_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'EPAS_CCP_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS7_Rx.EPAS_CCP_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS7_Rx.EPAS_CCP_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS_Rx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS_Rx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'EPAS_CCP_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS_Rx.EPAS_CCP_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS_Rx.EPAS_CCP_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EPAS_CCP_Tx (EPAS) ID: 1543 (0x607), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'CCPMessageDataEPAS1_Tx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS1_Tx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS1_Tx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_CCP_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 15, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS1_Tx.EPAS_CCP_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS1_Tx.EPAS_CCP_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 1 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS2_Tx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS2_Tx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS2_Tx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_CCP_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 23, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS2_Tx.EPAS_CCP_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS2_Tx.EPAS_CCP_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 2 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS3_Tx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS3_Tx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS3_Tx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_CCP_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 31, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS3_Tx.EPAS_CCP_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS3_Tx.EPAS_CCP_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 3 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS4_Tx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS4_Tx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS4_Tx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_CCP_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 39, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS4_Tx.EPAS_CCP_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS4_Tx.EPAS_CCP_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 4 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS5_Tx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS5_Tx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS5_Tx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_CCP_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 47, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS5_Tx.EPAS_CCP_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS5_Tx.EPAS_CCP_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 5 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS6_Tx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS6_Tx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS6_Tx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_CCP_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 55, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS6_Tx.EPAS_CCP_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS6_Tx.EPAS_CCP_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 6 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS7_Tx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS7_Tx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS7_Tx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_CCP_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 63, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS7_Tx.EPAS_CCP_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS7_Tx.EPAS_CCP_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

'CCPMessageDataEPAS_Tx' =>
               {
               'SIGNAL_NAME'   => 'CCPMessageDataEPAS_Tx',      'CANOE_ENV_VAR' => 'EnvCCPMessageDataEPAS_Tx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_CCP_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 8, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'CCPMessageDataEPAS_Tx.EPAS_CCP_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'CCPMessageDataEPAS_Tx.EPAS_CCP_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EPAS_Diag_Rx (Tester) ID: 1840 (0x730), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'EPAS_Diag_Sig_Rx' =>
               {
               'SIGNAL_NAME'   => 'EPAS_Diag_Sig_Rx',      'CANOE_ENV_VAR' => 'EnvEPAS_Diag_Sig_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'EPAS_Diag_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 64, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPAS_Diag_Sig_Rx.EPAS_Diag_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPAS_Diag_Sig_Rx.EPAS_Diag_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCM_Diag_Rx (Tester) ID: 1847 (0x737), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'RCM_Diag_Sig_Rx' =>
               {
               'SIGNAL_NAME'   => 'RCM_Diag_Sig_Rx',      'CANOE_ENV_VAR' => 'EnvRCM_Diag_Sig_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'RCM_Diag_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 64, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCM_Diag_Sig_Rx.RCM_Diag_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCM_Diag_Sig_Rx.RCM_Diag_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: EPAS_Diag_Tx (EPAS) ID: 1848 (0x738), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'EPAS_Diag_Sig_Tx' =>
               {
               'SIGNAL_NAME'   => 'EPAS_Diag_Sig_Tx',      'CANOE_ENV_VAR' => 'EnvEPAS_Diag_Sig_Tx_',
               'SENDER'        => 'EPAS',
               'MESSAGE'       => 'EPAS_Diag_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 64, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'EPAS_Diag_Sig_Tx.EPAS_Diag_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'EPAS_Diag_Sig_Tx.EPAS_Diag_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCM_Diag_Tx (RCM) ID: 1855 (0x73f), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'RCM_Diag_Sig_Tx' =>
               {
               'SIGNAL_NAME'   => 'RCM_Diag_Sig_Tx',      'CANOE_ENV_VAR' => 'EnvRCM_Diag_Sig_Tx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_Diag_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 64, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCM_Diag_Sig_Tx.RCM_Diag_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCM_Diag_Sig_Tx.RCM_Diag_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: Functional_Diag_Request (Tester) ID: 2015 (0x7df), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'OBD_II_Broadcast_Info' =>
               {
               'SIGNAL_NAME'   => 'OBD_II_Broadcast_Info',      'CANOE_ENV_VAR' => 'EnvOBD_II_Broadcast_Info_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'Functional_Diag_Request',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 64, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'OBD_II_Broadcast_Info.Functional_Diag_Request.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'OBD_II_Broadcast_Info.Functional_Diag_Request.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCM_ISO_SCRAP_Rx (Tester) ID: 2033 (0x7f1), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'RCM_SCRAP_Diag_Sig_Rx' =>
               {
               'SIGNAL_NAME'   => 'RCM_SCRAP_Diag_Sig_Rx',      'CANOE_ENV_VAR' => 'EnvRCM_SCRAP_Diag_Sig_Rx_',
               'SENDER'        => 'Tester',
               'MESSAGE'       => 'RCM_ISO_SCRAP_Rx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 64, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCM_SCRAP_Diag_Sig_Rx.RCM_ISO_SCRAP_Rx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCM_SCRAP_Diag_Sig_Rx.RCM_ISO_SCRAP_Rx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

# -------------------------------------------------------------------------------------- 

# ----------- CAN MESSAGE: RCM_ISO_SCRAP_Tx (RCM) ID: 2041 (0x7f9), DBC File name :G70L_CANFD_R01h_withVehicle_MNOS  ------------- 

# -------------------------------------------------------------------------------------- 

'RCM_SCRAP_Diag_Sig_Tx' =>
               {
               'SIGNAL_NAME'   => 'RCM_SCRAP_Diag_Sig_Tx',      'CANOE_ENV_VAR' => 'EnvRCM_SCRAP_Diag_Sig_Tx_',
               'SENDER'        => 'RCM',
               'MESSAGE'       => 'RCM_ISO_SCRAP_Tx',
               'MULTIPLEX'     => undef,
               'STARTBIT'      => 7, 'LENGTH' => 64, 'OFFSET' => 0.000000, 'FACTOR' => 1.000000,
               'FORMAT'        => 'MOTOROLA', 'TYPE' => 'UNSIGNED', 'UNIT' => '',
               'LC_READ_PHYS'  => 'RCM_SCRAP_Diag_Sig_Tx.RCM_ISO_SCRAP_Tx.CAN_engine',     # verify with CAN block parameters of LC model (*.dcm-file)
               'LC_WRITE_PHYS' => 'RCM_SCRAP_Diag_Sig_Tx.RCM_ISO_SCRAP_Tx.CAN_engine',     # set to 0 if LC model controlled and
               'LC_MODEL_CTRL' => 0,                               # set to 1 if LC model controlled
               'LC_EDIT_BYTES' => { 0 => '0b11111111' , 1 => '0b11111111' , 2 => '0b11111111' , 3 => '0b11111111' , 4 => '0b11111111' , 5 => '0b11111111' , 6 => '0b11111111' , 7 => '0b11111111' },   # affected Byte(s) & BitMask(s) (used when 'LC_MODEL_CTRL')
               },

};
# end of CAN mapping

1;
