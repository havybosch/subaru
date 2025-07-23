#### The SPI mapping is used by LIFT_spi_access
#### This file can be edited manually!

package LIFT_PROJECT;

use File::Basename;
use Cwd 'abs_path';
my $PRJCFG_path = abs_path( dirname(__FILE__) );

$Defaults->{'Mapping_SPI'} = {

	'CG904_M' => {
				   'DecodingFile'     => $PRJCFG_path . '\..\Common_Cfg\Tools\SPI_decoder_files\system_ASIC\CG90x_Cobra.spi',
				   'CS_Pin'           => '0',
				   'DeviceType'       => 'CG90x_Cobra',
				   'Frame_Length_Bit' => '32',
				   'CLK_Mode'         => 'true',
				   'Offset'           => '0',
				   'CS_Polarity'      => 'true',
				   'CS_Enabled'       => 'true',
				   'MSB_LSB'          => 'MSB',
				   'SPI'              => '1',
				   'Asic_Id'          => '0',
	},

	'CG904_S' => {
				   'DecodingFile'     => $PRJCFG_path . '\..\Common_Cfg\Tools\SPI_decoder_files\system_ASIC\CG90x_Cobra.spi',
				   'CS_Pin'           => '1',
				   'DeviceType'       => 'CG90x_Cobra',
				   'Frame_Length_Bit' => '32',
				   'CLK_Mode'         => 'true',
				   'Offset'           => '0',
				   'CS_Polarity'      => 'true',
				   'CS_Enabled'       => 'true',
				   'MSB_LSB'          => 'MSB',
				   'SPI'              => '1',
				   'Asic_Id'          => '1',
	},

	'SMA760' => {
				  'DecodingFile'     => $PRJCFG_path . '\..\Common_Cfg\Tools\SPI_decoder_files\sensors_SMA\SMA7xx.spi',
				  'CS_Pin'           => '2',
				  'DeviceType'       => 'SMA760',
				  'Frame_Length_Bit' => '32',
				  'CLK_Mode'         => 'true',
				  'Offset'           => '0',
				  'CS_Polarity'      => 'true',
				  'CS_Enabled'       => 'true',
				  'MSB_LSB'          => 'MSB',
				  'SPI'              => '1',
	},

	'SMA720' => {
				  'DecodingFile'     => $PRJCFG_path . '\..\Common_Cfg\Tools\SPI_decoder_files\sensors_SMA\SMA7xx.spi',
				  'CS_Pin'           => '4',
				  'DeviceType'       => 'SMA720',
				  'Frame_Length_Bit' => '32',
				  'CLK_Mode'         => 'true',
				  'Offset'           => '0',
				  'CS_Polarity'      => 'true',
				  'CS_Enabled'       => 'true',
				  'MSB_LSB'          => 'MSB',
				  'SPI'              => '1',
	},

	'SMI' => {
			   'DecodingFile'     => $PRJCFG_path . '\..\Common_Cfg\Tools\SPI_decoder_files\sensors_SMI\SMI860_6D.spi',
			   'CS_Pin'           => '3',
			   'DeviceType'       => 'SMI860_6D',
			   'Frame_Length_Bit' => '32',
			   'CLK_Mode'         => 'true',
			   'Offset'           => '0',
			   'CS_Polarity'      => 'true',
			   'CS_Enabled'       => 'true',
			   'MSB_LSB'          => 'MSB',
			   'SPI'              => '1',
	},

};

$Defaults->{'SPILC_FunctionMapping'} = {

	#  CMD  ->
	#  SIG  ->
	#  VAL  ->
	#  MOSI -> 1 (MOSI flag , to be set when signal is MOSI signal)
	#  MISO -> 1 (MISO flag , default 1)
	#
	squibs => {
		ls_short2gnd => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'flt', 'VAL' => 8 }, },
		
		hs_short2gnd => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'flt', 'VAL' => 10 }, },
		
		ls_short2bat => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'flt', 'VAL' => 9 }, },

		hs_short2bat => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'flt', 'VAL' => 11 }, },

		sqref_too_low => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'flt', 'VAL' => 2 }, },

		sqref_too_high => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'flt', 'VAL' => 3 }, },

		hs_volt_too_high => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'flt', 'VAL' => 4 }, },

		ls_volt_too_high => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'flt', 'VAL' => 5 }, },

		res_value_too_high => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'flt', 'VAL' => 6 }, },

		volt_ls_gt_hs => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'flt',       'VAL' => 7 }, },
		
		res_value_raw => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'res_value', 'VAL' => '<resistor_value_raw>' }, },

		validity_flag => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'vd', 'VAL' => '<Validity_flag>' }, },

		fire_cnt_high_level => { 1 => { 'CMD' => 'FLM_READ_FIRE_CNT_CH<ASIC_CHANNEL>', 'SIG' => 'fire_counter_hl', 'VAL' => '<FIRE_COUNTER_HL_VAL>' }, },

		fire_cnt_low_level => { 1 => { 'CMD' => 'FLM_READ_FIRE_CNT_CH<ASIC_CHANNEL>', 'SIG' => 'fire_counter_ll', 'VAL' => '<FIRE_COUNTER_LL_VAL>' }, },

		openline => { 1 => { 'CMD' => 'FLM_READ_RES_CH<ASIC_CHANNEL>', 'SIG' => 'openline', 'VAL' => 18432 }, },
	},

	pases => {
		ls_short2gnd => { 1 => { 'CMD' => 'PSI_READ_SC', 'SIG' => 'sg<ASIC_CHANNEL>', 'VAL' => 1 }, },
		
		hs_short2gnd => { 1 => { 'CMD' => 'PSI_READ_SC', 'SIG' => 'sg<ASIC_CHANNEL>', 'VAL' => 1 }, },
		
		ls_short2bat => { 1 => { 'CMD' => 'PSI_READ_SC', 'SIG' => 'sb<ASIC_CHANNEL>', 'VAL' => 1 }, },
		
		hs_short2bat => { 1 => { 'CMD' => 'PSI_READ_SC', 'SIG' => 'sb<ASIC_CHANNEL>', 'VAL' => 1 }, },
		
		vzl_flag     => { 1 => { 'CMD' => 'PSI_READ_SC', 'SIG' => 'vzl',              'VAL' => '<VZL_FLAG_VAL>' } },

		vas      => { 1 => { 'CMD' => 'PSI_READ_DATA<ASIC_CHANNEL_TS>', 'SIG' => 'vas',      'VAL' => '<vzl_flag>' } },
		
		psi_data => { 1 => { 'CMD' => 'PSI_READ_DATA<ASIC_CHANNEL_TS>', 'SIG' => 'psi_data', 'VAL' => '<psi_data>' } },
		
		openline => { 1 => { 'CMD' => 'PSI_READ_DATA<ASIC_CHANNEL_TS>', 'SIG' => 'psi_data', 'VAL' => 496 } },

		timeslots => {
					   UFSD  => 1,
					   UFSP  => 1,
					   PASFD => 2,
					   PASFP => 2,
					   PASMD => 2,
					   PASMP => 2,
					   PPSFD => 3,
					   PPSFP => 3
		},

	},

	switches => {
		hs_short2gnd => { 1 => { 'CMD' => 'AINO_READ_AUTO_CH<ASIC_CHANNEL>', 'SIG' => 'adc_data', 'resistive' => 0, 'hall' => 1023, }, },
		
		ls_short2gnd => { 1 => { 'CMD' => 'AINO_READ_AUTO_CH<ASIC_CHANNEL>', 'SIG' => 'adc_data', 'resistive' => 0, 'hall' => 1023, }, },
		
		ls_short2bat => { 1 => { 'CMD' => 'AINO_READ_AUTO_CH<ASIC_CHANNEL>', 'SIG' => 's2b',      'VAL' => 1 }, },
		
		hs_short2bat => { 1 => { 'CMD' => 'AINO_READ_AUTO_CH<ASIC_CHANNEL>', 'SIG' => 's2b',      'VAL' => 1 }, },
		
		openline     => { 1 => { 'CMD' => 'AINO_READ_AUTO_CH<ASIC_CHANNEL>', 'SIG' => 'adc_data', 'resistive' => 0, 'hall' => 1023, }, },
		
		adc_data     => { 1 => { 'CMD' => 'AINO_READ_AUTO_CH<ASIC_CHANNEL>', 'SIG' => 'adc_data', 'VAL' => '0' }, },

	},
};
1;