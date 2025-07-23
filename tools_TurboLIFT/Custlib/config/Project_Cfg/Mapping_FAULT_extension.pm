package LIFT_PROJECT;

$Defaults->{'Mapping_FAULT_extension'} = {
    'PRIORITY1_FAULTS' => [
        'rb_pom_VerOpenLine_flt',                'rb_pom_PowerPlausiSystemAsic1_flt', 'rb_pom_InadvertentReset_flt',        'rb_pom_VerVignCoupling_flt',       'rb_pom_VerLow_flt',                  'rb_pom_VerHigh_flt',
        'rb_pom_ESRhigh_flt',                    'rb_pom_ErCapacityOutOfRange_flt',   'rb_pom_ErCapacitorMissing_flt',      'rb_pom_VerTestLevelChargeUp_flt',  'rb_pom_VerFinalLevelChargeUp_flt',   'rb_pom_OverTemperatureSystemAsic1_flt',
        'rb_pom_OverTemperatureSystemAsic2_flt', 'rb_pom_VST50VltgSystemAsic1_flt',   'rb_pom_VST50VltgSystemAsic2_flt',    'rb_pom_VltgsNokSystemAsic1_flt',   'rb_pom_VltgsNokSystemAsic2_flt',     'rb_pom_HighTemperatureAsic1_flt',
        'rb_pom_HighTemperatureAsic2_flt',       'rb_wdm_InitTestFail_flt',           'rb_wdm_DisAlpRemainsDisabled_flt',   'rb_wdm_WrongInitValWdStatus_flt',  'rb_wdm_Wd2WrongCheckword_flt',       'rb_wdm_Wd3WrongCheckword_flt',
        'rb_wdm_WDFaultMasterWD1_flt',           'rb_wdm_WDFaultMasterWD2_flt',       'rb_wdm_WDFaultMasterWD3_flt',        'rb_wdm_WDFaultSlave1_flt',         'rb_wdm_WDFltCntOverflow_flt',        'rb_csem_InitGroup1Sma660Main_flt',
        'rb_csem_InitGroup1Sma660Plausi_flt',    'rb_csem_InitGroup2Sma660Main_flt',  'rb_csem_InitGroup2Sma660Plausi_flt', 'rb_csem_InitGroup3Sma660Main_flt', 'rb_csem_InitGroup3Sma660Plausi_flt', 'rb_csem_InitGroup4Sma660Main_flt',
        'rb_csem_InitGroup4Sma660Plausi_flt',    'rb_csem_CyclRTMonSma660Main_flt',   'rb_csem_CyclRTMonSma660Plausi_flt'
    ],
    'PRIORITY2_FAULTS' => [ 'rb_sqm_SqrefTooHigh_flt', 'rb_sqm_SqrefTooLow_flt', 'rb_sqm_VHx_flt', 'rb_acc_AlgoVerifySensorId_flt', 'rb_acc_ParameterLayoutIDInvalid_flt', 'rb_acc_ParaIDConsistenceCheck_flt' ],
    'PRIORITY3_FAULTS' => [
        'rb_sqm_SquibResistanceOpenKA1FD_flt', 'rb_sqm_SquibResistanceOpenAB2FD_flt', 'rb_sqm_SquibResistanceOpenAB1FP_flt', 'rb_sqm_SquibResistanceOpenAB2FP_flt', 'rb_sqm_SquibResistanceOpenALLFD_flt',  'rb_sqm_SquibResistanceOpenALLFP_flt',
        'rb_swm_OpenLineBLFP_flt',             'rb_sqm_SquibResistanceOpenBT1FD_flt', 'rb_sqm_SquibResistanceOpenBT1FP_flt', 'rb_sqm_SquibResistanceOpenBATD_flt',  'rb_sqm_SquibResistanceOpenASC1FD_flt', 'rb_sqm_SquibResistanceOpenAB3FP_flt',
        'rb_sqm_SquibResistanceOpenBT1RD_flt', 'rb_sqm_SquibResistanceOpenBT1RP_flt', 'rb_sqm_SquibResistanceOpenBT2FD_flt', 'rb_sqm_SquibResistanceOpenBT2FP_flt', 'rb_sqm_SquibResistanceOpenIC1FP_flt',  'rb_sqm_SquibResistanceOpenIC1FD_flt',
        'rb_sqm_SquibResistanceOpenKA1FP_flt', 'rb_sqm_SquibResistanceOpenSA1RD_flt', 'rb_sqm_SquibResistanceOpenSA1FD_flt', 'rb_sqm_SquibResistanceOpenSA1FP_flt', 'rb_sqm_SquibResistanceOpenHOODD_flt',  'rb_swm_OpenLinePADS1_flt',
        'rb_sqm_SquibResistanceOpenHOODP_flt'
    ],

    #---------------------------------Optional and Additional faults for ExternalFaults---------------------------

    'rb_evm_CrashDetected_flt' => {
        'OptionalFault'    => [ 
            'rb_edr_DataAreaFull_flt',  
            'rb_co_CDTCrashDetectionOutput_flt', 
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_co_ThresholdOverFst_flt',
            'rb_co_HVCutCrashDetectionOutput_flt',
            'rb_evm_FrontCrashDetected_flt',
            'rb_evm_RearCrashDetected_flt',
            'rb_evm_SideLeftCrashDetected_flt',
            'rb_evm_SideRightCrashDetected_flt',
            'rb_evm_RolloverCrashDetected_flt',
            'rb_co_FuelCutoff_flt',
        ],
    },
	'rb_edr_DataAreaFull_flt' => {
        'AdditionalFaults' => [ 'rb_evm_CrashDetected_flt'],
        'OptionalFault'    => [ 
            'rb_co_CDTCrashDetectionOutput_flt',
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_co_ThresholdOverFst_flt',
            'rb_co_HVCutCrashDetectionOutput_flt',
            'rb_evm_FrontCrashDetected_flt',
            'rb_evm_RearCrashDetected_flt',
            'rb_evm_SideLeftCrashDetected_flt',
            'rb_evm_SideRightCrashDetected_flt',
            'rb_evm_RolloverCrashDetected_flt',
            'rb_co_FuelCutoff_flt',
        ],
    },
    'rb_evm_FrontCrashDetected_flt' => {
        'AdditionalFaults' => [ 'rb_evm_CrashDetected_flt'],
        'OptionalFault'    => [ 
            'rb_edr_DataAreaFull_flt',  
            'rb_co_CDTCrashDetectionOutput_flt', 
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_co_ThresholdOverFst_flt',
            'rb_co_HVCutCrashDetectionOutput_flt',
            'rb_co_FuelCutoff_flt',
        ],
    },
    'rb_evm_RearCrashDetected_flt' => {
        'AdditionalFaults' => ['rb_evm_CrashDetected_flt'],
        'OptionalFault'    => [ 
            'rb_csem_MonTempAccXLgChl_flt',
            'rb_co_ThresholdOverFst_flt',
            'rb_co_CDTCrashDetectionOutput_flt',
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_co_FuelCutoff_flt'
        ],
    },
    'rb_evm_SideLeftCrashDetected_flt' => {
        'AdditionalFaults' => [ 'rb_evm_CrashDetected_flt'],
        'OptionalFault'    => [ 
            'rb_edr_DataAreaFull_flt',  
            'rb_co_CDTCrashDetectionOutput_flt', 
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_co_ThresholdOverFst_flt',
            'rb_co_HVCutCrashDetectionOutput_flt',
            'rb_co_FuelCutoff_flt',
        ],
    },
    'rb_evm_SideRightCrashDetected_flt' => {
        'AdditionalFaults' => [ 'rb_evm_CrashDetected_flt'],
        'OptionalFault'    => [             
            'rb_edr_DataAreaFull_flt',  
            'rb_co_CDTCrashDetectionOutput_flt', 
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_co_ThresholdOverFst_flt',
            'rb_co_HVCutCrashDetectionOutput_flt',
            'rb_co_FuelCutoff_flt',
        ],
    },
    'rb_evm_RolloverCrashDetected_flt' => {
        'AdditionalFaults' => [ 'rb_evm_CrashDetected_flt', 'rb_edr_DataAreaFull_flt' ],
        'OptionalFault'    => [
            'rb_csem_MonTempRollRateLfChl_flt',
            'rb_co_ThresholdOverFst_flt',
            'rb_co_CDTCrashDetectionOutput_flt',
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_co_HVCutCrashDetectionOutput_flt',
            'rb_co_FuelCutoff_flt',
        ],
    },
    'rb_evm_PepCrashDetected_flt' => {
        'AdditionalFaults' => ['rb_evm_CrashDetected_flt'],
    },
    'rb_evm_PitchoverCrashDetected_flt' => {
        'AdditionalFaults' => ['rb_evm_CrashDetected_flt'],
        'OptionalFault'    => ['rb_csem_MonTempPitchRateLfChl_flt'],
    },

    'rb_co_FuelCutoff_flt' => {
        'AdditionalFaults' => [ 'rb_evm_CrashDetected_flt'],
        'OptionalFault'    => [
            'rb_edr_DataAreaFull_flt',  
            'rb_co_CDTCrashDetectionOutput_flt', 
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_co_ThresholdOverFst_flt',
            'rb_co_HVCutCrashDetectionOutput_flt',
            'rb_evm_FrontCrashDetected_flt',
            'rb_evm_RearCrashDetected_flt',
            'rb_evm_SideLeftCrashDetected_flt',
            'rb_evm_SideRightCrashDetected_flt',
            'rb_evm_RolloverCrashDetected_flt',
        ],
    },

    'rb_co_ThresholdOverFst_flt' => {
        'AdditionalFaults' => [ 'rb_evm_CrashDetected_flt'],
        'OptionalFault'    => [            
            'rb_edr_DataAreaFull_flt',  
            'rb_co_CDTCrashDetectionOutput_flt', 
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_co_FuelCutoff_flt',
            'rb_co_HVCutCrashDetectionOutput_flt',
            'rb_evm_FrontCrashDetected_flt',
            'rb_evm_RearCrashDetected_flt',
            'rb_evm_SideLeftCrashDetected_flt',
            'rb_evm_SideRightCrashDetected_flt',
            'rb_evm_RolloverCrashDetected_flt',
        ],
    },

    'rb_co_DoorUnlockAndEcallOutput_flt' => {
        'AdditionalFaults' => [ 'rb_evm_CrashDetected_flt'],
        'OptionalFault'    => [
            'rb_edr_DataAreaFull_flt',  
            'rb_co_CDTCrashDetectionOutput_flt', 
            'rb_co_ThresholdOverFst_flt',
            'rb_co_FuelCutoff_flt',
            'rb_co_HVCutCrashDetectionOutput_flt',
            'rb_evm_FrontCrashDetected_flt',
            'rb_evm_RearCrashDetected_flt',
            'rb_evm_SideLeftCrashDetected_flt',
            'rb_evm_SideRightCrashDetected_flt',
            'rb_evm_RolloverCrashDetected_flt',
        ],
    },

    'rb_co_HVCutCrashDetectionOutput_flt' => {
        'AdditionalFaults' => [ 'rb_evm_CrashDetected_flt'],
        'OptionalFault'    => [
            'rb_edr_DataAreaFull_flt',  
            'rb_co_CDTCrashDetectionOutput_flt', 
            'rb_co_ThresholdOverFst_flt',
            'rb_co_FuelCutoff_flt',
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_evm_FrontCrashDetected_flt',
            'rb_evm_RearCrashDetected_flt',
            'rb_evm_SideLeftCrashDetected_flt',
            'rb_evm_SideRightCrashDetected_flt',
            'rb_evm_RolloverCrashDetected_flt',
        ],
    },

    'rb_co_CDTCrashDetectionOutput_flt' => {
        'AdditionalFaults' => [ 'rb_evm_CrashDetected_flt'],
        'OptionalFault'    => [
            'rb_edr_DataAreaFull_flt',  
            'rb_co_HVCutCrashDetectionOutput_flt', 
            'rb_co_ThresholdOverFst_flt',
            'rb_co_FuelCutoff_flt',
            'rb_co_DoorUnlockAndEcallOutput_flt',
            'rb_evm_FrontCrashDetected_flt',
            'rb_evm_RearCrashDetected_flt',
            'rb_evm_SideLeftCrashDetected_flt',
            'rb_evm_SideRightCrashDetected_flt',
            'rb_evm_RolloverCrashDetected_flt',
        ],
    },

    'rb_psem_XCouplingUFSD_flt' => {
        'OptionalFault' => [ 'rb_psem_ExternalCommUFSD_flt', 'rb_psem_InitUFSD_flt', 'rb_psem_Short2BatUFSD_flt','rb_psem_XCouplingUFSP_flt', 'rb_psem_XCouplingUFSC_flt', 'rb_psem_InitUFSC_flt' ],
    },
    'rb_psem_XCouplingUFSP_flt' => {
        'OptionalFault' => [ 'rb_psem_ExternalCommUFSP_flt', 'rb_psem_InitUFSP_flt', 'rb_psem_Short2BatUFSP_flt', 'rb_psem_XCouplingUFSD_flt', 'rb_psem_XCouplingUFSC_flt', 'rb_psem_InitUFSC_flt' ],
    },
    'rb_psem_XCouplingUFSC_flt' => {
        'OptionalFault' => [ 'rb_psem_ExternalCommUFSC_flt', 'rb_psem_InitUFSC_flt', 'rb_psem_Short2BatUFSC_flt', ,'rb_psem_XCouplingUFSD_flt', 'rb_psem_XCouplingUFSP_flt', 'rb_psem_InitUFSP_flt', 'rb_psem_Short2BatUFSP_flt' ],
    },
    'rb_psem_XCouplingPASFD_flt' => {
        'AdditionalFaults' => [ 'rb_psem_XCouplingPPSFP_flt', ],
        'OptionalFault'    => [ 'rb_psem_ExternalCommPPSFP_flt', 'rb_psem_ExternalCommPASMP_flt', 'rb_psem_ExternalCommPASFD_flt', 'rb_psem_InitPPSFP_flt', 'rb_psem_InitPASMP_flt', 'rb_psem_InitPASFD_flt', 'rb_psem_Short2BatPPSFP_flt', 'rb_psem_Short2BatPASMP_flt', 'rb_psem_Short2BatPASFD_flt', 'rb_psem_XCouplingUFSD_flt', 'rb_psem_XCouplingUFSP_flt', 'rb_psem_XCouplingUFSC_flt', 'rb_psem_Short2BatUFSC_flt', 'rb_psem_OpenLineUFSC_flt', 'rb_psem_ExternalCommUFSC_flt', 'rb_psem_InitUFSC_flt'],
    },
    'rb_psem_XCouplingPASFP_flt' => {
        'AdditionalFaults' => [ 'rb_psem_XCouplingPPSFD_flt', ],
        'OptionalFault'    => [ 'rb_psem_ExternalCommPPSFD_flt', 'rb_psem_ExternalCommPASMD_flt', 'rb_psem_ExternalCommPASFP_flt', 'rb_psem_InitPPSFD_flt', 'rb_psem_InitPASMD_flt', 'rb_psem_InitPASFP_flt', 'rb_psem_Short2BatPPSFD_flt', 'rb_psem_Short2BatPASMD_flt', 'rb_psem_Short2BatPASFP_flt', 'rb_psem_XCouplingUFSD_flt', 'rb_psem_XCouplingUFSP_flt', 'rb_psem_XCouplingUFSC_flt', 'rb_psem_Short2BatUFSC_flt', 'rb_psem_OpenLineUFSC_flt', 'rb_psem_ExternalCommUFSC_flt', 'rb_psem_InitUFSC_flt'],
    },
    'rb_psem_XCouplingPASMD_flt' => {
        'OptionalFault'    => [ 'rb_psem_ExternalCommPPSFD_flt', 'rb_psem_ExternalCommPASMD_flt', 'rb_psem_ExternalCommPASFP_flt', 'rb_psem_InitPPSFD_flt', 'rb_psem_InitPASMD_flt', 'rb_psem_InitPASFP_flt', 'rb_psem_Short2BatPPSFD_flt', 'rb_psem_Short2BatPASMD_flt', 'rb_psem_Short2BatPASFP_flt', 'rb_psem_XCouplingUFSD_flt', 'rb_psem_XCouplingUFSP_flt', 'rb_psem_XCouplingUFSC_flt', 'rb_psem_Short2BatUFSC_flt', 'rb_psem_OpenLineUFSC_flt', 'rb_psem_ExternalCommUFSC_flt', 'rb_psem_InitUFSC_flt'],
    },
    'rb_psem_XCouplingPASMP_flt' => {
        'OptionalFault'    => [ 'rb_psem_ExternalCommPPSFP_flt', 'rb_psem_ExternalCommPASMP_flt', 'rb_psem_ExternalCommPASFD_flt', 'rb_psem_InitPPSFP_flt', 'rb_psem_InitPASMP_flt', 'rb_psem_InitPASFD_flt', 'rb_psem_Short2BatPPSFP_flt', 'rb_psem_Short2BatPASMP_flt', 'rb_psem_Short2BatPASFD_flt', 'rb_psem_XCouplingUFSD_flt', 'rb_psem_XCouplingUFSP_flt', 'rb_psem_XCouplingUFSC_flt', 'rb_psem_Short2BatUFSC_flt', 'rb_psem_OpenLineUFSC_flt', 'rb_psem_ExternalCommUFSC_flt', 'rb_psem_InitUFSC_flt'],
    },
    'rb_psem_XCouplingPPSFD_flt' => {
        'AdditionalFaults' => [ 'rb_psem_XCouplingPASFP_flt', ],
        'OptionalFault'    => [ 'rb_psem_ExternalCommPPSFD_flt', 'rb_psem_ExternalCommPASMD_flt', 'rb_psem_ExternalCommPASFP_flt', 'rb_psem_InitPPSFD_flt', 'rb_psem_InitPASMD_flt', 'rb_psem_InitPASFP_flt', 'rb_psem_Short2BatPPSFD_flt', 'rb_psem_Short2BatPASMD_flt', 'rb_psem_Short2BatPASFP_flt', 'rb_psem_XCouplingUFSD_flt', 'rb_psem_XCouplingUFSP_flt', 'rb_psem_XCouplingUFSC_flt', 'rb_psem_Short2BatUFSC_flt', 'rb_psem_OpenLineUFSC_flt', 'rb_psem_ExternalCommUFSC_flt', 'rb_psem_InitUFSC_flt'],
    },
    'rb_psem_XCouplingPPSFP_flt' => {
        'AdditionalFaults' => [ 'rb_psem_XCouplingPASFD_flt', ],
        'OptionalFault'    => [ 'rb_psem_ExternalCommPPSFP_flt', 'rb_psem_ExternalCommPASMP_flt', 'rb_psem_ExternalCommPASFD_flt', 'rb_psem_InitPPSFP_flt', 'rb_psem_InitPASMP_flt', 'rb_psem_InitPASFD_flt', 'rb_psem_Short2BatPPSFP_flt', 'rb_psem_Short2BatPASMP_flt', 'rb_psem_Short2BatPASFD_flt', 'rb_psem_XCouplingUFSD_flt', 'rb_psem_XCouplingUFSP_flt', 'rb_psem_XCouplingUFSC_flt', 'rb_psem_Short2BatUFSC_flt', 'rb_psem_OpenLineUFSC_flt', 'rb_psem_ExternalCommUFSC_flt', 'rb_psem_InitUFSC_flt'],
    },
    'rb_psem_XCouplingPCSC_flt' => {
        'OptionalFault' => [ 'rb_psem_ExternalCommPCSC_flt', 'rb_psem_InitPCSC_flt', 'rb_psem_Short2BatPCSC_flt' ],
    },
    'rb_psem_XCouplingPTSD_flt' => {
        'OptionalFault' => [ 'rb_psem_ExternalCommPTSD_flt', 'rb_psem_InitPTSD_flt', 'rb_psem_Short2BatPTSD_flt' ],
    },
    'rb_psem_XCouplingPTSP_flt' => {
        'OptionalFault' => [ 'rb_psem_ExternalCommPTSP_flt', 'rb_psem_InitPTSP_flt', 'rb_psem_Short2BatPTSP_flt' ],
    },
    'rb_psem_XCouplingPASRC_flt' => {
        'OptionalFault' => [ 'rb_psem_ExternalCommPASRC_flt', 'rb_psem_InitPASRC_flt', 'rb_psem_Short2BatPASRC_flt' ],
    },
    'rb_psem_Short2BatPASFD_flt' => {
        'AdditionalFaults' => [ 'rb_psem_Short2BatPPSFP_flt'],
    },
    'rb_psem_Short2BatPASFP_flt' => {
        'AdditionalFaults' => [ 'rb_psem_Short2BatPPSFD_flt'],
    },
    'rb_psem_Short2BatPPSFD_flt' => {
        'AdditionalFaults' => [ 'rb_psem_Short2BatPASFP_flt'],
    },
    'rb_psem_Short2BatPPSFP_flt' => {
        'AdditionalFaults' => [ 'rb_psem_Short2BatPASFD_flt'],
    },
    'rb_psem_Short2GndPASFD_flt' => {
        'AdditionalFaults' => [ 'rb_psem_Short2GndPPSFP_flt'],
    },
    'rb_psem_Short2GndPASFP_flt' => {
        'AdditionalFaults' => [ 'rb_psem_Short2GndPPSFD_flt'],
    },
    'rb_psem_Short2GndPPSFD_flt' => {
        'AdditionalFaults' => [ 'rb_psem_Short2GndPASFP_flt'],
    },
    'rb_psem_Short2GndPPSFP_flt' => {
        'AdditionalFaults' => [ 'rb_psem_Short2GndPASFD_flt'],
    },
    'rb_swma_AMUConnectorCapacitorTest_flt' => {
        'AdditionalFaults' => ['rb_psem_PsiCapacitance_flt'],
    },
    'rb_psem_PsiCapacitance_flt' => {
        'AdditionalFaults' => ['rb_swma_AMUConnectorCapacitorTest_flt'],
    },
	'rb_sqm_HighsidePowerstageDisable_flt' => {
        'AdditionalFaults' => ['rb_sqm_HighsidePowerstageIC1FP_flt', 'rb_sqm_HighsidePowerstageBT1RP_flt',	'rb_sqm_HighsidePowerstageIC1FD_flt', 'rb_sqm_HighsidePowerstageKA1FD_flt',	'rb_sqm_HighsidePowerstageSA1FD_flt', 'rb_sqm_HighsidePowerstageBT1FP_flt',	'rb_sqm_HighsidePowerstageAB1FD_flt', 'rb_sqm_HighsidePowerstageBT1RD_flt', 'rb_sqm_HighsidePowerstageFS1FD_flt', 'rb_sqm_HighsidePowerstageAB1FP_flt', 'rb_sqm_HighsidePowerstageSA1FP_flt', 'rb_sqm_HighsidePowerstageBT1FD_flt',],
    },
	'rb_sqm_LowsidePowerstageDisable_flt' => {
        'AdditionalFaults' => ['rb_sqm_LowsidePowerstageIC1FP_flt', 'rb_sqm_LowsidePowerstageBT1RP_flt',	'rb_sqm_LowsidePowerstageIC1FD_flt', 'rb_sqm_LowsidePowerstageKA1FD_flt',	'rb_sqm_LowsidePowerstageSA1FD_flt', 'rb_sqm_LowsidePowerstageBT1FP_flt',	'rb_sqm_LowsidePowerstageAB1FD_flt', 'rb_sqm_LowsidePowerstageBT1RD_flt', 'rb_sqm_LowsidePowerstageFS1FD_flt', 'rb_sqm_LowsidePowerstageAB1FP_flt', 'rb_sqm_LowsidePowerstageSA1FP_flt', 'rb_sqm_LowsidePowerstageBT1FD_flt',],
    },

    #--------------------------- SIMC-------------------------------
    'rb_simc_SignalMonCtrlMain_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA760::RD_SENSOR_DATA_CH1::Data_CH1',
        'SpiSignalError' => '0b00100101011000',
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    'rb_simc_SignalMonCtrlPlausi_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA720::RD_SENSOR_DATA_CH1::Data_CH1',
        'SpiSignalError' => '0b00010000000000',
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    #--------------------------- SIMP-------------------------------
    'rb_simp_SignalMonPesPASFP_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA_CH4_TS2::psi_data',
        'SpiSignalError' => 32,
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    'rb_simp_SignalMonPesPASFD_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA_CH3_TS2::psi_data',
        'SpiSignalError' => 32,
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    'rb_simp_SignalMonPesPASMD_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA_CH1_TS2::psi_data',
        'SpiSignalError' => 32,
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    'rb_simp_SignalMonPesPASMP_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA_CH2_TS2::psi_data',
        'SpiSignalError' => 32,
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    'rb_simp_SignalMonPesUFSD_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA_CH1_TS1::psi_data',
        'SpiSignalError' => 32,
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    'rb_simp_SignalMonPesUFSP_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA_CH2_TS1::psi_data',
        'SpiSignalError' => 32,
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    'rb_simp_SignalMonPesUFSC_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA_CH3_TS1::psi_data',
        'SpiSignalError' => 32,
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    'rb_simp_SignalMonPesPPSFD_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA_CH4_TS3::psi_data',
        'SpiSignalError' => 32,
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    'rb_simp_SignalMonPesPPSFP_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA_CH3_TS3::psi_data',
        'SpiSignalError' => 32,
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },
    'rb_simp_SignalMonPesPtsD_flt' => {
        'DeviceType'       => 'SPI',
        'Condition'        => 'SPI_Manipulation',
        'SpiSignal'        => 'CG904_S::PSI_READ_DATA_CH2_TS3::psi_data',
        'SpiSignalError'   => 100,
        'Duration_us'      => '20000',
        'FaultType'        => 'cyclic_SPI_permanent',
        'AdditionalFaults' => ['rb_simp_SignalMonPesPtsP_flt'],
    },
    'rb_simp_SignalMonPesPtsP_flt' => {
        'DeviceType'       => 'SPI',
        'Condition'        => 'SPI_Manipulation',
        'SpiSignal'        => 'CG904_S::PSI_READ_DATA_CH2_TS3::psi_data',
        'SpiSignalError'   => 100,
        'Duration_us'      => '20000',
        'FaultType'        => 'cyclic_SPI_permanent',
        'AdditionalFaults' => ['rb_simp_SignalMonPesPtsD_flt'],
    },
    'rb_simp_SignalMonPesPcsC_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA_CH3_TS2::psi_data',
        'SpiSignalError' => 32,
        'Duration_us'    => '1000000',
        'FaultType'      => 'cyclic_SPI_permanent',
    },

    #--------------------------- POM -------------------------------

    'rb_pom_PowerPlausiSystemAsic1_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_STATUS::c3',
        'SpiSignalError' => 0,
    },

    'rb_pom_PowerPlausiSystemAsic2_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::POM_STATUS::c4',
        'SpiSignalError' => 0,
    },

    'rb_pom_InadvertentReset_flt' => {
        'DeviceType'        => 'SPI',
        'Condition'         => 'SPI_Manipulation',
        'SpiSignal'         => 'CG904_M::POM_READ_AUTO_VER::ver',
        'SpiSignalError'    => 1023,
        'InadvertentResets' => 4,
        'OptionalFault'     => [ 'rb_pom_VerHigh_flt', 'rb_pom_VerOpenLine_flt' ],
    },

    'rb_pom_VerVignCoupling_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_STATUS::vet',
        'SpiSignalError' => 1,
        'FaultType'      => 'init_off',
        'Init_TimeOut'   => 60000,
    },

    'rb_pom_VerOpenLine_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_READ_AUTO_VER::ver',
        'SpiSignalError' => 0,
        'FaultType'      => 'init_NoClearNoReset',
    },

    'rb_pom_VerLow_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_READ_AUTO_VER::ver',
        'SpiSignalError' => 500,
        'FaultType'      => 'cyclic_SPI',
    },

    'rb_pom_VerHigh_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_READ_AUTO_VER::ver',
        'SpiSignalError' => 800,
        'FaultType'      => 'cyclic',
        'OptionalFault'  => ['rb_pom_VerOpenLine_flt'],
    },

#    'rb_pom_VbatLow_flt' => {
#        'DeviceType'     => 'SPI',
#        'Condition'      => 'SPI_Manipulation',
#        'SpiSignal'      => 'CG904_M::POM_READ_AUTO_VBAT_MON1::vbat_mon1',
#        'SpiSignalError' => 118,
#        'FaultType'      => 'cyclic_SPI',
#    },
#    'rb_pom_VbatHigh_flt' => {
#        'DeviceType'     => 'SPI',
#        'Condition'      => 'SPI_Manipulation',
#        'SpiSignal'      => 'CG904_M::POM_READ_AUTO_VBAT_MON1::vbat_mon1',
#        'SpiSignalError' => 450,
#        'FaultType'      => 'cyclic_SPI',
#    },

    'rb_pom_ESRhigh_flt' => {
        'DeviceType'       => 'SPI',
        'Condition'        => 'SPI_Manipulation',
        'SpiSignal'        => 'CG904_M::POM_READ_BIST::et0_et1_et2',
        'SpiSignalError'   => '0b1xxxxxx11xxxxxxx',
        'SpiSignal_1'      => 'CG904_S::POM_READ_BIST::et0_et1_et2',
        'SpiSignalError_1' => '0b1xxxxxx11xxxxxxx',
        'FaultType'        => 'init_NoClearNoReset',
    },

    'rb_pom_ErCapacityOutOfRange_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_READ_BIST::delta_ver',
        'SpiSignalError' => 5,
        'FaultType'      => 'init_NoClearNoReset',
    },
    'rb_pom_BatteryESRHigh_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_CYCL_CAP::res',    #cyclic fault
        'SpiSignalError' => 1,
        'FaultType'      => 'init',
    },

    'rb_pom_ErCapacitorMissing_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_CYCL_CAP::res',              #cyclic condition for rb_pom_ErCapacitorMissing_flt
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI_SingleQuali_DequaliNextPOC',
    },

    #	'rb_pom_ErCapacitorMissing_flt' => {
    #		'DeviceType'     => 'SPI',
    #		'Condition'      => 'SPI_Manipulation',
    #		'SpiSignal'      => 'CG904_M::POM_READ_BIST::vel',    #init condition for rb_pom_ErCapacitorMissing_flt
    #		'SpiSignalError' => 0,
    #		'FaultType'      => 'init',
    #	},

    'rb_pom_Autarky_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_STATUS::vin',    #case 2
        'SpiSignalError' => 1,
    },

    'rb_pom_VerTestLevelChargeUp_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_STATUS::vet',
        'SpiSignalError' => 0,
        'FaultType'      => 'init_off',
        'Init_TimeOut'   => '12000'                        #ms  #Test is a initial test, but has a timeout for the fault qualification.
    },

    'rb_pom_VerFinalLevelChargeUp_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_STATUS::vel',
        'SpiSignalError' => 1,
        'FaultType'      => 'init_off',
        'Init_TimeOut'   => '30000'                        #ms  #Test is a initial test, but has a timeout for the fault qualification.
    },

    'rb_pom_OverTemperatureSystemAsic1_flt' => {
        'DeviceType'                => 'SPI',
        'Condition'                 => 'SPI_Manipulation',
        'SpiSignal'                 => 'CG904_M::POM_STATUS::ot',
        'SpiSignalError'            => 1,
        'CyclicDequalificationtime' => '0-10',                      #in ms
        'FaultType'                 => 'cyclic_SPI',
    },

    'rb_pom_OverTemperatureSystemAsic2_flt' => {
        'DeviceType'                => 'SPI',
        'Condition'                 => 'SPI_Manipulation',
        'SpiSignal'                 => 'CG904_S::POM_STATUS::ot',
        'SpiSignalError'            => 1,
        'CyclicDequalificationtime' => '0-10',                      #in ms
        'FaultType'                 => 'cyclic_SPI',
    },

    'rb_pom_VST50VltgSystemAsic1_flt' => {
        'DeviceType'                => 'SPI',
        'Condition'                 => 'SPI_Manipulation',
        'SpiSignal'                 => 'CG904_M::POM_STATUS::v50',
        'SpiSignalError'            => 1,
        'CyclicDequalificationtime' => '0-10',                       #in ms
        'FaultType'                 => 'cyclic_SPI',
    },

    'rb_pom_VST50VltgSystemAsic2_flt' => {
        'DeviceType'                => 'SPI',
        'Condition'                 => 'SPI_Manipulation',
        'SpiSignal'                 => 'CG904_S::POM_STATUS::v50',
        'SpiSignalError'            => 1,
        'CyclicDequalificationtime' => '0-10',                       #in ms
        'FaultType'                 => 'cyclic_SPI',
    },

    'rb_pom_VltgsNokSystemAsic1_flt' => {
        'DeviceType'                => 'SPI',
        'Condition'                 => 'SPI_Manipulation',
        'SpiSignal'                 => 'CG904_M::POM_STATUS::nok',
        'SpiSignalError'            => 1,
        'CyclicDequalificationtime' => '0-10',                       #in ms
        'FaultType'                 => 'cyclic_SPI',
    },

    'rb_pom_VltgsNokSystemAsic2_flt' => {
        'DeviceType'                => 'SPI',
        'Condition'                 => 'SPI_Manipulation',
        'SpiSignal'                 => 'CG904_S::POM_STATUS::nok',
        'SpiSignalError'            => 1,
        'CyclicDequalificationtime' => '0-10',                       #in ms
        'FaultType'                 => 'cyclic_SPI',
    },

    'rb_pom_HighTemperatureAsic1_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_READ_AUTO_TEMPERATURE::temperature',
        'SpiSignalError' => 150,
        'FaultType'      => 'cyclic_SPI',
    },

    'rb_pom_HighTemperatureAsic2_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::POM_READ_AUTO_TEMPERATURE::temperature',
        'SpiSignalError' => 150,
        'FaultType'      => 'cyclic_SPI',
    },

    #--------------------------- WDM -------------------------------

    'rb_wdm_InitTestFail_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::WD_STATUS::o1',
        'SpiSignalError' => 0,
        'FaultType'      => 'init',

    },

    'rb_wdm_DisAlpRemainsDisabled_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::DISABLE_STATUS::ALP',
        'SpiSignalError' => 1,
        'FaultType'      => 'init',
    },

    'rb_wdm_WrongInitValWdStatus_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::WD_STATUS::cr',
        'SpiSignalError' => 1,
        'FaultType'      => 'init_NonErasableInternal',
    },

    'rb_wdm_Wd2WrongCheckword_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::WD2_TRIGGER::wd2_checkword',
        'SpiSignalError' => 8224,
        'FaultType'      => 'cyclic_SPI_SingleQuali_DequaliNextPOC',
        'OptionalFault'  => ['rb_wdm_WDFaultMasterWD2_flt', 'rb_wdm_InitTestFail_flt'],
    },

    'rb_wdm_Wd3WrongCheckword_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::WD3_TRIGGER::wd3_checkword',
        'SpiSignalError' => 8224,
        'FaultType'      => 'cyclic_SPI_SingleQuali_DequaliNextPOC',
        'OptionalFault'  => ['rb_wdm_WDFaultMasterWD3_flt', 'rb_wdm_InitTestFail_flt'],
    },

	'rb_wdm_WDFaultMasterWD1_flt' => {
		'DeviceType'     => 'SPI',
		'Condition'      => 'SPI_Manipulation',
		'SpiSignal'      => 'CG904_M::WD_STATUS::u1',
		'SpiSignalError' => 1,
		'Frame_Cycles' => 1,
		'FaultType'      => 'cyclic_SPI_permanent',
	},

    'rb_wdm_WDFaultMasterWD2_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::WD_STATUS::u2',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },

    'rb_wdm_WDFaultMasterWD3_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::WD_STATUS::r3',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },

    'rb_wdm_WDFaultSlave1_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::WD_STATUS::o1',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },

    'rb_wdm_WDFltCntOverflow_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::WD_STATUS::faultcnt',
        'SpiSignalError' => 3,
        'FaultType'      => 'init_off_SPI_permanent',
    },

    #--------------------------- SMA760-SMA720 -------------------------------

    #---------------------------------------------------------------------------------------------

    #------------------------------------------------------SWM----------------------------------------#
    'rb_swm_SdlHwSwPlausibility_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::DISABLE_STATUS::SIDS_S',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },

    #---------------------------------------------------PSEM----------------------------------------------#
    'rb_psem_InternalCommUFSD_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPASFP_flt', 'rb_psem_InternalCommPPSFD_flt', 'rb_psem_InternalCommPPSFP_flt', 'rb_psem_InternalCommUFSP_flt', 'rb_psem_InternalCommPASFD_flt', ],

    },
    'rb_psem_InternalCommUFSP_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPASFP_flt', 'rb_psem_InternalCommPPSFD_flt', 'rb_psem_InternalCommPPSFP_flt', 'rb_psem_InternalCommPASFD_flt', 'rb_psem_InternalCommUFSD_flt', ],

    },
    'rb_psem_InternalCommUFSC_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPASMP_flt', 'rb_psem_InternalCommPASMD_flt', ],

    },
    'rb_psem_InternalCommPASFD_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPASFP_flt', 'rb_psem_InternalCommPPSFD_flt', 'rb_psem_InternalCommPPSFP_flt', 'rb_psem_InternalCommUFSP_flt', 'rb_psem_InternalCommUFSD_flt', ],
    },
    'rb_psem_InternalCommPASFP_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPPSFD_flt', 'rb_psem_InternalCommPPSFP_flt', 'rb_psem_InternalCommUFSP_flt', 'rb_psem_InternalCommPASFD_flt', 'rb_psem_InternalCommUFSD_flt', ],
    },
    'rb_psem_InternalCommPASMD_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPASMP_flt', 'rb_psem_InternalCommUFSC_flt', ],
    },
    'rb_psem_InternalCommPASMP_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPASMD_flt', 'rb_psem_InternalCommUFSC_flt', ],
    },
    'rb_psem_InternalCommPPSFD_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPASFP_flt', 'rb_psem_InternalCommPPSFP_flt', 'rb_psem_InternalCommUFSP_flt', 'rb_psem_InternalCommPASFD_flt', 'rb_psem_InternalCommUFSD_flt', ],
    },
    'rb_psem_InternalCommPPSFP_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPASFP_flt', 'rb_psem_InternalCommPPSFD_flt', 'rb_psem_InternalCommUFSP_flt', 'rb_psem_InternalCommPASFD_flt', 'rb_psem_InternalCommUFSD_flt', ],
    },

    'rb_psem_InternalCommPCSC_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPTSD_flt', 'rb_psem_InternalCommPASRC_flt', 'rb_psem_InternalCommPTSP_flt', ],
    },
    'rb_psem_InternalCommPTSD_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPCSC_flt', 'rb_psem_InternalCommPASRC_flt', 'rb_psem_InternalCommPTSP_flt', ],
    },
    'rb_psem_InternalCommPTSP_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPTSD_flt', 'rb_psem_InternalCommPCSC_flt', 'rb_psem_InternalCommPASRC_flt' ],
    },
    'rb_psem_InternalCommPASRC_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::PSI_READ_DATA::S',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_DequaliNextPOC',
        'OptionalFault'  => [ 'rb_psem_InternalCommPTSD_flt', 'rb_psem_InternalCommPCSC_flt', 'rb_psem_InternalCommPTSP_flt', ],
    },

    #-------------------------------------------------------------------------------------------------#

    #------------------------------------SQM--------------------------------------------
    'rb_sqm_VHx_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::FLM_READ_VH::adc_data',
        'SpiSignalError' => 0,
        'FaultType'      => 'cyclic_SPI',
    },
    'rb_sqm_ConnectorCap_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::FLM_READ_CAP::cap_time',
        'SpiSignalError' => 255,
        'PlantMode'      => 7,
    },
    'rb_sqm_AmuShortTestGnd_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::FLM_READ_SHORT1::cn',
        'SpiSignalError' => 0,
        'OptionalFault'  => ['rb_sqm_AmuShortTestBat_flt'],
    },
    'rb_sqm_AmuShortTestBat_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::FLM_READ_SHORT2::cn',
        'SpiSignalError' => 0,
        'FaultType'      => 'init',
    },
    'rb_sqm_SqrefTooHigh_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::FLM_READ_RES::flt',
        'SpiSignalError' => 3,
        'FaultType'      => 'cyclic_SPI',
		'OptionalFault'  => [ 'rb_sqm_SquibResistanceShortFS1FD_flt'],

    },
    'rb_sqm_SqrefTooLow_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::FLM_READ_RES::flt',
        'SpiSignalError' => 2,
        'FaultType'      => 'cyclic_SPI',
		'OptionalFault'  => [ 'rb_sqm_SquibResistanceShortFS1FD_flt'],
    },
    'rb_sqm_HighsidePowerstageDisable_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::FLM_READ_PST::diag_result',
        'SpiSignalError' => 'invert',
		'OptionalFault'  => ['rb_sqm_HighsidePowerstageAB1FD_flt',
							 'rb_sqm_HighsidePowerstageAB1FP_flt',
							 'rb_sqm_HighsidePowerstageBT1FD_flt',
							 'rb_sqm_HighsidePowerstageBT1FP_flt',
							 'rb_sqm_HighsidePowerstageKA1FD_flt',
							 'rb_sqm_HighsidePowerstageSA1FD_flt',
							 'rb_sqm_HighsidePowerstageSA1FP_flt',
							 'rb_sqm_HighsidePowerstageIC1FD_flt',
							 'rb_sqm_HighsidePowerstageIC1FP_flt',
							 'rb_sqm_HighsidePowerstageBT1RD_flt',
							 'rb_sqm_HighsidePowerstageBT1RP_flt',
							 'rb_sqm_HighsidePowerstageFS1FD_flt'],
    },
    'rb_sqm_LowsidePowerstageDisable_flt' => {
        'DeviceType'         => 'SPI',
        'Condition'          => 'SPI_Manipulation',
        'SpiSignal'          => 'CG904_M::FLM_READ_PST::Signals_and_Values',
        'Signals_and_Values' => {
            'diag_result' => '15',
            'short_info'  => '0',
        },
        'Duration_us' => 'infinite',
		'OptionalFault'  => ['rb_sqm_LowsidePowerstageAB1FD_flt',
							 'rb_sqm_LowsidePowerstageAB1FP_flt',
							 'rb_sqm_LowsidePowerstageBT1FD_flt',
							 'rb_sqm_LowsidePowerstageBT1FP_flt',
							 'rb_sqm_LowsidePowerstageKA1FD_flt',
							 'rb_sqm_LowsidePowerstageSA1FD_flt',
							 'rb_sqm_LowsidePowerstageSA1FP_flt',
							 'rb_sqm_LowsidePowerstageIC1FD_flt',
							 'rb_sqm_LowsidePowerstageIC1FP_flt',
							 'rb_sqm_LowsidePowerstageBT1RD_flt',
							 'rb_sqm_LowsidePowerstageBT1RP_flt',
							 'rb_sqm_LowsidePowerstageFS1FD_flt'],
    },
	'rb_sqm_SQMBusy_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::FLM_START_DIAG_BSY1::bsy1',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },

    #---------------------------------------CSEM--------------------------------------------
    'rb_csem_InitGroup1SmaMain_flt' => {
        'Device'         => 'SMA760',
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA760::RD_CONFIG_1::CRC',
        'SpiSignalError' => 7,
        'FaultType'      => 'init_permanent',
    },

    'rb_csem_InitGroup1SmaPlausi_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA720::RD_CONFIG_1::CRC',
        'SpiSignalError' => 7,
        'FaultType'      => 'init_permanent',
    },

    'rb_csem_InitGroup2SmaMain_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA760::RD_MONITOR_II_DATA::FOC_BUSY_CH1',
        'SpiSignalError' => 1,
        'FaultType'      => 'init_permanent',
    },

    'rb_csem_InitGroup2SmaPlausi_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA720::RD_MONITOR_II_DATA::FOC_BUSY_CH1',
        'SpiSignalError' => 1,
        'FaultType'      => 'init_permanent',
    },

    'rb_csem_InitGroup3SmaMain_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA760::RD_TEST_MODE::CH1_BITE',
        'SpiSignalError' => 3,
        'FaultType'      => 'init_permanent',
    },

    'rb_csem_InitGroup3SmaPlausi_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA720::RD_TEST_MODE::CH1_BITE',
        'SpiSignalError' => 3,
        'FaultType'      => 'init_permanent',
    },

    'rb_csem_InitGroup4SmaMain_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA760::RD_BITE_CH1::Positive BITE OTP CH1',
        'SpiSignalError' => 127,
        'FaultType'      => 'init_permanent',
    },

    'rb_csem_InitGroup4SmaPlausi_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA720::RD_BITE_CH1::Positive BITE OTP CH1',
        'SpiSignalError' => 127,
        'FaultType'      => 'init_permanent',
    },

    'rb_csem_CyclRTMonSmaMain_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA760::RD_SENSOR_DATA_CH1::SID',
        'SpiSignalError' => 31,
        'FaultType'      => 'cyclic_SPI_SingleQuali',
    },

    'rb_csem_CyclRTMonSmaPlausi_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMA720::RD_CAPTURED_DATA_CH2::SID',
        'SpiSignalError' => 31,
        'FaultType'      => 'cyclic_SPI_SingleQuali',
    },
    'rb_csem_MonPermBGInertialSensor1_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::InertialSensor1::SD',
        'SpiSignalError' => 1,
        'Duration_us'    => '1500000',
        'FaultType'      => 'cyclic_SPI_permanent',
        'OptionalFault'  => [ 'rb_csem_MonPermRollRateLfChl_flt', 'rb_csem_MonPermAccXLgChl_flt', 'rb_csem_MonPermYawRateLfChl_flt', 'rb_csem_MonPermAccYHgMonChl_flt', 'rb_csem_MonPermAccZLgChl_flt', 'rb_csem_MonPermAccXHgMonChl_flt', 'rb_csem_MonPermAccYLgChl_flt', ],
    },
    'rb_csem_MonPermBGInertialSensor2_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::InertialSensor2::SD',
        'SpiSignalError' => 1,
        'Duration_us'    => '1500000',
        'FaultType'      => 'cyclic_SPI_permanent',
        'OptionalFault'  => [ 'rb_csem_MonPermPitchRateLfChl_flt', ],
    },
    'rb_csem_MonPermInitInertialSensor1_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::InertialSensor1Adr1::CRC',
        'SpiSignalError' => '0',
        'Frame_Cycles'   => '3',
        'FaultType'      => 'init_off_SPI_permanent',
    },
    'rb_csem_MonPermInitInertialSensor2_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::InertialSensor2Adr1::CRC',
        'SpiSignalError' => '0',
        'Frame_Cycles'   => '3',
        'FaultType'      => 'init_off_SPI_permanent',
    },
    'rb_csem_MonPermAccXHgMonChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::AccXHgMonChl::CS',
        'SpiSignalError' => 1,
        'Duration_us'    => '10200000',
        'FaultType'      => 'init_permanent_QualifyInCylic',
        'OptionalFault'  => [ 'rb_csem_MonTempAccXHgMonChl_flt', ],
    },
    'rb_csem_MonTempAccXHgMonChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::AccXHgMonChl::CS',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },
    'rb_csem_MonPermRollRateLfChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::RollRateLfChl::CS',
        'SpiSignalError' => 1,
        'Duration_us'    => '10200000',
        'FaultType'      => 'init_permanent_QualifyInCylic',
        'OptionalFault'  => [ 'rb_csem_MonTempRollRateLfChl_flt', ],
    },
    'rb_csem_MonTempRollRateLfChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::RollRateLfChl::CS',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },
    'rb_csem_MonPermAccZLgChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::AccZLgChl::CS',
        'SpiSignalError' => 1,
        'Duration_us'    => '10200000',
        'FaultType'      => 'init_permanent_QualifyInCylic',
        'OptionalFault'  => [ 'rb_csem_MonTempAccZLgChl_flt', ],
    },
    'rb_csem_MonTempAccZLgChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::AccZLgChl::CS',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },
    'rb_csem_MonPermAccYLgChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::AccYLgChl::CS',
        'SpiSignalError' => 1,
        'Duration_us'    => '10200000',
        'FaultType'      => 'init_permanent_QualifyInCylic',
        'OptionalFault'  => [ 'rb_csem_MonTempAccYLgChl_flt', ],
    },
    'rb_csem_MonTempAccYLgChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::AccYLgChl::CS',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },
    'rb_csem_MonPermYawRateLfChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::YawRateLfChl::CS',
        'SpiSignalError' => 1,
        'Duration_us'    => '10200000',
        'FaultType'      => 'init_permanent_QualifyInCylic',
        'OptionalFault'  => [ 'rb_csem_MonTempYawRateLfChl_flt', ],
    },
    'rb_csem_MonTempYawRateLfChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::YawRateLfChl::CS',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },
    'rb_csem_MonPermPitchRateLfChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::PitchRateLfChl::CS',
        'SpiSignalError' => 1,
        'Duration_us'    => '10200000',
        'FaultType'      => 'init_permanent_QualifyInCylic',
        'OptionalFault'  => [ 'rb_csem_MonTempPitchRateLfChl_flt', ],
    },
    'rb_csem_MonTempPitchRateLfChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::PitchRateLfChl::CS',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },
    'rb_csem_MonPermAccYHgMonChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::AccYHgMonChl::CS',
        'SpiSignalError' => 1,
        'Duration_us'    => '10200000',
        'FaultType'      => 'init_permanent_QualifyInCylic',
        'OptionalFault'  => [ 'rb_csem_MonTempAccYHgMonChl_flt', ],
    },
    'rb_csem_MonTempAccYHgMonChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::AccYHgMonChl::CS',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },
    'rb_csem_MonPermAccXLgChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::AccXLgChl::CS',
        'SpiSignalError' => 1,
        'Duration_us'    => '10200000',
        'FaultType'      => 'init_permanent_QualifyInCylic',
        'OptionalFault'  => [ 'rb_csem_MonTempAccXLgChl_flt', ],
    },
    'rb_csem_MonTempAccXLgChl_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'SMI::AccXLgChl::CS',
        'SpiSignalError' => 1,
        'FaultType'      => 'cyclic_SPI',
    },
    'rb_csem_MonPermAccYLgPlausiChl_flt' => {
        'OptionalFault' => [ 'rb_csem_MonTempAccYLgPlausiChl_flt', ],
    },
    'rb_csem_MonPermYawRateLfPlausiChl_flt' => {
        'OptionalFault' => [ 'rb_csem_MonTempYawRateLfPlausiChl_flt', ],
    },
	'rb_bsd_SysAsicAmuInitTest_flt' => {
		'AdditionalFaults' => [ 'rb_swm_ConnectorUnlockB_flt', 'rb_swm_ConnectorUnlockA_flt', 'rb_swm_ConnectorUnlockC_flt' ],
	},

    #-------------------------------------------------------------------------------
    'rb_bsd_SysAsicAmuInitTest_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::AINO_START_BIST::CRC',
        'SpiSignalError' => 'invert',
		'AdditionalFaults' => [ 'rb_swm_ConnectorUnlockB_flt', 'rb_swm_ConnectorUnlockA_flt', 'rb_swm_ConnectorUnlockC_flt' ],
    },
    'rb_bsd_SysAsicRegisterProgMon_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::PROG_SAFETY::sl',
        'SpiSignalError' => 1,
        'FaultType'      => 'init_NoClearNoReset',
    },
    'rb_svr_SVRTestFailedSVR1_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::FLM_READ_SVR::| adc_data: 0x',
        'SpiSignalError' => 0,
        'FaultType'      => 'init',
    },
    'rb_spi_SpiRcvMsgCrcWrong_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_STATUS::CRC',
        'SpiSignalError' => 3,
        'OptionalFault'  => [ 'rb_pom_VerVignCoupling_flt', 'rb_pom_VerFinalLevelChargeUp_flt' , 'rb_pom_PowerPlausiSystemAsic1_flt'],
    },
    'rb_scm_SCONPlausibility_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_S::DISABLE_STATUS::DIS_AHP',
        'SpiSignalError' => 1,
        'FaultType'      => 'init_NoClearNoReset',
    },
    'rb_scm_DisableLines_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::DISABLE_STATUS::DIS_AHP',
        'SpiSignalError' => 1,
        'FaultType'      => 'init_NoClearNoReset',
    },
    'rb_utsv_SwVersionWrong_flt' => {
        'Condition'   => 'Var_Manipulation',
        'Variable'    => 'rb_swv_SwVersionNvmCfg_dfst.CustomerId0_u8',
        'Error_value' => 2,
        'Valid_value' => '0x41',
    },
    'rb_algi_FrtIDFMisMonErr_flt' => {
        'Condition'   => 'Var_Manipulation',
        'Variable'    => 'rb_aid_FrtIDFMisMonErrFlag_u8',
        'Error_value' => 1,
        'Valid_value' => 0,
    },
    'rb_algi_FrtIDFEnvMonErr_flt' => {
        'Condition'   => 'Var_Manipulation',
        'Variable'    => 'rb_aid_FrtIDFEnvMonErrFlag_u8',
        'Error_value' => 1,
        'Valid_value' => 0,
    },
    'rb_algi_FrtIDFEnvMonEvent_flt' => {
        'Condition'   => 'Var_Manipulation',
        'Variable'    => 'rb_aid_FrtIDFEnvMonErrFlag_u8',
        'Error_value' => 1,
        'Valid_value' => 0,
    },
    'rb_sdm_CRCRAM_flt' => {
        'Condition'   => 'Var_Manipulation',
        'Variable'    => 'rb_sdm_DataSectionSelector_st.rb_sdm_DataSectionSelector_au8(1)',
        'Error_value' => 1,
    },
    'rb_syc_AsicIdMismatch_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::READ_DEV_ID::id',
        'SpiSignalError' => 0,
    },
    'rb_swma_AMUCyclicMonitoring_flt' => {
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::AINO_READ_AUTO_CH2::vd',
        'SpiSignalError' => 0,
		'OptionalFault'  => ['rb_swm_ConnectorUnlockB_flt'],
    },

    'rb_lfm_LifeTimeLamp_flt' => {    #create rb_pom_Autarky_flt condition and reset lfm_counter times
        'DeviceType'     => 'SPI',
        'Condition'      => 'SPI_Manipulation',
        'SpiSignal'      => 'CG904_M::POM_STATUS::vin',
        'SpiSignalError' => 1,
        'lfm_counter'    => 5,
        'FaultType'      => 'init_permanent',
        'OptionalFault'  => ['rb_pom_Autarky_flt'],
    },
    'rb_lfm_LifeTimeIdle_flt' => {    #create rb_sqm_HighsidePowerstageDisable_flt condition and reset lfm_counter times
        'DeviceType'       => 'SPI',
        'Condition'        => 'SPI_Manipulation',
        'SpiSignal'        => 'CG904_M::FLM_READ_PST::diag_result',
        'SpiSignalError'   => 'invert',
        'lfm_counter'      => 10,
        'FaultType'        => 'init_permanent',
        'AdditionalFaults' => ['rb_lfm_LifeTimeLamp_flt'],
        'OptionalFault'    => ['rb_sqm_HighsidePowerstageDisable_flt'],
    },
	
	'rb_psem_MuxPathTest_flt' => {
		'DeviceType'        => 'SPI',
		'Condition'         => 'SPI_Manipulation',
		'SpiSignal'         => 'CG904_M::PSI_READ_DATA::CRC',
		'SpiSignalError'   	=> 'invert',
		'FaultType'        	=> 'init_NoClearNoReset_NonErasableInternal',
        'FrameCycles' 		=> 3,
        'SpiPreconditon'    => 'Yes'
	},

};

1;
