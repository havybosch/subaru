package LIFT_PROJECT;

#use strict;
use warnings;

$Defaults->{'PARA_MAP_CONF_SMI9_6D_C10'} = {

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
    'Trigger_YawRateLfChl_S16'  => 'rb_csic_RtComRxPayload_au16(7)_S16',
    'Trigger_AccXLgChl_S16'     => 'rb_csic_RtComRxPayload_au16(0)_S16',
    'Trigger_RollRateLfChl_S16' => 'rb_csic_RtComRxPayload_au16(6)_S16',

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
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu1FrequencyCounter_e;13;IMU_FREQ_CNT

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
    #enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu2FrequencyCounter_e;24;IMU_FREQ_CNT_HPS

    #
    #AlgoDataValid
    #----------------------------------------------
    'AccXLgChl_AlgoDataValid_U8'      => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
    'AccXHgMonChl_AlgoDataValid_U8'   => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
    'AccYLgChl_AlgoDataValid_U8'      => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
    'AccYHgMonChl_AlgoDataValid_U8'   => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
    'AccZLgChl_AlgoDataValid_U8'      => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
    'RollRateLfChl_AlgoDataValid_U8'  => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'YawRateLfChl_AlgoDataValid_U8'   => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'PitchRateLfChl_AlgoDataValid_U8' => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',

    #'Imu1TemperatureChl_AlgoDataValid_U8'    	=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'TemperatureChl_AlgoDataValid_U8'   => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'FrequencyCounter_AlgoDataValid_U8' => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',

    'SMA_SMI_Algo_data_valid_bits_U16'   => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',
    'SMA_SMI_Algo_data_valid_bits_U16_C' => '0b0101110111110111',                          #All sensor channels are configured including SMA and SMI.

    # AlgoDataValid_U16
    #----------------------------------------------
    'AccXLgChl_AlgoDataValid_U16'    => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',
    'AccXHgMonChl_AlgoDataValid_U16' => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',
    'AccYLgChl_AlgoDataValid_U16'    => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',
    'AccYHgMonChl_AlgoDataValid_U16' => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',

    #	'AccYLgPlausiChl_AlgoDataValid_U16'         => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',
    'AccZLgChl_AlgoDataValid_U16'     => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',
    'RollRateLfChl_AlgoDataValid_U16' => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',
    'YawRateLfChl_AlgoDataValid_U16'  => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',

    #	'YawRateLfPlausiChl_AlgoDataValid_U16'      => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',
    'PitchRateLfChl_AlgoDataValid_U16'     => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',
    'Imu1TemperatureChl_AlgoDataValid_U16' => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',
    'FrequencyCounter_AlgoDataValid_U16'   => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',

    # 'TemperatureChl_AlgoDataValid_U16'         	=> 'rb_csem_SensorDataRT_st.DataValid_b32_U16',

    #AlgoDataValid_b32.0
    #-------------------
    'AlgoDataValid_b32.0_U8'           => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
    'AccXLgChl_AlgoData_NotValid_C'    => '0bxxxx0xxx',
    'AccXLgChl_AlgoData_Valid_C'       => '0bxxxx1xxx',
    'AccXHgMonChl_AlgoData_NotValid_C' => '0bxxx0xxxx',
    'AccXHgMonChl_AlgoData_Valid_C'    => '0bxxx1xxxx',
    'AccYLgChl_AlgoData_NotValid_C'    => '0bxx0xxxxx',
    'AccYLgChl_AlgoData_Valid_C'       => '0bxx1xxxxx',
    'AccYHgMonChl_AlgoData_NotValid_C' => '0bx0xxxxxx',
    'AccYHgMonChl_AlgoData_Valid_C'    => '0bx1xxxxxx',
    'AccZLgChl_AlgoData_NotValid_C'    => '0b0xxxxxxx',
    'AccZLgChl_AlgoData_Valid_C'       => '0b1xxxxxxx',

    #AlgoDataValid_b32.1
    #-------------------
    'AlgoDataValid_b32.1_U8'            => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'AccZHgMonChl_AlgoData_NotValid_C'  => '0bxxxxxxx0',
    'AccZHgMonChl_AlgoData_Valid_C'     => '0bxxxxxxx1',
    'RollRateLfChl_AlgoData_NotValid_C' => '0bxxxxxx0x',
    'RollRateLfChl_AlgoData_Valid_C'    => '0bxxxxxx1x',
    'YawRateLfChl_AlgoData_NotValid_C'  => '0bxxxxx0xx',
    'YawRateLfChl_AlgoData_Valid_C'     => '0bxxxxx1xx',

    #	'YawRateLfPlausiChl_AlgoData_NotValid_C' 	=> '0bxx0xxxxx',
    #	'YawRateLfPlausiChl_AlgoData_Valid_C'    	=> '0bxx1xxxxx',
    'PitchRateLfChl_AlgoData_NotValid_C'   => '0bxxxx0xxx',
    'PitchRateLfChl_AlgoData_Valid_C'      => '0bxxxx1xxx',
    'TemperatureChl_AlgoData_Valid_C'      => '0bxxx1xxxx',
    'TemperatureChl_AlgoData_NotValid_C'   => '0bxxx0xxxx',
    'FrequencyCounter_AlgoData_Valid_C'    => '0bxx1xxxxx',
    'FrequencyCounter_AlgoData_NotValid_C' => '0bxx0xxxxx',

    #AlgoDataValid_b32
    #-----------------
    'AlgoDataValid_V'   => 'rb_csem_SensorDataRT_st.DataValid_b32',
    'AlgoDataValid_U32' => 'rb_csem_SensorDataRT_st.DataValid_b32_U32',

    #    YawRateLf, RollRateLfChl, AccZLgChl, AccYHgMonChl, AccYLgChl, AccXHgMonChl, AccXLgChl
    'InertialSensor1_AlgoData_NotValid_C' => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'InertialSensor1_AlgoData_Valid_C'    => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'Imu1_AlgoData_NotValid_C'            => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'Imu1_AlgoData_Valid_C'               => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',

    'AccXLgChl_AlgoData32_NotValid_C'            => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'AccXLgChl_AlgoData32_Valid_C'               => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'AccXHgMonChl_AlgoData32_NotValid_C'         => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'AccXHgMonChl_AlgoData32_Valid_C'            => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'AccYLgChl_AlgoData32_NotValid_C'            => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'AccYLgChl_AlgoData32_Valid_C'               => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'AccYHgMonChl_AlgoData32_NotValid_C'         => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'AccYHgMonChl_AlgoData32_Valid_C'            => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'AccZLgChl_AlgoData32_NotValid_C'            => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'AccZLgChl_AlgoData32_Valid_C'               => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'RollRateLfChl_AlgoData32_NotValid_C'        => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'RollRateLfChl_AlgoData32_Valid_C'           => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'YawRateLfChl_AlgoData32_NotValid_C'         => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'YawRateLfChl_AlgoData32_Valid_C'            => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'PitchRateLfChl_AlgoData32_NotValid_C'       => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'PitchRateLfChl_AlgoData32_Valid_C'          => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'Imu1TemperatureChl_AlgoData32_NotValid_C'   => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',
    'Imu1TemperatureChl_AlgoData32_Valid_C'      => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'Imu1FrequencyCounter_AlgoData32_NotValid_C' => '0bxxxxxxxxxxxxxxxxxx00000000000xxx',
    'Imu1FrequencyCounter_AlgoData32_Valid_C'    => '0bxxxxxxxxxxxxxxxxxx11111011111xxx',

    # 'AccXLgChl_AlgoData32_NotValid_C'       => '0bxxxxxxxxxxxxxxxxxxx1111011110xxx',
    # 'AccXLgChl_AlgoData32_Valid_C'       	=> '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',
    # 'AccXHgMonChl_AlgoData32_NotValid_C'    => '0bxxxxxxxxxxxxxxxxxxx1111011101xxx',
    # 'AccXHgMonChl_AlgoData32_Valid_C'       => '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',
    # 'AccYLgChl_AlgoData32_NotValid_C'       => '0bxxxxxxxxxxxxxxxxxxx1111011011xxx',
    # 'AccYLgChl_AlgoData32_Valid_C'       	=> '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',
    # 'AccYHgMonChl_AlgoData32_NotValid_C'    => '0bxxxxxxxxxxxxxxxxxxx1111010111xxx',
    # 'AccYHgMonChl_AlgoData32_Valid_C'       => '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',
    # 'AccZLgChl_AlgoData32_NotValid_C'       => '0bxxxxxxxxxxxxxxxxxxx1111001111xxx',
    # 'AccZLgChl_AlgoData32_Valid_C'       	=> '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',
    # 'RollRateLfChl_AlgoData32_NotValid_C'   => '0bxxxxxxxxxxxxxxxxxxx1110011111xxx',
    # 'RollRateLfChl_AlgoData32_Valid_C'      => '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',
    # 'YawRateLfChl_AlgoData32_NotValid_C'    => '0bxxxxxxxxxxxxxxxxxxx1101011111xxx',
    # 'YawRateLfChl_AlgoData32_Valid_C'       => '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',
    # 'PitchRateLfChl_AlgoData32_NotValid_C'  => '0bxxxxxxxxxxxxxxxxxxx1011011111xxx',
    # 'PitchRateLfChl_AlgoData32_Valid_C'     => '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',
    # 'Imu1TemperatureChl_AlgoData32_NotValid_C' => '0bxxxxxxxxxxxxxxxxxxx0111011111xxx',
    # 'Imu1TemperatureChl_AlgoData32_Valid_C'    => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',

    'AccXLgChl_Cyclic_AlgoData32_NotValid_C'            => '0bxxxxxxxxxxxxxxxxxxx1111011110xxx',
    'AccXLgChl_Cyclic_AlgoData32_Valid_C'               => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'AccXHgMonChl_Cyclic_AlgoData32_NotValid_C'         => '0bxxxxxxxxxxxxxxxxxxx1111011101xxx',
    'AccXHgMonChl_Cyclic_AlgoData32_Valid_C'            => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'AccYLgChl_Cyclic_AlgoData32_NotValid_C'            => '0bxxxxxxxxxxxxxxxxxxx1111011011xxx',
    'AccYLgChl_Cyclic_AlgoData32_Valid_C'               => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'AccYHgMonChl_Cyclic_AlgoData32_NotValid_C'         => '0bxxxxxxxxxxxxxxxxxxx1111010111xxx',
    'AccYHgMonChl_Cyclic_AlgoData32_Valid_C'            => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'AccZLgChl_Cyclic_AlgoData32_NotValid_C'            => '0bxxxxxxxxxxxxxxxxxxx1111001111xxx',
    'AccZLgChl_Cyclic_AlgoData32_Valid_C'               => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'RollRateLfChl_Cyclic_AlgoData32_NotValid_C'        => '0bxxxxxxxxxxxxxxxxxxx1110011111xxx',
    'RollRateLfChl_Cyclic_AlgoData32_Valid_C'           => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'YawRateLfChl_Cyclic_AlgoData32_NotValid_C'         => '0bxxxxxxxxxxxxxxxxxxx1101011111xxx',
    'YawRateLfChl_Cyclic_AlgoData32_Valid_C'            => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'PitchRateLfChl_Cyclic_AlgoData32_NotValid_C'       => '0bxxxxxxxxxxxxxxxxxxx1011011111xxx',
    'PitchRateLfChl_Cyclic_AlgoData32_Valid_C'          => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'Imu1TemperatureChl_Cyclic_AlgoData32_NotValid_C'   => '0bxxxxxxxxxxxxxxxxxxx0111011111xxx',
    'Imu1TemperatureChl_Cyclic_AlgoData32_Valid_C'      => '0bxxxxxxxxxxxxxxxxxxx1111011111xxx',
    'Imu1FrequencyCounter_Cyclic_AlgoData32_NotValid_C' => '0bxxxxxxxxxxxxxxxxxx01111011111xxx',
    'Imu1FrequencyCounter_Cyclic_AlgoData32_Valid_C'    => '0bxxxxxxxxxxxxxxxxxx11111011111xxx',

    'AccXLgChl_AlgoData32_NotConfig_NotValid_C'      => '0bxxxxxxxxxxxxxxxxxxx00000000xxxxx',
    'AccXLgChl_AlgoData32_NotConfig_Valid_C'         => '0bxxxxxxxxxxxxxxxxxxx11101111xxxxx',
    'AccYLgChl_AlgoData32_NotConfig_NotValid_C'      => '0bxxxxxxxxxxxxxxxxxxx00000000xxxxx',
    'AccYLgChl_AlgoData32_NotConfig_Valid_C'         => '0bxxxxxxxxxxxxxxxxxxx11101111xxxxx',
    'AccZLgChl_AlgoData32_NotConfig_NotValid_C'      => '0bxxxxxxxxxxxxxxxxxxx00000000xxxxx',
    'AccZLgChl_AlgoData32_NotConfig_Valid_C'         => '0bxxxxxxxxxxxxxxxxxxx11101111xxxxx',
    'RollRateLfChl_AlgoData32_NotConfig_NotValid_C'  => '0bxxxxxxxxxxxxxxxxxxx00000000xxxxx',
    'RollRateLfChl_AlgoData32_NotConfig_Valid_C'     => '0bxxxxxxxxxxxxxxxxxxx11101111xxxxx',
    'YawRateLfChl_AlgoData32_NotConfig_NotValid_C'   => '0bxxxxxxxxxxxxxxxxxxx00000000xxxxx',
    'YawRateLfChl_AlgoData32_NotConfig_Valid_C'      => '0bxxxxxxxxxxxxxxxxxxx11101111xxxxx',
    'PitchRateLfChl_AlgoData32_NotConfig_NotValid_C' => '0bxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxx',
    'PitchRateLfChl_AlgoData32_NotConfig_Valid_C'    => '0bxxxxxxxxxxxxxxxxx1xxxxxxxxxxxxxx',

    #InertDataOverload
    #----------------------------------------------
    'AccXLgChl_InertDataOverload_U8'    => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
    'AccXHgMonChl_InertDataOverload_U8' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
    'AccYLgChl_InertDataOverload_U8'    => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
    'AccYHgMonChl_InertDataOverload_U8' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
    'AccZLgChl_InertDataOverload_U8'    => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',

    'RollRateLfChl_InertDataOverload_U8'  => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
    'YawRateLfChl_InertDataOverload_U8'   => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
    'PitchRateLfChl_InertDataOverload_U8' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',

    'InertialSensor1_InertDataOverload_U16' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U16',
    'InertialSensor1_InertDataOverload'     => 'rb_csem_SensorDataRT_st.InertDataOverload_b32',

    #InertDataOverload_b32.0
    #-----------------------
    'AccXLgChl_InertDataOverload_0_C'    => '0bxxxx0xxx',
    'AccXLgChl_InertDataOverload_1_C'    => '0bxxxx1xxx',
    'AccXHgMonChl_InertDataOverload_0_C' => '0bxxx0xxxx',
    'AccXHgMonChl_InertDataOverload_1_C' => '0bxxx1xxxx',
    'AccYLgChl_InertDataOverload_0_C'    => '0bxx0xxxxx',
    'AccYLgChl_InertDataOverload_1_C'    => '0bxx1xxxxx',

    #InertDataOverload_b32.1
    #-----------------------
    'AccYHgMonChl_InertDataOverload_0_C' => '0bx0xxxxxx',
    'AccYHgMonChl_InertDataOverload_1_C' => '0bx1xxxxxx',

    #	'AccYLgPlausiChl_InertDataOverload_0_C'    	=> '0bxxxxxx0x',
    #	'AccYLgPlausiChl_InertDataOverload_1_C'    	=> '0bxxxxxx1x',
    'AccZLgChl_InertDataOverload_0_C'     => '0b0xxxxxxx',
    'AccZLgChl_InertDataOverload_1_C'     => '0b1xxxxxxx',
    'RollRateLfChl_InertDataOverload_0_C' => '0bxxxxxx0x',
    'RollRateLfChl_InertDataOverload_1_C' => '0bxxxxxx1x',
    'YawRateLfChl_InertDataOverload_0_C'  => '0bxxxxx0xx',
    'YawRateLfChl_InertDataOverload_1_C'  => '0bxxxxx1xx',

    #	'YawRateLfPlausiChl_InertDataOverload_0_C' 	=> '0bxx0xxxxx',
    #	'YawRateLfPlausiChl_InertDataOverload_1_C' 	=> '0bxx1xxxxx',
    'PitchRateLfChl_InertDataOverload_0_C' => '0bxxxx0xxx',
    'PitchRateLfChl_InertDataOverload_1_C' => '0bxxxx1xxx',

    'InertialSensor1_InertDataOverload_U16' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U16',
    'InertialSensor1_InertDataOverload'     => 'rb_csem_SensorDataRT_st.InertDataOverload_b32',
    'InertialSensor1_InertDataOverload_0_C' => '0bxxxxxxxxxxxxxxxxxxx0000000000xxx',

    # SensorDataComFaultRT (requirement from Toyota, related to CRC fault) - communication fault flags
    #----------------------------------------------
    'AccXLgChl_SensorDataComFaultRT_U8'    => 'rb_csem_SensorDataComFaultRT_b32_U8',
    'AccXHgMonChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32_U8',
    'AccYLgChl_SensorDataComFaultRT_U8'    => 'rb_csem_SensorDataComFaultRT_b32_U8',

    'AccYHgMonChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32_U8',

    #	'AccYLgPlausiChl_SensorDataComFaultRT_U8'   	=> 'rb_csem_SensorDataComFaultRT_b32.1_U8',
    'AccZLgChl_SensorDataComFaultRT_U8'     => 'rb_csem_SensorDataComFaultRT_b32_U8',
    'RollRateLfChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32.1_U8',
    'YawRateLfChl_SensorDataComFaultRT_U8'  => 'rb_csem_SensorDataComFaultRT_b32.1_U8',

    #	'YawRateLfPlausiChl_SensorDataComFaultRT_U8'	=> 'rb_csem_SensorDataComFaultRT_b32.1_U8',
    'PitchRateLfChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32.1_U8',
    'TemperatureChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32.1_U8',

    #SensorDataComFaultRT_b32.0
    #-----------------------
    'AccXLgChl_SensorDataComFaultRT_0_C'    => '0bxxxx0xxx',
    'AccXLgChl_SensorDataComFaultRT_1_C'    => '0bxxxx1xxx',
    'AccXHgMonChl_SensorDataComFaultRT_0_C' => '0bxxx0xxxx',
    'AccXHgMonChl_SensorDataComFaultRT_1_C' => '0bxxx1xxxx',
    'AccYLgChl_SensorDataComFaultRT_0_C'    => '0bxx0xxxxx',
    'AccYLgChl_SensorDataComFaultRT_1_C'    => '0bxx1xxxxx',

    #SensorDataComFaultRT_b32.1
    #-----------------------
    'AccYHgMonChl_SensorDataComFaultRT_0_C' => '0bx0xxxxxx',
    'AccYHgMonChl_SensorDataComFaultRT_1_C' => '0bx1xxxxxx',

    #	'AccYLgPlausiChl_SensorDataComFaultRT_0_C'    	=> '0bxxxxxx0x',
    #	'AccYLgPlausiChl_SensorDataComFaultRT_1_C'    	=> '0bxxxxxx1x',
    'AccZLgChl_SensorDataComFaultRT_0_C'     => '0b0xxxxxxx',
    'AccZLgChl_SensorDataComFaultRT_1_C'     => '0b1xxxxxxx',
    'RollRateLfChl_SensorDataComFaultRT_0_C' => '0bxxxxxx0x',
    'RollRateLfChl_SensorDataComFaultRT_1_C' => '0bxxxxxx1x',
    'YawRateLfChl_SensorDataComFaultRT_0_C'  => '0bxxxxx0xx',
    'YawRateLfChl_SensorDataComFaultRT_1_C'  => '0bxxxxx1xx',

    #	'YawRateLfPlausiChl_SensorDataComFaultRT_0_C' 	=> '0bxx0xxxxx',
    #	'YawRateLfPlausiChl_SensorDataComFaultRT_1_C' 	=> '0bxx1xxxxx',
    'PitchRateLfChl_SensorDataComFaultRT_0_C'     => '0bxxxx0xxx',
    'PitchRateLfChl_SensorDataComFaultRT_1_C'     => '0bxxxx1xxx',
    'Imu1TemperatureChl_SensorDataComFaultRT_0_C' => '0bxxx0xxxx',
    'Imu1TemperatureChl_SensorDataComFaultRT_1_C' => '0bxxx1xxxx',

    #rb_csim_ManagerState_ten
    #-----------------------------------
    #enum;rb_csim_ManagerState_ten;rb_csim_Idle_e;0;Idle state
    #enum;rb_csim_ManagerState_ten;rb_csim_Init_e;1;Initial state
    #enum;rb_csim_ManagerState_ten;rb_csim_ReadAsicSerialNumbers_e;2;Read ASIC serial numbers
    #enum;rb_csim_ManagerState_ten;rb_csim_SensorSpecificInits_e;3;
    #enum;rb_csim_ManagerState_ten;rb_csim_WaitForSensorInit_e;4;Wait for sensor initialization
    #enum;rb_csim_ManagerState_ten;rb_csim_VerifyInitFlags_e;5;Verify initial error and status flags
    #enum;rb_csim_ManagerState_ten;rb_csim_HandleChlFaultsPrevPoc_e;6;Handle channel faults stored in any previous power on cycles
    #enum;rb_csim_ManagerState_ten;rb_csim_HandleFaultsInInit_e;7;Handle sensor faults in initialization
    #enum;rb_csim_ManagerState_ten;rb_csim_PrepareSystemInitBG_e;8;Prepare system initialisation in background state
    #enum;rb_csim_ManagerState_ten;rb_csim_PrepareSystemInitRT_e;9;Prepare system initialisation in realtime state
    #enum;rb_csim_ManagerState_ten;rb_csim_SystemInit_e;10;System initialisation state
    #enum;rb_csim_ManagerState_ten;rb_csim_PrepareSteadyStateRT_e;11;Preparation of steady state (real-time actions)
    #enum;rb_csim_ManagerState_ten;rb_csim_SteadyState_e;12;Steady state
    #enum;rb_csim_ManagerState_ten;rb_csim_Disabled_e;13;Disabled state
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
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccXLg_e;0;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccXHgMon_e;1;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccYLg_e;2;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccYHgMon_e;3;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccYLgPlausi_e;4;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccZLg_e;5;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_RollRateLf_e;6;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_YawRateLf_e;7;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_YawRateLfPlausi_e;8;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_PitchRateLf_e;9;
    #
    #   ChlState API to Customer
    #---------------------------
    'AccXLgChl_State_U8'          => 'rb_csim_ChlState_aen(0)_U8',
    'AccXHgMonChl_State_U8'       => 'rb_csim_ChlState_aen(1)_U8',
    'AccYLgChl_State_U8'          => 'rb_csim_ChlState_aen(2)_U8',
    'AccYHgMonChl_State_U8'       => 'rb_csim_ChlState_aen(3)_U8',
    'AccZLgChl_State_U8'          => 'rb_csim_ChlState_aen(4)_U8',
    'AccZHgMonChl_State_U8'       => 'rb_csim_ChlState_aen(5)_U8',
    'RollRateLfChl_State_U8'      => 'rb_csim_ChlState_aen(6)_U8',
    'YawRateLfChl_State_U8'       => 'rb_csim_ChlState_aen(7)_U8',
    'PitchRateLfChl_State_U8'     => 'rb_csim_ChlState_aen(8)_U8',
    'Imu1TemperatureChl_State_U8' => 'rb_csim_ChlState_aen(9)_U8',
    'TemperatureChl_State_U8'     => 'rb_csim_ChlState_aen(9)_U8',
    'FrequencyCounter_State_U8'   => 'rb_csim_ChlState_aen(10)_U8',
    'PhaseCounter_State_U8'       => 'rb_csim_ChlState_aen(11)_U8',

    'AccXLgChl_State_V'            => 'rb_csim_ChlState_aen(0)',
    'AccXHgMonChl_State_V'         => 'rb_csim_ChlState_aen(1)',
    'AccYLgChl_State_V'            => 'rb_csim_ChlState_aen(2)',
    'AccYHgMonChl_State_V'         => 'rb_csim_ChlState_aen(3)',
    'AccZLgChl_State_V'            => 'rb_csim_ChlState_aen(4)',
    'AccZHgMonChl_State_V'         => 'rb_csim_ChlState_aen(5)',
    'RollRateLfChl_State_V'        => 'rb_csim_ChlState_aen(6)',
    'YawRateLfChl_State_V'         => 'rb_csim_ChlState_aen(7)',
    'PitchRateLfChl_State_V'       => 'rb_csim_ChlState_aen(8)',
    'Imu1TemperatureChl_State_V'   => 'rb_csim_ChlState_aen(9)',
    'TemperatureChl_State_V'       => 'rb_csim_ChlState_aen(9)',
    'FrequencyCounter_State_V'     => 'rb_csim_ChlState_aen(10)',
    'Imu1FrequencyCounter_State_V' => 'rb_csim_ChlState_aen(10)',

    #   ChlState API to Customer for Field calibration
    #---------------------------
    'FieldCalibration_AccXLgChl_State_U8'      => 'rb_sfc_FieldCalibDataAndStatus_ast(0).SensorChlDataStatus_en_U8',
    'FieldCalibration_AccYLgChl_State_U8'      => 'rb_sfc_FieldCalibDataAndStatus_ast(1).SensorChlDataStatus_en_U8',
    'FieldCalibration_AccZLgChl_State_U8'      => 'rb_sfc_FieldCalibDataAndStatus_ast(2).SensorChlDataStatus_en_U8',
    'FieldCalibration_RollRateLfChl_State_U8'  => 'rb_sfc_FieldCalibDataAndStatus_ast(3).SensorChlDataStatus_en_U8',
    'FieldCalibration_PitchRateLfChl_State_U8' => 'rb_sfc_FieldCalibDataAndStatus_ast(4).SensorChlDataStatus_en_U8',
    'FieldCalibration_YawRateLfChl_State_U8'   => 'rb_sfc_FieldCalibDataAndStatus_ast(5).SensorChlDataStatus_en_U8',

    #   ChlState API to Customer for Field calibration
    #---------------------------
    'FieldCalibration_AccXLgChl_State_V'      => 'rb_sfc_FieldCalibDataAndStatus_ast(0).SensorChlDataStatus_en',
    'FieldCalibration_AccYLgChl_State_V'      => 'rb_sfc_FieldCalibDataAndStatus_ast(1).SensorChlDataStatus_en',
    'FieldCalibration_AccZLgChl_State_V'      => 'rb_sfc_FieldCalibDataAndStatus_ast(2).SensorChlDataStatus_en',
    'FieldCalibration_RollRateLfChl_State_V'  => 'rb_sfc_FieldCalibDataAndStatus_ast(3).SensorChlDataStatus_en',
    'FieldCalibration_PitchRateLfChl_State_V' => 'rb_sfc_FieldCalibDataAndStatus_ast(4).SensorChlDataStatus_en',
    'FieldCalibration_YawRateLfChl_State_V'   => 'rb_sfc_FieldCalibDataAndStatus_ast(5).SensorChlDataStatus_en',

    #Monitoring Phase :
    'NotMonitored_C'               => 0,
    'InitMonitored_C'              => 1,
    'CyclicBGMonitored_C'          => 2,
    'CyclicSteadyStateMonitored_C' => 3,

    'InitCheckFailureCnt' => 'rb_csim_InitCheckFailureCnt_au8(0)_U8',

    #enum;rb_csem_ChannelState_ten;rb_csem_ChlInitInProgress_e;0;Channel initialization in progress
    #enum;rb_csem_ChannelState_ten;rb_csem_ChlNotConfigured_e;1;Channel not configured
    #enum;rb_csem_ChannelState_ten;rb_csem_ChlOk_e;2;Channel OK
    #enum;rb_csem_ChannelState_ten;rb_csem_ChlTemporaryError_e;3;Channel temporary error (out of spec)
    #enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorDueSensorErr_e;4;Channel permanent error (sensor perm flt)
    #enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorCyclThisPOC_e;5;Channel permanent error (cyclic this POC)
    #enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorCyclPrevPOC_e;6;Channel permanent error (cyclic prev POC)
    #enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorDueExtReq_e;7;Channel permanent error (external request, e.g. ASI)
    #enum;rb_csem_ChannelState_ten;rb_csem_ChlNotSupported_e;8;Channel is not supported
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

    # F1 Raw Mapping for customer fault status signal name on CAN
    'VDS_LinearSignalStatus'      => 'VDS_CANFDLinearSignalStatus',
    'VDS_LateralSignalStatus'     => 'VDS_CANFDLateralSignalStatus',
    'VDS_HeaveSignalStatus'       => 'VDS_CANFDHeaveSignalStatus',
    'VDS_YawSignalStatus'         => 'VDS_CANFDYawSignalStatus',
    'VDS_RollSignalStatus'        => 'VDS_CANFDRollSignalStatus',
    'VDS_PitchSignalStatus'       => 'VDS_CANFDPitchSignalStatus',
    'VDS_TemperatureSignalStatus' => 'TemperatureStatus',

    # Mapping for customer signal name on CAN
    'VDS_LinearSignalData'      => 'VDS_CANFDLinearSignalData',
    'VDS_LateralSignalData'     => 'VDS_CANFDLateralSignalData',
    'VDS_HeaveSignalData'       => 'VDS_CANFDHeaveSignalData',
    'VDS_YawSignalData'         => 'VDS_CANFDYawSignalData',
    'VDS_RollSignalData'        => 'VDS_CANFDRollSignalData',
    'VDS_PitchSignalData'       => 'VDS_CANFDPitchSignalData',
    'VDS_TemperatureSignalData' => 'VDS_CANFDTemperatureSignalData',

    # F1 Calibrated Mapping for customer fault status signal name on CAN
    'VDS2_LinearSignalStatus'  => 'VDS2_CANFDLinearSignalStatus',
    'VDS2_LateralSignalStatus' => 'VDS_CalibLateralSignalstatus',
    'VDS2_HeaveSignalStatus'   => 'VDS2_CANFDHeaveSignalStatus',
    'VDS2_YawSignalStatus'     => 'VDS_CalibYawSignalstatus',
    'VDS2_RollSignalStatus'    => 'VDS2_CANFDRollSignalStatus',
    'VDS2_PitchSignalStatus'   => 'VDS2_CANFDPitchSignalStatus',

    # Mapping for customer signal name on CAN
    'VDS2_LinearSignalData'  => 'VDS_CANFDLinearSignalData',
    'VDS2_LateralSignalData' => 'VDS_CalibLateralSignalData',
    'VDS2_HeaveSignalData'   => 'VDS2_CANFDHeaveSignalData',
    'VDS2_YawSignalData'     => 'VDS_CalibYawSignalData',
    'VDS2_RollSignalData'    => 'VDS_CANFDRollSignalData',
    'VDS2_PitchSignalData'   => 'VDS2_CANFDPitchSignalData',

    # F2 Raw Mapping for customer fault status signal name on CAN
    'VDS3_LinearSignalStatus'  => 'VDS2_CANFDLinearSignalStatus',
    'VDS3_LateralSignalStatus' => 'VDS2_CANFDLateralSignalStatus',
    'VDS3_HeaveSignalStatus'   => 'VDS2_CANFDHeaveSignalStatus',
    'VDS3_YawSignalStatus'     => 'VDS2_CANFDYawSignalStatus',
    'VDS3_RollSignalStatus'    => 'VDS2_CANFDRollSignalStatus',
    'VDS3_PitchSignalStatus'   => 'VDS2_CANFDPitchSignalStatus',

    # Mapping for customer signal name on CAN
    'VDS3_LinearSignalData'  => 'VDS2_CANFDLinearSignalData',
    'VDS3_LateralSignalData' => 'VDS2_CANFDLateralSignalData',
    'VDS3_HeaveSignalData'   => 'VDS2_CANFDHeaveSignalData',
    'VDS3_YawSignalData'     => 'VDS2_CANFDYawSignalData',
    'VDS3_RollSignalData'    => 'VDS2_CANFDRollSignalData',
    'VDS3_PitchSignalData'   => 'VDS2_CANFDPitchSignalData',

    # Mapping for customer VIN signal name on CAN
    'CAN_VIN_Signal' => 'GGCC_Id',

    # VDS CAN signal evaluation
    # VDS CAN signal evaluation
    'AccLgSfh_1' => 3997,    #5000Lsb/g in CA project
    'AccLgSfh_2' => 2997,    #5000Lsb/g in CA project
    'AccLgSfh_3' => 1997,    #5000Lsb/g in CA project

    'F1_Raw_AccLg_1' => 0.9994,    #5000Lsb/g in CA project
    'F1_Raw_AccLg_2' => 0.7994,    #5000Lsb/g in CA project
    'F1_Raw_AccLg_3' => 0.5994,    #5000Lsb/g in CA project
    'F1_Raw_AccLg_4' => 0.3994,    #5000Lsb/g in CA project

    'F1_Calibrated_AccLg_1' => 0.9994,    #5000Lsb/g in CA project
    'F1_Calibrated_AccLg_2' => 0.7994,    #5000Lsb/g in CA project
    'F1_Calibrated_AccLg_3' => 0.5994,    #5000Lsb/g in CA project
    'F1_Calibrated_AccLg_4' => 0.3994,    #5000Lsb/g in CA project

    'F2_Raw_AccLg_1' => 0.9984,           #5000Lsb/g in CA project
    'F2_Raw_AccLg_2' => 0.7988,           #5000Lsb/g in CA project
    'F2_Raw_AccLg_3' => 0.599,            #5000Lsb/g in CA project
    'F2_Raw_AccLg_4' => 0.3994,           #5000Lsb/g in CA project

    'F1_Raw_YLg_AccThdValue1g_C'        => 0.9994,
    'F1_Calibrated_YLg_AccThdValue1g_C' => 0.8524,
    'F2_Raw_YLg_AccThdValue1g_C'        => 0.9984,    #1g

    'F1_Raw_YLg_AccThdValue2g_C'        => 2.0006,
    'F1_Calibrated_YLg_AccThdValue2g_C' => 1.8536,
    'F2_Raw_YLg_AccThdValue2g_C'        => 1.9968,

    'F1_Raw_YLg_AccThdValue3g_C'        => 3.0006,    #3g -> 5000Lsb/g in CA project
    'F1_Calibrated_YLg_AccThdValue3g_C' => 2.8536,    #3g -> 5000Lsb/g in CA project
    'F2_Raw_YLg_AccThdValue3g_C'        => 2.9952,    #3g -> 5000Lsb/g in CA project

    'F1_Raw_ZLg_AccThdValue4g_C'        => 3.8536,    #4g -> 5000Lsb/g in CA project
    'F1_Calibrated_ZLg_AccThdValue4g_C' => 3.8536,    #4g -> 5000Lsb/g in CA project
    'F2_Raw_ZLg_AccThdValue4g_C'        => 3.8536,    #4g -> 5000Lsb/g in CA project

    'AccThdInitAbsOffset_C' => 2.8536,                #3g, 5000Lsb/g in CA project

    'YLg_AccThdValue1g_C'  => 0.8524,                 #1g -> 5000Lsb/g in CA project
    'YLg_AccThdValue_1g_C' => 0.8536,                 #1g -> 5000Lsb/g in CA project
    'YLg_AccThdValue_C'    => 1.8536,                 #2g -> 5000Lsb/g in CA project

    'F1_Raw_ZLg_AccThdValue3_4g_C'        => 3.4006,  #5000Lsb/g in CA project
    'F1_Calibrated_ZLg_AccThdValue3_4g_C' => 3.2536,  #5000Lsb/g in CA project
    'F2_Raw_ZLg_AccThdValue3_4g_C'        => 3.3946,  #5000Lsb/g in CA project

    'F1_Raw_Yaw_RateThdValue150gps_C'        => 150.03,    #100grad/s in CA project
    'F1_Calibrated_Yaw_RateThdValue150gps_C' => 148.03,    #100grad/s in CA project
    'F2_Raw_Yaw_RateThdValue150gps_C'        => 149.76,    #100grad/s in CA project

    'F1_Raw_Roll_RateThdValue150gps_C'        => 147.03,   #100grad/s in CA project
    'F1_Calibrated_Roll_RateThdValue150gps_C' => 147.03,   #100grad/s in CA project
    'F2_Raw_Roll_RateThdValue150gps_C'        => 147.03,   #100grad/s in CA project

    'F1_Raw_Roll_RateThdValue160gps_C' => 160.03,          #100grad/s in CA project
                                                           #'F1_Calibrated_Roll_RateThdValue160gps_C' 	=> 157.03, #100grad/s in CA project
    'F2_Raw_Roll_RateThdValue160gps_C' => 159.75,          #100grad/s in CA project

    'F1_Raw_Pitch_RateThdValue50gps_C'        => 49.97,    #100grad/s in CA project
    'F1_Calibrated_Pitch_RateThdValue50gps_C' => 46.97,    #100grad/s in CA project
    'F2_Raw_Pitch_RateThdValue50gps_C'        => 49.9,     #100grad/s in CA project

    'F1_Raw_Pitch_RateThdValue60gps_C' => 59.97,           #100grad/s in CA project
                                                           #'F1_Calibrated_Pitch_RateThdValue60gps_C' 	=> 56.97, #100grad/s in CA project
    'F2_Raw_Pitch_RateThdValue60gps_C' => 59.9,            #100grad/s in CA project

    'F1_Raw_YawRateThdValue_SignalMon_Clipping_C'        => 103.03,    #100grad/s in CA project
    'F1_Calibrated_YawRateThdValue_SignalMon_Clipping_C' => 101.03,    #100grad/s in CA project
    'F2_Raw_YawRateThdValue_SignalMon_Clipping_C'        => 102.84,    #100grad/s in CA project

    'F1_Raw_YawRateThdValue_SignalMon_NegClipping_C'        => -103.03,    #100grad/s in CA project
    'F1_Calibrated_YawRateThdValue_SignalMon_NegClipping_C' => -101.03,    #100grad/s in CA project
    'F2_Raw_YawRateThdValue_SignalMon_NegClipping_C'        => -102.84,    #100grad/s in CA project

    'F1_Raw_LateralClippingConstant_C'        => 5.2006,
    'F1_Calibrated_LateralClippingConstant_C' => 5.0536,
    'F2_Raw_LateralClippingConstant_C'        => 5.1916,

    'F1_Raw_LateralClippingNegConstant_C'        => -5.2006,
    'F1_Calibrated_LateralClippingNegConstant_C' => -5.3476,
    'F2_Raw_LateralClippingNegConstant_C'        => -5.1916,

    'RateSfh_1' => 14997,                                                  #100grad/s in CA project
    'RateSfh_2' => 19997,                                                  #100grad/s in CA project
    'RateSfh_3' => 24997,                                                  #100grad/s in CA project

    'F1_Raw_YawrateLfChl_Rate_1' => 100.03,                                #100grad/s in CA project
    'F1_Raw_YawrateLfChl_Rate_2' => 149.97,                                #100grad/s in CA project
    'F1_Raw_YawrateLfChl_Rate_3' => 199.97,                                #100grad/s in CA project
    'F1_Raw_YawrateLfChl_Rate_4' => 249.97,                                #100grad/s in CA project

    'F1_Calibrated_YawrateLfChl_Rate_1' => 100.03,                         #100grad/s in CA project
    'F1_Calibrated_YawrateLfChl_Rate_2' => 149.97,                         #100grad/s in CA project
    'F1_Calibrated_YawrateLfChl_Rate_3' => 199.97,                         #100grad/s in CA project
    'F1_Calibrated_YawrateLfChl_Rate_4' => 249.97,                         #100grad/s in CA project

    'F2_Raw_YawrateLfChl_Rate_1' => 99.84,                                 #100grad/s in CA project
    'F2_Raw_YawrateLfChl_Rate_2' => 149.76,                                #100grad/s in CA project
    'F2_Raw_YawrateLfChl_Rate_3' => 199.68,                                #100grad/s in CA project
    'F2_Raw_YawrateLfChl_Rate_4' => 249.6,                                 #100grad/s in CA project

    'Rate_C' => 296.03,

## Time stamp reference to evaluate VDS signals on CAN##
    'TimeStampRef1_C' => -0.1,

## Threshold constant for reference
    'AccRefThd1g_C'      => 1,                                             #1g -> 5000Lsb/g in CA project
    'AccRefThd1_4g_C'    => 1.4,                                           #1g -> 5000Lsb/g in CA project
    'RateRefThd100gps_C' => 60,                                            #1g -> 5000Lsb/g in CA project
    'RateRefThd50gps_C'  => 80,                                            #1g -> 5000Lsb/g in CA project

    'Yaw_RateRefThd100gps_C' => 60,                                        #1g -> 5000Lsb/g in CA project
    'Yaw_RateRefThd50gps_C'  => 80,                                        #1g -> 5000Lsb/g in CA project

    'Roll_RateRefThd100gps_C' => 60,                                       #1g -> 500Lsb/g in CA project
    'Roll_RateRefThd50gps_C'  => 80,                                       #1g -> 500Lsb/g in CA project

##NhtsaData for rb_csem_SensorDataRT_st.ChannelValue_as16
    'Nhtsadata_Rate32000_C'    => 32000,
    'Nhtsadata_RateNeg32000_C' => -32000,
    'Nhtsadata_Rate10300_C'    => 10300,                                   #(Value- Fieldcalib_offset_for_RateChannels) and if Field calibartion is not applicable then Channel value is same as Manipulated value
    'Nhtsadata_RateNeg10300_C' => -10300,                                  #(Value- Fieldcalib_offset_for_RateChannels) and if Field calibartion is not applicable then Channel value is same as Manipulated value

    'Nhtsadata_Acc26000_C'    => 26000,                                    #(Value- Fieldcalib_offset_for_RateChannels) and if Field calibartion is not applicable then Channel value is same as Manipulated valueu)
    'Nhtsadata_AccNeg26000_C' => -26000,

    'AccXHgMonChl_NHTSA_Data_1g_C'      => 5000,
    'AccXHgMonChl_NHTSA_Data_64g_C'     => 32000,
    'AccXHgMonChl_NHTSA_Data_Neg_1g_C'  => -5000,
    'AccXHgMonChl_NHTSA_Data_Neg_64g_C' => -32000,
    'AccYHgMonChl_NHTSA_Data_1g_C'      => 5000,
    'AccYHgMonChl_NHTSA_Data_64g_C'     => 32000,
    'AccYHgMonChl_NHTSA_Data_Neg_1g_C'  => -5000,
    'AccYHgMonChl_NHTSA_Data_Neg_64g_C' => -32000,

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

    'AccXHgMonChl_NHTSA_Data_20g_C'     => 10000,
    'AccXHgMonChl_NHTSA_Data_64g_C'     => 32000,
    'AccXHgMonChl_NHTSA_Data_Neg_20g_C' => -10000,
    'AccXHgMonChl_NHTSA_Data_Neg_64g_C' => -32000,

    'AccYHgMonChl_NHTSA_Data_20g_C'     => 10000,
    'AccYHgMonChl_NHTSA_Data_64g_C'     => 32000,
    'AccYHgMonChl_NHTSA_Data_Neg_20g_C' => -10000,
    'AccYHgMonChl_NHTSA_Data_Neg_64g_C' => -32000,

##Threshold Values During Sensor Initialization
    'LinearSignal_Zero_Thd_C'   => 0,
    'LateralSignal_Zero_Thd_C'  => 0,
    'VerticalSignal_Zero_Thd_C' => 0,    #in CA ZLg will have -1g as default thd
    'YawSignal_Zero_Thd_C'      => 0,
    'RollSignal_Zero_Thd_C'     => 0,
    'PitchSignal_Zero_Thd_C'    => 0,

##OutputBuffer values
    'SFH_Value_2g_F1_AccXLgChl'     => 10003,
    'SFH_Value_2g_F1_RollRateLfChl' => 10003,
    'SFH_Value_2g_F1_AccYLgChl'     => 10003,
    'SFH_Value_150gps_F1_YawRate'   => 15003,

    'SFH_Value_1g_F1_AccYLgChl' => 4997,
    'SFH_Value_1g_F2_AccYLgChl' => 4992,

    'FieldCalibValue_AccXLgChl' => 735,
    'FieldCalibValue_AccYLgChl' => 735,
    'FieldCalibValue_RollRate'  => 200,
    'FieldCalibValue_YawRate'   => 200,

    'PlantCalibValue_AccXLgChl' => 0,    #Dummy values are defined for plant calib data as on current.
    'PlantCalibValue_RollRate'  => 0,
    'PlantCalibValue_AccYLgChl' => 0,
    'PlantCalibValue_YawRate'   => 0,

    'SFH_Value_2g_F2_AccXLgChl'   => 9984,
    'SFH_Value_2g_F2_AccYLgChl'   => 9984,
    'SFH_Value_2g_F2_RollRateLfC' => 10001,
    'SFH_Value_150gps_F2_YawRate' => 14976,

    #enum;rb_sfh_FilterChlList_ten;rb_sfh_AccXLg15HzCS_e;0;
    #enum;rb_sfh_FilterChlList_ten;rb_sfh_AccYLg15HzCS_e;1;
    #enum;rb_sfh_FilterChlList_ten;rb_sfh_AccZLg15HzCS_e;2;
    #enum;rb_sfh_FilterChlList_ten;rb_sfh_RollRate15HzCS_e;3;
    #enum;rb_sfh_FilterChlList_ten;rb_sfh_PitchRate15HzCS_e;4;
    #enum;rb_sfh_FilterChlList_ten;rb_sfh_YawRate15HzCS_e;5;
    #
    #   ChlState API to Customer CAN interface
    #-----------------------------------------
    'AccXLgChl_State_sfh_U8'      => 'rb_sfh_SensChlState_aen(0)_U8',
    'AccYLgChl_State_sfh_U8'      => 'rb_sfh_SensChlState_aen(1)_U8',
    'AccZLgChl_State_sfh_U8'      => 'rb_sfh_SensChlState_aen(2)_U8',
    'RollRateLfChl_State_sfh_U8'  => 'rb_sfh_SensChlState_aen(3)_U8',
    'PitchRateLfChl_State_sfh_U8' => 'rb_sfh_SensChlState_aen(4)_U8',
    'YawRateLfChl_State_sfh_U8'   => 'rb_sfh_SensChlState_aen(5)_U8',

    ##RollingCounter
    'Sensor_RollingCounter_sfh_U8' => 'rb_sfh_RollingCounter_u8_U8',

    'AccXLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(0)_S16',
    'AccYLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(1)_S16',
    'AccZLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(2)_S16',
    'RollRateLfChl_OutputBuffer_sfh_S16'  => 'rb_sfh_OutputBuffer_s16(3)_S16',
    'PitchRateLfChl_OutputBuffer_sfh_S16' => 'rb_sfh_OutputBuffer_s16(4)_S16',
    'YawRateLfChl_OutputBuffer_sfh_S16'   => 'rb_sfh_OutputBuffer_s16(5)_S16',
    'rb_csim_SamplingCounterRT_S16'       => 'rb_csim_SamplingCounterRT_u16_U16',

    #******************************************************************************
    #                          Sensor channels
    #******************************************************************************
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccXLg_e;0;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccXHgMon_e;1;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccYLg_e;2;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccYHgMon_e;3;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccYLgPlausi_e;4;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_AccZLg_e;5;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_RollRateLf_e;6;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_YawRateLf_e;7;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_YawRateLfPlausi_e;8;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_PitchRateLf_e;9;
    #
    #   RawData_U8
    #-------------
    'AccXLgChl_RawData_U8'        => 'rb_csic_RtComRxPayload_au16(0)_U8',
    'AccXHgMonChl_RawData_U8'     => 'rb_csic_RtComRxPayload_au16(1)_U8',
    'AccYLgChl_RawData_U8'        => 'rb_csic_RtComRxPayload_au16(2)_U8',
    'AccYHgMonChl_RawData_U8'     => 'rb_csic_RtComRxPayload_au16(3)_U8',
    'AccZLgChl_RawData_U8'        => 'rb_csic_RtComRxPayload_au16(4)_U8',
    'AccZHgMonChl_RawData_U8'     => 'rb_csic_RtComRxPayload_au16(5)_U8',
    'RollRateLfChl_RawData_U8'    => 'rb_csic_RtComRxPayload_au16(6)_U8',
    'YawRateLfChl_RawData_U8'     => 'rb_csic_RtComRxPayload_au16(7)_U8',
    'PitchRateLfChl_RawData_U8'   => 'rb_csic_RtComRxPayload_au16(8)_U8',
    'TemperatureChl_RawData_U8'   => 'rb_csic_RtComRxPayload_au16(9)_U8',
    'FrequencyCounter_RawData_U8' => 'rb_csic_RtComRxPayload_au16(10)_U8',
    'PhaseCounter_RawData_U8'     => 'rb_csic_RtComRxPayload_au16(11)_U8',
    #
    #   RawData_U16
    #--------------
    'AccXLgChl_RawData_S16'        => 'rb_csic_RtComRxPayload_au16(0)_S16',
    'AccXHgMonChl_RawData_S16'     => 'rb_csic_RtComRxPayload_au16(1)_S16',
    'AccYLgChl_RawData_S16'        => 'rb_csic_RtComRxPayload_au16(2)_S16',
    'AccYHgMonChl_RawData_S16'     => 'rb_csic_RtComRxPayload_au16(3)_S16',
    'AccZLgChl_RawData_S16'        => 'rb_csic_RtComRxPayload_au16(4)_S16',
    'AccZHgMonChl_RawData_S16'     => 'rb_csic_RtComRxPayload_au16(5)_S16',
    'RollRateLfChl_RawData_S16'    => 'rb_csic_RtComRxPayload_au16(6)_S16',
    'YawRateLfChl_RawData_S16'     => 'rb_csic_RtComRxPayload_au16(7)_S16',
    'PitchRateLfChl_RawData_S16'   => 'rb_csic_RtComRxPayload_au16(8)_S16',
    'TemperatureChl_RawData_S16'   => 'rb_csic_RtComRxPayload_au16(9)_S16',
    'FrequencyCounter_RawData_S16' => 'rb_csic_RtComRxPayload_au16(10)_S16',
    'PhaseCounter_RawData_S16'     => 'rb_csic_RtComRxPayload_au16(11)_S16',
    #
    #	RawData_V
    #------------
    'AccXLgChl_RawData_V'          => 'rb_csic_RtComRxPayload_au16(0)',
    'AccXHgMonChl_RawData_V'       => 'rb_csic_RtComRxPayload_au16(1)',
    'AccYLgChl_RawData_V'          => 'rb_csic_RtComRxPayload_au16(2)',
    'AccYHgMonChl_RawData_V'       => 'rb_csic_RtComRxPayload_au16(3)',
    'AccZLgChl_RawData_V'          => 'rb_csic_RtComRxPayload_au16(4)',
    'AccZHgMonChl_RawData_V'       => 'rb_csic_RtComRxPayload_au16(5)',
    'RollRateLfChl_RawData_V'      => 'rb_csic_RtComRxPayload_au16(6)',
    'YawRateLfChl_RawData_V'       => 'rb_csic_RtComRxPayload_au16(7)',
    'PitchRateLfChl_RawData_V'     => 'rb_csic_RtComRxPayload_au16(8)',
    'Imu1TemperatureChl_RawData_V' => 'rb_csic_RtComRxPayload_au16(9)',
    'FrequencyCounter_RawData_V'   => 'rb_csic_RtComRxPayload_au16(10)',
    'PhaseCounter_RawData_V'       => 'rb_csic_RtComRxPayload_au16(11)',

    #	 Processed data for Algo
    #---------------------------
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXLg_e;3;IMU_ax_lowG
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXHgMon_e;4;IMU_ax_midG
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYLg_e;5;IMU_ay_lowG
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYHgMon_e;6;IMU_ay_midG
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZLg_e;7;IMU_az_lowG
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZHgMon_e;8;IMU_az_midG
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_RollRateLf_e;9;IMU_rateX
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_YawRateLf_e;10;IMU_rateZ
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_PitchRateLf_e;11;IMU_rateY
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu1Temperature_e;12;IMU_Temperature
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXLgPlausi_e;13;IMU_ax_lowG_HPS
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccXHgMonPlausi_e;14;IMU_ax_midG_HPS
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYLgPlausi_e;15;IMU_ay_lowG_HPS
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccYHgMonPlausi_e;16;IMU_ay_midG_HPS
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZLgPlausi_e;17;IMU_az_lowG_HPS
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_AccZHgMonPlausi_e;18;IMU_az_midG_HPS
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_RollRateLfPlausi_e;19;IMU_rateX_HPS
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_YawRateLfPlausi_e;20;IMU_rateZ_HPS
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_PitchRateLfPlausi_e;21;IMU_rateY_HPS
    # enum;rb_csem_CentralSensorChannels_ten;rb_csem_Imu2Temperature_e;22;IMU_Temperature_HPS
    #
    'AccXLgChl_NhtsaData_S16'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(3)_S16',
    'AccXHgMonChl_NhtsaData_S16'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(4)_S16',
    'AccYLgChl_NhtsaData_S16'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(5)_S16',
    'AccYHgMonChl_NhtsaData_S16'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(6)_S16',
    'AccZLgChl_NhtsaData_S16'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(7)_S16',
    'AccZHgMonChl_NhtsaData_S16'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(8)_S16',
    'RollRateLfChl_NhtsaData_S16'    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(9)_S16',
    'YawRateLfChl_NhtsaData_S16'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(10)_S16',
    'PitchRateLfChl_NhtsaData_S16'   => 'rb_csem_SensorDataRT_st.ChannelValue_as16(11)_S16',
    'Imu1Temperature_NhtsaData_S16'  => 'rb_csem_SensorDataRT_st.ChannelValue_as16(12)_S16',
    'TemperatureChl_NhtsaData_S16'   => 'rb_csem_SensorDataRT_st.ChannelValue_as16(12)_S16',
    'FrequencyCounter_NhtsaData_S16' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(13)_S16',
    'PhaseCounter_NhtsaData_S16'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(14)_S16',

    'AccXLgChl_NhtsaData_V'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(3)',
    'AccXHgMonChl_NhtsaData_V'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(4)',
    'AccYLgChl_NhtsaData_V'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(5)',
    'AccYHgMonChl_NhtsaData_V'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(6)',
    'AccZLgChl_NhtsaData_V'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(7)',
    'AccZHgMonChl_NhtsaData_V'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(8)',
    'RollRateLfChl_NhtsaData_V'    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(9)',
    'YawRateLfChl_NhtsaData_V'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(10)',
    'PitchRateLfChl_NhtsaData_V'   => 'rb_csem_SensorDataRT_st.ChannelValue_as16(11)',
    'Imu1Temperature_NhtsaData_V'  => 'rb_csem_SensorDataRT_st.ChannelValue_as16(12)',
    'TemperatureChl_NhtsaData_V'   => 'rb_csem_SensorDataRT_st.ChannelValue_as16(12)',
    'FrequencyCounter_NhtsaData_V' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(13)',
    'PhaseCounter_NhtsaData_V'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(14)',

############################################################################################################################################################

##Time Stamp status
    #SMI970 F1
    'IMU1_AccXLgChl_TimeStampStatus_U8'        => 'rb_sth_SensorDataAge_ast(0).TimeStatus_en_U8',
    'IMU1_AccYLgChl_TimeStampStatus_U8'        => 'rb_sth_SensorDataAge_ast(1).TimeStatus_en_U8',
    'IMU1_AccZLgChl_TimeStampStatus_U8'        => 'rb_sth_SensorDataAge_ast(2).TimeStatus_en_U8',
    'IMU1_RollRateLfChl_TimeStampStatus_U8'    => 'rb_sth_SensorDataAge_ast(3).TimeStatus_en_U8',
    'IMU1_PitchRateLfChl_TimeStampStatus_U8'   => 'rb_sth_SensorDataAge_ast(4).TimeStatus_en_U8',
    'IMU1_YawRateLfChl_TimeStampStatus_U8'     => 'rb_sth_SensorDataAge_ast(5).TimeStatus_en_U8',
    'IMU1_FrequencyCounter_TimeStampStatus_U8' => 'rb_sth_SensorDataAge_ast(5).TimeStatus_en_U8',

    'IMU1_AccXLgChl_TimeStampStatus'      => 'rb_sth_SensorDataAge_ast(0).TimeStatus_en',
    'IMU1_AccYLgChl_TimeStampStatus'      => 'rb_sth_SensorDataAge_ast(1).TimeStatus_en',
    'IMU1_AccZLgChl_TimeStampStatus'      => 'rb_sth_SensorDataAge_ast(2).TimeStatus_en',
    'IMU1_RollRateLfChl_TimeStampStatus'  => 'rb_sth_SensorDataAge_ast(3).TimeStatus_en',
    'IMU1_PitchRateLfChl_TimeStampStatus' => 'rb_sth_SensorDataAge_ast(4).TimeStatus_en',
    'IMU1_YawRateLfChl_TimeStampStatus'   => 'rb_sth_SensorDataAge_ast(5).TimeStatus_en',

    #SMI970	F2
    'IMU1_F2_AccXLgChl_TimeStampStatus'      => 'rb_sth_SensorDataAge_ast(6).TimeStatus_en_U8',
    'IMU1_F2_AccYLgChl_TimeStampStatus'      => 'rb_sth_SensorDataAge_ast(7).TimeStatus_en_U8',
    'IMU1_F2_AccZLgChl_TimeStampStatus'      => 'rb_sth_SensorDataAge_ast(8).TimeStatus_en_U8',
    'IMU1_F2_RollRateLfChl_TimeStampStatus'  => 'rb_sth_SensorDataAge_ast(9).TimeStatus_en_U8',
    'IMU1_F2_PitchRateLfChl_TimeStampStatus' => 'rb_sth_SensorDataAge_ast(10).TimeStatus_en_U8',
    'IMU1_F2_YawRateLfChl_TimeStampStatus'   => 'rb_sth_SensorDataAge_ast(11).TimeStatus_en_U8',

    #SMU300 F1
    # 'IMU2_AccXLgChl_TimeStampStatus'		=> 'rb_sth_SensorDataAge_ast(12).TimeStatus_en_U8',
    # 'IMU2_AccYLgChl_TimeStampStatus'		=> 'rb_sth_SensorDataAge_ast(13).TimeStatus_en_U8',
    # 'IMU2_AccZLgChl_TimeStampStatus'		=> 'rb_sth_SensorDataAge_ast(14).TimeStatus_en_U8',
    # 'IMU2_RollRateLfChl_TimeStampStatus'	=> 'rb_sth_SensorDataAge_ast(15).TimeStatus_en_U8',
    # 'IMU2_PitchRateLfChl_TimeStampStatus'	=> 'rb_sth_SensorDataAge_ast(16).TimeStatus_en_U8',
    # 'IMU2_YawRateLfChl_TimeStampStatus'		=> 'rb_sth_SensorDataAge_ast(17).TimeStatus_en_U8',
    #**************************************************************************************************
##Output buffer
    #SMI970 F1
    'AccXLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(0)_S16',
    'AccYLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(1)_S16',
    'AccZLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(2)_S16',
    'RollRateLfChl_OutputBuffer_sfh_S16'  => 'rb_sfh_OutputBuffer_s16(3)_S16',
    'PitchRateLfChl_OutputBuffer_sfh_S16' => 'rb_sfh_OutputBuffer_s16(4)_S16',
    'YawRateLfChl_OutputBuffer_sfh_S16'   => 'rb_sfh_OutputBuffer_s16(5)_S16',

    'AccXLgChl_OutputBuffer_sfh'      => 'rb_sfh_OutputBuffer_s16(0)',
    'AccYLgChl_OutputBuffer_sfh'      => 'rb_sfh_OutputBuffer_s16(1)',
    'AccZLgChl_OutputBuffer_sfh'      => 'rb_sfh_OutputBuffer_s16(2)',
    'RollRateLfChl_OutputBuffer_sfh'  => 'rb_sfh_OutputBuffer_s16(3)',
    'PitchRateLfChl_OutputBuffer_sfh' => 'rb_sfh_OutputBuffer_s16(4)',
    'YawRateLfChl_OutputBuffer_sfh'   => 'rb_sfh_OutputBuffer_s16(5)',

    #SMI970 F2
    'AccXLgChl_F2_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(12)_S16',
    'AccYLgChl_F2_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(13)_S16',
    'AccZLgChl_F2_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(14)_S16',
    'RollRateLfChl_F2_OutputBuffer_sfh_S16'  => 'rb_sfh_OutputBuffer_s16(15)_S16',
    'PitchRateLfChl_F2_OutputBuffer_sfh_S16' => 'rb_sfh_OutputBuffer_s16(16)_S16',
    'YawRateLfChl_F2_OutputBuffer_sfh_S16'   => 'rb_sfh_OutputBuffer_s16(17)_S16',

    'AccXLgChl_F2_OutputBuffer_sfh'      => 'rb_sfh_OutputBuffer_s16(12)',
    'AccYLgChl_F2_OutputBuffer_sfh'      => 'rb_sfh_OutputBuffer_s16(13)',
    'AccZLgChl_F2_OutputBuffer_sfh'      => 'rb_sfh_OutputBuffer_s16(14)',
    'RollRateLfChl_F2_OutputBuffer_sfh'  => 'rb_sfh_OutputBuffer_s16(15)',
    'PitchRateLfChl_F2_OutputBuffer_sfh' => 'rb_sfh_OutputBuffer_s16(16)',
    'YawRateLfChl_F2_OutputBuffer_sfh'   => 'rb_sfh_OutputBuffer_s16(17)',

    #******************************************************************************
    #                                Sensor data
    #******************************************************************************
    #enum;rb_sycc_Smi7Sensors_ten;rb_sycc_InertialSensor1_e;0;First inertial sensor
    #enum;rb_sycc_Smi7Sensors_ten;rb_sycc_InertialSensor2_e;1;Second inertial sensor
    #enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorMax_e;2;Max Value
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
    #'InertialSensor1_Temp1_U8'			=> 'rb_csic_StatusData_ast(0).Temperat1_s16_U8',
    'InertialSensor1_Temp1_U8'  => 'rb_csic_StatusData_ast(0).Temperature_s16_U8',
    'InertialSensor2_Temp1_U8'  => 'rb_csic_StatusData_ast(1).Temperat1_s16_U8',
    'InertialSensor1_Temp1_S16' => 'rb_csic_StatusData_ast(0).Temperature_s16_S16',
    'InertialSensor2_Temp1_S16' => 'rb_csic_StatusData_ast(1).Temperat1_s16_S16',

    #	 Temperature_2
    #---------------

    'InertialSensor1_Temp2_S16' => 'rb_csem_StoreTemperature2Value_as16(0)_S16',
    'InertialSensor2_Temp2_S16' => 'rb_csem_StoreTemperature2Value_as16(1)_S16',

    #	 ClusterFlags stored in Field Claim Data area
    #------------------------------------------------
    'InertialSensor1_ClusterFlags_EE_U8' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ClustFlg_u16_U8',
    'InertialSensor2_ClusterFlags_EE_U8' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ClustFlg_u16_U8',

    #	 ErrorFlags stored in Field Claim Data area
    #----------------------------------------------
    'InertialSensor1_ErrorFlag0_EE_U16' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(0)_U16',
    'InertialSensor1_ErrorFlag1_EE_U16' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(1)_U16',
    'InertialSensor1_ErrorFlag2_EE_U16' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(2)_U16',
    'InertialSensor1_ErrorFlag3_EE_U16' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(3)_U16',
    'InertialSensor1_ErrorFlag4_EE_U16' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(4)_U16',
    'InertialSensor1_ErrorFlag5_EE_U16' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(5)_U16',
    'InertialSensor1_ErrorFlag6_EE_U16' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(6)_U16',
    'InertialSensor1_ErrorFlag7_EE_U16' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(7)_U16',
    'InertialSensor1_ErrorFlag8_EE_U16' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(8)_U16',
    'InertialSensor1_ErrorFlag9_EE_U16' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(9)_U16',

    #	 Temperature stored in Field Claim Data area
    #-----------------------------------------------
    'InertialSensor1_Temp1_EE_U8' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).Temperature_s16_U8',
    'InertialSensor2_Temp1_EE_U8' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).Temperature_s16_U8',

    #	AsicSerialNr
    #---------------
    'InertialSensor1_AsicSerialNr0_V' => 'rb_csim_AsicIdData_ast(0).AsicSerialNr_au16(0)',
    'InertialSensor1_AsicSerialNr1_V' => 'rb_csim_AsicIdData_ast(0).AsicSerialNr_au16(1)',
    'InertialSensor1_AsicSerialNr2_V' => 'rb_csim_AsicIdData_ast(0).AsicSerialNr_au16(2)',
    'InertialSensor2_AsicSerialNr0_V' => 'rb_csim_AsicIdData_ast(1).AsicSerialNr_au16(0)',
    'InertialSensor2_AsicSerialNr1_V' => 'rb_csim_AsicIdData_ast(1).AsicSerialNr_au16(1)',
    'InertialSensor2_AsicSerialNr2_V' => 'rb_csim_AsicIdData_ast(1).AsicSerialNr_au16(2)',

    #	SmiSerialNr
    #--------------
    'InertialSensor1_SmiSerialNr0_V' => 'rb_csim_AsicIdData_ast(0).SmiSerialNr_au16(0)',
    'InertialSensor1_SmiSerialNr1_V' => 'rb_csim_AsicIdData_ast(0).SmiSerialNr_au16(1)',
    'InertialSensor1_SmiSerialNr2_V' => 'rb_csim_AsicIdData_ast(0).SmiSerialNr_au16(2)',
    'InertialSensor2_SmiSerialNr0_V' => 'rb_csim_AsicIdData_ast(1).SmiSerialNr_au16(0)',
    'InertialSensor2_SmiSerialNr1_V' => 'rb_csim_AsicIdData_ast(1).SmiSerialNr_au16(1)',
    'InertialSensor2_SmiSerialNr2_V' => 'rb_csim_AsicIdData_ast(1).SmiSerialNr_au16(2)',

    #	FieldClaimDataEe ClusterFlags
    #--------------------------------
    'InertialSensor1_ClusterFlags_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ClustFlg_u16',
    'InertialSensor2_ClusterFlags_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ClustFlg_u16',

    #	FieldClaimDataEe Temperature
    #-------------------------------
    'InertialSensor1_Temperature_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).Temperature_s16',
    'InertialSensor2_Temperature_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).Temperature_s16',

    #	FieldClaimDataEe ErrorFlags
    #------------------------------
    'InertialSensor1_ErrorFlag0_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(0)',
    'InertialSensor1_ErrorFlag1_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(1)',
    'InertialSensor1_ErrorFlag2_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(2)',
    'InertialSensor1_ErrorFlag3_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(3)',
    'InertialSensor1_ErrorFlag4_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(4)',
    'InertialSensor1_ErrorFlag5_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(5)',
    'InertialSensor1_ErrorFlag6_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(6)',
    'InertialSensor1_ErrorFlag7_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(7)',
    'InertialSensor1_ErrorFlag8_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(8)',
    'InertialSensor1_ErrorFlag9_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(9)',
    'InertialSensor2_ErrorFlag0_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(0)',
    'InertialSensor2_ErrorFlag9_EE_V' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(1).ErFlg_au16(9)',

    #	 ErrorFlags stored in Field Claim Data area
    #----------------------------------------------
    'ClusterFlags_EE_C' => '0x8421',
    'ErrorFlag_EE_C'    => '0x8421',
    'Temperature_EE_C'  => '0x8421',

    #	FieldClaimDataEe_st buffer for all error banks
    #------------------------------
    'InertialSensor1_ErrorBank0_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(0)',    #Address1
    'InertialSensor1_ErrorBank1_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(1)',    #Address2
    'InertialSensor1_ErrorBank2_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(2)',    #Address3
    'InertialSensor1_ErrorBank3_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(3)',    #Address4
    'InertialSensor1_ErrorBank4_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(4)',    #Address5
    'InertialSensor1_ErrorBank5_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(5)',    #Address6
    'InertialSensor1_ErrorBank6_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(6)',    #Address7
    'InertialSensor1_ErrorBank7_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(7)',    #Address8
    'InertialSensor1_ErrorBank8_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(8)',    #Address9
    'InertialSensor1_ErrorBank9_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.ImuStatusData_ast(0).ErFlg_au16(9)',    #Address0A

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
    # enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsMax_e;6;Max Value (number of all ASICs)

    'InertialSensor1_DeviceId_V' => 'rb_syca_AsicDeviceId_au16(3)',
    'InertialSensor2_DeviceId_V' => 'rb_syca_AsicDeviceId_au16(4)',
    #
    #	RevisionId
    #-------------
    'InertialSensor1_RevisionId_V' => 'rb_syca_AsicRevisionId_au16(3)',
    'InertialSensor2_RevisionId_V' => 'rb_syca_AsicRevisionId_au16(4)',

    #    ErrorCounter (removed from *.cns file ??)
    #----------------
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1IntErrCnt45_e;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2IntErrCnt45_e;
    #
    'InertialSensor1_IntErrCnt_comb0_U8'  => 'rb_csic_RtComRxPayload_au16(30)_U8',
    'InertialSensor1_IntErrCnt_comb1_U8'  => 'rb_csic_RtComRxPayload_au16(31)_U8',
    'InertialSensor1_IntErrCnt_comb2_U8'  => 'rb_csic_RtComRxPayload_au16(32)_U8',
    'InertialSensor1_IntErrCnt_comb3_U8'  => 'rb_csic_RtComRxPayload_au16(33)_U8',
    'InertialSensor1_IntErrCnt_comb4_U8'  => 'rb_csic_RtComRxPayload_au16(34)_U8',
    'InertialSensor1_IntErrCnt_comb0_U16' => 'rb_csic_RtComRxPayload_au16(30)_U16',
    'InertialSensor1_IntErrCnt_comb1_U16' => 'rb_csic_RtComRxPayload_au16(31)_U16',
    'InertialSensor1_IntErrCnt_comb2_U16' => 'rb_csic_RtComRxPayload_au16(32)_U16',
    'InertialSensor1_IntErrCnt_comb3_U16' => 'rb_csic_RtComRxPayload_au16(33)_U16',
    'InertialSensor1_IntErrCnt_comb4_U16' => 'rb_csic_RtComRxPayload_au16(34)_U16',

    #Actual system mode
    'Init1Mode_C'         => 1,
    'Init2Mode_C'         => 2,
    'Init3Mode_C'         => 3,
    'IdleMode_C'          => 4,
    'NormalDrivingMode_C' => 5,
    'DisposalMode_C'      => 6,
    'CrashMode_C'         => 7,

    #    Status ClusterFlags
    #-----------------------
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1StatusClusFlags_e;20;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2StatusClusFlags_e;21;
    #
    'InertialSensor1_Status_ClusterFlags_U8' => 'rb_csic_RtComRxPayload_au16(20)_U8',
    'InertialSensor1_Status_ClusterFlags'    => 'rb_csic_RtComRxPayload_au16(20)',

    'InertialSensor1_Status_ClusterFlags_U16' => 'rb_csic_RtComRxPayload_au16(20)_U16',
    'InertialSensor1_Status_ClusterFlags'     => 'rb_csic_RtComRxPayload_au16(20)',

    #    Status HW SCON_U8
    #------------------
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1StatusHwScon_e;22;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1StatusHwScon6DExt_e;23;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2StatusHwScon_e;24;
    # enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2StatusHwScon6DExt_e;25;
    #
    'InertialSensor1_Status_HW_SCON_U8' => 'rb_csic_RtComRxPayload_au16(22)_U8',

    #    Status HW SCON_U16
    #------------------
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor1StatusHwScon_e;
    #enum;rb_csic_AllPossibleRtCmdsTxReasons_ten;rb_csic_InertialSensor2StatusHwScon_e;
    #
    'InertialSensor1_Status_HW_SCON_U16'        => 'rb_csic_RtComRxPayload_au16(22)_U16',
    'InertialSensor1_Status_HW_SCON'            => 'rb_csic_RtComRxPayload_au16(22)',
    'InertialSensor1_Status_6D_EXT_HW_SCON_U16' => 'rb_csic_RtComRxPayload_au16(23)_U16',

    #	RAM Copy of InitErrorData Flags
    'InertialSensor1_RAM_Copy_InitErrorData_ClusterFlags' => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ClusterFlags_u16',
    'InertialSensor1_RAM_Copy_InitErrorData_ErrorFlags0'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ErrorFlags_au16(0)',
    'InertialSensor1_RAM_Copy_InitErrorData_ErrorFlags1'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ErrorFlags_au16(1)',
    'InertialSensor1_RAM_Copy_InitErrorData_ErrorFlags2'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ErrorFlags_au16(2)',
    'InertialSensor1_RAM_Copy_InitErrorData_ErrorFlags3'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ErrorFlags_au16(3)',
    'InertialSensor1_RAM_Copy_InitErrorData_ErrorFlags4'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ErrorFlags_au16(4)',
    'InertialSensor1_RAM_Copy_InitErrorData_ErrorFlags5'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ErrorFlags_au16(5)',
    'InertialSensor1_RAM_Copy_InitErrorData_ErrorFlags6'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ErrorFlags_au16(6)',
    'InertialSensor1_RAM_Copy_InitErrorData_ErrorFlags7'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ErrorFlags_au16(7)',
    'InertialSensor1_RAM_Copy_InitErrorData_ErrorFlags8'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ErrorFlags_au16(8)',
    'InertialSensor1_RAM_Copy_InitErrorData_ErrorFlags9'  => 'rb_csem_InitErrorData_st.InitErrorData_ast(0).ErrorFlags_au16(9)',

    #	NVM Copy of InitErrorData Flags
    'InertialSensor1_NVM_Copy_InitErrorData_ClusterFlags' => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ClusterFlags_u16',
    'InertialSensor1_NVM_Copy_InitErrorData_ErrorFlags0'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(0)',
    'InertialSensor1_NVM_Copy_InitErrorData_ErrorFlags1'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(1)',
    'InertialSensor1_NVM_Copy_InitErrorData_ErrorFlags2'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(2)',
    'InertialSensor1_NVM_Copy_InitErrorData_ErrorFlags3'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(3)',
    'InertialSensor1_NVM_Copy_InitErrorData_ErrorFlags4'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(4)',
    'InertialSensor1_NVM_Copy_InitErrorData_ErrorFlags5'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(5)',
    'InertialSensor1_NVM_Copy_InitErrorData_ErrorFlags6'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(6)',
    'InertialSensor1_NVM_Copy_InitErrorData_ErrorFlags7'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(7)',
    'InertialSensor1_NVM_Copy_InitErrorData_ErrorFlags8'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(8)',
    'InertialSensor1_NVM_Copy_InitErrorData_ErrorFlags9'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(9)',

    #	Temporary Copy of InitErrorData Flags
    'InertialSensor1_Temp_Copy_InitErrorData_ClusterFlags' => 'rb_csic_InitErrorData_ast(0).ClusterFlags_u16',
    'InertialSensor1_Temp_Copy_InitErrorData_ErrorFlags0'  => 'rb_csic_InitErrorData_ast(0).ErrorFlags_au16(0)',
    'InertialSensor1_Temp_Copy_InitErrorData_ErrorFlags1'  => 'rb_csic_InitErrorData_ast(0).ErrorFlags_au16(1)',
    'InertialSensor1_Temp_Copy_InitErrorData_ErrorFlags2'  => 'rb_csic_InitErrorData_ast(0).ErrorFlags_au16(2)',
    'InertialSensor1_Temp_Copy_InitErrorData_ErrorFlags3'  => 'rb_csic_InitErrorData_ast(0).ErrorFlags_au16(3)',
    'InertialSensor1_Temp_Copy_InitErrorData_ErrorFlags4'  => 'rb_csic_InitErrorData_ast(0).ErrorFlags_au16(4)',
    'InertialSensor1_Temp_Copy_InitErrorData_ErrorFlags5'  => 'rb_csic_InitErrorData_ast(0).ErrorFlags_au16(5)',
    'InertialSensor1_Temp_Copy_InitErrorData_ErrorFlags6'  => 'rb_csic_InitErrorData_ast(0).ErrorFlags_au16(6)',
    'InertialSensor1_Temp_Copy_InitErrorData_ErrorFlags7'  => 'rb_csic_InitErrorData_ast(0).ErrorFlags_au16(7)',
    'InertialSensor1_Temp_Copy_InitErrorData_ErrorFlags8'  => 'rb_csic_InitErrorData_ast(0).ErrorFlags_au16(8)',
    'InertialSensor1_Temp_Copy_InitErrorData_ErrorFlags9'  => 'rb_csic_InitErrorData_ast(0).ErrorFlags_au16(9)',

    # Device IDs
    #------------
    'InertialSensor1_DeviceId_C' => '0x0973',    #SMI860
    'InertialSensor2_DeviceId_C' => '0x0804',    #SMI810

    'SMA_Module_serial_number' => '0x673A57A96AF6',
    'SMA_Revision_ID'          => 16,

    # manipulated RevisionId, SmiSerialNr, AsicSerialNr will be checked against this constants
    # (not checked by software)
    'RevisionId_C'    => '0x1111',
    'SmiSerialNr0_C'  => '0x0011',
    'SmiSerialNr1_C'  => '0x1100',
    'SmiSerialNr2_C'  => '0bxxxx000100010001',
    'AsicSerialNr0_C' => '0x0011',
    'AsicSerialNr1_C' => '0x1100',
    'AsicSerialNr2_C' => '0x0111',

    #Default values for correction parameters:
    'Sensitivity_XlowG_low' => 5000,
    'Sensitivity_YlowG_low' => 6000,
    'Sensitivity_ZlowG_low' => 7000,

    'Imu1_Misalignment_Acc_XX_default' => 16384,
    'Imu1_Misalignment_Acc_XY_default' => 0,
    'Imu1_Misalignment_Acc_XZ_default' => 0,

    'Imu1_Misalignment_Acc_YX_default' => 0,
    'Imu1_Misalignment_Acc_YY_default' => 16384,
    'Imu1_Misalignment_Acc_YZ_default' => 0,

    'Imu1_Misalignment_Acc_ZX_default' => 0,
    'Imu1_Misalignment_Acc_ZY_default' => 0,
    'Imu1_Misalignment_Acc_ZZ_default' => 16384,

    'Imu1_Misalignment_rate_XX_default' => 16384,
    'Imu1_Misalignment_rate_XY_default' => 0,
    'Imu1_Misalignment_rate_XZ_default' => 0,

    'Imu1_Misalignment_rate_YX_default' => 0,
    'Imu1_Misalignment_rate_YY_default' => 16384,
    'Imu1_Misalignment_rate_YZ_default' => 0,

    'Imu1_Misalignment_rate_ZX_default' => 0,
    'Imu1_Misalignment_rate_ZY_default' => 0,
    'Imu1_Misalignment_rate_ZZ_default' => 16384,

    'Imu1_Sensitivity_Acc_X_default' => 16384,
    'Imu1_Sensitivity_Acc_Y_default' => 16384,
    'Imu1_Sensitivity_Acc_Z_default' => 16384,

    'Imu1_Sensitivity_rate_X_default' => 16384,
    'Imu1_Sensitivity_rate_Y_default' => 16384,
    'Imu1_Sensitivity_rate_Z_default' => 16384,

    'Imu1_Offset_Acc_X_default' => 0,
    'Imu1_Offset_Acc_Y_default' => 0,
    'Imu1_Offset_Acc_Z_default' => 0,

    'Imu1_Offset_rate_X_default' => 0,
    'Imu1_Offset_rate_Y_default' => 0,
    'Imu1_Offset_rate_Z_default' => 0,

    #Write Misalignment parameters:
    'Imu1_Misalignment_dfst_Acc_XX' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.MisalignmentXX_s16',
    'Imu1_Misalignment_dfst_Acc_XY' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.MisalignmentXY_s16',
    'Imu1_Misalignment_dfst_Acc_XZ' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.MisalignmentXZ_s16',

    'Imu1_Misalignment_dfst_Acc_YX' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.MisalignmentYX_s16',
    'Imu1_Misalignment_dfst_Acc_YY' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.MisalignmentYY_s16',
    'Imu1_Misalignment_dfst_Acc_YZ' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.MisalignmentYZ_s16',

    'Imu1_Misalignment_dfst_Acc_ZX' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.MisalignmentZX_s16',
    'Imu1_Misalignment_dfst_Acc_ZY' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.MisalignmentZY_s16',
    'Imu1_Misalignment_dfst_Acc_ZZ' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.MisalignmentZZ_s16',

    'Imu1_Misalignment_dfst_rate_XX' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.MisalignmentXX_s16',
    'Imu1_Misalignment_dfst_rate_XY' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.MisalignmentXY_s16',
    'Imu1_Misalignment_dfst_rate_XZ' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.MisalignmentXZ_s16',

    'Imu1_Misalignment_dfst_rate_YX' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.MisalignmentYX_s16',
    'Imu1_Misalignment_dfst_rate_YY' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.MisalignmentYY_s16',
    'Imu1_Misalignment_dfst_rate_YZ' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.MisalignmentYZ_s16',

    'Imu1_Misalignment_dfst_rate_ZX' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.MisalignmentZX_s16',
    'Imu1_Misalignment_dfst_rate_ZY' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.MisalignmentZY_s16',
    'Imu1_Misalignment_dfst_rate_ZZ' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.MisalignmentZZ_s16',

    # Write Sensitivity Correction Parameters:
    'Imu1_Sensitivity_dfst_Acc_X', => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.SensitivityX_s16',
    'Imu1_Sensitivity_dfst_Acc_Y', => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.SensitivityY_s16',
    'Imu1_Sensitivity_dfst_Acc_Z', => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.SensitivityZ_s16',

    'Imu1_Sensitivity_dfst_rate_X', => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.SensitivityX_s16',
    'Imu1_Sensitivity_dfst_rate_Y', => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.SensitivityY_s16',
    'Imu1_Sensitivity_dfst_rate_Z', => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.SensitivityZ_s16',

    #Write Offset Correction Paramters:
    'Imu1_Offset_dfst_Acc_X' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.OffsetX_s16',
    'Imu1_Offset_dfst_Acc_Y' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.OffsetY_s16',
    'Imu1_Offset_dfst_Acc_Z' => 'rb_sdcm_Imu1PlantCorrAccLgParam_dfst.OffsetZ_s16',

    'Imu1_Offset_dfst_rate_X' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.OffsetX_s16',
    'Imu1_Offset_dfst_rate_Y' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.OffsetY_s16',
    'Imu1_Offset_dfst_rate_Z' => 'rb_sdcm_Imu1PlantCorrRateParam_dfst.OffsetZ_s16',

    #Misalignment Correction parameters:
    'Imu1_Misalignment_Acc_XX' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.MisalignmentXX_s16',
    'Imu1_Misalignment_Acc_XY' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.MisalignmentXY_s16',
    'Imu1_Misalignment_Acc_XZ' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.MisalignmentXZ_s16',

    'Imu1_Misalignment_Acc_YX' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.MisalignmentYX_s16',
    'Imu1_Misalignment_Acc_YY' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.MisalignmentYY_s16',
    'Imu1_Misalignment_Acc_YZ' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.MisalignmentYZ_s16',

    'Imu1_Misalignment_Acc_ZX' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.MisalignmentZX_s16',
    'Imu1_Misalignment_Acc_ZY' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.MisalignmentZY_s16',
    'Imu1_Misalignment_Acc_ZZ' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.MisalignmentZZ_s16',

    'Imu1_Misalignment_rate_XX' => 'rb_sdcm_Imu1PlantCorrRateParam_st.MisalignmentXX_s16',
    'Imu1_Misalignment_rate_XY' => 'rb_sdcm_Imu1PlantCorrRateParam_st.MisalignmentXY_s16',
    'Imu1_Misalignment_rate_XZ' => 'rb_sdcm_Imu1PlantCorrRateParam_st.MisalignmentXZ_s16',

    'Imu1_Misalignment_rate_YX' => 'rb_sdcm_Imu1PlantCorrRateParam_st.MisalignmentYX_s16',
    'Imu1_Misalignment_rate_YY' => 'rb_sdcm_Imu1PlantCorrRateParam_st.MisalignmentYY_s16',
    'Imu1_Misalignment_rate_YZ' => 'rb_sdcm_Imu1PlantCorrRateParam_st.MisalignmentYZ_s16',

    'Imu1_Misalignment_rate_ZX' => 'rb_sdcm_Imu1PlantCorrRateParam_st.MisalignmentZX_s16',
    'Imu1_Misalignment_rate_ZY' => 'rb_sdcm_Imu1PlantCorrRateParam_st.MisalignmentZY_s16',
    'Imu1_Misalignment_rate_ZZ' => 'rb_sdcm_Imu1PlantCorrRateParam_st.MisalignmentZZ_s16',

    #Sensitivity Correction Parameters:
    'Imu1_Sensitivity_Acc_X', => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.SensitivityX_s16',
    'Imu1_Sensitivity_Acc_Y', => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.SensitivityY_s16',
    'Imu1_Sensitivity_Acc_Z', => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.SensitivityZ_s16',

    'Imu1_Sensitivity_rate_X', => 'rb_sdcm_Imu1PlantCorrRateParam_st.SensitivityX_s16',
    'Imu1_Sensitivity_rate_Y', => 'rb_sdcm_Imu1PlantCorrRateParam_st.SensitivityY_s16',
    'Imu1_Sensitivity_rate_Z', => 'rb_sdcm_Imu1PlantCorrRateParam_st.SensitivityZ_s16',

    #Offset Correction Paramters:
    'Imu1_Offset_Acc_X' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.OffsetX_s16',
    'Imu1_Offset_Acc_Y' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.OffsetY_s16',
    'Imu1_Offset_Acc_Z' => 'rb_sdcm_Imu1PlantCorrAccLgParam_st.OffsetZ_s16',

    'Imu1_Offset_rate_X' => 'rb_sdcm_Imu1PlantCorrRateParam_st.OffsetX_s16',
    'Imu1_Offset_rate_Y' => 'rb_sdcm_Imu1PlantCorrRateParam_st.OffsetY_s16',
    'Imu1_Offset_rate_Z' => 'rb_sdcm_Imu1PlantCorrRateParam_st.OffsetZ_s16',

    'PlantCalibChlState' => 'rb_spc_DataSamplingStatus_u8',

    'PlantCalibChlState_Init'    => 0,
    'PlantCalibChlState_Invalid' => 1,
    'PlantCalibChlState_Valid'   => 2,

    'PlantCalib_Success'    => 3,
    'PlantCalib_Failed'     => 2,
    'PlantCalib_InProgress' => 1,
    'PlantCalib_NotDone'    => 0,

    '1g_NotCorrected' => 0,

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
    'InertialSensor1_ParID2_IREG1' => '290',
    'InertialSensor1_ParID2_IREG2' => '12850',
    'InertialSensor1_ParID2_IREG3' => '0',

    'InertialSensor1_ParID2_OREG0' => '192',

    'InertialSensor1_ParID3_IREG0' => '204',
    'InertialSensor1_ParID3_IREG1' => '49283',
    'InertialSensor1_ParID3_IREG2' => '3592',
    'InertialSensor1_ParID3_IREG3' => '0',

    'InertialSensor1_ParID3_OREG0' => '192',

    'InertialSensor1_ParID4_IREG0' => '204',
    'InertialSensor1_ParID4_IREG1' => '9220',
    'InertialSensor1_ParID4_IREG2' => '292',
    'InertialSensor1_ParID4_IREG3' => '292',

    'InertialSensor1_ParID4_OREG0' => '192',

    'InertialSensor1_ParID5_IREG0' => '204',
    'InertialSensor1_ParID5_IREG1' => '9221',
    'InertialSensor1_ParID5_IREG2' => '9252',
    'InertialSensor1_ParID5_IREG3' => '9252',

    'InertialSensor1_ParID5_OREG0' => '192',

    'InertialSensor1_ParID6_IREG0' => '204',
    'InertialSensor1_ParID6_IREG1' => '9222',
    'InertialSensor1_ParID6_IREG2' => '2596',
    'InertialSensor1_ParID6_IREG3' => '2596',

    'InertialSensor1_ParID6_OREG0' => '192',

    'InertialSensor1_ParID7_IREG0' => '204',
    'InertialSensor1_ParID7_IREG1' => '9223',
    'InertialSensor1_ParID7_IREG2' => '9252',
    'InertialSensor1_ParID7_IREG3' => '10788',

    'InertialSensor1_ParID7_OREG0' => '192',

    'InertialSensor1_ParID8_IREG0' => '204',
    'InertialSensor1_ParID8_IREG1' => '8',
    'InertialSensor1_ParID8_IREG2' => '553',
    'InertialSensor1_ParID8_IREG3' => '310',

    'InertialSensor1_ParID8_OREG0' => '192',

    'InertialSensor1_ParID9_IREG0' => '204',
    'InertialSensor1_ParID9_IREG1' => '121',
    'InertialSensor1_ParID9_IREG2' => '0',
    'InertialSensor1_ParID9_IREG3' => '0',

    'InertialSensor1_ParID9_OREG0' => '192',

    'InertialSensor1_ParID10_IREG0' => '204',
    'InertialSensor1_ParID10_IREG1' => '10',
    'InertialSensor1_ParID10_IREG2' => '0',
    'InertialSensor1_ParID10_IREG3' => '0',

    'InertialSensor1_ParID10_OREG0' => '192',

    'InertialSensor1_ParID11_IREG0' => '204',
    'InertialSensor1_ParID11_IREG1' => '827',
    'InertialSensor1_ParID11_IREG2' => '0',
    'InertialSensor1_ParID11_IREG3' => '0',

    'InertialSensor1_ParID11_OREG0' => '192',

    'InertialSensor1_ParID12_IREG0' => '204',
    'InertialSensor1_ParID12_IREG1' => '12',
    'InertialSensor1_ParID12_IREG2' => '0',
    'InertialSensor1_ParID12_IREG3' => '0',

    'InertialSensor1_ParID12_OREG0' => '192',

    'InertialSensor1_ParID13_IREG0' => '204',
    'InertialSensor1_ParID13_IREG1' => '13',
    'InertialSensor1_ParID13_IREG2' => '0',
    'InertialSensor1_ParID13_IREG3' => '0',

    'InertialSensor1_ParID13_OREG0' => '192',
    'InertialSensor1_ParID13_EOC'   => '1',

    'InertialSensor2_ParID0_IREG0' => '204',
    'InertialSensor2_ParID0_IREG1' => '0',
    'InertialSensor2_ParID0_IREG2' => '29567',
    'InertialSensor2_ParID0_IREG3' => '32703',

    'InertialSensor2_ParID1_IREG0' => '204',
    'InertialSensor2_ParID1_IREG1' => '1',
    'InertialSensor2_ParID1_IREG2' => '30715',
    'InertialSensor2_ParID1_IREG3' => '988',

    'InertialSensor2_ParID2_IREG0' => '204',
    'InertialSensor2_ParID2_IREG1' => '290',
    'InertialSensor2_ParID2_IREG2' => '12850',
    'InertialSensor2_ParID2_IREG3' => '0',

    'InertialSensor2_ParID3_IREG0' => '204',
    'InertialSensor2_ParID3_IREG1' => '49299',
    'InertialSensor2_ParID3_IREG2' => '3656',
    'InertialSensor2_ParID3_IREG3' => '0',

    'InertialSensor2_ParID4_IREG0' => '204',
    'InertialSensor2_ParID4_IREG1' => '9220',
    'InertialSensor2_ParID4_IREG2' => '9252',
    'InertialSensor2_ParID4_IREG3' => '9252',

    'InertialSensor2_ParID5_IREG0' => '204',
    'InertialSensor2_ParID5_IREG1' => '9221',
    'InertialSensor2_ParID5_IREG2' => '9252',
    'InertialSensor2_ParID5_IREG3' => '9252',

    'InertialSensor2_ParID6_IREG0' => '204',
    'InertialSensor2_ParID6_IREG1' => '9222',
    'InertialSensor2_ParID6_IREG2' => '9252',
    'InertialSensor2_ParID6_IREG3' => '9252',

    'InertialSensor2_ParID7_IREG0' => '204',
    'InertialSensor2_ParID7_IREG1' => '9223',
    'InertialSensor2_ParID7_IREG2' => '9252',
    'InertialSensor2_ParID7_IREG3' => '10788',

    'InertialSensor2_ParID8_IREG0' => '204',
    'InertialSensor2_ParID8_IREG1' => '8',
    'InertialSensor2_ParID8_IREG2' => '553',
    'InertialSensor2_ParID8_IREG3' => '310',

    'InertialSensor2_ParID9_IREG0' => '204',
    'InertialSensor2_ParID9_IREG1' => '121',
    'InertialSensor2_ParID9_IREG2' => '0',
    'InertialSensor2_ParID9_IREG3' => '0',

    'InertialSensor2_ParID10_IREG0' => '204',
    'InertialSensor2_ParID10_IREG1' => '10',
    'InertialSensor2_ParID10_IREG2' => '0',
    'InertialSensor2_ParID10_IREG3' => '0',

    'InertialSensor2_ParID11_IREG0' => '204',
    'InertialSensor2_ParID11_IREG1' => '827',
    'InertialSensor2_ParID11_IREG2' => '0',
    'InertialSensor2_ParID11_IREG3' => '0',

    'InertialSensor2_ParID12_IREG0' => '204',
    'InertialSensor2_ParID12_IREG1' => '12',
    'InertialSensor2_ParID12_IREG2' => '0',
    'InertialSensor2_ParID12_IREG3' => '0',

    'InertialSensor2_ParID13_IREG0' => '204',
    'InertialSensor2_ParID13_IREG1' => '29',
    'InertialSensor2_ParID13_IREG2' => '0',
    'InertialSensor2_ParID13_IREG3' => '0',

    'InertialSensor2_ParID9_EOC' => '1',
    'Imu1AccXLgChl_SID'          => '25',
    'Imu1AccXHgMonChl_SID'       => '27',
    'Imu1AccYLgChl_SID'          => '26',
    'Imu1AccYHgMonChl_SID'       => '28',
    'Imu1AccZLgChl_SID'          => '29',
    'Imu1AccZHgMonChl_SID'       => '28',
    'Imu1RollRateLfChl_SID'      => '4',
    'Imu1YawRateLfChl_SID'       => '21',
    'Imu1PitchRateLfChl_SID'     => '2',
    'ImuTemperatureChl_SID'      => '30',

    #***********************Fault Mapping*****************************************
    'InertialSensor1_MonPermInit_flt' => 'rb_csem_MonPermInitInertialSensor1_flt',
    'InertialSensor2_MonPermInit_flt' => 'rb_csem_MonPermInitInertialSensor2_flt',

    'InertialSensor1_MonPermBG_flt' => 'rb_csem_MonPermBGInertialSensor1_flt',
    'InertialSensor2_MonPermBG_flt' => 'rb_csem_MonPermBGInertialSensor2_flt',

    'AccXLgChl_Temp_flt'    => 'rb_csem_MonTempAccXLg_flt',
    'AccXHgMonChl_Temp_flt' => 'rb_csem_MonTempAccXHgMon_flt',
    'AccYLgChl_Temp_flt'    => 'rb_csem_MonTempAccYLg_flt',
    'AccYHgMonChl_Temp_flt' => 'rb_csem_MonTempAccYHgMon_flt',

    #'AccYLgPlausiChl_Temp_flt'				=> 'rb_csem_MonTempAccYLgPlausi_flt',
    'AccZLgChl_Temp_flt'    => 'rb_csem_MonTempAccZLg_flt',
    'YawRateLfChl_Temp_flt' => 'rb_csem_MonTempYawRateLf_flt',

    #'YawRateLfPlausiChl_Temp_flt'			=> 'rb_csem_MonTempYawRateLfPlausi_flt',
    'RollRateLfChl_Temp_flt'        => 'rb_csem_MonTempRollRateLf_flt',
    'PitchRateLfChl_Temp_flt'       => 'rb_csem_MonTempPitchRateLf_flt',
    'Imu1TemperatureChl_Temp_flt'   => 'rb_csem_MonTempImu1Temperature_flt',
    'TemperatureChl_Temp_flt'       => 'rb_csem_MonTempImu1Temperature_flt',
    'Imu1FrequencyCounter_Temp_flt' => 'rb_csem_MonTempImu1FrequencyCounter_flt',

    'InertialSensor1_TempDSP_flt' => 'rb_csem_TempDspMonInertialSensor1_flt',
    'InertialSensor2_TempDSP_flt' => 'rb_csem_TempDspMonInertialSensor2_flt',

    'AccXLgChl_Perm_flt'    => 'rb_csem_MonPermAccXLgChl_flt',
    'AccXHgMonChl_Perm_flt' => 'rb_csem_MonPermAccXHgMonChl_flt',
    'AccYLgChl_Perm_flt'    => 'rb_csem_MonPermAccYLgChl_flt',
    'AccYHgMonChl_Perm_flt' => 'rb_csem_MonPermAccYHgMonChl_flt',

    #'AccYLgPlausiChl_Perm_flt'				=> 'rb_csem_MonPermAccYLgPlausiChl_flt',
    'AccZLgChl_Perm_flt'    => 'rb_csem_MonPermAccZLgChl_flt',
    'YawRateLfChl_Perm_flt' => 'rb_csem_MonPermYawRateLfChl_flt',

    #'YawRateLfPlausiChl_Perm_flt'			=> 'rb_csem_MonPermYawRateLfPlausiChl_flt',
    'RollRateLfChl_Perm_flt'      => 'rb_csem_MonPermRollRateLfChl_flt',
    'PitchRateLfChl_Perm_flt'     => 'rb_csem_MonPermPitchRateLfChl_flt',
    'TemperatureChl_Perm_flt'     => 'rb_csem_MonPermImuTemperatureChl_flt',
    'Imu1TemperatureChl_Perm_flt' => 'rb_csem_MonPermImuTemperatureChl_flt',

    'SdpSensorTimeSyncError_flt' => 'rb_sdp_SensorTimeSyncError_flt',

    'AccXLgChl_SignalMonCtrl_flt'    => 'rb_simc_SignalMonCtrlLowgX_flt',
    'AccXHgMonChl_SignalMonCtrl_flt' => 'rb_simc_SignalMonCtrlHighgXMon_flt',
    'AccYLgChl_SignalMonCtrl_flt'    => 'rb_simc_SignalMonCtrlLowgY_flt',
    'AccYHgMonChl_SignalMonCtrl_flt' => 'rb_simc_SignalMonCtrlHighgYMon_flt',

    #	'AccYLgPlausiChl_SignalMonCtrl_flt'		=> 'rb_simc_SignalMonCtrlLowgYPls_flt',
    'AccZLgChl_SignalMonCtrl_flt'    => 'rb_simc_SignalMonCtrlLowgZ_flt',
    'YawRateLfChl_SignalMonCtrl_flt' => 'rb_simc_SignalMonCtrlYawRateLf_flt',

    #	'YawRateLfPlausiChl_SignalMonCtrl_flt'	=> 'rb_simc_SignalMonCtrlYawRateLfPls_flt',
    'RollRateLfChl_SignalMonCtrl_flt'  => 'rb_simc_SignalMonCtrlRollRateLf_flt',
    'PitchRateLfChl_SignalMonCtrl_flt' => 'rb_simc_SignalMonCtrlPitchRateLf_flt',

    'System_ConfDataInconsistent_flt' => 'rb_syc_ConfigurationDataInconsistent_flt',

    'Spi_CrcWrong_flt' => 'rb_spi_SpiRcvMsgCrcWrong_flt',

    'FieldCalibMissing_flt' => 'rb_sdcm_FieldCalibMissing_flt',
    'AsicIdMissmatch_flt'   => 'rb_syc_AsicIdMismatch_flt',

    'SysAsicRegisterProgMon_flt' => 'rb_bsd_SysAsicRegisterProgMon_flt',

    #************************************************************************************************************************************************************************************************************
    #                               SMI Sensor Fault Handling with additional evaluation
    #************************************************************************************************************************************************************************************************************
    # Debounce counter evaluation for Permanent channel sensor faults during Init mode
    'Fault_DebounceCounter_Init_Mode' => 'rb_csem_DebounceCounters_st.SMIInitFaults_as32(0)',

    'Fault_DebounceCounter_Init_Mode_S32' => 'rb_csem_DebounceCounters_st.SMIInitFaults_as32(0)_S32',

    # Fault storage data evaluation during Init mode

    'InternalSensor_FaultsQualified_info'   => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InternalSensorFaultsQualified_en',
    'FaultStorageData_MonitoringPhase_info' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en',
    'InitSensor_FaultDisturbedDebug_info'   => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultDisturbedDebugInfo_u16',
    'InitSensor_FaultFilteredDebug_info'    => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultFilteredDebugInfo_u16',

    'InternalSensor_FaultsQualified_info_U8'   => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InternalSensorFaultsQualified_en_U8',
    'FaultStorageData_MonitoringPhase_info_U8' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en_U8',
    'IMU1_Fault_Monitoring_Phase_U8'           => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en_U8',
    'InitSensor_FaultDisturbedDebug_info_U16'  => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultDisturbedDebugInfo_u16_U16',
    'InitSensor_FaultFilteredDebug_info_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultFilteredDebugInfo_u16_U16',

    # Debounce counter evaluation for Permanent channel sensor faults during Steady state mode
    'Fault_DebounceCounter_SteadyState_Mode' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(0)',

    'Fault_DebounceCounter_SteadyState_Mode_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(0)_S32',

    # Debounce counter evaluation for Temporary channel sensor faults during Steady state mode

    'IMU1_Temp_Fault_AccXLgChl_DebounceCounter_SteadyState_Mode_S32'          => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(0)_S32',
    'IMU1_Temp_Fault_AccXHgMonChl_DebounceCounter_SteadyState_Mode_S32'       => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(1)_S32',
    'IMU1_Temp_Fault_AccYLgChl_DebounceCounter_SteadyState_Mode_S32'          => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(2)_S32',
    'IMU1_Temp_Fault_AccYHgMonChl_DebounceCounter_SteadyState_Mode_S32'       => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(3)_S32',
    'IMU1_Temp_Fault_AccZLgChl_DebounceCounter_SteadyState_Mode_S32'          => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(4)_S32',
    'IMU1_Temp_Fault_RollRateLfChl_DebounceCounter_SteadyState_Mode_S32'      => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(6)_S32',
    'IMU1_Temp_Fault_YawRateLfChl_DebounceCounter_SteadyState_Mode_S32'       => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(7)_S32',
    'IMU1_Temp_Fault_PitchRateLfChl_DebounceCounter_SteadyState_Mode_S32'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(8)_S32',
    'IMU1_Temp_Fault_Imu1TemperatureChl_DebounceCounter_SteadyState_Mode_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(9)_S32',

    # Fault Filtered Debug info evaluation for Temporary channel sensor faults during Steady state mode
    'IMU1_SteadyState_FaultFilteredDebug_info' => 'rb_csem_FaultStorageData_st.InfoClusterSMA_ast(0).CyclicFaultFilteredDebugInfo_u16',

    'IMU1_SteadyState_FaultFilteredDebug_info_U16' => 'rb_csem_FaultStorageData_st.InfoClusterSMA_ast(0).CyclicFaultFilteredDebugInfo_u16_u16',

    #####SMI Perm Fault Debounce counter Info
    'SMI_InternalSensor_Fault_DebounceCounter_S32'         => 'rb_csem_DebounceCounters_st.SMIInitFaults_as32(0)_S32',
    'SMI_BGSensor_Fault_DebounceCounter_S32'               => 'rb_csem_DebounceCounters_st.SMIBGFaults_as32(0)_S32',
    'IMU1_Perm_AccXLgChl_Fault_DebounceCounter_S32'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(0)_S32',
    'IMU1_Perm_AccXHgMonChl_Fault_DebounceCounter_S32'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(1)_S32',
    'IMU1_Perm_AccYLgChl_Fault_DebounceCounter_S32'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(2)_S32',
    'IMU1_Perm_AccYHgMonChl_Fault_DebounceCounter_S32'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(3)_S32',
    'IMU1_Perm_AccZLgChl_Fault_DebounceCounter_S32'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(4)_S32',
    'IMU1_Perm_RollRateLfChl_Fault_DebounceCounter_S32'    => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(6)_S32',
    'IMU1_Perm_YawRateLfChl_Fault_DebounceCounter_S32'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(7)_S32',
    'IMU1_Perm_PitchRateLfChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(8)_S32',
    'IMU1_Perm_TemperatureChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(9)_S32',
    'IMU1_Perm_FrequencyCounter_Fault_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(10)_S32',

    'IMU1_Perm_AccXLgChl_Fault_DebounceCounter'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(0)',
    'IMU1_Perm_AccXHgMonChl_Fault_DebounceCounter'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(1)',
    'IMU1_Perm_AccYLgChl_Fault_DebounceCounter'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(2)',
    'IMU1_Perm_AccYHgMonChl_Fault_DebounceCounter'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(3)',
    'IMU1_Perm_AccZLgChl_Fault_DebounceCounter'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(4)',
    'IMU1_Perm_RollRateLfChl_Fault_DebounceCounter'    => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(6)',
    'IMU1_Perm_YawRateLfChl_Fault_DebounceCounter'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(7)',
    'IMU1_Perm_PitchRateLfChl_Fault_DebounceCounter'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(8)',
    'IMU1_Perm_TemperatureChl_Fault_DebounceCounter'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(9)',
    'IMU1_Perm_FrequencyCounter_Fault_DebounceCounter' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(10)',

    #####SMI Temp Fault Debounce counter Info
    'IMU1_Temp_AccXLgChl_Fault_DebounceCounter_S32'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(0)_S32',
    'IMU1_Temp_AccXHgMonChl_Fault_DebounceCounter_S32'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(1)_S32',
    'IMU1_Temp_AccYLgChl_Fault_DebounceCounter_S32'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(2)_S32',
    'IMU1_Temp_AccYHgMonChl_Fault_DebounceCounter_S32'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(3)_S32',
    'IMU1_Temp_AccZLgChl_Fault_DebounceCounter_S32'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(4)_S32',
    'IMU1_Temp_RollRateLfChl_Fault_DebounceCounter_S32'    => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(6)_S32',
    'IMU1_Temp_YawRateLfChl_Fault_DebounceCounter_S32'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(7)_S32',
    'IMU1_Temp_PitchRateLfChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(8)_S32',
    'IMU1_Temp_TemperatureChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(9)_S32',
    'IMU1_Temp_FrequencyCounter_Fault_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(10)_S32',

    'IMU1_Temp_AccXLgChl_Fault_DebounceCounter'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(0)',
    'IMU1_Temp_AccXHgMonChl_Fault_DebounceCounter'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(1)',
    'IMU1_Temp_AccYLgChl_Fault_DebounceCounter'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(2)',
    'IMU1_Temp_AccYHgMonChl_Fault_DebounceCounter'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(3)',
    'IMU1_Temp_AccZLgChl_Fault_DebounceCounter'        => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(4)',
    'IMU1_Temp_RollRateLfChl_Fault_DebounceCounter'    => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(6)',
    'IMU1_Temp_YawRateLfChl_Fault_DebounceCounter'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(7)',
    'IMU1_Temp_PitchRateLfChl_Fault_DebounceCounter'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(8)',
    'IMU1_Temp_TemperatureChl_Fault_DebounceCounter'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(9)',
    'IMU1_Temp_FrequencyCounter_Fault_DebounceCounter' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(10)',

    #####SMI Fault Monitoring Phage Info
    'IMU1_Fault_Monitoring_Phage_U8' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en_U8',

    'IMU1_Fault_Monitoring_Phage' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en',

    #####SMI Fault Qualified Info
    'SMI_InternalSensor_FaultsQualified_info_U8'    => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InternalSensorFaultsQualified_en_U8',
    'SMI_BGSensor_FaultsQualified_info_U8'          => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultsQualified_en_U8',
    'IMU1_AccXLgChl_FaultsQualified_info_U8'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(0)_U8',
    'IMU1_AccXHgMonChl_FaultsQualified_info_U8'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(1)_U8',
    'IMU1_AccYLgChl_FaultsQualified_info_U8'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(2)_U8',
    'IMU1_AccYHgMonChl_FaultsQualified_info_U8'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(3)_U8',
    'IMU1_AccZLgChl_FaultsQualified_info_U8'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(4)_U8',
    'IMU1_RollRateLfChl_FaultsQualified_info_U8'    => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(6)_U8',
    'IMU1_YawRateLfChl_FaultsQualified_info_U8'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(7)_U8',
    'IMU1_PitchRateLfChl_FaultsQualified_info_U8'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(8)_U8',
    'IMU1_TemperatureChl_FaultsQualified_info_U8'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(9)_U8',
    'IMU1_FrequencyCounter_FaultsQualified_info_U8' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(10)_U8',

    'IMU1_AccXLgChl_FaultsQualified_info'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(0)',
    'IMU1_AccXHgMonChl_FaultsQualified_info'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(1',
    'IMU1_AccYLgChl_FaultsQualified_info'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(2)',
    'IMU1_AccYHgMonChl_FaultsQualified_info'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(3)',
    'IMU1_AccZLgChl_FaultsQualified_info'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(4)',
    'IMU1_RollRateLfChl_FaultsQualified_info'    => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(6)',
    'IMU1_YawRateLfChl_FaultsQualified_info'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(7)',
    'IMU1_PitchRateLfChl_FaultsQualified_info'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(8)',
    'IMU1_TemperatureChl_FaultsQualified_info'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(9)',
    'IMU1_FrequencyCounter_FaultsQualified_info' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(10)',

#####SMI Fault Filtered Debug Info
    'SMI_InternalSensor_FilteredDebugInfo_U16'    => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultFilteredDebugInfo_u16_U16',
    'SMI_BGSensor_FilteredDebugInfo_U16'          => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultFilteredDebugInfo_u16_U16',
    'IMU1_AccXLgChl_FilteredDebugInfo_U16'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(0)_U16',
    'IMU1_AccXHgMonChl_FilteredDebugInfo_U16'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(1)_U16',
    'IMU1_AccYLgChl_FilteredDebugInfo_U16'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(2)_U16',
    'IMU1_AccYHgMonChl_FilteredDebugInfo_U16'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(3)_U16',
    'IMU1_AccZLgChl_FilteredDebugInfo_U16'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(4)_U16',
    'IMU1_RollRateLfChl_FilteredDebugInfo_U16'    => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(6)_U16',
    'IMU1_YawRateLfChl_FilteredDebugInfo_U16'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(7)_U16',
    'IMU1_PitchRateLfChl_FilteredDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(8)_U16',
    'IMU1_TemperatureChl_FilteredDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(9)_U16',
    'IMU1_FrequencyCounter_FilteredDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(10)_U16',

#####SMI Fault Filtered Debug Info
    'SMI_InternalSensor_FilteredDebugInfo'    => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultFilteredDebugInfo_u16',
    'SMI_BGSensor_FilteredDebugInfo'          => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultFilteredDebugInfo_u16',
    'IMU1_AccXLgChl_FilteredDebugInfo'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(0)',
    'IMU1_AccXHgMonChl_FilteredDebugInfo'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(1)',
    'IMU1_AccYLgChl_FilteredDebugInfo'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(2)',
    'IMU1_AccYHgMonChl_FilteredDebugInfo'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(3)',
    'IMU1_AccZLgChl_FilteredDebugInfo'        => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(4)',
    'IMU1_RollRateLfChl_FilteredDebugInfo'    => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(6)',
    'IMU1_YawRateLfChl_FilteredDebugInfo'     => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(7)',
    'IMU1_PitchRateLfChl_FilteredDebugInfo'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(8)',
    'IMU1_TemperatureChl_FilteredDebugInfo'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(9)',
    'IMU1_FrequencyCounter_FilteredDebugInfo' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(10)',

#####SMI Fault Disturbed Debug Info
    'SMI_InternalSensor_DisturbedDebugInfo_U16'  => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultDisturbedDebugInfo_u16_U16',
    'SMI_BGSensor_DisturbedDebugInfo_U16'        => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultDisturbedDebugInfo_u16_U16',
    'IMU1_AccXLgChl_DisturbedDebugInfo_U16'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(0)_U16',
    'IMU1_AccXHgMonChl_DisturbedDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(1)_U16',
    'IMU1_AccYLgChl_DisturbedDebugInfo_U16'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(2)_U16',
    'IMU1_AccYHgMonChl_DisturbedDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(3)_U16',
    'IMU1_AccZLgChl_DisturbedDebugInfo_U16'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(4)_U16',
    'IMU1_RollRateLfChl_DisturbedDebugInfo_U16'  => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(6)_U16',
    'IMU1_YawRateLfChl_DisturbedDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(7)_U16',
    'IMU1_PitchRateLfChl_DisturbedDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(8)_U16',
    'IMU1_TemperatureChl_DisturbedDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(9)_U16',

######Fault Qualified Info
##enum;rb_csem_DemStepsType_ten;rb_csem_TestNotDone_e;0;
##enum;rb_csem_DemStepsType_ten;rb_csem_TestDisturbed_e;1;
##enum;rb_csem_DemStepsType_ten;rb_csem_TestPassed_e;2;
##enum;rb_csem_DemStepsType_ten;rb_csem_TestFailed_e;3;

    'TestNotDone_C'   => 0,
    'TestDisturbed_C' => 1,
    'TestPassed_C'    => 2,
    'TestFailed_C'    => 3,

    'System_Warning_Indicator_State' => 'rb_wimi_SysWIStatus_aen(0)',

    #************************************************************************************************************************************************************************************************************
    #                               SMI Sensor Faults
    #************************************************************************************************************************************************************************************************************
    # the indexes for Dem_AllEventsMonitorStatus() array are the fault numbers,
    # which can be found in *.flt file

    #rb_csem_MonPermInitInertialSensor1_flt
    #rb_csem_MonPermInitInertialSensor2_flt
    #
    # MonPermInitSensorFlt
    #---------------------
    'InertialSensor1_MonPermInit_fltStatus_U8' => 'Dem_AllEventsMonitorStatus(__FAULTINDEX:rb_csem_MonPermInitInertialSensor1_flt__)_U8',
    'InertialSensor2_MonPermInit_fltStatus_U8' => 'Dem_AllEventsMonitorStatus(__FAULTINDEX:rb_csem_MonPermInitInertialSensor2_flt__)_U8',

    #rb_csem_MonPermBGInertialSensor1_flt
    #rb_csem_MonPermBGInertialSensor2_flt
    #
    # MonPermBGSensorFlt  ( Background:  Module Command: SD, MID, PAGE, CRC )
    #-------------------
    'InertialSensor1_MonPermBG_fltStatus_U8' => 'Dem_AllEventsMonitorStatus(__FAULTINDEX:rb_csem_MonPermBGInertialSensor1_flt__)_U8',
    'InertialSensor2_MonPermBG_fltStatus_U8' => 'Dem_AllEventsMonitorStatus(__FAULTINDEX:rb_csem_MonPermBGInertialSensor2_flt__)_U8',

    #rb_csem_MonTempAccXHgMonChl_flt
    #rb_csem_MonTempAccXLgChl_flt
    #rb_csem_MonTempAccYHgMonChl_flt
    #rb_csem_MonTempAccYLgChl_flt
    #rb_csem_MonTempAccYLgPlausiChl_flt
    #rb_csem_MonTempAccZLgChl_flt
    #rb_csem_MonTempPitchRateLfChl_flt
    #rb_csem_MonTempRollRateLfChl_flt
    #rb_csem_MonTempYawRateLfChl_flt
    #rb_csem_MonTempYawRateLfPlausiChl_flt
    #rb_csem_TempDspMonInertialSensor1_flt
    #rb_csem_TempDspMonInertialSensor2_flt
    #
    # MonTempChlFlt   ( Realtime: Sensor Data Command -> CN, Clipping )
    #--------------
    'AccXHgMonChl_MonTemp_fltStatus_U8'       => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempAccXHgMon_flt__)_U8',
    'AccXLgChl_MonTemp_fltStatus_U8'          => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempAccXLg_flt__)_U8',
    'AccYHgMonChl_MonTemp_fltStatus_U8'       => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempAccYHgMon_flt__)_U8',
    'AccYLgChl_MonTemp_fltStatus_U8'          => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempAccYLg_flt__)_U8',
    'AccZLgChl_MonTemp_fltStatus_U8'          => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempAccZLg_flt__)_U8',
    'AccZHgMonChl_MonTemp_fltStatus_U8'       => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempAccZHgMonChl_flt__)_U8',
    'PitchRateLfChl_MonTemp_fltStatus_U8'     => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempPitchRateLf_flt__)_U8',
    'RollRateLfChl_MonTemp_fltStatus_U8'      => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempRollRateLf_flt__)_U8',
    'YawRateLfChl_MonTemp_fltStatus_U8'       => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempYawRateLf_flt__)_U8',
    'Imu1TemperatureChl_MonTemp_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempImu1Temperature_flt__)_U8',
    'TemperatureChl_MonTemp_fltStatus_U8'     => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempImu1Temperature_flt__)_U8',
    'FrequencyCounter_MonTemp_fltStatus_U8'   => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempImu1FrequencyCounter_flt__)_U8',

    #rb_csem_MonPermAccXHgMonChl_flt
    #rb_csem_MonPermAccXLgChl_flt
    #rb_csem_MonPermAccYHgMonChl_flt
    #rb_csem_MonPermAccYLgChl_flt
    #rb_csem_MonPermAccYLgPlausiChl_flt
    #rb_csem_MonPermAccZLgChl_flt
    #rb_csem_MonPermPitchRateLfChl_flt
    #rb_csem_MonPermRollRateLfChl_flt
    #rb_csem_MonPermYawRateLfChl_flt
    #rb_csem_MonPermYawRateLfPlausiChl_flt
    #
    # MonPermChlFlt   ( Realtime: Sensor Data Command -> SD, SID, CRC   Module Command: SD, MID, PAGE, CRC )
    #--------------
    'AccXHgMonChl_MonPerm_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccXHgMonChl_flt__)_U8',
    'AccXLgChl_MonPerm_fltStatus_U8'    => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccXLgChl_flt__)_U8',
    'AccYHgMonChl_MonPerm_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccYHgMonChl_flt__)_U8',
    'AccYLgChl_MonPerm_fltStatus_U8'    => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccYLgChl_flt__)_U8',

    #	'AccYLgPlausiChl_MonPerm_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccYLgPlausiChl_flt__)_U8',
    'AccZLgChl_MonPerm_fltStatus_U8'          => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccZLgChl_flt__)_U8',
    'AccZHgMonChl_MonPerm_fltStatus_U8'       => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccZHgMonChl_flt__)_U8',
    'PitchRateLfChl_MonPerm_fltStatus_U8'     => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermPitchRateLfChl_flt__)_U8',
    'RollRateLfChl_MonPerm_fltStatus_U8'      => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermRollRateLfChl_flt__)_U8',
    'YawRateLfChl_MonPerm_fltStatus_U8'       => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermYawRateLfChl_flt__)_U8',
    'TemperatureChl_MonPerm_fltStatus_U8'     => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermImuTemperatureChl_flt__)_U8',
    'Imu1TemperatureChl_MonPerm_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermImuTemperatureChl_flt__)_U8',
    'SdpSensorTimeSyncError_fltStatus_U8'     => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_sdp_SensorTimeSyncError_flt__)_U8',

    #	'YawRateLfPlausiChl_MonPerm_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermYawRateLfPlausiChl_flt__)_U8',

    #rb_sdcm_FieldCalibMissing_flt
    #-----------------------------
    'FieldCalibMissing_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_sdcm_FieldCalibMissing_flt__)_U8',

    'InitCheckFailureCnt' => 'rb_csim_InitCheckFailureCnt_au8(0)_U8',

    #	Other faults
    #---------------
    #rb_syc_AsicIdMismatch_flt
    'AsicIdMismatch_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_syc_AsicIdMismatch_flt__)_U8',

    #rb_simc_SignalMonCtrlHighgXMon_flt
    #rb_simc_SignalMonCtrlHighgYMon_flt
    #rb_simc_SignalMonCtrlLowgX_flt
    #rb_simc_SignalMonCtrlLowgYPls_flt
    #rb_simc_SignalMonCtrlLowgY_flt
    #rb_simc_SignalMonCtrlLowgZ_flt
    #rb_simc_SignalMonCtrlPitchRateLf_flt
    #rb_simc_SignalMonCtrlRollRateLf_flt
    #rb_simc_SignalMonCtrlYawRateLfPls_flt
    #rb_simc_SignalMonCtrlYawRateLf_flt
    'AccXHgMonChl_SignalMonCtrl_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlHighgXMon_flt__)_U8',
    'AccYHgMonChl_SignalMonCtrl_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlHighgYMon_flt__)_U8',
    'AccXLgChl_SignalMonCtrl_fltStatus_U8'    => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlLowgX_flt__)_U8',

    #	'AccYLgPlausiChl_SignalMonCtrl_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlLowgYPls_flt__)_U8',
    'AccYLgChl_SignalMonCtrl_fltStatus_U8'      => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlLowgY_flt__)_U8',
    'AccZLgChl_SignalMonCtrl_fltStatus_U8'      => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlLowgZ_flt__)_U8',
    'PitchRateLfChl_SignalMonCtrl_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlPitchRateLf_flt__)_U8',
    'RollRateLfChl_SignalMonCtrl_fltStatus_U8'  => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlRollRateLf_flt__)_U8',

    #	'YawRateLfPlausiChl_SignalMonCtrl_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlYawRateLfPls_flt__)_U8',
    'YawRateLfChl_SignalMonCtrl_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlYawRateLf_flt__)_U8',
    'Init_DebugInfo_U16'                      => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultFilteredDebugInfo_u16_U16',
    'BgCycle_DebugInfo_U16'                   => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultFilteredDebugInfo_u16_U16',

    'BgCycle_DebugInfo' => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultFilteredDebugInfo_u16',
    'Init_DebugInfo'    => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultFilteredDebugInfo_u16_U16',

    #debounce counter
    'AccXLgChl_DebounceCounter' => 'rb_csem_DebounceCounters_st.SMIInitFaults_as32(0)_S32',
    'BGcycle_DebounceCounter'   => 'rb_csem_DebounceCounters_st.SMIBGFaults_as32(0)_S32',

    # 'Fault_DebounceCounter_Init_Mode'	=>  'rb_csem_DebounceCounters_st.SMIInitFaults_as32(0)',

    #Monitoring Phase
    'Monitoring_phase' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en_U8',

    #Fault status
    'Fault_Status_init'                   => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InternalSensorFaultsQualified_en_U8',
    'InternalSensor_FaultsQualified_info' => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InternalSensorFaultsQualified_en',
    'Fault_Status_BG'                     => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultsQualified_en_U8',

    # Configuration Data Inconsistent Flt
    #-------------------------------
    #rb_syc_ConfigurationDataInconsistent_flt

    'Imu1_ConfDataInconsistent_fltStatus_U8'            => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_syc_ConfigurationDataInconsistent_flt__)_U8',
    'InertialSensor2_ConfDataInconsistent_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_syc_ConfigurationDataInconsistent_flt__)_U8',

    'SpiRcvMsgCrcWrong_flt_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_spi_SpiRcvMsgCrcWrong_flt__)_U8',

    #  Acceleration channels_S16

    'AccXLgChl_S16'    => 'rb_csic_RtComRxPayload_au16(0)_S16',
    'AccXHgMonChl_S16' => 'rb_csic_RtComRxPayload_au16(1)_S16',
    'AccYLgChl_S16'    => 'rb_csic_RtComRxPayload_au16(2)_S16',
    'AccYHgMonChl_S16' => 'rb_csic_RtComRxPayload_au16(3)_S16',

    #	'AccYLgPlausiChl_S16'     => 'rb_csic_RtComRxPayload_au16(4)_S16',
    'AccZLgChl_S16'     => 'rb_csic_RtComRxPayload_au16(5)_S16',
    'RollRateLfChl_S16' => 'rb_csic_RtComRxPayload_au16(6)_S16',
    'YawRateLfChl_S16'  => 'rb_csic_RtComRxPayload_au16(7)_S16',

    #	'YawRateLfPlausiChl_S16'  => 'rb_csic_RtComRxPayload_au16(8)_S16',
    'PitchRateLfChl_S16' => 'rb_csic_RtComRxPayload_au16(9)_S16',

    #	System mode checkbox

    'ActualSystemMode_U16' => 'rb_bswm_ActualSystemMode_au16(0)',
    'ActualSystemMode_U8'  => 'rb_bswm_ActualSystemMode_au16(0)_U8',

    #	System Warning Indicator check

    'System_Warning_Indicator_State' => 'rb_wimi_SysWIStatus_aen(0)',

    #******************************************************************************
    #                               DTCs
    #******************************************************************************
    #    MonTempChl_flt
    #------------------
    'rb_csem_MonTempYawRateLf_flt'            => '0x000019',
    'rb_csem_MonTempAccXLg_flt'               => '0x000012',
    'rb_csem_MonTempAccYLg_flt'               => '0x000014',
    'rb_csem_MonTempAccXHgMon_flt'            => '0x000013',
    'rb_csem_MonTempAccYHgMon_flt'            => '0x000015',
    'rb_csem_MonTempRollRateLf_flt'           => '0x000018',
    'rb_csem_MonTempAccZLg_flt'               => '0x000017',
    'rb_csem_MonTempPitchRateLf_flt'          => '0x00001B',
    'rb_csem_MonTempImu1Temperature_flt'      => '0x001219',
    'rb_csem_MonTempImu1FrequencyCounter_flt' => '0x00121B',

    #    MonPermChl_flt
    #------------------
    'rb_csem_MonPermYawRateLfChl_flt'      => '0xF00049',
    'rb_csem_MonPermAccXLgChl_flt'         => '0xF00049',
    'rb_csem_MonPermAccYLgChl_flt'         => '0xF00049',
    'rb_csem_MonPermAccXHgMonChl_flt'      => '0xF00049',
    'rb_csem_MonPermAccYHgMonChl_flt'      => '0xF00049',
    'rb_csem_MonPermRollRateLfChl_flt'     => '0xF00049',
    'rb_csem_MonPermAccZLgChl_flt'         => '0xF00049',
    'rb_csem_MonPermPitchRateLfChl_flt'    => '0xF00049',
    'rb_csem_MonPermImuTemperatureChl_flt' => '0xF00049',

    #	'rb_csem_MonPermYawRateLfPlausiChl_flt'     => '0xF00049',
    #	'rb_csem_MonPermAccYLgPlausiChl_flt'        => '0xF00049',

    'rb_sdp_SensorTimeSyncError_flt' => '0x000081',

    'rb_simc_SignalMonCtrlYawRateLf_flt'   => '0xF00049',
    'rb_simc_SignalMonCtrlLowgX_flt'       => '0xF00049',
    'rb_simc_SignalMonCtrlLowgY_flt'       => '0xF00049',
    'rb_simc_SignalMonCtrlHighgXMon_flt'   => '0xF00049',
    'rb_simc_SignalMonCtrlHighgYMon_flt'   => '0xF00049',
    'rb_simc_SignalMonCtrlRollRateLf_flt'  => '0xF00049',
    'rb_simc_SignalMonCtrlLowgZ_flt'       => '0xF00049',
    'rb_simc_SignalMonCtrlPitchRateLf_flt' => '0xF00049',

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

    'LfmCounterValue_TempDSPMonInertialSensor1_flt_U8' => 'rb_lfm_LfmCntrs_au8(36)',
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
    'andMask_DeConf_InertialSensor1'             => '0x2F',
    'orMask_DeConf_InertialSensor1'              => '0x00',
    'restore_AsicConfigured_InertialSensor1_yes' => 'yes',

    #    De-configure InertialSensor2 sensor
    'varName_AsicConfigured_InertialSensor2'     => 'rb_syca_SysConfAsicEeData_dfst.AsicConfigured_ab8(0)',
    'andMask_DeConf_InertialSensor2'             => '0x1F',
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

    #    Set XLgFieldCalibThrValue 	to 735 (0x02DF)
    'varName_XLgFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(0).0',
    'andMask_XLgFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_XLgFieldCalibThrValue_Byte0'     => '0xDF',
    'restore_XLgFieldCalibThrValue_Byte0_no' => 'no',

    'varName_XLgFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(0).1',
    'andMask_XLgFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_XLgFieldCalibThrValue_Byte1'     => '0x02',
    'restore_XLgFieldCalibThrValue_Byte1_no' => 'no',

    #    Set YLgFieldCalibThrValue 	to 735 (0x02DF)
    'varName_YLgFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(1).0',
    'andMask_YLgFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_YLgFieldCalibThrValue_Byte0'     => '0xDF',
    'restore_YLgFieldCalibThrValue_Byte0_no' => 'no',

    'varName_YLgFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(1).1',
    'andMask_YLgFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_YLgFieldCalibThrValue_Byte1'     => '0x02',
    'restore_YLgFieldCalibThrValue_Byte1_no' => 'no',

    #    Set ZLgFieldCalibThrValue 	to 735 (0x02DF)
    'varName_ZLgFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(2).0',
    'andMask_ZLgFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_ZLgFieldCalibThrValue_Byte0'     => '0xDF',
    'restore_ZLgFieldCalibThrValue_Byte0_no' => 'no',

    'varName_ZLgFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(2).1',
    'andMask_ZLgFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_ZLgFieldCalibThrValue_Byte1'     => '0x02',
    'restore_ZLgFieldCalibThrValue_Byte1_no' => 'no',

    #    Set RollRateFieldCalibThrValue 	to 200 (0x00C8)
    'varName_RollRateFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(3).0',
    'andMask_RollRateFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_RollRateFieldCalibThrValue_Byte0'     => '0xC8',
    'restore_RollRateFieldCalibThrValue_Byte0_no' => 'no',

    'varName_RollRateFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(3).1',
    'andMask_RollRateFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_RollRateFieldCalibThrValue_Byte1'     => '0x00',
    'restore_RollRateFieldCalibThrValue_Byte1_no' => 'no',

    #    Set YawRateFieldCalibThrValue 	to 200 (0x00C8)
    'varName_YawRateFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(5).0',
    'andMask_YawRateFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_YawRateFieldCalibThrValue_Byte0'     => '0xC8',
    'restore_YawRateFieldCalibThrValue_Byte0_no' => 'no',

    'varName_YawRateFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(5).1',
    'andMask_YawRateFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_YawRateFieldCalibThrValue_Byte1'     => '0x00',
    'restore_YawRateFieldCalibThrValue_Byte1_no' => 'no',

    #    Set PitchRateFieldCalibThrValue 	to 200 (0x00C8)
    'varName_PitchRateFieldCalibThrValue_Byte0'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(4).0',
    'andMask_PitchRateFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_PitchRateFieldCalibThrValue_Byte0'     => '0xC8',
    'restore_PitchRateFieldCalibThrValue_Byte0_no' => 'no',

    'varName_PitchRateFieldCalibThrValue_Byte1'    => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibValue_as16(4).1',
    'andMask_PitchRateFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_PitchRateFieldCalibThrValue_Byte1'     => '0x00',
    'restore_PitchRateFieldCalibThrValue_Byte1_no' => 'no',

    #******************************************************************************
    #                          Field calibration
    #******************************************************************************
    #  SMI970 FieldCalibData
    #-----------------------
    # F1
    'AccXLgChl_FieldCalibValue_EE_S16'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(0)_S16',
    'AccYLgChl_FieldCalibValue_EE_S16'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(1)_S16',
    'AccZLgChl_FieldCalibValue_EE_S16'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(2)_S16',
    'RollRateLfChl_FieldCalibValue_EE_S16'  => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(3)_S16',
    'YawRateLfChl_FieldCalibValue_EE_S16'   => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(5)_S16',
    'PitchRateLfChl_FieldCalibValue_EE_S16' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(4)_S16',

    'AccXLgChl_FieldCalibValue_EE'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(0)',
    'AccYLgChl_FieldCalibValue_EE'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(1)',
    'AccZLgChl_FieldCalibValue_EE'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(2)',
    'RollRateLfChl_FieldCalibValue_EE'  => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(3)',
    'YawRateLfChl_FieldCalibValue_EE'   => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(5)',
    'PitchRateLfChl_FieldCalibValue_EE' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(4)',

    #  SMI970 FieldCalibValue Validity

    'AccXLgChl_FieldCalibValue_EE_V'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(0)',
    'AccYLgChl_FieldCalibValue_EE_V'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(1)',
    'AccZLgChl_FieldCalibValue_EE_V'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(2)',
    'RollRateLfChl_FieldCalibValue_EE_V'  => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(3)',
    'YawRateLfChl_FieldCalibValue_EE_V'   => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(5)',
    'PitchRateLfChl_FieldCalibValue_EE_V' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(4)',

    # F2
    'AccXLgChl_F2_FieldCalibValue_EE_S16'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(12)_S16',
    'AccYLgChl_F2_FieldCalibValue_EE_S16'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(13)_S16',
    'AccZLgChl_F2_FieldCalibValue_EE_S16'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(14)_S16',
    'RollRateLfChl_F2_FieldCalibValue_EE_S16'  => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(15)_S16',
    'YawRateLfChl_F2_FieldCalibValue_EE_S16'   => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(17)_S16',
    'PitchRateLfChl_F2_FieldCalibValue_EE_S16' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(16)_S16',

    'AccXLgChl_F2_FieldCalibValue_EE'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(12)',
    'AccYLgChl_F2_FieldCalibValue_EE'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(13)',
    'AccZLgChl_F2_FieldCalibValue_EE'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(14)',
    'RollRateLfChl_F2_FieldCalibValue_EE'  => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(15)',
    'YawRateLfChl_F2_FieldCalibValue_EE'   => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(17)',
    'PitchRateLfChl_F2_FieldCalibValue_EE' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(16)',

    'AccXLgChl_F2_FieldCalibValue_EE_V'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(12)',
    'AccYLgChl_F2_FieldCalibValue_EE_V'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(13)',
    'AccZLgChl_F2_FieldCalibValue_EE_V'      => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(14)',
    'RollRateLfChl_F2_FieldCalibValue_EE_V'  => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(15)',
    'YawRateLfChl_F2_FieldCalibValue_EE_V'   => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(17)',
    'PitchRateLfChl_F2_FieldCalibValue_EE_V' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibValue_as16(16)',

    #    Field Calibration repitition counter
    'Field_Calibration_Counter_U8' => 'rb_sfc_ImuFieldCalibration_st.Cnt_u8_U8',
    'Field_Calibration_Counter'    => 'rb_sfc_ImuFieldCalibration_st.Cnt_u8',

    #	Field calibration Status
    'Field_Calibration_Status_U8' => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibStatus_u32_U8',
    'Field_Calibration_Status'    => 'rb_sdcm_ImuFieldCalibData_st.FieldCalibStatus_u32',

    #	Field calibration Status NVM
    'Field_Calibration_Status_NVM_Var' => 'rb_sdcm_ImuFieldCalibData_dfst.FieldCalibStatus_u32',

    #	Field calibration State
    'Field_Calibration_State_U8' => 'rb_sfc_ImuFieldCalibration_st.Info_st.FieldCalibState_u8_U8',
    'Field_Calibration_State'    => 'rb_sfc_ImuFieldCalibration_st.Info_st.FieldCalibState_u8',

    #	Field calibration Status
    'Field_Calibration_Failure_Reason_U16' => 'rb_sfc_ImuFieldCalibration_st.Info_st.FieldCalibFailureReason_b16_U16',
    'Field_Calibration_Failure_Reason'     => 'rb_sfc_ImuFieldCalibration_st.Info_st.FieldCalibFailureReason_b16',

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

###  Plant Calibration
    # SMI970 F1
    'Imu1_PlantCalibCorrectedData_AccXLgChl_S16'      => 'rb_sdcm_PlantCalibCorrData_aast(0)(0).ChlData_s16_S16',
    'Imu1_PlantCalibCorrectedData_AccYLgChl_S16'      => 'rb_sdcm_PlantCalibCorrData_aast(0)(1).ChlData_s16_S16',
    'Imu1_PlantCalibCorrectedData_AccZLgChl_S16'      => 'rb_sdcm_PlantCalibCorrData_aast(0)(2).ChlData_s16_S16',
    'Imu1_PlantCalibCorrectedData_RollRateLfChl_S16'  => 'rb_sdcm_PlantCalibCorrData_aast(0)(3).ChlData_s16_S16',
    'Imu1_PlantCalibCorrectedData_PitchRateLfChl_S16' => 'rb_sdcm_PlantCalibCorrData_aast(0)(4).ChlData_s16_S16',
    'Imu1_PlantCalibCorrectedData_YawRateLfChl_S16'   => 'rb_sdcm_PlantCalibCorrData_aast(0)(5).ChlData_s16_S16',

    'Imu1_PlantCalibCorrectedData_AccXLgChl'      => 'rb_sdcm_PlantCalibCorrData_aast(0)(0).ChlData_s16',
    'Imu1_PlantCalibCorrectedData_AccYLgChl'      => 'rb_sdcm_PlantCalibCorrData_aast(0)(1).ChlData_s16',
    'Imu1_PlantCalibCorrectedData_AccZLgChl'      => 'rb_sdcm_PlantCalibCorrData_aast(0)(2).ChlData_s16',
    'Imu1_PlantCalibCorrectedData_RollRateLfChl'  => 'rb_sdcm_PlantCalibCorrData_aast(0)(3).ChlData_s16',
    'Imu1_PlantCalibCorrectedData_PitchRateLfChl' => 'rb_sdcm_PlantCalibCorrData_aast(0)(4).ChlData_s16',
    'Imu1_PlantCalibCorrectedData_YawRateLfChl'   => 'rb_sdcm_PlantCalibCorrData_aast(0)(5).ChlData_s16',

    # SMI970 F1
    'Imu1_PlantCalibCorrectedData_AccXLgChl_V'      => 'rb_sdcm_PlantCalibCorrData_aast(0)(0).ChlData_s16_S16',
    'Imu1_PlantCalibCorrectedData_AccYLgChl_V'      => 'rb_sdcm_PlantCalibCorrData_aast(0)(1).ChlData_s16_S16',
    'Imu1_PlantCalibCorrectedData_AccZLgChl_V'      => 'rb_sdcm_PlantCalibCorrData_aast(0)(2).ChlData_s16_S16',
    'Imu1_PlantCalibCorrectedData_RollRateLfChl_V'  => 'rb_sdcm_PlantCalibCorrData_aast(0)(3).ChlData_s16_S16',
    'Imu1_PlantCalibCorrectedData_PitchRateLfChl_V' => 'rb_sdcm_PlantCalibCorrData_aast(0)(4).ChlData_s16_S16',
    'Imu1_PlantCalibCorrectedData_YawRateLfChl_V'   => 'rb_sdcm_PlantCalibCorrData_aast(0)(5).ChlData_s16_S16',

    # Plant calibration status
    #SMI970
    'Imu1_PlantCalibCorrectedData_ChlStatus_AccXLgChl_U8' => 'rb_sdcm_PlantCalibCorrData_aast(0)(0).ChlStatus_en_U8',
    'Imu1_PlantCalibCorrectedData_ChlStatus_AccYLgChl_U8' => 'rb_sdcm_PlantCalibCorrData_aast(0)(1).ChlStatus_en_U8',
    'Imu1_PlantCalibCorrectedData_ChlStatus_AccZLgChl_U8' => 'rb_sdcm_PlantCalibCorrData_aast(0)(2).ChlStatus_en_U8',
    'Imu1_PlantCalibCorrectedData_ChlStatus_RollRate_U8'  => 'rb_sdcm_PlantCalibCorrData_aast(0)(3).ChlStatus_en_U8',
    'Imu1_PlantCalibCorrectedData_ChlStatus_PitchRate_U8' => 'rb_sdcm_PlantCalibCorrData_aast(0)(4).ChlStatus_en_U8',
    'Imu1_PlantCalibCorrectedData_ChlStatus_YawRate_U8'   => 'rb_sdcm_PlantCalibCorrData_aast(0)(5).ChlStatus_en_U8',

    'Imu1_PlantCalibCorrectedData_ChlStatus_AccXLgChl' => 'rb_sdcm_PlantCalibCorrData_aast(0)(0).ChlStatus_en',
    'Imu1_PlantCalibCorrectedData_ChlStatus_AccYLgChl' => 'rb_sdcm_PlantCalibCorrData_aast(0)(1).ChlStatus_en',
    'Imu1_PlantCalibCorrectedData_ChlStatus_AccZLgChl' => 'rb_sdcm_PlantCalibCorrData_aast(0)(2).ChlStatus_en',
    'Imu1_PlantCalibCorrectedData_ChlStatus_RollRate'  => 'rb_sdcm_PlantCalibCorrData_aast(0)(3).ChlStatus_en',
    'Imu1_PlantCalibCorrectedData_ChlStatus_PitchRate' => 'rb_sdcm_PlantCalibCorrData_aast(0)(4).ChlStatus_en',
    'Imu1_PlantCalibCorrectedData_ChlStatus_YawRate'   => 'rb_sdcm_PlantCalibCorrData_aast(0)(5).ChlStatus_en',

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

    #	ImuOffsCalcSampleCntRT
    #--------------------------
    'Field_Calibration_ImuOffsCalcSampleCntRT_U16' => 'rb_sfc_ImuOffsCalcSampleCntRT_u16_U16',

    #	ImuOffsCalcDataBufRT
    #--------------------------
    'AccXLgChl_ImuOffsCalcDataBufRT_S32'      => 'rb_sfc_ImuOffsCalcDataBufRT_as32(0)_S32',
    'AccYLgChl_ImuOffsCalcDataBufRT_S32'      => 'rb_sfc_ImuOffsCalcDataBufRT_as32(1)_S32',
    'AccZLgChl_ImuOffsCalcDataBufRT_S32'      => 'rb_sfc_ImuOffsCalcDataBufRT_as32(2)_S32',
    'RollRateLfChl_ImuOffsCalcDataBufRT_S32'  => 'rb_sfc_ImuOffsCalcDataBufRT_as32(3)_S32',
    'PitchRateLfChl_ImuOffsCalcDataBufRT_S32' => 'rb_sfc_ImuOffsCalcDataBufRT_as32(4)_S32',
    'YawRateLfChl_ImuOffsCalcDataBufRT_S32'   => 'rb_sfc_ImuOffsCalcDataBufRT_as32(5)_S32',

    #	Fieldcalibration Offsets(Mean Values)
    #--------------------------
    'AccXLgChl_FieldCalibration_Offsets_S32'      => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(0)_S32',
    'AccYLgChl_FieldCalibration_Offsets_S32'      => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(1)_S32',
    'AccZLgChl_FieldCalibration_Offsets_S32'      => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(2)_S32',
    'RollRateLfChl_FieldCalibration_Offsets_S32'  => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(3)_S32',
    'PitchRateLfChl_FieldCalibration_Offsets_S32' => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(4)_S32',
    'YawRateLfChl_FieldCalibration_Offsets_S32'   => 'rb_sfc_ImuFieldCalibration_st.Offsets_as32(5)_S32',

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

    #####SMI Fault Debounce counter Info
    'SMI_InternalSensor_Fault_DebounceCounter_S32'       => 'rb_csem_DebounceCounters_st.SMIInitFaults_as32(0)_S32',
    'SMI_BGSensor_Fault_DebounceCounter_S32'             => 'rb_csem_DebounceCounters_st.SMIBGFaults_as32(0)_S32',
    'IMU1_Perm_AccXLgChl_Fault_DebounceCounter_S32'      => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(0)_S32',
    'IMU1_Perm_AccXHgMonChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(1)_S32',
    'IMU1_Perm_AccYLgChl_Fault_DebounceCounter_S32'      => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(2)_S32',
    'IMU1_Perm_AccYHgMonChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(3)_S32',
    'IMU1_Perm_AccZLgChl_Fault_DebounceCounter_S32'      => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(4)_S32',
    'IMU1_Perm_RollRateLfChl_Fault_DebounceCounter_S32'  => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(6)_S32',
    'IMU1_Perm_YawRateLfChl_Fault_DebounceCounter_S32'   => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(7)_S32',
    'IMU1_Perm_PitchRateLfChl_Fault_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(8)_S32',
    'IMU1_Perm_TemperatureChl_Fault_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(0)(9)_S32',

    #####SMI Fault Monitoring Phage Info
    'IMU1_Fault_Monitoring_Phage'    => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en',
    'IMU1_Fault_Monitoring_Phage_U8' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.MonitoringPhase_en_U8',

    #####SMI Fault Qualified Info
    'SMI_InternalSensor_FaultsQualified_info_U8'  => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InternalSensorFaultsQualified_en_U8',
    'SMI_BGSensor_FaultsQualified_info_U8'        => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultsQualified_en_U8',
    'IMU1_AccXLgChl_FaultsQualified_info_U8'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(0)_U8',
    'IMU1_AccXHgMonChl_FaultsQualified_info_U8'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(1)_U8',
    'IMU1_AccYLgChl_FaultsQualified_info_U8'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(2)_U8',
    'IMU1_AccYHgMonChl_FaultsQualified_info_U8'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(3)_U8',
    'IMU1_AccZLgChl_FaultsQualified_info_U8'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(4)_U8',
    'IMU1_RollRateLfChl_FaultsQualified_info_U8'  => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(6)_U8',
    'IMU1_YawRateLfChl_FaultsQualified_info_U8'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(7)_U8',
    'IMU1_PitchRateLfChl_FaultsQualified_info_U8' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(8)_U8',
    'IMU1_TemperatureChl_FaultsQualified_info_U8' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(9)_U8',

#####SMI Fault Filtered Debug Info
    'SMI_InternalSensor_FilteredDebugInfo_U16'  => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultFilteredDebugInfo_u16_U16',
    'SMI_BGSensor_FilteredDebugInfo_U16'        => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultFilteredDebugInfo_u16_U16',
    'IMU1_AccXLgChl_FilteredDebugInfo_U16'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(0)_U16',
    'IMU1_AccXHgMonChl_FilteredDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(1)_U16',
    'IMU1_AccYLgChl_FilteredDebugInfo_U16'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(2)_U16',
    'IMU1_AccYHgMonChl_FilteredDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(3)_U16',
    'IMU1_AccZLgChl_FilteredDebugInfo_U16'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(4)_U16',
    'IMU1_RollRateLfChl_FilteredDebugInfo_U16'  => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(6)_U16',
    'IMU1_YawRateLfChl_FilteredDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(7)_U16',
    'IMU1_PitchRateLfChl_FilteredDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(8)_U16',
    'IMU1_TemperatureChl_FilteredDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(9)_U16',

#####SMI Fault Filtered Debug Info
    'SMI_InternalSensor_FilteredDebugInfo'  => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultFilteredDebugInfo_u16',
    'SMI_BGSensor_FilteredDebugInfo'        => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultFilteredDebugInfo_u16',
    'IMU1_AccXLgChl_FilteredDebugInfo'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(0)',
    'IMU1_AccXHgMonChl_FilteredDebugInfo'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(1)',
    'IMU1_AccYLgChl_FilteredDebugInfo'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(2)',
    'IMU1_AccYHgMonChl_FilteredDebugInfo'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(3)',
    'IMU1_AccZLgChl_FilteredDebugInfo'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(4)',
    'IMU1_RollRateLfChl_FilteredDebugInfo'  => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(6)',
    'IMU1_YawRateLfChl_FilteredDebugInfo'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(7)',
    'IMU1_PitchRateLfChl_FilteredDebugInfo' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(8)',
    'IMU1_TemperatureChl_FilteredDebugInfo' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultFilteredDebugInfo_au16(9)',

#####SMI Fault Disturbed Debug Info
    'SMI_InternalSensor_DisturbedDebugInfo_U16'  => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).InitSensorFaultDisturbedDebugInfo_u16_U16',
    'SMI_BGSensor_DisturbedDebugInfo_U16'        => 'rb_csem_FaultStorageData_st.InfoClusterSensorSMI_ast(0).BgSensorFaultDisturbedDebugInfo_u16_U16',
    'IMU1_AccXLgChl_DisturbedDebugInfo_U16'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(0)_U16',
    'IMU1_AccXHgMonChl_DisturbedDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(1)_U16',
    'IMU1_AccYLgChl_DisturbedDebugInfo_U16'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(2)_U16',
    'IMU1_AccYHgMonChl_DisturbedDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(3)_U16',
    'IMU1_AccZLgChl_DisturbedDebugInfo_U16'      => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(4)_U16',
    'IMU1_RollRateLfChl_DisturbedDebugInfo_U16'  => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(6)_U16',
    'IMU1_YawRateLfChl_DisturbedDebugInfo_U16'   => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(7)_U16',
    'IMU1_PitchRateLfChl_DisturbedDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(8)_U16',
    'IMU1_TemperatureChl_DisturbedDebugInfo_U16' => 'rb_csem_FaultStorageData_st.InfoClusterChannelSMI_st.ChannelFaultDisturbedDebugInfo_au16(9)_U16',

    # Debounce counter vaiables
    'AccXLgChl_DebounceCounter_S32'          => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(0)_S32',
    'AccXHgMonChl_DebounceCounter_S32'       => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(1)_S32',
    'AccYLgChl_DebounceCounter_S32'          => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(2)_S32',
    'AccYHgMonChl_DebounceCounter_S32'       => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(3)_S32',
    'AccZLgChl_DebounceCounter_S32'          => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(4)_S32',
    'RollRateLfChl_DebounceCounter_S32'      => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(6)_S32',
    'YawRateLfChl_DebounceCounter_S32'       => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(7)_S32',
    'PitchRateLfChl_DebounceCounter_S32'     => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(8)_S32',
    'Imu1TemperatureChl_DebounceCounter_S32' => 'rb_csem_DebounceCounters_st.SMIChannelFaults_as32(1)(9)_S32',

    ####	For Dequalification of CSEM Faults
    'Max_CSEM_faults' => 26,
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
##########For Perm SMU Faults
    'CSEM_Fault_Qualified_NVM_Var17' => 'rb_csem_FaultStorageData_dfst.InfoClusterSensorSMI_ast(1).InternalSensorFaultsQualified_en', #IMU2_Internal
    'CSEM_Fault_Qualified_NVM_Var18' => 'rb_csem_FaultStorageData_dfst.InfoClusterSensorSMI_ast(1).BgSensorFaultsQualified_en',       #IMU2_BG
    'CSEM_Fault_Qualified_NVM_Var19' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(11)',    #IMU2_XLg
    ###### 'CSEM_Fault_Qualified_NVM_Var20'  => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(12)',		#IMU2_XHg (Not_Configured)
    'CSEM_Fault_Qualified_NVM_Var20' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(13)',    #IMU2_YLG
    ####### 'CSEM_Fault_Qualified_NVM_Var21'  => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(14)',	#IMU2_YHG (Not_Configured)
    'CSEM_Fault_Qualified_NVM_Var21' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(15)',    #IMU2_ZLg
    ####### 'CSEM_Fault_Qualified_NVM_Var22'  => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(16)',	#IMU2_ZHg (Not_Configured)
    'CSEM_Fault_Qualified_NVM_Var22' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(17)',    #IMU2_RollRate
    'CSEM_Fault_Qualified_NVM_Var23' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(18)',    #IMU2_Yawrate
    'CSEM_Fault_Qualified_NVM_Var24' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(19)',    #IMU2_Pitchrate
    'CSEM_Fault_Qualified_NVM_Var25' => 'rb_csem_FaultStorageData_dfst.InfoClusterChannelSMI_st.ChannelFaultQualified_aen(0)(20)',    #IMU2_Temperature

    #	NVM Copy of InitErrorData Flags to clear in finalization    #define same variables in SMU and SMA and for SMU index will change
    'Imu_InitErrorData_ClusterFlags' => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ClusterFlags_u16',
    'Imu_InitErrorData_ErrorFlags0'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(0)',
    'Imu_InitErrorData_ErrorFlags1'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(1)',
    'Imu_InitErrorData_ErrorFlags2'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(2)',
    'Imu_InitErrorData_ErrorFlags3'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(3)',
    'Imu_InitErrorData_ErrorFlags4'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(4)',
    'Imu_InitErrorData_ErrorFlags5'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(5)',
    'Imu_InitErrorData_ErrorFlags6'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(6)',
    'Imu_InitErrorData_ErrorFlags7'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(7)',
    'Imu_InitErrorData_ErrorFlags8'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(8)',
    'Imu_InitErrorData_ErrorFlags9'  => 'rb_csem_InitErrorData_dfst.InitErrorData_ast(0).ErrorFlags_au16(9)',
};

1;
__END__
