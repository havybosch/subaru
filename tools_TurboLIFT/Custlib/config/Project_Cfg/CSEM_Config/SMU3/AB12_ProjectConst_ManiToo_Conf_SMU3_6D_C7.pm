package LIFT_PROJECT;

#use strict;
use warnings;

$Defaults->{'TEMP_OPTIONAL_FAULTS'} = ['rb_coa_VehSpdRxMsgTimeout_flt'];

$Defaults->{'PARA_MAP_CONF_SMU3_6D_C7'} = {

    # maximum nuber of repetitions for "not passed" test cases
    'MAX_TC_REPETITION'             => 0,
    'Project_Line'                  => 'RT5',
    'FILTER1_RAW_CONFIGURED'        => 'yes',
    'FILTER1_CALIBRATED_CONFIGURED' => 'yes',
    'FILTER2_RAW_CONFIGURED'        => 'yes',

    #******************************************************************************
    #                         Fast Diagnosis Trigger
    #******************************************************************************

    'Trigger_Value_C'           => 140,
    'Trigger_YawRateLfChl_S16'  => 'rb_csic_RtComRxPayload_au16(18)_S16',
    'Trigger_AccXLgChl_S16'     => 'rb_csic_RtComRxPayload_au16(11)_S16',
    'Trigger_RollRateLfChl_S16' => 'rb_csic_RtComRxPayload_au16(17)_S16',

    'TempFaultQualiTimeMin_C' => 0,
    'TempFaultQualiTimeMax_C' => 20,

    #******************************************************************************
    #                                API to Algo
    #******************************************************************************
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_MainAccX_e;0;SMA_ax_highG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_MainAccY_e;1;SMA_ay_highG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_MainAccZ_e;2;SMA_az_midG

    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXLg_e;3;IMU_ax_lowG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXHgMon_e;4;IMU_ax_midG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYLg_e;5;IMU_ay_lowG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYHgMon_e;6;IMU_ay_midG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZLg_e;7;IMU_az_lowG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZHgMon_e;8;IMU_az_midG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_RollRateLf_e;9;IMU_rateX
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_YawRateLf_e;10;IMU_rateZ
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_PitchRateLf_e;11;IMU_rateY
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu1Temperature_e;12;IMU_Temperature
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu1FrequencyCounter_e;13;IMU_SPI_FREQ_CNT

    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXLgPlausi_e;14;IMU_ax_lowG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXHgMonPlausi_e;15;IMU_ax_midG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYLgPlausi_e;16;IMU_ay_lowG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYHgMonPlausi_e;17;IMU_ay_midG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZLgPlausi_e;18;IMU_az_lowG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZHgMonPlausi_e;19;IMU_az_midG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_RollRateLfPlausi_e;20;IMU_rateX_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_YawRateLfPlausi_e;21;IMU_rateZ_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_PitchRateLfPlausi_e;22;IMU_rateY_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu2Temperature_e;23;IMU_Temperature_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu2FrequencyCounter_e;24;IMU_SPI_FREQ_CNT_HPS

    #AlgoDataValid
    #----------------------------------------------
    'AccXLgChl_AlgoDataValid_U8' => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',

    # 'AccXHgMonChl_AlgoDataValid_U8'      		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'AccYLgChl_AlgoDataValid_U8' => 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',

    # 'AccYHgMonChl_AlgoDataValid_U8'      		=> 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',
    'AccZLgChl_AlgoDataValid_U8' => 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',

    # 'AccZHgMonChl_AlgoDataValid_U8'         	=> 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',
    'RollRateLfChl_AlgoDataValid_U8'      => 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',
    'YawRateLfChl_AlgoDataValid_U8'       => 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',
    'PitchRateLfChl_AlgoDataValid_U8'     => 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',
    'Imu2TemperatureChl_AlgoDataValid_U8' => 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',
    'TemperatureChl_AlgoDataValid_U8'     => 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',
    'FrequencyCounter_AlgoDataValid_U8'   => 'rb_csem_SensorDataRT_st.DataValid_b32.3_U8',

    'SMA_SMI_Algo_data_valid_bits_U32'   => 'rb_csem_SensorDataRT_st.DataValid_b32_U32',
    'SMA_SMI_Algo_data_valid_bits_U32_C' => '0b00000001111101010111111011111111',          #All sensor channels are configured including SMA, SMI and SMU.

    #AlgoDataValid_b32.1
    #-------------------
    'AlgoDataValid_b32.1_U8'        => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'AccXLgChl_AlgoData_NotValid_C' => '0bx0xxxxxx',
    'AccXLgChl_AlgoData_Valid_C'    => '0bx1xxxxxx',
    'AccYLgChl_AlgoData_NotValid_C' => '0bxxxxxxx0',
    'AccYLgChl_AlgoData_Valid_C'    => '0bxxxxxxx1',

    #AlgoDataValid_b32.2
    #-------------------
    'AlgoDataValid_b32.2_U8'        => 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',
    'AccZLgChl_AlgoData_NotValid_C' => '0bxxxxx0xx',
    'AccZLgChl_AlgoData_Valid_C'    => '0bxxxxx1xx',

    'RollRateLfChl_AlgoData_NotValid_C' => '0bxxx0xxxx',
    'RollRateLfChl_AlgoData_Valid_C'    => '0bxxx1xxxx',

    'YawRateLfChl_AlgoData_NotValid_C' => '0bxx0xxxxx',
    'YawRateLfChl_AlgoData_Valid_C'    => '0bxx1xxxxx',

    'PitchRateLfChl_AlgoData_NotValid_C' => '0bx0xxxxxx',
    'PitchRateLfChl_AlgoData_Valid_C'    => '0bx1xxxxxx',

    'Imu2TemperatureChl_AlgoData_NotValid_C' => '0b0xxxxxxx',
    'Imu2TemperatureChl_AlgoData_Valid_C'    => '0b1xxxxxxx',    ##Updated till here from the top##

    'TemperatureChl_AlgoData_NotValid_C' => '0b0xxxxxxx',
    'TemperatureChl_AlgoData_Valid_C'    => '0b1xxxxxxx',

    'AlgoDataValid_b32.2_U8'               => 'rb_csem_SensorDataRT_st.DataValid_b32.2_U8',
    'FrequencyCounter_AlgoData_Valid_C'    => '0bxxxxxxx0',
    'FrequencyCounter_AlgoData_NotValid_C' => '0bxxxxxxx1',

    #AlgoDataValid_b32
    #-----------------
    'AlgoDataValid_V'   => 'rb_csem_SensorDataRT_st.DataValid_b32',
    'AlgoDataValid_U32' => 'rb_csem_SensorDataRT_st.DataValid_b32_U32',

    #    YawRateLf, RollRateLfChl, AccZLgChl, AccYHgMonChl, AccYLgChl, AccXHgMonChl, AccXLgChl

    'InertialSensor2_AlgoData_NotValid_C' => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'InertialSensor2_AlgoData_Valid_C'    => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',

    'AccXLgChl_AlgoData32_NotValid_C'            => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'AccXLgChl_AlgoData32_Valid_C'               => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'AccYLgChl_AlgoData32_NotValid_C'            => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'AccYLgChl_AlgoData32_Valid_C'               => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'AccZLgChl_AlgoData32_NotValid_C'            => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'AccZLgChl_AlgoData32_Valid_C'               => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'RollRateLfChl_AlgoData32_NotValid_C'        => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'RollRateLfChl_AlgoData32_Valid_C'           => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'YawRateLfChl_AlgoData32_NotValid_C'         => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'YawRateLfChl_AlgoData32_Valid_C'            => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'PitchRateLfChl_AlgoData32_NotValid_C'       => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'PitchRateLfChl_AlgoData32_Valid_C'          => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'Imu2TemperatureChl_AlgoData32_NotValid_C'   => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'Imu2TemperatureChl_AlgoData32_Valid_C'      => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'Imu2FrequencyCounter_AlgoData32_NotValid_C' => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'Imu2FrequencyCounter_AlgoData32_Valid_C'    => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',

    'AccXLgChl_Cyclic_AlgoData32_NotValid_C'            => '0bxxxxxxx11111010100xxxxxxxxxxxxxx',
    'AccXLgChl_Cyclic_AlgoData32_Valid_C'               => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'AccYLgChl_Cyclic_AlgoData32_NotValid_C'            => '0bxxxxxxx11111010001xxxxxxxxxxxxxx',
    'AccYLgChl_Cyclic_AlgoData32_Valid_C'               => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'AccZLgChl_Cyclic_AlgoData32_NotValid_C'            => '0bxxxxxxx11111000101xxxxxxxxxxxxxx',
    'AccZLgChl_Cyclic_AlgoData32_Valid_C'               => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'RollRateLfChl_Cyclic_AlgoData32_NotValid_C'        => '0bxxxxxxx11110010101xxxxxxxxxxxxxx',
    'RollRateLfChl_Cyclic_AlgoData32_Valid_C'           => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'YawRateLfChl_Cyclic_AlgoData32_NotValid_C'         => '0bxxxxxxx11101010101xxxxxxxxxxxxxx',
    'YawRateLfChl_Cyclic_AlgoData32_Valid_C'            => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'PitchRateLfChl_Cyclic_AlgoData32_NotValid_C'       => '0bxxxxxxx11011010101xxxxxxxxxxxxxx',
    'PitchRateLfChl_Cyclic_AlgoData32_Valid_C'          => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'Imu2TemperatureChl_Cyclic_AlgoData32_NotValid_C'   => '0bxxxxxxx10111010101xxxxxxxxxxxxxx',
    'Imu2TemperatureChl_Cyclic_AlgoData32_Valid_C'      => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'Imu2FrequencyCounter_Cyclic_AlgoData32_NotValid_C' => '0bxxxxxxx01111010101xxxxxxxxxxxxxx',
    'Imu2FrequencyCounter_Cyclic_AlgoData32_Valid_C'    => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',

    'AccXLgChl_AlgoData32_NotConfig_NotValid_C'            => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'AccXLgChl_AlgoData32_NotConfig_Valid_C'               => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'AccYLgChl_AlgoData32_NotConfig_NotValid_C'            => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'AccYLgChl_AlgoData32_NotConfig_Valid_C'               => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'AccZLgChl_AlgoData32_NotConfig_NotValid_C'            => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'AccZLgChl_AlgoData32_NotConfig_Valid_C'               => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'RollRateLfChl_AlgoData32_NotConfig_NotValid_C'        => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'RollRateLfChl_AlgoData32_NotConfig_Valid_C'           => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'YawRateLfChl_AlgoData32_NotConfig_NotValid_C'         => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'YawRateLfChl_AlgoData32_NotConfig_Valid_C'            => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'PitchRateLfChl_AlgoData32_NotConfig_NotValid_C'       => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'PitchRateLfChl_AlgoData32_NotConfig_Valid_C'          => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'Imu2TemperatureChl_AlgoData32_NotConfig_NotValid_C'   => '0bxxxxxxx00000000000xxxxxxxxxxxxxx',
    'Imu2TemperatureChl_AlgoData32_NotConfig_Valid_C'      => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',
    'Imu2FrequencyCounter_AlgoData32_NotConfig_NotValid_C' => '0bxxxxxxx01111010101xxxxxxxxxxxxxx',
    'Imu2FrequencyCounter_AlgoData32_NotConfig_Valid_C'    => '0bxxxxxxx11111010101xxxxxxxxxxxxxx',

    #InertDataOverload
    #----------------------------------------------
    'AccXLgChl_InertDataOverload_U8'          => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
    'AccYLgChl_InertDataOverload_U8'          => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.2_U8',
    'AccZLgChl_InertDataOverload_U8'          => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.2_U8',
    'RollRateLfChl_InertDataOverload_U8'      => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.2_U8',
    'YawRateLfChl_InertDataOverload_U8'       => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.2_U8',
    'PitchRateLfChl_InertDataOverload_U8'     => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.2_U8',
    'Imu2TemperatureChl_InertDataOverload_U8' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.2_U8',

    #InertDataOverload_b32.1
    #-----------------------
    'AccXLgChl_InertDataOverload_0_C' => '0bx0xxxxxx',
    'AccXLgChl_InertDataOverload_1_C' => '0bx1xxxxxx',
    'AccYLgChl_InertDataOverload_0_C' => '0bxxxxxxx0',
    'AccYLgChl_InertDataOverload_1_C' => '0bxxxxxxx1',

    #InertDataOverload_b32.2
    #-----------------------
    'AccZLgChl_InertDataOverload_0_C'          => '0bxxxxx0xx',
    'AccZLgChl_InertDataOverload_1_C'          => '0bxxxxx1xx',
    'RollRateLfChl_InertDataOverload_0_C'      => '0bxxx0xxxx',
    'RollRateLfChl_InertDataOverload_1_C'      => '0bxxx1xxxx',
    'YawRateLfChl_InertDataOverload_0_C'       => '0bxx0xxxxx',
    'YawRateLfChl_InertDataOverload_1_C'       => '0bxx1xxxxx',
    'PitchRateLfChl_InertDataOverload_0_C'     => '0bx0xxxxxx',
    'PitchRateLfChl_InertDataOverload_1_C'     => '0bx1xxxxxx',
    'Imu2TemperatureChl_InertDataOverload_0_C' => '0b0xxxxxxx',
    'Imu2TemperatureChl_InertDataOverload_1_C' => '0b1xxxxxxx',

    # SensorDataComFaultRT (requirement from Toyota, related to CRC fault) - communication fault flags
    #----------------------------------------------
    'AccXLgChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32.1_U8',
    'AccYLgChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32.2_U8',

    'AccZLgChl_SensorDataComFaultRT_U8'          => 'rb_csem_SensorDataComFaultRT_b32.2_U8',
    'RollRateLfChl_SensorDataComFaultRT_U8'      => 'rb_csem_SensorDataComFaultRT_b32.2_U8',
    'YawRateLfChl_SensorDataComFaultRT_U8'       => 'rb_csem_SensorDataComFaultRT_b32.2_U8',
    'PitchRateLfChl_SensorDataComFaultRT_U8'     => 'rb_csem_SensorDataComFaultRT_b32.2_U8',
    'Imu2TemperatureChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32.2_U8',

    #SensorDataComFaultRT_b32.1
    #-----------------------
    'AccXLgChl_SensorDataComFaultRT_0_C' => '0bx0xxxxxx',
    'AccXLgChl_SensorDataComFaultRT_1_C' => '0bx1xxxxxx',
    'AccYLgChl_SensorDataComFaultRT_0_C' => '0bxxxxxxx0',
    'AccYLgChl_SensorDataComFaultRT_1_C' => '0bxxxxxxx1',

    #SensorDataComFaultRT_b32.2
    #-----------------------
    'AccZLgChl_SensorDataComFaultRT_0_C'          => '0bxxxxx0xx',
    'AccZLgChl_SensorDataComFaultRT_1_C'          => '0bxxxxx1xx',
    'RollRateLfChl_SensorDataComFaultRT_0_C'      => '0bxxx0xxxx',
    'RollRateLfChl_SensorDataComFaultRT_1_C'      => '0bxxx1xxxx',
    'YawRateLfChl_SensorDataComFaultRT_0_C'       => '0bxx0xxxxx',
    'YawRateLfChl_SensorDataComFaultRT_1_C'       => '0bxx1xxxxx',
    'PitchRateLfChl_SensorDataComFaultRT_0_C'     => '0bx0xxxxxx',
    'PitchRateLfChl_SensorDataComFaultRT_1_C'     => '0bx1xxxxxx',
    'Imu2TemperatureChl_SensorDataComFaultRT_0_C' => '0b0xxxxxxx',
    'Imu2TemperatureChl_SensorDataComFaultRT_1_C' => '0b1xxxxxxx',

    #rb_csim_ManagerState_ten
    #-----------------------------------
    # enum;rb_csim_ManagerState_ten;rb_csim_Idle_e;0;Idle state
    # enum;rb_csim_ManagerState_ten;rb_csim_Init_e;1;Initial state
    # enum;rb_csim_ManagerState_ten;rb_csim_ReadAsicSerialNumbers_e;2;Read ASIC serial numbers
    # enum;rb_csim_ManagerState_ten;rb_csim_SensorSpecificInits_e;3;
    # enum;rb_csim_ManagerState_ten;rb_csim_VerifyInitFlags_e;4;Verify initial error and status flags
    # enum;rb_csim_ManagerState_ten;rb_csim_HandleChlFaultsPrevPoc_e;5;Handle channel faults stored in any previous power on cycles
    # enum;rb_csim_ManagerState_ten;rb_csim_HandleFaultsInInit_e;6;Handle sensor faults in initialization
    # enum;rb_csim_ManagerState_ten;rb_csim_PrepareSystemInitBG_e;7;Prepare system initialisation in background state
    # enum;rb_csim_ManagerState_ten;rb_csim_PrepareSystemInitRT_e;8;Prepare system initialisation in realtime state
    # enum;rb_csim_ManagerState_ten;rb_csim_SystemInit_e;9;System initialisation state
    # enum;rb_csim_ManagerState_ten;rb_csim_PrepareSteadyStateRT_e;10;Preparation of steady state (real-time actions)
    # enum;rb_csim_ManagerState_ten;rb_csim_SteadyState_e;11;Steady state
    # enum;rb_csim_ManagerState_ten;rb_csim_Disabled_e;12;Disabled state
    #-------------------------------------
    'rb_csim_Idle_C'                   => 0,
    'rb_csim_Init_C'                   => 1,
    'rb_csim_ReadAsicSerialNumbers_C'  => 2,
    'rb_csim_SensorSpecificInits_C'    => 3,
    'rb_csim_WaitForSensorInit_C'      => 4,
    'rb_csim_VerifyInitFlags_C'        => 5,
    'rb_csim_HandleChlFaultsPrevPoc_C' => 6,
    'rb_csim_HandleFaultsInInit_C'     => 7,
    'rb_csim_PrepareSystemInitBG_C'    => 8,
    'rb_csim_PrepareSystemInitRT_C'    => 9,
    'rb_csim_SystemInit_C'             => 10,
    'rb_csim_PrepareSteadyStateRT_C'   => 11,
    'rb_csim_SteadyState_C'            => 12,
    'rb_csim_Disabled_C'               => 13,

    #******************************************************************************
    #                            API to Customer
    #******************************************************************************
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccXLg_e;0;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccXHgMon_e;1;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccYLg_e;2;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccYHgMon_e;3;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccZLg_e;4;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccZHgMon_e;5;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1RollRateLf_e;6;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1YawRateLf_e;7;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1PitchRateLf_e;8;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1Temperature_e;9;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1FrequencyCounter_e;10;

    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccXLg_e;11;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccXHgMon_e;12;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccYLg_e;13;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccYHgMon_e;14;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccZLg_e;15;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccZHgMon_e;16;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2RollRateLf_e;17;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2YawRateLf_e;18;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2PitchRateLf_e;19;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2Temperature_e;20;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2FrequencyCounter_e;21;
    #
    #   ChlState API to Customer
    #---------------------------
    'AccXLgChl_State_U8'            => 'rb_csim_ChlState_aen(11)_U8',
    'AccYLgChl_State_U8'            => 'rb_csim_ChlState_aen(13)_U8',
    'AccZLgChl_State_U8'            => 'rb_csim_ChlState_aen(15)_U8',
    'RollRateLfChl_State_U8'        => 'rb_csim_ChlState_aen(17)_U8',
    'YawRateLfChl_State_U8'         => 'rb_csim_ChlState_aen(18)_U8',
    'PitchRateLfChl_State_U8'       => 'rb_csim_ChlState_aen(19)_U8',
    'TemperatureChl_State_U8'       => 'rb_csim_ChlState_aen(20)_U8',
    'Imu2FrequencyCounter_State_U8' => 'rb_csim_ChlState_aen(21)_U8',
    'FrequencyCounter_State_U8'     => 'rb_csim_ChlState_aen(21)_U8',

    'AccXLgChl_State_V'            => 'rb_csim_ChlState_aen(11)',
    'AccYLgChl_State_V'            => 'rb_csim_ChlState_aen(13)',
    'AccZLgChl_State_V'            => 'rb_csim_ChlState_aen(15)',
    'RollRateLfChl_State_V'        => 'rb_csim_ChlState_aen(17)',
    'YawRateLfChl_State_V'         => 'rb_csim_ChlState_aen(18)',
    'PitchRateLfChl_State_V'       => 'rb_csim_ChlState_aen(19)',
    'Imu2TemperatureChl_State_V'   => 'rb_csim_ChlState_aen(20)',
    'TemperatureChl_State_V'       => 'rb_csim_ChlState_aen(20)',
    'Imu2FrequencyCounter_State_V' => 'rb_csim_ChlState_aen(21)',

    #   ChlState API to Customer for Field calibration
    #---------------------------
    'FieldCalibration_AccXLgChl_State_U8'      => 'rb_sfc_FieldCalibDataAndStatus_ast(6).SensorChlDataStatus_en_U8',
    'FieldCalibration_AccYLgChl_State_U8'      => 'rb_sfc_FieldCalibDataAndStatus_ast(7).SensorChlDataStatus_en_U8',
    'FieldCalibration_AccZLgChl_State_U8'      => 'rb_sfc_FieldCalibDataAndStatus_ast(8).SensorChlDataStatus_en_U8',
    'FieldCalibration_RollRateLfChl_State_U8'  => 'rb_sfc_FieldCalibDataAndStatus_ast(9).SensorChlDataStatus_en_U8',
    'FieldCalibration_PitchRateLfChl_State_U8' => 'rb_sfc_FieldCalibDataAndStatus_ast(10).SensorChlDataStatus_en_U8',
    'FieldCalibration_YawRateLfChl_State_U8'   => 'rb_sfc_FieldCalibDataAndStatus_ast(11).SensorChlDataStatus_en_U8',

    #   ChlState API to Customer for Field calibration
    #---------------------------
    'FieldCalibration_AccXLgChl_State_V'      => 'rb_sfc_FieldCalibDataAndStatus_ast(6).SensorChlDataStatus_en',
    'FieldCalibration_AccYLgChl_State_V'      => 'rb_sfc_FieldCalibDataAndStatus_ast(7).SensorChlDataStatus_en',
    'FieldCalibration_AccZLgChl_State_V'      => 'rb_sfc_FieldCalibDataAndStatus_ast(8).SensorChlDataStatus_en',
    'FieldCalibration_RollRateLfChl_State_V'  => 'rb_sfc_FieldCalibDataAndStatus_ast(9).SensorChlDataStatus_en',
    'FieldCalibration_PitchRateLfChl_State_V' => 'rb_sfc_FieldCalibDataAndStatus_ast(10).SensorChlDataStatus_en',
    'FieldCalibration_YawRateLfChl_State_V'   => 'rb_sfc_FieldCalibDataAndStatus_ast(11).SensorChlDataStatus_en',

    #Monitoring Phase :
    'NotMonitored_C'               => 0,
    'InitMonitored_C'              => 1,
    'CyclicBGMonitored_C'          => 2,
    'CyclicSteadyStateMonitored_C' => 3,

    'InitCheckFailureCnt' => 'rb_csim_InitCheckFailureCnt_au8(1)_U8',

    # enum;rb_csem_ChannelState_ten;rb_csem_ChlInitInProgress_e;0;
    # enum;rb_csem_ChannelState_ten;rb_csem_ChlNotConfigured_e;1;
    # enum;rb_csem_ChannelState_ten;rb_csem_ChlOk_e;2;
    # enum;rb_csem_ChannelState_ten;rb_csem_ChlTemporaryError_e;3;
    # enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorDueSensorErr_e;4;
    # enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorCyclThisPOC_e;5;
    # enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorCyclPrevPOC_e;6;
    # enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorDueExtReq_e;7;
    # enum;rb_csem_ChannelState_ten;rb_csem_ChlNotSupported_e;8;
    #
    # Internal customer fault status
    'ChlInitInProgress_C'        => 0,
    'ChlNotConfigured_C'         => 1,
    'ChlOk_C'                    => 2,
    'ChlTemporaryError_C'        => 3,
    'ChlPermErrorDueSensorErr_C' => 4,
    'ChlPermErrorCyclThisPOC_C'  => 5,
    'ChlPermErrorCyclPrevPOC_C'  => 6,
    'ChlPermErrorDueExtReq_C'    => 7,
    'ChlNotSupported_C'          => 8,

    # Mapping for customer fault status on CAN
    'ChlInitInProgressCAN_C'        => 0,
    'ChlNotConfiguredCAN_C'         => 1,
    'ChlOkCAN_C'                    => 2,
    'ChlTemporaryErrorCAN_C'        => 3,
    'ChlPermErrorDueSensorErrCAN_C' => 3,
    'ChlPermErrorCyclThisPOCCAN_C'  => 3,
    'ChlPermErrorCyclPrevPOCCAN_C'  => 3,
    'ChlPermErrorDueExtReqCAN_C'    => 3,
    'ChlNotSupportedCAN_C'          => 1,

    # Mapping for customer fault status signal name on CAN
    'HPS_LinearSignalStatus'      => 'HPS_CANFDLinearSignalStatus',
    'HPS_LateralSignalStatus'     => 'HPS_CANFDLateralSignalStatus',
    'HPS_HeaveSignalStatus'       => 'HPS_CANFDHeaveSignalStatus',
    'HPS_YawSignalStatus'         => 'HPS_CANFDYawSignalStatus',
    'HPS_RollSignalStatus'        => 'HPS_CANFDRollSignalStatus',
    'HPS_PitchSignalStatus'       => 'HPS_CANFDPitchSignalStatus',
    'HPS_TemperatureSignalStatus' => 'HPS_CANFDPitchSignalStatus',

    # Mapping for customer signal name on CAN
    'HPS_LinearSignalData'      => 'HPS_CANFDLinearSignalData',
    'HPS_LateralSignalData'     => 'HPS_CANFDLateralSignalData',
    'HPS_HeaveSignalData'       => 'HPS_CANFDHeaveSignalData',
    'HPS_YawSignalData'         => 'HPS_CANFDYawSignalData',
    'HPS_RollSignalData'        => 'HPS_CANFDRollSignalData',
    'HPS_PitchSignalData'       => 'HPS_CANFDPitchSignalData',
    'HPS_TemperatureSignalData' => 'HPS_CANFDPitchSignalData',

    # Mapping for customer VIN signal name on CAN
    'CAN_VIN_Signal' => 'GGCC_Id',

    # VDS CAN signal evaluation
    # 'AccThdValue_C' => 1.8536, #5000Lsb/g in CA project
    'AccThdInitAbsOffset_C' => 2.8536,    #3g, 5000Lsb/g in CA project

    'AccLgSfh_1' => 3997,                 #5000Lsb/g in CA project
    'AccLgSfh_2' => 2997,                 #5000Lsb/g in CA project
    'AccLgSfh_3' => 1997,                 #5000Lsb/g in CA project
    'AccLg_1'    => 0.9994,               #5000Lsb/g in CA project
    'AccLg_2'    => 0.7994,               #5000Lsb/g in CA project
    'AccLg_3'    => 0.5994,               #5000Lsb/g in CA project
    'AccLg_4'    => 0.3994,               #5000Lsb/g in CA project

    'AccThdValue1g_C'   => 0.9994,        #1g -> 5000Lsb/g in CA project
    'AccThdValue_C'     => 2.0006,        #2g -> 5000Lsb/g in CA project
    'AccThdValue2g_C'   => 2.0006,        #2g -> 5000Lsb/g in CA project
    'AccThdValue3g_C'   => 2.8536,        #3g -> 5000Lsb/g in CA project
    'AccThdValue4g_C'   => 3.8536,        #4g -> 5000Lsb/g in CA project
    'AccNegThdValue_C'  => -0.9994,       #5000Lsb/g in CA project
    'AccThdValue3_4g_C' => 3.2536,        #5000Lsb/g in CA project

    'XLg_AccThdValue1g_C'   => 0.8824,    #1g -> 5000Lsb/g in CA project
    'XLg_AccThdValue_C'     => 2.0006,    #2g -> 5000Lsb/g in CA project
    'XLg_AccThdValue2g_C'   => 1.8836,    #2g -> 5000Lsb/g in CA project
    'XLg_AccThdValue3g_C'   => 2.8536,    #3g -> 5000Lsb/g in CA project
    'XLg_AccThdValue4g_C'   => 3.8536,    #4g -> 5000Lsb/g in CA project
    'XLg_AccNegThdValue_C'  => -0.9994,   #5000Lsb/g in CA project
    'XLg_AccThdValue3_4g_C' => 3.2536,    #5000Lsb/g in CA project

    'YLg_AccThdValue1g_C'   => 0.8824,    #1g -> 5000Lsb/g in CA project
    'YLg_AccThdValue_C'     => 2.0006,    #2g -> 5000Lsb/g in CA project
    'YLg_AccThdValue2g_C'   => 1.8836,,   #2g -> 5000Lsb/g in CA project
    'YLg_AccThdValue3g_C'   => 2.8836,    #3g -> 5000Lsb/g in CA project
    'YLg_AccThdValue4g_C'   => 4.0006,    #4g -> 5000Lsb/g in CA project
    'YLg_AccNegThdValue_C'  => -0.9994,   #5000Lsb/g in CA project
    'YLg_AccThdValue3_4g_C' => 3.2536,    #5000Lsb/g in CA project

    'ZLg_AccThdValue1g_C'   => 0.8836,    #1g -> 5000Lsb/g in CA project
    'ZLg_AccThdValue_C'     => 2.0006,    #2g -> 5000Lsb/g in CA project
    'ZLg_AccThdValue2g_C'   => 1.8836,,   #2g -> 5000Lsb/g in CA project
    'ZLg_AccThdValue3g_C'   => 2.8536,    #3g -> 5000Lsb/g in CA project
    'ZLg_AccThdValue4g_C'   => 3.8536,    #4g -> 5000Lsb/g in CA project
    'ZLg_AccNegThdValue_C'  => -0.9994,   #5000Lsb/g in CA project
    'ZLg_AccThdValue3_4g_C' => 3.2836,    #5000Lsb/g in CA project

    'RateThdValue_C'          => 97.03,   #100grad/s in CA project
    'RateThdValue50gps_C'     => 49.03,   #100grad/s in CA project
    'RateThdValue100gps_C'    => 97.03,   #100grad/s in CA project
    'RateThdValue150gps_C'    => 150.03,  #100grad/s in CA project
    'RateThdValue200gps_C'    => 197.03,  #100grad/s in CA project
    'RateThdValue190gps_C'    => 187.03,  #100grad/s in CA project
    'RateThdValue160gps_C'    => 157.03,  #100grad/s in CA project
    'RateThdValue60gps_C'     => 56.97,   #100grad/s in CA project
    'RateThdValue_Clipping_C' => 300.03,  #100grad/s in CA project
    'RateThdValue300gps_C'    => 300.03,  #100grad/s in CA project

    'Yaw_RateThdValue_C'          => 100.03,      #100grad/s in CA projects
    'Yaw_RateThdValue50gps_C'     => 49.03,       #100grad/s in CA project
    'Yaw_RateThdValue100gps_C'    => 99.8800,,    #100grad/s in CA project
    'Yaw_RateThdValue150gps_C'    => 149.88,,     #100grad/s in CA project
    'Yaw_RateThdValue200gps_C'    => 197.03,      #100grad/s in CA project
    'Yaw_RateThdValue190gps_C'    => 187.03,      #100grad/s in CA project
    'Yaw_RateThdValue160gps_C'    => 157.03,      #100grad/s in CA project
    'Yaw_RateThdValue60gps_C'     => 56.97,       #100grad/s in CA project
    'Yaw_RateThdValue_Clipping_C' => 300.03,      #100grad/s in CA project
    'Yaw_RateThdValue300gps_C'    => 300.03,      #100grad/s in CA project

    'Roll_RateThdValue_C'          => 97.03,      #100grad/s in CA project
    'Roll_RateThdValue50gps_C'     => 46.97,      #100grad/s in CA project
    'Roll_RateThdValue100gps_C'    => 97.03,      #100grad/s in CA project
    'Roll_RateThdValue150gps_C'    => 147.03,     #100grad/s in CA project
    'Roll_RateThdValue200gps_C'    => 197.03,     #100grad/s in CA project
    'Roll_RateThdValue190gps_C'    => 187.03,     #100grad/s in CA project
    'Roll_RateThdValue160gps_C'    => 159.88,     #100grad/s in CA project
    'Roll_RateThdValue60gps_C'     => 56.97,      #100grad/s in CA project
    'Roll_RateThdValue_Clipping_C' => 300.03,     #100grad/s in CA project
    'Roll_RateThdValue300gps_C'    => 300.03,     #100grad/s in CA project

    'Pitch_RateThdValue_C'          => 97.03,     #100grad/s in CA project
    'Pitch_RateThdValue50gps_C'     => 49.97,     #100grad/s in CA project
    'Pitch_RateThdValue100gps_C'    => 97.03,     #100grad/s in CA project
    'Pitch_RateThdValue150gps_C'    => 147.03,    #100grad/s in CA project
    'Pitch_RateThdValue200gps_C'    => 197.03,    #100grad/s in CA project
    'Pitch_RateThdValue190gps_C'    => 187.03,    #100grad/s in CA project
    'Pitch_RateThdValue160gps_C'    => 157.03,    #100grad/s in CA project
    'Pitch_RateThdValue60gps_C'     => 59.82,     #100grad/s in CA project
    'Pitch_RateThdValue_Clipping_C' => 300.03,    #100grad/s in CA project
    'Pitch_RateThdValue300gps_C'    => 300.03,    #100grad/s in CA project

    'YawRateThdValue_Clipping_C'    => 300.03,    #100grad/s in CA project
    'YawRateThdValue_NegClipping_C' => -300.03,   #100grad/s in CA project

    'YawRateThdValue_SignalMon_Clipping_C'    => 100.03,     #100grad/s in CA project
    'YawRateThdValue_SignalMon_NegClipping_C' => -106.03,    #100grad/s in CA project

    'RateSfh_1' => 14997,                                    #100grad/s in CA project
    'RateSfh_2' => 19997,                                    #100grad/s in CA project
    'RateSfh_3' => 24997,                                    #100grad/s in CA project
    'Rate_1'    => 100.03,                                   #100grad/s in CA project
    'Rate_2'    => 149.97,                                   #100grad/s in CA project
    'Rate_3'    => 199.97,                                   #100grad/s in CA project
    'Rate_4'    => 249.97,                                   #100grad/s in CA project
    'Rate_C'    => 299.03,

## Time stamp reference to evaluate VDS signals on CAN##
    'TimeStampRef1_C' => -0.1,

## Threshold constant for reference
    'AccRefThd1g_C'      => 1,                               #1g -> 5000Lsb/g in CA project
    'AccRefThd1_4g_C'    => 1.4,                             #1g -> 5000Lsb/g in CA project
    'RateRefThd100gps_C' => 60,                              #1g -> 5000Lsb/g in CA project
    'RateRefThd50gps_C'  => 80,                              #1g -> 5000Lsb/g in CA project

    'YLg_AccRefThd1g_C'      => 1,                           #1g -> 5000Lsb/g in CA project
    'YLg_AccRefThd1_4g_C'    => 1.4,                         #1g -> 5000Lsb/g in CA project
    'Yaw_RateRefThd100gps_C' => 60,                          #1g -> 5000Lsb/g in CA project
    'Yaw_RateRefThd50gps_C'  => 80,                          #1g -> 5000Lsb/g in CA project

    'Roll_RateRefThd100gps_C' => 60,                         #1g -> 500Lsb/g in CA project
    'Roll_RateRefThd50gps_C'  => 80,                         #1g -> 500Lsb/g in CA project

    'Pitch_RateRefThd100gps_C' => 60,                        #1g -> 500Lsb/g in CA project
    'Pitch_RateRefThd50gps_C'  => 80,                        #1g -> 500Lsb/g in CA project

##NhtsaData for rb_csem_SensorDataRT_st.ChannelValue_as16
    'Nhtsadata_Rate30000_C'    => 30000,
    'Nhtsadata_RateNeg30000_C' => -30000,
    'Nhtsadata_Rate10300_C'    => 10000,                     #(Value- Fieldcalib_offset_for_RateChannels) and if Field calibartion is not applicable then Channel value is same as Manipulated value
    'Nhtsadata_RateNeg10300_C' => -10600,                    #(Value- Fieldcalib_offset_for_RateChannels) and if Field calibartion is not applicable then Channel value is same as Manipulated value

    'Nhtsadata_Acc25000_C'    => 25000,
    'Nhtsadata_AccNeg25000_C' => -25000,

    'AccXLgChl_NHTSA_Data_2g_C'       => 10000,
    'AccXLgChl_NHTSA_Data_6_4g_C'     => 32000,
    'AccXLgChl_NHTSA_Data_Neg_2g_C'   => -10000,
    'AccXLgChl_NHTSA_Data_Neg_6_4g_C' => -32000,

    'AccYLgChl_NHTSA_Data_2g_C'       => 10000,
    'AccYLgChl_NHTSA_Data_6_4g_C'     => 32000,
    'AccYLgChl_NHTSA_Data_Neg_2g_C'   => -10000,
    'AccYLgChl_NHTSA_Data_Neg_6_4g_C' => -32000,

    'AccZLgChl_NHTSA_Data_2g_C'       => 10000,
    'AccZLgChl_NHTSA_Data_6_4g_C'     => 32000,
    'AccZLgChl_NHTSA_Data_Neg_2g_C'   => -10000,
    'AccZLgChl_NHTSA_Data_Neg_6_4g_C' => -32000,

    'YawRateLfChl_NHTSA_Data_2g_C'       => 10000,
    'YawRateLfChl_NHTSA_Data_6_4g_C'     => 32000,
    'YawRateLfChl_NHTSA_Data_Neg_2g_C'   => -10000,
    'YawRateLfChl_NHTSA_Data_Neg_6_4g_C' => -32000,

    'RollRateLfChl_NHTSA_Data_2g_C'       => 10000,
    'RollRateLfChl_NHTSA_Data_6_4g_C'     => 32000,
    'RollRateLfChl_NHTSA_Data_Neg_2g_C'   => -10000,
    'RollRateLfChl_NHTSA_Data_Neg_6_4g_C' => -32000,

    'PitchRateLfChl_NHTSA_Data_2g_C'       => 10000,
    'PitchRateLfChl_NHTSA_Data_6_4g_C'     => 32000,
    'PitchRateLfChl_NHTSA_Data_Neg_2g_C'   => -10000,
    'PitchRateLfChl_NHTSA_Data_Neg_6_4g_C' => -32000,

    'TemperatureChl_NHTSA_Data_2g_C'       => 10000,
    'TemperatureChl_NHTSA_Data_6_4g_C'     => 32000,
    'TemperatureChl_NHTSA_Data_Neg_2g_C'   => -10000,
    'TemperatureChl_NHTSA_Data_Neg_6_4g_C' => -32000,

##Threshold Values During Sensor Initialization
    'LinearSignal_Zero_Thd_C'   => 0,
    'LateralSignal_Zero_Thd_C'  => 0,
    'VerticalSignal_Zero_Thd_C' => 0,    #in CA ZLg will have -1g as default thd
    'YawSignal_Zero_Thd_C'      => 0,
    'RollSignal_Zero_Thd_C'     => 0,
    'PitchSignal_Zero_Thd_C'    => 0,

##################
    # enum;rb_sfh_FilterChlList_ten;rb_sfh_AccXLg15HzCS_e;0;
    # enum;rb_sfh_FilterChlList_ten;rb_sfh_AccYLg15HzCS_e;1;
    # enum;rb_sfh_FilterChlList_ten;rb_sfh_AccZLg15HzCS_e;2;
    # enum;rb_sfh_FilterChlList_ten;rb_sfh_RollRate15HzCS_e;3;
    # enum;rb_sfh_FilterChlList_ten;rb_sfh_PitchRate15HzCS_e;4;
    # enum;rb_sfh_FilterChlList_ten;rb_sfh_YawRate15HzCS_e;5;
    #
    #   ChlState API to Customer CAN interface
    #-----------------------------------------
    'AccXLgChl_State_sfh_U8'      => 'rb_sfh_SensChlState_aen(6)_U8',
    'AccYLgChl_State_sfh_U8'      => 'rb_sfh_SensChlState_aen(7)_U8',
    'AccZLgChl_State_sfh_U8'      => 'rb_sfh_SensChlState_aen(8)_U8',
    'RollRateLfChl_State_sfh_U8'  => 'rb_sfh_SensChlState_aen(9)_U8',
    'PitchRateLfChl_State_sfh_U8' => 'rb_sfh_SensChlState_aen(10)_U8',
    'YawRateLfChl_State_sfh_U8'   => 'rb_sfh_SensChlState_aen(11)_U8',

    ##RollingCounter
    'Sensor_RollingCounter_sfh_U8' => 'rb_sfh_RollingCounter_u8_U8',

    'AccXLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(6)_S16',
    'AccYLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(7)_S16',
    'AccZLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(8)_S16',
    'RollRateLfChl_OutputBuffer_sfh_S16'  => 'rb_sfh_OutputBuffer_s16(9)_S16',
    'PitchRateLfChl_OutputBuffer_sfh_S16' => 'rb_sfh_OutputBuffer_s16(10)_S16',
    'YawRateLfChl_OutputBuffer_sfh_S16'   => 'rb_sfh_OutputBuffer_s16(11)_S16',

    'rb_csim_SamplingCounterRT_S16' => 'rb_csim_SamplingCounterRT_u16_U16',

    #******************************************************************************
    #                          Sensor channels
    #******************************************************************************
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccXLg_e;0;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccXHgMon_e;1;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccYLg_e;2;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccYHgMon_e;3;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccZLg_e;4;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1AccZHgMon_e;5;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1RollRateLf_e;6;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1YawRateLf_e;7;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1PitchRateLf_e;8;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1Temperature_e;9;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu1FrequencyCounter_e;10;

    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccXLg_e;11;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccXHgMon_e;12;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccYLg_e;13;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccYHgMon_e;14;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccZLg_e;15;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2AccZHgMon_e;16;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2RollRateLf_e;17;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2YawRateLf_e;18;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2PitchRateLf_e;19;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2Temperature_e;20;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_Imu2FrequencyCounter_e;21;
    #
    #   RawData_U16
    #--------------
    'AccXLgChl_RawData_S16'        => 'rb_csic_RtComRxPayload_au16(11)_S16',
    'AccYLgChl_RawData_S16'        => 'rb_csic_RtComRxPayload_au16(13)_S16',
    'AccZLgChl_RawData_S16'        => 'rb_csic_RtComRxPayload_au16(15)_S16',
    'RollRateLfChl_RawData_S16'    => 'rb_csic_RtComRxPayload_au16(17)_S16',
    'YawRateLfChl_RawData_S16'     => 'rb_csic_RtComRxPayload_au16(18)_S16',
    'PitchRateLfChl_RawData_S16'   => 'rb_csic_RtComRxPayload_au16(19)_S16',
    'TemperatureChl_RawData_S16'   => 'rb_csic_RtComRxPayload_au16(20)_S16',
    'FrequencyCounter_RawData_S16' => 'rb_csic_RtComRxPayload_au16(21)_S16',
    #
    #	RawData_V
    #------------
    'AccXLgChl_RawData_V'        => 'rb_csic_RtComRxPayload_au16(11)',
    'AccYLgChl_RawData_V'        => 'rb_csic_RtComRxPayload_au16(13)',
    'AccZLgChl_RawData_V'        => 'rb_csic_RtComRxPayload_au16(15)',
    'RollRateLfChl_RawData_V'    => 'rb_csic_RtComRxPayload_au16(17)',
    'YawRateLfChl_RawData_V'     => 'rb_csic_RtComRxPayload_au16(18)',
    'PitchRateLfChl_RawData_V'   => 'rb_csic_RtComRxPayload_au16(19)',
    'TemperatureChl_RawData_V'   => 'rb_csic_RtComRxPayload_au16(20)',
    'FrequencyCounter_RawData_V' => 'rb_csic_RtComRxPayload_au16(21)',

    #	 Processed data for Algo
    #---------------------------
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_MainAccX_e;0;SMA_ax_highG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_MainAccY_e;1;SMA_ay_highG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_MainAccZ_e;2;SMA_az_midG

    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXLg_e;3;IMU_ax_lowG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXHgMon_e;4;IMU_ax_midG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYLg_e;5;IMU_ay_lowG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYHgMon_e;6;IMU_ay_midG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZLg_e;7;IMU_az_lowG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZHgMon_e;8;IMU_az_midG
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_RollRateLf_e;9;IMU_rateX
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_YawRateLf_e;10;IMU_rateZ
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_PitchRateLf_e;11;IMU_rateY
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu1Temperature_e;12;IMU_Temperature
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu1FrequencyCounter_e;13;IMU_SPI_FREQ_CNT

    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXLgPlausi_e;14;IMU_ax_lowG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXHgMonPlausi_e;15;IMU_ax_midG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYLgPlausi_e;16;IMU_ay_lowG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYHgMonPlausi_e;17;IMU_ay_midG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZLgPlausi_e;18;IMU_az_lowG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZHgMonPlausi_e;19;IMU_az_midG_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_RollRateLfPlausi_e;20;IMU_rateX_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_YawRateLfPlausi_e;21;IMU_rateZ_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_PitchRateLfPlausi_e;22;IMU_rateY_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu2Temperature_e;23;IMU_Temperature_HPS
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu2FrequencyCounter_e;24;IMU_SPI_FREQ_CNT_HPS
    #
    'AccXLgChl_NhtsaData_S16'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(14)_S16',
    'AccYLgChl_NhtsaData_S16'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(16)_S16',
    'AccZLgChl_NhtsaData_S16'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(18)_S16',
    'RollRateLfChl_NhtsaData_S16'    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(20)_S16',
    'YawRateLfChl_NhtsaData_S16'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(21)_S16',
    'PitchRateLfChl_NhtsaData_S16'   => 'rb_csem_SensorDataRT_st.ChannelValue_as16(22)_S16',
    'TemperatureChl_NhtsaData_S16'   => 'rb_csem_SensorDataRT_st.ChannelValue_as16(23)_S16',
    'FrequencyCounter_NhtsaData_S16' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(24)_S16',

    'AccXLgChl_NhtsaData_V'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(14)',
    'AccYLgChl_NhtsaData_V'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(16)',
    'AccZLgChl_NhtsaData_V'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(18)',
    'RollRateLfChl_NhtsaData_V'    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(20)',
    'YawRateLfChl_NhtsaData_V'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(21)',
    'PitchRateLfChl_NhtsaData_V'   => 'rb_csem_SensorDataRT_st.ChannelValue_as16(22)',
    'TemperatureChl_NhtsaData_V'   => 'rb_csem_SensorDataRT_st.ChannelValue_as16(23)',
    'FrequencyCounter_NhtsaData_V' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(24)',

############################################################################################################################################################

##Time Stamp status
    #SMU300 F1
    'IMU2_AccXLgChl_TimeStampStatus_U8'        => 'rb_sth_SensorDataAge_ast(6).TimeStatus_en_U8',
    'IMU2_AccYLgChl_TimeStampStatus_U8'        => 'rb_sth_SensorDataAge_ast(7).TimeStatus_en_U8',
    'IMU2_AccZLgChl_TimeStampStatus_U8'        => 'rb_sth_SensorDataAge_ast(8).TimeStatus_en_U8',
    'IMU2_RollRateLfChl_TimeStampStatus_U8'    => 'rb_sth_SensorDataAge_ast(9).TimeStatus_en_U8',
    'IMU2_PitchRateLfChl_TimeStampStatus_U8'   => 'rb_sth_SensorDataAge_ast(10).TimeStatus_en_U8',
    'IMU2_YawRateLfChl_TimeStampStatus_U8'     => 'rb_sth_SensorDataAge_ast(11).TimeStatus_en_U8',
    'IMU2_FrequencyCounter_TimeStampStatus_U8' => 'rb_sth_SensorDataAge_ast(12).TimeStatus_en_U8',

    'IMU2_AccXLgChl_TimeStampStatus'        => 'rb_sth_SensorDataAge_ast(6).TimeStatus_en',
    'IMU2_AccYLgChl_TimeStampStatus'        => 'rb_sth_SensorDataAge_ast(7).TimeStatus_en',
    'IMU2_AccZLgChl_TimeStampStatus'        => 'rb_sth_SensorDataAge_ast(8).TimeStatus_en',
    'IMU2_RollRateLfChl_TimeStampStatus'    => 'rb_sth_SensorDataAge_ast(9).TimeStatus_en',
    'IMU2_PitchRateLfChl_TimeStampStatus'   => 'rb_sth_SensorDataAge_ast(10).TimeStatus_en',
    'IMU2_YawRateLfChl_TimeStampStatus'     => 'rb_sth_SensorDataAge_ast(11).TimeStatus_en',
    'IMU2_FrequencyCounter_TimeStampStatus' => 'rb_sth_SensorDataAge_ast(12).TimeStatus_en',

    #**************************************************************************************************
##Output buffer
    #SMU300 F1
    'AccXLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(6)_S16',
    'AccYLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(7)_S16',
    'AccZLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(8)_S16',
    'RollRateLfChl_OutputBuffer_sfh_S16'  => 'rb_sfh_OutputBuffer_s16(9)_S16',
    'PitchRateLfChl_OutputBuffer_sfh_S16' => 'rb_sfh_OutputBuffer_s16(10)_S16',
    'YawRateLfChl_OutputBuffer_sfh_S16'   => 'rb_sfh_OutputBuffer_s16(11)_S16',

    'AccXLgChl_OutputBuffer_sfh'      => 'rb_sfh_OutputBuffer_s16(6)',
    'AccYLgChl_OutputBuffer_sfh'      => 'rb_sfh_OutputBuffer_s16(7)',
    'AccZLgChl_OutputBuffer_sfh'      => 'rb_sfh_OutputBuffer_s16(8)',
    'RollRateLfChl_OutputBuffer_sfh'  => 'rb_sfh_OutputBuffer_s16(9)',
    'PitchRateLfChl_OutputBuffer_sfh' => 'rb_sfh_OutputBuffer_s16(10)',
    'YawRateLfChl_OutputBuffer_sfh'   => 'rb_sfh_OutputBuffer_s16(11)',

    #******************************************************************************
    #                                Sensor data
    #******************************************************************************
    # enum;rb_csem_ImuSensors_ten;rb_csem_InertialSensor1_e;0;First inertial sensor
    # enum;rb_csem_ImuSensors_ten;rb_csem_InertialSensor2_e;1;Second inertial sensor
    # enum;rb_csem_ImuSensors_ten;rb_csem_ImuSensorMax_e;2;Max Value (number of all SMI sensors)
    #
    #    ClusterFlags
    #----------------
    'InertialSensor1_ClusterFlags_U16' => 'rb_csic_StatusData_ast(0).ClustFlg_u16_U16',
    'InertialSensor2_ClusterFlags_U16' => 'rb_csic_StatusData_ast(1).ClustFlg_u16_U16',

    #    ErrorFlags
    #--------------
    'InertialSensor1_ErrorFlag0_U8' => 'rb_csic_StatusData_ast(0).ErFlg_au16(0)_U8',
    'InertialSensor1_ErrorFlag1_U8' => 'rb_csic_StatusData_ast(0).ErFlg_au16(1)_U8',
    'InertialSensor1_ErrorFlag2_U8' => 'rb_csic_StatusData_ast(0).ErFlg_au16(2)_U8',
    'InertialSensor2_ErrorFlag0_U8' => 'rb_csic_StatusData_ast(1).ErFlg_au16(0)_U8',
    'InertialSensor2_ErrorFlag1_U8' => 'rb_csic_StatusData_ast(1).ErFlg_au16(1)_U8',
    'InertialSensor2_ErrorFlag2_U8' => 'rb_csic_StatusData_ast(1).ErFlg_au16(2)_U8',

    # U16 - Error Flags #Updated for DSP_PE_RAM implementation
    'InertialSensor1_ErrorFlag0_U16' => 'rb_csic_StatusData_ast(0).ErFlg_au16(0)_U16',
    'InertialSensor1_ErrorFlag1_U16' => 'rb_csic_StatusData_ast(0).ErFlg_au16(1)_U16',
    'InertialSensor1_ErrorFlag2_U16' => 'rb_csic_StatusData_ast(0).ErFlg_au16(2)_U16',
    'InertialSensor1_ErrorFlag3_U16' => 'rb_csic_StatusData_ast(0).ErFlg_au16(3)_U16',
    'InertialSensor1_ErrorFlag4_U16' => 'rb_csic_StatusData_ast(0).ErFlg_au16(4)_U16',
    'InertialSensor1_ErrorFlag5_U16' => 'rb_csic_StatusData_ast(0).ErFlg_au16(5)_U16',
    'InertialSensor1_ErrorFlag6_U16' => 'rb_csic_StatusData_ast(0).ErFlg_au16(6)_U16',
    'InertialSensor1_ErrorFlag7_U16' => 'rb_csic_StatusData_ast(0).ErFlg_au16(7)_U16',
    'InertialSensor1_ErrorFlag8_U16' => 'rb_csic_StatusData_ast(0).ErFlg_au16(8)_U16',
    'InertialSensor1_ErrorFlag9_U16' => 'rb_csic_StatusData_ast(0).ErFlg_au16(9)_U16',

    'InertialSensor2_ErrorFlag0_U16' => 'rb_csic_StatusData_ast(1).ErFlg_au16(0)_U16',
    'InertialSensor2_ErrorFlag1_U16' => 'rb_csic_StatusData_ast(1).ErFlg_au16(1)_U16',
    'InertialSensor2_ErrorFlag2_U16' => 'rb_csic_StatusData_ast(1).ErFlg_au16(2)_U16',
    'InertialSensor2_ErrorFlag3_U16' => 'rb_csic_StatusData_ast(1).ErFlg_au16(3)_U16',
    'InertialSensor2_ErrorFlag4_U16' => 'rb_csic_StatusData_ast(1).ErFlg_au16(4)_U16',
    'InertialSensor2_ErrorFlag5_U16' => 'rb_csic_StatusData_ast(1).ErFlg_au16(5)_U16',
    'InertialSensor2_ErrorFlag6_U16' => 'rb_csic_StatusData_ast(1).ErFlg_au16(6)_U16',
    'InertialSensor2_ErrorFlag7_U16' => 'rb_csic_StatusData_ast(1).ErFlg_au16(7)_U16',
    'InertialSensor2_ErrorFlag8_U16' => 'rb_csic_StatusData_ast(1).ErFlg_au16(8)_U16',
    'InertialSensor2_ErrorFlag9_U16' => 'rb_csic_StatusData_ast(1).ErFlg_au16(9)_U16',

    #	 Temperature_1
    #---------------
    'InertialSensor1_Temp1_U8'  => 'rb_csic_StatusData_ast(0).Temperature_s16_U8',
    'InertialSensor2_Temp1_U8'  => 'rb_csic_StatusData_ast(1).Temperature_s16_U8',
    'InertialSensor1_Temp1_S16' => 'rb_csic_StatusData_ast(0).Temperature_s16_S16',
    'InertialSensor2_Temp1_S16' => 'rb_csic_StatusData_ast(1).Temperature_s16_S16',

    #	 ClusterFlags stored in Field Claim Data area
    #------------------------------------------------
    'InertialSensor2_ClusterFlags_EE_U8' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ClustFlg_u16_U8',

    #	 ErrorFlags stored in Field Claim Data area
    #----------------------------------------------
    'InertialSensor2_ErrorFlag0_EE_U8' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(0)_U8',
    'InertialSensor2_ErrorFlag9_EE_U8' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(9)_U8',

    #	 Temperature stored in Field Claim Data area
    #-----------------------------------------------

    'InertialSensor2_Temp1_EE_U8' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).Temperature_s16_S16',

    #	AsicSerialNr
    #---------------
    'InertialSensor2_AsicSerialNr0_V' => 'rb_csim_AsicIdData_ast(1).AsicSerialNr_au16(0)',
    'InertialSensor2_AsicSerialNr1_V' => 'rb_csim_AsicIdData_ast(1).AsicSerialNr_au16(1)',
    'InertialSensor2_AsicSerialNr2_V' => 'rb_csim_AsicIdData_ast(1).AsicSerialNr_au16(2)',

    #	SmiSerialNr
    #--------------
    'InertialSensor2_SmiSerialNr0_V' => 'rb_csim_AsicIdData_ast(1).SmiSerialNr_au16(0)',
    'InertialSensor2_SmiSerialNr1_V' => 'rb_csim_AsicIdData_ast(1).SmiSerialNr_au16(1)',
    'InertialSensor2_SmiSerialNr2_V' => 'rb_csim_AsicIdData_ast(1).SmiSerialNr_au16(2)',

    #	FieldClaimDataEe ClusterFlags
    #--------------------------------
    'InertialSensor2_ClusterFlags_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ClustFlg_u16',

    #	FieldClaimDataEe Temperature
    #-------------------------------
    'InertialSensor2_Temperature_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).Temperature_s16',

    #	FieldClaimDataEe ErrorFlags
    #------------------------------
    'InertialSensor2_ErrorFlag0_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(0)',
    'InertialSensor2_ErrorFlag1_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(1)',
    'InertialSensor2_ErrorFlag2_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(2)',
    'InertialSensor2_ErrorFlag3_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(3)',
    'InertialSensor2_ErrorFlag4_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(4)',
    'InertialSensor2_ErrorFlag5_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(5)',
    'InertialSensor2_ErrorFlag6_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(6)',
    'InertialSensor2_ErrorFlag7_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(7)',
    'InertialSensor2_ErrorFlag8_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(8)',
    'InertialSensor2_ErrorFlag9_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(9)',

    #	 ErrorFlags stored in Field Claim Data area
    #----------------------------------------------
    'ClusterFlags_EE_C' => '0x8421',
    'ErrorFlag_EE_C'    => '0x8421',
    'Temperature_EE_C'  => '0x8421',

    #	FieldClaimDataEe_st buffer for all error banks
    #------------------------------
    'InertialSensor2_ErrorBank0_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(0)',    #Address1
    'InertialSensor2_ErrorBank1_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(1)',    #Address2
    'InertialSensor2_ErrorBank2_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(2)',    #Address3
    'InertialSensor2_ErrorBank3_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(3)',    #Address4
    'InertialSensor2_ErrorBank4_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(4)',    #Address5
    'InertialSensor2_ErrorBank5_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(5)',    #Address6
    'InertialSensor2_ErrorBank6_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(6)',    #Address7
    'InertialSensor2_ErrorBank7_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(7)',    #Address8
    'InertialSensor2_ErrorBank8_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(8)',    #Address9
    'InertialSensor2_ErrorBank9_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(9)',    #Address0A

    #	DeviceId
    #-----------
    # enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsSystemAsic1_e;0;Master System ASIC
    # enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsSystemAsic2_e;1;2nd System ASIC
    # enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorMain_e;2;Main HighG Sensor
    # enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralInertialSensor1_e;3;First Inertial Sensor
    # enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralInertialSensor2_e;4;Second Inertial Sensor
    # enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralInertialSensor3_e;5;Third Inertial Sensor

    'InertialSensor2_DeviceId_V' => 'rb_syca_AsicDeviceId_au16(4)',
    #
    #	RevisionId
    #-------------

    'InertialSensor2_RevisionId_V' => 'rb_syca_AsicRevisionId_au16(4)',

    #    ErrorCounter 																								(removed from *.cns file ??)
    #----------------
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1IntErrCnt45_e;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2IntErrCnt45_e;
    #
    'InertialSensor2_IntErrCnt_comb0_U16' => 'rb_csic_RtComRxPayload_au16(35)_U16',
    'InertialSensor2_IntErrCnt_comb1_U16' => 'rb_csic_RtComRxPayload_au16(36)_U16',
    'InertialSensor2_IntErrCnt_comb2_U16' => 'rb_csic_RtComRxPayload_au16(37)_U16',
    'InertialSensor2_IntErrCnt_comb3_U16' => 'rb_csic_RtComRxPayload_au16(38)_U16',
    'InertialSensor2_IntErrCnt_comb4_U16' => 'rb_csic_RtComRxPayload_au16(39)_U16',

    #    Status ClusterFlags
    #-----------------------
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1StatusClusFlags_e;20;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2StatusClusFlags_e;21;
    #
    'InertialSensor2_Status_ClusterFlags_U8' => 'rb_csic_RtComRxPayload_au16(23)_U8',

    #    Status HW SCON_U8
    #------------------
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1StatusHwScon_e;22;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1StatusHwScon6DExt_e;23;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2StatusHwScon_e;24;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2StatusHwScon6DExt_e;25;
    #
    'InertialSensor2_Status_HW_SCON_U8' => 'rb_csic_RtComRxPayload_au16(24)',

    #    Status HW SCON_U16
    #------------------
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1StatusHwScon_e;22;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1StatusHwScon6DExt_e;23;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2StatusHwScon_e;24;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2StatusHwScon6DExt_e;25;
    #
    'InertialSensor2_Status_HW_SCON_U16'        => 'rb_csic_RtComRxPayload_au16(26)_U16',
    'InertialSensor2_Status_6D_EXT_HW_SCON_U16' => 'rb_csic_RtComRxPayload_au16(27)_U16',

    # Value of HW SCON_U8
    'HwSconStatusOK_C'      => 0,
    'HwSconStatusTempFlt_C' => 1,
    'HwSconStatusPermFlt_C' => 2,
    'HwSconStatusBITE_C'    => 3,

    #	RAM Copy of InitErrorData Flags
    'InertialSensor2_RAM_Copy_InitErrorData_ClusterFlags' => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ClusterFlags_u16',
    'InertialSensor2_RAM_Copy_InitErrorData_ErrorFlags0'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ErrorFlags_au16(0)',
    'InertialSensor2_RAM_Copy_InitErrorData_ErrorFlags1'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ErrorFlags_au16(1)',
    'InertialSensor2_RAM_Copy_InitErrorData_ErrorFlags2'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ErrorFlags_au16(2)',
    'InertialSensor2_RAM_Copy_InitErrorData_ErrorFlags3'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ErrorFlags_au16(3)',
    'InertialSensor2_RAM_Copy_InitErrorData_ErrorFlags4'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ErrorFlags_au16(4)',
    'InertialSensor2_RAM_Copy_InitErrorData_ErrorFlags5'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ErrorFlags_au16(5)',
    'InertialSensor2_RAM_Copy_InitErrorData_ErrorFlags6'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ErrorFlags_au16(6)',
    'InertialSensor2_RAM_Copy_InitErrorData_ErrorFlags7'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ErrorFlags_au16(7)',
    'InertialSensor2_RAM_Copy_InitErrorData_ErrorFlags8'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ErrorFlags_au16(8)',
    'InertialSensor2_RAM_Copy_InitErrorData_ErrorFlags9'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(1).ErrorFlags_au16(9)',

    #	NVM Copy of InitErrorData Flags
    'InertialSensor2_NVM_Copy_InitErrorData_ClusterFlags' => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ClusterFlags_u16',
    'InertialSensor2_NVM_Copy_InitErrorData_ErrorFlags0'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(0)',
    'InertialSensor2_NVM_Copy_InitErrorData_ErrorFlags1'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(1)',
    'InertialSensor2_NVM_Copy_InitErrorData_ErrorFlags2'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(2)',
    'InertialSensor2_NVM_Copy_InitErrorData_ErrorFlags3'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(3)',
    'InertialSensor2_NVM_Copy_InitErrorData_ErrorFlags4'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(4)',
    'InertialSensor2_NVM_Copy_InitErrorData_ErrorFlags5'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(5)',
    'InertialSensor2_NVM_Copy_InitErrorData_ErrorFlags6'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(6)',
    'InertialSensor2_NVM_Copy_InitErrorData_ErrorFlags7'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(7)',
    'InertialSensor2_NVM_Copy_InitErrorData_ErrorFlags8'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(8)',
    'InertialSensor2_NVM_Copy_InitErrorData_ErrorFlags9'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(9)',

    #	Temporary Copy of InitErrorData Flags
    'InertialSensor2_Temp_Copy_InitErrorData_ClusterFlags' => 'rb_csic_InitErrorData_ast(1).ClusterFlags_u16',
    'InertialSensor2_Temp_Copy_InitErrorData_ErrorFlags0'  => 'rb_csic_InitErrorData_ast(1).ErrorFlags_au16(0)',
    'InertialSensor2_Temp_Copy_InitErrorData_ErrorFlags1'  => 'rb_csic_InitErrorData_ast(1).ErrorFlags_au16(1)',
    'InertialSensor2_Temp_Copy_InitErrorData_ErrorFlags2'  => 'rb_csic_InitErrorData_ast(1).ErrorFlags_au16(2)',
    'InertialSensor2_Temp_Copy_InitErrorData_ErrorFlags3'  => 'rb_csic_InitErrorData_ast(1).ErrorFlags_au16(3)',
    'InertialSensor2_Temp_Copy_InitErrorData_ErrorFlags4'  => 'rb_csic_InitErrorData_ast(1).ErrorFlags_au16(4)',
    'InertialSensor2_Temp_Copy_InitErrorData_ErrorFlags5'  => 'rb_csic_InitErrorData_ast(1).ErrorFlags_au16(5)',
    'InertialSensor2_Temp_Copy_InitErrorData_ErrorFlags6'  => 'rb_csic_InitErrorData_ast(1).ErrorFlags_au16(6)',
    'InertialSensor2_Temp_Copy_InitErrorData_ErrorFlags7'  => 'rb_csic_InitErrorData_ast(1).ErrorFlags_au16(7)',
    'InertialSensor2_Temp_Copy_InitErrorData_ErrorFlags8'  => 'rb_csic_InitErrorData_ast(1).ErrorFlags_au16(8)',
    'InertialSensor2_Temp_Copy_InitErrorData_ErrorFlags9'  => 'rb_csic_InitErrorData_ast(1).ErrorFlags_au16(9)',

    # Device IDs
    #------------
    'InertialSensor1_DeviceId_C' => '0x0970',    #SMI970
    'InertialSensor2_DeviceId_C' => '0x0971',    #SMU300

    # manipulated RevisionId, SmiSerialNr, AsicSerialNr will be checked against this constants
    # (not checked by software)
    'RevisionId_C'    => '0x1111',
    'SmiSerialNr0_C'  => '0x0011',
    'SmiSerialNr1_C'  => '0x1100',
    'SmiSerialNr2_C'  => '0bxxxx000100010001',
    'AsicSerialNr0_C' => '0x0011',
    'AsicSerialNr1_C' => '0x1100',
    'AsicSerialNr2_C' => '0x0111',

###  Plant Calibration
    # SMI970 F1
    'Imu2_PlantCalibCorrectedData_AccXLgChl_S16'      => 'rb_sdcm_PlantCalibCorrData_aast(1)(0).ChlData_s16_S16',
    'Imu2_PlantCalibCorrectedData_AccYLgChl_S16'      => 'rb_sdcm_PlantCalibCorrData_aast(1)(1).ChlData_s16_S16',
    'Imu2_PlantCalibCorrectedData_AccZLgChl_S16'      => 'rb_sdcm_PlantCalibCorrData_aast(1)(2).ChlData_s16_S16',
    'Imu2_PlantCalibCorrectedData_RollRateLfChl_S16'  => 'rb_sdcm_PlantCalibCorrData_aast(1)(3).ChlData_s16_S16',
    'Imu2_PlantCalibCorrectedData_PitchRateLfChl_S16' => 'rb_sdcm_PlantCalibCorrData_aast(1)(4).ChlData_s16_S16',
    'Imu2_PlantCalibCorrectedData_YawRateLfChl_S16'   => 'rb_sdcm_PlantCalibCorrData_aast(1)(5).ChlData_s16_S16',

    'Imu2_PlantCalibCorrectedData_AccXLgChl'      => 'rb_sdcm_PlantCalibCorrData_aast(1)(0).ChlData_s16',
    'Imu2_PlantCalibCorrectedData_AccYLgChl'      => 'rb_sdcm_PlantCalibCorrData_aast(1)(1).ChlData_s16',
    'Imu2_PlantCalibCorrectedData_AccZLgChl'      => 'rb_sdcm_PlantCalibCorrData_aast(1)(2).ChlData_s16',
    'Imu2_PlantCalibCorrectedData_RollRateLfChl'  => 'rb_sdcm_PlantCalibCorrData_aast(1)(3).ChlData_s16',
    'Imu2_PlantCalibCorrectedData_PitchRateLfChl' => 'rb_sdcm_PlantCalibCorrData_aast(1)(4).ChlData_s16',
    'Imu2_PlantCalibCorrectedData_YawRateLfChl'   => 'rb_sdcm_PlantCalibCorrData_aast(1)(5).ChlData_s16',

    # SMI970 F1
    'Imu2_PlantCalibCorrectedData_AccXLgChl_V'      => 'rb_sdcm_PlantCalibCorrData_aast(1)(0).ChlData_s16_S16',
    'Imu2_PlantCalibCorrectedData_AccYLgChl_V'      => 'rb_sdcm_PlantCalibCorrData_aast(1)(1).ChlData_s16_S16',
    'Imu2_PlantCalibCorrectedData_AccZLgChl_V'      => 'rb_sdcm_PlantCalibCorrData_aast(1)(2).ChlData_s16_S16',
    'Imu2_PlantCalibCorrectedData_RollRateLfChl_V'  => 'rb_sdcm_PlantCalibCorrData_aast(1)(3).ChlData_s16_S16',
    'Imu2_PlantCalibCorrectedData_PitchRateLfChl_V' => 'rb_sdcm_PlantCalibCorrData_aast(1)(4).ChlData_s16_S16',
    'Imu2_PlantCalibCorrectedData_YawRateLfChl_V'   => 'rb_sdcm_PlantCalibCorrData_aast(1)(5).ChlData_s16_S16',

    # Plant calibration status
    #SMI970
    'Imu2_PlantCalibCorrectedData_ChlStatus_AccXLgChl_U8' => 'rb_sdcm_PlantCalibCorrData_aast(1)(0).ChlStatus_en_U8',
    'Imu2_PlantCalibCorrectedData_ChlStatus_AccYLgChl_U8' => 'rb_sdcm_PlantCalibCorrData_aast(1)(1).ChlStatus_en_U8',
    'Imu2_PlantCalibCorrectedData_ChlStatus_AccZLgChl_U8' => 'rb_sdcm_PlantCalibCorrData_aast(1)(2).ChlStatus_en_U8',
    'Imu2_PlantCalibCorrectedData_ChlStatus_RollRate_U8'  => 'rb_sdcm_PlantCalibCorrData_aast(1)(3).ChlStatus_en_U8',
    'Imu2_PlantCalibCorrectedData_ChlStatus_PitchRate_U8' => 'rb_sdcm_PlantCalibCorrData_aast(1)(4).ChlStatus_en_U8',
    'Imu2_PlantCalibCorrectedData_ChlStatus_YawRate_U8'   => 'rb_sdcm_PlantCalibCorrData_aast(1)(5).ChlStatus_en_U8',

    'Imu2_PlantCalibCorrectedData_ChlStatus_AccXLgChl' => 'rb_sdcm_PlantCalibCorrData_aast(1)(0).ChlStatus_en',
    'Imu2_PlantCalibCorrectedData_ChlStatus_AccYLgChl' => 'rb_sdcm_PlantCalibCorrData_aast(1)(1).ChlStatus_en',
    'Imu2_PlantCalibCorrectedData_ChlStatus_AccZLgChl' => 'rb_sdcm_PlantCalibCorrData_aast(1)(2).ChlStatus_en',
    'Imu2_PlantCalibCorrectedData_ChlStatus_RollRate'  => 'rb_sdcm_PlantCalibCorrData_aast(1)(3).ChlStatus_en',
    'Imu2_PlantCalibCorrectedData_ChlStatus_PitchRate' => 'rb_sdcm_PlantCalibCorrData_aast(1)(4).ChlStatus_en',
    'Imu2_PlantCalibCorrectedData_ChlStatus_YawRate'   => 'rb_sdcm_PlantCalibCorrData_aast(1)(5).ChlStatus_en',

## plant calibration channel status
    'PlantCalibChlStatusInvalid_AccXLgChl' => 1,    # dummy value defined
    'PlantCalibChlStatusInvalid_AccYLgChl' => 1,
    'PlantCalibChlStatusInvalid_AccZLgChl' => 1,
    'PlantCalibChlStatusInvalid_RollRate'  => 1,
    'PlantCalibChlStatusInvalid_PitchRate' => 1,
    'PlantCalibChlStatusInvalid_YawRate'   => 1,

    'PlantCalibChlStatusValid_AccXLgChl' => 1,
    'PlantCalibChlStatusValid_AccYLgChl' => 1,
    'PlantCalibChlStatusValid_AccZLgChl' => 1,
    'PlantCalibChlStatusValid_RollRate'  => 1,
    'PlantCalibChlStatusValid_PitchRate' => 1,
    'PlantCalibChlStatusValid_YawRate'   => 1,

    #OutputBuffer values
    'SFH_Value_2g_F1_AccXLgChl'     => 10003,
    'SFH_Value_2g_F1_RollRateLfChl' => 10003,
    'SFH_Value_2g_F1_AccYLgChl'     => 10003,
    'SFH_Value_150gps_F1_YawRate'   => 15003,

    'SFH_Value_1g_F1_AccYLgChl' => 4997,
    'SFH_Value_1g_F2_AccYLgChl' => 4992,

    'FieldCalibValue_AccXLgChl' => 585,
    'FieldCalibValue_AccYLgChl' => 585,
    'FieldCalibValue_RollRate'  => 15,
    'FieldCalibValue_YawRate'   => 15,

    'PlantCalibValue_AccXLgChl' => 0,    #Dummy values are defined for plant calib data as on current.
    'PlantCalibValue_RollRate'  => 0,
    'PlantCalibValue_AccYLgChl' => 0,
    'PlantCalibValue_YawRate'   => 0,

    'SFH_Value_2g_F2_AccXLgChl'   => 10001,
    'SFH_Value_2g_F2_AccYLgChl'   => 9984,
    'SFH_Value_2g_F2_RollRateLfC' => 10001,
    'SFH_Value_150gps_F2_YawRate' => 14976,

    #    InitialRelOffsetCheckFailure																						##To be check with Suhana on sensor programming info for SMU
    #Default values for correction parameters:
    'Imu2_Misalignment_Acc_XX_default' => 16384,
    'Imu2_Misalignment_Acc_XY_default' => 0,
    'Imu2_Misalignment_Acc_XZ_default' => 0,

    'Imu2_Misalignment_Acc_YX_default' => 0,
    'Imu2_Misalignment_Acc_YY_default' => 16384,
    'Imu2_Misalignment_Acc_YZ_default' => 0,

    'Imu2_Misalignment_Acc_ZX_default' => 0,
    'Imu2_Misalignment_Acc_ZY_default' => 0,
    'Imu2_Misalignment_Acc_ZZ_default' => 16384,

    'Imu2_Misalignment_rate_XX_default' => 16384,
    'Imu2_Misalignment_rate_XY_default' => 0,
    'Imu2_Misalignment_rate_XZ_default' => 0,

    'Imu2_Misalignment_rate_YX_default' => 0,
    'Imu2_Misalignment_rate_YY_default' => 16384,
    'Imu2_Misalignment_rate_YZ_default' => 0,

    'Imu2_Misalignment_rate_ZX_default' => 0,
    'Imu2_Misalignment_rate_ZY_default' => 0,
    'Imu2_Misalignment_rate_ZZ_default' => 16384,

    'Imu2_Sensitivity_Acc_X_default' => 16384,
    'Imu2_Sensitivity_Acc_Y_default' => 16384,
    'Imu2_Sensitivity_Acc_Z_default' => 16384,

    'Imu2_Sensitivity_rate_X_default' => 16384,
    'Imu2_Sensitivity_rate_Y_default' => 16384,
    'Imu2_Sensitivity_rate_Z_default' => 16384,

    'Imu2_Offset_Acc_X_default' => 0,
    'Imu2_Offset_Acc_Y_default' => 0,
    'Imu2_Offset_Acc_Z_default' => 0,

    'Imu2_Offset_rate_X_default' => 0,
    'Imu2_Offset_rate_Y_default' => 0,
    'Imu2_Offset_rate_Z_default' => 0,

    #Write Misalignment parameters:
    'Imu2_Misalignment_dfst_Acc_XX' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.MisalignmentXX_s16',
    'Imu2_Misalignment_dsft_Acc_XY' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.MisalignmentXY_s16',
    'Imu2_Misalignment_dsft_Acc_XZ' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.MisalignmentXZ_s16',

    'Imu2_Misalignment_dfst_Acc_YX' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.MisalignmentYX_s16',
    'Imu2_Misalignment_dfst_Acc_YY' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.MisalignmentYY_s16',
    'Imu2_Misalignment_dfst_Acc_YZ' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.MisalignmentYZ_s16',

    'Imu2_Misalignment_dfst_Acc_ZX' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.MisalignmentZX_s16',
    'Imu2_Misalignment_dfst_Acc_ZY' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.MisalignmentZY_s16',
    'Imu2_Misalignment_dfst_Acc_ZZ' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.MisalignmentZZ_s16',

    'Imu2_Misalignment_dfst_rate_XX' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.MisalignmentXX_s16',
    'Imu2_Misalignment_dfst_rate_XY' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.MisalignmentXY_s16',
    'Imu2_Misalignment_dfst_rate_XZ' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.MisalignmentXZ_s16',

    'Imu2_Misalignment_dfst_rate_YX' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.MisalignmentYX_s16',
    'Imu2_Misalignment_dfst_rate_YY' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.MisalignmentYY_s16',
    'Imu2_Misalignment_dfst_rate_YZ' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.MisalignmentYZ_s16',

    'Imu2_Misalignment_dfst_rate_ZX' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.MisalignmentZX_s16',
    'Imu2_Misalignment_dfst_rate_ZY' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.MisalignmentZY_s16',
    'Imu2_Misalignment_dfst_rate_ZZ' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.MisalignmentZZ_s16',

    # Write Sensitivity Correction Parameters:
    'Imu2_Sensitivity_dfst_Acc_X', => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.SensitivityX_s16',
    'Imu2_Sensitivity_dfst_Acc_Y', => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.SensitivityY_s16',
    'Imu2_Sensitivity_dfst_Acc_Z', => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.SensitivityZ_s16',

    'Imu2_Sensitivity_dfst_rate_X', => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.SensitivityX_s16',
    'Imu2_Sensitivity_dfst_rate_Y', => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.SensitivityY_s16',
    'Imu2_Sensitivity_dfst_rate_Z', => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.SensitivityZ_s16',

    #Write Offset Correction Paramters:
    'Imu2_Offset_dfst_Acc_X' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.OffsetX_s16',
    'Imu2_Offset_dfst_Acc_Y' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.OffsetY_s16',
    'Imu2_Offset_dfst_Acc_Z' => 'rb_sdcm_Imu2PlantCorrAccLgParam_dfst.OffsetZ_s16',

    'Imu2_Offset_dfst_rate_X' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.OffsetX_s16',
    'Imu2_Offset_dfst_rate_Y' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.OffsetY_s16',
    'Imu2_Offset_dfst_rate_Z' => 'rb_sdcm_Imu2PlantCorrRateParam_dfst.OffsetZ_s16',

    #Misalignment Correction parameters:
    'Imu2_Misalignment_Acc_XX' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.MisalignmentXX_s16',
    'Imu2_Misalignment_Acc_XY' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.MisalignmentXY_s16',
    'Imu2_Misalignment_Acc_XZ' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.MisalignmentXZ_s16',

    'Imu2_Misalignment_Acc_YX' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.MisalignmentYX_s16',
    'Imu2_Misalignment_Acc_YY' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.MisalignmentYY_s16',
    'Imu2_Misalignment_Acc_YZ' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.MisalignmentYZ_s16',

    'Imu2_Misalignment_Acc_ZX' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.MisalignmentZX_s16',
    'Imu2_Misalignment_Acc_ZY' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.MisalignmentZY_s16',
    'Imu2_Misalignment_Acc_ZZ' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.MisalignmentZZ_s16',

    'Imu2_Misalignment_rate_XX' => 'rb_sdcm_Imu2PlantCorrRateParam_st.MisalignmentXX_s16',
    'Imu2_Misalignment_rate_XY' => 'rb_sdcm_Imu2PlantCorrRateParam_st.MisalignmentXY_s16',
    'Imu2_Misalignment_rate_XZ' => 'rb_sdcm_Imu2PlantCorrRateParam_st.MisalignmentXZ_s16',

    'Imu2_Misalignment_rate_YX' => 'rb_sdcm_Imu2PlantCorrRateParam_st.MisalignmentYX_s16',
    'Imu2_Misalignment_rate_YY' => 'rb_sdcm_Imu2PlantCorrRateParam_st.MisalignmentYY_s16',
    'Imu2_Misalignment_rate_YZ' => 'rb_sdcm_Imu2PlantCorrRateParam_st.MisalignmentYZ_s16',

    'Imu2_Misalignment_rate_ZX' => 'rb_sdcm_Imu2PlantCorrRateParam_st.MisalignmentZX_s16',
    'Imu2_Misalignment_rate_ZY' => 'rb_sdcm_Imu2PlantCorrRateParam_st.MisalignmentZY_s16',
    'Imu2_Misalignment_rate_ZZ' => 'rb_sdcm_Imu2PlantCorrRateParam_st.MisalignmentZZ_s16',

    #Sensitivity Correction Parameters:
    'Imu2_Sensitivity_Acc_X', => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.SensitivityX_s16',
    'Imu2_Sensitivity_Acc_Y', => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.SensitivityY_s16',
    'Imu2_Sensitivity_Acc_Z', => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.SensitivityZ_s16',

    'Imu2_Sensitivity_rate_X', => 'rb_sdcm_Imu2PlantCorrRateParam_st.SensitivityX_s16',
    'Imu2_Sensitivity_rate_Y', => 'rb_sdcm_Imu2PlantCorrRateParam_st.SensitivityY_s16',
    'Imu2_Sensitivity_rate_Z', => 'rb_sdcm_Imu2PlantCorrRateParam_st.SensitivityZ_s16',

    #Offset Correction Paramters:
    'Imu2_Offset_Acc_X' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.OffsetX_s16',
    'Imu2_Offset_Acc_Y' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.OffsetY_s16',
    'Imu2_Offset_Acc_Z' => 'rb_sdcm_Imu2PlantCorrAccLgParam_st.OffsetZ_s16',

    'Imu2_Offset_rate_X' => 'rb_sdcm_Imu2PlantCorrRateParam_st.OffsetX_s16',
    'Imu2_Offset_rate_Y' => 'rb_sdcm_Imu2PlantCorrRateParam_st.OffsetY_s16',
    'Imu2_Offset_rate_Z' => 'rb_sdcm_Imu2PlantCorrRateParam_st.OffsetZ_s16',

    'PlantCalibChlState' => 'rb_spc_DataSamplingStatus_u8',

    'PlantCalibChlState_Init'    => 0,
    'PlantCalibChlState_Invalid' => 1,
    'PlantCalibChlState_Valid'   => 2,

    'PlantCalib_Success'    => 3,
    'PlantCalib_Failed'     => 2,
    'PlantCalib_InProgress' => 1,
    'PlantCalib_NotDone'    => 0,

    '1g_NotCorrected' => 0,

    'PlantCalibChl_Config' => 'rb_sdcm_PlantCalibChlState_au8(1)',

    'PlantCalibChl_XlowG_Status'     => 'rb_sdcm_PlantCalibCorrData_aast(1)(0).ChlStatus_en',
    'PlantCalibChl_YlowG_Status'     => 'rb_sdcm_PlantCalibCorrData_aast(1)(1).ChlStatus_en',
    'PlantCalibChl_ZlowG_Status'     => 'rb_sdcm_PlantCalibCorrData_aast(1)(2).ChlStatus_en',
    'PlantCalibChl_YawRate_Status'   => 'rb_sdcm_PlantCalibCorrData_aast(1)(3).ChlStatus_en',
    'PlantCalibChl_RollRate_Status'  => 'rb_sdcm_PlantCalibCorrData_aast(1)(4).ChlStatus_en',
    'PlantCalibChl_PitchRate_Status' => 'rb_sdcm_PlantCalibCorrData_aast(1)(5).ChlStatus_en',

    'PlantCalibChl_NotConfigured' => '0x00',
    'Plant_Calib_Status'          => 'rb_sdcm_PlantCalibChlState_au8(1)',
    'Calib_NotDone'               => 0,

    #    InitialRelOffsetCheckFailure
    'csim_ManagerStateRT_U8'               => 'rb_csim_ManagerStateRT_en_U8',
    'csem_InitialRelOffsetCheckFailure_U8' => 'rb_csem_SensorDataRT_st.InitialRelOffsetCheckFailure_bo_U8',
    'InertialSensor1_ParID0_IREG0'         => '204',
    'InertialSensor1_ParID0_IREG1'         => '0',
    'InertialSensor1_ParID0_IREG2'         => '26303',
    'InertialSensor1_ParID0_IREG3'         => '29531',

    'InertialSensor1_ParID0_OREG0' => '192',

    'InertialSensor1_ParID1_IREG0' => '204',
    'InertialSensor1_ParID1_IREG1' => '1',
    'InertialSensor1_ParID1_IREG2' => '3069',
    'InertialSensor1_ParID1_IREG3' => '964',

    'InertialSensor1_ParID1_OREG0' => '192',

    'InertialSensor1_ParID2_IREG0' => '204',
    'InertialSensor1_ParID2_IREG1' => '290',      # verified
    'InertialSensor1_ParID2_IREG2' => '12850',    # verified
    'InertialSensor1_ParID2_IREG3' => '0',        # verified

    'InertialSensor1_ParID2_OREG0' => '192',

    'InertialSensor1_ParID3_IREG0' => '204',
    'InertialSensor1_ParID3_IREG1' => '49283',
    'InertialSensor1_ParID3_IREG2' => '3592',
    'InertialSensor1_ParID3_IREG3' => '0',

    'InertialSensor1_ParID3_OREG0' => '192',

    'InertialSensor1_ParID4_IREG0' => '204',
    'InertialSensor1_ParID4_IREG1' => '9220',     # verified
    'InertialSensor1_ParID4_IREG2' => '292',      # verified
    'InertialSensor1_ParID4_IREG3' => '292',      # verified

    'InertialSensor1_ParID4_OREG0' => '192',

    'InertialSensor1_ParID5_IREG0' => '204',
    'InertialSensor1_ParID5_IREG1' => '9221',     # verified
    'InertialSensor1_ParID5_IREG2' => '292',      # in SW  , 9252
    'InertialSensor1_ParID5_IREG3' => '9252',     # verified

    'InertialSensor1_ParID5_OREG0' => '192',

    'InertialSensor1_ParID6_IREG0' => '204',
    'InertialSensor1_ParID6_IREG1' => '9222',     # verified
    'InertialSensor1_ParID6_IREG2' => '2596',     #verified
    'InertialSensor1_ParID6_IREG3' => '2596',     #verified

    'InertialSensor1_ParID6_OREG0' => '192',

    'InertialSensor1_ParID7_IREG0' => '204',
    'InertialSensor1_ParID7_IREG1' => '9223',     # verified
    'InertialSensor1_ParID7_IREG2' => '2596',     # SW 9252
    'InertialSensor1_ParID7_IREG3' => '10788',    # verified

    'InertialSensor1_ParID7_OREG0' => '192',

    'InertialSensor1_ParID8_IREG0' => '204',
    'InertialSensor1_ParID8_IREG1' => '8',        # verified
    'InertialSensor1_ParID8_IREG2' => '553',      # verified
    'InertialSensor1_ParID8_IREG3' => '310',      # verified

    'InertialSensor1_ParID8_OREG0' => '192',

    'InertialSensor1_ParID9_IREG0' => '204',
    'InertialSensor1_ParID9_IREG1' => '121',      # verified
    'InertialSensor1_ParID9_IREG2' => '0',        # verified
    'InertialSensor1_ParID9_IREG3' => '0',        # verified

    'InertialSensor1_ParID9_OREG0' => '192',

    'InertialSensor1_ParID10_IREG0' => '204',
    'InertialSensor1_ParID10_IREG1' => '10',      # verified
    'InertialSensor1_ParID10_IREG2' => '0',       # verified
    'InertialSensor1_ParID10_IREG3' => '0',       # verified

    'InertialSensor1_ParID10_OREG0' => '192',

    'InertialSensor1_ParID11_IREG0' => '204',
    'InertialSensor1_ParID11_IREG1' => '827',     # verified
    'InertialSensor1_ParID11_IREG2' => '0',       # verified
    'InertialSensor1_ParID11_IREG3' => '0',       # verified

    'InertialSensor1_ParID11_OREG0' => '192',

    'InertialSensor1_ParID12_IREG0' => '204',
    'InertialSensor1_ParID12_IREG1' => '12',      # verified
    'InertialSensor1_ParID12_IREG2' => '0',       # verified
    'InertialSensor1_ParID12_IREG3' => '0',       # verified

    'InertialSensor1_ParID12_OREG0' => '192',

    'InertialSensor1_ParID13_IREG0' => '204',
    'InertialSensor1_ParID13_IREG1' => '13',      # verified
    'InertialSensor1_ParID13_IREG2' => '0',       # verified
    'InertialSensor1_ParID13_IREG3' => '0',       # verified

    'InertialSensor1_ParID13_OREG0' => '192',
    'InertialSensor1_ParID13_EOC'   => '1',

    'InertialSensor2_ParID0_IREG0' => '204',
    'InertialSensor2_ParID0_IREG1' => '0',
    'InertialSensor2_ParID0_IREG2' => '29567',
    'InertialSensor2_ParID0_IREG3' => '32703',

    'InertialSensor2_ParID0_OREG0' => '192',

    'InertialSensor2_ParID1_IREG0' => '204',
    'InertialSensor2_ParID1_IREG1' => '1',
    'InertialSensor2_ParID1_IREG2' => '30715',
    'InertialSensor2_ParID1_IREG3' => '31708',

    'InertialSensor2_ParID1_OREG0' => '192',

    'InertialSensor2_ParID2_IREG0' => '204',
    'InertialSensor2_ParID2_IREG1' => '290',      # verified
    'InertialSensor2_ParID2_IREG2' => '12850',    # verified
    'InertialSensor2_ParID2_IREG3' => '0',        # verified

    'InertialSensor2_ParID2_OREG0' => '192',

    'InertialSensor2_ParID3_IREG0' => '204',
    'InertialSensor2_ParID3_IREG1' => '49299',
    'InertialSensor2_ParID3_IREG2' => '3656',
    'InertialSensor2_ParID3_IREG3' => '0',

    'InertialSensor2_ParID3_OREG0' => '192',

    'InertialSensor2_ParID4_IREG0' => '204',
    'InertialSensor2_ParID4_IREG1' => '9220',     # verified
    'InertialSensor2_ParID4_IREG2' => '9252',     # verified
    'InertialSensor2_ParID4_IREG3' => '9252',     # verified

    'InertialSensor2_ParID4_OREG0' => '192',

    'InertialSensor2_ParID5_IREG0' => '204',
    'InertialSensor2_ParID5_IREG1' => '9221',     # verified
    'InertialSensor2_ParID5_IREG2' => '9252',     # in SW  , 9252
    'InertialSensor2_ParID5_IREG3' => '9252',     # verified

    'InertialSensor2_ParID5_OREG0' => '192',

    'InertialSensor2_ParID6_IREG0' => '204',
    'InertialSensor2_ParID6_IREG1' => '9222',     # verified
    'InertialSensor2_ParID6_IREG2' => '9252',     #verified
    'InertialSensor2_ParID6_IREG3' => '9252',     #verified

    'InertialSensor2_ParID6_OREG0' => '192',

    'InertialSensor2_ParID7_IREG0' => '204',
    'InertialSensor2_ParID7_IREG1' => '9223',     # verified
    'InertialSensor2_ParID7_IREG2' => '9252',     # SW 9252
    'InertialSensor2_ParID7_IREG3' => '10788',    # verified

    'InertialSensor2_ParID7_OREG0' => '192',

    'InertialSensor2_ParID8_IREG0' => '204',
    'InertialSensor2_ParID8_IREG1' => '8',        # verified
    'InertialSensor2_ParID8_IREG2' => '553',      # verified
    'InertialSensor2_ParID8_IREG3' => '310',      # verified

    'InertialSensor2_ParID8_OREG0' => '192',

    'InertialSensor2_ParID9_IREG0' => '204',
    'InertialSensor2_ParID9_IREG1' => '121',      # verified
    'InertialSensor2_ParID9_IREG2' => '0',        # verified
    'InertialSensor2_ParID9_IREG3' => '0',        # verified

    'InertialSensor2_ParID9_OREG0' => '192',

    'InertialSensor2_ParID10_IREG0' => '204',
    'InertialSensor2_ParID10_IREG1' => '10',      # verified
    'InertialSensor2_ParID10_IREG2' => '0',       # verified
    'InertialSensor2_ParID10_IREG3' => '0',       # verified

    'InertialSensor2_ParID10_OREG0' => '192',

    'InertialSensor2_ParID11_IREG0' => '204',
    'InertialSensor2_ParID11_IREG1' => '827',     # verified
    'InertialSensor2_ParID11_IREG2' => '0',       # verified
    'InertialSensor2_ParID11_IREG3' => '0',       # verified

    'InertialSensor2_ParID11_OREG0' => '192',

    'InertialSensor2_ParID12_IREG0' => '204',
    'InertialSensor2_ParID12_IREG1' => '12',      # verified
    'InertialSensor2_ParID12_IREG2' => '0',       # verified
    'InertialSensor2_ParID12_IREG3' => '0',       # verified

    'InertialSensor2_ParID12_OREG0' => '192',

    'InertialSensor2_ParID13_IREG0' => '204',
    'InertialSensor2_ParID13_IREG1' => '13',      # verified
    'InertialSensor2_ParID13_IREG2' => '0',       # verified
    'InertialSensor2_ParID13_IREG3' => '0',       # verified

    'InertialSensor2_ParID13_OREG0' => '192',
    'InertialSensor2_ParID13_EOC'   => '1',

    'Imu2AccXLgChl_SID'      => '25',
    'Imu2AccXHgMonChl_SID'   => '27',
    'Imu2AccYLgChl_SID'      => '26',
    'Imu2AccYHgMonChl_SID'   => '28',
    'Imu2AccZLgChl_SID'      => '29',
    'Imu2AccZHgMonChl_SID'   => '28',
    'Imu2RollRateLfChl_SID'  => '4',
    'Imu2YawRateLfChl_SID'   => '21',
    'Imu2PitchRateLfChl_SID' => '2',
    'ImuTemperatureChl_SID'  => '30',

    'Imu2AccXLgChl_SID'      => '29',
    'Imu2AccXHgMonChl_SID'   => '27',
    'Imu2AccYLgChl_SID'      => '28',
    'Imu2AccYHgMonChl_SID'   => '28',
    'Imu2AccZLgChl_SID'      => '27',
    'Imu2AccZHgMonChl_SID'   => '28',
    'Imu2RollRateLfChl_SID'  => '29',
    'Imu2YawRateLfChl_SID'   => '27',
    'Imu2PitchRateLfChl_SID' => '28',
    'Imu2TemperatureChl_SID' => '30',

    #***********************Fault Mapping*****************************************

    'AccXLgChl_Temp_flt'            => 'rb_csem_MonTempAccXLgPlausi_flt',
    'AccYLgChl_Temp_flt'            => 'rb_csem_MonTempAccYLgPlausi_flt',
    'AccZLgChl_Temp_flt'            => 'rb_csem_MonTempAccZLgPlausi_flt',
    'YawRateLfChl_Temp_flt'         => 'rb_csem_MonTempYawRateLfPlausi_flt',
    'RollRateLfChl_Temp_flt'        => 'rb_csem_MonTempRollRateLfPlausi_flt',
    'PitchRateLfChl_Temp_flt'       => 'rb_csem_MonTempPitchRateLfPlausi_flt',
    'TemperatureChl_Temp_flt'       => 'rb_csem_MonTempImu2Temperature_flt',
    'Imu2TemperatureChl_Temp_flt'   => 'rb_csem_MonTempImu2Temperature_flt',
    'Imu2FrequencyCounter_Temp_flt' => 'rb_csem_MonTempImu2FrequencyCounter_flt',

    'AccXLgChl_Perm_flt'            => 'rb_csem_MonPermAccXLgPlausiChl_flt',
    'AccYLgChl_Perm_flt'            => 'rb_csem_MonPermAccYLgPlausiChl_flt',
    'AccZLgChl_Perm_flt'            => 'rb_csem_MonPermAccZLgPlausiChl_flt',
    'RollRateLfChl_Perm_flt'        => 'rb_csem_MonPermRollRateLfPlausiChl_flt',
    'YawRateLfChl_Perm_flt'         => 'rb_csem_MonPermYawRateLfPlausiChl_flt',
    'PitchRateLfChl_Perm_flt'       => 'rb_csem_MonPermPitchRateLfPlausiChl_flt',
    'Imu2TemperatureChl_Perm_flt'   => 'rb_csem_MonPermImuTemperaturePlausiChl_flt',
    'TemperatureChl_Perm_flt'       => 'rb_csem_MonPermImuTemperaturePlausiChl_flt',
    'FrequencyCounter_Temp_flt'     => 'rb_csem_MonTempImu2FrequencyCounter_flt',
    'Imu2FrequencyCounter_Temp_flt' => 'rb_csem_MonTempImu2FrequencyCounter_flt',
    'SdpSensorTimeSyncError_flt'    => 'rb_sdp_SensorTimeSyncError_flt',

    # 'AccXLgChl_SignalMonCtrl_flt'			=> 'rb_simc_SignalMonCtrlLowgYPls_flt',              ##These faults information is not providing to Algo, hence these faults are not aplicable to SMU
    # 'AccYLgChl_SignalMonCtrl_flt'			=> 'rb_simc_SignalMonCtrlLowgY_flt',
    # 'AccZLgChl_SignalMonCtrl_flt'			=> 'rb_simc_SignalMonCtrlLowgZ_flt',
    # 'YawRateLfChl_SignalMonCtrl_flt'		=> 'rb_simc_SignalMonCtrlYawRateLf_flt',
    # 'RollRateLfChl_SignalMonCtrl_flt'		=> 'rb_simc_SignalMonCtrlRollRateLf_flt',
    # 'PitchRateLfChl_SignalMonCtrl_flt'	=> 'rb_simc_SignalMonCtrlPitchRateLf_flt',

    'System_ConfDataInconsistent_flt' => 'rb_syc_ConfigurationDataInconsistent_flt',

    'Spi_CrcWrong_flt' => 'rb_spi_SpiRcvMsgCrcWrong_flt',

    'FieldCalibMissing_flt' => 'rb_sdcm_FieldCalibMissing_flt',
    'AsicIdMissmatch_flt'   => 'rb_syc_AsicIdMismatch_flt',

    'SysAsicRegisterProgMon_flt' => 'rb_bsd_SysAsicRegisterProgMon_flt',

    #******************************************************************************
    #                               SMI Sensor Faults
    #******************************************************************************
    # the indexes for Dem_AllEventsMonitorStatus() array are the fault numbers,
    # which can be found in *.flt file

    #rb_csem_MonTempAccXLgChl_flt
    #rb_csem_MonTempAccYLgChl_flt
    #rb_csem_MonTempAccZLgChl_flt
    #rb_csem_MonTempPitchRateLfChl_flt
    #rb_csem_MonTempRollRateLfChl_flt
    #rb_csem_MonTempYawRateLfChl_flt
    #
    # MonTempChlFlt   ( Realtime: Sensor Data Command -> CN, Clipping )
    #--------------
    'AccXLgChl_MonTemp_fltStatus_U8'      => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempAccXLgPlausi_flt__)_U8',
    'AccYLgChl_MonTemp_fltStatus_U8'      => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempAccYLgPlausi_flt__)_U8',
    'AccZLgChl_MonTemp_fltStatus_U8'      => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempAccZLgPlausi_flt__)_U8',
    'RollRateLfChl_MonTemp_fltStatus_U8'  => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempRollRateLfPlausi_flt__)_U8',
    'YawRateLfChl_MonTemp_fltStatus_U8'   => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempYawRateLfPlausi_flt__)_U8',
    'PitchRateLfChl_MonTemp_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermPitchRateLfPlausiChl_flt__)_U8',
    'TemperatureChl_MonTemp_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermImuTemperaturePlausiChl_flt__)_U8',

    #rb_csem_MonPermAccXLgChl_flt
    #rb_csem_MonPermAccYLgChl_flt
    #rb_csem_MonPermAccZLgChl_flt
    #rb_csem_MonPermPitchRateLfChl_flt
    #rb_csem_MonPermRollRateLfChl_flt
    #rb_csem_MonPermYawRateLfChl_flt
    #
    # MonPermChlFlt   ( Realtime: Sensor Data Command -> SD, SID, CRC   Module Command: SD, MID, PAGE, CRC )
    #--------------
    'AccXLgChl_MonPerm_fltStatus_U8'            => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccXLgPlausiChl_flt__)_U8',
    'AccYLgChl_MonPerm_fltStatus_U8'            => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccYLgPlausiChl_flt__)_U8',
    'AccZLgChl_MonPerm_fltStatus_U8'            => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccZLgPlausiChl_flt__)_U8',
    'RollRateLfChl_MonPerm_fltStatus_U8'        => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermRollRateLfPlausiChl_flt__)_U8',
    'YawRateLfChl_MonPerm_fltStatus_U8'         => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermYawRateLfPlausiChl_flt__)_U8',
    'PitchRateLfChl_MonPerm_fltStatus_U8'       => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermPitchRateLfPlausiChl_flt__)_U8',
    'Imu2TemperatureChl_MonPerm_fltStatus_U8'   => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermImuTemperaturePlausiChl_flt__)_U8',
    'Imu2FrequencyCounter_MonTemp_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempImu2FrequencyCounter_flt__)_U8',
    'SdpSensorTimeSyncError_fltStatus_U8'       => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_sdp_SensorTimeSyncError_flt__)_U8',

    #rb_csem_FieldCalibMissing_flt
    #-----------------------------
    'FieldCalibMissing_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_sdcm_FieldCalibMissing_flt__)_U8',

    #	Other faults
    #---------------
    #rb_syc_AsicIdMismatch_flt
    'AsicIdMismatch_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_syc_AsicIdMismatch_flt__)_U8',

    # Configuration Data Inconsistent Flt
    #-------------------------------
    #rb_syc_ConfigurationDataInconsistent_flt

    'InertialSensor2_ConfDataInconsistent_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_syc_ConfigurationDataInconsistent_flt__)_U8',

    'SpiRcvMsgCrcWrong_flt_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_spi_SpiRcvMsgCrcWrong_flt__)_U8',

    #	System mode checkbox

    'ActualSystemMode_U16' => 'rb_bswm_ActualSystemMode_au16(0)',
    'ActualSystemMode_U8'  => 'rb_bswm_ActualSystemMode_au16(0)_U16',

    #Actual system mode
    'Init1Mode_C'         => 1,
    'Init2Mode_C'         => 2,
    'Init3Mode_C'         => 3,
    'IdleMode_C'          => 4,
    'NormalDrivingMode_C' => 5,
    'DisposalMode_C'      => 6,
    'CrashMode_C'         => 7,

    #	System Warning Indicator check

    'System_Warning_Indicator_State' => 'rb_wimi_SysWIStatus_aen(0)',
    'WL_OFF_C'                       => 0,
    'WL_ON_C'                        => 1,

    #************************************************************************************************************************************************************************************************************
    #                               SMI Sensor Fault Handling with additional evaluation
    #************************************************************************************************************************************************************************************************************
    # Debounce counter evaluation for Permanent channel sensor faults during Init mode
    'Fault_DebounceCounter_Init_Mode'     => 'rb_csem_DebounceCounters_st.SMIInitFaults_as32(1)',
    'Fault_DebounceCounter_Init_Mode_S32' => 'rb_csem_DebounceCounters_st.SMIInitFaults_as32(1)_S32',

    # Debounce counter evaluation for Permanent channel sensor faults during Steady state mode
    'Fault_DebounceCounter_SteadyState_Mode' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(1)',
    'Fault_DebounceCounter_S32'              => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(1)_S32',

    # Fault storage data evaluation during Init mode

    'InternalSensor_FaultsQualified_info'   => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).InternalSensorFaultsQualified_en',
    'FaultStorageData_MonitoringPhase_info' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en',
    'InitSensor_FaultDisturbedDebug_info'   => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).InitSensorFaultDisturbedDebugInfo_u16',
    'InitSensor_FaultFilteredDebug_info'    => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).InitSensorFaultFilteredDebugInfo_u16',

    'InternalSensor_FaultsQualified_info_U8'   => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).InternalSensorFaultsQualified_en_U8',
    'FaultStorageData_MonitoringPhase_info_U8' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en_U8',
    'InitSensor_FaultDisturbedDebug_info_U16'  => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).InitSensorFaultDisturbedDebugInfo_u16_U16',
    'InitSensor_FaultFilteredDebug_info_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).InitSensorFaultFilteredDebugInfo_u16_U16',

    # Fault Filtered Debug info evaluation for Temporary channel sensor faults during Steady state mode
    'IMU2_SteadyState_FaultFilteredDebug_info'     => 'rb_csem_FaultStorageData_st.InfoClusterSMA_ast(1).CyclicFaultFilteredDebugInfo_u16',
    'IMU2_SteadyState_FaultFilteredDebug_info_U16' => 'rb_csem_FaultStorageData_st.InfoClusterSMA_ast(1).CyclicFaultFilteredDebugInfo_u16_u16',

    #####SMU Perm Fault Debounce counter Info
    'SMU_InternalSensor_Fault_DebounceCounter_S32'  => 'rb_csem_DebounceCounters_st.SMIInitFaults_as32(1)_S32',
    'SMU_BGSensor_Fault_DebounceCounter_S32'        => 'rb_csem_DebounceCounters_st.SMIBGFaults_as32(1)_S32',
    'IMU2_Perm_AccXLgChl_Fault_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(11)_S32',

    #'IMU2_Perm_AccXHgMonChl_Fault_DebounceCounter_S32'       		=> 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(12)_S32',
    'IMU2_Perm_AccYLgChl_Fault_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(13)_S32',

    #'IMU2_Perm_AccYHgMonChl_Fault_DebounceCounter_S32'       		=> 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(14)_S32',
    'IMU2_Perm_AccZLgChl_Fault_DebounceCounter_S32'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(15)_S32',
    'IMU2_Perm_RollRateLfChl_Fault_DebounceCounter_S32'    => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(17)_S32',
    'IMU2_Perm_YawRateLfChl_Fault_DebounceCounter_S32'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(18)_S32',
    'IMU2_Perm_PitchRateLfChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(19)_S32',
    'IMU2_Perm_TemperatureChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(20)_S32',
    'IMU2_Perm_FrequencyCounter_Fault_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(21)_S32',

    'IMU2_Perm_AccXLgChl_Fault_DebounceCounter' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(11)',

    #'IMU2_Perm_AccXHgMonChl_Fault_DebounceCounter'       			=> 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(12)',
    'IMU2_Perm_AccYLgChl_Fault_DebounceCounter' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(13)',

    #'IMU2_Perm_AccYHgMonChl_Fault_DebounceCounter'       			=> 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(14)',
    'IMU2_Perm_AccZLgChl_Fault_DebounceCounter'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(15)',
    'IMU2_Perm_RollRateLfChl_Fault_DebounceCounter'    => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(17)',
    'IMU2_Perm_YawRateLfChl_Fault_DebounceCounter'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(18)',
    'IMU2_Perm_PitchRateLfChl_Fault_DebounceCounter'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(19)',
    'IMU2_Perm_TemperatureChl_Fault_DebounceCounter'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(20)',
    'IMU2_Perm_FrequencyCounter_Fault_DebounceCounter' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(21)',

    #####SMU Temp Fault Debounce counter Info
    'IMU2_Temp_AccXLgChl_Fault_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(11)_S32',

    #'IMU2_Temp_AccXHgMonChl_Fault_DebounceCounter_S32'       		=> 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(12)_S32',
    'IMU2_Temp_AccYLgChl_Fault_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(13)_S32',

    #'IMU2_Temp_AccYHgMonChl_Fault_DebounceCounter_S32'       		=> 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(14)_S32',
    'IMU2_Temp_AccZLgChl_Fault_DebounceCounter_S32'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(15)_S32',
    'IMU2_Temp_RollRateLfChl_Fault_DebounceCounter_S32'    => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(17)_S32',
    'IMU2_Temp_YawRateLfChl_Fault_DebounceCounter_S32'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(18)_S32',
    'IMU2_Temp_PitchRateLfChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(19)_S32',
    'IMU2_Temp_TemperatureChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(20)_S32',
    'IMU2_Temp_FrequencyCounter_Fault_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(21)_S32',

    #####SMU Fault Monitoring Phage Info
    'IMU2_Fault_Monitoring_Phase_U8' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en_U8',
    'IMU2_Fault_Monitoring_Phase'    => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en',

    #####SMU Fault Qualified Info
    'SMU_InternalSensor_FaultsQualified_info_U8' => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).InternalSensorFaultsQualified_en_U8',
    'SMU_BGSensor_FaultsQualified_info_U8'       => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).BgSensorFaultsQualified_en_U8',
    'IMU2_AccXLgChl_FaultsQualified_info_U8'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(11)_U8',

    #'IMU2_AccXHgMonChl_FaultsQualified_info_U8'       		=> 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(12)_U8',
    'IMU2_AccYLgChl_FaultsQualified_info_U8' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(13)_U8',

    #'IMU2_AccYHgMonChl_FaultsQualified_info_U8'       		=> 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(14)_U8',
    'IMU2_AccZLgChl_FaultsQualified_info_U8'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(15)_U8',
    'IMU2_RollRateLfChl_FaultsQualified_info_U8'    => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(17)_U8',
    'IMU2_YawRateLfChl_FaultsQualified_info_U8'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(18)_U8',
    'IMU2_PitchRateLfChl_FaultsQualified_info_U8'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(19)_U8',
    'IMU2_TemperatureChl_FaultsQualified_info_U8'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(20)_U8',
    'IMU2_FrequencyCounter_FaultsQualified_info_U8' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(21)_U8',

    'IMU2_AccXLgChl_FaultsQualified_info' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(11)',

    #'IMU2_AccXHgMonChl_FaultsQualified_info'       		=> 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(12)',
    'IMU2_AccYLgChl_FaultsQualified_info' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(13)',

    #'IMU2_AccYHgMonChl_FaultsQualified_info'       		=> 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(14)',
    'IMU2_AccZLgChl_FaultsQualified_info'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(15)',
    'IMU2_RollRateLfChl_FaultsQualified_info'    => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(17)',
    'IMU2_YawRateLfChl_FaultsQualified_info'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(18)',
    'IMU2_PitchRateLfChl_FaultsQualified_info'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(19)',
    'IMU2_TemperatureChl_FaultsQualified_info'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(20)',
    'IMU2_FrequencyCounter_FaultsQualified_info' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(21)',

#####SMU Fault Filtered Debug Info
    'SMU_InternalSensor_FilteredDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).InitSensorFaultFilteredDebugInfo_u16_U16',
    'SMU_BGSensor_FilteredDebugInfo_U16'       => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).BgSensorFaultFilteredDebugInfo_u16_U16',
    'IMU2_AccXLgChl_FilteredDebugInfo_U16'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(11)_U16',

    #'IMU2_AccXHgMonChl_FilteredDebugInfo_U16'       		=> 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(12)_U16',
    'IMU2_AccYLgChl_FilteredDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(13)_U16',

    #'IMU2_AccYHgMonChl_FilteredDebugInfo_U16'       		=> 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(14)_U16',
    'IMU2_AccZLgChl_FilteredDebugInfo_U16'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(15)_U16',
    'IMU2_RollRateLfChl_FilteredDebugInfo_U16'    => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(17)_U16',
    'IMU2_YawRateLfChl_FilteredDebugInfo_U16'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(18)_U16',
    'IMU2_PitchRateLfChl_FilteredDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(19)_U16',
    'IMU2_TemperatureChl_FilteredDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(20)_U16',
    'IMU2_FrequencyCounter_FilteredDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(21)_U16',

#####SMU Fault Filtered Debug Info
    'SMU_InternalSensor_FilteredDebugInfo' => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).InitSensorFaultFilteredDebugInfo_u16',
    'SMU_BGSensor_FilteredDebugInfo'       => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).BgSensorFaultFilteredDebugInfo_u16',
    'IMU2_AccXLgChl_FilteredDebugInfo'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(11)',

    #'IMU2_AccXHgMonChl_FilteredDebugInfo'       		=> 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(12)',
    'IMU2_AccYLgChl_FilteredDebugInfo' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(13)',

    #'IMU2_AccYHgMonChl_FilteredDebugInfo'       		=> 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(14)',
    'IMU2_AccZLgChl_FilteredDebugInfo'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(15)',
    'IMU2_RollRateLfChl_FilteredDebugInfo'    => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(17)',
    'IMU2_YawRateLfChl_FilteredDebugInfo'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(18)',
    'IMU2_PitchRateLfChl_FilteredDebugInfo'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(19)',
    'IMU2_TemperatureChl_FilteredDebugInfo'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(20)',
    'IMU2_FrequencyCounter_FilteredDebugInfo' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(21)',

#####SMU Fault Disturbed Debug Info
    'SMU_InternalSensor_DisturbedDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).InitSensorFaultDisturbedDebugInfo_u16_U16',
    'SMU_BGSensor_DisturbedDebugInfo_U16'       => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(1).BgSensorFaultDisturbedDebugInfo_u16_U16',
    'IMU2_AccXLgChl_DisturbedDebugInfo_U16'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(11)_U16',

    #'IMU2_AccXHgMonChl_DisturbedDebugInfo_U16'       		=> 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(12)_U16',
    'IMU2_AccYLgChl_DisturbedDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(13)_U16',

    #'IMU2_AccYHgMonChl_DisturbedDebugInfo_U16'       		=> 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(14)_U16',
    'IMU2_AccZLgChl_DisturbedDebugInfo_U16'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(15)_U16',
    'IMU2_RollRateLfChl_DisturbedDebugInfo_U16'  => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(17)_U16',
    'IMU2_YawRateLfChl_DisturbedDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(18)_U16',
    'IMU2_PitchRateLfChl_DisturbedDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(19)_U16',
    'IMU2_TemperatureChl_DisturbedDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(20)_U16',

######Fault Qualified Info
##enum;rb_csem_DemStepsType_ten;rb_csem_TestNotDone_e;0;
##enum;rb_csem_DemStepsType_ten;rb_csem_TestDisturbed_e;1;
##enum;rb_csem_DemStepsType_ten;rb_csem_TestPassed_e;2;
##enum;rb_csem_DemStepsType_ten;rb_csem_TestFailed_e;3;

    'TestNotDone_C'   => 0,
    'TestDisturbed_C' => 1,
    'TestPassed_C'    => 2,
    'TestFailed_C'    => 3,

    #******************************************************************************
    #                               DTCs
    #******************************************************************************

    #    MonTempChl_flt
    #------------------

    'rb_csem_MonTempAccXLgPlausi_flt'         => '0x001218',
    'rb_csem_MonTempAccYLgPlausi_flt'         => '0x000016',
    'rb_csem_MonTempAccZLgPlausi_flt'         => '0x001215',
    'rb_csem_MonTempRollRateLfPlausi_flt'     => '0x001213',
    'rb_csem_MonTempYawRateLfPlausi_flt'      => '0x00001A',
    'rb_csem_MonTempPitchRateLfPlausi_flt'    => '0x001212',
    'rb_csem_MonTempImu2Temperature_flt'      => '0x001211',
    'rb_csem_MonTempImu2FrequencyCounter_flt' => '0x00121C',

    #    MonPermChl_flt
    #------------------
    'rb_csem_MonPermAccXLgPlausiChl_flt'         => '0xF00049',
    'rb_csem_MonPermAccYLgPlausiChl_flt'         => '0xF00049',
    'rb_csem_MonPermRollRateLfPlausiChl_flt'     => '0xF00049',
    'rb_csem_MonPermAccZLgPlausiChl_flt'         => '0xF00049',
    'rb_csem_MonPermYawRateLfPlausiChl_flt'      => '0xF00049',
    'rb_csem_MonPermPitchRateLfPlausiChl_flt'    => '0xF00049',
    'rb_csem_MonPermImuTemperaturePlausiChl_flt' => '0xF00049',
    'rb_csem_MonTempImu2FrequencyCounter_flt'    => '0x00121C',
    'rb_sdp_SensorTimeSyncError_flt'             => '0x000081',

    # Field Calibration Fault
    #------------------------
    'rb_sdcm_FieldCalibMissing_flt' => '0x001B13',

    #	Other faults
    #---------------
    'rb_syc_AsicIdMismatch_flt'         => '0xF00049',
    'rb_bsd_SysAsicRegisterProgMon_flt' => '0xF00049',

    # Configuration Data Inconsistent Flt
    #----------------------------------------

    'rb_syc_ConfigurationDataInconsistent_flt' => '0x0001B8',
    'rb_spi_SpiRcvMsgCrcWrong_flt'             => '0xF00049',

    # Lifetime fault counter

    'LfmCounterValue_TempDSPMonInertialSensor2_flt_U8' => 'rb_lfm_LfmCntrs_au8(37)',

    #******************************************************************************
    #                         Configuration data
    #******************************************************************************
    #    Set ECU to Plant Mode
    'varName_PlantMode'     => 'rb_sycg_PlantModes_dfst.rb_sycg_ActivePlantModes_au8(1)',
    'andMask_PlantMode'     => '0xFF',
    'orMask_PlantMode'      => '0x02',
    'restore_PlantMode_yes' => 'yes',

    # Set ECU to Plant Mode 5
    'varName_PlantMode5'     => 'rb_sycg_PlantModes_dfst.rb_sycg_ActivePlantModes_au8(0)',
    'andMask_PlantMode5'     => '0xFF',
    'orMask_PlantMode5'      => '0x10',
    'restore_PlantMode5_yes' => 'yes',

    #    Set ECU to Read Error Counter Mode
    'varName_RdErrCnt'     => 'rb_csem_NvmConfigDataEe_dfst.CsemMode_b32.2',
    'andMask_RdErrCnt'     => '0xFF',
    'orMask_RdErrCnt'      => '0x01',
    'restore_RdErrCnt_yes' => 'yes',

    #    De-configure SMI sensors
    #----------------------------
    #    De-configure all SMI sensors
    'varName_AsicConfigured'     => 'rb_syca_SysConfAsicEeData_dfst.AsicConfigured_ab8(0)',
    'andMask_AsicConfigured'     => '0x07',
    'orMask_AsicConfigured'      => '0x00',
    'restore_AsicConfigured_yes' => 'yes',

    #    De-configure SMA Plausi sensor
    'varName_AsicConfigured_CentralSensorPlausi'     => 'rb_syca_SysConfAsicEeData_dfst.AsicConfigured_ab8(0)',
    'andMask_DeConf_CentralSensorPlausi'             => '0x37',
    'orMask_DeConf_CentralSensorPlausi'              => '0x00',
    'restore_AsicConfigured_CentralSensorPlausi_yes' => 'yes',

    #    De-configure InertialSensor1 sensor
    'varName_AsicConfigured_InertialSensor1'     => 'rb_syca_SysConfAsicEeData_dfst.AsicConfigured_ab8(0)',
    'andMask_DeConf_InertialSensor1'             => '0x17',
    'orMask_DeConf_InertialSensor1'              => '0x00',
    'restore_AsicConfigured_InertialSensor1_yes' => 'yes',

    #    De-configure InertialSensor2 sensor
    'varName_AsicConfigured_InertialSensor2'     => 'rb_syca_SysConfAsicEeData_dfst.AsicConfigured_ab8(0)',
    'andMask_DeConf_InertialSensor2'             => '0x17',
    'orMask_DeConf_InertialSensor2'              => '0x00',
    'restore_AsicConfigured_InertialSensor2_yes' => 'yes',

    #    Delay Init Test Manager by 4s
    #---------------------------------
    'varName_InitDelay'     => 'rb_sycg_StaticBehaviorBits_dfst.rb_sycg_StaticBits_ab8(0)',
    'andMask_InitDelay'     => '0xFF',
    'orMask_InitDelay'      => '0x01',
    'restore_InitDelay_yes' => 'yes',

    # Field calibration
    # --------------------
    #Set crunking off (write to RAM)
    'varName_Cranking' => 'rb_sdci_IgnitionOffOrEngineOn_bo',
    'andMask_Cranking' => '0x00',
    'orMask_Cranking'  => '0x00',

    #    Set FielCalib status to not done
    'varName_FielCalibNotDone'    => 'rb_sdcm_ImuFieldCalibDataEe_dfst.FieldCalibStatus_u32.0',    #changed from .dfst vairable to .st
    'andMask_FielCalibNotDone'    => '0x00',
    'orMask_FielCalibNotDone'     => '0x00',
    'restore_FielCalibNotDone_no' => 'no',

    #    Set FielCalib status to not done
    'varName_FielCalibNotDone'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibStatus_u32.0',
    'andMask_FielCalibNotDone'    => '0x00',
    'orMask_FielCalibNotDone'     => '0x00',
    'restore_FielCalibNotDone_no' => 'yes',

    #    Set FielCalib status to done
    'varName_FielCalibDone'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibStatus_u32.0',
    'andMask_FielCalibDone'    => '0x00',
    'orMask_FielCalibDone'     => '0x03',
    'restore_FielCalibDone_no' => 'no',

    #    Set FieldCalibVinValue to wrong value
    'varName_FieldCalibVinValue'     => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibVinValue_au8(16)',
    'andMask_FieldCalibVinValue'     => '0x00',
    'orMask_FieldCalibVinValue'      => '0x88',
    'restore_FieldCalibVinValue_yes' => 'yes',

    #    Set XLgFieldCalibThrValue 	to 585 (0x0249)
    'varName_XLgFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(6).0',
    'andMask_XLgFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_XLgFieldCalibThrValue_Byte0'     => '0x49',
    'restore_XLgFieldCalibThrValue_Byte0_no' => 'no',

    'varName_XLgFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(6).1',
    'andMask_XLgFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_XLgFieldCalibThrValue_Byte1'     => '0x02',
    'restore_XLgFieldCalibThrValue_Byte1_no' => 'no',

    #    Set YLgFieldCalibThrValue 	to 585 (0x0249)
    'varName_YLgFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(7).0',
    'andMask_YLgFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_YLgFieldCalibThrValue_Byte0'     => '0x49',
    'restore_YLgFieldCalibThrValue_Byte0_no' => 'no',

    'varName_YLgFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(7).1',
    'andMask_YLgFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_YLgFieldCalibThrValue_Byte1'     => '0x02',
    'restore_YLgFieldCalibThrValue_Byte1_no' => 'no',

    #    Set ZLgFieldCalibThrValue 	to 585 (0x0249)
    'varName_ZLgFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(8).0',
    'andMask_ZLgFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_ZLgFieldCalibThrValue_Byte0'     => '0x49',
    'restore_ZLgFieldCalibThrValue_Byte0_no' => 'no',

    'varName_ZLgFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(8).1',
    'andMask_ZLgFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_ZLgFieldCalibThrValue_Byte1'     => '0x02',
    'restore_ZLgFieldCalibThrValue_Byte1_no' => 'no',

    #    Set RollRateFieldCalibThrValue 	to 15 (0x00F)
    'varName_RollRateFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(9).0',
    'andMask_RollRateFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_RollRateFieldCalibThrValue_Byte0'     => '0x0F',
    'restore_RollRateFieldCalibThrValue_Byte0_no' => 'no',

    'varName_RollRateFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(9).1',
    'andMask_RollRateFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_RollRateFieldCalibThrValue_Byte1'     => '0x00',
    'restore_RollRateFieldCalibThrValue_Byte1_no' => 'no',

    #    Set YawRateFieldCalibThrValue 	to 15 (0x00F)
    'varName_YawRateFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(11).0',
    'andMask_YawRateFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_YawRateFieldCalibThrValue_Byte0'     => '0x0F',
    'restore_YawRateFieldCalibThrValue_Byte0_no' => 'no',

    'varName_YawRateFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(11).1',
    'andMask_YawRateFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_YawRateFieldCalibThrValue_Byte1'     => '0x00',
    'restore_YawRateFieldCalibThrValue_Byte1_no' => 'no',

    #    Set PitchRateFieldCalibThrValue to 15 (0x00F)
    'varName_PitchRateFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(10).0',
    'andMask_PitchRateFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_PitchRateFieldCalibThrValue_Byte0'     => '0x0F',
    'restore_PitchRateFieldCalibThrValue_Byte0_no' => 'no',

    'varName_PitchRateFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(10).1',
    'andMask_PitchRateFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_PitchRateFieldCalibThrValue_Byte1'     => '0x00',
    'restore_PitchRateFieldCalibThrValue_Byte1_no' => 'no',

    #******************************************************************************
    #                          Field calibration
    #******************************************************************************
    #   Smi7FieldCalibDataEe
    #-----------------------
    'AccXLgChl_FieldCalibValue_EE_S16'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(6)_S16',
    'AccYLgChl_FieldCalibValue_EE_S16'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(7)_S16',
    'AccZLgChl_FieldCalibValue_EE_S16'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(8)_S16',
    'RollRateLfChl_FieldCalibValue_EE_S16'  => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(9)_S16',
    'PitchRateLfChl_FieldCalibValue_EE_S16' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(10)_S16',
    'YawRateLfChl_FieldCalibValue_EE_S16'   => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(11)_S16',

    'AccXLgChl_FieldCalibValue_EE'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(6)',
    'AccYLgChl_FieldCalibValue_EE'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(7)',
    'AccZLgChl_FieldCalibValue_EE'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(8)',
    'RollRateLfChl_FieldCalibValue_EE'  => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(9)',
    'YawRateLfChl_FieldCalibValue_EE'   => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(11)',
    'PitchRateLfChl_FieldCalibValue_EE' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(10)',

    #    FieldCalibValue
    #-------------------
    'AccXLgChl_FieldCalibValue_EE_V'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(6)',
    'AccYLgChl_FieldCalibValue_EE_V'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(7)',
    'AccZLgChl_FieldCalibValue_EE_V'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(8)',
    'RollRateLfChl_FieldCalibValue_EE_V'  => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(9)',
    'PitchRateLfChl_FieldCalibValue_EE_V' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(10)',
    'YawRateLfChl_FieldCalibValue_EE_V'   => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(11)',

    #    Field Calibration counter
    'Field_Calibration_Counter_U8' => 'rb_sfc_ImuFieldCalibration_st.Cnt_u8_U8',

    'Field_Calibration_Counter' => 'rb_sfc_ImuFieldCalibration_st.Cnt_u8',

    #	Field calibration
    'Field_Calibration_Status_U8' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibStatus_u32_U8',
    'Field_Calibration_Status'    => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibStatus_u32',

    #	Field calibration Status NVM
    'Field_Calibration_Status_NVM_Var' => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibStatus_u32',

    #	Field calibration Status
    'Field_Calibration_Failure_Reason_U16' => 'rb_sfc_ImuFieldCalibration_st.Info_st.FieldCalibFailureReason_b16_U16',
    'Field_Calibration_Failure_Reason'     => 'rb_sfc_ImuFieldCalibration_st.Info_st.FieldCalibFailureReason_b16',

    #	Field calibration State
    'Field_Calibration_State_U8' => 'rb_sfc_ImuFieldCalibration_st.Info_st.FieldCalibState_u8_U8',
    'Field_Calibration_State'    => 'rb_sfc_ImuFieldCalibration_st.Info_st.FieldCalibState_u8',

    #	VIN Check Counter
    'VIN_Check_Counter'     => 'rb_sfc_ImuInitialCalibChks_st.VinCheckCnt_u16',
    'VIN_Check_Counter_U16' => 'rb_sfc_ImuInitialCalibChks_st.VinCheckCnt_u16_U16',

    #	VIN Check Result
    'VIN_Check_Result_U16' => 'rb_sfc_ImuInitialCalibChks_st.VinCheckResult_en_U8',

    #	FieldCalibartion Thd
    'SMI_Acc_Channels_FieldCalibration_Thd_During_Calibration_NVM'  => 'rb_sdcm_ImuFieldCalibThds_dfst.FieldCalibThd_aas16(0)(0)',
    'SMI_Rate_Channels_FieldCalibration_Thd_During_Calibration_NVM' => 'rb_sdcm_ImuFieldCalibThds_dfst.FieldCalibThd_aas16(0)(1)',

    'SMI_Acc_Channels_FieldCalibration_Thd_During_Calibration_RAM'  => 'rb_sdcm_ImuFieldCalibThds_st.FieldCalibThd_aas16(0)(0)',
    'SMI_Rate_Channels_FieldCalibration_Thd_During_Calibration_RAM' => 'rb_sdcm_ImuFieldCalibThds_st.FieldCalibThd_aas16(0)(1)',

    'SMU_Acc_Channels_FieldCalibration_Thd_During_Calibration_NVM'  => 'rb_sdcm_ImuFieldCalibThds_dfst.FieldCalibThd_aas16(1)(0)',
    'SMU_Rate_Channels_FieldCalibration_Thd_During_Calibration_NVM' => 'rb_sdcm_ImuFieldCalibThds_dfst.FieldCalibThd_aas16(1)(1)',

    'SMU_Acc_Channels_FieldCalibration_Thd_During_Calibration_RAM'  => 'rb_sdcm_ImuFieldCalibThds_st.FieldCalibThd_aas16(1)(0)',
    'SMU_Rate_Channels_FieldCalibration_Thd_During_Calibration_RAM' => 'rb_sdcm_ImuFieldCalibThds_st.FieldCalibThd_aas16(1)(1)',

    #	FieldCalibartion Thd during verification
    'SMI_Acc_Channels_FieldCalibration_Thd_During_Verification_NVM'  => 'rb_sdcm_ImuFieldCalibThds_dfst.FieldCalibVerThd_aas16(0)(0)',
    'SMI_Rate_Channels_FieldCalibration_Thd_During_Verification_NVM' => 'rb_sdcm_ImuFieldCalibThds_dfst.FieldCalibVerThd_aas16(0)(1)',

    'SMI_Acc_Channels_FieldCalibration_Thd_During_Verification_RAM'  => 'rb_sdcm_ImuFieldCalibThds_st.FieldCalibVerThd_aas16(0)(0)',
    'SMI_Rate_Channels_FieldCalibration_Thd_During_Verification_RAM' => 'rb_sdcm_ImuFieldCalibThds_st.FieldCalibVerThd_aas16(0)(1)',

    'SMU_Acc_Channels_FieldCalibration_Thd_During_Verification_NVM'  => 'rb_sdcm_ImuFieldCalibThds_dfst.FieldCalibVerThd_aas16(1)(0)',
    'SMU_Rate_Channels_FieldCalibration_Thd_During_Verification_NVM' => 'rb_sdcm_ImuFieldCalibThds_dfst.FieldCalibVerThd_aas16(1)(1)',

    'SMU_Acc_Channels_FieldCalibration_Thd_During_Verification_RAM'  => 'rb_sdcm_ImuFieldCalibThds_st.FieldCalibVerThd_aas16(1)(0)',
    'SMU_Rate_Channels_FieldCalibration_Thd_During_Verification_RAM' => 'rb_sdcm_ImuFieldCalibThds_st.FieldCalibVerThd_aas16(1)(1)',

    #	ImuOffsCalcSampleCntRT
    #--------------------------
    'Field_Calibration_ImuOffsCalcSampleCntRT_U16' => 'rb_sfc_ImuOffsCalcSampleCntRT_u16_U16',

    #	ImuOffsCalcDataBufRT
    #--------------------------
    'AccXLgChl_ImuOffsCalcDataBufRT_S32'      => 'rb_sfc_ImuOffsCalcDataBufRT_as32(6)_S32',
    'AccYLgChl_ImuOffsCalcDataBufRT_S32'      => 'rb_sfc_ImuOffsCalcDataBufRT_as32(7)_S32',
    'AccZLgChl_ImuOffsCalcDataBufRT_S32'      => 'rb_sfc_ImuOffsCalcDataBufRT_as32(8)_S32',
    'RollRateLfChl_ImuOffsCalcDataBufRT_S32'  => 'rb_sfc_ImuOffsCalcDataBufRT_as32(9)_S32',
    'PitchRateLfChl_ImuOffsCalcDataBufRT_S32' => 'rb_sfc_ImuOffsCalcDataBufRT_as32(10)_S32',
    'YawRateLfChl_ImuOffsCalcDataBufRT_S32'   => 'rb_sfc_ImuOffsCalcDataBufRT_as32(11)_S32',

    #	Fieldcalibration Offsets(Mean Values)
    #--------------------------
    'AccXLgChl_FieldCalibration_Offsets_S32'      => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(6)_S32',
    'AccYLgChl_FieldCalibration_Offsets_S32'      => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(7)_S32',
    'AccZLgChl_FieldCalibration_Offsets_S32'      => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(8)_S32',
    'RollRateLfChl_FieldCalibration_Offsets_S32'  => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(9)_S32',
    'PitchRateLfChl_FieldCalibration_Offsets_S32' => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(10)_S32',
    'YawRateLfChl_FieldCalibration_Offsets_S32'   => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(11)_S32',

    #    rb_cia_EgoVelocity_u16_U8
    'VehSpeed_U8' => 'rb_cia_UnfrozenVelocity_u16_U8',

    # Plant Mode 5 checks
    'PlantMode5_AccXLg'              => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermAccXLgChl_flt__).debounceLevel_s16',
    'VBat_check'                     => 'Dem_AllEventsState(__FAULTINDEX:rb_pom_VbatLow_flt__).debounceLevel_s16',
    'PlantMode5_AccXHgMon'           => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermAccXHgMonChl_flt__).debounceLevel_s16',
    'PlantMode5_AccYLg'              => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermAccYLgChl_flt__).debounceLevel_s16',
    'PlantMode5_AccYHgMon'           => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermAccYHgMonChl_flt__).debounceLevel_s16',
    'PlantMode5_AccZLg'              => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermAccZLgChl_flt__).debounceLevel_s16',
    'PlantMode5_AccRoll'             => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermRollRateLfChl_flt__).debounceLevel_s16',
    'PlantMode5_AccYaw'              => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermYawRateLfChl_flt__).debounceLevel_s16',
    'PlantMode5_AccPitch'            => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermPitchRateLfChl_flt__).debounceLevel_s16',
    'EndofItm'                       => 'rb_itm_EndOfItmTimestamp_u32_u32',
    'PlantMode5_MonPermBG1'          => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermBGInertialSensor1_flt__).debounceLevel_s16',
    'PlantMode5_MonPermBG2'          => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermBGInertialSensor2_flt__).debounceLevel_s16',
    'PlantMode5_TempDsp'             => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_TempDspMonInertialSensor1_flt__).debounceLevel_s16',
    'PlantMode5_TempDsp2'            => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_TempDspMonInertialSensor2_flt__).debounceLevel_s16',
    'PlantMode5_PermInit'            => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermInitInertialSensor1_flt__).debounceLevel_s16',
    'PlantMode5_FieldCalib'          => 'Dem_AllEventsState(__FAULTINDEX:rb_sdcm_FieldCalibMissing_flt__).debounceLevel_s16',
    'PlantMode5_MonTemp_AccXLg'      => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonTempAccXLg_flt__).debounceLevel_s16',
    'PlantMode5_MonTemp_AccYLg'      => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonTempAccYLg_flt__).debounceLevel_s16',
    'PlantMode5_MonTemp_AccZLg'      => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonTempAccZLg_flt__).debounceLevel_s16',
    'PlantMode5_MonTemp_AccXHgMon'   => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonTempAccXHgMon_flt__).debounceLevel_s16',
    'PlantMode5_MonTemp_AccYHgMon'   => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonTempAccYHgMon_flt__).debounceLevel_s16',
    'PlantMode5_MonTemp_RollRateLf'  => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonTempRollRateLf_flt__).debounceLevel_s16',
    'PlantMode5_MonTemp_PitchRateLf' => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonTempPitchRateLf_flt__).debounceLevel_s16',
    'PlantMode5_MonTemp_YawRateLf'   => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonTempYawRateLf_flt__).debounceLevel_s16',

    # Mapping for customer VIN signal name on CAN
    'CAN_VIN_Signal' => 'GGCC_Id',

    ####	For Dequalification of CSEM Faults
    'Max_CSEM_faults' => 28,
##########For SMA Faults
    'CSEM_Fault_Qualified_NVM_Var0' => 'rb_csem_FaultStorageData_dfst.InfoClusterSMA_ast(0).InternalSensorFaultsQualified_aen(0)',    #INIT_GROUP1_Fault
    'CSEM_Fault_Qualified_NVM_Var1' => 'rb_csem_FaultStorageData_dfst.InfoClusterSMA_ast(0).InternalSensorFaultsQualified_aen(1)',    #INIT_GROUP2_Fault
    'CSEM_Fault_Qualified_NVM_Var2' => 'rb_csem_FaultStorageData_dfst.InfoClusterSMA_ast(0).InternalSensorFaultsQualified_aen(2)',    #INIT_GROUP3_Fault
    'CSEM_Fault_Qualified_NVM_Var3' => 'rb_csem_FaultStorageData_dfst.InfoClusterSMA_ast(0).InternalSensorFaultsQualified_aen(3)',    #INIT_GROUP4_Fault
    'CSEM_Fault_Qualified_NVM_Var4' => 'rb_csem_FaultStorageData_dfst.InfoClusterSMA_ast(0).InternalSensorFaultsQualified_aen(4)',    #INIT_GROUP5_Fault
    'CSEM_Fault_Qualified_NVM_Var5' => 'rb_csem_FaultStorageData_dfst.InfoClusterSMA_ast(0).CyclicfaultQualified_en',                 #RT_Cyclic_Fault
##########For Perm SMI Faults
    'CSEM_Fault_Qualified_NVM_Var6'  => 'rb_csem_FaultStorageData_dfst.InfoClusterSensorSMI_ast(0).InternalSensorFaultsQualified_en', #IMU1_Internal
    'CSEM_Fault_Qualified_NVM_Var7'  => 'rb_csem_FaultStorageData_dfst.InfoClusterSensorSMI_ast(0).BgSensorFaultsQualified_en',       #IMU1_BG
    'CSEM_Fault_Qualified_NVM_Var8'  => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(0)',     #IMU1_XLg
    'CSEM_Fault_Qualified_NVM_Var9'  => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(1)',     #IMU1_XHg
    'CSEM_Fault_Qualified_NVM_Var10' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(2)',     #IMU1_YLg
    'CSEM_Fault_Qualified_NVM_Var11' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(3)',     #IMU1_YHg
    'CSEM_Fault_Qualified_NVM_Var12' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(4)',     #IMU1_ZLg
    ####### 'CSEM_Fault_Qualified_NVM_Var13'  => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(5)',		#IMU1_ZHg (Not_Configured)
    'CSEM_Fault_Qualified_NVM_Var13' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(6)',     #IMU1_Rollrate
    'CSEM_Fault_Qualified_NVM_Var14' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(7)',     #IMU1_YawRate
    'CSEM_Fault_Qualified_NVM_Var15' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(8)',     #IMU1_PitchRate
    'CSEM_Fault_Qualified_NVM_Var16' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(9)',     #IMU1_Temperature
    'CSEM_Fault_Qualified_NVM_Var17' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(10)',    #IMU1_FrequencyCounter
##########For Perm SMU Faults
    'CSEM_Fault_Qualified_NVM_Var18' => 'rb_csem_FaultStorageData_dfst.InfoClusterSensorSMI_ast(1).InternalSensorFaultsQualified_en', #IMU2_Internal
    'CSEM_Fault_Qualified_NVM_Var19' => 'rb_csem_FaultStorageData_dfst.InfoClusterSensorSMI_ast(1).BgSensorFaultsQualified_en',       #IMU2_BG
    'CSEM_Fault_Qualified_NVM_Var20' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(11)',    #IMU2_XLg
    ###### 'CSEM_Fault_Qualified_NVM_Var21'  => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(12)',		#IMU2_XHg (Not_Configured)
    'CSEM_Fault_Qualified_NVM_Var21' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(13)',    #IMU2_YLG
    ####### 'CSEM_Fault_Qualified_NVM_Var23'  => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(14)',	#IMU2_YHG (Not_Configured)
    'CSEM_Fault_Qualified_NVM_Var22' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(15)',    #IMU2_ZLg
    ####### 'CSEM_Fault_Qualified_NVM_Var25'  => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(16)',	#IMU2_ZHg (Not_Configured)
    'CSEM_Fault_Qualified_NVM_Var23' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(17)',    #IMU2_RollRate
    'CSEM_Fault_Qualified_NVM_Var24' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(18)',    #IMU2_Yawrate
    'CSEM_Fault_Qualified_NVM_Var25' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(19)',    #IMU2_Pitchrate
    'CSEM_Fault_Qualified_NVM_Var26' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(20)',    #IMU2_Temperature
    'CSEM_Fault_Qualified_NVM_Var27' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(21)',    #IMU2_FrequencyCounter

    #	NVM Copy of InitErrorData Flags to clear in finalization    #define same variables in SMI and SMA and for SMA index will change
    'Imu_InitErrorData_ClusterFlags' => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ClusterFlags_u16',
    'Imu_InitErrorData_ErrorFlags0'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(0)',
    'Imu_InitErrorData_ErrorFlags1'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(1)',
    'Imu_InitErrorData_ErrorFlags2'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(2)',
    'Imu_InitErrorData_ErrorFlags3'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(3)',
    'Imu_InitErrorData_ErrorFlags4'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(4)',
    'Imu_InitErrorData_ErrorFlags5'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(5)',
    'Imu_InitErrorData_ErrorFlags6'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(6)',
    'Imu_InitErrorData_ErrorFlags7'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(7)',
    'Imu_InitErrorData_ErrorFlags8'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(8)',
    'Imu_InitErrorData_ErrorFlags9'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(1).ErrorFlags_au16(9)',
};

1;
__END__
