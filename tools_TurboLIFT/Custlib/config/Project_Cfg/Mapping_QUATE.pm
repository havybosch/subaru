package LIFT_PROJECT;

###-------------------------------
my $VERSION = q$Revision: 1.3 $;
my $HEADER  = q$Header: config/Mapping_QUATE.pm 1.3 2019/10/29 19:27:22ICT Hoang Gia Nguyen (RBVH/EPS21) (HNN81HC) develop  $;
###-------------------------------

# TODO: modify the QuaTe related configuration according to the Project
# HowTo Bosch Connect: https://connect.bosch.com/wikis/home?lang=en-us#!/wiki/Wad0c302c3442_4748_8eef_7d10157fb564/page/How%20to%20emulate%20sensors%20with%20QuaTe%20-%20Preparing%20the%20config%20files

$Defaults->{'QUATE'} = {

	# Quate0
	# Internal Sensors
	# rev2_step63_v3
	# 1. SMA660 - SMA660_v3, dua chanel SID 0, 1
	# 2. SMI705
	# 3. SMI715
	#
	#	Device	Sensor		FP
	#	0		SMB200		-
	#	1		SMB470		-
	#	2		SMI720		-
	#	3		SMI700		-
	#	4		SMI700		SMI705
	#	5		SMI700		SMI715
	#	6		SMA660		SMA660
	#	7		SMA660		-
	#	8		SPIMonitor32 -

	#Master QuaTe
	'QUATE0' => {
		'FIRMWARE' => 'rev2_step82_v1.bit',

		'DEVICES' => {

			'0' => {
				'DEVICE_NAME' => 'SMA760',
				'ROM_FILE'    => 'SMA760.rom',
				'CHIP_SELECT' => '0',
				'TYPE'        => 'SMA760',
				'CHANNELS'    => {
					'0' => {
							 'CHANNEL_NAME' => 'ECU_Acc_HG_-Y',
							 'SID'          => 1,
					},
					'1' => {
							 'CHANNEL_NAME' => 'ECU_Acc_HG_-X',
							 'SID'          => 0,
					},

				},
			},

			'1' => {
				'DEVICE_NAME' => 'SMA720',
				'ROM_FILE'    => 'SMA720.rom',
				'CHIP_SELECT' => '1',
				'TYPE'        => 'SMA720',
				'CHANNELS'    => {
					'0' => {
							 'CHANNEL_NAME' => 'ECU_Acc_RHG_X',
							 'SID'          => 31,
					},
					'1' => {
							 'CHANNEL_NAME' => 'ECU_Acc_RHG_Z',
							 'SID'          => 28,
					},

					# '2' => {
					# 'CHANNEL_NAME' => 'ECU_Acc_RHG_Y',
					# 'SID'          => 255,
					# },
				},
			},

			'2' => {
					 'DEVICE_NAME' => 'SMI860',
					 'ROM_FILE'    => 'SMI860_v1.cfg',
					 'CHIP_SELECT' => '2',
					 'TYPE'        => 'SMI860',
					 'CHANNELS'    => {
									 '0' => {
											  'CHANNEL_NAME' => 'ECU_Angular_Rate_X',
											  'SID'          => 4,
									 },
									 '1' => {
											  'CHANNEL_NAME' => 'ECU_Acc_LG_-Y',
											  'SID'          => 20,
									 },
									 '2' => {
											  'CHANNEL_NAME' => 'ECU_Acc_LG_X',
											  'SID'          => 23,
									 },
									 '3' => {
											  'CHANNEL_NAME' => 'ECU_Acc_MG_-Y',
											  'SID'          => 21,
									 },
									 '5' => {
											  'CHANNEL_NAME' => 'ECU_Angular_Rate_-Z',
											  'SID'          => 22,
									 },
									 '6' => {
											  'CHANNEL_NAME' => 'ECU_Acc_LG_-Z',
											  'SID'          => 19,
									 },
									 '7' => {
											  'CHANNEL_NAME' => 'ECU_Acc_MG_X',
											  'SID'          => 24,
									 },
					 },
			},

		},

		'TRIGGER' => {

			# LINE_1 and LINE_2 can be OFF(Master QuaTe Default Value), POS_SLOPE, NEG_SLOPE,EXT_TRIGGER
			'LINE_1' => 'OFF',
			'LINE_2' => 'NEG_SLOPE',    # this must be same as LCT setting
		},
	},

	#Slave QuaTe

	'QUATE1' => {
		'FIRMWARE' => 'rev2_step60_v3.bit',

		#	Device	Sensor				FP
		#	0		PSI5DEVICE_2CH		1
		#	1		PSI5DEVICE_2CH		2
		#	2		PSI5DEVICE_2CH		3
		#	3		PSI5DEVICE_2CH		4
		#	4		PSI5DEVICE_2CH		5
		#	5		PSI5DEVICE_2CH		6
		#	6		PSI5DEVICE_1CH		7
		#	7		PSI5DEVICE_1CH		8
		#	8		PSI5DEVICE_1CH		9
		#	9		PSI5DEVICE_1CH		10
		#	10		PSI5DEVICE_1CH		11
		#	11		PSI5DEVICE_1CH		12
		#	12		PSIMonitor			-

		'DEVICES' => {
			'0' => {
				'DEVICE_NAME' => 'UFSD_UFSD',
				'ROM_FILE'    => 'PSI5Device_PAS6s_f_CM16_UFSD.rom',

				'CHANNELS' => {
								'0' => {
										 'CHANNEL_NAME' => 'UFSD_UFSD',
										 'SID'          => 16,
								},
				},
			},

			'1' => {
				'DEVICE_NAME' => 'UFSC_UFSM',
				'ROM_FILE'    => 'PSI5Device_PAS6s_f_CM16_UFSC.rom',

				'CHANNELS' => {
								'0' => {
										 'CHANNEL_NAME' => 'UFSC_UFSM',
										 'SID'          => 18,
								},
				},
			},

			'2' => {
				'DEVICE_NAME' => 'UFSP_UFSP',
				'ROM_FILE'    => 'PSI5Device_PAS6s_f_CM16_UFSP.rom',

				'CHANNELS' => {
								'0' => {
										 'CHANNEL_NAME' => 'UFSP_UFSP',
										 'SID'          => 17,
								},
				},
			},
			
			'3' => {
				'DEVICE_NAME' => 'PASFP_PASFP',
				'ROM_FILE'    => 'PSI5Device_PAS6s_f_CM16_PASFP.rom',

				'CHANNELS' => {
					'0' => {
							 'CHANNEL_NAME' => 'PASFP_PASFP',    #
							 'SID'          => 10,
					},
				},
			},

			'4' => {
				'DEVICE_NAME' => 'PASFD_PASFD',
				'ROM_FILE'    => 'PSI5Device_PAS6s_f_CM16_PASFD.rom',

				'CHANNELS' => {
					'0' => {
							 'CHANNEL_NAME' => 'PASFD_PASFD',    #
							 'SID'          => 9,
					},
				},
			},
			'5' => {
				'DEVICE_NAME' => 'PASMD_PASMD',
				'ROM_FILE'    => 'PSI5Device_PAS6s_f_CM16_PASMD.rom',
				'CHANNELS' => {
					'0' => {
							 'CHANNEL_NAME' => 'PASMD_PASMD',							 #
							 'SID'          => 11,
					},
				},
			},
			'6' => {
				'DEVICE_NAME' => 'PASMP_PASMP',
				'ROM_FILE'    => 'PSI5Device_PAS6s_f_CM16_PASMP.rom',
				'CHANNELS' => {
					'0' => {
							 'CHANNEL_NAME' => 'PASMP_PASMP',                 #
							 'SID'          => 12,
					},
				},
			},

			'7' => {
				'DEVICE_NAME' => 'PPSFP_PPSFP',
				'ROM_FILE'    => 'PSI5Device_PPS3e_CM7_PPSFP.rom',    #P/N: 0274B02592-01

				'CHANNELS' => {
					'0' => {
							 'CHANNEL_NAME' => 'PPSFP_PPSFP',         #
							 'SID'          => 6,
					},
				},
			},

			'8' => {
				'DEVICE_NAME' => 'PPSFD_PPSFD',
				'ROM_FILE'    => 'PSI5Device_PPS3e_CM7_PPSFD.rom',    #P/N: 0274B02592-01

				'CHANNELS' => {
					'0' => {
							 'CHANNEL_NAME' => 'PPSFD_PPSFD',         #
							 'SID'          => 5,
					},
				},
			},
			'12' => {
					  'DEVICE_NAME' => 'PSIMonitorQ2',
			},

		},

		'TRIGGER' => {

			# LINE_1 and LINE_2 can be OFF(Master QuaTe Default Value), POS_SLOPE, NEG_SLOPE,EXT_TRIGGER
			'LINE_1' => 'OFF',
			'LINE_2' => 'EXT_TRIGGER',
		},
	},
};

1;
