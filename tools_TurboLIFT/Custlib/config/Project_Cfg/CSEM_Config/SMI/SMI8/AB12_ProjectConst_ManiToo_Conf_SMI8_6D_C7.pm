package LIFT_PROJECT;

#use strict;
use warnings;

$Defaults->{'TEMP_OPTIONAL_FAULTS'} = [ 'rb_coa_VehSpdRxMsgTimeout_flt' ];

$Defaults->{'PARA_MAP_CONF_SMI8_6D_C7'} = {

    # maximum nuber of repetitions for "not passed" test cases
    'MAX_TC_REPETITION'      => 0,
    'Project_Line'           => 'RT4',
    'FILTER1_RAW_CONFIGURED' => 'yes',
                                          # 'FILTER1_CALIBRATED_CONFIGURED'		=>	'yes',
                                          # 'FILTER2_RAW_CONFIGURED'			=>	'yes',

    #******************************************************************************
    #                         Fast Diagnosis Trigger
    #******************************************************************************

    'Trigger_Value_C'           => 140,
    'Trigger_YawRateLfChl_S16'  => 'rb_cs7c_RtComRxPayload_au16(6)_S16',
    'Trigger_AccXLgChl_S16'     => 'rb_cs7c_RtComRxPayload_au16(0)_S16',
    'Trigger_RollRateLfChl_S16' => 'rb_cs7c_RtComRxPayload_au16(5)_S16',

    'TempFaultQualiTimeMin_C' => 0,
    'TempFaultQualiTimeMax_C' => 88, #mazda config

    #******************************************************************************
    #                                API to Algo
    #******************************************************************************
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccX_e;0;SMA_ax_highG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccY_e;1;SMA_ay_highG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccX_e;2;SMA_ax_highG_redundant
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccY_e;3;SMA_ay_highG_redundant
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccZ_e;4;SMA_az_midG
	
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXLg_e;5;SMI_ax_lowG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXHgMon_e;6;SMI_ax_midG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLg_e;7;SMI_ay_lowG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYHgMon_e;8;SMI_ay_midG
	
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccZLg_e;9;SMI_az_lowG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_RollRateLf_e;10;SMI_rateX
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLf_e;11;SMI_rateZ
	
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_CentralSensorChannelsMax_e;12;gives the total number of supported  central sensor channels.
    #
    #AlgoDataValid
    #----------------------------------------------
    'AccXLgChl_AlgoDataValid_U8'    => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
    'AccXHgMonChl_AlgoDataValid_U8' => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
    'AccYLgChl_AlgoDataValid_U8'    => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
    'AccYHgMonChl_AlgoDataValid_U8' => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',

    #	'AccYLgPlausiChl_AlgoDataValid_U8'   		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'AccZLgChl_AlgoDataValid_U8'     => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'RollRateLfChl_AlgoDataValid_U8' => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'YawRateLfChl_AlgoDataValid_U8'  => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',

    #	'YawRateLfPlausiChl_AlgoDataValid_U8'		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    # 'PitchRateLfChl_AlgoDataValid_U8' => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',

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
    # 'PitchRateLfChl_AlgoDataValid_U16' => 'rb_csem_SensorDataRT_st.DataValid_b32_U16',

    #AlgoDataValid_b32.0
    #-------------------
    'AlgoDataValid_b32.0_U8'           => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
    'AccXLgChl_AlgoData_NotValid_C'    => '0bxx0xxxxx',
    'AccXLgChl_AlgoData_Valid_C'       => '0bxx1xxxxx',
    'AccXHgMonChl_AlgoData_NotValid_C' => '0bx0xxxxxx',
    'AccXHgMonChl_AlgoData_Valid_C'    => '0bx1xxxxxx',
    'AccYLgChl_AlgoData_NotValid_C'    => '0b0xxxxxxx',
    'AccYLgChl_AlgoData_Valid_C'       => '0b1xxxxxxx',

    #AlgoDataValid_b32.1
    #-------------------
    'AlgoDataValid_b32.1_U8'           => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
    'AccYHgMonChl_AlgoData_NotValid_C' => '0bxxxxxxx0',
    'AccYHgMonChl_AlgoData_Valid_C'    => '0bxxxxxxx1',

    #	'AccYLgPlausiChl_AlgoData_NotValid_C'    	=> '0bxxxxxx0x',
    #	'AccYLgPlausiChl_AlgoData_Valid_C'       	=> '0bxxxxxx1x',
    'AccZLgChl_AlgoData_NotValid_C'     => '0bxxxxxx0x',
    'AccZLgChl_AlgoData_Valid_C'        => '0bxxxxxx1x',
    'RollRateLfChl_AlgoData_NotValid_C' => '0bxxxxx0xx',
    'RollRateLfChl_AlgoData_Valid_C'    => '0bxxxxx1xx',
    'YawRateLfChl_AlgoData_NotValid_C'  => '0bxxxx0xxx',
    'YawRateLfChl_AlgoData_Valid_C'     => '0bxxxx1xxx',

    #	'YawRateLfPlausiChl_AlgoData_NotValid_C' 	=> '0bxx0xxxxx',
    #	'YawRateLfPlausiChl_AlgoData_Valid_C'    	=> '0bxx1xxxxx',
    # 'PitchRateLfChl_AlgoData_NotValid_C' => '0bx0xxxxxx',
    # 'PitchRateLfChl_AlgoData_Valid_C'    => '0bx1xxxxxx',

    #AlgoDataValid_b32
    #-----------------
    'AlgoDataValid_V' => 'rb_csem_SensorDataRT_st.DataValid_b32',

    #    YawRateLf, RollRateLfChl, AccZLgChl, AccYHgMonChl, AccYLgChl, AccXHgMonChl, AccXLgChl
    'InertialSensor1_AlgoData_NotValid_C' => '0bxxxxxxxxxxxxxxxxxxxx0000000xxxxx',
    'InertialSensor1_AlgoData_Valid_C'    => '0bxxxxxxxxxxxxxxxxxxxx1111111xxxxx',

    #    PitchRateLfChl
    # 'InertialSensor2_AlgoData_NotValid_C' => '0bxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxx',
    # 'InertialSensor2_AlgoData_Valid_C'    => '0bxxxxxxxxxxxxxxxxx1xxxxxxxxxxxxxx',

    'AccXLgChl_AlgoData32_NotValid_C'      => '0bxxxxxxxxxxxxxxxxxxxxxxxxxx0xxxxx',
    'AccXLgChl_AlgoData32_Valid_C'         => '0bxxxxxxxxxxxxxxxxxxxxxxxxxx1xxxxx',
    'AccXHgMonChl_AlgoData32_NotValid_C'   => '0bxxxxxxxxxxxxxxxxxxxxxxxxx0xxxxxx',
    'AccXHgMonChl_AlgoData32_Valid_C'      => '0bxxxxxxxxxxxxxxxxxxxxxxxxx1xxxxxx',
    'AccYLgChl_AlgoData32_NotValid_C'      => '0bxxxxxxxxxxxxxxxxxxxxxxxx0xxxxxxx',
    'AccYLgChl_AlgoData32_Valid_C'         => '0bxxxxxxxxxxxxxxxxxxxxxxxx1xxxxxxx',
    'AccYHgMonChl_AlgoData32_NotValid_C'   => '0bxxxxxxxxxxxxxxxxxxxxxxx0xxxxxxxx',
    'AccYHgMonChl_AlgoData32_Valid_C'      => '0bxxxxxxxxxxxxxxxxxxxxxxx1xxxxxxxx',
    'AccZLgChl_AlgoData32_NotValid_C'      => '0bxxxxxxxxxxxxxxxxxxxxxx0xxxxxxxxx',
    'AccZLgChl_AlgoData32_Valid_C'         => '0bxxxxxxxxxxxxxxxxxxxxxx1xxxxxxxxx',
    'RollRateLfChl_AlgoData32_NotValid_C'  => '0bxxxxxxxxxxxxxxxxxxxx0xxxxxxxxxxx',
    'RollRateLfChl_AlgoData32_Valid_C'     => '0bxxxxxxxxxxxxxxxxxxxx1xxxxxxxxxxx',
    'YawRateLfChl_AlgoData32_NotValid_C'   => '0bxxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxx',
    'YawRateLfChl_AlgoData32_Valid_C'      => '0bxxxxxxxxxxxxxxxxxxx1xxxxxxxxxxxx',
    # 'PitchRateLfChl_AlgoData32_NotValid_C' => '0bxxxxxxxxxxxxxxxxx0011101111xxxxx',
    # 'PitchRateLfChl_AlgoData32_Valid_C'    => '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',

    'AccXLgChl_AlgoData32_NotConfig_NotValid_C'      => '0bxxxxxxxxxxxxxxxxxxxx0000000xxxxx',
    'AccXLgChl_AlgoData32_NotConfig_Valid_C'         => '0bxxxxxxxxxxxxxxxxxxxx1111111xxxxx',
    'AccYLgChl_AlgoData32_NotConfig_NotValid_C'      => '0bxxxxxxxxxxxxxxxxxxxx0000000xxxxx',
    'AccYLgChl_AlgoData32_NotConfig_Valid_C'         => '0bxxxxxxxxxxxxxxxxxxxx1111111xxxxx',
    'AccZLgChl_AlgoData32_NotConfig_NotValid_C'      => '0bxxxxxxxxxxxxxxxxxxxx0000000xxxxx',
    'AccZLgChl_AlgoData32_NotConfig_Valid_C'         => '0bxxxxxxxxxxxxxxxxxxxx1111111xxxxx',
    'RollRateLfChl_AlgoData32_NotConfig_NotValid_C'  => '0bxxxxxxxxxxxxxxxxxxxx0000000xxxxx',
    'RollRateLfChl_AlgoData32_NotConfig_Valid_C'     => '0bxxxxxxxxxxxxxxxxxxxx1111111xxxxx',
    'YawRateLfChl_AlgoData32_NotConfig_NotValid_C'   => '0bxxxxxxxxxxxxxxxxxxxx0000000xxxxx',
    'YawRateLfChl_AlgoData32_NotConfig_Valid_C'      => '0bxxxxxxxxxxxxxxxxxxxx1111111xxxxx',
    # 'PitchRateLfChl_AlgoData32_NotConfig_NotValid_C' => '0bxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxx',
    # 'PitchRateLfChl_AlgoData32_NotConfig_Valid_C'    => '0bxxxxxxxxxxxxxxxxx1xxxxxxxxxxxxxx',

    #InertDataOverload
    #----------------------------------------------
    'AccXLgChl_InertDataOverload_U8'    => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
    'AccXHgMonChl_InertDataOverload_U8' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
    'AccYLgChl_InertDataOverload_U8'    => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',

    'AccYHgMonChl_InertDataOverload_U8' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',

    #	'AccYLgPlausiChl_InertDataOverload_U8'   	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
    'AccZLgChl_InertDataOverload_U8'     => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
    'RollRateLfChl_InertDataOverload_U8' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
    'YawRateLfChl_InertDataOverload_U8'  => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',

    #	'YawRateLfPlausiChl_InertDataOverload_U8'	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
    # 'PitchRateLfChl_InertDataOverload_U8' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',

    #InertDataOverload_b32.0
    #-----------------------
    'AccXLgChl_InertDataOverload_0_C'    => '0bxx0xxxxx',
    'AccXLgChl_InertDataOverload_1_C'    => '0bxx1xxxxx',
    'AccXHgMonChl_InertDataOverload_0_C' => '0bx0xxxxxx',
    'AccXHgMonChl_InertDataOverload_1_C' => '0bx1xxxxxx',
    'AccYLgChl_InertDataOverload_0_C'    => '0b0xxxxxxx',
    'AccYLgChl_InertDataOverload_1_C'    => '0b1xxxxxxx',

    #InertDataOverload_b32.1
    #-----------------------
    'AccYHgMonChl_InertDataOverload_0_C' => '0bxxxxxxx0',
    'AccYHgMonChl_InertDataOverload_1_C' => '0bxxxxxxx1',

    #	'AccYLgPlausiChl_InertDataOverload_0_C'    	=> '0bxxxxxx0x',
    #	'AccYLgPlausiChl_InertDataOverload_1_C'    	=> '0bxxxxxx1x',
    'AccZLgChl_InertDataOverload_0_C'     => '0bxxxxxx0x',
    'AccZLgChl_InertDataOverload_1_C'     => '0bxxxxxx1x',
    'RollRateLfChl_InertDataOverload_0_C' => '0bxxxxx0xx',
    'RollRateLfChl_InertDataOverload_1_C' => '0bxxxxx1xx',
    'YawRateLfChl_InertDataOverload_0_C'  => '0bxxxx0xxx',
    'YawRateLfChl_InertDataOverload_1_C'  => '0bxxxx1xxx',

    #	'YawRateLfPlausiChl_InertDataOverload_0_C' 	=> '0bxx0xxxxx',
    #	'YawRateLfPlausiChl_InertDataOverload_1_C' 	=> '0bxx1xxxxx',
    # 'PitchRateLfChl_InertDataOverload_0_C' => '0bx0xxxxxx',
    # 'PitchRateLfChl_InertDataOverload_1_C' => '0bx1xxxxxx',

    # SensorDataComFaultRT (requirement from Toyota, related to CRC fault)
    #----------------------------------------------
    'AccXLgChl_SensorDataComFaultRT_U8'    => 'rb_csem_SensorDataComFaultRT_b32_U8',
    'AccXHgMonChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32_U8',
    'AccYLgChl_SensorDataComFaultRT_U8'    => 'rb_csem_SensorDataComFaultRT_b32_U8',

    'AccYHgMonChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32.1_U8',

    #	'AccYLgPlausiChl_SensorDataComFaultRT_U8'   	=> 'rb_csem_SensorDataComFaultRT_b32.1_U8',
    'AccZLgChl_SensorDataComFaultRT_U8'     => 'rb_csem_SensorDataComFaultRT_b32.1_U8',
    'RollRateLfChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32.1_U8',
    'YawRateLfChl_SensorDataComFaultRT_U8'  => 'rb_csem_SensorDataComFaultRT_b32.1_U8',

    #	'YawRateLfPlausiChl_SensorDataComFaultRT_U8'	=> 'rb_csem_SensorDataComFaultRT_b32.1_U8',
    # 'PitchRateLfChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32.1_U8',

    #SensorDataComFaultRT_b32.0
    #-----------------------
    'AccXLgChl_SensorDataComFaultRT_0_C'    => '0bxx0xxxxx',
    'AccXLgChl_SensorDataComFaultRT_1_C'    => '0bxx1xxxxx',
    'AccXHgMonChl_SensorDataComFaultRT_0_C' => '0bx0xxxxxx',
    'AccXHgMonChl_SensorDataComFaultRT_1_C' => '0bx1xxxxxx',
    'AccYLgChl_SensorDataComFaultRT_0_C'    => '0b0xxxxxxx',
    'AccYLgChl_SensorDataComFaultRT_1_C'    => '0b1xxxxxxx',

    #SensorDataComFaultRT_b32.1
    #-----------------------
    'AccYHgMonChl_SensorDataComFaultRT_0_C' => '0bxxxxxxx0',
    'AccYHgMonChl_SensorDataComFaultRT_1_C' => '0bxxxxxxx1',

    #	'AccYLgPlausiChl_SensorDataComFaultRT_0_C'    	=> '0bxxxxxx0x',
    #	'AccYLgPlausiChl_SensorDataComFaultRT_1_C'    	=> '0bxxxxxx1x',
    'AccZLgChl_SensorDataComFaultRT_0_C'     => '0bxxxxxx0x',
    'AccZLgChl_SensorDataComFaultRT_1_C'     => '0bxxxxxx1x',
    'RollRateLfChl_SensorDataComFaultRT_0_C' => '0bxxxxx0xx',
    'RollRateLfChl_SensorDataComFaultRT_1_C' => '0bxxxxx1xx',
    'YawRateLfChl_SensorDataComFaultRT_0_C'  => '0bxxxx0xxx',
    'YawRateLfChl_SensorDataComFaultRT_1_C'  => '0bxxxx1xxx',

    #	'YawRateLfPlausiChl_SensorDataComFaultRT_0_C' 	=> '0bxx0xxxxx',
    #	'YawRateLfPlausiChl_SensorDataComFaultRT_1_C' 	=> '0bxx1xxxxx',
    # 'PitchRateLfChl_SensorDataComFaultRT_0_C' => '0bx0xxxxxx',
    # 'PitchRateLfChl_SensorDataComFaultRT_1_C' => '0bx1xxxxxx',

    #rb_cs7m_ManagerState_ten
    #-----------------------------------
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_Idle_e;0;Idle state
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_Init_e;1;Initial state
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_ReadAsicSerialNumbers_e;2;Read ASIC serial numbers
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_SensorSpecificInits_e;3;
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_WaitForSensorInit_e;4;Wait for sensor initialization
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_VerifyInitFlags_e;5;Verify initial error and status flags
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_HandleChlFaultsPrevPoc_e;6;Handle channel faults stored in any previous power on cycles
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_HandleFaultsInInit_e;7;Handle sensor faults in initialization
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_PrepareSystemInitBG_e;8;Prepare system initialisation in background state
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_PrepareSystemInitRT_e;9;Prepare system initialisation in realtime state
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_SystemInit_e;10;System initialisation state
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_PrepareSteadyStateRT_e;11;Preparation of steady state (real-time actions)
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_SteadyState_e;12;Steady state
	# enum;rb_cs7m_ManagerState_ten;rb_cs7m_Disabled_e;13;Disabled state
    #-------------------------------------
    'rb_cs7m_Idle_C'                   => 0,
    'rb_cs7m_Init_C'                   => 1,
    'rb_cs7m_ReadAsicSerialNumbers_C'  => 2,
    'rb_cs7m_SensorSpecificInits_C'    => 3,
    'rb_cs7m_WaitForSensorInit_C'      => 4,
    'rb_cs7m_VerifyInitFlags_C'        => 5,
    'rb_cs7m_HandleChlFaultsPrevPoc_C' => 6,
    'rb_cs7m_HandleFaultsInInit_C'     => 7,
    'rb_cs7m_PrepareSystemInitBG_C'    => 8,
    'rb_cs7m_PrepareSystemInitRT_C'    => 9,
    'rb_cs7m_SystemInit_C'             => 10,
    'rb_cs7m_PrepareSteadyStateRT_C'   => 11,
    'rb_cs7m_SteadyState_C'            => 12,
    'rb_cs7m_Disabled_C'               => 13,

    #******************************************************************************
    #                            API to Customer
    #******************************************************************************
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXLg_e;0;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXHgMon_e;1;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLg_e;2;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYHgMon_e;3;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccZLg_e;4;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollRateLf_e;5;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLf_e;6;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_InertialSensor1StatusClusFlags_e;7;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_InertialSensor1StatusHwScon_e;8;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_Miscellaneous1_e;9;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_Miscellaneous2_e;10;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_Miscellaneous3_e;11;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_Miscellaneous4_e;12;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_Miscellaneous5_e;13;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_MaxPossibleRtCmdsTxReasons_e;14;
    #
    #   ChlState API to Customer
    #---------------------------
    'AccXLgChl_State_U8'    => 'rb_cs7m_ChlState_aen(0)_U8',
    'AccXHgMonChl_State_U8' => 'rb_cs7m_ChlState_aen(1)_U8',
    'AccYLgChl_State_U8'    => 'rb_cs7m_ChlState_aen(2)_U8',
    'AccYHgMonChl_State_U8' => 'rb_cs7m_ChlState_aen(3)_U8',

    #	'AccYLgPlausiChl_State_U8'			=> 'rb_cs7m_ChlState_aen(4)_U8',
    'AccZLgChl_State_U8'     => 'rb_cs7m_ChlState_aen(4)_U8',
    'RollRateLfChl_State_U8' => 'rb_cs7m_ChlState_aen(5)_U8',
    'YawRateLfChl_State_U8'  => 'rb_cs7m_ChlState_aen(6)_U8',

    #	'YawRateLfPlausiChl_State_U8'       => 'rb_cs7m_ChlState_aen(8)_U8',
    # 'PitchRateLfChl_State_U8' => 'rb_cs7m_ChlState_aen(9)_U8', #not using for pitchRate

    'AccXLgChl_State_V'    => 'rb_cs7m_ChlState_aen(0)',
    'AccXHgMonChl_State_V' => 'rb_cs7m_ChlState_aen(1)',
    'AccYLgChl_State_V'    => 'rb_cs7m_ChlState_aen(2)',
    'AccYHgMonChl_State_V' => 'rb_cs7m_ChlState_aen(3)',

    #	'AccYLgPlausiChl_State_V'   		=> 'rb_cs7m_ChlState_aen(4)',
    'AccZLgChl_State_V'     => 'rb_cs7m_ChlState_aen(4)',
    'RollRateLfChl_State_V' => 'rb_cs7m_ChlState_aen(5)',
    'YawRateLfChl_State_V'  => 'rb_cs7m_ChlState_aen(6)',

    #	'YawRateLfPlausiChl_State_V'		=> 'rb_cs7m_ChlState_aen(8)',
    # 'PitchRateLfChl_State_V' => 'rb_cs7m_ChlState_aen(9)', #not using for pitchRate

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
    'ChlInitInProgressCAN_C'        => 3,
    'ChlNotConfiguredCAN_C'         => 1,
    'ChlOkCAN_C'                    => 0,
    'ChlTemporaryErrorCAN_C'        => 2,
    'ChlPermErrorDueSensorErrCAN_C' => 1,
    'ChlPermErrorCyclThisPOCCAN_C'  => 1,
    'ChlPermErrorCyclPrevPOCCAN_C'  => 1,
    'ChlPermErrorDueExtReqCAN_C'    => 1,
    'ChlNotSupportedCAN_C'          => 1,

    # Mapping for customer fault status signal name on CAN
    'VDS_LinearSignalStatus'  => 'Signal_State_Longitudinal_Accele',
    'VDS_LateralSignalStatus' => 'Signal_State_Lateral_Acceleratio',
    # 'VDS_HeaveSignalStatus'   => 'VDS_CANFDHeaveSignalStatus',
    'VDS_YawSignalStatus'     => 'Signal_State_Yaw_Rate',
    # 'VDS_RollSignalStatus'    => 'VDS_CANFDRollSignalStatus',
    # 'VDS_PitchSignalStatus'   => 'VDS_CANFDPitchSignalStatus',

    # Mapping for customer signal name on CAN
    'VDS_LinearSignalData'  => 'Longitudinal_Acceleration',
    'VDS_LateralSignalData' => 'Lateral_Acceleration',
    # 'VDS_HeaveSignalData'   => 'VDS_CANFDHeaveSignalData',
    'VDS_YawSignalData'     => 'Yaw_Rate',
    # 'VDS_RollSignalData'    => 'VDS_CANFDRollSignalData',
    # 'VDS_PitchSignalData'   => 'VDS_CANFDPitchSignalData',

    # Mapping for customer VIN signal name on CAN
    'CAN_VIN_Signal' => 'ConnectedEDRTrigger',

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

    'AccThdValue1g_C'   => 0.8524,        #1g -> 5000Lsb/g in CA project
    'AccThdValue_C'     => 1.8536,        #2g -> 5000Lsb/g in CA project
    'AccThdValue2g_C'   => 1.8536,        #2g -> 5000Lsb/g in CA project
    'AccThdValue3g_C'   => 2.8536,        #3g -> 5000Lsb/g in CA project
    'AccThdValue4g_C'   => 3.8536,        #4g -> 5000Lsb/g in CA project
    'AccNegThdValue_C'  => -0.9994,       #5000Lsb/g in CA project
    'AccThdValue3_4g_C' => 3.2536,        #5000Lsb/g in CA project

    'XLg_AccThdValue1g_C'   => 0.8524,    #1g -> 5000Lsb/g in CA project
    'XLg_AccThdValue_C'     => 1.8536,    #2g -> 5000Lsb/g in CA project
    'XLg_AccThdValue2g_C'   => 1.8536,    #2g -> 5000Lsb/g in CA project
    'XLg_AccThdValue3g_C'   => 2.8536,    #3g -> 5000Lsb/g in CA project
    'XLg_AccThdValue4g_C'   => 3.8536,    #4g -> 5000Lsb/g in CA project
    'XLg_AccNegThdValue_C'  => -0.9994,   #5000Lsb/g in CA project
    'XLg_AccThdValue3_4g_C' => 3.2536,    #5000Lsb/g in CA project

    'YLg_AccThdValue1g_C'   => 0.8524,    #1g -> 5000Lsb/g in CA project
    'YLg_AccThdValue_C'     => 1.8536,    #2g -> 5000Lsb/g in CA project
    'YLg_AccThdValue2g_C'   => 1.8536,    #2g -> 5000Lsb/g in CA project
    'YLg_AccThdValue3g_C'   => 2.8536,    #3g -> 5000Lsb/g in CA project
    'YLg_AccThdValue4g_C'   => 3.8536,    #4g -> 5000Lsb/g in CA project
    'YLg_AccNegThdValue_C'  => -0.9994,   #5000Lsb/g in CA project
    'YLg_AccThdValue3_4g_C' => 3.2536,    #5000Lsb/g in CA project

    'ZLg_AccThdValue1g_C'   => 0.8524,    #1g -> 5000Lsb/g in CA project
    'ZLg_AccThdValue_C'     => 1.8536,    #2g -> 5000Lsb/g in CA project
    'ZLg_AccThdValue2g_C'   => 1.8536,    #2g -> 5000Lsb/g in CA project
    'ZLg_AccThdValue3g_C'   => 2.8536,    #3g -> 5000Lsb/g in CA project
    'ZLg_AccThdValue4g_C'   => 3.8536,    #4g -> 5000Lsb/g in CA project
    'ZLg_AccNegThdValue_C'  => -0.9994,   #5000Lsb/g in CA project
    'ZLg_AccThdValue3_4g_C' => 3.2536,    #5000Lsb/g in CA project

    'RateThdValue_C'          => 97.03,   #100grad/s in CA project
    'RateThdValue50gps_C'     => 46.97,   #100grad/s in CA project
    'RateThdValue100gps_C'    => 97.03,   #100grad/s in CA project
    'RateThdValue150gps_C'    => 147.03,  #100grad/s in CA project
    'RateThdValue200gps_C'    => 197.03,  #100grad/s in CA project
    'RateThdValue190gps_C'    => 187.03,  #100grad/s in CA project
    'RateThdValue160gps_C'    => 157.03,  #100grad/s in CA project
    'RateThdValue60gps_C'     => 56.97,   #100grad/s in CA project
    'RateThdValue_Clipping_C' => 300.03,  #100grad/s in CA project
    'RateThdValue300gps_C'    => 300.03,  #100grad/s in CA project

    'Yaw_RateThdValue_C'          => 97.03,     #100grad/s in CA project
    'Yaw_RateThdValue50gps_C'     => 46.97,     #100grad/s in CA project
    'Yaw_RateThdValue100gps_C'    => 97.03,     #100grad/s in CA project
    'Yaw_RateThdValue150gps_C'    => 147.03,    #100grad/s in CA project
    'Yaw_RateThdValue200gps_C'    => 197.03,    #100grad/s in CA project
    'Yaw_RateThdValue190gps_C'    => 187.03,    #100grad/s in CA project
    'Yaw_RateThdValue160gps_C'    => 157.03,    #100grad/s in CA project
    'Yaw_RateThdValue60gps_C'     => 56.97,     #100grad/s in CA project
    'Yaw_RateThdValue_Clipping_C' => 300.03,    #100grad/s in CA project
    'Yaw_RateThdValue300gps_C'    => 300.03,    #100grad/s in CA project

    'Roll_RateThdValue_C'          => 97.03,    #100grad/s in CA project
    'Roll_RateThdValue50gps_C'     => 46.97,    #100grad/s in CA project
    'Roll_RateThdValue100gps_C'    => 97.03,    #100grad/s in CA project
    'Roll_RateThdValue150gps_C'    => 147.03,   #100grad/s in CA project
    'Roll_RateThdValue200gps_C'    => 197.03,   #100grad/s in CA project
    'Roll_RateThdValue190gps_C'    => 187.03,   #100grad/s in CA project
    'Roll_RateThdValue160gps_C'    => 157.03,   #100grad/s in CA project
    'Roll_RateThdValue60gps_C'     => 56.97,    #100grad/s in CA project
    'Roll_RateThdValue_Clipping_C' => 300.03,   #100grad/s in CA project
    'Roll_RateThdValue300gps_C'    => 300.03,   #100grad/s in CA project

    'Pitch_RateThdValue_C'          => 97.03,   #100grad/s in CA project
    'Pitch_RateThdValue50gps_C'     => 46.97,   #100grad/s in CA project
    'Pitch_RateThdValue100gps_C'    => 97.03,   #100grad/s in CA project
    'Pitch_RateThdValue150gps_C'    => 147.03,  #100grad/s in CA project
    'Pitch_RateThdValue200gps_C'    => 197.03,  #100grad/s in CA project
    'Pitch_RateThdValue190gps_C'    => 187.03,  #100grad/s in CA project
    'Pitch_RateThdValue160gps_C'    => 157.03,  #100grad/s in CA project
    'Pitch_RateThdValue60gps_C'     => 56.97,   #100grad/s in CA project
    'Pitch_RateThdValue_Clipping_C' => 300.03,  #100grad/s in CA project
    'Pitch_RateThdValue300gps_C'    => 300.03,  #100grad/s in CA project

    'YawRateThdValue_Clipping_C'    => 300.03,  #100grad/s in CA project
    'YawRateThdValue_NegClipping_C' => -300.03, #100grad/s in CA project

    'YawRateThdValue_SignalMon_Clipping_C'    => 100.03,     #100grad/s in CA project
    'YawRateThdValue_SignalMon_NegClipping_C' => -106.03,    #100grad/s in CA project

    # 'AccLgSfh_1' 	=> 9997, #5000Lsb/g in CA project
    # 'AccLgSfh_2' 	=> 14997, #5000Lsb/g in CA project
    # 'AccLgSfh_3' 	=> 19997, #5000Lsb/g in CA project
    # 'AccLg_1' 		=> 0.9994, #5000Lsb/g in CA project
    # 'AccLg_2' 		=> 1.9994, #5000Lsb/g in CA project
    # 'AccLg_3' 		=> 2.9994, #5000Lsb/g in CA project
    # 'AccLg_4' 		=> 3.9994, #5000Lsb/g in CA project

    'RateSfh_1' => 14997,     #100grad/s in CA project
    'RateSfh_2' => 19997,     #100grad/s in CA project
    'RateSfh_3' => 24997,     #100grad/s in CA project
    'Rate_1'    => 100.03,    #100grad/s in CA project
    'Rate_2'    => 149.97,    #100grad/s in CA project
    'Rate_3'    => 199.97,    #100grad/s in CA project
    'Rate_4'    => 249.97,    #100grad/s in CA project
    'Rate_C'    => 296.03,

## Time stamp reference to evaluate VDS signals on CAN##
    'TimeStampRef1_C' => -0.1,

    # 'AccThd_2.2g_C' => '2.2', #5000Lsb/g in CA project
    # 'AccThd_3.3g_C' => '3.3', #5000Lsb/g in CA project
    # 'AccThd_3.7g_C' => '3.7', #5000Lsb/g in CA project

## Threshold constant for reference
    'AccRefThd1g_C'      => 1,      #1g -> 5000Lsb/g in CA project
    'AccRefThd1_4g_C'    => 1.4,    #1g -> 5000Lsb/g in CA project
    'RateRefThd100gps_C' => 60,     #1g -> 5000Lsb/g in CA project
    'RateRefThd50gps_C'  => 80,     #1g -> 5000Lsb/g in CA project

    'YLg_AccRefThd1g_C'      => 1,      #1g -> 5000Lsb/g in CA project
    'YLg_AccRefThd1_4g_C'    => 1.4,    #1g -> 5000Lsb/g in CA project
    'Yaw_RateRefThd100gps_C' => 60,     #1g -> 5000Lsb/g in CA project
    'Yaw_RateRefThd50gps_C'  => 80,     #1g -> 5000Lsb/g in CA project

    'Roll_RateRefThd100gps_C' => 60,    #1g -> 500Lsb/g in CA project
    'Roll_RateRefThd50gps_C'  => 80,    #1g -> 500Lsb/g in CA project

    'Pitch_RateRefThd100gps_C' => 60,   #1g -> 500Lsb/g in CA project
    'Pitch_RateRefThd50gps_C'  => 80,   #1g -> 500Lsb/g in CA project

## Clipping Constant
    'LinearSignalClipping1.8g_C'  => 1.8,
    'LinearSignalClipping4.8g_C'  => 4.8,
    'LinearSignalClipping2.2g_C'  => 2.2,
    'LinearSignalClipping0.2g_C'  => 0.2,
    'LinearSignalClipping2g_C'    => 2,
    'LinearSignalClipping4.0g_C'  => 4.0,
    'LinearSignalClipping5g_C'    => 5,
    'LinearSignalClipping4.85g_C' => 4.85,
    'LinearSignalClipping0g_C'    => 0,

    'LinearSignalClippingNegative1.8g_C' => -1.8,
    'LinearSignalClippingNegative4.8g_C' => -4.8,
    'LinearSignalClippingNegative2.2g_C' => -2.2,
    'LinearSignalClippingNegative2g_C'   => -2,
    'LinearSignalClippingNegative4.0g_C' => -4.0,
    'LinearSignalClippingNegative5g_C'   => -5,
    'LinearSignalClippingNegative4.2g_C' => -4.2,

    'LateralSignalClipping1.8g_C'  => 1.8,
    'LateralSignalClipping4.8g_C'  => 4.8,
    'LateralSignalClipping2.2g_C'  => 2.2,
    'LateralSignalClipping2g_C'    => 2,
    'LateralSignalClipping4.0g_C'  => 4.0,
    'LateralSignalClipping5g_C'    => 5,
    'LateralSignalClipping4.85g_C' => 4.85,

    'LateralSignalClippingNegative1.8g_C' => -1.8,
    'LateralSignalClippingNegative4.8g_C' => -4.8,
    'LateralSignalClippingNegative2.2g_C' => -2.2,
    'LateralSignalClippingNegative2g_C'   => -2,
    'LateralSignalClippingNegative4.0g_C' => -4.0,
    'LateralSignalClippingNegative5g_C'   => -5,
    'LateralSignalClippingNegative4.2g_C' => -4.2,

    'HeaveSignalClipping1.8g_C'  => 1.8,
    'HeaveSignalClipping4.8g_C'  => 4.8,
    'HeaveSignalClipping2.2g_C'  => 2.2,
    'HeaveSignalClipping2g_C'    => 2,
    'HeaveSignalClipping4.0g_C'  => 4.0,
    'HeaveSignalClipping5g_C'    => 5,
    'HeaveSignalClipping4.85g_C' => 4.85,

    'HeaveSignalClippingNegative1.8g_C' => -1.8,
    'HeaveSignalClippingNegative4.8g_C' => -4.8,
    'HeaveSignalClippingNegative2.2g_C' => -2.2,
    'HeaveSignalClippingNegative2g_C'   => -2,
    'HeaveSignalClippingNegative4.0g_C' => -4.0,
    'HeaveSignalClippingNegative5g_C'   => -5,
    'HeaveSignalClippingNegative4.2g_C' => -4.2,

    'LateralClippingConstant_C'    => 5.0006,
    'LateralClippingNegConstant_C' => -5.0006,

    'YawSignalClipping90gps_C'  => 90,
    'YawSignalClipping280gps_C' => 280,
    'YawSignalClipping100gps_C' => 100,
    'YawSignalClipping110gps_C' => 110,
    'YawSignalClipping200gps_C' => 200,
    'YawSignalClipping270gps_C' => 270,
    'YawSignalClipping300gps_C' => 300,

    'PitchSignalClipping90gps_C'  => 90,
    'PitchSignalClipping280gps_C' => 280,
    'PitchSignalClipping100gps_C' => 100,
    'PitchSignalClipping110gps_C' => 110,
    'PitchSignalClipping200gps_C' => 200,
    'PitchSignalClipping270gps_C' => 270,
    'PitchSignalClipping300gps_C' => 300,

    'RollSignalClipping90gps_C'  => 90,
    'RollSignalClipping280gps_C' => 280,
    'RollSignalClipping100gps_C' => 100,
    'RollSignalClipping110gps_C' => 110,
    'RollSignalClipping200gps_C' => 200,
    'RollSignalClipping270gps_C' => 270,
    'RollSignalClipping300gps_C' => 300,

    'YawSignalClippingNegative90gps_C'  => -90,
    'YawSignalClippingNegative280gps_C' => -280,
    'YawSignalClippingNegative100gps_C' => -100,
    'YawSignalClippingNegative110gps_C' => -110,
    'YawSignalClippingNegative250gps_C' => -250,
    'YawSignalClippingNegative270gps_C' => -270,
    'YawSignalClippingNegative300gps_C' => -300,

    'PitchSignalClippingNegative90gps_C'  => -90,
    'PitchSignalClippingNegative280gps_C' => -280,
    'PitchSignalClippingNegative100gps_C' => -100,
    'PitchSignalClippingNegative110gps_C' => -110,
    'PitchSignalClippingNegative250gps_C' => -250,
    'PitchSignalClippingNegative270gps_C' => -270,
    'PitchSignalClippingNegative300gps_C' => -300,

    'RollSignalClippingNegative90gps_C'  => -90,
    'RollSignalClippingNegative280gps_C' => -280,
    'RollSignalClippingNegative100gps_C' => -100,
    'RollSignalClippingNegative110gps_C' => -110,
    'RollSignalClippingNegative250gps_C' => -250,
    'RollSignalClippingNegative270gps_C' => -270,
    'RollSignalClippingNegative300gps_C' => -300,

##NhtsaData for rb_csem_SensorDataRT_st.ChannelValue_as16
    'Nhtsadata_Rate30000_C'    => 30000,
    'Nhtsadata_RateNeg30000_C' => -30000,
    'Nhtsadata_Rate10300_C'    => 10000,     #(Value- Fieldcalib_offset_for_RateChannels) and if Field calibartion is not applicable then Channel value is same as Manipulated value
    'Nhtsadata_RateNeg10300_C' => -10600,    #(Value- Fieldcalib_offset_for_RateChannels) and if Field calibartion is not applicable then Channel value is same as Manipulated value

    'Nhtsadata_Acc25000_C'    => 25000,
    'Nhtsadata_AccNeg25000_C' => -25000,

##Threshold Values During Sensor Initialization
    'LinearSignal_Zero_Thd_C'   => 0,
    'LateralSignal_Zero_Thd_C'  => 0,
    'VerticalSignal_Zero_Thd_C' => 0,        #in CA ZLg will have -1g as default thd
    'YawSignal_Zero_Thd_C'      => 0,
    'RollSignal_Zero_Thd_C'     => 0,
    'PitchSignal_Zero_Thd_C'    => 0,

##Threshold values without Running AllChls_FieldCalib_Test
    #'AccThdValue2g_C' => 2.0006, #2g -> 5000Lsb/g in CA project
    #'RateThdValue200gps_C' => 200.03, #100grad/s in CA project

	# enum;rb_sfh_FilterChlList_ten;rb_sfh_AccXLg30HzCS_e;0;
	# enum;rb_sfh_FilterChlList_ten;rb_sfh_AccYLg30HzCS_e;1;
	# enum;rb_sfh_FilterChlList_ten;rb_sfh_RollRate30HzCS_e;2;
	# enum;rb_sfh_FilterChlList_ten;rb_sfh_YawRate30HzCS_e;3;
	# enum;rb_sfh_FilterChlList_ten;rb_sfh_FilterChlMax_e;4;
    #
    #   ChlState API to Customer CAN interface
    #-----------------------------------------
    'AccXLgChl_State_sfh_U8'      => 'rb_sfh_SensChlState_aen(0)_U8',
    'AccYLgChl_State_sfh_U8'      => 'rb_sfh_SensChlState_aen(1)_U8',
    # 'AccZLgChl_State_sfh_U8'      => 'rb_sfh_SensChlState_aen(2)_U8',
    'RollRateLfChl_State_sfh_U8'  => 'rb_sfh_SensChlState_aen(2)_U8',
    # 'PitchRateLfChl_State_sfh_U8' => 'rb_sfh_SensChlState_aen(4)_U8',
    'YawRateLfChl_State_sfh_U8'   => 'rb_sfh_SensChlState_aen(3)_U8',

    ##RollingCounter
    # 'Sensor_RollingCounter_sfh_U8' => 'rb_sfh_RollingCounter_u8_U8',

    'AccXLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(0)_S16',
    'AccYLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(1)_S16',
    # 'AccZLgChl_OutputBuffer_sfh_S16'      => 'rb_sfh_OutputBuffer_s16(2)_S16',
    'RollRateLfChl_OutputBuffer_sfh_S16'  => 'rb_sfh_OutputBuffer_s16(2)_S16',
    # 'PitchRateLfChl_OutputBuffer_sfh_S16' => 'rb_sfh_OutputBuffer_s16(4)_S16',
    'YawRateLfChl_OutputBuffer_sfh_S16'   => 'rb_sfh_OutputBuffer_s16(3)_S16',
    'rb_cs7m_SamplingCounterRT_S16'       => 'rb_cs7m_SamplingCounterRT_u16_U16',

    #******************************************************************************
    #                          Sensor channels
    #******************************************************************************
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXLg_e;0;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXHgMon_e;1;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLg_e;2;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYHgMon_e;3;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccZLg_e;4;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollRateLf_e;5;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLf_e;6;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_InertialSensor1StatusClusFlags_e;7;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_InertialSensor1StatusHwScon_e;8;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_Miscellaneous1_e;9;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_Miscellaneous2_e;10;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_Miscellaneous3_e;11;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_Miscellaneous4_e;12;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_Miscellaneous5_e;13;
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_MaxPossibleRtCmdsTxReasons_e;14;
    #
    #   RawData_U8
    #-------------
    'AccXLgChl_RawData_U8'    => 'rb_cs7c_RtComRxPayload_au16(0)_U8',
    'AccXHgMonChl_RawData_U8' => 'rb_cs7c_RtComRxPayload_au16(1)_U8',
    'AccYLgChl_RawData_U8'    => 'rb_cs7c_RtComRxPayload_au16(2)_U8',
    'AccYHgMonChl_RawData_U8' => 'rb_cs7c_RtComRxPayload_au16(3)_U8',

    #	'AccYLgPlausiChl_RawData_U8'   		=> 'rb_cs7c_RtComRxPayload_au16(4)_U8',
    'AccZLgChl_RawData_U8'     => 'rb_cs7c_RtComRxPayload_au16(4)_U8',
    'RollRateLfChl_RawData_U8' => 'rb_cs7c_RtComRxPayload_au16(5)_U8',
    'YawRateLfChl_RawData_U8'  => 'rb_cs7c_RtComRxPayload_au16(6)_U8',

    #	'YawRateLfPlausiChl_RawData_U8'     => 'rb_cs7c_RtComRxPayload_au16(8)_U8',
    # 'PitchRateLfChl_RawData_U8' => 'rb_cs7c_RtComRxPayload_au16(9)_U8',
    #
    #   RawData_U16
    #--------------
    'AccXLgChl_RawData_S16'    => 'rb_cs7c_RtComRxPayload_au16(0)_S16',
    'AccXHgMonChl_RawData_S16' => 'rb_cs7c_RtComRxPayload_au16(1)_S16',
    'AccYLgChl_RawData_S16'    => 'rb_cs7c_RtComRxPayload_au16(2)_S16',
    'AccYHgMonChl_RawData_S16' => 'rb_cs7c_RtComRxPayload_au16(3)_S16',

    #	'AccYLgPlausiChl_RawData_S16'   	=> 'rb_cs7c_RtComRxPayload_au16(4)_S16',
    'AccZLgChl_RawData_S16'     => 'rb_cs7c_RtComRxPayload_au16(4)_S16',
    'RollRateLfChl_RawData_S16' => 'rb_cs7c_RtComRxPayload_au16(5)_S16',
    'YawRateLfChl_RawData_S16'  => 'rb_cs7c_RtComRxPayload_au16(6)_S16',

    #	'YawRateLfPlausiChl_RawData_S16'   	=> 'rb_cs7c_RtComRxPayload_au16(8)_S16',
    # 'PitchRateLfChl_RawData_S16' => 'rb_cs7c_RtComRxPayload_au16(9)_S16',
    #
    #	RawData_V
    #------------
    'AccXLgChl_RawData_V'    => 'rb_cs7c_RtComRxPayload_au16(0)',
    'AccXHgMonChl_RawData_V' => 'rb_cs7c_RtComRxPayload_au16(1)',
    'AccYLgChl_RawData_V'    => 'rb_cs7c_RtComRxPayload_au16(2)',
    'AccYHgMonChl_RawData_V' => 'rb_cs7c_RtComRxPayload_au16(3)',

    #	'AccYLgPlausiChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(4)',
    'AccZLgChl_RawData_V'     => 'rb_cs7c_RtComRxPayload_au16(4)',
    'RollRateLfChl_RawData_V' => 'rb_cs7c_RtComRxPayload_au16(5)',
    'YawRateLfChl_RawData_V'  => 'rb_cs7c_RtComRxPayload_au16(6)',

    #	'YawRateLfPlausiChl_RawData_V'  	=> 'rb_cs7c_RtComRxPayload_au16(8)',
    # 'PitchRateLfChl_RawData_V' => 'rb_cs7c_RtComRxPayload_au16(9)',

    #	 Processed data for Algo
    #---------------------------
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccX_e;0;SMA_ax_highG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccY_e;1;SMA_ay_highG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccX_e;2;SMA_ax_highG_redundant
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccY_e;3;SMA_ay_highG_redundant
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccZ_e;4;SMA_az_midG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXLg_e;5;SMI_ax_lowG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXHgMon_e;6;SMI_ax_midG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLg_e;7;SMI_ay_lowG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYHgMon_e;8;SMI_ay_midG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccZLg_e;9;SMI_az_lowG
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_RollRateLf_e;10;SMI_rateX
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLf_e;11;SMI_rateZ
	# enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_CentralSensorChannelsMax_e;12;gives the total number of supported  central sensor channels.
    #
    'AccXLgChl_NhtsaData_S16'    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(5)_S16',
    'AccXHgMonChl_NhtsaData_S16' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(6)_S16',
    'AccYLgChl_NhtsaData_S16'    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(7)_S16',
    'AccYHgMonChl_NhtsaData_S16' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(8)_S16',

    #	'AccYLgPlausiChl_NhtsaData_S16'   	=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(9)_S16',
    'AccZLgChl_NhtsaData_S16'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(9)_S16',
    'RollRateLfChl_NhtsaData_S16' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(10)_S16',
    'YawRateLfChl_NhtsaData_S16'  => 'rb_csem_SensorDataRT_st.ChannelValue_as16(11)_S16',

    #	'YawRateLfPlausiChl_NhtsaData_S16'  => 'rb_csem_SensorDataRT_st.ChannelValue_as16(13)_S16',
    # 'PitchRateLfChl_NhtsaData_S16' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(14)_S16',

    'AccXLgChl_NhtsaData_V'    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(5)',
    'AccXHgMonChl_NhtsaData_V' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(6)',
    'AccYLgChl_NhtsaData_V'    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(7)',
    'AccYHgMonChl_NhtsaData_V' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(8)',

    #	'AccYLgPlausiChl_NhtsaData_V'   	=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(9)',
    'AccZLgChl_NhtsaData_V'     => 'rb_csem_SensorDataRT_st.ChannelValue_as16(9)',
    'RollRateLfChl_NhtsaData_V' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(10)',
    'YawRateLfChl_NhtsaData_V'  => 'rb_csem_SensorDataRT_st.ChannelValue_as16(11)',

    #	'YawRateLfPlausiChl_NhtsaData_V'  => 'rb_csem_SensorDataRT_st.ChannelValue_as16(13)',
    # 'PitchRateLfChl_NhtsaData_V' => 'rb_csem_SensorDataRT_st.ChannelValue_as16(14)',

    #******************************************************************************
    #                                Sensor data
    #******************************************************************************
	# enum;rb_sycc_Smi7Sensors_ten;rb_sycc_InertialSensor1_e;0;First inertial sensor
	# enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorMax_e;1;Max Value (number of all SMI7 sensors)
    #
    #    ClusterFlags
    #----------------
    'InertialSensor1_ClusterFlags_U16' => 'rb_cs7c_StatusData_ast(0).ClustFlg_u16_U16',
    # 'InertialSensor2_ClusterFlags_U16' => 'rb_cs7c_StatusData_ast(1).ClustFlg_u16_U16',

    #    ErrorFlags
    #--------------
    'InertialSensor1_ErrorFlag0_U8' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(0)_U8',
    'InertialSensor1_ErrorFlag1_U8' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(1)_U8',
    'InertialSensor1_ErrorFlag2_U8' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(2)_U8',
    # 'InertialSensor2_ErrorFlag0_U8' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(0)_U8',
    # 'InertialSensor2_ErrorFlag1_U8' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(1)_U8',
    # 'InertialSensor2_ErrorFlag2_U8' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(2)_U8',

    # U16 - Error Flags #Updated for DSP_PE_RAM implementation
    'InertialSensor1_ErrorFlag0_U16' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(0)_U16',
    'InertialSensor1_ErrorFlag1_U16' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(1)_U16',
    'InertialSensor1_ErrorFlag2_U16' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(2)_U16',
    'InertialSensor1_ErrorFlag3_U16' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(3)_U16',
    'InertialSensor1_ErrorFlag4_U16' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(4)_U16',
    'InertialSensor1_ErrorFlag5_U16' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(5)_U16',
    'InertialSensor1_ErrorFlag6_U16' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(6)_U16',
    'InertialSensor1_ErrorFlag7_U16' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(7)_U16',
    'InertialSensor1_ErrorFlag8_U16' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(8)_U16',
    'InertialSensor1_ErrorFlag9_U16' => 'rb_cs7c_StatusData_ast(0).ErFlg_au16(9)_U16',

    # 'InertialSensor2_ErrorFlag0_U16' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(0)_U16',
    # 'InertialSensor2_ErrorFlag1_U16' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(1)_U16',
    # 'InertialSensor2_ErrorFlag2_U16' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(2)_U16',
    # 'InertialSensor2_ErrorFlag3_U16' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(3)_U16',
    # 'InertialSensor2_ErrorFlag4_U16' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(4)_U16',
    # 'InertialSensor2_ErrorFlag5_U16' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(5)_U16',
    # 'InertialSensor2_ErrorFlag6_U16' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(6)_U16',
    # 'InertialSensor2_ErrorFlag7_U16' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(7)_U16',
    # 'InertialSensor2_ErrorFlag8_U16' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(8)_U16',
    # 'InertialSensor2_ErrorFlag9_U16' => 'rb_cs7c_StatusData_ast(1).ErFlg_au16(9)_U16',

    #	 Temperature_1
    #---------------
    'InertialSensor1_Temp1_U8'  => 'rb_cs7c_StatusData_ast(0).Temperat1_s16_U8',
    # 'InertialSensor2_Temp1_U8'  => 'rb_cs7c_StatusData_ast(1).Temperat1_s16_U8',
    'InertialSensor1_Temp1_S16' => 'rb_cs7c_StatusData_ast(0).Temperat1_s16_S16',
    # 'InertialSensor2_Temp1_S16' => 'rb_cs7c_StatusData_ast(1).Temperat1_s16_S16',

    #	 Temperature_2
    #---------------

    'InertialSensor1_Temp2_S16' => 'rb_csem_StoreTemperature2Value_as16(0)_S16',
    # 'InertialSensor2_Temp2_S16' => 'rb_csem_StoreTemperature2Value_as16(1)_S16',

    #	 ClusterFlags stored in Field Claim Data area
    #------------------------------------------------
    'InertialSensor1_ClusterFlags_EE_U8' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16_U8',
    # 'InertialSensor2_ClusterFlags_EE_U8' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16_U8',

    #	 ErrorFlags stored in Field Claim Data area
    #----------------------------------------------
    'InertialSensor1_ErrorFlag0_EE_U8' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(0)_U8',
    'InertialSensor1_ErrorFlag9_EE_U8' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(9)_U8',
    # 'InertialSensor2_ErrorFlag0_EE_U8' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0)_U8',
    # 'InertialSensor2_ErrorFlag9_EE_U8' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(9)_U8',

    #	 Temperature stored in Field Claim Data area
    #-----------------------------------------------
    'InertialSensor1_Temp1_EE_U8' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16_U8',
    # 'InertialSensor2_Temp1_EE_U8' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16_U8',

    #	AsicSerialNr
    #---------------
    'InertialSensor1_AsicSerialNr0_V' => 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(0)',
    'InertialSensor1_AsicSerialNr1_V' => 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(1)',
    'InertialSensor1_AsicSerialNr2_V' => 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(2)',
    # 'InertialSensor2_AsicSerialNr0_V' => 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(0)',
    # 'InertialSensor2_AsicSerialNr1_V' => 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(1)',
    # 'InertialSensor2_AsicSerialNr2_V' => 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(2)',

    #	SmiSerialNr
    #--------------
    'InertialSensor1_SmiSerialNr0_V' => 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(0)',
    'InertialSensor1_SmiSerialNr1_V' => 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(1)',
    'InertialSensor1_SmiSerialNr2_V' => 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(2)',
    # 'InertialSensor2_SmiSerialNr0_V' => 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(0)',
    # 'InertialSensor2_SmiSerialNr1_V' => 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(1)',
    # 'InertialSensor2_SmiSerialNr2_V' => 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(2)',

    #	FieldClaimDataEe ClusterFlags
    #--------------------------------
    'InertialSensor1_ClusterFlags_EE_V' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16',
    'InertialSensor2_ClusterFlags_EE_V' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16',

    #	FieldClaimDataEe Temperature
    #-------------------------------
    'InertialSensor1_Temperature_EE_V' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16',
    # 'InertialSensor2_Temperature_EE_V' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16',

    #	FieldClaimDataEe ErrorFlags
    #------------------------------
    'InertialSensor1_ErrorFlag0_EE_V' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(0)',
    'InertialSensor1_ErrorFlag9_EE_V' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(9)',
    # 'InertialSensor2_ErrorFlag0_EE_V' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0)',
    # 'InertialSensor2_ErrorFlag9_EE_V' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(9)',

    #	 ErrorFlags stored in Field Claim Data area
    #----------------------------------------------
    'ClusterFlags_EE_C' => '0x8421',
    'ErrorFlag_EE_C'    => '0x8421',
    'Temperature_EE_C'  => '0x8421',

    #	FieldClaimDataEe_st buffer for all error banks
    #------------------------------
    'InertialSensor1_ErrorBank0_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(0)',    #Address1
    'InertialSensor1_ErrorBank1_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(1)',    #Address2
    'InertialSensor1_ErrorBank2_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(2)',    #Address3
    'InertialSensor1_ErrorBank3_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(3)',    #Address4
    'InertialSensor1_ErrorBank4_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(4)',    #Address5
    'InertialSensor1_ErrorBank5_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(5)',    #Address6
    'InertialSensor1_ErrorBank6_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(6)',    #Address7
    'InertialSensor1_ErrorBank7_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(7)',    #Address8
    'InertialSensor1_ErrorBank8_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(8)',    #Address9
    'InertialSensor1_ErrorBank9_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(9)',    #Address0A

    # 'InertialSensor2_ErrorBank0_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0)',    #Address1
    # 'InertialSensor2_ErrorBank1_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(1)',    #Address2
    # 'InertialSensor2_ErrorBank2_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(2)',    #Address3
    # 'InertialSensor2_ErrorBank3_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(3)',    #Address4
    # 'InertialSensor2_ErrorBank4_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(4)',    #Address5
    # 'InertialSensor2_ErrorBank5_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(5)',    #Address6
    # 'InertialSensor2_ErrorBank6_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(6)',    #Address7
    # 'InertialSensor2_ErrorBank7_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(7)',    #Address8
    # 'InertialSensor2_ErrorBank8_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(8)',    #Address9
    # 'InertialSensor2_ErrorBank9_FieldClaim_Data_Buffer' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(9)',    #Address0A

    #	DeviceId
    #-----------
	# enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsSystemAsic1_e;0;Master System ASIC
	# enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsSystemAsic2_e;1;2nd System ASIC
	# enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorMain_e;2;Main HighG Sensor
	# enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorPlausi_e;3;Plausibility HighG Sensor
	# enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralInertialSensor1_e;4;First Inertial Sensor
	# enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsMax_e;5;Max Value (number of all ASICs)
    'InertialSensor1_DeviceId_V' => 'rb_syca_AsicDeviceId_au16(4)',
    # 'InertialSensor2_DeviceId_V' => 'rb_syca_AsicDeviceId_au16(5)',
    #
    #	RevisionId
    #-------------
    'InertialSensor1_RevisionId_V' => 'rb_syca_AsicRevisionId_au16(4)',
    # 'InertialSensor2_RevisionId_V' => 'rb_syca_AsicRevisionId_au16(5)',

    #    ErrorCounter (removed from *.cns file ??)
    #----------------
    #enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_InertialSensor1IntErrCnt45_e;
    #enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_InertialSensor2IntErrCnt45_e;
    #
    'InertialSensor1_IntErrCnt45_U8' => 'rb_cs7c_RtComRxPayload_au16(16)_U8',
    'InertialSensor2_IntErrCnt45_U8' => 'rb_cs7c_RtComRxPayload_au16(20)_U8',

    #    Status ClusterFlags
    #-----------------------
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_InertialSensor1StatusClusFlags_e;7;
    #
    'InertialSensor1_Status_ClusterFlags_U8' => 'rb_cs7c_RtComRxPayload_au16(7)_U8',
    # 'InertialSensor2_Status_ClusterFlags_U8' => 'rb_cs7c_RtComRxPayload_au16(11)_U8',

    #    Status HW SCON_U8
    #------------------
	# enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_InertialSensor1StatusHwScon_e;8;
    #
    'InertialSensor1_Status_HW_SCON_U8' => 'rb_cs7c_RtComRxPayload_au16(8)_U8',
    # 'InertialSensor2_Status_HW_SCON_U8' => 'rb_cs7c_RtComRxPayload_au16(13)_U8',

    #    Status HW SCON_U16
    #------------------
    #enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_InertialSensor1StatusHwScon_e;
    #enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_InertialSensor2StatusHwScon_e;
    #
    'InertialSensor1_Status_HW_SCON_U16' => 'rb_cs7c_RtComRxPayload_au16(8)_U16',
    # 'InertialSensor2_Status_HW_SCON_U16' => 'rb_cs7c_RtComRxPayload_au16(13)_U16',

    # Device IDs
    #------------
    'InertialSensor1_DeviceId_C' => '0x0863',    #SMI860
    # 'InertialSensor2_DeviceId_C' => '0x0804',    #SMI810

    # manipulated RevisionId, SmiSerialNr, AsicSerialNr will be checked against this constants
    # (not checked by software)
    'RevisionId_C'    => '0x1111',
    'SmiSerialNr0_C'  => '0x0011',
    'SmiSerialNr1_C'  => '0x1100',
    'SmiSerialNr2_C'  => '0bxxxx000100010001',
    'AsicSerialNr0_C' => '0x0011',
    'AsicSerialNr1_C' => '0x1100',
    'AsicSerialNr2_C' => '0x0111',

    #    InitialRelOffsetCheckFailure
    'cs7m_ManagerStateRT_U8'               => 'rb_cs7m_ManagerStateRT_en_U8',
    'csem_InitialRelOffsetCheckFailure_U8' => 'rb_csem_SensorDataRT_st.InitialRelOffsetCheckFailure_bo_U8',
    'InertialSensor1_ParID0_IREG0'         => '204',
    'InertialSensor1_ParID0_IREG1'         => '20608',
    'InertialSensor1_ParID0_IREG2'         => '25271',
    'InertialSensor1_ParID0_IREG3'         => '735',
    'InertialSensor1_ParID1_IREG0'         => '204',
    'InertialSensor1_ParID1_IREG1'         => '32353',
    'InertialSensor1_ParID1_IREG2'         => '0',
    'InertialSensor1_ParID1_IREG3'         => '0',
    'InertialSensor1_ParID2_IREG0'         => '204',
    'InertialSensor1_ParID2_IREG1'         => '2',
    'InertialSensor1_ParID2_IREG2'         => '6425',
    'InertialSensor1_ParID2_IREG3'         => '0',
    'InertialSensor1_ParID3_IREG0'         => '204',
    'InertialSensor1_ParID3_IREG1'         => '3',
    'InertialSensor1_ParID3_IREG2'         => '0',
    'InertialSensor1_ParID3_IREG3'         => '0',
    'InertialSensor1_ParID4_IREG0'         => '204',
    'InertialSensor1_ParID4_IREG1'         => '9220',
    'InertialSensor1_ParID4_IREG2'         => '9252',
    'InertialSensor1_ParID4_IREG3'         => '292',
    'InertialSensor1_ParID5_IREG0'         => '204',
    'InertialSensor1_ParID5_IREG1'         => '9221',
    'InertialSensor1_ParID5_IREG2'         => '9252',
    'InertialSensor1_ParID5_IREG3'         => '0',

    'InertialSensor1_ParID6_IREG0' => '204',
    'InertialSensor1_ParID6_IREG1' => '6',
    'InertialSensor1_ParID6_IREG2' => '62985',
    'InertialSensor1_ParID6_IREG3' => '0',
    'InertialSensor1_ParID7_IREG0' => '204',
    'InertialSensor1_ParID7_IREG1' => '7',
    'InertialSensor1_ParID7_IREG2' => '0',
    'InertialSensor1_ParID7_IREG3' => '0',
    'InertialSensor1_ParID8_IREG0' => '204',
    'InertialSensor1_ParID8_IREG1' => '56',
    'InertialSensor1_ParID8_IREG2' => '0',
    'InertialSensor1_ParID8_IREG3' => '0',
    'InertialSensor1_ParID9_IREG0' => '204',
    'InertialSensor1_ParID9_IREG1' => '793',
    'InertialSensor1_ParID9_IREG2' => '0',
    'InertialSensor1_ParID9_IREG3' => '0',
    'InertialSensor1_ParID9_EOC'   => '1',
    'InertialSensor2_ParID0_IREG0' => '204',
    'InertialSensor2_ParID0_IREG1' => '64',
    'InertialSensor2_ParID0_IREG2' => '0',
    'InertialSensor2_ParID0_IREG3' => '31',
    'InertialSensor2_ParID2_IREG0' => '204',
    'InertialSensor2_ParID2_IREG1' => '2',
    'InertialSensor2_ParID2_IREG2' => '6425',
    'InertialSensor2_ParID2_IREG3' => '0',
    'InertialSensor2_ParID3_IREG0' => '204',
    'InertialSensor2_ParID3_IREG1' => '3',
    'InertialSensor2_ParID3_IREG2' => '0',
    'InertialSensor2_ParID3_IREG3' => '0',
    'InertialSensor2_ParID4_IREG0' => '204',
    'InertialSensor2_ParID4_IREG1' => '9220',
    'InertialSensor2_ParID4_IREG2' => '0',
    'InertialSensor2_ParID4_IREG3' => '0',
    'InertialSensor2_ParID6_IREG0' => '204',
    'InertialSensor2_ParID6_IREG1' => '6',
    'InertialSensor2_ParID6_IREG2' => '62985',
    'InertialSensor2_ParID6_IREG3' => '0',
    'InertialSensor2_ParID7_IREG0' => '204',
    'InertialSensor2_ParID7_IREG1' => '7',
    'InertialSensor2_ParID7_IREG2' => '0',
    'InertialSensor2_ParID7_IREG3' => '0',
    'InertialSensor2_ParID8_IREG0' => '204',
    'InertialSensor2_ParID8_IREG1' => '56',
    'InertialSensor2_ParID8_IREG2' => '0',
    'InertialSensor2_ParID8_IREG3' => '0',
    'InertialSensor2_ParID9_IREG0' => '204',
    'InertialSensor2_ParID9_IREG1' => '793',
    'InertialSensor2_ParID9_IREG2' => '0',
    'InertialSensor2_ParID9_IREG3' => '0',
    'InertialSensor2_ParID9_EOC'   => '1',

    #***********************Fault Mapping*****************************************
    'InertialSensor1_MonPermInit_flt' => 'rb_csem_MonPermInitInertialSensor1_flt',
    # 'InertialSensor2_MonPermInit_flt' => 'rb_csem_MonPermInitInertialSensor2_flt',

    'InertialSensor1_MonPermBG_flt' => 'rb_csem_MonPermBGInertialSensor1_flt',
    # 'InertialSensor2_MonPermBG_flt' => 'rb_csem_MonPermBGInertialSensor2_flt',

    'AccXLgChl_Temp_flt'    => 'rb_csem_MonTempAccXLgChl_flt',
    'AccXHgMonChl_Temp_flt' => 'rb_csem_MonTempAccXHgMonChl_flt',
    'AccYLgChl_Temp_flt'    => 'rb_csem_MonTempAccYLgChl_flt',
    'AccYHgMonChl_Temp_flt' => 'rb_csem_MonTempAccYHgMonChl_flt',

    #'AccYLgPlausiChl_Temp_flt'				=> 'rb_csem_MonTempAccYLgPlausiChl_flt',
    'AccZLgChl_Temp_flt'    => 'rb_csem_MonTempAccZLgChl_flt',
    'YawRateLfChl_Temp_flt' => 'rb_csem_MonTempYawRateLfChl_flt',

    #'YawRateLfPlausiChl_Temp_flt'			=> 'rb_csem_MonTempYawRateLfPlausiChl_flt',
    'RollRateLfChl_Temp_flt'  => 'rb_csem_MonTempRollRateLfChl_flt',
    # 'PitchRateLfChl_Temp_flt' => 'rb_csem_MonTempPitchRateLfChl_flt',

    # 'InertialSensor1_TempDSP_flt' => 'rb_csem_TempDspMonInertialSensor1_flt',
    # 'InertialSensor2_TempDSP_flt' => 'rb_csem_TempDspMonInertialSensor2_flt',

    'AccXLgChl_Perm_flt'    => 'rb_csem_MonPermAccXLgChl_flt',
    'AccXHgMonChl_Perm_flt' => 'rb_csem_MonPermAccXHgMonChl_flt',
    'AccYLgChl_Perm_flt'    => 'rb_csem_MonPermAccYLgChl_flt',
    'AccYHgMonChl_Perm_flt' => 'rb_csem_MonPermAccYHgMonChl_flt',

    #'AccYLgPlausiChl_Perm_flt'				=> 'rb_csem_MonPermAccYLgPlausiChl_flt',
    'AccZLgChl_Perm_flt'    => 'rb_csem_MonPermAccZLgChl_flt',
    'YawRateLfChl_Perm_flt' => 'rb_csem_MonPermYawRateLfChl_flt',

    #'YawRateLfPlausiChl_Perm_flt'			=> 'rb_csem_MonPermYawRateLfPlausiChl_flt',
    'RollRateLfChl_Perm_flt'  => 'rb_csem_MonPermRollRateLfChl_flt',
    # 'PitchRateLfChl_Perm_flt' => 'rb_csem_MonPermPitchRateLfChl_flt',

    'AccXLgChl_SignalMonCtrl_flt'    => 'rb_simc_SignalMonCtrlLowgX_flt',
    'AccXHgMonChl_SignalMonCtrl_flt' => 'rb_simc_SignalMonCtrlHighgXMon_flt',
    'AccYLgChl_SignalMonCtrl_flt'    => 'rb_simc_SignalMonCtrlLowgY_flt',
    'AccYHgMonChl_SignalMonCtrl_flt' => 'rb_simc_SignalMonCtrlHighgYMon_flt',

    #	'AccYLgPlausiChl_SignalMonCtrl_flt'		=> 'rb_simc_SignalMonCtrlLowgYPls_flt',
    'AccZLgChl_SignalMonCtrl_flt'    => 'rb_simc_SignalMonCtrlLowgZ_flt',
    'YawRateLfChl_SignalMonCtrl_flt' => 'rb_simc_SignalMonCtrlYawRateLf_flt',

    #	'YawRateLfPlausiChl_SignalMonCtrl_flt'	=> 'rb_simc_SignalMonCtrlYawRateLfPls_flt',
    'RollRateLfChl_SignalMonCtrl_flt'  => 'rb_simc_SignalMonCtrlRollRateLf_flt',
    # 'PitchRateLfChl_SignalMonCtrl_flt' => 'rb_simc_SignalMonCtrlPitchRateLf_flt',

    'System_ConfDataInconsistent_flt' => 'rb_syc_ConfigurationDataInconsistent_flt',

    'Spi_CrcWrong_flt' => 'rb_spi_SpiRcvMsgCrcWrong_flt',

    'FieldCalibMissing_flt' => 'rb_csem_FieldCalibMissing_flt',
    'AsicIdMissmatch_flt'   => 'rb_syc_AsicIdMismatch_flt',

    'SysAsicRegisterProgMon_flt' => 'rb_bsd_SysAsicRegisterProgMon_flt',

    #******************************************************************************
    #                               SMI Sensor Faults
    #******************************************************************************
    # the indexes for Dem_AllEventsStatusByte() array are the fault numbers,
    # which can be found in *.flt file

    #rb_csem_MonPermInitInertialSensor1_flt
    #rb_csem_MonPermInitInertialSensor2_flt
    #
    # MonPermInitSensorFlt
    #---------------------
    'InertialSensor1_MonPermInit_fltStatus_U8' => 'Dem_AllEventsStatusByte(68)_U8',
    # 'InertialSensor2_MonPermInit_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermInitInertialSensor2_flt__)_U8',

    #rb_csem_MonPermBGInertialSensor1_flt
    #rb_csem_MonPermBGInertialSensor2_flt
    #
    # MonPermBGSensorFlt  ( Background:  Module Command: SD, MID, PAGE, CRC )
    #-------------------
    'InertialSensor1_MonPermBG_fltStatus_U8' => 'Dem_AllEventsStatusByte(65)_U8',
    # 'InertialSensor2_MonPermBG_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermBGInertialSensor2_flt__)_U8',

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
    'AccXHgMonChl_MonTemp_fltStatus_U8' => 'Dem_AllEventsStatusByte(73)_U8',
    'AccXLgChl_MonTemp_fltStatus_U8'    => 'Dem_AllEventsStatusByte(74)_U8',
    'AccYHgMonChl_MonTemp_fltStatus_U8' => 'Dem_AllEventsStatusByte(75)_U8',
    'AccYLgChl_MonTemp_fltStatus_U8'    => 'Dem_AllEventsStatusByte(76)_U8',

    #	'AccYLgPlausiChl_MonTemp_fltStatus_U8'					=> 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempAccYLgPlausiChl_flt__)_U8',
    'AccZLgChl_MonTemp_fltStatus_U8'      => 'Dem_AllEventsStatusByte(77)_U8',
    # 'PitchRateLfChl_MonTemp_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempPitchRateLfChl_flt__)_U8',
    'RollRateLfChl_MonTemp_fltStatus_U8'  => 'Dem_AllEventsStatusByte(78)_U8',
    'YawRateLfChl_MonTemp_fltStatus_U8'   => 'Dem_AllEventsStatusByte(79)_U8',

    #	'YawRateLfPlausiChl_MonTemp_fltStatus_U8'				=> 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonTempYawRateLfPlausiChl_flt__)_U8',
    # 'InertialSensor1_TempSensorDspMonitoring_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_TempDspMonInertialSensor1_flt__)_U8',
    # 'InertialSensor2_TempSensorDspMonitoring_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_TempDspMonInertialSensor2_flt__)_U8',

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
    'AccXHgMonChl_MonPerm_fltStatus_U8' => 'Dem_AllEventsStatusByte(60)_U8',
    'AccXLgChl_MonPerm_fltStatus_U8'    => 'Dem_AllEventsStatusByte(61)_U8',
    'AccYHgMonChl_MonPerm_fltStatus_U8' => 'Dem_AllEventsStatusByte(62)_U8',
    'AccYLgChl_MonPerm_fltStatus_U8'    => 'Dem_AllEventsStatusByte(63)_U8',

    #	'AccYLgPlausiChl_MonPerm_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermAccYLgPlausiChl_flt__)_U8',
    'AccZLgChl_MonPerm_fltStatus_U8'      => 'Dem_AllEventsStatusByte(64)_U8',
    # 'PitchRateLfChl_MonPerm_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermPitchRateLfChl_flt__)_U8',
    'RollRateLfChl_MonPerm_fltStatus_U8'  => 'Dem_AllEventsStatusByte(71)_U8',
    'YawRateLfChl_MonPerm_fltStatus_U8'   => 'Dem_AllEventsStatusByte(72)_U8',

    #	'YawRateLfPlausiChl_MonPerm_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_csem_MonPermYawRateLfPlausiChl_flt__)_U8',

    #rb_csem_FieldCalibMissing_flt
    #-----------------------------
    'FieldCalibMissing_fltStatus_U8' => 'Dem_AllEventsStatusByte(51)_U8',

    #	Other faults
    #---------------
    #rb_syc_AsicIdMismatch_flt
    'AsicIdMismatch_fltStatus_U8' => 'Dem_AllEventsStatusByte(553)_U8',

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
    'AccXHgMonChl_SignalMonCtrl_fltStatus_U8' => 'Dem_AllEventsStatusByte(257)_U8',
    'AccYHgMonChl_SignalMonCtrl_fltStatus_U8' => 'Dem_AllEventsStatusByte(258)_U8',
    'AccXLgChl_SignalMonCtrl_fltStatus_U8'    => 'Dem_AllEventsStatusByte(259)_U8',

    #	'AccYLgPlausiChl_SignalMonCtrl_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlLowgYPls_flt__)_U8',
    'AccYLgChl_SignalMonCtrl_fltStatus_U8'      => 'Dem_AllEventsStatusByte(260)_U8',
    'AccZLgChl_SignalMonCtrl_fltStatus_U8'      => 'Dem_AllEventsStatusByte(261)_U8',
    # 'PitchRateLfChl_SignalMonCtrl_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlPitchRateLf_flt__)_U8',
    'RollRateLfChl_SignalMonCtrl_fltStatus_U8'  => 'Dem_AllEventsStatusByte(264)_U8',

    #	'YawRateLfPlausiChl_SignalMonCtrl_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_simc_SignalMonCtrlYawRateLfPls_flt__)_U8',
    'YawRateLfChl_SignalMonCtrl_fltStatus_U8' => 'Dem_AllEventsStatusByte(265)_U8',

    # Configuration Data Inconsistent Flt
    #-------------------------------
    #rb_syc_ConfigurationDataInconsistent_flt

    'InertialSensor1_ConfDataInconsistent_fltStatus_U8' => 'Dem_AllEventsStatusByte(554)_U8',
    # 'InertialSensor2_ConfDataInconsistent_fltStatus_U8' => 'Dem_AllEventsStatusByte(__FAULTINDEX:rb_syc_ConfigurationDataInconsistent_flt__)_U8',

    'SpiRcvMsgCrcWrong_flt_U8' => 'Dem_AllEventsStatusByte(278)_U8',

    #  Acceleration channels_S16

    'AccXLgChl_S16'    => 'rb_cs7c_RtComRxPayload_au16(0)_S16',
    'AccXHgMonChl_S16' => 'rb_cs7c_RtComRxPayload_au16(1)_S16',
    'AccYLgChl_S16'    => 'rb_cs7c_RtComRxPayload_au16(2)_S16',
    'AccYHgMonChl_S16' => 'rb_cs7c_RtComRxPayload_au16(3)_S16',

    #	'AccYLgPlausiChl_S16'     => 'rb_cs7c_RtComRxPayload_au16(4)_S16',
    'AccZLgChl_S16'     => 'rb_cs7c_RtComRxPayload_au16(4)_S16',
    'RollRateLfChl_S16' => 'rb_cs7c_RtComRxPayload_au16(5)_S16',
    'YawRateLfChl_S16'  => 'rb_cs7c_RtComRxPayload_au16(6)_S16',

    #	'YawRateLfPlausiChl_S16'  => 'rb_cs7c_RtComRxPayload_au16(8)_S16',
    # 'PitchRateLfChl_S16' => 'rb_cs7c_RtComRxPayload_au16(9)_S16',

    #	System mode checkbox

    'ActualSystemMode_U16' => 'rb_bswm_ActualSystemMode_au16(0)',

    #	System Warning Indicator check

    'System_Warning_Indicator_State' => 'rb_wimi_SysWIStatus_aen(0)',

    #******************************************************************************
    #                               DTCs
    #******************************************************************************
    #    MonPermInit_flt
    #-------------------
    'rb_csem_MonPermInitInertialSensor1_flt' => '0x062F49',
    # 'rb_csem_MonPermInitInertialSensor2_flt' => '0xF00049',

    #    MonPermBG_flt
    #-----------------
    'rb_csem_MonPermBGInertialSensor1_flt' => '0x062F49',
    # 'rb_csem_MonPermBGInertialSensor2_flt' => '0xF00049',

    #    MonTempChl_flt
    #------------------
    'rb_csem_MonTempYawRateLfChl_flt'   => '0x406329',
    'rb_csem_MonTempAccXLgChl_flt'      => '0x406229',
    'rb_csem_MonTempAccYLgChl_flt'      => '0x406129',
    'rb_csem_MonTempAccXHgMonChl_flt'   => '0xF00049',
    'rb_csem_MonTempAccYHgMonChl_flt'   => '0xF00049',
    'rb_csem_MonTempRollRateLfChl_flt'  => '0x809929',
    'rb_csem_MonTempAccZLgChl_flt'      => '0xF00049',
    # 'rb_csem_MonTempPitchRateLfChl_flt' => '0x000018',

    #	'rb_csem_MonTempYawRateLfPlausiChl_flt'     => '0x00001B',
    #	'rb_csem_MonTempAccYLgPlausiChl_flt'        => '0x000016',
    # 'rb_csem_TempDspMonInertialSensor1_flt' => '0x0001B1',
    # 'rb_csem_TempDspMonInertialSensor2_flt' => '0x001B12',

    #    MonPermChl_flt
    #------------------
    'rb_csem_MonPermYawRateLfChl_flt'   => '0x062F49',
    'rb_csem_MonPermAccXLgChl_flt'      => '0x062F49',
    'rb_csem_MonPermAccYLgChl_flt'      => '0x062F49',
    'rb_csem_MonPermAccXHgMonChl_flt'   => '0x062F49',
    'rb_csem_MonPermAccYHgMonChl_flt'   => '0x062F49',
    'rb_csem_MonPermRollRateLfChl_flt'  => '0x062F49',
    'rb_csem_MonPermAccZLgChl_flt'      => '0x062F49',
    # 'rb_csem_MonPermPitchRateLfChl_flt' => '0xF00049',

    #	'rb_csem_MonPermYawRateLfPlausiChl_flt'     => '0xF00049',
    #	'rb_csem_MonPermAccYLgPlausiChl_flt'        => '0xF00049',

    'rb_simc_SignalMonCtrlYawRateLf_flt'   => '0x062F49',
    'rb_simc_SignalMonCtrlLowgX_flt'       => '0x062F49',
    'rb_simc_SignalMonCtrlLowgY_flt'       => '0x062F49',
    'rb_simc_SignalMonCtrlHighgXMon_flt'   => '0x062F49',
    'rb_simc_SignalMonCtrlHighgYMon_flt'   => '0x062F49',
    'rb_simc_SignalMonCtrlRollRateLf_flt'  => '0x062F49',
    'rb_simc_SignalMonCtrlLowgZ_flt'       => '0x062F49',
    # 'rb_simc_SignalMonCtrlPitchRateLf_flt' => '0xF00049',

    # Field Calibration Fault
    #------------------------
    'rb_csem_FieldCalibMissing_flt' => '0x073600',

    #	Other faults
    #---------------
    'rb_syc_AsicIdMismatch_flt'         => '0x062F49',
    'rb_bsd_SysAsicRegisterProgMon_flt' => '0x062F49',

    # Configuration Data Inconsistent Flt
    #----------------------------------------

    'rb_syc_ConfigurationDataInconsistent_flt' => '0xF00049',
    'rb_spi_SpiRcvMsgCrcWrong_flt'             => '0x062F49',

    # Lifetime fault counter

    # 'LfmCounterValue_TempDSPMonInertialSensor1_flt_U8' => 'rb_lfm_LfmCntrs_au8(36)',
    # 'LfmCounterValue_TempDSPMonInertialSensor2_flt_U8' => 'rb_lfm_LfmCntrs_au8(37)',

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
    'andMask_AsicConfigured'     => '0x0F',
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

    #   Field calibration
    #--------------------
    #    Set crunking off (write to RAM)
    #	'varName_Cranking' 					=> 'rb_csei_IgnitionOffOrEngineOn_bo',
    #	'andMask_Cranking' 					=> '0x00',
    #	'orMask_Cranking'  					=> '0x00',

    #    Set FielCalib status to not done
    'varName_FielCalibNotDone'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibStatus_u32.0',
    'andMask_FielCalibNotDone'    => '0x00',
    'orMask_FielCalibNotDone'     => '0x00',
    'restore_FielCalibNotDone_no' => 'no',

    #    Set FielCalib status to not done
    'varName_FielCalibNotDone'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibStatus_u32.0',
    'andMask_FielCalibNotDone'    => '0x00',
    'orMask_FielCalibNotDone'     => '0x00',
    'restore_FielCalibNotDone_no' => 'yes',

    #    Set FielCalib status to done
    'varName_FielCalibDone'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibStatus_u32.0',
    'andMask_FielCalibDone'    => '0x00',
    'orMask_FielCalibDone'     => '0x03',
    'restore_FielCalibDone_no' => 'no',

    #    Set FieldCalibVinValue to wrong value
    'varName_FieldCalibVinValue'     => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(16)',
    'andMask_FieldCalibVinValue'     => '0x00',
    'orMask_FieldCalibVinValue'      => '0x88',
    'restore_FieldCalibVinValue_yes' => 'yes',

    #    Set XLgFieldCalibThrValue 	to 735 (0x02DF)
    'varName_XLgFieldCalibThrValue_Byte0'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(0).0',
    'andMask_XLgFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_XLgFieldCalibThrValue_Byte0'     => '0xDF',
    'restore_XLgFieldCalibThrValue_Byte0_no' => 'no',

    'varName_XLgFieldCalibThrValue_Byte1'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(0).1',
    'andMask_XLgFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_XLgFieldCalibThrValue_Byte1'     => '0x02',
    'restore_XLgFieldCalibThrValue_Byte1_no' => 'no',

    #    Set YLgFieldCalibThrValue 	to 735 (0x02DF)
    'varName_YLgFieldCalibThrValue_Byte0'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(2).0',
    'andMask_YLgFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_YLgFieldCalibThrValue_Byte0'     => '0xDF',
    'restore_YLgFieldCalibThrValue_Byte0_no' => 'no',

    'varName_YLgFieldCalibThrValue_Byte1'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(2).1',
    'andMask_YLgFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_YLgFieldCalibThrValue_Byte1'     => '0x02',
    'restore_YLgFieldCalibThrValue_Byte1_no' => 'no',

    #    Set ZLgFieldCalibThrValue 	to 735 (0x02DF)
    'varName_ZLgFieldCalibThrValue_Byte0'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(4).0',
    'andMask_ZLgFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_ZLgFieldCalibThrValue_Byte0'     => '0xDF',
    'restore_ZLgFieldCalibThrValue_Byte0_no' => 'no',

    'varName_ZLgFieldCalibThrValue_Byte1'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(4).1',
    'andMask_ZLgFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_ZLgFieldCalibThrValue_Byte1'     => '0x02',
    'restore_ZLgFieldCalibThrValue_Byte1_no' => 'no',

    #    Set RollRateFieldCalibThrValue 	to 300 (0x012C)
    'varName_RollRateFieldCalibThrValue_Byte0'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(5).0',
    'andMask_RollRateFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_RollRateFieldCalibThrValue_Byte0'     => '0x2C',
    'restore_RollRateFieldCalibThrValue_Byte0_no' => 'no',

    'varName_RollRateFieldCalibThrValue_Byte1'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(5).1',
    'andMask_RollRateFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_RollRateFieldCalibThrValue_Byte1'     => '0x01',
    'restore_RollRateFieldCalibThrValue_Byte1_no' => 'no',

    #    Set YawRateFieldCalibThrValue 	to 300 (0x012C)
    'varName_YawRateFieldCalibThrValue_Byte0'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(6).0',
    'andMask_YawRateFieldCalibThrValue_Byte0'    => '0xFF',
    'orMask_YawRateFieldCalibThrValue_Byte0'     => '0x2C',
    'restore_YawRateFieldCalibThrValue_Byte0_no' => 'no',

    'varName_YawRateFieldCalibThrValue_Byte1'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(6).1',
    'andMask_YawRateFieldCalibThrValue_Byte1'    => '0xFF',
    'orMask_YawRateFieldCalibThrValue_Byte1'     => '0x01',
    'restore_YawRateFieldCalibThrValue_Byte1_no' => 'no',

    #    Set PitchRateFieldCalibThrValue 	to 300 (0x012C)
    # 'varName_PitchRateFieldCalibThrValue_Byte0'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(9).0',
    # 'andMask_PitchRateFieldCalibThrValue_Byte0'    => '0xFF',
    # 'orMask_PitchRateFieldCalibThrValue_Byte0'     => '0x2C',
    # 'restore_PitchRateFieldCalibThrValue_Byte0_no' => 'no',

    # 'varName_PitchRateFieldCalibThrValue_Byte1'    => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(9).1',
    # 'andMask_PitchRateFieldCalibThrValue_Byte1'    => '0xFF',
    # 'orMask_PitchRateFieldCalibThrValue_Byte1'     => '0x01',
    # 'restore_PitchRateFieldCalibThrValue_Byte1_no' => 'no',

    #	Field calibration Status NVM
    'Field_Calibration_Status_NVM_Var' => 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibStatus_u32',

    #******************************************************************************
    #                          Field calibration
    #******************************************************************************
    #   Smi7FieldCalibDataEe
    #-----------------------
    'AccXLgChl_FieldCalibValue_EE_S16'    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(0)_S16',
    'AccXHgMonChl_FieldCalibValue_EE_S16' => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(1)_S16',
    'AccYLgChl_FieldCalibValue_EE_S16'    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(2)_S16',
    'AccYHgMonChl_FieldCalibValue_EE_S16' => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(3)_S16',

    #	'AccYLgPlausi_FieldCalibValue_EE_S16'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(4)_S16',
    'AccZLgChl_FieldCalibValue_EE_S16'     => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(4)_S16',
    'RollRateLfChl_FieldCalibValue_EE_S16' => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(5)_S16',
    'YawRateLfChl_FieldCalibValue_EE_S16'  => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(6)_S16',

    #	'YawRateLfPlausiChl_FieldCalibValue_EE_S16' => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(8)_S16',
    # 'PitchRateLfChl_FieldCalibValue_EE_S16' => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(9)_S16',

    #    FieldCalibValue
    #-------------------
    'AccXLgChl_FieldCalibValue_EE_V'    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(0)',
    'AccXHgMonChl_FieldCalibValue_EE_V' => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(1)',
    'AccYLgChl_FieldCalibValue_EE_V'    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(2)',
    'AccYHgMonChl_FieldCalibValue_EE_V' => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(3)',

    #	'AccYLgPlausi_FieldCalibValue_EE_V'   		=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(4)',
    'AccZLgChl_FieldCalibValue_EE_V'     => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(4)',
    'RollRateLfChl_FieldCalibValue_EE_V' => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(5)',
    'YawRateLfChl_FieldCalibValue_EE_V'  => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(6)',

    #	'YawRateLfPlausiChl_FieldCalibValue_EE_V'   => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(8)',
    # 'PitchRateLfChl_FieldCalibValue_EE_V' => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(9)',

    #	Smi7OffsCalcSampleCntRT
    #--------------------------
    'AccXLgChl_Smi7OffsCalcSampleCntRT_U16'    => 'rb_cs7m_Smi7OffsCalcSampleCntRT_au16(0)_U16',
    'AccXHgMonChl_Smi7OffsCalcSampleCntRT_U16' => 'rb_cs7m_Smi7OffsCalcSampleCntRT_au16(1)_U16',
    'AccYLgChl_Smi7OffsCalcSampleCntRT_U16'    => 'rb_cs7m_Smi7OffsCalcSampleCntRT_au16(2)_U16',
    'AccYHgMonChl_Smi7OffsCalcSampleCntRT_U16' => 'rb_cs7m_Smi7OffsCalcSampleCntRT_au16(3)_U16',

    #	'AccYLgPlausiChl_Smi7OffsCalcSampleCntRT_U16'   	=> 'rb_cs7m_Smi7OffsCalcSampleCntRT_au16(4)_U16',
    'AccZLgChl_Smi7OffsCalcSampleCntRT_U16'     => 'rb_cs7m_Smi7OffsCalcSampleCntRT_au16(4)_U16',
    'RollRateLfChl_Smi7OffsCalcSampleCntRT_U16' => 'rb_cs7m_Smi7OffsCalcSampleCntRT_au16(5)_U16',
    'YawRateLfChl_Smi7OffsCalcSampleCntRT_U16'  => 'rb_cs7m_Smi7OffsCalcSampleCntRT_au16(6)_U16',

    #	'YawRateLfPlausiChl_Smi7OffsCalcSampleCntRT_U16'  	=> 'rb_cs7m_Smi7OffsCalcSampleCntRT_au16(8)_U16',
    # 'PitchRateLfChl_Smi7OffsCalcSampleCntRT_U16' => 'rb_cs7m_Smi7OffsCalcSampleCntRT_au16(9)_U16',

    #	Smi7OffsCalcDataBufRT
    #--------------------------
    'AccXLgChl_Smi7OffsCalcDataBufRT_S32'    => 'rb_cs7m_Smi7OffsCalcDataBufRT_as32(0)_S32',
    'AccXHgMonChl_Smi7OffsCalcDataBufRT_S32' => 'rb_cs7m_Smi7OffsCalcDataBufRT_as32(1)_S32',
    'AccYLgChl_Smi7OffsCalcDataBufRT_S32'    => 'rb_cs7m_Smi7OffsCalcDataBufRT_as32(2)_S32',
    'AccYHgMonChl_Smi7OffsCalcDataBufRT_S32' => 'rb_cs7m_Smi7OffsCalcDataBufRT_as32(3)_S32',

    #	'AccYLgPlausiChl_Smi7OffsCalcDataBufRT_S32'   	=> 'rb_cs7m_Smi7OffsCalcDataBufRT_as32(4)_S32',
    'AccZLgChl_Smi7OffsCalcDataBufRT_S32'     => 'rb_cs7m_Smi7OffsCalcDataBufRT_as32(4)_S32',
    'RollRateLfChl_Smi7OffsCalcDataBufRT_S32' => 'rb_cs7m_Smi7OffsCalcDataBufRT_as32(5)_S32',
    'YawRateLfChl_Smi7OffsCalcDataBufRT_S32'  => 'rb_cs7m_Smi7OffsCalcDataBufRT_as32(6)_S32',

    #	'YawRateLfPlausiChl_Smi7OffsCalcDataBufRT_S32'  => 'rb_cs7m_Smi7OffsCalcDataBufRT_as32(8)_S32',
    # 'PitchRateLfChl_Smi7OffsCalcDataBufRT_S32' => 'rb_cs7m_Smi7OffsCalcDataBufRT_as32(9)_S32',

    #    rb_cia_EgoVelocity_u16_U8
    'VehSpeed_U8' => 'rb_cia_UnfrozenVelocity_u16_U8',

    # Plant Mode 5 checks
    'PlantMode5_AccXLg'              => 'Dem_AllEventsState(61).debounceLevel_s16',
    'VBat_check'                     => 'Dem_AllEventsState(138).debounceLevel_s16',
    'PlantMode5_AccXHgMon'           => 'Dem_AllEventsState(60).debounceLevel_s16',
    'PlantMode5_AccYLg'              => 'Dem_AllEventsState(63).debounceLevel_s16',
    'PlantMode5_AccYHgMon'           => 'Dem_AllEventsState(62).debounceLevel_s16',
    'PlantMode5_AccZLg'              => 'Dem_AllEventsState(64).debounceLevel_s16',
    'PlantMode5_AccRoll'             => 'Dem_AllEventsState(71).debounceLevel_s16',
    'PlantMode5_AccYaw'              => 'Dem_AllEventsState(72).debounceLevel_s16',
    # 'PlantMode5_AccPitch'            => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermPitchRateLfChl_flt__).debounceLevel_s16',
    'EndofItm'                       => 'rb_itm_EndOfItmTimestamp_u32_u32',
    'PlantMode5_MonPermBG1'          => 'Dem_AllEventsState(65).debounceLevel_s16',
    # 'PlantMode5_MonPermBG2'          => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonPermBGInertialSensor2_flt__).debounceLevel_s16',
    # 'PlantMode5_TempDsp'             => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_TempDspMonInertialSensor1_flt__).debounceLevel_s16',
    # 'PlantMode5_TempDsp2'            => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_TempDspMonInertialSensor2_flt__).debounceLevel_s16',
    'PlantMode5_PermInit'            => 'Dem_AllEventsState(68).debounceLevel_s16',
    'PlantMode5_FieldCalib'          => 'Dem_AllEventsState(51).debounceLevel_s16',
    'PlantMode5_MonTemp_AccXLg'      => 'Dem_AllEventsState(74).debounceLevel_s16',
    'PlantMode5_MonTemp_AccYLg'      => 'Dem_AllEventsState(76).debounceLevel_s16',
    'PlantMode5_MonTemp_AccZLg'      => 'Dem_AllEventsState(77).debounceLevel_s16',
    'PlantMode5_MonTemp_AccXHgMon'   => 'Dem_AllEventsState(73).debounceLevel_s16',
    'PlantMode5_MonTemp_AccYHgMon'   => 'Dem_AllEventsState(75).debounceLevel_s16',
    'PlantMode5_MonTemp_RollRateLf'  => 'Dem_AllEventsState(78).debounceLevel_s16',
    # 'PlantMode5_MonTemp_PitchRateLf' => 'Dem_AllEventsState(__FAULTINDEX:rb_csem_MonTempPitchRateLfChl_flt__).debounceLevel_s16',
    'PlantMode5_MonTemp_YawRateLf'   => 'Dem_AllEventsState(79).debounceLevel_s16',

    # Mapping for customer VIN signal name on CAN
    'CAN_VIN_Signal' => 'ConnectedEDRTrigger',

};

1;
__END__
