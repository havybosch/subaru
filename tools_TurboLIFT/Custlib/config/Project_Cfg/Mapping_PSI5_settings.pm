package LIFT_PROJECT;

##########################################################
$VERSION = q$Revision: 1.0 $;
$HEADER  = q$Header: config/Mapping_PSI5_J30S_TSG4.pm 1.0 2022/27/16 17:17:32IST External Ly Binh Tan (BanVien, MS/CC-EPS42) (LYT4HC) develop  $;
##########################################################

our @ISA = qw(Exporter);

our @EXPORT = qw(
  $Defaults
);

#      _     ___ _   _ _____ ____
#     | |   |_ _| \ | | ____/ ___|
#     | |    | ||  \| |  _| \___ \
#     | |___ | || |\  | |___ ___) |
#     |_____|___|_| \_|_____|____/
#
$Defaults->{'PSI5_LINES'} = {

	# INDEX / KEY => PSI5 LINE NUMBER
	# 1: UFSD - UFS6s - 125kB
	1 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 2: UFSP - UFS6s - 125kB
	2 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 3: PASFD - PAS6s - 125kB
	3 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 4: PPSFP - PPS3e - 125kB
	4 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 5: PASFP - PAS6s - 125kB
	5 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 6: PPSFD - PPS3e - 125kB
	6 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 7: PCS3P - PAS6s - 125kB
	7 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 8: PCS1P - PAS6s - 125kB
	8 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 9: PCS2D - PAS6s - 125kB
	9 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 10: PCS2P - PAS6s - 125kB
	10 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 11: PCS1D - PAS6s - 125kB
	11 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

	# 12: PCS3D - PAS6s - 125kB
	12 => { 'USE_DEFAULTS' => 'PSI5_LINES_DEFAULTS', },

};

#      ____  _____ _   _ ____   ___  ____  ____    ____  ____   ___      _ _____ ____ _____
#     / ___|| ____| \ | / ___| / _ \|  _ \/ ___|  |  _ \|  _ \ / _ \    | | ____/ ___|_   _|
#     \___ \|  _| |  \| \___ \| | | | |_) \___ \  | |_) | |_) | | | |_  | |  _|| |     | |
#      ___) | |___| |\  |___) | |_| |  _ < ___) | |  __/|  _ <| |_| | |_| | |__| |___  | |
#     |____/|_____|_| \_|____/ \___/|_| \_\____/  |_|   |_| \_\\___/ \___/|_____\____| |_|
#
$Defaults->{'PSI5_SENSORS_PROJECT'} = {
	'UFSD' => {
		'LINE'           => 1,
		'SENSOR_MODULE'  => 1,
		'SENSOR_Channle' => 0,
		'TYPE'           => 'UFS6f',

		'INIT1_DATA' => { 'INIT1_MESSAGE' => 'NO_MESSAGES' },

		#         'INIT2_DATA1-14'           => '0x42042114A270C5',    #  Byte 1 .. 7   ( data  1 .. 14 )
		#         'INIT2_MANUFACTURING_DATE' => '0x3789',              #  Byte 8 + 9    ( data 15 .. 18 )
		#         'INIT2_LOT_LINE_NUMBERr'   => '0x00',                #  Byte 10
		#         'INIT2_SERIES_NUMBER'      => '0x9876543210AB',      #  Byte 11 .. 16
		'INIT2_DATA' => {
			PROTOCOL_REVISION            => 6,                                       # Data 1
			NUMBER_OF_DATA_BLOCKS        => 32,                                      # Data 2 and 3
			MANUFACTURER                 => 'BOSCH_ASCII',                           # Data 4 and 5
			                                                                         # MANUFACTURER           => 'BOSCH',                    # Data 4 and 5
			PAS6sf_GENERATION_BIT        => 'PAS6f',                                 # Data 6
			SENSOR_TYPE                  => 'ACCELERATION_SENSOR',                   # Data 7
			ACCELERATION_AXIS_AND_FILTER => 'AXIS_GAMMA_FILTER_426Hz',               # Data 8
			ACCELERATION_RANGE           => '480g_RANGE',                            # Data 9
			                                                                         # SENSOR_CODE            => 'PAS6f_430Hz_6us_SAMPLE_TIME',    # Data 10
			                                                                         # SAMPLE_TIME_AND_FILTER => 'PAS6s_49US_SAMPLETIME_FILTER_213Hz', # Data 10 + SYC ?
			SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_426Hz',    # Data 10 + SYC ?
			HOUSING_CODE                 => '0x21',                                  # Data 10 and Data 11
			SENSOR_CODE_CUSTOMER         => '0x0',                                   # Data 12, 13, 14
			SGB_MANUFACTURING_DATE       => '14-02-2017',                            # Data 15, 16, 17, 18
			LOT_NUMBER                   => '0x0',                                   # Data 19
			LINE_NUMBER                  => '0x0',                                   # Data 20
			SERIES_NUMBER                => '0x98765432111A',                        # Data 21 .. 32

		},
		'INIT3_DATA' => { 'INIT3_MESSAGE' => 'SENSOR_OK', },

		'CYCLIC_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 10,
		},

		'USER_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 4,
		},

		'TIMESLOT' => 'Timeslot_ts1_us',

	},
	'UFSP' => {
		'LINE'           => 2,
		'SENSOR_MODULE'  => 2,
		'SENSOR_Channle' => 1,
		'TYPE'           => 'UFS6f',

		'INIT1_DATA' => { 'INIT1_MESSAGE' => 'NO_MESSAGES' },

		#         'INIT2_DATA1-14'           => '0x42042114A270C5',    #  Byte 1 .. 7   ( data  1 .. 14 )
		#         'INIT2_MANUFACTURING_DATE' => '0x3789',              #  Byte 8 + 9    ( data 15 .. 18 )
		#         'INIT2_LOT_LINE_NUMBERr'   => '0x00',                #  Byte 10
		#         'INIT2_SERIES_NUMBER'      => '0x9876543210AB',      #  Byte 11 .. 16
		'INIT2_DATA' => {
			PROTOCOL_REVISION            => 6,                                       # Data 1
			NUMBER_OF_DATA_BLOCKS        => 32,                                      # Data 2 and 3
			MANUFACTURER                 => 'BOSCH_ASCII',                           # Data 4 and 5
			                                                                         # MANUFACTURER           => 'BOSCH',                    # Data 4 and 5
			PAS6sf_GENERATION_BIT        => 'PAS6f',                                 # Data 6
			SENSOR_TYPE                  => 'ACCELERATION_SENSOR',                   # Data 7
			ACCELERATION_AXIS_AND_FILTER => 'AXIS_GAMMA_FILTER_426Hz',               # Data 8
			ACCELERATION_RANGE           => '480g_RANGE',                            # Data 9
			                                                                         # SENSOR_CODE            => 'PAS6f_430Hz_6us_SAMPLE_TIME',    # Data 10
			                                                                         # SAMPLE_TIME_AND_FILTER => 'PAS6s_49US_SAMPLETIME_FILTER_213Hz', # Data 10 + SYC ?
			SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_426Hz',    # Data 10 + SYC ?
			HOUSING_CODE                 => '0x21',                                  # Data 10 and Data 11
			SENSOR_CODE_CUSTOMER         => '0x0',                                   # Data 12, 13, 14
			SGB_MANUFACTURING_DATE       => '14-02-2017',                            # Data 15, 16, 17, 18
			LOT_NUMBER                   => '0x0',                                   # Data 19
			LINE_NUMBER                  => '0x0',                                   # Data 20
			SERIES_NUMBER                => '0x98765432222A',                        # Data 21 .. 32

		},
		'INIT3_DATA' => { 'INIT3_MESSAGE' => 'SENSOR_OK', },

		'CYCLIC_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 10,
		},

		'USER_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 4,
		},

		'TIMESLOT' => 'Timeslot_ts1_us',

	},
	'UFSC' => {
		'LINE'           => 4,
		'SENSOR_MODULE'  => 2,
		'SENSOR_Channle' => 2,
		'TYPE'           => 'UFS6f',

		'INIT1_DATA' => { 'INIT1_MESSAGE' => 'NO_MESSAGES' },

		#         'INIT2_DATA1-14'           => '0x42042114A270C5',    #  Byte 1 .. 7   ( data  1 .. 14 )
		#         'INIT2_MANUFACTURING_DATE' => '0x3789',              #  Byte 8 + 9    ( data 15 .. 18 )
		#         'INIT2_LOT_LINE_NUMBERr'   => '0x00',                #  Byte 10
		#         'INIT2_SERIES_NUMBER'      => '0x9876543210AB',      #  Byte 11 .. 16
		'INIT2_DATA' => {
			PROTOCOL_REVISION            => 6,                                       # Data 1
			NUMBER_OF_DATA_BLOCKS        => 32,                                      # Data 2 and 3
			MANUFACTURER                 => 'BOSCH_ASCII',                           # Data 4 and 5
			                                                                         # MANUFACTURER           => 'BOSCH',                    # Data 4 and 5
			PAS6sf_GENERATION_BIT        => 'PAS6f',                                 # Data 6
			SENSOR_TYPE                  => 'ACCELERATION_SENSOR',                   # Data 7
			ACCELERATION_AXIS_AND_FILTER => 'AXIS_GAMMA_FILTER_426Hz',               # Data 8
			ACCELERATION_RANGE           => '480g_RANGE',                            # Data 9
			                                                                         # SENSOR_CODE            => 'PAS6f_430Hz_6us_SAMPLE_TIME',    # Data 10
			                                                                         # SAMPLE_TIME_AND_FILTER => 'PAS6s_49US_SAMPLETIME_FILTER_213Hz', # Data 10 + SYC ?
			SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_426Hz',    # Data 10 + SYC ?
			HOUSING_CODE                 => '0x21',                                  # Data 10 and Data 11
			SENSOR_CODE_CUSTOMER         => '0x0',                                   # Data 12, 13, 14
			SGB_MANUFACTURING_DATE       => '14-02-2017',                            # Data 15, 16, 17, 18
			LOT_NUMBER                   => '0x0',                                   # Data 19
			LINE_NUMBER                  => '0x0',                                   # Data 20
			SERIES_NUMBER                => '0x98765432333A',                        # Data 21 .. 32

		},
		'INIT3_DATA' => { 'INIT3_MESSAGE' => 'SENSOR_OK', },

		'CYCLIC_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 10,
		},

		'USER_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 4,
		},

		'TIMESLOT' => 'Timeslot_ts1_us',

	},	
	'PASFD' => {
		'LINE'           => 5,
		'SENSOR_MODULE'  => 5,
		'SENSOR_Channle' => 3,
		'TYPE'           => 'PAS6s',
		'INIT1_DATA'     => { 'INIT1_MESSAGE' => 'NO_MESSAGES' },

		#         'INIT1_DATA' => {},

		#         'INIT2_DATA1-14'           => '0x42042114800000',    #  old: 420420148341CA',    #  Byte 1 .. 7   ( data  1 .. 14 )
		#         'INIT2_MANUFACTURING_DATE' => '0x3789',              #  Byte 8 + 9    ( data 15 .. 18 )
		#         'INIT2_LOT_LINE_NUMBER'    => '0x00',                #  Byte 10
		#         'INIT2_SERIES_NUMBER'      => '0x9876543210AB',      #  Byte 11 .. 16
		'INIT2_DATA' => {
			PROTOCOL_REVISION            => 6,                                       # Data 1
			NUMBER_OF_DATA_BLOCKS        => 32,                                      # Data 2 and 3
			MANUFACTURER                 => 'BOSCH_ASCII',                           # Data 4 and 5
			PAS6sf_GENERATION_BIT        => 'PAS6s',                                 # Data 6
			SENSOR_TYPE                  => 'ACCELERATION_SENSOR',                   # Data 7
			ACCELERATION_AXIS_AND_FILTER => 'AXIS_ALPHA_FILTER_426Hz',               # Data 8
			                                                                         # ACCELERATION_AXIS_AND_FILTER => 'AXIS_ALPHA_FILTER_213Hz',               # Data 8
			ACCELERATION_RANGE           => '240g_RANGE',                            # Data 9
			                                                                         # SENSOR_CODE            => 'PAS6f_430Hz_6us_SAMPLE_TIME',    # Data 10
			SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_426Hz',    # Data 10 + SYC
			                                                                         # SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_213Hz',    # Data 10 + SYC
			HOUSING_CODE                 => '0x25',                                  # Data 10 and Data 11
			SENSOR_CODE_CUSTOMER         => '0x0',                                   # Data 12, 13, 14
			SGB_MANUFACTURING_DATE       => '14-02-2017',                            # Data 15, 16, 17, 18
			LOT_NUMBER                   => '0x0',                                   # Data 19
			LINE_NUMBER                  => '0x0',                                   # Data 20
			SERIES_NUMBER                => '0x98765432444A',                        # Data 21 .. 32

		},
		'INIT3_DATA' => { 'INIT3_MESSAGE' => 'SENSOR_OK', },

		'CYCLIC_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 10,
		},

		'USER_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 4,
		},

		'TIMESLOT' => 'Timeslot_ts2_us',
	},
	
	'PASFP' => {
		'LINE'           => 6,
		'SENSOR_MODULE'  => 6,
		'SENSOR_Channle' => 4,
		'TYPE'           => 'PAS6s',
		'INIT1_DATA'     => { 'INIT1_MESSAGE' => 'NO_MESSAGES' },

		#         'INIT1_DATA' => {},

		#         'INIT2_DATA1-14'           => '0x42042114800000',    #  old: 420420148341CA',    #  Byte 1 .. 7   ( data  1 .. 14 )
		#         'INIT2_MANUFACTURING_DATE' => '0x3789',              #  Byte 8 + 9    ( data 15 .. 18 )
		#         'INIT2_LOT_LINE_NUMBER'    => '0x00',                #  Byte 10
		#         'INIT2_SERIES_NUMBER'      => '0x9876543210AB',      #  Byte 11 .. 16
		'INIT2_DATA' => {
			PROTOCOL_REVISION            => 6,                                       # Data 1
			NUMBER_OF_DATA_BLOCKS        => 32,                                      # Data 2 and 3
			MANUFACTURER                 => 'BOSCH_ASCII',                           # Data 4 and 5
			PAS6sf_GENERATION_BIT        => 'PAS6s',                                 # Data 6
			SENSOR_TYPE                  => 'ACCELERATION_SENSOR',                   # Data 7
			ACCELERATION_AXIS_AND_FILTER => 'AXIS_ALPHA_FILTER_426Hz',               # Data 8
			                                                                         # ACCELERATION_AXIS_AND_FILTER => 'AXIS_ALPHA_FILTER_213Hz',               # Data 8
			ACCELERATION_RANGE           => '240g_RANGE',                            # Data 9
			                                                                         # SENSOR_CODE            => 'PAS6f_430Hz_6us_SAMPLE_TIME',    # Data 10
			SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_426Hz',    # Data 10 + SYC
			                                                                         # SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_213Hz',    # Data 10 + SYC
			HOUSING_CODE                 => '0x25',                                  # Data 10 and Data 11
			SENSOR_CODE_CUSTOMER         => '0x0',                                   # Data 12, 13, 14
			SGB_MANUFACTURING_DATE       => '14-02-2017',                            # Data 15, 16, 17, 18
			LOT_NUMBER                   => '0x0',                                   # Data 19
			LINE_NUMBER                  => '0x0',                                   # Data 20
			SERIES_NUMBER                => '0x98765432555A',                        # Data 21 .. 32

		},
		'INIT3_DATA' => { 'INIT3_MESSAGE' => 'SENSOR_OK', },

		'CYCLIC_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 10,
		},

		'USER_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 4,
		},

		'TIMESLOT' => 'Timeslot_ts2_us',
	},
	'PASMD' => {
		'LINE'           => 7,
		'SENSOR_MODULE'  => 7,
		'SENSOR_Channle' => 5,
		'TYPE'           => 'PAS6s',
		'INIT1_DATA'     => { 'INIT1_MESSAGE' => 'NO_MESSAGES' },

		#         'INIT1_DATA' => {},

		#         'INIT2_DATA1-14'           => '0x42042114800000',    #  old: 420420148341CA',    #  Byte 1 .. 7   ( data  1 .. 14 )
		#         'INIT2_MANUFACTURING_DATE' => '0x3789',              #  Byte 8 + 9    ( data 15 .. 18 )
		#         'INIT2_LOT_LINE_NUMBER'    => '0x00',                #  Byte 10
		#         'INIT2_SERIES_NUMBER'      => '0x9876543210AB',      #  Byte 11 .. 16
		'INIT2_DATA' => {
			PROTOCOL_REVISION            => 6,                                       # Data 1
			NUMBER_OF_DATA_BLOCKS        => 32,                                      # Data 2 and 3
			MANUFACTURER                 => 'BOSCH_ASCII',                           # Data 4 and 5
			PAS6sf_GENERATION_BIT        => 'PAS6s',                                 # Data 6
			SENSOR_TYPE                  => 'ACCELERATION_SENSOR',                   # Data 7
			ACCELERATION_AXIS_AND_FILTER => 'AXIS_ALPHA_FILTER_426Hz',               # Data 8
			                                                                         # ACCELERATION_AXIS_AND_FILTER => 'AXIS_ALPHA_FILTER_213Hz',               # Data 8
			ACCELERATION_RANGE           => '240g_RANGE',                            # Data 9
			                                                                         # SENSOR_CODE            => 'PAS6f_430Hz_6us_SAMPLE_TIME',    # Data 10
			SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_426Hz',    # Data 10 + SYC
			                                                                         # SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_213Hz',    # Data 10 + SYC
			HOUSING_CODE                 => '0x25',                                  # Data 10 and Data 11
			SENSOR_CODE_CUSTOMER         => '0x0',                                   # Data 12, 13, 14
			SGB_MANUFACTURING_DATE       => '14-02-2017',                            # Data 15, 16, 17, 18
			LOT_NUMBER                   => '0x0',                                   # Data 19
			LINE_NUMBER                  => '0x0',                                   # Data 20
			SERIES_NUMBER                => '0x98765432666A',                        # Data 21 .. 32

		},
		'INIT3_DATA' => { 'INIT3_MESSAGE' => 'SENSOR_OK', },

		'CYCLIC_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 10,
		},

		'USER_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 4,
		},

		'TIMESLOT' => 'Timeslot_ts2_us',
	},
	'PASMP' => {
		'LINE'           => 8,
		'SENSOR_MODULE'  => 8,
		'SENSOR_Channle' => 6,
		'TYPE'           => 'PAS6s',
		'INIT1_DATA'     => { 'INIT1_MESSAGE' => 'NO_MESSAGES' },

		#         'INIT1_DATA' => {},

		#         'INIT2_DATA1-14'           => '0x42042114800000',    #  old: 420420148341CA',    #  Byte 1 .. 7   ( data  1 .. 14 )
		#         'INIT2_MANUFACTURING_DATE' => '0x3789',              #  Byte 8 + 9    ( data 15 .. 18 )
		#         'INIT2_LOT_LINE_NUMBER'    => '0x00',                #  Byte 10
		#         'INIT2_SERIES_NUMBER'      => '0x9876543210AB',      #  Byte 11 .. 16
		'INIT2_DATA' => {
			PROTOCOL_REVISION            => 6,                                       # Data 1
			NUMBER_OF_DATA_BLOCKS        => 32,                                      # Data 2 and 3
			MANUFACTURER                 => 'BOSCH_ASCII',                           # Data 4 and 5
			PAS6sf_GENERATION_BIT        => 'PAS6s',                                 # Data 6
			SENSOR_TYPE                  => 'ACCELERATION_SENSOR',                   # Data 7
			ACCELERATION_AXIS_AND_FILTER => 'AXIS_ALPHA_FILTER_426Hz',               # Data 8
			                                                                         # ACCELERATION_AXIS_AND_FILTER => 'AXIS_ALPHA_FILTER_213Hz',               # Data 8
			ACCELERATION_RANGE           => '240g_RANGE',                            # Data 9
			                                                                         # SENSOR_CODE            => 'PAS6f_430Hz_6us_SAMPLE_TIME',    # Data 10
			SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_426Hz',    # Data 10 + SYC
			                                                                         # SAMPLE_TIME_AND_FILTER       => 'PAS6s_49US_SAMPLETIME_FILTER_213Hz',    # Data 10 + SYC
			HOUSING_CODE                 => '0x25',                                  # Data 10 and Data 11
			SENSOR_CODE_CUSTOMER         => '0x0',                                   # Data 12, 13, 14
			SGB_MANUFACTURING_DATE       => '14-02-2017',                            # Data 15, 16, 17, 18
			LOT_NUMBER                   => '0x0',                                   # Data 19
			LINE_NUMBER                  => '0x0',                                   # Data 20
			SERIES_NUMBER                => '0x98765432777A',                        # Data 21 .. 32

		},
		'INIT3_DATA' => { 'INIT3_MESSAGE' => 'SENSOR_OK', },

		'CYCLIC_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 10,
		},

		'USER_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 4,
		},

		'TIMESLOT' => 'Timeslot_ts2_us',
	},		
	'PPSFD' => {
		'LINE'           => 9,
		'SENSOR_MODULE'  =>	9,
		'SENSOR_Channle' => 7,
		'TYPE'           => 'PPS3e',
		'INIT1_DATA'     => { 'INIT1_MESSAGE' => 'NO_MESSAGES' },

		#         'INIT1_DATA' => {},

		#         'INIT2_DATA1-14'           => '0x4204288CB00000',    #  Byte 1 .. 7   ( data  1 .. 14 )
		#         'INIT2_MANUFACTURING_DATE' => '0x3789',              #  Byte 8 + 9    ( data 15 .. 18 )
		#         'INIT2_LOT_LINE_NUMBER'    => '0x00',                #  Byte 10
		#         'INIT2_SERIES_NUMBER'      => '0x9876543210AB',      #  Byte 11 .. 16
		'INIT2_DATA' => {
			PROTOCOL_REVISION             => 6,                                # Data 1
			NUMBER_OF_DATA_BLOCKS         => 32,                               # Data 2 and 3
			MANUFACTURER                  => 'BOSCH_ASCII',                    # Data 4 and 5
			FILTER_TYPE_AND_SAMPLING_MODE => 'FIR_FAST',                       # Data 6
			PRESSURE_SENSOR_TYPE          => 'PN_SENSOR',                      # Data 7
			                                                                   # SENSOR_MODE                   => 'PRESSURE_-15%_to_+23.4%',        # Data 8     Double check
			SENSOR_MODE                   => 'PRESSURE_-5%_to_+15%',           # Data 8     Double check
			PSI5_MODE                     => 'P10P_500_3L_PN_SLOT3_PARITY',    # Data 9
			BOSCH_SENSOR_CODE             => '0x20',                           # Data 10 and 11
			SENSOR_CODE_CUSTOMER          => '0x000',                          # Data 12, 13, 14
			SGB_MANUFACTURING_DATE        => '12-03-2025',                     # Data 15, 16, 17, 18
			LINE_NUMBER                   => '0x8',                            # Data 19
			LOT_NUMBER                    => '0x9',                            # Data 20
			SERIES_NUMBER                 => '0x98765432888A',                 # Data 21 .. 32
		},
		'INIT3_DATA' => {
			'INIT3_MESSAGE'           => 'SENSOR_OK',
			'ABSOLUTE_PRESSURE_VALUE' => 10,
		},

		'CYCLIC_MESSAGES' => {
			'ALL'                     => '0x000',
			'NUMBER_OF_USED_BYTES'    => 10,
			'ABSOLUTE_PRESSURE_VALUE' => 10,
		},

		'USER_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 10,
		},

		'TIMESLOT' => 'Timeslot_ts3_us',
	},

	'PPSFP' => {
		'LINE'           => 10,
		'SENSOR_MODULE'  => 10,
		'SENSOR_Channle' => 8,
		'TYPE'           => 'PPS3e',
		'INIT1_DATA'     => { 'INIT1_MESSAGE' => 'NO_MESSAGES' },

		#         'INIT1_DATA' => {},

		#         'INIT2_DATA1-14'           => '0x4204288CB00000',    #  Byte 1 .. 7   ( data  1 .. 14 )
		#         'INIT2_MANUFACTURING_DATE' => '0x3789',              #  Byte 8 + 9    ( data 15 .. 18 )
		#         'INIT2_LOT_LINE_NUMBER'    => '0x00',                #  Byte 10
		#         'INIT2_SERIES_NUMBER'      => '0x9876543210AB',      #  Byte 11 .. 16
		'INIT2_DATA' => {
			PROTOCOL_REVISION             => 6,                                # Data 1
			NUMBER_OF_DATA_BLOCKS         => 32,                               # Data 2 and 3
			MANUFACTURER                  => 'BOSCH_ASCII',                    # Data 4 and 5
			FILTER_TYPE_AND_SAMPLING_MODE => 'FIR_FAST',                       # Data 6
			PRESSURE_SENSOR_TYPE          => 'PN_SENSOR',                      # Data 7
			                                                                   # SENSOR_MODE                   => 'PRESSURE_-15%_to_+23.4%',        # Data 8     Double check
			SENSOR_MODE                   => 'PRESSURE_-5%_to_+15%',           # Data 8     Double check
			PSI5_MODE                     => 'P10P_500_3L_PN_SLOT3_PARITY',    # Data 9
			BOSCH_SENSOR_CODE             => '0x20',                           # Data 10 and 11
			SENSOR_CODE_CUSTOMER          => '0x000',                          # Data 12, 13, 14
			SGB_MANUFACTURING_DATE        => '12-03-2025',                     # Data 15, 16, 17, 18
			LINE_NUMBER                   => '0x8',                            # Data 19
			LOT_NUMBER                    => '0x9',                            # Data 20
			SERIES_NUMBER                 => '0x98765432999A',                 # Data 21 .. 32
		},
		'INIT3_DATA' => {
			'INIT3_MESSAGE'           => 'SENSOR_OK',
			'ABSOLUTE_PRESSURE_VALUE' => 10,
		},

		'CYCLIC_MESSAGES' => {
			'ALL'                     => '0x000',
			'NUMBER_OF_USED_BYTES'    => 10,
			'ABSOLUTE_PRESSURE_VALUE' => 10,
		},

		'USER_MESSAGES' => {
			'ALL'                  => '0x000',
			'NUMBER_OF_USED_BYTES' => 10,
		},

		'TIMESLOT' => 'Timeslot_ts3_us',
	},

};

#      ____  _____ _   _ ____   ___  ____  ____    _______   ______  _____ ____
#     / ___|| ____| \ | / ___| / _ \|  _ \/ ___|  |_   _\ \ / /  _ \| ____/ ___|
#     \___ \|  _| |  \| \___ \| | | | |_) \___ \    | |  \ V /| |_) |  _| \___ \
#      ___) | |___| |\  |___) | |_| |  _ < ___) |   | |   | | |  __/| |___ ___) |
#     |____/|_____|_| \_|____/ \___/|_| \_\____/    |_|   |_| |_|   |_____|____/
#
$Defaults->{'PSI5_SENSORS_TYPES'} = {

	# UFS6e with 125kB
	'UFS6f' => {
		'QUIESCENT_CURR_MA' => 4,
		'TRANSMIT_CURR_MA'  => 26,
		'INIT1_TIME_MS'     => 60.5,
		'INIT2_TIME_MS'     => 128,
		'INIT3_TIME_MS'     => 8,
	},

	# PAS6e with 125kB
	'PAS6s' => {
		'QUIESCENT_CURR_MA' => 4,
		'TRANSMIT_CURR_MA'  => 26,
		'INIT1_TIME_MS'     => 60.5,
		'INIT2_TIME_MS'     => 128,
		'INIT3_TIME_MS'     => 8,
	},

	# PPS3e with 189kB
	'PPS3e' => {
		'QUIESCENT_CURR_MA' => 4,
		'TRANSMIT_CURR_MA'  => 26,
		'INIT1_TIME_MS'     => 60.5,
		'INIT2_TIME_MS'     => 128,
		'INIT3_TIME_MS'     => 8,
	},

};

#      _     ___ _   _ _____ ____    ____  _____ _____ _   _   _ _   _____ ____
#     | |   |_ _| \ | | ____/ ___|  |  _ \| ____|  ___/ \ | | | | | |_   _/ ___|
#     | |    | ||  \| |  _| \___ \  | | | |  _| | |_ / _ \| | | | |   | | \___ \
#     | |___ | || |\  | |___ ___) | | |_| | |___|  _/ ___ \ |_| | |___| |  ___) |
#     |_____|___|_| \_|_____|____/  |____/|_____|_|/_/   \_\___/|_____|_| |____/
#
$Defaults->{'PSI5_LINES_DEFAULTS'} = {
	'Auto_restart_time_us' => 507,
	'Auto_restart_int'     => 0,
	'Parity_bit_ts1_int'   => 1,
	'Parity_bit_ts2_int'   => 1,
	'Parity_bit_ts3_int'   => 1,
	'Parity_bit_ts4_int'   => 1,
	'Reboot_counter_int'   => 1,
	'Timeslot_ts1_us'      => 48,
	'Timeslot_ts2_us'      => 192,
	'Timeslot_ts3_us'      => 348,
	'baudrate_kbps'        => 125,
};

