package LIFT_Testbenches;

use File::Basename;
use Cwd 'abs_path';
my $PRJCFG_path = abs_path( dirname(__FILE__) );
$PRJCFG_path = "$PRJCFG_path/../Project_Cfg";
$canoe_cfg = $LIFT_config::CANoe;
our ($setup,$hostname);
our $Testbench;
$hostname = $LIFT_config::LIFT_host;
if ($hostname =~ /HC-C-0041M/i){
$setup = 'Peribox PBOX3';
$Testbench = {
	'HC-C-0041M' => {    # LIFT PC host name
	
        ### ----------- Device Configuration Section -----------
        'Devices' => {
           'LabCar' => {
                'Hostname'          => 'HC-C-00638',
                'Test_Bench_Number' => 42,                # only for logging purpose
                'Description'       => "Lab PC SVT01",    # only for logging purpose
                'CANchannel'        => 1,
                'CANHWSerialNo'     => $CANNo          # written on CAN device e.g. "007129-049277" -> 49277
            },
            'PD' => {
                'AB12' => 1,
            },
            'CD' =>    # channel count only CAN channels like TSG4 (but physically connected to the same channel as PD)
              {
                'CANchannel'    => 1,
                'CANHWSerialNo' => $CANNo, #538552,		#28677
              },
            'PDLayer' => {    # example values given here
                'BusType'             => 'CAN',    # bus type, possible values are 'CAN', 'FlexRay', 'CANFD'
                'Channel_Nbr_0-based' => 0,          # Vector hardware channel number (0-based)
                'Hw_Serial_Nbr'       => $CANNo,			# Vector hardware serial number
            },

            'CANoe' => {
                'Hostname' => 'HC-C-00638',                                                                                    # if not local host name, CANoe will be started on remote PC !
                'Log_File' => $PRJCFG_path.'\CANoe_Conf\Log\CANoe.asc',

				#Online evaluation configurations
				'Online_Config'            => $PRJCFG_path.'\\CANoe_Conf\\'.$canoe_cfg,    # This CAN config is used for DEM testing only
				'OldEnableDisableHandling' => 'Yes',
				# 'ILUsed'                   => 'Yes',
            },
			'Renesas_Flash_Tool' => {
				'Project_Workspace' => [$PRJCFG_path.'\Renesas_Flashing\auto_erase\auto_erase.rpj', 
										$PRJCFG_path.'\Renesas_Flashing\auto_program\auto_program.rpj'],
				'FlashTool_exe_path' => 'C:\Program Files (x86)\Renesas Electronics\Programming Tools\Renesas Flash Programmer V3.08\RFPV3.exe',
			},
        },    ## end of ~~~ Device Configuration Section ~~~
        ### ----------- Function Configuration Section -----------
        'Functions' => {

            'Labcar' => {
                'line' => 'PeriBox_NoPower',    # possible devices: TSG4, MLC, PeriBox
                'power_Ubat' => 'PRITT',
            },
            ### --- Function Area : Peripherie, select device where ECU is connected to (TSG4, PeriBox or LabCar)
            'PERIPHERIE' => {
                'device' => 'PeriBox',
            },

            ### --- Function Area : CAN_Access
            'CAN_Access' => {
                'basic'     => 'CANoe',    # function groups: read, write, trace, simulation
                'stimulate' => 'CANoe',
				'read' =>   'CANoe' ,
				'write' => 'CANoe' ,
				'trace' => 'CANoe' ,
            }, 

            'ProdDiag' => {
                'generation' => 'AB12',               # Airbag generation, possible values: currently 'AB12' only
                'basic'      => 'PDLayer',            # Device for function group 'basic' (all functions):
                                                      # device currently only 'PDLayer'
            },
			'Crash_simulation' => {
				'crash_database'  => 'MDSRESULT',     # possible devices: MDSRESULT
				'network_dynamic' => 'can_access',    # possible devices: can_access
			},
            'CD' => 'CAN',

        },    ## end of ~~~ Function Configuration Section ~~~
    },
}
}
elsif ($hostname =~ /hc-c-00897/i){
$setup = 'Manitoo - PBOX2';
$Testbench = {
	'HC-C-00897' => {    # LIFT PC host name
        ### ----------- Device Configuration Section -----------
        'Devices' => {
            'Manitoo' => {
				'Connection_Type'    => 'COM8',
				'FET_HW_Type'        => 'FET_3_Ports',    # FET_3_Ports , FET_6_Ports, FET_15_Ports
				'FET_PortsSelection' => 1,
			},
            'PD' => {
                'AB12' => 1,
            },
            'CD' =>    # channel count only CAN channels like TSG4 (but physically connected to the same channel as PD)
              {
                'CANchannel'    => 1,
                'CANHWSerialNo' => $CANNo,
              },
            'PDLayer' => {    # example values given here
                'BusType'             => 'CAN',    # bus type, possible values are 'CAN', 'FlexRay', 'CANFD'
                'Channel_Nbr_0-based' => 0,          # Vector hardware channel number (0-based)
                'Hw_Serial_Nbr'       => $CANNo,     # Vector hardware serial number
            },

            'CANoe' => {
                'Hostname' => 'HC-C-00897',                                                                                    # if not local host name, CANoe will be started on remote PC !
                'Log_File' => $PRJCFG_path.'\CANoe_Conf\Log\CANoe.asc',
				'Online_Config'            => $PRJCFG_path.'\\CANoe_Conf\\'.$canoe_cfg,    # This CAN config is used for DEM testing only
				'OldEnableDisableHandling' => 'Yes',
            },
			'Renesas_Flash_Tool' => {
				'Project_Workspace' => [$PRJCFG_path.'\Renesas_Flashing\auto_erase\auto_erase.rpj', 
										$PRJCFG_path.'\Renesas_Flashing\auto_program\auto_program.rpj'],
				'FlashTool_exe_path' => 'C:\Program Files (x86)\Renesas Electronics\Programming Tools\Renesas Flash Programmer V3.08\RFPV3.exe',
			},
        },    ## end of ~~~ Device Configuration Section ~~~
        ### ----------- Function Configuration Section -----------
        'Functions' => {

            'Labcar' => {
                'line' => 'SPILC',    # possible devices: TSG4, MLC, PeriBox, SPILC
                'power_Ubat' => 'PRITT', #possible devices : Manitoo, PRITT, TSG4 , None
            },
            ### --- Function Area : CAN_Access
            'CAN_Access' => {
                'basic'     => 'CANoe',    # function groups: read, write, trace, simulation
                'stimulate' => 'CANoe',
				'read' =>   'CANoe' ,
				'write' => 'CANoe' ,
				'trace' => 'CANoe' ,
            }, 

            'ProdDiag' => {
                'generation' => 'AB12',               # Airbag generation, possible values: currently 'AB12' only
                'basic'      => 'PDLayer',            # Device for function group 'basic' (all functions):
                                                      # device currently only 'PDLayer'
            },
            'SPI_Access' => {
				'trace'      => 'Manitoo',    # function groups: trace, manipulate
				'manipulate' => 'Manitoo',    #Manitoo
			},
            'CD' => 'CAN',


        },    ## end of ~~~ Function Configuration Section ~~~
    },
}
}
elsif ($hostname =~ /HC-C-006KV/i){
$setup = 'Manitoo - PBOX1';
$Testbench = {
	'HC-C-006KV' => {    # LIFT PC host name
        ### ----------- Device Configuration Section -----------
        'Devices' => {
            'Manitoo' => {
				'Connection_Type'    => 'COM10',
				'FET_HW_Type'        => 'FET_3_Ports',    # FET_3_Ports , FET_6_Ports, FET_15_Ports
				'FET_PortsSelection' => 1,
			},
            'PD' => {
                'AB12' => 1,
            },
            'CD' =>    # channel count only CAN channels like TSG4 (but physically connected to the same channel as PD)
              {
                'CANchannel'    => 1,
                'CANHWSerialNo' => $CANNo,
              },
            'PDLayer' => {    # example values given here
                'BusType'             => 'CAN',    # bus type, possible values are 'CAN', 'FlexRay', 'CANFD'
                'Channel_Nbr_0-based' => 0,          # Vector hardware channel number (0-based)
                'Hw_Serial_Nbr'       => $CANNo,     # Vector hardware serial number
            },

            'CANoe' => {
                'Hostname' => 'HC-C-006KV',                                                                                    # if not local host name, CANoe will be started on remote PC !
                'Log_File' => $PRJCFG_path.'\CANoe_Conf\Log\CANoe.asc',
				'Online_Config'            => $PRJCFG_path.'\\CANoe_Conf\\'.$canoe_cfg,    # This CAN config is used for DEM testing only
				'OldEnableDisableHandling' => 'Yes',
            },
			'Renesas_Flash_Tool' => {
				'Project_Workspace' => [$PRJCFG_path.'\Renesas_Flashing\auto_erase\auto_erase.rpj', 
										$PRJCFG_path.'\Renesas_Flashing\auto_program\auto_program.rpj'],
				'FlashTool_exe_path' => 'C:\Program Files (x86)\Renesas Electronics\Programming Tools\Renesas Flash Programmer V3.08\RFPV3.exe',
			},
        },    ## end of ~~~ Device Configuration Section ~~~
        ### ----------- Function Configuration Section -----------
        'Functions' => {

            'Labcar' => {
                'line' => 'SPILC',    # possible devices: TSG4, MLC, PeriBox
                'power_Ubat' => 'PRITT',
            },
            ### --- Function Area : CAN_Access
            'CAN_Access' => {
                'basic'     => 'CANoe',    # function groups: read, write, trace, simulation
                'stimulate' => 'CANoe',
				'read' =>   'CANoe' ,
				'write' => 'CANoe' ,
				'trace' => 'CANoe' ,
            }, 

            'ProdDiag' => {
                'generation' => 'AB12',               # Airbag generation, possible values: currently 'AB12' only
                'basic'      => 'PDLayer',            # Device for function group 'basic' (all functions):
                                                      # device currently only 'PDLayer'
            },
            'SPI_Access' => {
				'trace'      => 'Manitoo',    # function groups: trace, manipulate
				'manipulate' => 'Manitoo',    #Manitoo
			},
            'CD' => 'CAN',


        },    ## end of ~~~ Function Configuration Section ~~~
    },
}
}
elsif ($hostname =~ /HC-C-003CW/i){
$setup = 'TSG4 - VN';
$Testbench = {
	'HC-C-003CW' => {    # LIFT PC host name
		### ----------- Device Configuration Section -----------
		'Devices' => {
			'TSG4' => {
				'Test_Bench_Number' => 42,                # only for logging purpose
				'Description'       => "Lab PC TSG41",    # only for logging purpose
				'CANchannel'        => 2,
				'CANHWSerialNo'     => $CANNo,            # written on CAN device e.g. "007129-049277" -> 49277, if only one CAN HW connected it will be ignored
				'POWER'             => {
					## configure power inputs: (internal, TOE1, or GOS1)
					'Ubat' => 'internal',
					'UF'   => 'internal',                 # if set to TOE1, this will initialize Toellner as well
				},
			},

			'PD' => {
				'AB12' => 1,
			},
			'CD' =>                                       # channel count only CAN channels like TSG4 (but physically connected to the same channel as PD)
			  {
				'CANchannel'    => 1,
				'CANHWSerialNo' => $CANNo,
			  },
			'PDLayer' => {                                # example values given here
				'BusType'             => 'CAN',           # bus type, possible values are 'CAN', 'FlexRay', 'CANFD'
				'Channel_Nbr_0-based' => 0,               # Vector hardware channel number (0-based)
				'Hw_Serial_Nbr'       => $CANNo,          # Vector hardware serial number
			},

			'CANoe' => {
				'Hostname' => 'HC-C-003CW',                                      # if not local host name, CANoe will be started on remote PC !
				'Log_File' => $PRJCFG_path.'\CANoe_Conf\Log\CANoe.asc',

				#Online evaluation configurations
				'Online_Config'            => $PRJCFG_path.'\\CANoe_Conf\\'.$canoe_cfg,    # This CAN config is used for DEM testing only
				'OldEnableDisableHandling' => 'Yes',
			},
			'Renesas_Flash_Tool' => {
				'Project_Workspace' => [$PRJCFG_path.'\Renesas_Flashing\auto_erase\auto_erase.rpj', 
										$PRJCFG_path.'\Renesas_Flashing\auto_program\auto_program.rpj'],
				'FlashTool_exe_path' => 'C:\Program Files (x86)\Renesas Electronics\Programming Tools\Renesas Flash Programmer V3.08\RFPV3.exe',
			},

			'QuaTe' => {
				'Controllers' => 2,                                                                  # number of controllers connected
			},
		},    ## end of ~~~ Device Configuration Section ~~~
		### ----------- Function Configuration Section -----------
		'Functions' => {
			### --- Function Area : Power, select device the power functions will be mapped to (TSG4, LabCar, TOE1, IDX, IXS, GOS1 or NONE)

			'Labcar' => {
				'line'              => 'TSG4',    # possible devices: TSG4, MLC, PeriBox
				'extended'          => 'TSG4',    # testbench function group 'extended', contains architecture function groups 'lineRT', 'digital2CAN'; device only TSG4
				'disposal'          => 'TSG4',    # possible devices: TSG4, MLC (with ACL box), PeriBox (with ACL box)
				'power_Ubat'        => 'TSG4',    # possible devices: TSG4, MLC, TOE1, NIDAQ, IDX, IXS, GOS1, NONE
				'power_UF'          => 'TSG4',    # possible devices: TSG4, MLC, TOE1, NIDAQ, IDX, IXS, GOS1, NONE
				'measure_trace_digital' => 'LCT',     # possible devices: TRC, LCT
			},
			### --- Function Area : Peripherie, select device where ECU is connected to (TSG4, PeriBox or LabCar)
			'PERIPHERIE' => {
				'device' => 'TSG4',
			},

			### --- Function Area : CAN_Access
			'CAN_Access' => {
				'basic'     => 'CANoe',           # function groups: read, write, trace, simulation
				'stimulate' => 'CANoe',
			},
			
			'NET_Access' => {
				'basic'     => 'CANoe',    # function groups: read, write, trace, simulation
				'stimulate' => 'CANoeCtrl',    # function groups: Stimulate signals ,CAPL
			},

			'SensorEmulator'   => 'Quate',
			'Crash_simulation' => {
				'crash_database'  => 'MDSRESULT',     # possible devices: MDSRESULT
				'crash_sensors'   => 'QuaTe',         # possible devices: QuaTe, IDEFIX
				'network_dynamic' => 'can_access',    # possible devices: can_access
				                                      #'trigger'         =>   'can_access', # possible devices: QuaTe, IDEFIX, can_access
				'trigger'         => 'QuaTe',         # possible devices: QuaTe, IDEFIX, can_access
			},

			'ProdDiag' => {
				'generation' => 'AB12',               # Airbag generation, possible values: currently 'AB12' only
				'basic'      => 'PDLayer',            # Device for function group 'basic' (all functions):
				                                      # device currently only 'PDLayer'
			},
			'CD' => 'CAN',

		},    ## end of ~~~ Function Configuration Section ~~~
	},	
}
}elsif ($hostname =~ /BANI-C-007TV/i){
$setup = 'TSG4 - India';
$Testbench = {
	'BANI-C-007TV' => {    # LIFT PC host name
		### ----------- Device Configuration Section -----------
		'Devices' => {
			'TSG4' => {
				'Test_Bench_Number' => 42,                # only for logging purpose
				'Description'       => "Lab PC TSG41",    # only for logging purpose
				'CANchannel'        => 1,
				'CANHWSerialNo'     => 23682,            # written on CAN device e.g. "007129-049277" -> 49277, if only one CAN HW connected it will be ignored
				'POWER'             => {
					## configure power inputs: (internal, TOE1, or GOS1)
					'Ubat' => 'internal',
					'UF'   => 'internal',                 # if set to TOE1, this will initialize Toellner as well
				},
			},
			'PD' => {
				'AB12' => 1,
			},
			'CD' =>                                       # channel count only CAN channels like TSG4 (but physically connected to the same channel as PD)
			  {
				'CANchannel'    => 3,
				'CANHWSerialNo' => 23682,
			  },
			'PDLayer' => {                                # example values given here
				'BusType'             => 'CAN',           # bus type, possible values are 'CAN', 'FlexRay', 'CANFD'
				'Channel_Nbr_0-based' => 3,               # Vector hardware channel number (0-based)
				'Hw_Serial_Nbr'       => 23682,           # Vector hardware serial number
			},

			'CANoe' => {
				'Hostname' => 'BANI-C-007TV',                                      # if not local host name, CANoe will be started on remote PC !
				'Log_File' => $PRJCFG_path . '\CANoe_Conf\Log\CANoe.asc',

				#Online evaluation configurations
				'Online_Config'            => $PRJCFG_path.'\\CANoe_Conf\\'.$canoe_cfg,    # This CAN config is used for DEM testing only
				'OldEnableDisableHandling' => 'Yes',
			},

			'QuaTe' => {
				'Controllers' => 2,                                                                  # number of controllers connected
			},
			
			'Renesas_Flash_Tool' => {
				'Project_Workspace' => [$PRJCFG_path.'\Renesas_Flashing\auto_erase\auto_erase.rpj', 
										$PRJCFG_path.'\Renesas_Flashing\auto_program\auto_program.rpj'],
				'FlashTool_exe_path' => 'C:\Program Files (x86)\Renesas Electronics\Programming Tools\Renesas Flash Programmer V3.08\RFPV3.exe',
			},

		},    ## end of ~~~ Device Configuration Section ~~~
		### ----------- Function Configuration Section -----------
		'Functions' => {

			'Labcar' => {
				'line'                  => 'TSG4',    # possible devices: TSG4, MLC, PeriBox
				'disposal'              => 'TSG4',
				'power_Ubat'            => 'TSG4',
				'measure_trace_digital' => 'LCT',     # possible devices: TRC, LCT
			},
			### --- Function Area : Peripherie, select device where ECU is connected to (TSG4, PeriBox or LabCar)
			'PERIPHERIE' => {
				'device' => 'TSG4',
			},

			### --- Function Area : CAN_Access
			'CAN_Access' => {
				'basic'     => 'CANoe',               # function groups: read, write, trace, simulation
				'stimulate' => 'CANoe',
			},

			'ProdDiag' => {
				'generation' => 'AB12',               # Airbag generation, possible values: currently 'AB12' only
				'basic'      => 'PDLayer',            # Device for function group 'basic' (all functions):
				                                      # device currently only 'PDLayer'
			},
			'CD' => 'CAN',

			'Crash_simulation' => {
				'crash_database'  => 'MDSRESULT',     # possible devices: MDSRESULT
				'crash_sensors'   => 'QuaTe',         # possible devices: QuaTe, IDEFIX
				'network_dynamic' => 'can_access',    # possible devices: can_access
				'trigger'         => 'QuaTe',         # possible devices: QuaTe, IDEFIX, can_access
			},

		},    ## end of ~~~ Function Configuration Section ~~~
	},
}
}
