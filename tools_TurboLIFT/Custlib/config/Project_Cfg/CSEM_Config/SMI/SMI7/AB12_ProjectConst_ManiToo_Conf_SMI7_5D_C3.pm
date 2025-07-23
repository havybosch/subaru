package LIFT_PROJECT;

#use strict;
use warnings;


$Defaults->{'TC_MANITOO_MAP'} = {
# maximum nuber of repetitions for "not passed" test cases
	'MAX_TC_REPETITION' => 1,
	
#******************************************************************************
#                         Fast Diagnosis Trigger
#******************************************************************************
#   'FD_Trigger_U8'		=> 'rb_cs6m_RawSensorDataRT_as16(0)_S8',
    'FD_Trigger_U8'		=> 'rb_cs6m_RawSensorDataRT_as16(1)_S8',
	'FD_Trigger_C'		=> 4,

#******************************************************************************
#                        Fast Diagnosis CAN Trigger
#******************************************************************************
# Remark: CAN_Trigger_U8 is the same byte on CAN as FD_Trigger_U8 read via Fast Diagnosis Service
#         This byte is the reference trigger for checking the timing of fault status on CAN interface
	'CAN_Trigger_U8'	=> 'ProDiag_Response1Byte2',  

#******************************************************************************
#                                API to Algo
#******************************************************************************
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccM45_e;0;SMA_m45_highG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccP45_e;1;SMA_p45_highG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccM45_e;2;SMA_m45_highG_redundant
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccP45_e;3;SMA_p45_highG_redundant
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccZ_e;4;SMA_az_highG
#
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXLg_e;5;SMI_ax_lowG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXHgMon_e;6;SMI_ax_midG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLg_e;7;SMI_ay_lowG
#
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYHgMon_e;8;SMI_ay_midG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLgPlausi_e;9;SMI_ay_lowG_redundant
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccZLg_e;10;SMI_az_lowG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_RollRateLf_e;11;SMI_rateX
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLf_e;12;SMI_rateZ
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLfPlausi_e;13;SMI_rateZ_redundant
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PitchRateLf_e;14;SMI_rateY

#AlgoDataValid
#-------------		
	'AccXLgChl_AlgoDataValid_U8'           => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
	'AccXHgMonChl_AlgoDataValid_U8'        => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
	'AccYLgChl_AlgoDataValid_U8'           => 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
	
	'AccYHgMonChl_AlgoDataValid_U8'        => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
	'AccYLgPlausiChl_AlgoDataValid_U8'     => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
	'AccZLgChl_AlgoDataValid_U8'           => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
	'RollRateLfChl_AlgoDataValid_U8'       => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
	'YawRateLfChl_AlgoDataValid_U8'        => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',    
	'YawRateLfPlausiChl_AlgoDataValid_U8'  => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',    
	'PitchRateLfChl_AlgoDataValid_U8'      => 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',

#AlgoDataValid_b32.0
#-------------------   	      		 	
	'AlgoDataValid_b32.0_U8'  					=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
	'AccXLgChl_AlgoData_NotValid_C'     	 	=> '0bxx0xxxxx',  
	'AccXLgChl_AlgoData_Valid_C'        	 	=> '0bxx1xxxxx',		
	'AccXHgMonChl_AlgoData_NotValid_C'  	 	=> '0bx0xxxxxx',
	'AccXHgMonChl_AlgoData_Valid_C'     	 	=> '0bx1xxxxxx',		
	'AccYLgChl_AlgoData_NotValid_C'     	 	=> '0b0xxxxxxx',
	'AccYLgChl_AlgoData_Valid_C'        	 	=> '0b1xxxxxxx',               	

#AlgoDataValid_b32.1
#-------------------
	'AlgoDataValid_b32.1_U8'					=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
	'AccYHgMonChl_AlgoData_NotValid_C'     	 	=> '0bxxxxxxx0',
	'AccYHgMonChl_AlgoData_Valid_C'        	 	=> '0bxxxxxxx1',               	
#	'AccYLgPlausiChl_AlgoData_NotValid_C'    	=> '0bxxxxxx0x',
#	'AccYLgPlausiChl_AlgoData_Valid_C'       	=> '0bxxxxxx1x',
	'AccZLgChl_AlgoData_NotValid_C'          	=> '0bxxxxx0xx',
	'AccZLgChl_AlgoData_Valid_C'             	=> '0bxxxxx1xx',
	'RollRateLfChl_AlgoData_NotValid_C'      	=> '0bxxxx0xxx',
	'RollRateLfChl_AlgoData_Valid_C'         	=> '0bxxxx1xxx',	
	'YawRateLfChl_AlgoData_NotValid_C'       	=> '0bxxx0xxxx',
	'YawRateLfChl_AlgoData_Valid_C'          	=> '0bxxx1xxxx',
#	'YawRateLfPlausiChl_AlgoData_NotValid_C' 	=> '0bxx0xxxxx',
#	'YawRateLfPlausiChl_AlgoData_Valid_C'    	=> '0bxx1xxxxx',
#	'PitchRateLfChl_AlgoData_NotValid_C'     	=> '0bx0xxxxxx',
#	'PitchRateLfChl_AlgoData_Valid_C'        	=> '0bx1xxxxxx',
		
#AlgoDataValid_b32
#-----------------
	'AlgoDataValid_V'  		 					=> 'rb_csem_SensorDataRT_st.DataValid_b32',
#    RollRateLfChl + AccXHgMonChl + AccXLgChl	
	'RollSensor_AlgoData_NotValid_C'      		=> '0bxxxxxxxxxxxxxxxxxxxx0xxxx00xxxxx',
	'RollSensor_AlgoData_Valid_C'         		=> '0bxxxxxxxxxxxxxxxxxxxx1xxxx11xxxxx',
#   YawRateLf  + AccZLgChl + AccYHgMonChl + AccYLgChl 		   			   
	'YawSensor_AlgoData_NotValid_C'       		=> '0bxxxxxxxxxxxxxxxxxxx0x0x00xxxxxxx',
	'YawSensor_AlgoData_Valid_C'          		=> '0bxxxxxxxxxxxxxxxxxxx1x1x11xxxxxxx',			

#InertDataOverload
#-----------------
	'AccXLgChl_InertDataOverload_U8'          => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
	'AccXHgMonChl_InertDataOverload_U8'       => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
	'AccYLgChl_InertDataOverload_U8'          => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
	
	'AccYHgMonChl_InertDataOverload_U8'       => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'AccYLgPlausiChl_InertDataOverload_U8'    => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
	'AccZLgChl_InertDataOverload_U8'          => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
	'RollRateLfChl_InertDataOverload_U8'      => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
	'YawRateLfChl_InertDataOverload_U8'       => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',    
#	'YawRateLfPlausiChl_InertDataOverload_U8' => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'PitchRateLfChl_InertDataOverload_U8'     => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',    
		   			   
#InertDataOverload_b32.0
#-----------------------
	'AccXLgChl_InertDataOverload_0_C'    	   	=> '0bxx0xxxxx',
	'AccXLgChl_InertDataOverload_1_C'    	   	=> '0bxx1xxxxx',
	'AccXHgMonChl_InertDataOverload_0_C' 	   	=> '0bx0xxxxxx',
	'AccXHgMonChl_InertDataOverload_1_C' 	   	=> '0bx1xxxxxx',
	'AccYLgChl_InertDataOverload_0_C'    	   	=> '0b0xxxxxxx',
	'AccYLgChl_InertDataOverload_1_C'    	   	=> '0b1xxxxxxx', 
	
#InertDataOverload_b32.1
#-----------------------
	'AccYHgMonChl_InertDataOverload_0_C'    	=> '0bxxxxxxx0',
	'AccYHgMonChl_InertDataOverload_1_C'    	=> '0bxxxxxxx1', 
#	'AccYLgPlausiChl_InertDataOverload_0_C'    	=> '0bxxxxxx0x',
#	'AccYLgPlausiChl_InertDataOverload_1_C'    	=> '0bxxxxxx1x',
	'AccZLgChl_InertDataOverload_0_C'          	=> '0bxxxxx0xx',
	'AccZLgChl_InertDataOverload_1_C'          	=> '0bxxxxx1xx',
	'RollRateLfChl_InertDataOverload_0_C'      	=> '0bxxxx0xxx',
	'RollRateLfChl_InertDataOverload_1_C'      	=> '0bxxxx1xxx',
	'YawRateLfChl_InertDataOverload_0_C'       	=> '0bxxx0xxxx',
	'YawRateLfChl_InertDataOverload_1_C'       	=> '0bxxx1xxxx',
#	'YawRateLfPlausiChl_InertDataOverload_0_C' 	=> '0bxx0xxxxx',
#	'YawRateLfPlausiChl_InertDataOverload_1_C' 	=> '0bxx1xxxxx',
#	'PitchRateLfChl_InertDataOverload_0_C'     	=> '0bx0xxxxxx',
#	'PitchRateLfChl_InertDataOverload_1_C'     	=> '0bx1xxxxxx',	

# SensorDataComFaultRT (requirement from Toyota, related to CRC fault)
#--------------------
	'AccXLgChl_SensorDataComFaultRT_U8'          => 'rb_csem_SensorDataComFaultRT_b32_U8',
	'AccXHgMonChl_SensorDataComFaultRT_U8'       => 'rb_csem_SensorDataComFaultRT_b32_U8',
	'AccYLgChl_SensorDataComFaultRT_U8'          => 'rb_csem_SensorDataComFaultRT_b32_U8',
	
	'AccYHgMonChl_SensorDataComFaultRT_U8'       => 'rb_csem_SensorDataComFaultRT_b32.1_U8',
#	'AccYLgPlausiChl_SensorDataComFaultRT_U8'    => 'rb_csem_SensorDataComFaultRT_b32.1_U8',
	'AccZLgChl_SensorDataComFaultRT_U8'          => 'rb_csem_SensorDataComFaultRT_b32.1_U8',
	'RollRateLfChl_SensorDataComFaultRT_U8'      => 'rb_csem_SensorDataComFaultRT_b32.1_U8',
	'YawRateLfChl_SensorDataComFaultRT_U8'       => 'rb_csem_SensorDataComFaultRT_b32.1_U8',    
#	'YawRateLfPlausiChl_SensorDataComFaultRT_U8' => 'rb_csem_SensorDataComFaultRT_b32.1_U8',
#	'PitchRateLfChl_SensorDataComFaultRT_U8'     => 'rb_csem_SensorDataComFaultRT_b32.1_U8',    
		   			   
#SensorDataComFaultRT_b32.0
#--------------------------
	'AccXLgChl_SensorDataComFaultRT_0_C'    	   	=> '0bxx0xxxxx',
	'AccXLgChl_SensorDataComFaultRT_1_C'    	   	=> '0bxx1xxxxx',
	'AccXHgMonChl_SensorDataComFaultRT_0_C' 	   	=> '0bx0xxxxxx',
	'AccXHgMonChl_SensorDataComFaultRT_1_C' 	   	=> '0bx1xxxxxx',
	'AccYLgChl_SensorDataComFaultRT_0_C'    	   	=> '0b0xxxxxxx',
	'AccYLgChl_SensorDataComFaultRT_1_C'    	   	=> '0b1xxxxxxx', 
	
#SensorDataComFaultRT_b32.1
#--------------------------
	'AccYHgMonChl_SensorDataComFaultRT_0_C'    		=> '0bxxxxxxx0',
	'AccYHgMonChl_SensorDataComFaultRT_1_C'    		=> '0bxxxxxxx1', 
#	'AccYLgPlausiChl_SensorDataComFaultRT_0_C'    	=> '0bxxxxxx0x',
#	'AccYLgPlausiChl_SensorDataComFaultRT_1_C'    	=> '0bxxxxxx1x',
	'AccZLgChl_SensorDataComFaultRT_0_C'          	=> '0bxxxxx0xx',
	'AccZLgChl_SensorDataComFaultRT_1_C'          	=> '0bxxxxx1xx',
	'RollRateLfChl_SensorDataComFaultRT_0_C'      	=> '0bxxxx0xxx',
	'RollRateLfChl_SensorDataComFaultRT_1_C'      	=> '0bxxxx1xxx',
	'YawRateLfChl_SensorDataComFaultRT_0_C'       	=> '0bxxx0xxxx',
	'YawRateLfChl_SensorDataComFaultRT_1_C'       	=> '0bxxx1xxxx',
#	'YawRateLfPlausiChl_SensorDataComFaultRT_0_C' 	=> '0bxx0xxxxx',
#	'YawRateLfPlausiChl_SensorDataComFaultRT_1_C' 	=> '0bxx1xxxxx',
#	'PitchRateLfChl_SensorDataComFaultRT_0_C'     	=> '0bx0xxxxxx',
#	'PitchRateLfChl_SensorDataComFaultRT_1_C'     	=> '0bx1xxxxxx',	

#******************************************************************************
#                            API to Customer
#******************************************************************************
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXLg_e;0;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXHgMon_e;1;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLg_e;2;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYHgMon_e;3;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLgPlausi_e;4;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccZLg_e;5;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollRateLf_e;6;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLf_e;7;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLfPlausi_e;8;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchRateLf_e;9;
#
#   ChlState API to Customer 
#---------------------------
	'AccXLgChl_State_U8'            => 'rb_cs7m_ChlState_aen(0)_U8',
	'AccXHgMonChl_State_U8'         => 'rb_cs7m_ChlState_aen(1)_U8',               
	'AccYLgChl_State_U8'            => 'rb_cs7m_ChlState_aen(2)_U8',
	'AccYHgMonChl_State_U8'         => 'rb_cs7m_ChlState_aen(3)_U8',               
#	'AccYLgPlausiChl_State_U8'		=> 'rb_cs7m_ChlState_aen(4)_U8',
	'AccZLgChl_State_U8'            => 'rb_cs7m_ChlState_aen(5)_U8',               
	'RollRateLfChl_State_U8'        => 'rb_cs7m_ChlState_aen(6)_U8',
	'YawRateLfChl_State_U8'         => 'rb_cs7m_ChlState_aen(7)_U8',
#	'YawRateLfPlausiChl_State_U8'   => 'rb_cs7m_ChlState_aen(8)_U8',
#	'PitchRateLfChl_State_U8'       => 'rb_cs7m_ChlState_aen(9)_U8',

	'AccXLgChl_State_V'         	=> 'rb_cs7m_ChlState_aen(0)',
	'AccXHgMonChl_State_V'      	=> 'rb_cs7m_ChlState_aen(1)',               
	'AccYLgChl_State_V'         	=> 'rb_cs7m_ChlState_aen(2)',               
	'AccYHgMonChl_State_V'      	=> 'rb_cs7m_ChlState_aen(3)',               
#	'AccYLgPlausiChl_State_V'   	=> 'rb_cs7m_ChlState_aen(4)',               
	'AccZLgChl_State_V'         	=> 'rb_cs7m_ChlState_aen(5)',               
	'RollRateLfChl_State_V'     	=> 'rb_cs7m_ChlState_aen(6)',
	'YawRateLfChl_State_V'      	=> 'rb_cs7m_ChlState_aen(7)',
#	'YawRateLfPlausiChl_State_V'	=> 'rb_cs7m_ChlState_aen(8)',
#	'PitchRateLfChl_State_V'      	=> 'rb_cs7m_ChlState_aen(9)',

# enum;rb_csem_ChannelState_ten;rb_csem_ChlInitInProgress_e;0;Channel initialization in progress
# enum;rb_csem_ChannelState_ten;rb_csem_ChlNotConfigured_e;1;Channel not configured
# enum;rb_csem_ChannelState_ten;rb_csem_ChlOk_e;2;Channel OK
# enum;rb_csem_ChannelState_ten;rb_csem_ChlTemporaryError_e;3;Channel temporary error (out of spec)
# enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorDueSensorErr_e;4;Channel permanent error (sensor perm flt)
# enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorCyclThisPOC_e;5;Channel permanent error (cyclic this POC)
# enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorCyclPrevPOC_e;6;Channel permanent error (cyclic prev POC)
# enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorDueExtReq_e;7;Channel permanent error (external request, e.g. ASI)
# enum;rb_csem_ChannelState_ten;rb_csem_ChlNotSupported_e;8;Channel is not supported
#
# Internal customer fault status
	'ChlInitInProgress_C'		 => 0,
	'ChlNotConfigured_C'  		 => 1,
	'ChlOk_C'           		 => 2,
	'ChlTemporaryError_C'		 => 3,
	'ChlPermErrorDueSensorErr_C' => 4,
	'ChlPermErrorCyclThisPOC_C'  => 5,
	'ChlPermErrorCyclPrevPOC_C'  => 6,
	'ChlPermErrorDueExtReq_C'	 => 7,
	'ChlNotSupported_C'			 => 8,

# Mapping for customer fault status on CAN
	'ChlInitInProgressCAN_C'		=> 0,
	'ChlNotConfiguredCAN_C'  	 	=> 1,
	'ChlOkCAN_C'          		 	=> 2,
	'ChlTemporaryErrorCAN_C'		=> 3,
	'ChlPermErrorDueSensorErrCAN_C' => 4,
	'ChlPermErrorCyclThisPOCCAN_C'  => 5,
	'ChlPermErrorCyclPrevPOCCAN_C'  => 6,
	'ChlPermErrorDueExtReqCAN_C'	=> 7,
	'ChlNotSupportedCAN_C'		 	=> 8,

# Mapping for customer fault status signal name on CAN
#	'VDS_CANFDLinearSignalStatus'	=> 'VDS_CANFDLinearSignalStatus',
#	'VDS_CANFDLateralSignalStatus'	=> 'VDS_CANFDLateralSignalStatus'
#	'VDS_CANFDHeaveSignalStatus'	=> 'VDS_CANFDHeaveSignalStatus',
#	'VDS_CANFDYawSignalStatus'		=> 'VDS_CANFDYawSignalStatus',
#	'VDS_CANFDRollSignalStatus'		=> 'VDS_CANFDRollSignalStatus',

#enum;rb_sfh_FilterChlList_ten;rb_sfh_RollRate15HzCS_e;0;
#enum;rb_sfh_FilterChlList_ten;rb_sfh_AccXLg15HzCS_e;1;
#enum;rb_sfh_FilterChlList_ten;rb_sfh_YawRate15HzCS_e;2;
#enum;rb_sfh_FilterChlList_ten;rb_sfh_AccYLg15HzCS_e;3;
#enum;rb_sfh_FilterChlList_ten;rb_sfh_AccZLg15HzCS_e;4;
#
#   ChlState API to Customer CAN interface                
#-----------------------------------------
	'AccXLgChl_State_sfh_U8'			=> 'rb_sfh_SensChlState_aen(0)_U8',
	'AccYLgChl_State_sfh_U8'			=> 'rb_sfh_SensChlState_aen(1)_U8',
	'AccZLgChl_State_sfh_U8'			=> 'rb_sfh_SensChlState_aen(2)_U8',                                   
	'RollRateLfChl_State_sfh_U8'		=> 'rb_sfh_SensChlState_aen(3)_U8',
	'PitchRateLfChl_State_sfh_U8'		=> 'rb_sfh_SensChlState_aen(4)_U8',
	'YawRateLfChl_State_sfh_U8'			=> 'rb_sfh_SensChlState_aen(5)_U8',

	'AccXLgChl_OutputBuffer_sfh_S16' 		=> 'rb_sfh_OutputBuffer_s16(0)_S16',
	'AccYLgChl_OutputBuffer_sfh_S16' 		=> 'rb_sfh_OutputBuffer_s16(1)_S16',
	'AccZLgChl_OutputBuffer_sfh_S16' 		=> 'rb_sfh_OutputBuffer_s16(2)_S16',
	'RollRateLfChl_OutputBuffer_sfh_S16' 	=> 'rb_sfh_OutputBuffer_s16(3)_S16',
	'PitchRateLfChl_OutputBuffer_sfh_S16'	=> 'rb_sfh_OutputBuffer_s16(4)_S16',
	'YawRateLfChl_OutputBuffer_sfh_S16' 	=> 'rb_sfh_OutputBuffer_s16(5)_S16',

	
#******************************************************************************
#                          Sensor channels
#******************************************************************************
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXLg_e;0;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXHgMon_e;1;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLg_e;2;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYHgMon_e;3;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLgPlausi_e;4;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccZLg_e;5;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollRateLf_e;6;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLf_e;7;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLfPlausi_e;8;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchRateLf_e;9;
#
#   RawData_U8           
#-------------                                                                 
	'AccXLgChl_RawData_U8'   			=> 'rb_cs7c_RtComRxPayload_au16(0)_U8',
	'AccXHgMonChl_RawData_U8'   	    => 'rb_cs7c_RtComRxPayload_au16(1)_U8',
	'AccYLgChl_RawData_U8'   			=> 'rb_cs7c_RtComRxPayload_au16(2)_U8',
	'AccYHgMonChl_RawData_U8'   	    => 'rb_cs7c_RtComRxPayload_au16(3)_U8',
#	'AccYLgPlausiChl_RawData_U8'   		=> 'rb_cs7c_RtComRxPayload_au16(4)_U8',
	'AccZLgChl_RawData_U8'   			=> 'rb_cs7c_RtComRxPayload_au16(5)_U8',
	'RollRateLfChl_RawData_U8'   		=> 'rb_cs7c_RtComRxPayload_au16(6)_U8',
	'YawRateLfChl_RawData_U8'   		=> 'rb_cs7c_RtComRxPayload_au16(7)_U8',                                            
#	'YawRateLfPlausiChl_RawData_U8'     => 'rb_cs7c_RtComRxPayload_au16(8)_U8',                                            
#	'PitchRateLfChl_RawData_U8'     	=> 'rb_cs7c_RtComRxPayload_au16(9)_U8',
#
#    RawData_U16
#---------------                                                                 
	'AccXLgChl_RawData_S16'   			=> 'rb_cs7c_RtComRxPayload_au16(0)_S16',
	'AccXHgMonChl_RawData_S16'   	    => 'rb_cs7c_RtComRxPayload_au16(1)_S16',
	'AccYLgChl_RawData_S16'   			=> 'rb_cs7c_RtComRxPayload_au16(2)_S16',
	'AccYHgMonChl_RawData_S16'   	    => 'rb_cs7c_RtComRxPayload_au16(3)_S16',
#	'AccYLgPlausiChl_RawData_S16'   	=> 'rb_cs7c_RtComRxPayload_au16(4)_S16',
	'AccZLgChl_RawData_S16'   			=> 'rb_cs7c_RtComRxPayload_au16(5)_S16',
	'RollRateLfChl_RawData_S16'     	=> 'rb_cs7c_RtComRxPayload_au16(6)_S16',
	'YawRateLfChl_RawData_S16'   		=> 'rb_cs7c_RtComRxPayload_au16(7)_S16',
#	'YawRateLfPlausiChl_RawData_S16'   	=> 'rb_cs7c_RtComRxPayload_au16(8)_S16',
#	'PitchRateLfChl_RawData_S16'   		=> 'rb_cs7c_RtComRxPayload_au16(9)_S16',
#
#	RawData_V
#------------
	'AccXLgChl_RawData_V'   			=> 'rb_cs7c_RtComRxPayload_au16(0)',
	'AccXHgMonChl_RawData_V'   	    	=> 'rb_cs7c_RtComRxPayload_au16(1)',
	'AccYLgChl_RawData_V'   			=> 'rb_cs7c_RtComRxPayload_au16(2)',
	'AccYHgMonChl_RawData_V'   	    	=> 'rb_cs7c_RtComRxPayload_au16(3)',
#	'AccYLgPlausiChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(4)',
	'AccZLgChl_RawData_V'   			=> 'rb_cs7c_RtComRxPayload_au16(5)',
	'RollRateLfChl_RawData_V'     		=> 'rb_cs7c_RtComRxPayload_au16(6)',
	'YawRateLfChl_RawData_V'   			=> 'rb_cs7c_RtComRxPayload_au16(7)',
#	'YawRateLfPlausiChl_RawData_V'   	=> 'rb_cs7c_RtComRxPayload_au16(8)',
#	'PitchRateLfChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(9)',
	
#	 Processed data for Algo
#---------------------------
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXLg_e;5;SMI_ax_lowG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXHgMon_e;6;SMI_ax_midG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLg_e;7;SMI_ay_lowG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYHgMon_e;8;SMI_ay_midG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLgPlausi_e;9;SMI_ay_lowG_redundant
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccZLg_e;10;SMI_az_lowG
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_RollRateLf_e;11;SMI_rateX
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLf_e;12;SMI_rateZ
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLfPlausi_e;13;SMI_rateZ_redundant
#enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PitchRateLf_e;14;SMI_rateY
#
	'AccXLgChl_NhtsaData_S16'   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(5)_S16',
	'AccXHgMonChl_NhtsaData_S16'   	    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(6)_S16',
	'AccYLgChl_NhtsaData_S16'   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(7)_S16',
	'AccYHgMonChl_NhtsaData_S16'   	    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(8)_S16',
#	'AccYLgPlausiChl_NhtsaData_S16'   	=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(9)_S16',				
	'AccZLgChl_NhtsaData_S16'           => 'rb_csem_SensorDataRT_st.ChannelValue_as16(10)_S16',
	'RollRateLfChl_NhtsaData_S16'       => 'rb_csem_SensorDataRT_st.ChannelValue_as16(11)_S16',
	'YawRateLfChl_NhtsaData_S16'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(12)_S16', 
#	'YawRateLfPlausiChl_NhtsaData_S16'  => 'rb_csem_SensorDataRT_st.ChannelValue_as16(13)_S16', 
#	'PitchRateLfChl_NhtsaData_S16'      => 'rb_csem_SensorDataRT_st.ChannelValue_as16(14)_S16', 
	
#******************************************************************************
#                                 Sensor data
#******************************************************************************
# enum;rb_sycc_Smi7BusAddress_ten;rb_sycc_SMI700BusAddress00_e;0;SMI700 bus address 00
# enum;rb_sycc_Smi7BusAddress_ten;rb_sycc_SMI700BusAddress01_e;1;SMI700 bus address 01
# enum;rb_sycc_Smi7BusAddress_ten;rb_sycc_SMI710BusAddress10_e;2;SMI710 bus address 10
# enum;rb_sycc_Smi7BusAddress_ten;rb_sycc_SMI710BusAddress11_e;3;SMI710 bus address 11
#
#    ClusterFlags
#----------------
	'YawSensor_ClusterFlags_U8'         	=> 'rb_cs7c_StatusData_ast(0).ClustFlg_u16_U8',
#	'YawPlausiSensor_ClusterFlags_U8'   	=> 'rb_cs7c_StatusData_ast(1).ClustFlg_u16_U8',
	'RollSensor_ClusterFlags_U8'        	=> 'rb_cs7c_StatusData_ast(2).ClustFlg_u16_U8',
#	'PitchSensor_ClusterFlags_U8'       	=> 'rb_cs7c_StatusData_ast(3).ClustFlg_u16_U8',

#    ErrorFlags
#--------------
	'YawSensor_ErrorFlag0_U8'         		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(0)_U8',
	'YawSensor_ErrorFlag1_U8'         		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(1)_U8',
	'YawSensor_ErrorFlag2_U8'         		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(2)_U8',
#	'YawPlausiSensor_ErrorFlag0_U8'   		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(0)_U8',
#	'YawPlausiSensor_ErrorFlag1_U8'   		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(1)_U8',
#	'YawPlausiSensor_ErrorFlag2_U8'   		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(2)_U8',
	'RollSensor_ErrorFlag0_U8'        		=> 'rb_cs7c_StatusData_ast(2).ErFlg_au16(0)_U8',
	'RollSensor_ErrorFlag1_U8'        		=> 'rb_cs7c_StatusData_ast(2).ErFlg_au16(1)_U8',
	'RollSensor_ErrorFlag2_U8'        		=> 'rb_cs7c_StatusData_ast(2).ErFlg_au16(2)_U8',
#	'PitchSensor_ErrorFlag0_U8'       		=> 'rb_cs7c_StatusData_ast(3).ErFlg_au16(0)_U8',
#	'PitchSensor_ErrorFlag1_U8'       		=> 'rb_cs7c_StatusData_ast(3).ErFlg_au16(1)_U8',
#	'PitchSensor_ErrorFlag2_U8'       		=> 'rb_cs7c_StatusData_ast(3).ErFlg_au16(2)_U8',

#	 Temperature		
#---------------
	'YawSensor_Temp1_U8'				=> 'rb_cs7c_StatusData_ast(0).Temperat1_s16_U8',	
#	'YawPlausiSensor_Temp1_U8'			=> 'rb_cs7c_StatusData_ast(1).Temperat1_s16_U8',	
	'RollSensor_Temp1_U8'				=> 'rb_cs7c_StatusData_ast(2).Temperat1_s16_U8',	
#	'PitchSensor_Temp1_U8'				=> 'rb_cs7c_StatusData_ast(3).Temperat1_s16_U8',
	'YawSensor_Temp1_S16'               	=> 'rb_cs7c_StatusData_ast(0).Temperat1_s16_S16',                             
#	'YawPlausiSensor_Temp1_S16'         	=> 'rb_cs7c_StatusData_ast(1).Temperat1_s16_S16',                             
	'RollSensor_Temp1_S16'              	=> 'rb_cs7c_StatusData_ast(2).Temperat1_s16_S16',		
#	'PitchSensor_Temp1_S16'             	=> 'rb_cs7c_StatusData_ast(3).Temperat1_s16_S16',						

#	 ClusterFlags stored in Field Claim Data area		
#------------------------------------------------
	'YawSensor_ClusterFlags_EE_U8'			=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16_U8',
#	'YawPlausiSensor_ClusterFlags_EE_U8'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16_U8',
	'RollSensor_ClusterFlags_EE_U8'	    	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ClustFlg_u16_U8',
#	'PitchSensor_ClusterFlags_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ClustFlg_u16_U8',

#	 ErrorFlags stored in Field Claim Data area		
#----------------------------------------------
	'YawSensor_ErrorFlag0_EE_U8'      		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(0)_U8',
	'YawSensor_ErrorFlag1_EE_U8'      		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(1)_U8',
	'YawSensor_ErrorFlag9_EE_U8'      		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(9)_U8',
#	'YawPlausiSensor_ErrorFlag0_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0)_U8',
#	'YawPlausiSensor_ErrorFlag1_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(1)_U8',
#	'YawPlausiSensor_ErrorFlag9_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(9)_U8',
	'RollSensor_ErrorFlag0_EE_U8'     		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(0)_U8',
	'RollSensor_ErrorFlag1_EE_U8'     		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(1)_U8',
	'RollSensor_ErrorFlag9_EE_U8'     		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(9)_U8',
#	'PitchSensor_ErrorFlag0_EE_U8'    		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(0)_U8',
#	'PitchSensor_ErrorFlag1_EE_U8'    		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(1)_U8',
#	'PitchSensor_ErrorFlag9_EE_U8'    		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(9)_U8',

#	 Temperature stored in Field Claim Data area		
#-----------------------------------------------
	'YawSensor_Temp1_EE_U8'      		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16_U8',
#	'YawPlausiSensor_Temp1_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16_U8',
	'RollSensor_Temp1_EE_U8'     		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).Temperat1_s16_U8',
#	'PitchSensor_Temp1_EE_U8'    		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).Temperat1_s16_U8',

#	AsicSerialNr
#---------------
	'YawSensor_AsicSerialNr0_V'       	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(0)',
	'YawSensor_AsicSerialNr1_V'       	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(1)',
	'YawSensor_AsicSerialNr2_V'       	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(2)',
#	'YawPlausiSensor_AsicSerialNr0_V' 	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(0)',
#	'YawPlausiSensor_AsicSerialNr1_V' 	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(1)',
#	'YawPlausiSensor_AsicSerialNr2_V' 	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(2)',
	'RollSensor_AsicSerialNr0_V'      	=> 'rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(0)',
	'RollSensor_AsicSerialNr1_V'      	=> 'rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(1)',
	'RollSensor_AsicSerialNr2_V'      	=> 'rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(2)',
#	'PitchSensor_AsicSerialNr0_V'     	=> 'rb_cs7m_AsicIdData_ast(3).AsicSerialNr_au16(0)',
#	'PitchSensor_AsicSerialNr1_V'     	=> 'rb_cs7m_AsicIdData_ast(3).AsicSerialNr_au16(1)',
#	'PitchSensor_AsicSerialNr2_V'     	=> 'rb_cs7m_AsicIdData_ast(3).AsicSerialNr_au16(2)',

#	SmiSerialNr
#--------------
	'YawSensor_SmiSerialNr0_V'        	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(0)',
	'YawSensor_SmiSerialNr1_V'        	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(1)',
	'YawSensor_SmiSerialNr2_V'        	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(2)',
#	'YawPlausiSensor_SmiSerialNr0_V'  	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(0)',
#	'YawPlausiSensor_SmiSerialNr1_V'  	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(1)',
#	'YawPlausiSensor_SmiSerialNr2_V'  	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(2)',
	'RollSensor_SmiSerialNr0_V'       	=> 'rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(0)',
	'RollSensor_SmiSerialNr1_V'       	=> 'rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(1)',
	'RollSensor_SmiSerialNr2_V'       	=> 'rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(2)',
#	'PitchSensor_SmiSerialNr0_V'      	=> 'rb_cs7m_AsicIdData_ast(3).SmiSerialNr_au16(0)',
#	'PitchSensor_SmiSerialNr1_V'      	=> 'rb_cs7m_AsicIdData_ast(3).SmiSerialNr_au16(1)',
#	'PitchSensor_SmiSerialNr2_V'      	=> 'rb_cs7m_AsicIdData_ast(3).SmiSerialNr_au16(2)',

#	FieldClaimDataEe ClusterFlags
#--------------------------------
	'YawSensor_ClusterFlags_EE_V'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16',
#	'YawPlausiSensor_ClusterFlags_EE_V' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16',
	'RollSensor_ClusterFlags_EE_V'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ClustFlg_u16',
#	'PitchSensor_ClusterFlags_EE_V'	    => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ClustFlg_u16',

#	FieldClaimDataEe Temperature
#-------------------------------
	'YawSensor_Temperature_EE_V'        => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16',
#	'YawPlausiSensor_Temperature_EE_V'  => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16',
	'RollSensor_Temperature_EE_V'       => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).Temperat1_s16',
#	'PitchSensor_Temperature_EE_V'      => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).Temperat1_s16',

#	FieldClaimDataEe ErrorFlags
#------------------------------
	'YawSensor_ErrorFlag0_EE_V'         => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(0)',
	'YawSensor_ErrorFlag9_EE_V'         => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(9)',
#	'YawPlausiSensor_ErrorFlag0_EE_V'   => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0)',
#	'YawPlausiSensor_ErrorFlag9_EE_V'   => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0)',
	'RollSensor_ErrorFlag0_EE_V'        => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(9)',
	'RollSensor_ErrorFlag9_EE_V'        => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(9)',
#	'PitchSensor_ErrorFlag0_EE_V'       => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(0)',
#	'PitchSensor_ErrorFlag9_EE_V'       => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(9)',

#	 ErrorFlags stored in Field Claim Data area		
#----------------------------------------------
	'ClusterFlags_EE_C'		=> '0x8421',
	'ErrorFlag_EE_C'        => '0x8421',
	'Temperature_EE_C'      => '0x8421',				

#	DeviceId
#-----------
#enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsSystemAsic1_e;0;Master System ASIC
#enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsSystemAsic2_e;1;2nd System ASIC
#enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorMain_e;2;Main HighG Sensor
#enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorPlausi_e;3;Plausibility HighG Sensor
#enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorYaw_e;4;Yaw Rate Sensor (for ESP)
#enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorYawPlausi_e;5;Yaw Rate 2nd Sensor (Plausibility)
#enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorRoll_e;6;Roll Rate Sensor
#enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorPitch_e;7;Pitch Rate Sensor
	'YawSensor_DeviceId_V'    	 		=> 'rb_syca_AsicDeviceId_au16(4)',
#	'YawPlausiSensor_DeviceId_V' 		=> 'rb_syca_AsicDeviceId_au16(5)',
	'RollSensor_DeviceId_V'   	 		=> 'rb_syca_AsicDeviceId_au16(6)',
#	'PitchSensor_DeviceId_V'   	 		=> 'rb_syca_AsicDeviceId_au16(7)',

#	RevisionId
#-------------
	'YawSensor_RevisionId_V'        	=> 'rb_syca_AsicRevisionId_au16(4)',
#	'YawPlausiSensor_RevisionId_V' 		=> 'rb_syca_AsicRevisionId_au16(5)',
	'RollSensor_RevisionId_V'       	=> 'rb_syca_AsicRevisionId_au16(6)',
#	'PitchSensor_RevisionId_V'      	=> 'rb_syca_AsicRevisionId_au16(7)',

#    ErrorCounter
#----------------
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorIntErrCnt45_e;20;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorIntErrCnt45_e;24;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorIntErrCnt45_e;28;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorIntErrCnt45_e;32;
#
	'YawSensor_IntErrCnt45_U8'         		=> 'rb_cs7c_RtComRxPayload_au16(20)_U8',
	'YawPlausiSensor_IntErrCnt45_U8'   		=> 'rb_cs7c_RtComRxPayload_au16(24)_U8',
	'RollSensor_IntErrCnt45_U8'        		=> 'rb_cs7c_RtComRxPayload_au16(28)_U8',
	'PitchSensor_IntErrCnt45_U8'       		=> 'rb_cs7c_RtComRxPayload_au16(32)_U8',                 

#    Status ClusterFlags
#-----------------------
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorStatusClusFlags_e;10;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorStatusClusFlags_e;11;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorStatusClusFlags_e;12;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorStatusClusFlags_e;13;
#
	'YawSensor_Status_ClusterFlags_U8'         	=> 'rb_cs7c_RtComRxPayload_au16(10)_U8',
#	'YawPlausiSensor_Status_ClusterFlags_U8'   	=> 'rb_cs7c_RtComRxPayload_au16(10)_U8',
	'RollSensor_Status_ClusterFlags_U8'        	=> 'rb_cs7c_RtComRxPayload_au16(12)_U8',
#	'PitchSensor__Status_ClusterFlags_U8'       => 'rb_cs7c_RtComRxPayload_au16(13)_U8',

#    Status HW SCON
#------------------
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorStatusHwScon_e;14;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorStatusHwScon_e;15;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorStatusHwScon_e;16;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorStatusHwScon_e;17;
#
	'YawSensor_Status_HW_SCON_U8'         	=> 'rb_cs7c_RtComRxPayload_au16(14)_U8',
#	'YawPlausiSensor_Status_HW_SCON_U8'   	=> 'rb_cs7c_RtComRxPayload_au16(15)_U8',
	'RollSensor_Status_HW_SCON_U8'        	=> 'rb_cs7c_RtComRxPayload_au16(16)_U8',
#	'PitchSensor_Status_HW_SCON_U8'       	=> 'rb_cs7c_RtComRxPayload_au16(17)_U8',

# Device IDs
#------------
	'YawSensor_DeviceId_C'	=> '0x0704',
	'RollSensor_DeviceId_C'	=> '0x0707',

# manipulated RevisionId, SmiSerialNr, AsicSerialNr will be checked against this constants
# (not checked by software)
	'RevisionId_C'    		=> '0x1111',
	'SmiSerialNr0_C'  		=> '0x0011',               
	'SmiSerialNr1_C'  		=> '0x1100',                 
	'SmiSerialNr2_C'  		=> '0bxxxx000100010001', 
	'AsicSerialNr0_C' 		=> '0x0011',               
	'AsicSerialNr1_C' 		=> '0x1100',               
	'AsicSerialNr2_C' 		=> '0x1111',

#    InitialRelOffsetCheckFailure
	'cs7m_ManagerStateRT_U8'              	=> 'rb_cs7m_ManagerStateRT_en_U8',                
	'csem_InitialRelOffsetCheckFailure_U8'	=> 'rb_csem_SensorDataRT_st.InitialRelOffsetCheckFailure_bo_U8',
				
#******************************************************************************
#                               SMI Sensor Faults 
#******************************************************************************
# the indexes for Dem_AllEventsStatusByte() array are the fault numbers,
# which can be found in *.flt file

# rb_csem_MonPermInitPitchSensor_flt,0xF00049 rb_csem_MonPermInitPitchSensor_flt
# rb_csem_MonPermInitRollSensor_flt,0xF00049 rb_csem_MonPermInitRollSensor_flt
# rb_csem_MonPermInitYawPlausiSensor_flt,0xF00049 rb_csem_MonPermInitYawPlausiSensor_flt
# rb_csem_MonPermInitYawSensor_flt,0xF00049 rb_csem_MonPermInitYawSensor_flt
#
# MonPermInitSensorFlt
#---------------------
#	'PitchSensor_MonPermInit_fltStatus_U8'     => 'Dem_AllEventsStatusByte(56)_U8',
	'RollSensor_MonPermInit_fltStatus_U8'      => 'Dem_AllEventsStatusByte(57)_U8',
#	'YawPlausiSensor_MonPermInit_fltStatus_U8' => 'Dem_AllEventsStatusByte(58)_U8',
	'YawSensor_MonPermInit_fltStatus_U8'       => 'Dem_AllEventsStatusByte(59)_U8',

# rb_csem_MonPermBGPitchSensor_flt,0xF00049 rb_csem_MonPermBGPitchSensor_flt
# rb_csem_MonPermBGRollSensor_flt,0xF00049 rb_csem_MonPermBGRollSensor_flt
# rb_csem_MonPermBGYawPlausiSensor_flt,0xF00049 rb_csem_MonPermBGYawPlausiSensor_flt
# rb_csem_MonPermBGYawSensor_flt,0xF00049 rb_csem_MonPermBGYawSensor_flt
#
# MonPermBGSensorFlt
#-------------------
#	'PitchSensor_MonPermBG_fltStatus_U8'     => 'Dem_AllEventsStatusByte(52)_U8',
	'RollSensor_MonPermBG_fltStatus_U8'      => 'Dem_AllEventsStatusByte(53)_U8',
#	'YawPlausiSensor_MonPermBG_fltStatus_U8' => 'Dem_AllEventsStatusByte(54)_U8',
	'YawSensor_MonPermBG_fltStatus_U8'       => 'Dem_AllEventsStatusByte(55)_U8',
              
# rb_csem_MonPermAccXHgMonChl_flt,0xF00049 rb_csem_MonPermAccXHgMonChl_flt
# rb_csem_MonPermAccXLgChl_flt,0xF00049 rb_csem_MonPermAccXLgChl_flt
# rb_csem_MonPermAccYHgMonChl_flt,0xF00049 rb_csem_MonPermAccYHgMonChl_flt
# rb_csem_MonPermAccYLgChl_flt,0xF00049 rb_csem_MonPermAccYLgChl_flt
# rb_csem_MonPermAccYLgPlausiChl_flt,0xF00049 rb_csem_MonPermAccYLgPlausiChl_flt
# rb_csem_MonPermAccZLgChl_flt,0xF00049 rb_csem_MonPermAccZLgChl_flt
# rb_csem_MonPermPitchRateLfChl_flt,0xF00049 rb_csem_MonPermPitchRateLfChl_flt
# rb_csem_MonPermRollRateLfChl_flt,0xF00049 rb_csem_MonPermRollRateLfChl_flt
# rb_csem_MonPermYawRateLfChl_flt,0xF00049 rb_csem_MonPermYawRateLfChl_flt
# rb_csem_MonPermYawRateLfPlausiChl_flt,0xF00049 rb_csem_MonPermYawRateLfPlausiChl_flt
#
# MonPermChlFlt
#--------------
	'AccXHgMonChl_MonPerm_fltStatus_U8'       	=> 'Dem_AllEventsStatusByte(46)_U8',
	'AccXLgChl_MonPerm_fltStatus_U8'          	=> 'Dem_AllEventsStatusByte(47)_U8',
	'AccYHgMonChl_MonPerm_fltStatus_U8'       	=> 'Dem_AllEventsStatusByte(48)_U8',
	'AccYLgChl_MonPerm_fltStatus_U8'          	=> 'Dem_AllEventsStatusByte(49)_U8',
#	'AccYLgPlausiChl_MonPerm_fltStatus_U8'    	=> 'Dem_AllEventsStatusByte(50)_U8',
	'AccZLgChl_MonPerm_fltStatus_U8'          	=> 'Dem_AllEventsStatusByte(51)_U8',
#	'PitchRateLfChl_MonPerm_fltStatus_U8'     	=> 'Dem_AllEventsStatusByte(60)_U8',
	'RollRateLfChl_MonPerm_fltStatus_U8'      	=> 'Dem_AllEventsStatusByte(61)_U8',
	'YawRateLfChl_MonPerm_fltStatus_U8'       	=> 'Dem_AllEventsStatusByte(62)_U8',
#	'YawRateLfPlausiChl_MonPerm_fltStatus_U8' 	=> 'Dem_AllEventsStatusByte(63)_U8',


# rb_csem_MonTempAccXHgMonChl_flt,0x000012 rb_csem_MonTempAccXHgMonChl_flt
# rb_csem_MonTempAccXLgChl_flt,0x000013 rb_csem_MonTempAccXLgChl_flt
# rb_csem_MonTempAccYHgMonChl_flt,0x000014 rb_csem_MonTempAccYHgMonChl_flt
# rb_csem_MonTempAccYLgChl_flt,0x000015 rb_csem_MonTempAccYLgChl_flt
# rb_csem_MonTempAccYLgPlausiChl_flt,0x000016 rb_csem_MonTempAccYLgPlausiChl_flt
# rb_csem_MonTempAccZLgChl_flt,0x000017 rb_csem_MonTempAccZLgChl_flt
# rb_csem_MonTempPitchRateLfChl_flt,0x000018 rb_csem_MonTempPitchRateLfChl_flt
# rb_csem_MonTempRollRateLfChl_flt,0x000019 rb_csem_MonTempRollRateLfChl_flt
# rb_csem_MonTempYawRateLfChl_flt,0x00001A rb_csem_MonTempYawRateLfChl_flt
# rb_csem_MonTempYawRateLfPlausiChl_flt,0x00001B rb_csem_MonTempYawRateLfPlausiChl_flt
#
# MonTempChlFlt
#--------------
	'AccXHgMonChl_MonTemp_fltStatus_U8'       => 'Dem_AllEventsStatusByte(64)_U8',
	'AccXLgChl_MonTemp_fltStatus_U8'          => 'Dem_AllEventsStatusByte(65)_U8',
	'AccYHgMonChl_MonTemp_fltStatus_U8'       => 'Dem_AllEventsStatusByte(66)_U8',
	'AccYLgChl_MonTemp_fltStatus_U8'          => 'Dem_AllEventsStatusByte(67)_U8',
#	'AccYLgPlausiChl_MonTemp_fltStatus_U8'    => 'Dem_AllEventsStatusByte(68)_U8',
	'AccZLgChl_MonTemp_fltStatus_U8'          => 'Dem_AllEventsStatusByte(69)_U8',
#	'PitchRateLfChl_MonTemp_fltStatus_U8'     => 'Dem_AllEventsStatusByte(70)_U8',
	'RollRateLfChl_MonTemp_fltStatus_U8'      => 'Dem_AllEventsStatusByte(71)_U8',
	'YawRateLfChl_MonTemp_fltStatus_U8'       => 'Dem_AllEventsStatusByte(72)_U8',
#	'YawRateLfPlausiChl_MonTemp_fltStatus_U8' => 'Dem_AllEventsStatusByte(73)_U8',

#rb_csem_FieldCalibMissing_flt
#-----------------------------
    'FieldCalibMissing_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(37)_U8',

#	Other faults
#---------------
#rb_syc_AsicIdMismatch_flt
	'AsicIdMismatch_fltStatus_U8'				=> 'Dem_AllEventsStatusByte(543)_U8',				
		
# rb_simc_SignalMonCtrlHighgXMon_flt,0xF00049 rb_simc_SignalMonCtrlHighgXMon_flt
# rb_simc_SignalMonCtrlHighgYMon_flt,0xF00049 rb_simc_SignalMonCtrlHighgYMon_flt
# rb_simc_SignalMonCtrlLowgX_flt,0xF00049 rb_simc_SignalMonCtrlLowgX_flt
# rb_simc_SignalMonCtrlLowgYPls_flt,0xF00049 rb_simc_SignalMonCtrlLowgYPls_flt
# rb_simc_SignalMonCtrlLowgY_flt,0xF00049 rb_simc_SignalMonCtrlLowgY_flt
# rb_simc_SignalMonCtrlLowgZ_flt,0xF00049 rb_simc_SignalMonCtrlLowgZ_flt
# rb_simc_SignalMonCtrlMain_flt,0xF00049 rb_simc_SignalMonCtrlMain_flt
# rb_simc_SignalMonCtrlPitchRateLf_flt,0xF00049 rb_simc_SignalMonCtrlPitchRateLf_flt
# rb_simc_SignalMonCtrlPlausi_flt,0xF00049 rb_simc_SignalMonCtrlPlausi_flt
# rb_simc_SignalMonCtrlRollRateLf_flt,0xF00049 rb_simc_SignalMonCtrlRollRateLf_flt
# rb_simc_SignalMonCtrlYawRateLfPls_flt,0xF00049 rb_simc_SignalMonCtrlYawRateLfPls_flt
# rb_simc_SignalMonCtrlYawRateLf_flt,0xF00049 rb_simc_SignalMonCtrlYawRateLf_flt
	'AccXHgMonChl_SignalMonCtrl_fltStatus_U8'       => 'Dem_AllEventsStatusByte(230)_U8',
	'AccYHgMonChl_SignalMonCtrl_fltStatus_U8'       => 'Dem_AllEventsStatusByte(231)_U8',
	'AccXLgChl_SignalMonCtrl_fltStatus_U8'          => 'Dem_AllEventsStatusByte(232)_U8',
#	'AccYLgPlausiChl_SignalMonCtrl_fltStatus_U8'    => 'Dem_AllEventsStatusByte(233)_U8',
	'AccYLgChl_SignalMonCtrl_fltStatus_U8'          => 'Dem_AllEventsStatusByte(234)_U8',
	'AccZLgChl_SignalMonCtrl_fltStatus_U8'          => 'Dem_AllEventsStatusByte(235)_U8',
#	'PitchRateLfChl_SignalMonCtrl_fltStatus_U8'     => 'Dem_AllEventsStatusByte(237)_U8',
	'RollRateLfChl_SignalMonCtrl_fltStatus_U8'      => 'Dem_AllEventsStatusByte(239)_U8', 
#	'YawRateLfPlausiChl_SignalMonCtrl_fltStatus_U8' => 'Dem_AllEventsStatusByte(238)_U8',
	'YawRateLfChl_SignalMonCtrl_fltStatus_U8'       => 'Dem_AllEventsStatusByte(240)_U8',
				
#******************************************************************************
#                                   DTCs
#******************************************************************************
#    MonPermInit_flt
#-------------------
	'rb_csem_MonPermInitYawSensor_flt'          => '0xF00049',
	'rb_csem_MonPermInitRollSensor_flt'         => '0xF00049',
#	'rb_csem_MonPermInitPitchSensor_flt'        => '0xF00049',
#	'rb_csem_MonPermInitYawPlausiSensor_flt'    => '0xF00049',

#    MonPermBG_flt
#-----------------
	'rb_csem_MonPermBGYawSensor_flt'            => '0xF00049',
	'rb_csem_MonPermBGRollSensor_flt'           => '0xF00049',
#	'rb_csem_MonPermBGPitchSensor_flt'          => '0xF00049',
#	'rb_csem_MonPermBGYawPlausiSensor_flt'      => '0xF00049',

#    MonPermChl_flt
#------------------
	'rb_csem_MonPermYawRateLfChl_flt'           => '0xF00049',
	'rb_csem_MonPermAccXLgChl_flt'              => '0xF00049',
	'rb_csem_MonPermAccYLgChl_flt'              => '0xF00049',
	'rb_csem_MonPermAccXHgMonChl_flt'           => '0xF00049',
	'rb_csem_MonPermAccYHgMonChl_flt'           => '0xF00049',
	'rb_csem_MonPermRollRateLfChl_flt'          => '0xF00049',
	'rb_csem_MonPermAccZLgChl_flt'              => '0xF00049',
#	'rb_csem_MonPermPitchRateLfChl_flt'         => '0xF00049',
#	'rb_csem_MonPermYawRateLfPlausiChl_flt'     => '0xF00049',
#	'rb_csem_MonPermAccYLgPlausiChl_flt'        => '0xF00049',

#    MonTempChl_flt
#------------------
	'rb_csem_MonTempYawRateLfChl_flt'           => '0x00001A',
	'rb_csem_MonTempAccXLgChl_flt'              => '0x000013',
	'rb_csem_MonTempAccYLgChl_flt'              => '0x000015',
	'rb_csem_MonTempAccXHgMonChl_flt'           => '0x000012',
	'rb_csem_MonTempAccYHgMonChl_flt'           => '0x000014',
	'rb_csem_MonTempRollRateLfChl_flt'          => '0x000019',
	'rb_csem_MonTempAccZLgChl_flt'              => '0x000017',
#	'rb_csem_MonTempPitchRateLfChl_flt'         => '0x000018',
#	'rb_csem_MonTempYawRateLfPlausiChl_flt'     => '0x00001B',
#	'rb_csem_MonTempAccYLgPlausiChl_flt'        => '0x000016',

# Field Calibration Fault
#------------------------
	'rb_csem_FieldCalibMissing_flt'				=> '0x00001B',

#	Other faults
#---------------
	'rb_syc_AsicIdMismatch_flt'					=> '0xF00049',

#******************************************************************************
#                         Configuration data
#******************************************************************************
#    Set ECU to Plant Mode
	'varName_PlantMode' 				=> 'rb_sycg_PlantModes_dfst.rb_sycg_ActivePlantModes_au8(1)',
	'andMask_PlantMode' 				=> '0xFF',
	'orMask_PlantMode'  				=> '0x02',
	'restore_PlantMode_yes' 			=> 'yes',

#    Set ECU to Read Error Counter Mode
	'varName_RdErrCnt' 					=> 'rb_csem_NvmConfigDataEe_dfst.CsemMode_b32.2',
	'andMask_RdErrCnt' 					=> '0xFF',
	'orMask_RdErrCnt'  					=> '0x01',
	'restore_RdErrCnt_yes'  			=> 'yes',

#    De-configure SMI sensors           
#----------------------------			   	                
#    De-configure all SMI7 sensors            
	'varName_AsicConfigured' 			=> 'rb_syca_SysConfAsicEeData_dfst.AsicConfigured_ab8(0)',                                
	'andMask_AsicConfigured' 			=> '0x0F',
	'orMask_AsicConfigured'  			=> '0x00',
	'restore_AsicConfigured_yes'		=> 'yes',

#    Delay Init Test Manager by 4s           
#---------------------------------			   	
	'varName_InitDelay' 				=> 'rb_sycg_StaticBehaviorBits_dfst.rb_sycg_StaticBits_ab8(0)',                                
	'andMask_InitDelay' 				=> '0xFF',
	'orMask_InitDelay'  				=> '0x01',
	'restore_InitDelay_yes'  			=> 'yes',
				
#   Field calibration
#--------------------		   	
#    Set crunking off (write to RAM)            
	'varName_Cranking' 					=> 'rb_csei_IgnitionOffOrEngineOn_bo',                                
	'andMask_Cranking' 					=> '0x00',
	'orMask_Cranking'  					=> '0x00',
				
#    Set FielCalib status to not done           
	'varName_FielCalibNotDone' 			=> 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibStatus_u32.0',
	'andMask_FielCalibNotDone' 			=> '0x00',
	'orMask_FielCalibNotDone'  			=> '0x00',
	'restore_FielCalibNotDone_no'  		=> 'no',

#    Set FielCalib status to done           
	'varName_FielCalibDone' 			=> 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibStatus_u32.0',
	'andMask_FielCalibDone' 			=> '0x00',
	'orMask_FielCalibDone'  			=> '0x03',
	'restore_FielCalibDone_no'  		=> 'no',
				
#    Set FieldCalibVinValue to wrong value           
	'varName_FieldCalibVinValue' 		=> 'rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(16)',
	'andMask_FieldCalibVinValue' 		=> '0x00',
	'orMask_FieldCalibVinValue'  		=> '0x88',
	'restore_FieldCalibVinValue_yes' 	=> 'yes',
};

#******************************************************************************
#                          Field calibration
#******************************************************************************
#   Smi7FieldCalibDataEe
#-----------------------				
	'AccXLgChl_FieldCalibValue_EE_S16'   		    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(0)_S16',
	'AccXHgMonChl_FieldCalibValue_EE_S16'   	    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(1)_S16',
	'AccYLgChl_FieldCalibValue_EE_S16'   		    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(2)_S16',
	'AccYHgMonChl_FieldCalibValue_EE_S16'   	    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(3)_S16',
#	'AccYLgPlausi_FieldCalibValue_EE_S16'   		=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(4)_S16',
	'AccZLgChl_FieldCalibValue_EE_S16'            	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(5)_S16',
	'RollRateLfChl_FieldCalibValue_EE_S16'        	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(6)_S16',
	'YawRateLfChl_FieldCalibValue_EE_S16'         	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(7)_S16',
#	'YawRateLfPlausiChl_FieldCalibValue_EE_S16'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(8)_S16',
#	'PitchRateLfChl_FieldCalibValue_EE_S16'   		=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(9)_S16',

#    FieldCalibValue
#-------------------	
	'AccXLgChl_FieldCalibValue_EE_V'   		    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(0)',
	'AccXHgMonChl_FieldCalibValue_EE_V'   	    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(1)',
	'AccYLgChl_FieldCalibValue_EE_V'   		    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(2)',
	'AccYHgMonChl_FieldCalibValue_EE_V'   	    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(3)',
#	'AccYLgPlausi_FieldCalibValue_EE_V'   		=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(4)',
	'AccZLgChl_FieldCalibValue_EE_V'            => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(5)',
	'RollRateLfChl_FieldCalibValue_EE_V'        => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(6)',
	'YawRateLfChl_FieldCalibValue_EE_V'         => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(7)',
#	'YawRateLfPlausiChl_FieldCalibValue_EE_V'   => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(8)',
#	'PitchRateLfChl_FieldCalibValue_EE_V'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(9)',

#    rb_cia_EgoVelocity_u16_U8
	'VehSpeed_U8'	=> 'rb_cia_UnfrozenVelocity_u16_U8',

1;
__END__
