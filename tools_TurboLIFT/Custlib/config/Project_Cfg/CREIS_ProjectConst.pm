## This file is generated using CREIS Configuration Generator Tool - Revision: 1.38  ##
## This file is generated from *.mdb: C:/MKS/TOOLS/CREIS_Framework/SRTR_setup_high.mdb ##

package LIFT_PROJECT;

use File::Basename;
use File::Copy;
use Cwd 'abs_path';
my $PRJCFG_path = abs_path( dirname(__FILE__) );
if ( $LIFT_config::EDR_variant_name =~ /Mainstream/ or $LIFT_config::EDR_variant_name =~ /J30S_25CY/ ) {
	if ( $LIFT_config::configuration =~ /3UFS_LHD/ ) {

		# System is 3UFS_LHD
		$Defaults->{'MDSRESULT'} = {
			"RESULTS" => {

				# System configuration is 3UFS LHD with OCS configuration.
				"DEFAULT" => {                                                                              # Non-Rollover A0
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A0.mdb'
				},
				"EDR" => {                                                                                  # Non-Rollover A0
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A0.mdb'
				},
				"EDR_NonRoll_A0" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A0.mdb'
				},
				"EDR_NonRoll_A1" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A1.mdb'
				},
				"EDR_Roll_A2" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A2.mdb'
				},
				"EDR_Roll_A3" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A3.mdb'
				},
				"EDR_Roll_A4" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A4.mdb'
				},
				"EDR_SDP_A5" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A5.mdb'
				},
				"EDR_SDP_A6" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A6.mdb'
				},
			}
		};
		$Defaults->{'CRASH_SIMULATION'} = {
			"ENVIRONMENT" => {},
			"STIMULATION" => {
				"CRASH_SENSORS" => {
					"ECU: Acc_HG: -X: SMA760_axay_128g_426Hz_x64"                       => "SMA760::ECU_Acc_HG_-X",
					"ECU: Acc_HG: -Y: SMA760_axay_128g_426Hz_x64"                       => "SMA760::ECU_Acc_HG_-Y",
					"ECU: Acc_LG: -Z: SMI810_860_az_bottomLayer_6g_66Hz_x64"            => "SMI860::ECU_Acc_LG_-Z",
					"ECU: Acc_LG: X: SMI800_810_860_axay_6g_75Hz_x64"                   => "SMI860::ECU_Acc_LG_X",
					"ECU: Acc_LG: -Y: SMI800_810_860_axay_6g_75Hz_x64"                  => "SMI860::ECU_Acc_LG_-Y",
					"ECU: Acc_MG: X: SMI800_810_860_axay_35g_260Hz_x64"                 => "SMI860::ECU_Acc_MG_X",
					"ECU: Acc_MG: -Y: SMI800_810_860_axay_35g_260Hz_x64"                => "SMI860::ECU_Acc_MG_-Y",
					"ECU: Acc_RHG: X: SMA720_ax_128g_426Hz_x64"                         => "SMA720::ECU_Acc_RHG_X",
					"ECU: Acc_RHG: Z: SMA720_az_32g_53Hz_x64"                           => "SMA720::ECU_Acc_RHG_Z",
					"ECU: Angular_Rate: X: SMI860_SMI810_SMG810_wxwy_300grads_75Hz_x64" => "SMI860::ECU_Angular_Rate_X",
					"ECU: Angular_Rate: -Z: SMI860_wz_300grads_75Hz_x64"                => "SMI860::ECU_Angular_Rate_-Z",
					"PASFD: PASFD: -Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"           => "PASFD_PASFD",
					"PASFP: PASFP: Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"            => "PASFP_PASFP",
					"PASMD: PASMD: -Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"           => "PASMD_PASMD",
					"PASMP: PASMP: Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"            => "PASMP_PASMP",
					"PPSFD: PPSFD: 0: PPS3e_PTS1e_SMP470_sync_pn_Range1_460Hz_x64"      => "PPSFD_PPSFD",
					"PPSFP: PPSFP: 0: PPS3e_PTS1e_SMP470_sync_pn_Range1_460Hz_x64"      => "PPSFP_PPSFP",
					"UFSC: UFSM: -X: UFS6s_SMA783_sync_axaz_az_480g_426Hz_x64"          => "UFSC_UFSM",
					"UFSD: UFSD: -X: UFS6s_SMA783_sync_axaz_az_480g_426Hz_x64"          => "UFSD_UFSD",
					"UFSP: UFSP: -X: UFS6s_SMA783_sync_axaz_az_480g_426Hz_x64"          => "UFSP_UFSP"
				},
				"NETWORK_DYNAMIC" => {}
			}
		};
	}
	elsif ( $LIFT_config::configuration =~ /1UFS_LHD/ ) {

		# Crash file haven't requested yet.
	}
	elsif ( $LIFT_config::configuration =~ /RHD/ ) {
		$Defaults->{'MDSRESULT'} = {
			"RESULTS" => {
				"DEFAULT" => {    # Non-Rollover A0
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A0_RHD.mdb'
				},
				"EDR" => {        # Non-Rollover A0
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A0_RHD.mdb'
				},
				"EDR_NonRoll_A0" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A0_RHD.mdb'
				},
				"EDR_NonRoll_A1" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A1_RHD.mdb'
				},
				"EDR_Roll_A2" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A2_RHD.mdb'
				},
				"EDR_Roll_A3" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A3_RHD.mdb'
				},
				"EDR_Roll_A4" => {
					"MDSTYPE" => "MDSNG64",
					"PATH"    => $PRJCFG_path . '\Crashfile\Crashfile_SRTR_EDR_MS_A4_RHD.mdb'
				},
			}
		};
		$Defaults->{'CRASH_SIMULATION'} = {
			"ENVIRONMENT" => {},
			"STIMULATION" => {
				"CRASH_SENSORS" => {
					"ECU: Acc_HG: -X: SMA760_axay_128g_426Hz_x64"                       => "SMA760::ECU_Acc_HG_-X",
					"ECU: Acc_HG: -Y: SMA760_axay_128g_426Hz_x64"                       => "SMA760::ECU_Acc_HG_-Y",
					"ECU: Acc_LG: -Z: SMI810_860_az_bottomLayer_6g_66Hz_x64"            => "SMI860::ECU_Acc_LG_-Z",
					"ECU: Acc_LG: X: SMI800_810_860_axay_6g_75Hz_x64"                   => "SMI860::ECU_Acc_LG_X",
					"ECU: Acc_LG: -Y: SMI800_810_860_axay_6g_75Hz_x64"                  => "SMI860::ECU_Acc_LG_-Y",
					"ECU: Acc_MG: X: SMI800_810_860_axay_35g_260Hz_x64"                 => "SMI860::ECU_Acc_MG_X",
					"ECU: Acc_MG: -Y: SMI800_810_860_axay_35g_260Hz_x64"                => "SMI860::ECU_Acc_MG_-Y",
					"ECU: Acc_RHG: X: SMA720_ax_128g_426Hz_x64"                         => "SMA720::ECU_Acc_RHG_X",
					"ECU: Acc_RHG: Z: SMA720_az_32g_53Hz_x64"                           => "SMA720::ECU_Acc_RHG_Z",
					"ECU: Angular_Rate: X: SMI860_SMI810_SMG810_wxwy_300grads_75Hz_x64" => "SMI860::ECU_Angular_Rate_X",
					"ECU: Angular_Rate: -Z: SMI860_wz_300grads_75Hz_x64"                => "SMI860::ECU_Angular_Rate_-Z",
					"PASFD: PASFD: Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"            => "PASFD_PASFD",
					"PASFP: PASFP: -Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"           => "PASFP_PASFP",
					"PASMD: PASMD: Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"            => "PASMD_PASMD",
					"PASMP: PASMP: -Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"           => "PASMP_PASMP",
					"PPSFD: PPSFD: 0: PPS3e_PTS1e_SMP470_sync_pn_Range1_460Hz_x64"      => "PPSFD_PPSFD",
					"PPSFP: PPSFP: 0: PPS3e_PTS1e_SMP470_sync_pn_Range1_460Hz_x64"      => "PPSFP_PPSFP",
					"UFSC: UFSM: -X: UFS6s_SMA783_sync_axaz_az_480g_426Hz_x64"          => "UFSC_UFSM",
					"UFSD: UFSD: -X: UFS6s_SMA783_sync_axaz_az_480g_426Hz_x64"          => "UFSD_UFSD",
					"UFSP: UFSP: -X: UFS6s_SMA783_sync_axaz_az_480g_426Hz_x64"          => "UFSP_UFSP"
				},
				"NETWORK_DYNAMIC" => {}
			}
		};
	}
}
elsif ( $LIFT_config::EDR_variant_name =~ /J34X_25CY/ ) {

	# System is 2UFS_LHD for SYC of J34X_25CY
	$Defaults->{'MDSRESULT'} = {
		"RESULTS" => {
			"DEFAULT" => {    # Non-Rollover A0
				"MDSTYPE" => "MDSNG64",
				"PATH"    => $PRJCFG_path . '\Crashfile\CrashFile-J34HX_FA3SA3ReA3RoA3_1R_SRTR-d231025.mdb'
			},
			"EDR" => {        # Non-Rollover A0
				"MDSTYPE" => "MDSNG64",
				"PATH"    => $PRJCFG_path . '\Crashfile\CrashFile-J34HX_FA3SA3ReA3RoA3_1R_SRTR-d231025.mdb'
			},
			"EDR_Roll_A4" => {
				"MDSTYPE" => "MDSNG64",
				"PATH"    => $PRJCFG_path . '\Crashfile\CrashFile-J34HX_FA4SA4ReA4RoA4_1R_SRTR-d231025.mdb'
			},
		}
	};
	$Defaults->{'CRASH_SIMULATION'} = {
		"ENVIRONMENT" => {},
		"STIMULATION" => {
			"CRASH_SENSORS" => {
				"ECU: Acc_HG: X: SMA760_axay_128g_426Hz_x64"                         => "SMA760::ECU_Acc_HG_-X",
				"ECU: Acc_HG: Y: SMA760_axay_128g_426Hz_x64"                         => "SMA760::ECU_Acc_HG_-Y",
				"ECU: Acc_LG: -Z: SMI810_860_az_bottomLayer_6g_66Hz_x64"             => "SMI860::ECU_Acc_LG_-Z",
				"ECU: Acc_LG: -X: SMI800_810_860_axay_6g_75Hz_x64"                   => "SMI860::ECU_Acc_LG_X",
				"ECU: Acc_LG: Y: SMI800_810_860_axay_6g_75Hz_x64"                    => "SMI860::ECU_Acc_LG_-Y",
				"ECU: Acc_MG: -X: SMI800_810_860_axay_35g_260Hz_x64"                 => "SMI860::ECU_Acc_MG_X",
				"ECU: Acc_MG: Y: SMI800_810_860_axay_35g_260Hz_x64"                  => "SMI860::ECU_Acc_MG_-Y",
				"ECU: Acc_RHG: -X: SMA720_ax_128g_426Hz_x64"                         => "SMA720::ECU_Acc_RHG_X",
				"ECU: Acc_RHG: Z: SMA720_az_32g_53Hz_x64"                            => "SMA720::ECU_Acc_RHG_Z",
				"ECU: Angular_Rate: -X: SMI860_SMI810_SMG810_wxwy_300grads_75Hz_x64" => "SMI860::ECU_Angular_Rate_X",
				"ECU: Angular_Rate: -Z: SMI860_wz_300grads_75Hz_x64"                 => "SMI860::ECU_Angular_Rate_-Z",
				"PASFD: PASFD: -Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"            => "PASFD_PASFD",
				"PASFP: PASFP: Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"             => "PASFP_PASFP",
				"PASMD: PASMD: -Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"            => "PASMD_PASMD",
				"PASMP: PASMP: Y: PAS6s_SMA782_sync_axay_240g_426Hz_x64"             => "PASMP_PASMP",
				"PPSFD: PPSFD: 0: PPS3e_PTS1e_SMP470_sync_pn_Range1_460Hz_x64"       => "PPSFD_PPSFD",
				"PPSFP: PPSFP: 0: PPS3e_PTS1e_SMP470_sync_pn_Range1_460Hz_x64"       => "PPSFP_PPSFP",
				"UFSC: UFSM: -X: UFS6s_SMA783_sync_axaz_az_480g_426Hz_x64"           => "UFSC_UFSM",
				"UFSD: UFSD: X: UFS6s_SMA783_sync_axaz_az_480g_426Hz_x64"            => "UFSD_UFSD",
				"UFSP: UFSP: -X: UFS6s_SMA783_sync_axaz_az_480g_426Hz_x64"           => "UFSP_UFSP"
			},
			"NETWORK_DYNAMIC" => {}
		}
	};
}

$Defaults->{'CRASH_MEASUREMENT_AND_EVALUATION'} = {
	"AdditionalMeasurements" => {},
	"AdditionalPdLabels"     => {
		"Configurations" => {
			"PomAdcData" => {
				"Temperature_ASIC1" => {
					"Factor"  => "0.1",
					"Mode"    => "dec",
					"PdLabel" => "rb_pomv_PomAdcData_st.AdcValuesConverted_ast(0).Temperature_s32",
					"Unit"    => "C"
				},
				"Temperature_ASIC2" => {
					"Factor"  => "0.1",
					"Mode"    => "dec",
					"PdLabel" => "rb_pomv_PomAdcData_st.AdcValuesConverted_ast(1).Temperature_s32",
					"Unit"    => "C"
				},
				"VBat1" => {
					"Factor"  => "0.01",
					"Mode"    => "dec",
					"PdLabel" => "rb_pomv_PomAdcData_st.AdcValuesConverted_ast(0).Vbat1_u16",
					"Unit"    => "V"
				},
				"Ver" => {
					"Factor"  => "0.01",
					"Mode"    => "dec",
					"PdLabel" => "rb_pomv_PomAdcData_st.AdcValuesConverted_ast(0).Ver_u16",
					"Unit"    => "V"
				},
				"Vup" => {
					"Factor"  => "0.01",
					"Mode"    => "dec",
					"PdLabel" => "rb_pomv_PomAdcData_st.AdcValuesConverted_ast(0).Vup_u16",
					"Unit"    => "V"
				}
			}
		}
	},
	"FastDiagTrace" => {
		"Configurations" => {
			"AlgoActive" => {
				"rb_fcl_StatusFirCtrl_u8" => "U8"
			}
		},
		"NbrOfCanIDs" => 4
	},
	"Faults" => {
		"AdditionalAfterCrash" => {
			"CrashDependent" => {},
			"Generic"        => {
				"CsemMonTempFaults_Clipping" => {
					"EventDebugData" => "0b0000000100000000",
					"FaultName"      => "rb_csem_MonTemp.*_flt"
				},
				"EventManagerFault" => {
					"FaultName" => "rb_evm_.*CrashDetected_flt"
				}
			}
		},
		"BeforeCrash" => {
			"EnvironmentDependent" => {
				"rb_swm_OpenLineBLFD_flt"    => "#Switch_BLFD_Configured|1 == 1 and #Switch_BLFD_State == 3",
				"rb_swm_OpenLineBLFP_flt"    => "#Switch_BLFP_Configured|1 == 1 and #Switch_BLFP_State == 3",
				"rb_swm_OpenLineBLRC_flt"    => "#Switch_BLRC_Configured|1 == 1 and #Switch_BLRC_State == 3",
				"rb_swm_OpenLineBLRD_flt"    => "#Switch_BLRD_Configured|1 == 1 and #Switch_BLRD_State == 3",
				"rb_swm_OpenLineBLRP_flt"    => "#Switch_BLRP_Configured|1 == 1 and #Switch_BLRP_State == 3",
				"rb_swm_OpenLineOPSFP_flt"   => "#Switch_OPSFP_Configured|1 == 1 and #Switch_OPSFP_State == 3",
				"rb_swm_OpenLinePADS1_flt"   => "#Switch_PADS_Configured|1 == 1 and #Switch_PADS_State == 3",
				"rb_swm_OpenLineSPSFD_flt"   => "#Switch_SPSFD_Configured|1 == 1 and #Switch_SPSFD_State == 3",
				"rb_swm_UndefinedBLFD_flt"   => "#Switch_BLFD_State == 2",
				"rb_swm_UndefinedBLFP_flt"   => "#Switch_BLFP_State == 2",
				"rb_swm_UndefinedBLRC_flt"   => "#Switch_BLRC_State == 2",
				"rb_swm_UndefinedBLRD_flt"   => "#Switch_BLRD_State == 2",
				"rb_swm_UndefinedBLRP_flt"   => "#Switch_BLRP_State == 2",
				"rb_swm_UndefinedOPSFP_flt"  => "#Switch_OPSFP_State == 2",
				"rb_swm_UndefinedPADS1_flt"  => "#Switch_PADS_State == 2",
				"rb_swm_UndefinedSPSFD_flt"  => "#Switch_SPSFD_State == 2",
				"rb_swm_UnexpectedBLFD_flt"  => "#Switch_BLFD_Configured|1 == 0 and not #Switch_BLFD_State == 3",
				"rb_swm_UnexpectedBLFP_flt"  => "#Switch_BLFP_Configured|1 == 0 and not #Switch_BLFP_State == 3",
				"rb_swm_UnexpectedBLRC_flt"  => "#Switch_BLRC_Configured|1 == 0 and not #Switch_BLRC_State == 3",
				"rb_swm_UnexpectedBLRD_flt"  => "#Switch_BLRD_Configured|1 == 0 and not #Switch_BLRD_State == 3",
				"rb_swm_UnexpectedBLRP_flt"  => "#Switch_BLRP_Configured|1 == 0 and not #Switch_BLRP_State == 3",
				"rb_swm_UnexpectedOPSFP_flt" => "#Switch_OPSFP_Configured|1 == 0 and not #Switch_OPSFP_State == 3",
				"rb_swm_UnexpectedPADS1_flt" => "#Switch_PADS_Configured|1 == 0 and not #Switch_PADS_State == 3",
				"rb_swm_UnexpectedSPSFD_flt" => "#Switch_SPSFD_Configured|1 == 0 and not #Switch_SPSFD_State == 3"
			},
			"Generic" => []
		}
	},
	"General_Settings" => {
		"DisposalTime_ms"                   => 300,
		"EDRnumberOfEvents"                 => "SAD",
		"EDRnumberOfEventsPEP"              => "SAD",
		"FiringCurrentThresholdTolerance_A" => "0.2",
		"FiringCurrentThreshold_A"          => "SYC",
		"SamplingFrequency_Hz"              => 20000
	},
	"SimDevices" => {}
};

1;
