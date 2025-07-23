package LIFT_PROJECT;

#use strict;
use warnings;

#------------------------------------------------------------------------------------------------
# Config: SMU3_6D_C7 (CA RefType5 ECU)
#------------------------------------------------------------------------------------------------
#SMU300 (InertialSensor2)
my $AccYLgChl        = '20 00 00 00';    #AccYLgChl          ACC1Lg
my $AccYHgMonChl     = '28 00 00 00';    #AccYHgMonChl       ACC1Hg
my $AccXLgChl        = '30 00 00 00';    #AccXLgChl			ACC2Lg
my $AccXHgMonChl     = '38 00 00 00';    #AccXHgMonChl       ACC2Hg
my $AccZLgChl        = 'B0 00 00 00';    #AccZLgChl          ACC3Lg
my $AccZHgChl        = 'B8 00 00 00';    #AccZHgChl          ACC3Hg
my $RollRateLfChl    = '90 00 00 00';    #RollRateLfChl		Rate1
my $YawRateLfChl     = '10 00 00 00';    #YawRateLfChl		Rate2
my $PitchRateLfChl   = 'A0 00 00 00';    #PitchRateLfChl		Rate3
my $TemperatureChl   = '98 00 00 00';    #Imu2TemperatureChl
my $FrequencyCounter = 'AA 00 00 00';    #FrequencyCounter

#SCON_MON
my $RollRateLfChl_Ext  = '92 00 00 00';    #RollRateLfChl
my $PitchRateLfChl_Ext = 'A2 00 00 00';    #PitchRateLfChl

#not used in this configuration (suppress warnings)
my $YawRateLfPlausiChl = 'FF 00 00 00';
my $AccYLgPlausiChl    = 'FF 00 00 00';

my $Imu2AccYLgChl      = '20 00 00 00';    #AccYLgChl          ACC1
my $Imu2AccXLgChl      = '30 00 00 00';    #AccXLgChl			ACC2
my $Imu2AccZLgChl      = 'B0 00 00 00';    #AccZLgChl          ACC3
my $Imu2RollRateLfChl  = '90 00 00 00';    #YawRateLfChl		Rate1
my $Imu2YawRateLfChl   = '10 00 00 00';    #RollRateLfChl		Rate2
my $Imu2PitchRateLfChl = 'A0 00 00 00';    #PitchRateLfChl		Rate3

#------------------------------------------------------------------------
# Chipselect and trigger mask  and pre-trigger configurations
#------------------------------------------------------------------------
#SCON_MON configuration
#--------------------
my $SMI_SensorMask_Ext = 'FE 00 00 00';
my $SCON_MON_SPI_CS    = '00 10 00 20';

#SMA CS and Mask configuration
#---------------------------
my $SMA_M_SPI1_CS2 = '00 10 00 04';
my $SMA_P_SPI1_CS4 = '00 10 00 10';
my $SMA_SensorMask = 'FF C0 00 00';
my $SMA_Channel_0  = '80 00 00 00';    #In CA it is Channel -Y
my $SMA_Channel_1  = '94 00 00 00';    #In CA it is Channel X
my $SMA_Channel_2  = '98 00 00 00';    #In CA it is Channel Z

#SMI CS and Mask configuration
#----------------------------
my $SMI_SPI1_CS3     = '00 10 00 08';
my $SMI_SensorMask   = 'F8 00 00 00';
my $SMI_StandardMask = 'FF 80 00 00';

#my $SMI_StandardMask_avoid_read_addr0 = 'FF 90 00 00';

my $StatusMask = 'FC 00 00 00';    # for all ASICs

#PreTrigger
#----------
my $PreTrigger_0 = '00 00 00 01';
my $PreTrigger_1 = '00 00 00 02';

# my $FieldCalibSyncTime = '40 16 E3 60';  #1500 ms  #new
my $FieldCalibSyncTime = '40 12 4F 80';    #1200 ms  #new

# my $FieldCalibSyncTime = '40 13 12 D0';  #1250 ms  #new

#InertialSensor1 module commands
#-------------------------------
my $InertialSensor1_Page0 = '00 00 01 00';
my $InertialSensor1_Page1 = '00 00 02 00';
my $InertialSensor1_Page2 = '00 00 04 00';
my $InertialSensor1_Page4 = '00 00 10 00';
#
my $InertialSensor1_Addr0x0 = '48 00 00 00';
my $InertialSensor1_Addr0x1 = '48 80 00 00';
my $InertialSensor1_Addr0x2 = '49 00 00 00';
my $InertialSensor1_Addr0x3 = '49 80 00 00';
my $InertialSensor1_Addr0x4 = '4A 00 00 00';
my $InertialSensor1_Addr0x5 = '4A 80 00 00';
my $InertialSensor1_Addr0x6 = '4B 00 00 00';
my $InertialSensor1_Addr0x7 = '4B 80 00 00';
my $InertialSensor1_Addr0x8 = '4C 00 00 00';
my $InertialSensor1_Addr0x9 = '4C 80 00 00';
my $InertialSensor1_Addr0xA = '4D 00 00 00';
my $InertialSensor1_Addr0xB = '4D 80 00 00';
my $InertialSensor1_Addr0xC = '4E 00 00 00';
my $InertialSensor1_Addr0xD = '4E 80 00 00';
my $InertialSensor1_Addr0xE = '4F 00 00 00';
my $InertialSensor1_Addr0xF = '4F 80 00 00';

#InertialSensor2 module commands
#---------------------------
my $InertialSensor2_Page0 = '00 00 00 01';
my $InertialSensor2_Page1 = '00 00 00 02';
my $InertialSensor2_Page2 = '00 00 00 04';
my $InertialSensor2_Page4 = '00 00 00 10';
#
my $InertialSensor2_Addr0x0 = '08 00 00 00';
my $InertialSensor2_Addr0x1 = '08 80 00 00';
my $InertialSensor2_Addr0x2 = '09 00 00 00';
my $InertialSensor2_Addr0x3 = '09 80 00 00';
my $InertialSensor2_Addr0x4 = '0A 00 00 00';
my $InertialSensor2_Addr0x5 = '0A 80 00 00';
my $InertialSensor2_Addr0x6 = '0B 00 00 00';
my $InertialSensor2_Addr0x7 = '0B 80 00 00';
my $InertialSensor2_Addr0x8 = '0C 00 00 00';
my $InertialSensor2_Addr0x9 = '0C 80 00 00';
my $InertialSensor2_Addr0xA = '0D 00 00 00';
my $InertialSensor2_Addr0xB = '0D 80 00 00';
my $InertialSensor2_Addr0xC = '0E 00 00 00';
my $InertialSensor2_Addr0xD = '0E 80 00 00';
my $InertialSensor2_Addr0xE = '0F 00 00 00';
my $InertialSensor2_Addr0xF = '0F 80 00 00';

$Defaults->{'PARA_MAP_SMU'}{'SERVICES'} = {

    #------------------------------------------------------------------------------------------
    'copy_data_to_PL' => {
        'CMD_sequence' => {
            1.0 => { cmd => '20', descr => 'Copy data to PL' },
        },
    },
    'start_manipulation' => {
        'CMD_sequence' => {
            1.0 => { cmd => '21 - 00 00 00 01', descr => 'Start manipulation' },
        },
    },
    'stop_manipulation' => {
        'CMD_sequence' => {
            1.0 => { cmd => '21 - 00 00 00 00', descr => 'Stop manipulation' },
            1.1 => { cmd => '23',               descr => 'Partial Reset PS & PL' },
        },
    },
    'enable_SMI_page_detection' => {
        'CMD_sequence' => {
            1.0 => { cmd => '71 - ' . $SMI_SPI1_CS3, descr => 'Enable SMI7 Page Detection' },
        },
    },

    # for use on command only
    #------------------------------------------------------------------------------------------
    'power_ON' => {
        'CMD_sequence' => {
            1.0 => { cmd => '80 - 00 01 00 01', descr => 'Power-ON' },
        },
    },
    'power_OFF' => {
        'CMD_sequence' => {
            1.0 => { cmd => '80 - 00 01 00 00', descr => 'Power-OFF' },
        },
    },
    'get_version' => {
        'CMD_sequence' => {
            1.0 => { cmd => '10', descr => 'Get Firmware Version' },
        },
    },
    'read_manipu_counter' => {
        'CMD_sequence' => {
            1.0 => { cmd => 'E0 - FF', descr => 'Read manipulation counter for all units' },
        },
    },

    # for use on command only
    #------------------------------------------------------------------------------------------
    'Service_A1_start_spi_recording_All' => {
        'CMD_sequence' => {
            1.1 => { cmd => 'A1 - 00 00 00 1F', descr => 'start_spi_recording' },
        },
    },
    'Service_A1_start_spi_recording_SMI' => {
        'CMD_sequence' => {
            1.1 => { cmd => 'A1 - 00 00 00 08', descr => 'start_spi_recording' },
        },
    },
    'Service_A2_stop_spi_recording' => {
        'CMD_sequence' => {
            1.2 => { cmd => 'A2', descr => 'stop_spi_recording' },
        },
    },

    #------------------------------------------------------------------------------------------

};

$Defaults->{'PARA_MAP_SMU'}{'TESTCASES'} = {

    # ---------------------------------- Reference Trigger for Fault qualification ----------------------------------------
    'SPI1_CRC_Calc_Off' => {
        'CMD_sequence' => {
            1.0 => { cmd => '24 - 00 00 0E 0F', descr => 'SPI1 CRC calculation off' },
        },
    },
    'SPI1_CRC_Calc_On' => {
        'CMD_sequence' => {
            1.0 => { cmd => '24 - 00 00 0F 0F', descr => 'SPI1 CRC calculation on' },
        },
    },
    'Trigger_SPI_CS' => {
        'CMD_sequence' => {
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3, descr => 'SPI_CS: SMI_SPI1_CS3' },
        },
    },
    'Trigger_Mask' => {
        'CMD_sequence' => {
            0.2 => { cmd => '32 - 00 - ' . $SMI_SensorMask, descr => 'Mask: SMI_SensorMask' },
        },
    },
    'Trigger_YawRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $YawRateLfChl, descr => 'Pattern: YawRateLfChl' },
        },
    },
    'Trigger_RollRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $RollRateLfChl, descr => 'Pattern: RollRateLfChl' },
        },
    },
    'Trigger_AccXLgChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccXLgChl, descr => 'Pattern: AccXLgChl' },
        },
    },
    'Trigger_YawRateLfChl_S16' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $YawRateLfChl, descr => 'Pattern: YawRateLfChl' },
        },
    },
    'Trigger_AccXLgChl_S16' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccXLgChl, descr => 'Pattern: AccXLgChl' },
        },
    },
    'Trigger_FD_1x' => {
        'CMD_sequence' => {
            3.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Triggger_FD_1x' },
            3.8 => { cmd => '43 - 00 - 01 - 00 00 08 C0', descr => 'Data: Triggger_FD_1x' },
        },
    },
    'Trigger_FD_2x' => {
        'CMD_sequence' => {    #140          #124
            3.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Triggger_FD_2x' },
            3.8 => { cmd => '43 - 00 - 02 - 00 00 08 C0 - 00 00 07 C0', descr => 'Data: Triggger_FD_2x' },
        },
    },
    'Trigger_FD_3x' => {
        'CMD_sequence' => {    #140          #124          #140
            3.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_FD_Triggger3' },
            3.8 => { cmd => '43 - 00 - 03 - 00 00 08 C0 - 00 00 07 C0 - 00 00 08 C0', descr => 'Data: Set_FD_Triggger3' },
        },
    },
    'Trigger_FD_4x' => {
        'CMD_sequence' => {    #140          #124          #140			#124
            3.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 ', descr => 'Ctrl: ' },
            3.8 => { cmd => '43 - 00 - 04 - 00 00 08 C0 - 00 00 07 C0 - 00 00 08 C0 - 00 00 07 C0 ', descr => 'Data: Set_FD_Triggger_4x' },
        },
    },
    'Trigger_FD_5x' => {
        'CMD_sequence' => {    #140          #124          #140			#124		   #140
            3.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 ', descr => 'Ctrl: ' },
            3.8 => { cmd => '43 - 00 - 05 - 00 00 08 C0 - 00 00 07 C0 - 00 00 08 C0 - 00 00 07 C0 - 00 00 08 C0 ', descr => 'Data: Set_FD_Triggger_5x' },
        },
    },
    'Trigger_FD_3x_+200grad/s' => {
        'CMD_sequence' => {
            3.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Trigger_FD_3x_+200grad/s' },
            3.8 => { cmd => '43 - 00 - 04 - 00 00 08 C0 - 00 00 07 C0 - 00 00 08 C0 - 00 04 E2 00', descr => 'Data: Trigger_FD_3x_+200grad/s' },
        },
    },
    'Trigger_FD_3x_+2_+1_g' => {
        'CMD_sequence' => {
            3.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Trigger_FD_3x_+2_+1_g' },
            3.8 => { cmd => '43 - 00 - 05 - 00 00 08 C0 - 00 00 07 C0 - 00 00 08 C0 - 00 02 71 00 - 00 01 38 80', descr => 'Data: Trigger_FD_3x_+2_+1_g' },
        },
    },

    # ----------------------------SMA: SMA_SPI_CS, SMA_SensorMask -------------------------------
    'SMAM_SPI_CS' => {
        'CMD_sequence' => {
            0.1 => { cmd => '31 - 00 - ' . $SMA_M_SPI1_CS2, descr => 'SPI_CS: SMA_M_SPI1_CS2' },
        },
    },
    'SMAP_SPI_CS' => {
        'CMD_sequence' => {
            0.1 => { cmd => '31 - 00 - ' . $SMA_P_SPI1_CS4, descr => 'SPI_CS: SMA_P_SPI1_CS4' },
        },
    },
    'SMA_SensorMask' => {
        'CMD_sequence' => {
            0.1 => { cmd => '32 - 00 - ' . $SMA_SensorMask, descr => 'SPI_CS: $SMA_SensorMask' },
        },
    },

    # ----------------------------SMI: SMI_SPI_CS, SMI_SensorMask, SMI_StandardMask -------------------------------
    'SMI_SPI_CS' => {
        'CMD_sequence' => {
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3, descr => 'SPI_CS: SMI_SPI1_CS3' },
        },
    },
    'SMI_SensorMask' => {
        'CMD_sequence' => {
            0.2 => { cmd => '32 - 00 - ' . $SMI_SensorMask, descr => 'Mask: SMI_SensorMask' },
        },
    },
    'SMI_StandardMask' => {
        'CMD_sequence' => {
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask, descr => 'Mask: SMI_StandardMask' },
        },
    },

    'StatusMask' => {
        'CMD_sequence' => {
            0.2 => { cmd => '32 - 00 - ' . $StatusMask, descr => 'Mask: StatusMask' },
        },
    },

    # ----------------------------SCON_MON: SCON_MON_SPI_CS, SCON_MON_SensorMask -------------------------------
    'SCON_MON_SPI_CS' => {
        'CMD_sequence' => {
            0.1 => { cmd => '31 - 00 - ' . $SCON_MON_SPI_CS, descr => 'SPI_CS: SMAM_SPI1_CS5' },
        },
    },
    'SMI_SensorMask_Ext' => {
        'CMD_sequence' => {
            0.2 => { cmd => '32 - 00 - ' . $SMI_SensorMask_Ext, descr => 'Mask: SMI_StandardMask' },
        },
    },

    #Trigger pattern Read Sensor Data Frame
    #---------------------------------------
    # SMA
    'MainAccX' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $SMA_Channel_1, descr => 'Pattern: SMA_Channel_1' },
        },
    },
    'MainAccY' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $SMA_Channel_0, descr => 'Pattern: SMA_Channel_0' },
        },
    },
    'MainAccZ' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $SMA_Channel_2, descr => 'Pattern: SMA_Channel_2' },
        },
    },
    'PlausiAccX' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $SMA_Channel_0, descr => 'Pattern: SMA_Channel_0' },
        },
    },

    #    'PlausiAccY'  => {
    #        'CMD_sequence' => {
    #            0.3 => { cmd => '33 - 00 - '.$SMA_Channel_0,		descr => 'Pattern: SMA_Channel_0' },
    #        },
    #    },
    'PlausiAccZ' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $SMA_Channel_1, descr => 'Pattern: SMA_Channel_1' },
        },
    },

    # SMI
    'AccXLgChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccXLgChl, descr => 'Pattern: AccXLgChl' },
        },
    },
    'Imu2AccXLgChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccXLgChl, descr => 'Pattern: AccXLgChl' },
        },
    },
    'AccXHgMonChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccXHgMonChl, descr => 'Pattern: AccXHgMonChl' },
        },
    },
    'Imu2AccXHgMonChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccXHgMonChl, descr => 'Pattern: AccXHgMonChl' },
        },
    },
    'AccYLgChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccYLgChl, descr => 'Pattern: AccYLgChl' },
        },
    },
    'Imu2AccYLgChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccYLgChl, descr => 'Pattern: AccYLgChl' },
        },
    },
    'AccYHgMonChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccYHgMonChl, descr => 'Pattern: AccYHgMonChl' },
        },
    },
    'Imu2AccYHgMonChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccYHgMonChl, descr => 'Pattern: AccYHgMonChl' },
        },
    },
    'AccYLgPlausiChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccYLgPlausiChl, descr => 'Pattern: AccYLgPlausiChl' },
        },
    },
    'AccZLgChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccZLgChl, descr => 'Pattern: AccZLgChl' },
        },
    },
    'Imu2AccZLgChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $AccZLgChl, descr => 'Pattern: AccZLgChl' },
        },
    },
    'RollRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $RollRateLfChl, descr => 'Pattern: RollRateLfChl' },
        },
    },
    'Imu2RollRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $RollRateLfChl, descr => 'Pattern: RollRateLfChl' },
        },
    },
    'YawRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $YawRateLfChl, descr => 'Pattern: YawRateLfChl' },
        },
    },
    'Imu2YawRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $YawRateLfChl, descr => 'Pattern: YawRateLfChl' },
        },
    },
    'YawRateLfPlausiChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $YawRateLfPlausiChl, descr => 'Pattern: YawRateLfPlausiChl' },
        },
    },
    'PitchRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $PitchRateLfChl, descr => 'Pattern: PitchRateLfChl' },
        },
    },
    'Imu2PitchRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $PitchRateLfChl, descr => 'Pattern: PitchRateLfChl' },
        },
    },
    'Imu2TemperatureChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $TemperatureChl, descr => 'Pattern: TemperatureChl' },
        },
    },
    'TemperatureChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $TemperatureChl, descr => 'Pattern: TemperatureChl' },
        },
    },

    'Imu2FrequencyCounter' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $FrequencyCounter, descr => 'Pattern: TemperatureChl' },
        },
    },

    # for SCON_MON test
    'RollRateLfChl_Ext' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $RollRateLfChl_Ext, descr => 'Pattern: RollRateLfChl' },
        },
    },
    'PitchRateLfChl_Ext' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - ' . $PitchRateLfChl_Ext, descr => 'Pattern: PitchRateLfChl' },
        },
    },
    #
    #Ctrl, Data  Read Sensor Data Frame
    #----------------------------------
    'No_Manipulation' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Ctrl: Set_CI_Bit' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Data: Set_CI_Bit' },
        },
    },
    'Set_CI_Bit' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 08', descr => 'Ctrl: Set_CI_Bit' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Data: Set_CI_Bit' },
        },
    },
    'Set_CI_Bit_4x' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 04 - 00 00 00 08 - 00 00 00 00 - 00 00 00 08 - 00 00 00 00', descr => 'Ctrl: Set_CI_Bit_4x' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 08 - 00 00 00 00 - 00 00 00 08 - 00 00 00 00', descr => 'Data: Set_CI_Bit_4x' },
        },
    },

    'Set_CI_Invert_CRC_Bit1' => {
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 03 - 00 00 00 08 - 00 00 00 08 - 00 00 00 08', descr => 'Ctrl: Set_CI_Invert_CRC_Bit1' },
            2.8 => { cmd => '43 - 00 - 03 - 00 00 00 08 - 00 00 00 0A - 00 00 00 08', descr => 'Data: Set_CI_Invert_CRC_Bit1' },
        },
    },

    'Invert_Data_Bit1' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Ctrl: Invert_Data_Bit1' },
            1.8 => { cmd => '43 - 00 - 01 - 00 00 00 01', descr => 'Data: Invert_Data_Bit1' },
        },
    },
    'Invert_Data_Bit3' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Ctrl: Invert_Data_Bit3' },
            1.8 => { cmd => '43 - 00 - 01 - 00 00 00 40', descr => 'Data: Invert_Data_Bit3' },
        },
    },
    'Invert_Data_Bit5' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Ctrl: Invert_Data_Bit5' },
            1.8 => { cmd => '43 - 00 - 01 - 00 00 01 00', descr => 'Data: Invert_Data_Bit5' },
        },
    },

    'Set_Data_+2_+5.2_+2_g' => {
        'CMD_sequence' => {    #	                    +2g         +5.2g           +2g
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 71 00 - 00 06 59 00 - 00 02 71 00', descr => 'Data: Set_Data_+2_+5.2_+2_g' },
        },
    },
    'Set_Data_+2_+1_g' => {
        'CMD_sequence' => {    #	                 +2g         +1g
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 02 - 00 02 71 00 - 00 01 38 80', descr => 'Data: Set_Data_+2_+1_g' },
        },
    },
    'Set_Data_+4_+2_g' => {
        'CMD_sequence' => {    #	                 +4g         +2g
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 02 - 00 04 E2 00 - 00 01 71 00', descr => 'Data: Set_Data_+4_+2_g' },
        },
    },
    'Set_Data_140_+2_+1_g' => {
        'CMD_sequence' => {    #	               140 			+2g         +1g
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 -00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 08 C0 -00 02 71 00 - 00 01 38 80', descr => 'Data: Set_Data_140_+2_+1_g' },
        },
    },
    'Set_Data_140_+150_+100_grad/s' => {
        'CMD_sequence' => {    #	               140 			+150gps         +100gps
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 -00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 08 C0 -00 02 49 F0 - 00 01 38 80', descr => 'Data: Set_Data_140_+2_+1_g' },
        },
    },
    'Set_Data_+2_+4.5_+2_g' => {
        'CMD_sequence' => {    #	                +2g          +4.5g          +2g
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 71 00 - 00 05 7E 40 - 00 02 71 00', descr => 'Data: Set_Data_+2_+4.5_+2_g' },
        },
    },
    'Set_Data_+2_+3.5_+2_g' => {
        'CMD_sequence' => {    #	                +2g          +3.5g          +2g
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 71 00 - 00 04 45 C0 - 00 02 71 00', descr => 'Data: Set_Data_+2_+3.5_+2_g' },
        },
    },
    'Set_Data_+2_+5.2_+2_+5.2_+2_g' => {
        'CMD_sequence' => {    #	                 +2g         +5.2g           +2g        +5.2g           +2g
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 05 - 00 02 71 00 - 00 06 59 00 - 00 02 71 00 - 00 06 59 00 - 00 02 71 00', descr => 'Data: Set_Data_+2_+5.2_+2_+5.2_+2_g' },
        },
    },
    'Set_Data_+2_+5.2_0_g' => {
        'CMD_sequence' => {    #	                    +2g         +5.2g           0g
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 71 00 - 00 06 59 00 - 00 00 00 00', descr => 'Data: Set_Data_+2_+5.2_+0g' },
        },
    },
    'Set_Data_-2_-5.2_-2_g' => {
        'CMD_sequence' => {    #	                    -2g         -5.2g           -2g
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 0D 8F 00 - 00 09 A7 00 - 00 0D 8F 00', descr => 'Data: Set_Data_-2_-5.2_-2_g' },
        },
    },
    'Set_Data_-2_-4.5_-2_g' => {
        'CMD_sequence' => {    #	                 -2g         -4.5g          -2g
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 0D 8F 00 - 00 0A 81 C0 - 00 0D 8F 00', descr => 'Data: Set_Data_-2_-4.5_-2_g' },
        },
    },
    'Set_Data_-3_-3.5_-3_g' => {
        'CMD_sequence' => {    #	                 -3g         -3.5g          -3g
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 0C 56 80 - 00 0B BA 40 - 00 0C 56 80', descr => 'Data: Set_Data_-2_-4.5_-2_g' },
        },
    },
    'Set_Data_+100_+320_+100_grad/s' => {
        'CMD_sequence' => {    #                 +100grad/s    +320grad/s    +100grad/s
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 71 00 - 00 07 D0 00 - 00 02 71 00', descr => 'Data: Set_Data_+100_+320_+100_grad/s' },
        },
    },
    'Set_Data_-100_-320_-100_grad/s' => {
        'CMD_sequence' => {    #                 -100grad/s    -320grad/s    -100grad/s
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 0D 8F 00 - 00 08 30 00 - 00 0D 8F 00', descr => 'Data: Set_Data_-100_-320_-100_grad/s' },
        },
    },
    'Set_Data_+100_+250_+100_grad/s' => {
        'CMD_sequence' => {    #                 +100grad/s    +250grad/s    +100grad/s
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 71 00 - 00 06 1A 80 - 00 02 71 00', descr => 'Data: Set_Data_+100_+250_+100_grad/s' },
        },
    },
    'Set_Data_-100_-250_-100_grad/s' => {
        'CMD_sequence' => {    #                 -100grad/s    -250grad/s    -100grad/s
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 0D 8F 00 - 00 09 E5 80 - 00 0D 8F 00', descr => 'Data: Set_Data_-100_-250_-100_grad/s' },
        },
    },

    'Set_Data_100_250_100_grad/s' => {
        'CMD_sequence' => {    #                 100grad/s    250grad/s    100grad/s
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 71 00 - 00 06 1A 80 - 00 02 71 00', descr => 'Data: Set_Data_+100_+250_+100_grad/s' },
        },
    },

    'Set_Data_+2_+6.2_+2_+2_g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F8 - 00 0F FF F8 - 00 0F FF F0', descr => 'Ctrl: ' },
            0.8 => { cmd => '43 - 00 - 04 - 00 02 71 00 - 00 07 D0 08 - 00 02 71 08 - 00 02 71 00', descr => 'Data: Set_Data_+2_+6.2_+2_+2_g' },
        },
    },
    'Set_Data_+2_+6.2_0_0_g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F8 - 00 0F FF F8 - 00 0F FF F0', descr => 'Ctrl: ' },
            0.8 => { cmd => '43 - 00 - 04 - 00 02 71 00 - 00 07 D0 08 - 00 00 00 08 - 00 00 00 00', descr => 'Data: Set_Data_+2_+6.2_0_0_g' },
        },
    },
    'Set_Data_-2_-6.2_-2_-2_g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F8 - 00 0F FF F8 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 04 - 00 0D 8F 00 - 00 08 30 08 - 00 0D 8F 08 - 00 0D 8F 00', descr => 'Data: Set_Data_-2_-6.2_-2_-2_g' },
        },
    },

    'Set_Data_+100_+320_+100_+100_grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F8 - 00 0F FF F8 - 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 04 - 00 02 71 00 - 00 07 D0 08 - 00 02 71 08 - 00 02 71 00', descr => 'Data: Set_Data_+100_+320_+100_+100_grad/s' },
        },
    },
    'Set_Data_-100_-320_-100_-100_grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F8 - 00 0F FF F8 - 00 0F FF F0', descr => 'Ctrl: ' },
            0.8 => { cmd => '43 - 00 - 04 - 00 0D 8F 00 - 00 08 30 08 - 00 0D 8F 08 - 00 0D 8F 00', descr => 'Data: Set_Data_-100_-320_-100_-100_grad/s' },
        },
    },

    'Set_Data_+1g_+2g_+3g_+4g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: ' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 38 80 - 00 02 71 00 - 00 03 A9 80 - 00 04 E2 00', descr => 'Data: Set_Data_+2_+6.2_0_0_g' },
        },
    },
    'Set_Data_+5.2g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF 00', descr => 'Ctrl: Set_Data_+5.2g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 06 59 00', descr => 'Data: Set_Data_+5.2g' },
        },
    },
    'Set_Data_-5.2g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF 00', descr => 'Ctrl: Set_Data_-5.2g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 09 A7 00', descr => 'Data: Set_Data_-5.2g' },
        },
    },
    'Set_Data_+40g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF 00', descr => 'Ctrl: Set_Data_+40g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 04 E2 00', descr => 'Data: Set_Data_+40g' },
        },
    },
    'Set_Data_-40g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF 00', descr => 'Ctrl: Set_Data_-40g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 0B 1E 00', descr => 'Data: Set_Data_-40g' },
        },
    },
    'Set_Data_+320grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF 00', descr => 'Ctrl: Set_Data_+320grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 07 D0 00', descr => 'Data: Set_Data_+320grad/s' },
        },
    },
    'Set_Data_+101grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+101grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 02 77 40', descr => 'Data: Set_Data_+101grad/s' },
        },
    },
    'Set_Data_+103grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+103grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 02 83 C0', descr => 'Data: Set_Data_+103grad/s' },
        },
    },
    'Set_Data_+200grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+200grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 04 E2 00', descr => 'Data: Set_Data_+200grad/s' },
        },
    },
    'Set_Data_+150grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+150grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 03 A9 80', descr => 'Data: Set_Data_+150grad/s' },
        },
    },
    'Set_Data_+100grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+100grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 02 71 00', descr => 'Data: Set_Data_+100grad/s' },
        },
    },
    'Set_Data_+50grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+50grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 01 38 80', descr => 'Data: Set_Data_+50grad/s' },
        },
    },
    'Set_Data_-100grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF 00', descr => 'Ctrl: Set_Data_-100grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 0D 8F 00', descr => 'Data: Set_Data_-100grad/s' },
        },
    },
    'Set_Data_-103grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_-103grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 0D 7C 40', descr => 'Data: Set_Data_-103grad/s' },
        },
    },
    'Set_Data_-320grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF 00', descr => 'Ctrl: Set_Data_-320grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 08 30 00', descr => 'Data: Set_Data_-320grad/s' },
        },
    },
    'Set_Data_+5g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+5g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 06 1A 80', descr => 'Data: Set_Data_+5g' },
        },
    },

    'Set_Data_-5g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_-5g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 09 E5 80', descr => 'Data: Set_Data_-5g' },
        },
    },

    'Set_Data_+4.9g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+4.9g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 05 FB 40', descr => 'Data: Set_Data_+4.9g' },
        },
    },

    'Set_Data_-4.9g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_-4.9g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 0A 04 C0', descr => 'Data: Set_Data_-4.9g' },
        },
    },

    'Set_Data_+1g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+1g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 01 38 80', descr => 'Data: Set_Data_+1g' },
        },
    },
    'Set_Data_+2g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+2g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 02 71 00', descr => 'Data: Set_Data_+2g' },
        },
    },
    'Set_Data_+3g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+3g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 03 A9 80', descr => 'Data: Set_Data_+3g' },
        },
    },
    'Set_Data_+4g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+4g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 04 E2 00', descr => 'Data: Set_Data_+4g' },
        },
    },
    'Set_Data_-1g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_-1g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 0E C7 80', descr => 'Data: Set_Data_-1g' },
        },
    },

    'Set_Data_+35g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+35g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 04 45 C0', descr => 'Data: Set_Data_+35g' },
        },
    },

    'Set_Data_-35g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_-35g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 0B BA 40', descr => 'Data: Set_Data_-35g' },
        },
    },

    'Set_Data_+34g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+34g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 04 26 80', descr => 'Data: Set_Data_+34g' },
        },
    },

    'Set_Data_-34g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_-34g' },
            0.8 => { cmd => '43 - 00 - 01 - 00 0B D9 80', descr => 'Data: Set_Data_-34g' },
        },
    },

    'Set_Data_+300grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+300grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 07 53 00', descr => 'Data: Set_Data_+300grad/s' },
        },
    },

    'Set_Data_-300grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_-300grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 08 AD 00', descr => 'Data: Set_Data_-300grad/s' },
        },
    },

    'Set_Data_+299grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_+299grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 07 4C C0', descr => 'Data: Set_Data_+299grad/s' },
        },
    },

    'Set_Data_-299grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_-299grad/s' },
            0.8 => { cmd => '43 - 00 - 01 - 00 08 B3 40', descr => 'Data: Set_Data_-299grad/s' },
        },
    },

    'Invert_SID_Bit2' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Ctrl: Invert_SID_Bit2' },
            0.8 => { cmd => '43 - 00 - 01 - 00 40 00 00', descr => 'Data: Invert_SID_Bit2' },
        },
    },

    'SID_31' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 0F 80 00 00', descr => 'Ctrl: Invert_SID_Bit2' },
            0.8 => { cmd => '43 - 00 - 01 - 0F 80 00 00', descr => 'Data: Invert_SID_Bit2' },
        },
    },

    'Set_Data_140_SID_SID_2_+2_+1_g' => {
        'CMD_sequence' => {    #	               140 			+2g         +2g            +1g
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 -00 0F FF F0 -00 0F FF F0- 00 0F FF F0', descr => 'Ctrl:' },
            0.8 => { cmd => '43 - 00 - 04 - 00 40 08 C0 -00 42 71 00 -00 02 71 00- 00 01 38 80', descr => 'Data: Set_Data_140_SID_SID_2_+2_+1_g' },
        },
    },

    'Mode_20_110_590_700ms' => {
        'CMD_sequence' => {    #                    20		    110ms	      590 ms        700 ms
            0.6 => { cmd => '41 - 00 - 04 - 40 00 4E 20 - 40 01 AD B0 - 40 09 00 B0 - 40 0A AE 60', descr => 'Mode: Mode_20_110_2x700ms' },
        },
    },

    'no_manipulation' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Ctrl: no_manipulation' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Data: no_manipulation' },
        },
    },
    'Set_Data_SMA_2LSB' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_SMA_2LSB' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 80', descr => 'Data: Set_Data_SMA_2LSB' },
        },
    },
    'Set_Data_SMA_3LSB' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_SMA_3LSB' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 C0', descr => 'Data: Set_Data_SMA_3LSB' },
        },
    },
    'Set_SData_SMU_2LSB' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_SMA_2LSB' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 20', descr => 'Data: Set_Data_SMA_2LSB' },
        },
    },
    'Set_SData_SMU_3LSB' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_SMU_3LSB' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 30', descr => 'Data: Set_Data_SMU_3LSB' },
        },
    },
    'Set_MData_SMU_2LSB' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'Ctrl: Set_Data_SMU_2LSB' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 10', descr => 'Data: Set_Data_SMU_2LSB' },
        },
    },
    'Set_MData_SMU_3LSB' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'Ctrl: Set_Data_SMU_3LSB' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 18', descr => 'Data: Set_Data_SMU_3LSB' },
        },
    },

    #

    #ASIC_NAME (DeviceID)
    'YawSensor_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x3, descr => 'Addr: ASIC_NAME YawSensor_Addr0x3' },
            1.4 => { cmd => '72 - 00 - ' . $YawSensor_Page4,   descr => 'Page: ASIC_NAME YawSensor_Page4' },
        },
    },
    'RollSensor_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x3, descr => 'Addr: ASIC_NAME RollSensor_Addr0x3' },
            1.4 => { cmd => '72 - 00 - ' . $RollSensor_Page4,   descr => 'Page: ASIC_NAME RollSensor_Page4' },
        },
    },
    'PitchSensor_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0x3, descr => 'Addr: ASIC_NAME PitchSensor_Addr0x3' },
            1.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page4,   descr => 'Page: ASIC_NAME PitchSensor_Page4' },
        },
    },
    'YawPlausiSensor_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0x3, descr => 'Addr: ASIC_NAME YawPlausiSensor_Addr0x3' },
            1.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page4,   descr => 'Page: ASIC_NAME YawPlausiSensor_Page4' },
        },
    },
    'InertialSensor1_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x3, descr => 'Addr: ASIC_NAME InertialSensor1_Addr0x3' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page4,   descr => 'Page: ASIC_NAME InertialSensor1_Page4' },
        },
    },
    'InertialSensor2_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x3, descr => 'Addr: ASIC_NAME InertialSensor2_Addr0x3' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page4,   descr => 'Page: ASIC_NAME InertialSensor2_Page4' },
        },
    },

    #ASIC_REVISION (RevisionID)
    'YawSensor_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x4, descr => 'Addr: ASIC_REVISION YawSensor_Addr0x4' },
            1.4 => { cmd => '72 - 00 - ' . $YawSensor_Page4,   descr => 'Page: ASIC_REVISION YawSensor_Page4' },
        },
    },
    'RollSensor_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x4, descr => 'Addr: ASIC_REVISION RollSensor_Addr0x4' },
            1.4 => { cmd => '72 - 00 - ' . $RollSensor_Page4,   descr => 'Page: ASIC_REVISION RollSensor_Page4' },
        },
    },
    'PitchSensor_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0x4, descr => 'Addr: ASIC_REVISION PitchSensor_Addr0x4' },
            1.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page4,   descr => 'Page: ASIC_REVISION PitchSensor_Page4' },
        },
    },
    'YawPlausiSensor_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0x4, descr => 'Addr: ASIC_REVISION YawPlausiSensor_Addr0x4' },
            1.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page4,   descr => 'Page: ASIC_REVISION YawPlausiSensor_Page4' },
        },
    },
    'InertialSensor1_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x4, descr => 'Addr: ASIC_REVISION InertialSensor1_Addr0x4' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page4,   descr => 'Page: ASIC_REVISION InertialSensor1_Page4' },
        },
    },
    'InertialSensor2_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x4, descr => 'Addr: ASIC_REVISION InertialSensor2_Addr0x4' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page4,   descr => 'Page: ASIC_REVISION InertialSensor2_Page4' },
        },
    },

    #ASIC_SERIAL_NR_0
    'YawSensor_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x0, descr => 'Addr: ASIC_SERIAL_NR_0 YawSensor_Addr0x0' },
            1.4 => { cmd => '72 - 00 - ' . $YawSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_0 YawSensor_Page4' },
        },
    },
    'RollSensor_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x0, descr => 'Addr: ASIC_SERIAL_NR_0 RollSensor_Addr0x0' },
            1.4 => { cmd => '72 - 00 - ' . $RollSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_0 RollSensor_Page4' },
        },
    },
    'PitchSensor_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0x0, descr => 'Addr: ASIC_SERIAL_NR_0 PitchSensor_Addr0x0' },
            1.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_0 PitchSensor_Page4' },
        },
    },
    'YawPlausiSensor_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0x0, descr => 'Addr: ASIC_SERIAL_NR_0 YawPlausiSensor_Addr0x0' },
            1.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_0 YawPlausiSensor_Page4' },
        },
    },
    'InertialSensor1_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x0, descr => 'Addr: ASIC_SERIAL_NR_0 InertialSensor1_Addr0x0' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page4,   descr => 'Page: ASIC_SERIAL_NR_0 InertialSensor1_Page4' },
        },
    },
    'InertialSensor2_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x0, descr => 'Addr: ASIC_SERIAL_NR_0 InertialSensor2_Addr0x0' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page4,   descr => 'Page: ASIC_SERIAL_NR_0 InertialSensor2_Page4' },
        },
    },

    #ASIC_SERIAL_NR_1
    'YawSensor_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $YawSensor_Addr0x1, descr => 'Addr: ASIC_SERIAL_NR_1 YawSensor_Addr0x1' },
            2.4 => { cmd => '72 - 02 - ' . $YawSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_1 YawSensor_Page4' },
        },
    },
    'RollSensor_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $RollSensor_Addr0x1, descr => 'Addr: ASIC_SERIAL_NR_1 RollSensor_Addr0x1' },
            2.4 => { cmd => '72 - 02 - ' . $RollSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_1 RollSensor_Page4' },
        },
    },
    'PitchSensor_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $PitchSensor_Addr0x1, descr => 'Addr: ASIC_SERIAL_NR_1 PitchSensor_Addr0x1' },
            2.4 => { cmd => '72 - 02 - ' . $PitchSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_1 PitchSensor_Page4' },
        },
    },
    'YawPlausiSensor_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $YawPlausiSensor_Addr0x1, descr => 'Addr: ASIC_SERIAL_NR_1 YawPlausiSensor_Addr0x1' },
            2.4 => { cmd => '72 - 02 - ' . $YawPlausiSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_1 YawPlausiSensor_Page4' },
        },
    },
    'InertialSensor1_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $InertialSensor1_Addr0x1, descr => 'Addr: ASIC_SERIAL_NR_1 InertialSensor1_Addr0x1' },
            2.4 => { cmd => '72 - 02 - ' . $InertialSensor1_Page4,   descr => 'Page: ASIC_SERIAL_NR_1 InertialSensor1_Page4' },
        },
    },
    'InertialSensor2_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $InertialSensor2_Addr0x1, descr => 'Addr: ASIC_SERIAL_NR_1 InertialSensor2_Addr0x1' },
            2.4 => { cmd => '72 - 02 - ' . $InertialSensor2_Page4,   descr => 'Page: ASIC_SERIAL_NR_1 InertialSensor2_Page4' },
        },
    },

    #ASIC_SERIAL_NR_2
    'YawSensor_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $YawSensor_Addr0x2, descr => 'Addr: ASIC_SERIAL_NR_2 YawSensor_Addr0x2' },
            3.4 => { cmd => '72 - 03 - ' . $YawSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_2 YawSensor_Page4' },
        },
    },
    'RollSensor_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $RollSensor_Addr0x2, descr => 'Addr: ASIC_SERIAL_NR_2 RollSensor_Addr0x2' },
            3.4 => { cmd => '72 - 03 - ' . $RollSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_2 RollSensor_Page4' },
        },
    },
    'PitchSensor_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $PitchSensor_Addr0x2, descr => 'Addr: ASIC_SERIAL_NR_2 PitchSensor_Addr0x2' },
            3.4 => { cmd => '72 - 03 - ' . $PitchSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_2 PitchSensor_Page4' },
        },
    },
    'YawPlausiSensor_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $YawPlausiSensor_Addr0x2, descr => 'Addr: ASIC_SERIAL_NR_2 YawPlausiSensor_Addr0x2' },
            3.4 => { cmd => '72 - 03 - ' . $YawPlausiSensor_Page4,   descr => 'Page: ASIC_SERIAL_NR_2 YawPlausiSensor_Page4' },
        },
    },
    'InertialSensor1_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $InertialSensor1_Addr0x2, descr => 'Addr: ASIC_SERIAL_NR_2 InertialSensor1_Addr0x2' },
            3.4 => { cmd => '72 - 03 - ' . $InertialSensor1_Page4,   descr => 'Page: ASIC_SERIAL_NR_2 InertialSensor1_Page4' },
        },
    },
    'InertialSensor2_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $InertialSensor2_Addr0x2, descr => 'Addr: ASIC_SERIAL_NR_2 InertialSensor2_Addr0x2' },
            3.4 => { cmd => '72 - 03 - ' . $InertialSensor2_Page4,   descr => 'Page: ASIC_SERIAL_NR_2 InertialSensor2_Page4' },
        },
    },

    #SMI_SERIAL_NR_0
    'YawSensor_SMI_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x5, descr => 'Addr: SMI_SERIAL_NR_0 YawSensor_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $YawSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_0 YawSensor_Page4' },
        },
    },
    'RollSensor_SMI_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x5, descr => 'Addr: SMI_SERIAL_NR_0 RollSensor_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $RollSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_0 RollSensor_Page4' },
        },
    },
    'PitchSensor_SMI_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0x5, descr => 'Addr: SMI_SERIAL_NR_0 PitchSensor_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_0 PitchSensor_Page4' },
        },
    },
    'YawPlausiSensor_SMI_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0x5, descr => 'Addr: SMI_SERIAL_NR_0 YawPlausiSensor_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_0 YawPlausiSensor_Page4' },
        },
    },
    'InertialSensor1_SMI_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x5, descr => 'Addr: SMI_SERIAL_NR_0 InertialSensor1_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page4,   descr => 'Page: SMI_SERIAL_NR_0 InertialSensor1_Page4' },
        },
    },
    'InertialSensor2_SMI_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x5, descr => 'Addr: SMI_SERIAL_NR_0 InertialSensor2_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page4,   descr => 'Page: SMI_SERIAL_NR_0 InertialSensor2_Page4' },
        },
    },

    #SMI_SERIAL_NR_1
    'YawSensor_SMI_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $YawSensor_Addr0x6, descr => 'Addr: SMI_SERIAL_NR_1 YawSensor_Addr0x6' },
            2.4 => { cmd => '72 - 02 - ' . $YawSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_1 YawSensor_Page4' },
        },
    },
    'RollSensor_SMI_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $RollSensor_Addr0x6, descr => 'Addr: SMI_SERIAL_NR_1 RollSensor_Addr0x6' },
            2.4 => { cmd => '72 - 02 - ' . $RollSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_1 RollSensor_Page4' },
        },
    },
    'PitchSensor_SMI_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $PitchSensor_Addr0x6, descr => 'Addr: SMI_SERIAL_NR_1 PitchSensor_Addr0x6' },
            2.4 => { cmd => '72 - 02 - ' . $PitchSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_1 PitchSensor_Page4' },
        },
    },
    'YawPlausiSensor_SMI_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $YawPlausiSensor_Addr0x6, descr => 'Addr: SMI_SERIAL_NR_1 YawPlausiSensor_Addr0x6' },
            2.4 => { cmd => '72 - 02 - ' . $YawPlausiSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_1 YawPlausiSensor_Page4' },
        },
    },
    'InertialSensor1_SMI_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $InertialSensor1_Addr0x6, descr => 'Addr: SMI_SERIAL_NR_1 InertialSensor1_Addr0x6' },
            2.4 => { cmd => '72 - 02 - ' . $InertialSensor1_Page4,   descr => 'Page: SMI_SERIAL_NR_1 InertialSensor1_Page4' },
        },
    },
    'InertialSensor2_SMI_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $InertialSensor2_Addr0x6, descr => 'Addr: SMI_SERIAL_NR_1 InertialSensor2_Addr0x6' },
            2.4 => { cmd => '72 - 02 - ' . $InertialSensor2_Page4,   descr => 'Page: SMI_SERIAL_NR_1 InertialSensor2_Page4' },
        },
    },

    #SMI_SERIAL_NR_2
    'YawSensor_SMI_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $YawSensor_Addr0x7, descr => 'Addr: SMI_SERIAL_NR_2 YawSensor_Addr0x7' },
            3.4 => { cmd => '72 - 03 - ' . $YawSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_2 YawSensor_Page4' },
        },
    },
    'YawPlausiSensor_SMI_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $YawPlausiSensor_Addr0x7, descr => 'Addr: SMI_SERIAL_NR_2 YawPlausiSensor_Addr0x7' },
            3.4 => { cmd => '72 - 03 - ' . $YawPlausiSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_2 YawPlausiSensor_Page4' },
        },
    },
    'RollSensor_SMI_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $RollSensor_Addr0x7, descr => 'Addr: SMI_SERIAL_NR_2 RollSensor_Addr0x7' },
            3.4 => { cmd => '72 - 03 - ' . $RollSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_2 RollSensor_Page4' },
        },
    },
    'PitchSensor_SMI_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $PitchSensor_Addr0x7, descr => 'Addr: SMI_SERIAL_NR_2 PitchSensor_Addr0x7' },
            3.4 => { cmd => '72 - 03 - ' . $PitchSensor_Page4,   descr => 'Page: SMI_SERIAL_NR_2 PitchSensor_Page4' },
        },
    },
    'InertialSensor1_SMI_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $InertialSensor1_Addr0x7, descr => 'Addr: SMI_SERIAL_NR_2 InertialSensor1_Addr0x7' },
            3.4 => { cmd => '72 - 03 - ' . $InertialSensor1_Page4,   descr => 'Page: SMI_SERIAL_NR_2 InertialSensor1_Page4' },
        },
    },
    'InertialSensor2_SMI_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - ' . $InertialSensor2_Addr0x7, descr => 'Addr: SMI_SERIAL_NR_2 InertialSensor2_Addr0x7' },
            3.4 => { cmd => '72 - 03 - ' . $InertialSensor2_Page4,   descr => 'Page: SMI_SERIAL_NR_2 InertialSensor2_Page4' },
        },
    },

    #FW_VERSION
    'InertialSensor1_FW_Version' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x9, descr => 'Addr: FW_VERSION InertialSensor1_Addr0x9' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page4,   descr => 'Page: FW_VERSION InertialSensor1_Page4' },
        },
    },
    'InertialSensor2_FW_Version' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x9, descr => 'Addr: FW_VERSION InertialSensor2_Addr0x9' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page4,   descr => 'Page: FW_VERSION InertialSensor2_Page4' },
        },
    },

    #EoC
    'InertialSensor1_EoC' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0xA, descr => 'Addr: EoC InertialSensor1_Addr0xA' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page0,   descr => 'Page: EoC InertialSensor1_Page0' },
        },
    },
    'InertialSensor2_EoC' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0xA, descr => 'Addr: EoC InertialSensor2_Addr0xA' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page0,   descr => 'Page: EoC InertialSensor2_Page0' },
        },
    },

    #CONF_OREG1
    'InertialSensor1_OREG1' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x5, descr => 'Addr: CONF_OREG1 InertialSensor1_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page0,   descr => 'Page: CONF_OREG1 InertialSensor1_Page0' },
        },
    },
    'InertialSensor2_OREG1' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x5, descr => 'Addr: CONF_OREG1 InertialSensor2_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page0,   descr => 'Page: CONF_OREG1 InertialSensor2_Page0' },
        },
    },

    #CONF_OREG2
    'InertialSensor1_OREG2' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x6, descr => 'Addr: CONF_OREG2 InertialSensor1_Addr0x6' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page0,   descr => 'Page: CONF_OREG2 InertialSensor1_Page0' },
        },
    },

    #CONF_OREG3
    'InertialSensor1_OREG3' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x7, descr => 'Addr: CONF_OREG3 InertialSensor1_Addr0x7' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page0,   descr => 'Page: CONF_OREG3 InertialSensor1_Page0' },
        },
    },
    'InertialSensor1_IREG1' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x1, descr => 'Addr: CONF_IREG1 InertialSensor1_Addr0x1' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page0,   descr => 'Page: CONF_IREG1 InertialSensor1_Page0' },
        },
    },

    #CHANNEL_STATUS_HW_SCON (ChStatHwScon)
    'YawSensor_ChlStatHwScon' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x8, descr => 'Addr: CHANNEL_STATUS_HW_SCON YawSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $YawSensor_Page1,   descr => 'Page: CHANNEL_STATUS_HW_SCON YawSensor_Page1' },
        },
    },
    'RollSensor_ChlStatHwScon' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x8, descr => 'Addr: CHANNEL_STATUS_HW_SCON RollSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $RollSensor_Page1,   descr => 'CHANNEL_STATUS_HW_SCON RollSensor_Page1' },
        },
    },
    'PitchSensor_ChlStatHwScon' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0x8, descr => 'Addr: CHANNEL_STATUS_HW_SCON PitchSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page1,   descr => 'Page: CHANNEL_STATUS_HW_SCON PitchSensor_Page1' },
        },
    },
    'YawPlausiSensor_ChlStatHwScon' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0x8, descr => 'Addr: CHANNEL_STATUS_HW_SCON YawPlausiSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page1,   descr => 'Page: CHANNEL_STATUS_HW_SCON YawPlausiSensor_Page1' },
        },
    },
    'InertialSensor1_ChlStatHwScon' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x8, descr => 'Addr: CHANNEL_STATUS_HW_SCON InertialSensor1_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page1,   descr => 'Page: CHANNEL_STATUS_HW_SCON InertialSensor1_Page1' },
        },
    },

    'InertialSensor2_ChlStatHwScon6DExt' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0xB, descr => 'Addr: CHANNEL_STATUS_HW_SCON InertialSensor1_Addr0xB' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page1,   descr => 'Page: CHANNEL_STATUS_HW_SCON InertialSensor1_Page1' },
        },
    },

    'InertialSensor2_ChlStatHwScon' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x8, descr => 'Addr: CHANNEL_STATUS_HW_SCON InertialSensor2_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page1,   descr => 'Page: CHANNEL_STATUS_HW_SCON InertialSensor2_Page1' },
        },
    },

    #error_group_out (16 Bit Cluster Flags)

    'YawSensor_ClusterFlags' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $YawSensor_Addr0xF, descr => 'Addr: error_group_out YawSensor_Addr0xF' },
            2.4 => { cmd => '72 - 02 - ' . $YawSensor_Page2,   descr => 'Page: error_group_out YawSensor_Page2' },
        },
    },
    'RollSensor_ClusterFlags' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $RollSensor_Addr0xF, descr => 'Addr: error_group_out RollSensor_Addr0xF' },
            2.4 => { cmd => '72 - 02 - ' . $RollSensor_Page2,   descr => 'Page: error_group_out RollSensor_Page2' },
        },
    },
    'PitchSensor_ClusterFlags' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $PitchSensor_Addr0xF, descr => 'Addr: error_group_out PitchSensor_Addr0xF' },
            2.4 => { cmd => '72 - 02 - ' . $PitchSensor_Page2,   descr => 'Page: error_group_out PitchSensor_Page2' },
        },
    },
    '	YawPlausiSensor_ClusterFlags' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $YawPlausiSensor_Addr0xF, descr => 'Addr: error_group_out YawPlausiSensor_Addr0xF' },
            2.4 => { cmd => '72 - 02 - ' . $YawPlausiSensor_Page2,   descr => 'Page: error_group_out YawPlausiSensor_Page2' },
        },
    },
    'InertialSensor1_ClusterFlags' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $InertialSensor1_Addr0x5, descr => 'Addr: error_group_out InertialSensor1_Addr0x5' },
            2.4 => { cmd => '72 - 02 - ' . $InertialSensor1_Page2,   descr => 'Page: error_group_out InertialSensor1_Page2' },
        },
    },
    'InertialSensor2_ClusterFlags' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - ' . $InertialSensor2_Addr0x5, descr => 'Addr: error_group_out InertialSensor2_Addr0x5' },
            2.4 => { cmd => '72 - 02 - ' . $InertialSensor2_Page2,   descr => 'Page: error_group_out InertialSensor2_Page2' },
        },
    },

    #error_flag_16_bank0
    'YawSensor_ErrorFlag16_Bank0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x1, descr => 'Addr: error_flag_16_bank0 YawSensor_Addr0x1' },
            1.4 => { cmd => '72 - 00 - ' . $YawSensor_Page2,   descr => 'Page: error_flag_16_bank0 YawSensor_Page2' },
        },
    },
    'RollSensor_ErrorFlag16_Bank0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x1, descr => 'Addr: error_flag_16_bank0 RollSensor_Addr0x1' },
            1.4 => { cmd => '72 - 00 - ' . $RollSensor_Page2,   descr => 'Page: error_flag_16_bank0 RollSensor_Page2' },
        },
    },
    'PitchSensor_ErrorFlag16_Bank0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0x1, descr => 'Addr: error_flag_16_bank0 PitchSensor_Addr0x1' },
            1.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page2,   descr => 'Page: error_flag_16_bank0 PitchSensor_Page2' },
        },
    },
    'YawPlausiSensor_ErrorFlag16_Bank0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0x1, descr => 'Addr: error_flag_16_bank0 YawPlausiSensor_Addr0x1' },
            1.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page2,   descr => 'Page: error_flag_16_bank0 YawPlausiSensor_Page2' },
        },
    },
    'InertialSensor1_ErrorFlag16_Bank0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x6, descr => 'Addr: error_flag_16_bank0 InertialSensor1_Addr0x6' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Page: error_flag_16_bank0 InertialSensor1_Page2' },
        },
    },
    'InertialSensor2_ErrorFlag16_Bank0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x6, descr => 'Addr: error_flag_16_bank0 InertialSensor2_Addr0x6' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: error_flag_16_bank0 InertialSensor2_Page2' },
        },
    },

    #error_flag_16_bank1
    'YawSensor_ErrorFlag16_Bank1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x2, descr => 'Addr: error_flag_16_bank1 YawSensor_Addr0x2' },
            2.4 => { cmd => '72 - 00 - ' . $YawSensor_Page2,   descr => 'Page: error_flag_16_bank1 YawSensor_Page2' },
        },
    },
    'RollSensor_ErrorFlag16_Bank1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x2, descr => 'Addr: error_flag_16_bank1 RollSensor_Addr0x2' },
            2.4 => { cmd => '72 - 00 - ' . $RollSensor_Page2,   descr => 'Page: error_flag_16_bank1 RollSensor_Page2' },
        },
    },
    'PitchSensor_ErrorFlag16_Bank1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0x2, descr => 'Addr: error_flag_16_bank1 PitchSensor_Addr0x2' },
            2.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page2,   descr => 'Page: error_flag_16_bank1 PitchSensor_Page2' },
        },
    },
    'YawPlausiSensor_ErrorFlag16_Bank1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0x2, descr => 'Addr: error_flag_16_bank1 YawPlausiSensor_Addr0x2' },
            2.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page2,   descr => 'Page: error_flag_16_bank1 YawPlausiSensor_Page2' },
        },
    },
    'InertialSensor1_ErrorFlag16_Bank1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x7, descr => 'Addr: error_flag_16_bank1 InertialSensor1_Addr0x7' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Page: error_flag_16_bank1 InertialSensor1_Page2' },
        },
    },
    'InertialSensor2_ErrorFlag16_Bank1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x7, descr => 'Addr: error_flag_16_bank1 InertialSensor2_Addr0x7' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: error_flag_16_bank1 InertialSensor2_Page2' },
        },
    },
    'InertialSensor2_ErrorFlag16_Bank2' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x8, descr => 'Addr: error_flag_16_bank1 InertialSensor2_Addr0x8' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: error_flag_16_bank1 InertialSensor2_Page2' },
        },
    },
    'InertialSensor2_ErrorFlag16_Bank3' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x9, descr => 'Addr: error_flag_16_bank1 InertialSensor2_Addr0x9' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: error_flag_16_bank1 InertialSensor2_Page2' },
        },
    },
    'InertialSensor2_ErrorFlag16_Bank4' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0xA, descr => 'Addr: error_flag_16_bank1 InertialSensor2_Addr0xA' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: error_flag_16_bank1 InertialSensor2_Page2' },
        },
    },
    'InertialSensor2_ErrorFlag16_Bank5' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0xB, descr => 'Addr: error_flag_16_bank1 InertialSensor2_Addr0xB' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: error_flag_16_bank1 InertialSensor2_Page2' },
        },
    },
    'InertialSensor2_ErrorFlag16_Bank6' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0xC, descr => 'Addr: error_flag_16_bank1 InertialSensor2_Addr0xC' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: error_flag_16_bank1 InertialSensor2_Page2' },
        },
    },
    'InertialSensor2_ErrorFlag16_Bank8' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0xE, descr => 'Addr: error_flag_16_bank1 InertialSensor2_Addr0xE' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: error_flag_16_bank1 InertialSensor2_Page2' },
        },
    },

    #error_flag_16_bank7
    'YawSensor_ErrorFlag16_Bank7' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x8, descr => 'Addr: error_flag_16_bank7 YawSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $YawSensor_Page2,   descr => 'Page: error_flag_16_bank7 YawSensor_Page2' },
        },
    },
    'RollSensor_ErrorFlag16_Bank7' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x8, descr => 'Addr: error_flag_16_bank7 RollSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $RollSensor_Page2,   descr => 'Page: error_flag_16_bank7 RollSensor_Page2' },
        },
    },
    'PitchSensor_ErrorFlag16_Bank7' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0x8, descr => 'Addr: error_flag_16_bank7 PitchSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page2,   descr => 'Page: error_flag_16_bank7 PitchSensor_Page2' },
        },
    },
    'YawPlausiSensor_ErrorFlag16_Bank7' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0x8, descr => 'Addr: error_flag_16_bank7 YawPlausiSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page2,   descr => 'Page: error_flag_16_bank7 YawPlausiSensor_Page2' },
        },
    },
    'InertialSensor1_ErrorFlag16_Bank7' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0xD, descr => 'Addr: error_flag_16_bank7 InertialSensor1_Addr0xD' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Page: error_flag_16_bank7 InertialSensor1_Page2' },
        },
    },
    'InertialSensor2_ErrorFlag16_Bank7' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0xD, descr => 'Addr: error_flag_16_bank7 InertialSensor2_Addr0xD' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: error_flag_16_bank7 InertialSensor2_Page2' },
        },
    },

    #error_flag_16_bank9
    'YawSensor_ErrorFlag16_Bank9' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0xA, descr => 'Addr: error_flag_16_bank7 YawSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $YawSensor_Page2,   descr => 'Page: error_flag_16_bank7 YawSensor_Page2' },
        },
    },
    'RollSensor_ErrorFlag16_Bank9' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0xA, descr => 'Addr: error_flag_16_bank7 RollSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $RollSensor_Page2,   descr => 'Page: error_flag_16_bank7 RollSensor_Page2' },
        },
    },
    'PitchSensor_ErrorFlag16_Bank9' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0xA, descr => 'Addr: error_flag_16_bank7 PitchSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page2,   descr => 'Page: error_flag_16_bank7 PitchSensor_Page2' },
        },
    },
    'YawPlausiSensor_ErrorFlag16_Bank9' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0xA, descr => 'Addr: error_flag_16_bank7 YawPlausiSensor_Addr0x8' },
            1.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page2,   descr => 'Page: error_flag_16_bank7 YawPlausiSensor_Page2' },
        },
    },
    'InertialSensor1_ErrorFlag16_Bank9' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0xF, descr => 'Addr: error_flag_16_bank7 InertialSensor1_Addr0xF' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Page: error_flag_16_bank7 InertialSensor1_Page2' },
        },
    },
    'InertialSensor2_ErrorFlag16_Bank9' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0xF, descr => 'Addr: error_flag_16_bank7 InertialSensor2_Addr0xF' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: error_flag_16_bank7 InertialSensor2_Page2' },
        },
    },

    #Temp1
    'YawSensor_TEMP1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x0, descr => 'Addr: Temp1 YawSensor_Addr0x0' },
            2.4 => { cmd => '72 - 00 - ' . $YawSensor_Page2,   descr => 'Page: Temp1 YawSensor_Page2' },
        },
    },
    'RollSensor_TEMP1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x0, descr => 'Addr: Temp1 RollSensor_Addr0x0' },
            2.4 => { cmd => '72 - 00 - ' . $RollSensor_Page2,   descr => 'Page: Temp1 RollSensor_Page2' },
        },
    },
    'PitchSensor_TEMP1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0x0, descr => 'Addr: Temp1 PitchSensor_Addr0x0' },
            2.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page2,   descr => 'Page: Temp1 PitchSensor_Page2' },
        },
    },
    'YawPlausiSensor_TEMP1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0x0, descr => 'Addr: Temp1 YawPlausiSensor_Addr0x0' },
            2.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page2,   descr => 'Page: Temp1 YawPlausiSensor_Page2' },
        },
    },
    'InertialSensor1_TEMP1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x0, descr => 'Addr: Temp1 InertialSensor1_Addr0x0' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Page: Temp1 InertialSensor1_Page2' },
        },
    },
    'InertialSensor1_TEMP2' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x9, descr => 'Addr: Temp2 InertialSensor1_Addr0x9' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page1,   descr => 'Page: Temp2 InertialSensor1_Page1' },
        },
    },
    'InertialSensor2_TEMP1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x0, descr => 'Addr: Temp1 InertialSensor2_Addr0x0' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Page: Temp1 InertialSensor2_Page2' },
        },
    },
    'InertialSensor2_TEMP2' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x9, descr => 'Addr: Temp2 InertialSensor2_Addr0x9' },
            2.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page1,   descr => 'Page: Temp2 InertialSensor2_Page1' },
        },
    },

    #QuadI (SMU Verification)
    'InertialSensor2_GYR3_QuadI' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x1, descr => 'Addr: GYR3_QuadI InertialSensor2_Addr0x1' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page1,   descr => 'Page: GYR3_QuadI InertialSensor2_Page1' },
        },
    },
    'InertialSensor2_GYR2_QuadI' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x0, descr => 'Addr: GYR2_QuadI InertialSensor2Addr0x0' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page1,   descr => 'Page: GYR2_QuadI InertialSensor2Page1' },
        },
    },
    'InertialSensor2_GYR1_QuadI' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x5, descr => 'Addr: GYR1_QuadI InertialSensor2_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page1,   descr => 'Page: GYR1_QuadI InertialSensor2_Page1' },
        },
    },
    'InertialSensor1_Rate1_QuadI' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x5, descr => 'Addr: Rate1_QuadI InertialSensor1_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page1,   descr => 'Page: Rate1_QuadI InertialSensor1_Page1' },
        },
    },
    'InertialSensor1_Rate2_QuadI' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x0, descr => 'Addr: Rate2_QuadI InertialSensor1_Addr0x0' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page1,   descr => 'Page: Rate2_QuadI InertialSensor1_Page1' },
        },
    },
    'InertialSensor2_Rate1_QuadI' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x5, descr => 'Addr: Rate1_QuadI InertialSensor2_Addr0x5' },
            1.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page1,   descr => 'Page: Rate1_QuadI InertialSensor2_Page1' },
        },
    },

    #Ctrl, Data Standard Frame
    #-------------------------
    'Invert_CRC_Bit' => {
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Ctrl: Invert_CRC_Bit' },
            2.8 => { cmd => '43 - 00 - 01 - 00 00 00 02', descr => 'Data: Invert_CRC_Bit' },
        },
    },
    'Invert_PAGE_Bit' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Ctrl: Invert_PAGE_Bit' },
            1.8 => { cmd => '43 - 00 - 01 - 00 10 00 00', descr => 'Data: Invert_PAGE_Bit' },
        },
    },
    'Invert_MID_Bit' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Ctrl: Invert_MID_Bit' },
            1.8 => { cmd => '43 - 00 - 01 - 00 40 00 00', descr => 'Data: Invert_MID_Bit' },
        },
    },
    'Invert_SD_Bit' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Ctrl: Invert_SD_Bit' },
            0.8 => { cmd => '43 - 00 - 01 - 02 00 00 00', descr => 'Data: Invert_SD_Bit' },
        },
    },
    'Set_SD_Bit' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Ctrl: Set_SD_Bit' },
            0.8 => { cmd => '43 - 00 - 01 - 02 00 00 00', descr => 'Data: Set_SD_Bit' },
        },
    },

    'RevisionID_Set_Data' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'Ctrl: RevisionID_Set_Data' },
            1.8 => { cmd => '43 - 00 - 01 - 00 00 88 88', descr => 'Data: RevisionID_Set_Data' },
        },
    },
    'EoC_Set_Data' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'Ctrl: EoC_Set_Data' },
            1.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Data: EoC_Set_Data' },
        },
    },
    'Set_Data_Serial0' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'Ctrl: Set_Data_Serial0' },
            1.8 => { cmd => '43 - 00 - 01 - 00 00 00 88', descr => 'Data: Set_Data_Serial0' },
        },
    },
    'Set_Data_Serial1' => {
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'Ctrl: Set_Data_Serial1' },
            2.8 => { cmd => '43 - 00 - 01 - 00 00 88 00', descr => 'Data: Set_Data_Serial1' },
        },
    },
    'Set_Data_Serial2_3bitSet' => {
        'CMD_sequence' => {
            3.7 => { cmd => '42 - 00 - 01 - 00 01 FF F8', descr => 'Ctrl: Set_Data_Serial2' },
            3.8 => { cmd => '43 - 00 - 01 - 00 01 C8 88', descr => 'Data: Set_Data_Serial2' },
        },
    },

    'Set_Data_Serial2' => {
        'CMD_sequence' => {
            3.7 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'Ctrl: Set_Data_Serial2' },
            3.8 => { cmd => '43 - 00 - 01 - 00 00 08 88', descr => 'Data: Set_Data_Serial2' },
        },
    },

    'Set_Data_Serial2_Ok' => {
        'CMD_sequence' => {
            3.7 => { cmd => '42 - 00 - 01 - 00 00 7F F8', descr => 'Ctrl: Set_Data_Serial2_Ok' },
            3.8 => { cmd => '43 - 00 - 01 - 00 00 08 88', descr => 'Data: Set_Data_Serial2_Ok' },
        },
    },

    'Set_Data_StoreEE_Value' => {
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'Ctrl: Set_Data_StoreEE_Value' },
            2.8 => { cmd => '43 - 00 - 01 - 00 04 21 08', descr => 'Data: Set_Data_StoreEE_Value' },
        },
    },

    'Set_Data_StoreEE_Value_For_Sensor_Channel' => {
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Ctrl: Set_Data_StoreEE_Value_For_Sensor_Channel' },
            2.8 => { cmd => '43 - 00 - 01 - 00 08 42 10', descr => 'Data: Set_Data_StoreEE_Value_For_Sensor_Channel' },
        },
    },

    'Set_F16_Init_Bit' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 02 - 00 00 00 10 - 00 00 00 10', descr => 'Ctrl: Set_F16_Init_Bit' },
            1.8 => { cmd => '43 - 00 - 02 - 00 00 00 10 - 00 00 00 10', descr => 'Data: Set_F16_Init_Bit' },
        },
    },

    # SMI7
    'SMI7_Set_ACC1_HF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC1_HF_StatHwScon_01, descr => 'Ctrl: SMI7_ACC1_HF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC1_HF_StatHwScon_01, descr => 'Data: SMI7_ACC1_HF_StatHwScon_01' },
        },
    },
    'SMI7_Set_ACC1_HF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC1_HF_StatHwScon_10, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC1_HF_StatHwScon_10, descr => 'Data: SMI7_ACC3_LF_StatHwScon_10' },
        },
    },
    'SMI7_Set_ACC1_HF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC1_HF_StatHwScon_11, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC1_HF_StatHwScon_11, descr => 'Data: SMI7_ACC3_LF_StatHwScon_11' },
        },
    },
    'SMI7_Set_ACC1_LF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC1_LF_StatHwScon_01, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC1_LF_StatHwScon_01, descr => 'Data: SMI7_ACC3_LF_StatHwScon_01' },
        },
    },
    'SMI7_Set_ACC1_LF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC1_LF_StatHwScon_10, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC1_LF_StatHwScon_10, descr => 'Data: SMI7_ACC3_LF_StatHwScon_10' },
        },
    },
    'SMI7_Set_ACC1_LF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC1_LF_StatHwScon_11, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC1_LF_StatHwScon_11, descr => 'Data: SMI7_ACC3_LF_StatHwScon_11' },
        },
    },
    'SMI7_Set_ACC2_HF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC2_HF_StatHwScon_01, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC2_HF_StatHwScon_01, descr => 'Data: SMI7_ACC3_LF_StatHwScon_01' },
        },
    },
    'SMI7_Set_ACC2_HF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC2_HF_StatHwScon_10, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC2_HF_StatHwScon_10, descr => 'Data: SMI7_ACC3_LF_StatHwScon_10' },
        },
    },
    'SMI7_Set_ACC2_HF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC2_HF_StatHwScon_11, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC2_HF_StatHwScon_11, descr => 'Data: SMI7_ACC3_LF_StatHwScon_11' },
        },
    },
    'SMI7_Set_ACC2_LF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC2_LF_StatHwScon_01, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC2_LF_StatHwScon_01, descr => 'Data: SMI7_ACC3_LF_StatHwScon_01' },
        },
    },
    'SMI7_Set_ACC2_LF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC2_LF_StatHwScon_10, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC2_LF_StatHwScon_10, descr => 'Data: SMI7_ACC3_LF_StatHwScon_10' },
        },
    },
    'SMI7_Set_ACC2_LF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_ACC2_LF_StatHwScon_11, descr => 'Ctrl: SMI7_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_ACC2_LF_StatHwScon_11, descr => 'Data: SMI7_ACC3_LF_StatHwScon_11' },
        },
    },
    'SMI7_Set_RATE_LF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_RATE_LF_StatHwScon_01, descr => 'Ctrl: SMI7_RATE_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_RATE_LF_StatHwScon_01, descr => 'Data: SMI7_RATE_LF_StatHwScon_01' },
        },
    },
    'SMI7_Set_RATE_LF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_RATE_LF_StatHwScon_10, descr => 'Ctrl: SMI7_RATE1_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_RATE_LF_StatHwScon_10, descr => 'Data: SMI7_RATE1_LF_StatHwScon_10' },
        },
    },
    'SMI7_Set_RATE_LF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI7_RATE_LF_StatHwScon_11, descr => 'Ctrl: SMI7_RATE1_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI7_RATE_LF_StatHwScon_11, descr => 'Data: SMI7_RATE1_LF_StatHwScon_11' },
        },
    },

    # SMI8
    'SMI8_Set_ACC1_HF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC1_HF_StatHwScon_01, descr => 'Ctrl: SMI8_ACC1_HF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC1_HF_StatHwScon_01, descr => 'Data: SMI8_ACC1_HF_StatHwScon_01' },
        },
    },
    'SMI8_Set_ACC1_LF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC1_LF_StatHwScon_01, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC1_LF_StatHwScon_01, descr => 'Data: SMI8_ACC3_LF_StatHwScon_01' },
        },
    },
    'SMI8_Set_ACC2_HF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC2_HF_StatHwScon_01, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC2_HF_StatHwScon_01, descr => 'Data: SMI8_ACC3_LF_StatHwScon_01' },
        },
    },
    'SMI8_Set_ACC2_LF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC2_LF_StatHwScon_01, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC2_LF_StatHwScon_01, descr => 'Data: SMI8_ACC3_LF_StatHwScon_01' },
        },
    },
    'SMI8_Set_ACC3_LF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC3_LF_StatHwScon_01, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC3_LF_StatHwScon_01, descr => 'Data: SMI8_ACC3_LF_StatHwScon_01' },
        },
    },
    'SMI8_Set_RATE1_LF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_RATE1_LF_StatHwScon_01, descr => 'Ctrl: SMI8_RATE1_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_RATE1_LF_StatHwScon_01, descr => 'Data: SMI8_RATE1_LF_StatHwScon_01' },
        },
    },
    'SMI8_Set_RATE2_LF_StatHwScon_01' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_RATE2_LF_StatHwScon_01, descr => 'Ctrl: SMI8_RATE1_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_RATE2_LF_StatHwScon_01, descr => 'Data: SMI8_RATE1_LF_StatHwScon_01' },
        },
    },
    #
    'SMI8_Set_ACC1_HF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC1_HF_StatHwScon_10, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC1_HF_StatHwScon_10, descr => 'Data: SMI8_ACC3_LF_StatHwScon_10' },
        },
    },
    'SMI8_Set_ACC1_LF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC1_LF_StatHwScon_10, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC1_LF_StatHwScon_10, descr => 'Data: SMI8_ACC3_LF_StatHwScon_10' },
        },
    },
    'SMI8_Set_ACC2_HF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC2_HF_StatHwScon_10, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC2_HF_StatHwScon_10, descr => 'Data: SMI8_ACC3_LF_StatHwScon_10' },
        },
    },
    'SMI8_Set_ACC2_LF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC2_LF_StatHwScon_10, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC2_LF_StatHwScon_10, descr => 'Data: SMI8_ACC3_LF_StatHwScon_10' },
        },
    },
    'SMI8_Set_ACC3_LF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC3_LF_StatHwScon_10, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC3_LF_StatHwScon_10, descr => 'Data: SMI8_ACC3_LF_StatHwScon_10' },
        },
    },
    'SMI8_Set_RATE1_LF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_RATE1_LF_StatHwScon_10, descr => 'Ctrl:SMI8_RATE1_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_RATE1_LF_StatHwScon_10, descr => 'Data: SMI8_RATE1_LF_StatHwScon_10' },
        },
    },
    'SMI8_Set_RATE2_LF_StatHwScon_10' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_RATE2_LF_StatHwScon_10, descr => 'Ctrl: SMI8_RATE1_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_RATE2_LF_StatHwScon_10, descr => 'Data: SMI8_RATE1_LF_StatHwScon_10' },
        },
    },
    #
    'SMI8_Set_ACC1_HF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC1_HF_StatHwScon_11, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC1_HF_StatHwScon_11, descr => 'Data: SMI8_ACC3_LF_StatHwScon_11' },
        },
    },
    'SMI8_Set_ACC1_LF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC1_LF_StatHwScon_11, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC1_LF_StatHwScon_11, descr => 'Data: SMI8_ACC3_LF_StatHwScon_11' },
        },
    },
    'SMI8_Set_ACC2_HF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC2_HF_StatHwScon_11, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC2_HF_StatHwScon_11, descr => 'Data: SMI8_ACC3_LF_StatHwScon_11' },
        },
    },
    'SMI8_Set_ACC2_LF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC2_LF_StatHwScon_11, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC2_LF_StatHwScon_11, descr => 'Data: SMI8_ACC3_LF_StatHwScon_11' },
        },
    },
    'SMI8_Set_ACC3_LF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_ACC3_LF_StatHwScon_11, descr => 'Ctrl: SMI8_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_ACC3_LF_StatHwScon_11, descr => 'Data: SMI8_ACC3_LF_StatHwScon_11' },
        },
    },
    'SMI8_Set_RATE1_LF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_RATE1_LF_StatHwScon_11, descr => 'Ctrl: SMI8_RATE1_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_RATE1_LF_StatHwScon_11, descr => 'Data: SMI8_RATE1_LF_StatHwScon_11' },
        },
    },
    'SMI8_Set_RATE2_LF_StatHwScon_11' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 00 - 01 - ' . $SMI8_RATE2_LF_StatHwScon_11, descr => 'Ctrl: SMI8_RATE1_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 00 - 01 - ' . $SMI8_RATE2_LF_StatHwScon_11, descr => 'Data: SMI8_RATE1_LF_StatHwScon_11' },
        },
    },

    #Mode, time and count
    #--------------------
    'Mode_InitTest_1x' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 01 - 10 00 00 01', descr => 'Mode: Mode_InitTest_1x' },
        },
    },
    'Mode_InitTest_2x' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 01 - 10 00 00 02', descr => 'Mode: Mode_InitTest_2x' },
        },
    },
    'Mode_InitTest_3x' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 01 - 10 00 00 03', descr => 'Mode: Mode_InitTest_3x' },
        },
    },
    'Mode_InitTest_4x' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 01 - 10 00 00 04', descr => 'Mode: Mode_InitTest_4x' },
        },
    },
    'Mode_InitTest_6x' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 01 - 10 00 00 06', descr => 'Mode: Mode_InitTest_6x' },
        },
    },
    'Mode_65ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 00 FF FF', descr => 'Mode: Mode_65ms' },
        },
    },
    'Mode_5ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 00 13 88', descr => 'Mode: Mode_5ms' },
        },
    },
    'Mode_2ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 00 07 D0', descr => 'Mode: Mode_2ms' },
        },
    },
    'Mode_20ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 00 4E 20', descr => 'Mode: Mode_20ms' },
        },
    },
    'Mode_16ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 00 3E 80', descr => 'Mode: Mode_16ms' },
        },
    },
    'Mode_10ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 00 27 10', descr => 'Mode: Mode_10ms' },
        },
    },
    'Mode_2ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 00 07 D0', descr => 'Mode: Mode_2ms' },
        },
    },
    'Mode_130ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 01 FB D0', descr => 'Mode: Mode_130ms' },
        },
    },
    'Mode_3200ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 30 D4 00', descr => 'Mode: Mode_3200ms' },
        },
    },
    'Mode_298ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 04 8C 10', descr => 'Mode: Mode_298ms' },
        },
    },
    'Mode_300ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 04 93 E0', descr => 'Mode: Mode_300ms' },
        },
    },
    'Mode_400ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 06 1A 80', descr => 'Mode: Mode_300ms' },
        },
    },
    'Mode_900ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 0D BB A0', descr => 'Mode: Mode_900ms' },
        },
    },
    'Mode_1000ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 0F 42 40', descr => 'Mode: Mode_1000ms' },
        },
    },
    'Mode_2000ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 1E 84 80', descr => 'Mode: Mode_2000ms' },
        },
    },
    'Mode_2998ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 2D BE F0', descr => 'Mode: Mode_2998ms' },
        },
    },
    'Mode_3000ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 2D C6 C0', descr => 'Mode: Mode_3000ms' },
        },
    },

    #-------------------
    'Mode_98ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 01 7F FE', descr => 'Mode: Mode_98ms' },
        },
    },
    'Mode_65ms33ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 02 - 40 00 FF FF - 40 00 7F FF', descr => 'Mode: Mode_65ms33ms' },
        },
    },
    'Mode_33ms5ms33ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 03 - 40 00 7F FF - 40 00 13 88 - 40 00 7F FF', descr => 'Mode: Mode_33ms5ms33ms' },
        },
    },
    'Mode_33ms5ms33ms_1500ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 40 00 7F FF - 40 00 13 88 - 40 00 7F FF - 40 16 E3 60', descr => 'Mode: Mode_33ms5ms33ms_1500ms' },
        },
    },
    'Mode_33ms5ms33ms_600_900ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 05 - 40 00 7F FF - 40 00 13 88 - 40 00 7F FF - 40 09 27 C0 - 40 0D BB A0', descr => 'Mode: Mode_33ms5ms33ms_600_900ms' },
        },
    },

    #---------------------
    'Mode_1500ms' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Mode: Mode_1500ms' },
        },
    },
    'Mode_10200ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 9B A3 C0', descr => 'Mode: Mode_10200ms' },
        },
    },
    'Mode_16000ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 F4 24 00', descr => 'Mode: Mode_16000ms' },
        },
    },
    'Mode_17000ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 10 36 64', descr => 'Mode: Mode_17000ms' },
        },
    },
    'Mode_2500ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 26 25 A0', descr => 'Mode: Mode_2500ms' },
        },
    },
    'Mode_7000ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 6A CF C0', descr => 'Mode: Mode_7000ms' },
        },
    },
    'Mode_1400ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 15 5C C0', descr => 'Mode: Mode_1400ms' },
        },
    },
    'Mode_1600ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 18 6A 00', descr => 'Mode: Mode_1600ms' },
        },
    },
    'Mode_1800ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 1B 77 40', descr => 'Mode: Mode_1800ms' },
        },
    },
    'Mode_9000ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 89 54 40', descr => 'Mode: Mode_9000ms' },
        },
    },
    'Mode_9950ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 97 D3 30', descr => 'Mode: Mode_9950ms' },
        },
    },
    'Mode_9900ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 97 0F E0', descr => 'Mode: Mode_9900ms' },
        },
    },
    'Mode_9850ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 96 4C 90', descr => 'Mode: Mode_9850ms' },
        },
    },
    'Mode_9990ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 98 6F 70', descr => 'Mode: Mode_9990ms' },
        },
    },
    'Mode_9980ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 98 48 60', descr => 'Mode: Mode_9980ms' },
        },
    },
    'Mode_9995ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 98 82 F8', descr => 'Mode: Mode_9995ms' },
        },
    },
    'Mode_11000ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 A7 D8 C0', descr => 'Mode: Mode_11000ms' },
        },
    },
    'Mode_14000ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 D5 9F 80', descr => 'Mode: Mode_14000ms' },
        },
    },
    'Mode_10000ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 98 96 80', descr => 'Mode: Mode_10000ms' },
        },
    },
    'Mode_10010ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 98 BD 90', descr => 'Mode: Mode_10001ms' },
        },
    },
    'Mode_10020ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 98 E4 A0', descr => 'Mode: Mode_10001ms' },
        },
    },
    'Mode_130ms_4x' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 40 01 FB D0 - 40 01 FB D0 - 40 01 FB D0 - 40 01 FB D0', descr => 'Mode: Mode_100ms_4x' },
        },
    },
    'Mode_3x250ms' => {
        'CMD_sequence' => {    #                    250 ms        250 ms        250 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 D0 90 - 40 03 D0 90 - 40 03 D0 90', descr => 'Mode: Mode_3x250ms' },
        },
    },
    'Mode_2x700ms' => {
        'CMD_sequence' => {    #                    700 ms        700 ms
            0.6 => { cmd => '41 - 00 - 02 - 40 0A AE 60 - 40 0A AE 60', descr => 'Mode: Mode_2x700ms' },
        },
    },
    'Mode_2x5500ms' => {
        'CMD_sequence' => {    #                 5500 ms        5500 ms
            0.6 => { cmd => '41 - 00 - 02 -40 53 EC 60 - 40 53 EC 60', descr => 'Mode: Mode_2x5500ms' },
        },
    },
    'Mode_20_2x700ms' => {
        'CMD_sequence' => {    #                    20		    700 ms        700 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 00 4E 20 - 40 0A AE 60 - 40 0A AE 60', descr => 'Mode: Mode_20_2x700ms' },
        },
    },
    'Mode_20_600_700ms' => {
        'CMD_sequence' => {    #                    20		    600 ms        700 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 00 4E 20 -40 09 27 C0 - 40 0A AE 60', descr => 'Mode: Mode_20_600_700ms' },
        },
    },
    'Mode_130_2x700ms' => {
        'CMD_sequence' => {    #                    130		    700 ms        700 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 01 FB D0 - 40 0A AE 60 - 40 0A AE 60', descr => 'Mode: Mode_130_2x700ms' },
        },
    },
    'Mode_100_2x700ms' => {
        'CMD_sequence' => {    #                    100		    700 ms        700 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 01 86 A0 - 40 0A AE 60 - 40 0A AE 60', descr => 'Mode: Mode_100_2x700ms' },
        },
    },
    'Mode_20_2x5500ms' => {
        'CMD_sequence' => {    #                    20		    5500 ms        5500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 00 4E 20 - 40 53 EC 60 - 40 53 EC 60', descr => 'Mode: Mode_2x5500ms' },
        },
    },
    'Mode_140_2x5500ms' => {
        'CMD_sequence' => {    #                    140		    5500 ms        5500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 02 22 E0 - 40 53 EC 60 - 40 53 EC 60', descr => 'Mode: Mode_2x5500ms' },
        },
    },
    'Mode_140_2x500ms' => {
        'CMD_sequence' => {    #                    140		    500 ms        500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 02 22 E0 - 40 07 A1 20 - 40 07 A1 20', descr => 'Mode: Mode_140_2x500ms' },
        },
    },
    'Mode_3x300ms' => {
        'CMD_sequence' => {    #                    300 ms        300 ms        300 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 04 93 E0 - 40 04 93 E0 - 40 04 93 E0', descr => 'Mode: Mode_3x300ms' },
        },
    },
    'Mode_3x1000ms' => {
        'CMD_sequence' => {    #                   1000 ms      1000 ms       1000 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 0F 42 40 - 40 0F 42 40 - 40 0F 42 40', descr => 'Mode: Mode_3x1000ms' },
        },
    },
    'Mode_5x250ms_20ms' => {
        'CMD_sequence' => {    #                  250 ms(2g)   25 ms(5.4g)   20 ms(2g)     250 ms(5.4g)  250 ms(2g)
            0.6 => { cmd => '41 - 00 - 05 - 40 03 D0 90 - 40 00 61 A8 - 40 00 4E 20 - 40 03 D0 90 - 40 03 D0 90', descr => 'Mode: Mode_3x250ms' },
        },
    },
    'Mode_5x250ms_40ms' => {
        'CMD_sequence' => {    #                  250 ms(2g)   25 ms(5.4g)   40 ms(2g)     250 ms(5.4g)  250 ms(2g)
            0.6 => { cmd => '41 - 00 - 05 - 40 03 D0 90 - 40 00 61 A8 - 40 00 9C 40 - 40 03 D0 90 - 40 03 D0 90', descr => 'Mode: Mode_3x250ms' },
        },
    },
    'Mode_3x25ms' => {
        'CMD_sequence' => {    #                    25 ms        25 ms        25 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 00 61 A8 - 40 00 61 A8 - 40 00 61 A8', descr => 'Mode: Mode_3x25ms' },
        },
    },
    'Mode_250_250_250_ms' => {
        'CMD_sequence' => {    #                    250 ms        250 ms        250 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 D0 90 - 40 03 D0 90 - 40 03 D0 90', descr => 'Mode: Mode_250_250_250_ms' },
        },
    },
    'Mode_500_900ms' => {
        'CMD_sequence' => {    #                    500 ms        900 ms
            0.6 => { cmd => '41 - 00 - 02 - 40 07 A1 20 - 40 0D BB A0', descr => 'Mode: Mode_500_900ms' },
        },
    },
    'Mode_600_900ms' => {
        'CMD_sequence' => {    #                    600 ms        900 ms
            0.6 => { cmd => '41 - 00 - 02 - 40 09 27 C0 - 40 0D BB A0', descr => 'Mode: Mode_600_900ms' },
        },
    },
    'Mode_10_600_900ms' => {
        'CMD_sequence' => {    #                    10ms		600 ms        900 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 00 27 10 - 40 09 27 C0 - 40 0D BB A0', descr => 'Mode: Mode_10_600_900ms' },
        },
    },
    'Mode_700_900ms' => {
        'CMD_sequence' => {    #                    700 ms        900 ms
            0.6 => { cmd => '41 - 00 - 02 - 40 0A EE 60 - 40 0D BB A0', descr => 'Mode: Mode_700_900ms' },
        },
    },
    'Mode_900_900ms' => {
        'CMD_sequence' => {    #                    900 ms        900 ms
            0.6 => { cmd => '41 - 00 - 02 - 40 0D BB A0 - 40 0D BB A0', descr => 'Mode: Mode_900_900ms' },
        },
    },
    'Mode_1200_600ms' => {
        'CMD_sequence' => {    #                    1200 ms        600 ms
            0.6 => { cmd => '41 - 00 - 02 - 40 12 4F 80 - 40 09 27 C0', descr => 'Mode: Mode_1200_600ms' },
        },
    },
    'Mode_250_17_250_ms' => {
        'CMD_sequence' => {    #                    250 ms        17 ms        250 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 D0 90 - 40 00 42 68 - 40 03 D0 90', descr => 'Mode: Mode_250_17_250_ms' },
        },
    },
    'Mode_250_16_250_ms' => {
        'CMD_sequence' => {    #                    250 ms        16 ms        250 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 D0 90 - 40 00 3E 80 - 40 03 D0 90', descr => 'Mode: Mode_250_16_250_ms' },
        },
    },
    'Mode_250_15_250_ms' => {
        'CMD_sequence' => {    #                    250 ms        15 ms        250 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 D0 90 - 40 00 3A 98 - 40 03 D0 90', descr => 'Mode: Mode_250_15_250_ms' },
        },
    },
    'Mode_250_14_250_ms' => {
        'CMD_sequence' => {    #                    250 ms        14 ms        250 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 D0 90 - 40 00 36 B0 - 40 03 D0 90', descr => 'Mode: Mode_250_14_250_ms' },
        },
    },

    'Mode_1_2_1_2ms' => {
        'CMD_sequence' => {    #                    1 ms        2 ms        1 ms  				2ms
            0.6 => { cmd => '41 - 00 - 04 - 40 00 03 E8 - 40 00 07 D0 - 40 00 03 E8 - 40 00 07 D0', descr => 'Mode: Mode_1_2_1_2ms' },
        },
    },
    'Mode_250_250_36_250_ms' => {
        'CMD_sequence' => {    #                   250 ms        250 ms        36 ms         250 ms
            0.6 => { cmd => '41 - 00 - 04 - 40 03 D0 90 - 40 03 D0 90 - 40 00 8C A0 - 40 03 D0 90', descr => 'Mode: Mode_250_250_36_250_ms' },
        },
    },

    'Mode_900_900_900_900ms' => {
        'CMD_sequence' => {    #                   900 ms        900 ms        900 ms         900 ms
            0.6 => { cmd => '41 - 00 - 04 - 40 0D BB A0 - 40 0D BB A0 - 40 0D BB A0 - 40 0D BB A0', descr => 'Mode: Mode_250_250_36_250_ms' },
        },
    },

    #---------------------
    'Mode_1x_200ms' => {
        'CMD_sequence' => {    #                                 200 ms
            0.6 => { cmd => '41 - 00 - 02 - 10 00 00 01 - 40 03 0D 40', descr => 'Mode: Mode_1x_200ms' },
        },
    },
    'Mode_Time_Infinite' => {
        'CMD_sequence' => {    #                  Infinite
            0.6 => { cmd => '41 - 00 - 01- 40 00 00 00', descr => 'Mode: Time infinit' },
        },
    },
    'Mode_150ms' => {
        'CMD_sequence' => {    #                                 150 ms
            0.6 => { cmd => '41 - 00 - 01 - 40 02 49 F0', descr => 'Mode: Mode_150ms' },
        },
    },

    'Mode_18ms' => {
        'CMD_sequence' => {    #                                 150 ms
            0.6 => { cmd => '41 - 00 - 01 - 40 00 46 50', descr => 'Mode: Mode_18ms' },
        },
    },

    'Mode_16ms' => {
        'CMD_sequence' => {    #                                 150 ms
            0.6 => { cmd => '41 - 00 - 01 - 40 00 3A 98', descr => 'Mode: Mode_16ms' },
        },
    },
    'Mode_1ms' => {
        'CMD_sequence' => {    #                                 150 ms
            0.6 => { cmd => '41 - 00 - 01 - 40 00 03 E8', descr => 'Mode: Mode_1ms' },
        },
    },

    #Mode, Ctrl, Data
    #-------------------- -------------------------
    'Set_Data_Cluster_Flags' => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 00 - 05 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Mode: SCM' },
            2.7 => { cmd => '42 - 00 - 05 - 00 00 07 F8 - 00 00 00 00 - 00 00 07 F8 - 00 00 00 00 - 00 00 07 F8', descr => 'Ctrl: Set_Data_Cluster_Flags' },
            2.8 => { cmd => '43 - 00 - 05 - 00 00 00 40 - 00 00 00 00 - 00 00 00 40 - 00 00 00 00 - 00 00 00 40', descr => 'Data: Set_Data_Cluster_Flags' },
        },
    },
    'Set_Data_Status_HW_SCON' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 05 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Mode: SCM' },
            1.7 => { cmd => '42 - 00 - 05 - 00 00 07 F8 - 00 00 00 00 - 00 00 07 F8 - 00 00 00 00 - 00 00 07 F8', descr => 'Ctrl: Set_Data_Status_HW_SCON' },
            1.8 => { cmd => '43 - 00 - 05 - 00 00 00 40 - 00 00 00 00 - 00 00 00 40 - 00 00 00 00 - 00 00 00 40', descr => 'Data: Set_Data_Status_HW_SCON' },
        },
    },
    'Set_Data_ErrorFlags' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 04 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Mode: SCM' },
            1.7 => { cmd => '42 - 00 - 04 - 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8', descr => 'Ctrl: Set_Data_ErrorFlags' },
            1.8 => { cmd => '43 - 00 - 04 - 00 00 00 10 - 00 00 00 80 - 00 00 00 40 - 00 00 00 10', descr => 'Data: Set_Data_ErrorFlags' },
        },
    },

    #***************************************************************************************
    'Set_Data_Read_Temp1' => {
        'CMD_sequence' => {

            # problem because of Temperature dummy read in Realtime Process
            #            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Mode: SCM' },
            #            0.7 => { cmd => '42 - 00 - 03 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8', descr => 'Ctrl: Set_Data_Read_Temp1' },
            #            0.8 => { cmd => '43 - 00 - 03 - 00 03 FF F8 - 00 04 7F F8 - 00 03 FF F8', descr => 'Data: Set_Data_Read_Temp1' },
            0.6 => { cmd => '41 - 00 - 02 - 40 01 86 A0 - 40 01 86 A0', descr => 'Mode: time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'Ctrl: Set_Data_Read_Temp1' },
            0.8 => { cmd => '43 - 00 - 02 - 00 03 FF F8 - 00 04 7F F8', descr => 'Data: Set_Data_Read_Temp1' },
        },
    },

    'Set_Data_Read_Temp2' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 02 - 40 01 86 A0 - 40 01 86 A0', descr => 'Mode: time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'Ctrl: Set_Data_Read_Temp2' },
            0.8 => { cmd => '43 - 00 - 02 - 00 03 FF F8 - 00 04 7F F8', descr => 'Data: Set_Data_Read_Temp2' },
        },
    },

    #************************************************************************************
    'Set_Data_SCON_MON' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 02 - 10 00 00 03 - 10 00 00 03', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_Sensor_Channel' },
            0.8 => { cmd => '43 - 00 - 02 - 00 00 01 00 - 00 00 02 00', descr => 'Data: Set_Data_Sensor_Channel' },
        },
    },

    #************************************************************************************
    'Set_Data_Sensor_Channel' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 09 - 10 00 00 0A - 10 00 00 0A - 10 00 00 0A - 10 00 00 0A - 10 00 00 0A - 10 00 00 0A - 10 00 00 0A - 10 00 00 0A - 10 00 00 0A', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 09 - 00 00 0F F0 - 00 00 0F F0 - 00 00 0F F0 - 00 00 0F F0 - 00 00 0F F0 - 00 00 0F F0 - 00 00 0F F0 - 00 00 0F F0 - 00 00 0F F0', descr => 'Ctrl: Set_Data_Sensor_Channel' },
            0.8 => { cmd => '43 - 00 - 09 - 00 00 04 00 - 00 00 08 00 - 00 00 04 00 - 00 00 08 00 - 00 00 04 00 - 00 00 08 00 - 00 00 04 00 - 00 00 08 00 - 00 00 04 00', descr => 'Data: Set_Data_Sensor_Channel' },
        },
    },

    #Initial absolute offset test (ax, ay, az)
    #***************************************************************************************
    'Set_Data_AccXLgChl_InitAbsOffset_Test_T3' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccXLgChl_InitAbsOffset_Test_T3' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 01 97 40 - 00 01 98 40 - 00 00 00 00', descr => 'Data: Set_Data_AccXLgChl_InitAbsOffset_Test_T3' },
        },
    },

    #***************************************************************************************
    'Set_Data_AccXLgChl_InitAbsOffset_Test_T2' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccXLgChl_InitAbsOffset_Test_T2' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 01 97 40 - 00 00 05 40 - 00 00 00 00', descr => 'Data: Set_Data_AccXLgChl_InitAbsOffset_Test_T2' },
        },
    },

    #***************************************************************************************
    'Set_Data_AccXLgChl_InitAbsOffset_Test_T1' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccXLgChl_InitAbsOffset_Test_T1' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 00 05 40 - 00 00 04 40 - 00 00 00 00', descr => 'Data: Set_Data_AccXLgChl_InitAbsOffset_Test_T1' },
        },
    },

    #***************************************************************************************
    'Set_Data_AccYLgChl_InitAbsOffset_Test_T3' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccYLgChl_InitAbsOffset_Test_T3' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 01 97 40 - 00 01 98 40 - 00 00 00 00', descr => 'Data: Set_Data_AccYLgChl_InitAbsOffset_Test_T3' },
        },
    },

    #***************************************************************************************
    'Set_Data_AccYLgChl_InitAbsOffset_Test_T2' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccYLgChl_InitAbsOffset_Test_T2' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 01 97 40 - 00 00 05 40 - 00 00 00 00', descr => 'Data: Set_Data_AccYLgChl_InitAbsOffset_Test_T2' },
        },
    },

    #***************************************************************************************
    'Set_Data_AccYLgChl_InitAbsOffset_Test_T1' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccYLgChl_InitAbsOffset_Test_T1' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 00 05 40 - 00 00 04 40 - 00 00 00 00', descr => 'Data: Set_Data_AccYLgChl_InitAbsOffset_Test_T1' },
        },
    },

    #***************************************************************************************
    'Set_Data_AccZLgChl_InitAbsOffset_Test_T3' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccZLgChl_InitAbsOffset_Test_T3' },
            0.8 => { cmd => '43 - 00 - 04 - 00 04 C2 C0 - 00 04 C3 C0 - 00 04 C4 C0 - 00 00 00 00', descr => 'Data: Set_Data_AccZLgChl_InitAbsOffset_Test_T3' },
        },
    },

    #***************************************************************************************
    'Set_Data_AccZLgChl_InitAbsOffset_Test_T2' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccZLgChl_InitAbsOffset_Test_T2' },
            0.8 => { cmd => '43 - 00 - 04 - 00 04 C2 C0 - 00 04 C3 C0 - 00 00 01 C0 - 00 00 00 00', descr => 'Data: Set_Data_AccZLgChl_InitAbsOffset_Test_T2' },
        },
    },

    #***************************************************************************************
    'Set_Data_AccZLgChl_InitAbsOffset_Test_T1' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccZLgChl_InitAbsOffset_Test_T1' },
            0.8 => { cmd => '43 - 00 - 04 - 00 04 C3 C0 - 00 00 02 C0 - 00 00 01 C0 - 00 00 00 00', descr => 'Data: Set_Data_AccZLgChl_InitAbsOffset_Test_T1' },
        },
    },

    #************************************************************************************
    'Set_Data_AccXLgChl_Relative_Offset_Test_T3_InertialSensor2' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 07 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 01 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 07 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccXLgChl_Relative_Offset_Test_T3' },
            0.8 => { cmd => '43 - 00 - 07 - 00 01 32 40 - 00 01 3E C0 - 00 01 32 40 - 00 01 3E C0 - 00 01 32 40 - 00 01 3E C0 - 00 00 00 00', descr => 'Data: Set_Data_AccXLgChl_Relative_Offset_Test_T3' },
        },
    },

    #************************************************************************************
    'Set_Data_AccYLgChl_Relative_Offset_Test_T3_InertialSensor2' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 07 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 01 FF', descr => 'Mode: SCM' },
            1.7 => { cmd => '42 - 00 - 07 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccYLgChl_Relative_Offset_Test_T3' },
            1.8 => { cmd => '43 - 00 - 07 - 00 01 02 00 - 00 01 04 00 - 00 01 02 00 - 00 01 04 00 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Data: Set_Data_AccYLgChl_Relative_Offset_Test_T3' },
        },
    },

    #************************************************************************************
    'Set_Data_AccZLgChl_Relative_Offset_Test_T3_InertialSensor2' => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 00 - 07 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 01 FF', descr => 'Mode: SCM' },
            2.7 => { cmd => '42 - 00 - 07 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccZLgChl_Relative_Offset_Test_T3' },
            2.8 => { cmd => '43 - 00 - 07 - 00 01 34 80 - 00 01 38 80 - 00 01 34 80 - 00 01 38 80 - 00 01 34 80 - 00 01 38 80 - 00 00 00 00', descr => 'Data: Set_Data_AccZLgChl_Relative_Offset_Test_T3' },
        },
    },

    #************************************************************************************
    'Set_Data_AccXLgChl_Relative_Offset_Test_T2_InertialSensor2' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 03 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccXLgChl_Relative_Offset_Test_T2' },
            0.8 => { cmd => '43 - 00 - 05 - 00 01 02 00 - 00 01 04 00 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Data: Set_Data_AccXLgChl_Relative_Offset_Test_T2' },
        },
    },

    #************************************************************************************
    'Set_Data_AccYLgChl_Relative_Offset_Test_T2_InertialSensor2' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 05 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 03 FF', descr => 'Mode: SCM' },
            1.7 => { cmd => '42 - 00 - 05 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccXLgChl_Relative_Offset_Test_T2' },
            1.8 => { cmd => '43 - 00 - 05 - 00 01 02 00 - 00 01 04 00 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Data: Set_Data_AccXLgChl_Relative_Offset_Test_T2' },
        },
    },

    #************************************************************************************
    'Set_Data_AccZLgChl_Relative_Offset_Test_T2_InertialSensor2' => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 00 - 05 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 03 FF', descr => 'Mode: SCM' },
            2.7 => { cmd => '42 - 00 - 05 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccZLgChl_Relative_Offset_Test_T2' },
            2.8 => { cmd => '43 - 00 - 05 - 00 01 34 80 - 00 01 38 80 - 00 01 34 80 - 00 01 38 80 - 00 01 34 80', descr => 'Data: Set_Data_AccZLgChl_Relative_Offset_Test_T2' },
        },
    },

    #************************************************************************************
    'Set_Data_AccXLgChl_Relative_Offset_Test_T1_InertialSensor2' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 FF - 10 00 00 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccXLgChl_Relative_Offset_Test_T1' },
            0.8 => { cmd => '43 - 00 - 03 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Data: Set_Data_AccXLgChl_Relative_Offset_Test_T1' },
        },
    },

    #************************************************************************************
    'Set_Data_AccYLgChl_Relative_Offset_Test_T1_InertialSensor2' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 03 - 10 00 00 FF - 10 00 00 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            1.7 => { cmd => '42 - 00 - 03 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccYLgChl_Relative_Offset_Test_T1' },
            1.8 => { cmd => '43 - 00 - 03 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Data: Set_Data_AccYLgChl_Relative_Offset_Test_T1' },
        },
    },

    #************************************************************************************
    'Set_Data_AccZLgChl_Relative_Offset_Test_T1_InertialSensor2' => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 00 - 03 - 10 00 00 FF - 10 00 00 FF - 10 00 05 FF', descr => 'Mode: SCM' },
            2.7 => { cmd => '42 - 00 - 03 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF F0', descr => 'Ctrl: Set_Data_AccZLgChl_Relative_Offset_Test_T1' },
            2.8 => { cmd => '43 - 00 - 03 - 00 01 34 80 - 00 01 38 80 - 00 01 34 80', descr => 'Data: Set_Data_AccZLgChl_Relative_Offset_Test_T1' },
        },
    },

    'Cluster_Selection_During_Init' => {
        'CMD_sequence' => {

            # Configure SPI manipulation for
            0.1 => { cmd => '31 - 01 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 CS for SMI9' },
            0.2 => { cmd => '32 - 01 - ' . $SMI_StandardMask,        descr => 'Set SPI SMI_StandardMask' },
            0.3 => { cmd => '33 - 01 - ' . $InertialSensor2_Addr0x5, descr => 'Addr: error_group_out to InertialSensor2_Addr0x5' },
            0.4 => { cmd => '72 - 01 - ' . $InertialSensor2_Page2,   descr => 'Page: error_group_out InertialSensor2_Page2' },

            # Manipulate Data
            0.5 => { cmd => '41 - 01 - 01 - 10 00 00 03', descr => 'Mode: Mode_InitTest_3x' },
            0.6 => { cmd => '42 - 01 - 01 - 00 07 FF F8', descr => 'set Contol' },
            0.7 => { cmd => '43 - 01 - 01 - 00 00 91 A0', descr => 'set Data' },

            #Pritrigger

            1.1 => { cmd => '61 - 01 - ' . $SMI_SPI1_CS3, descr => 'PreTrig0: SMI_SPI1_CS3' },
            1.2 => { cmd => '62 - 01 - FF FF FF FF',      descr => 'PreTrig0: FF FF FF FF' },
            1.3 => { cmd => '63 - 01 - 0D 80 00 1C',      descr => 'Pattern: InertialSensor2_ErrorFlag16_Bank5' },
            1.4 => { cmd => '64 - 01 - 00 00 03 E8',      descr => 'PreTrig0 Time: 1ms' },
            1.5 => { cmd => '65 - 01 - 00 00 00 02',      descr => 'Configure PreTrigger_1' },
        },
    },

    'PreTrig0_InertialSensor2_ErrorFlag16_Bank5_For_1ms' => {
        'CMD_sequence' => {
            0.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'PreTrig0: SMI_SPI1_CS3' },
            0.2 => { cmd => '62 - 00 - FF FF FF FF',      descr => 'PreTrig0: FF FF FF FF' },
            0.3 => { cmd => '63 - 00 - 0D 80 00 1C',      descr => 'Pattern: InertialSensor2_ErrorFlag16_Bank5' },
            0.4 => { cmd => '64 - 00 - 00 00 03 E8',      descr => 'PreTrig0 Time: 1ms' },
        },
    },

    'Set_MData_0x1234' => {
        'CMD_sequence' => {
            0.6 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'set Contol' },
            0.7 => { cmd => '43 - 00 - 01 - 00 00 91 A0', descr => 'set Data' },
        },
    },
    'Set_MData_0x0011' => {
        'CMD_sequence' => {
            0.6 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'set Contol' },
            0.7 => { cmd => '43 - 00 - 01 - 00 00 00 88', descr => 'set Data' },
        },
    },
    'Set_MData_0x1100' => {
        'CMD_sequence' => {
            0.6 => { cmd => '42 - 00 - 01 - 00 07 FF F8', descr => 'set Contol' },
            0.7 => { cmd => '43 - 00 - 01 - 00 00 08 80', descr => 'set Data' },
        },
    },
    'Set_MData_0x1234_0x0011' => {
        'CMD_sequence' => {
            0.6 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'set Contol' },
            0.7 => { cmd => '43 - 00 - 02 - 00 00 91 A0 - 00 00 00 88', descr => 'set Data' },
        },
    },
    'Mode_InitTest_1x_1x' => {
        'CMD_sequence' => {
            0.4 => { cmd => '41 - 00 - 02 - 10 00 00 01 - 10 00 00 01', descr => 'Mode: Mode_InitTest_1x' },
        },
    },
    'Set_MData_0x1234_0x1100' => {
        'CMD_sequence' => {
            0.6 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'set Contol' },
            0.7 => { cmd => '43 - 00 - 02 - 00 00 91 A0 - 00 00 08 80', descr => 'set Data' },
        },
    },
    'Mode_InitTest_2x_1000x_50x' => {
        'CMD_sequence' => {
            0.4 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 10 00 03 E8 - 10 00 00 32', descr => 'Mode: Mode_InitTest_2x_1000x_50x' },
        },
    },
    'Invert_SID_Bit2_2x_1000x_50x' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 00 - 00 00 00 00 - 00 00 00 00', descr => 'Ctrl: Invert_SID_Bit2_2x_1000x_50x' },
            0.8 => { cmd => '43 - 00 - 03 - 00 40 00 00 - 00 00 00 00 - 00 40 00 00', descr => 'Data: Invert_SID_Bit2_2x_1000x_50x' },
        },
    },

    #***************************************************************************************
    #PreTrigger
    #----------
    'PreTrig0_Selection' => {
        'CMD_sequence' => {
            1.5 => { cmd => '65 - 00 - ' . $PreTrigger_0, descr => 'Configure PreTrigger_0' },
        },
    },
    'PreTrig1_Selection' => {
        'CMD_sequence' => {
            1.5 => { cmd => '65 - 00 - ' . $PreTrigger_1, descr => 'Configure PreTrigger_1' },
        },
    },
    'PreTrig0_Mask_OTPTest_ParID' => {
        'CMD_sequence' => {
            0.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'PreTrig0: SMI7_SPI1_CS3' },
            0.2 => { cmd => '62 - 00 - FF C0 01 E0',      descr => 'PreTrig0: FF C0 01 E0' },
        },
    },
    'PreTrig0_Time_OTPTest_ParID' => {
        'CMD_sequence' => {
            0.4 => { cmd => '64 - 00 - 00 00 0B B8', descr => 'PreTrig0: 00 00 0B B8, 3ms' },
        },
    },
    'PreTrig0_Time_OTPTest_PageSwitch' => {
        'CMD_sequence' => {
            0.4 => { cmd => '64 - 00 - 00 00 C3 50', descr => 'PreTrig0: 00 00 C3 50, 50ms' },
        },
    },
    'PreTrig0_Time_1520ms' => {
        'CMD_sequence' => {
            0.4 => { cmd => '64 - 00 - 00 17 31 80', descr => 'PreTrig0: 00 00 0B B8, 1520ms' },
        },
    },
    'PreTrig0_Time_1480ms' => {
        'CMD_sequence' => {
            0.4 => { cmd => '64 - 00 - 00 16 95 40', descr => 'PreTrig0: 00 00 0B B8, 1480ms' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_ParID0' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 C0 00 00', descr => 'Pattern: PreTrig0_InertialSensor1_OTPTest_ParID0' },
        },
    },
    'PreTrig0_InertialSensor2_OTPTest_ParID0' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 88 C0 00 00', descr => 'Pattern: PreTrig0_InertialSensor2_OTPTest_ParID0' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_ParID1' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 C0 00 20', descr => 'Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_ParID2' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 C0 00 40', descr => 'Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_ParID3' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 C0 00 60', descr => 'Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_ParID4' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 C0 00 80', descr => 'Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_ParID5' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 C0 00 A0', descr => 'Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_ParID6' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 C0 00 C0', descr => 'Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_ParID7' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 C0 00 E0', descr => 'Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_ParID8' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 C0 01 00', descr => 'Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_ParID9' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 C0 01 20', descr => 'Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },
    },
    'PreTrig0_Mask_OTPTest_PageSwitch' => {
        'CMD_sequence' => {
            0.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'PreTrig0: SMI7_SPI1_CS3' },
            0.2 => { cmd => '62 - 00 - FF FF FF E0',      descr => 'PreTrig0: FF FF FF E0' },
        },
    },
    'PreTrig0_InertialSensor1_OTPTest_PageSwitch' => {
        'CMD_sequence' => {
            0.3 => { cmd => '63 - 00 - 48 10 00 00', descr => 'Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },
    },

    'Set_Data_Cluster_Flags' => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 00 - 05 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Mode: SCM' },
            2.7 => { cmd => '42 - 00 - 05 - 00 00 07 F8 - 00 00 00 00 - 00 00 07 F8 - 00 00 00 00 - 00 00 07 F8', descr => 'Ctrl: Set_Data_Cluster_Flags' },
            2.8 => { cmd => '43 - 00 - 05 - 00 00 00 40 - 00 00 00 00 - 00 00 00 40 - 00 00 00 00 - 00 00 00 40', descr => 'Data: Set_Data_Cluster_Flags' },
        },
    },

    'Set_Time_950_15ms_10sec' => {
        'CMD_sequence' => {    #950ms		  #15ms			#950ms		  #15ms
            0.3 => {
                cmd =>
'41 - 00 - 16 - 40 0E 7E F0 - 40 00 3A 98 - 40 0E 7E F0 - 40 00 3A 98 - 40 0E 7E F0 - 40 00 3A 98 - 40 0E 7E F0 - 40 00 3A 98 - 40 0E 7E F0 - 40 00 3A 98 - 40 0E 7E F0 - 40 00 3A 98 - 40 0E 7E F0 - 40 00 3A 98 - 40 0E 7E F0 - 40 00 3A 98 - 40 0E 7E F0 - 40 00 3A 98 - 40 0E 7E F0 - 40 00 3A 98 - 40 0E 7E F0 - 40 00 3A 98 ',
                descr => 'Mode: Set_Time_950_15ms_10sec'
            },
        },
    },

    'Set_data_+5.2g_+1g' => {
        'CMD_sequence' => {    #+5.2g			#+1g
            0.3 => {
                cmd =>
'42 - 00 - 16 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 ',
                descr => 'Ctrl: Set_data_+5.2g_+1g'
            },
            0.4 => {
                cmd =>
'43 - 00 - 16 - 00 06 59 00 - 00 01 38 80 - 00 06 59 00 - 00 01 38 80 - 00 06 59 00 - 00 01 38 80 - 00 06 59 00 - 00 01 38 80 - 00 06 59 00 - 00 01 38 80 - 00 06 59 00 - 00 01 38 80 - 00 06 59 00 - 00 01 38 80 - 00 06 59 00 - 00 01 38 80 - 00 06 59 00 - 00 01 38 80 - 00 06 59 00 - 00 01 38 80 - 00 06 59 00 - 00 01 38 80 ',
                descr => 'Data: Set_data_+5.2g_+1g'
            },
        },
    },

    'Set_data_-5.2g_-1g' => {
        'CMD_sequence' => {    #-5.2g			#-1g
            0.3 => {
                cmd =>
'42 - 00 - 16 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 ',
                descr => 'Ctrl: Set_data_-5.2g_-1g'
            },
            0.4 => {
                cmd =>
'43 - 00 - 16 - 00 09 A7 00 - 00 0E C7 80 - 00 09 A7 00 - 00 0E C7 80 - 00 09 A7 00 - 00 0E C7 80 - 00 09 A7 00 - 00 0E C7 80 - 00 09 A7 00 - 00 0E C7 80 - 00 09 A7 00 - 00 0E C7 80 - 00 09 A7 00 - 00 0E C7 80 - 00 09 A7 00 - 00 0E C7 80 - 00 09 A7 00 - 00 0E C7 80 - 00 09 A7 00 - 00 0E C7 80 - 00 09 A7 00 - 00 0E C7 80 ',
                descr => 'Data: Set_data_-5.2g_-1g'
            },
        },
    },

    'Set_data_+320_+10grad/s' => {
        'CMD_sequence' => {    #+320grad/s			#+10grad/s
            0.3 => {
                cmd =>
'42 - 00 - 16 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 ',
                descr => 'Ctrl: Set_data_+320_+10grad/s'
            },
            0.4 => {
                cmd =>
'43 - 00 - 16 - 00 07 D0 00 - 00 00 3E 80 - 00 07 D0 00 - 00 00 3E 80 - 00 07 D0 00 - 00 00 3E 80 - 00 07 D0 00 - 00 00 3E 80 - 00 07 D0 00 - 00 00 3E 80 - 00 07 D0 00 - 00 00 3E 80 - 00 07 D0 00 - 00 00 3E 80 - 00 07 D0 00 - 00 00 3E 80 - 00 07 D0 00 - 00 00 3E 80 - 00 07 D0 00 - 00 00 3E 80 - 00 07 D0 00 - 00 00 3E 80 ',
                descr => 'Data: Set_data_+320_+10grad/s'
            },
        },
    },

    'Set_data_-320_-5grad/s' => {
        'CMD_sequence' => {    #-320grad/s			#-5grad/s
            0.3 => {
                cmd =>
'42 - 00 - 16 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 ',
                descr => 'Ctrl: Set_data_-320_-5grad/s'
            },

#0.4 => { cmd => '43 - 00 - 16 - 00 08 30 00 - 00 0F C1 80 - 00 08 30 00 - 00 0F C1 80 - 00 08 30 00 - 00 0F C1 80 - 00 08 30 00 - 00 0F C1 80 - 00 08 30 00 - 00 0F C1 80 - 00 08 30 00 - 00 0F C1 80 - 00 08 30 00 - 00 0F C1 80 - 00 08 30 00 - 00 0F C1 80 - 00 08 30 00 - 00 0F C1 80 - 00 08 30 00 - 00 0F C1 80 - 00 08 30 00 - 00 0F C1 80 ',	descr => 'Data: Set_data_-320_-10grad/s' },
            0.4 => {
                cmd =>
'43 - 00 - 16 - 00 08 30 00 - 00 0F E0 C0 - 00 08 30 00 - 00 0F E0 C0 - 00 08 30 00 - 00 0F E0 C0 - 00 08 30 00 - 00 0F E0 C0 - 00 08 30 00 - 00 0F E0 C0 - 00 08 30 00 - 00 0F E0 C0 - 00 08 30 00 - 00 0F E0 C0 - 00 08 30 00 - 00 0F E0 C0 - 00 08 30 00 - 00 0F E0 C0 - 00 08 30 00 - 00 0F E0 C0 - 00 08 30 00 - 00 0F E0 C0 ',
                descr => 'Data: Set_data_-320_-5grad/s'
            },
        },
    },

    #***************************************************************************************
    # SMI7_SensorMask    = FF 00 00 00
    # YawRateLfPlausiChl = 13 00 00 00
    # in order to avoid that AUTO_CALIB command
    # is manipulated instead of YawRateLfPlausiChl.
    # For the first 6 bits YawRateLfPlausiChl is the same as AUTO_CALIB command.
    'YawRateLfPlausiChl_CN_Flag_Ini_Test_3x' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - FF 00 00 00',      descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - 13 00 00 00',      descr => 'Set SPI Pattern for command SMI7xx_ROLL:20_TEMP1:MOSI' },

            # Configure FIFOs for SMI7xx
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 03', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },
        },
    },

    #***************************************************************************************
    # SMI7_SensorMask    = FF 00 00 00
    # YawRateLfPlausiChl = 13 00 00 00
    # in order to avoid that AUTO_CALIB command
    # is manipulated instead of YawRateLfPlausiChl.
    # For the first 6 bits YawRateLfPlausiChl is the same as AUTO_CALIB command.
    'YawRateLfPlausiChl_CN_Flag_Ini_Test_2x' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - FF 00 00 00',      descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - 13 00 00 00',      descr => 'Set SPI Pattern for command SMI7xx_ROLL:20_TEMP1:MOSI' },

            # Configure FIFOs for SMI7xx
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 02', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },
        },
    },

    # Do not Test OE bit
    #***************************************************************************************
    'InertialSensor1_OE_Bit_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            1.1 => { cmd => '31 - 01 - ' . $SMI_SPI1_CS3,            descr => 'Unit_1: Set SPI1 and CS for SMI7xx YawSensor' },
            1.2 => { cmd => '32 - 01 - ' . $SMI_SensorMask,          descr => 'Unit_1: Set SPI Mask' },
            1.3 => { cmd => '33 - 01 - ' . $InertialSensor1_Addr0x3, descr => 'Unit_1: Select YawSensor Adr_3' },
            1.4 => { cmd => '72 - 01 - ' . $InertialSensor1_Page4,   descr => 'Unit_1: Select YawSensor Page_4' },

            # Manipulate OE-flag
            1.6 => { cmd => '41 - 01 - 01 - 10 00 00 03', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 04 00 00 00', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 04 00 00 00', descr => 'Unit_1: Write FIFO data' },
        },
    },

    #***************************************************************************************
    'InertialSensor2_OE_Bit_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            1.1 => { cmd => '31 - 01 - ' . $SMI_SPI1_CS3,            descr => 'Unit_1: Set SPI1 and CS for SMI7xx YawSensor' },
            1.2 => { cmd => '32 - 01 - ' . $SMI_SensorMask,          descr => 'Unit_1: Set SPI Mask' },
            1.3 => { cmd => '33 - 01 - ' . $InertialSensor2_Addr0x3, descr => 'Unit_1: Select YawSensor Adr_3' },
            1.4 => { cmd => '72 - 01 - ' . $InertialSensor2_Page4,   descr => 'Unit_1: Select YawSensor Page_4' },

            # Manipulate OE-flag
            1.6 => { cmd => '41 - 01 - 01 - 10 00 00 03', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 04 00 00 00', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 04 00 00 00', descr => 'Unit_1: Write FIFO data' },
        },
    },

    #***************************************************************************************
    'YawRateLfChl_OE_Bit_Test' => {
        'CMD_sequence' => {

            # Configure SPI manipulation for YawRateLfChl
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,   descr => 'Set SPI1 CS for SMI7' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_SensorMask, descr => 'Set SPI SensorMask' },
            0.3 => { cmd => '33 - 00 - ' . $YawRateLfChl,   descr => 'Set trigger to YawRateLfChl' },

            # Manipulate OE-flag
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 1F', descr => 'SCM-mode 31 manipulations' },
            0.7 => { cmd => '42 - 00 - 01 - 04 00 00 00', descr => 'set OE-bit' },
            0.8 => { cmd => '43 - 00 - 01 - 04 00 00 00', descr => 'set OE-bit' },
        },
    },

    #***************************************************************************************
    'PitchRateLfChl_OE_Bit_Test' => {
        'CMD_sequence' => {

            # Configure SPI manipulation for YawRateLfChl
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,   descr => 'Set SPI1 CS for SMI7' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_SensorMask, descr => 'Set SPI SensorMask' },
            0.3 => { cmd => '33 - 00 - ' . $PitchRateLfChl, descr => 'Set trigger to YawRateLfChl' },

            # Manipulate OE-flag
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 1F', descr => 'SCM-mode 31 manipulations' },
            0.7 => { cmd => '42 - 00 - 01 - 04 00 00 00', descr => 'set OE-bit' },
            0.8 => { cmd => '43 - 00 - 01 - 04 00 00 00', descr => 'set OE-bit' },
        },
    },

    #-------------------------------------------------------------------------------------
    #	                            SMI7 OTP content Test
    #-------------------------------------------------------------------------------------

    # Common use for SMI7 and SMI8 OTP content Test
    #*************************************************************************************
    'OTP_InitTest_3x' => {
        'CMD_sequence' => {

            # Configure FIFOs for SMI7xx
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 03', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },
        },
    },

    # Common use for SMI7 and SMI8 OTP content Test
    #*************************************************************************************
    'OTP_InitTest_2x' => {
        'CMD_sequence' => {

            # Configure FIFOs for SMI7xx
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 2' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG0_Test1' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Select SPI1 and CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask for SMI7xx Module Command' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x4, descr => 'Set SPI Pattern to Adr=0x4' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Select SMI7xx Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set trigger_1' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 07 F8 00', descr => 'Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 10 00', descr => 'Configure data-register' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 38',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG0_Test2_pass' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Select SPI1 and CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask for SMI7xx Module Command' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x4, descr => 'Set SPI Pattern to Adr=0x4' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Select SMI7xx Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set trigger_1' },

            # Configure FIFOs for SMI7xx					# 95 ms
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 73 18 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 20 00 - 00 00 20 00 - 00 00 10 00', descr => 'Configure data-register' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 38',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 01 9A 28',      descr => 'PT Time: 105 ms' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG0_Test3_pass' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx RollSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x4, descr => 'Set SPI Pattern for command SMI710 Adr=0x5' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set trigger_1' },

            # Configure FIFOs for SMI7xx				    # 95 ms
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 73 18 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 30 00 - 00 00 30 00 - 00 00 10 00', descr => 'Configure data-register' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 38',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 01 9A 28',      descr => 'PT Time: 105 ms' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG0_Test2_fail' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Select SPI1 and CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask for SMI7xx Module Command' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x4, descr => 'Set SPI Pattern to Adr=0x4' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Select SMI7xx Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set trigger_1' },

            # Configure FIFOs for SMI7xx					# 305 ms
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 04 A7 68 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },

            #                                                              105 ms
            #            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 9A 28 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 20 00 - 00 00 20 00 - 00 00 10 00', descr => 'Configure data-register' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 38',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 04 CE 78',      descr => 'PT Time: 315 ms' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG0_Test3_fail' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx RollSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x4, descr => 'Set SPI Pattern for command SMI710 Adr=0x5' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set trigger_1' },

            # Configure FIFOs for SMI7xx				    # 305 ms
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 04 A7 68 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },

            #                                                              105 ms
            #            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 9A 28 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 30 00 - 00 00 30 00 - 00 00 10 00', descr => 'Configure data-register' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 38',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 04 CE 78',      descr => 'PT Time: 315 ms' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG1_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx RollSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x5, descr => 'Set SPI Pattern for command SMI710 Adr=0x5' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set trigger_1' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 38',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x6, descr => 'Set SPI Pattern for command SMI710 Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set trigger_1' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 38',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG3_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx RollSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x7, descr => 'Set SPI Pattern for command SMI710 Adr=0x7' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set trigger_1' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 80', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 38',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'RollSensor_OTPcontent_B0C3_OREG0_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x4, descr => 'Set SPI Pattern for command Roll Adr=0x5' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set trigger_1' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 07 F8 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 10 00', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 60',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'RollSensor_OTPcontent_B0C1_OREG0_Test2_pass' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Select SPI1 and CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask for SMI7xx Module Command' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x4, descr => 'Set SPI Pattern to Adr=0x4' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Select SMI7xx Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'PreTrigger_0' },

            # Configure FIFOs for SMI7xx					# 95 ms
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 73 18 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 20 00 - 00 00 20 00 - 00 00 10 00', descr => 'Configure data-register' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 60',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 01 9A 28',      descr => 'PT Time: 105 ms' },
        },
    },

    #***************************************************************************************
    'RollSensor_OTPcontent_B0C1_OREG0_Test3_pass' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx RollSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x4, descr => 'Set SPI Pattern for command SMI710 Adr=0x5' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx				    # 95 ms
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 73 18 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 30 00 - 00 00 30 00 - 00 00 10 00', descr => 'Configure data-register' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 60',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 01 9A 28',      descr => 'PT Time: 105 ms' },
        },
    },

    #***************************************************************************************
    'RollSensor_OTPcontent_B0C1_OREG0_Test2_fail' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Select SPI1 and CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask for SMI7xx Module Command' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x4, descr => 'Set SPI Pattern to Adr=0x4' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Select SMI7xx Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx					# 305 ms
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 04 A7 68 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },

            #                                                              105 ms
            #            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 9A 28 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 20 00 - 00 00 20 00 - 00 00 10 00', descr => 'Configure data-register' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 60',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 04 CE 78',      descr => 'PT Time: 315 ms' },
        },
    },

    #***************************************************************************************
    'RollSensor_OTPcontent_B0C1_OREG0_Test3_fail' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx RollSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x4, descr => 'Set SPI Pattern for command SMI710 Adr=0x5' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx				    # 305 ms
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 04 A7 68 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },

            #                                                              105 ms
            #            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 9A 28 - 10 00 00 02', descr => 'Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 30 00 - 00 00 30 00 - 00 00 10 00', descr => 'Configure data-register' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 60',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 04 CE 78',      descr => 'PT Time: 315 ms' },
        },
    },

    #***************************************************************************************
    'RollSensor_OTPcontent_B0C3_OREG1_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x5, descr => 'Set SPI Pattern for command Roll Adr=0x5' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 60',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_B0C3_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x6, descr => 'Set SPI Pattern for command Roll Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 60',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_B0C3_OREG3_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x7, descr => 'Set SPI Pattern for command Roll Adr=0x7' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 80', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 60',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_B0C2_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x6, descr => 'Set SPI Pattern for command SMI710 Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 4C',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_B0C3_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x6, descr => 'Set SPI Pattern for command SMI710 Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 60',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_E01C_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x6, descr => 'Set SPI Pattern for command SMI710 Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 03 80',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_E01E_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x6, descr => 'Set SPI Pattern for command SMI710 Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 03 D8',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_E020_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x6, descr => 'Set SPI Pattern for command SMI710 Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 04 04',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_E022_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x6, descr => 'Set SPI Pattern for command SMI710 Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 04 5C',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_E024_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x6, descr => 'Set SPI Pattern for command SMI710 Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 04 98',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_E026_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x6, descr => 'Set SPI Pattern for command SMI710 Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 04 C0',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #***************************************************************************************
    'YawSensor_OTPcontent_850D_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0x6, descr => 'Set SPI Pattern for command SMI710 Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_01 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,      descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D0 A1 B8',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_B0C1_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x6, descr => 'Set SPI Pattern for command Roll Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 38',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_B0C2_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x6, descr => 'Set SPI Pattern for command Roll Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D6 18 4C',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_E01C_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x6, descr => 'Set SPI Pattern for command Roll Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 03 80',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_E01E_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x6, descr => 'Set SPI Pattern for command Roll Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 03 D8',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_E020_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x6, descr => 'Set SPI Pattern for command Roll Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 04 04',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_E022_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x6, descr => 'Set SPI Pattern for command Roll Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 04 5C',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_E024_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x6, descr => 'Set SPI Pattern for command Roll Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 04 98',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_E026_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x6, descr => 'Set SPI Pattern for command Roll Adr=0x6' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Set Mask for SMI7xx Adr_11 Page_0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Set PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Write FIFO data' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 DC 04 C0',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #*************************************************************************************
    'RollSensor_OTPcontent_850D_OREG2_Test' => {
        'CMD_sequence' => {

            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Configure SMI7_SPI1_CS3' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Configure SMI7_StandardMask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0x6, descr => 'Configure RollSensor_Addr0x6, OREG2' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page0,   descr => 'Configure RollSensor_Page0' },
            0.5 => { cmd => '65 - 00 - ' . $PreTrigger_0,       descr => 'Configure PreTrigger_0' },

            # Configure FIFOs for SMI7xx
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0:' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Invert DataBit_0' },

            # Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - ' . $SMI_SPI1_CS3, descr => 'Set SPI1 CS pre trigger' },
            1.2 => { cmd => '62 - 00 - 00 1F FF E0',      descr => 'Set SPI Mask' },
            1.3 => { cmd => '63 - 00 - 48 D0 A1 B8',      descr => 'Set SPI Pattern' },
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',      descr => 'PT Time' },
        },
    },

    #-------------------------------------------------------------------------------------

    #***************************************************************************************
    #	Overload SMI7
    #***************************************************************************************
    'SMI7_RATE_Overload_T1' => {
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 08 00', descr => 'Unit_2: Write FIFO data' },
        },
    },

    #***************************************************************************************
    'SMI7_ACC2_Overload_T1' => {    #CH2
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 01 00 00', descr => 'Unit_2: Write FIFO data' },
        },
    },

    #***************************************************************************************
    'SMI7_ACC2_Overload_T2' => {    #CH2
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 01 08 00', descr => 'Unit_2: Write FIFO data' },
        },
    },

    #***************************************************************************************
    'SMI7_ACC1_Overload_T1' => {    #CH1
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 00 20', descr => 'Unit_2: Write FIFO data' },
        },
    },

    #***************************************************************************************
    'SMI7_ACC1_Overload_T2' => {    #CH1
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 08 20', descr => 'Unit_2: Write FIFO data' },
        },
    },

    #***************************************************************************************
    #	Overload_SMI8_ACC1
    #***************************************************************************************
    'SMI8_ACC1_Overload_T1' => {    # X = 0 : 000:0000:0000:0010:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC1_Overload_T1' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 00 20 - 00 00 00 00', descr => '0000.0000.0000.0100, 0000.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC1_Overload_T2' => {    # X = 1 : 001:1000:1100:1010:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC1_Overload_T2' },
            2.8 => { cmd => '43 - 00 - 02 - 00 01 8C A0 - 00 00 00 00', descr => '0011.0001.1001.0100, 0000.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC1_Overload_T3_Bit15' => {    # X = 0 : 000:0000:0000:0010:0, 100:0000:0000:0010:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC1_Overload_T3_Bit15' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 00 20 - 00 04 00 20', descr => '0000.0000.0000.0100, 1000.0000.0000.0100' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC1_Overload_T3_Bit0' => {     # X = 0 : 000:0000:0000:0010:0, 000:0000:0000:0010:1
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC1_Overload_T3_Bit0' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 00 20 - 00 00 00 28', descr => '0000.0000.0000.0100, 0000.0000.0000.0101' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC1_Overload_T4' => {          # X = 0 : 000:0000:0000:0010:0, 000:0000:0100:0010:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC1_Overload_T4' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 00 20 - 00 00 04 20', descr => '0000.0000.0000.0100, 0000.0000.1000.0100' },
        },
    },

    #***************************************************************************************
    #	Overload_SMI8_ACC2
    #***************************************************************************************
    'SMI8_ACC2_Overload_T1' => {    # X = 0 : 001:0000:0000:0000:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T1' },
            2.8 => { cmd => '43 - 00 - 02 - 00 01 00 00 - 00 00 00 00', descr => '0010.0000.0000.0000, 0000.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC2_Overload_T2' => {    # X = 1 : 001:1000:1100:1010:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T2' },
            2.8 => { cmd => '43 - 00 - 02 - 00 01 8C A0 - 00 00 00 00', descr => '0011.0001.1001.0100, 0000.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC2_Overload_T3_Bit14' => {    # X = 0 : 001:0000:0000:0000:0, 011:0000:0000:0000:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T3_Bit14' },
            2.8 => { cmd => '43 - 00 - 02 - 00 01 00 00 - 00 03 00 00', descr => '0010.0000.0000.0000, 0110.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC2_Overload_T3_Bit1' => {     # X = 0 : 001:0000:0000:0000:0, 001:0000:0000:0001:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T3_Bit1' },
            2.8 => { cmd => '43 - 00 - 02 - 00 01 00 00 - 00 01 00 10', descr => '0010.0000.0000.0000, 0010.0000.0000.0010' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC2_Overload_T4' => {          # X = 0 : 001:0000:0000:0000:0, 001:0000:0100:0000:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T4' },
            2.8 => { cmd => '43 - 00 - 02 - 00 01 00 00 - 00 01 04 00', descr => '0010.0000.0000.0000, 0010.0000.1000.0000' },
        },
    },

    #***************************************************************************************
    #	Overload_SMI8_ACC3
    #***************************************************************************************
    'SMI8_ACC3_Overload_T1' => {    # X = 0 : 000:1000:0000:0000:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T1' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 80 00 - 00 00 00 00', descr => '0001.0000.0000.0000, 0000.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC3_Overload_T2' => {    # X = 1 : 001:1000:1100:1010:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T2' },
            2.8 => { cmd => '43 - 00 - 02 - 00 01 8C A0 - 00 00 00 00', descr => '0011.0001.1001.0100, 0000.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC3_Overload_T3_Bit11' => {    # X = 0 : 001:0000:0000:0000:0, 000:1100:0000:0000:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T3_Bit11' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 80 00 - 00 00 C0 00', descr => '0001.0000.0000.0000, 0001.1000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_ACC3_Overload_T4' => {          # X = 0 : 001:0000:0000:0000:0, 001:0000:0100:0000:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T4' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 80 00 - 00 00 84 00', descr => '0001.0000.0000.0000, 0001.0000.1000.0000' },
        },
    },

    #***************************************************************************************
    #	Overload_SMI8_RATE2
    #***************************************************************************************
    'SMI8_RATE2_Overload_T1' => {    # X = 0 : 000:0000:0000:1000:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T1' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 00 80 - 00 00 00 00', descr => '0001.0000.0000.0000, 0000.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_RATE2_Overload_T2' => {    # X = 1 : 001:1000:1100:1010:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T2' },
            2.8 => { cmd => '43 - 00 - 02 - 00 01 8C A0 - 00 00 00 00', descr => '0011.0001.1001.0100, 0000.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_RATE2_Overload_T3_Bit10' => {    # X = 0 : 000:0010:0000:1000:0, 000:0010:0000:1000:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T3_Bit10' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 00 80 - 00 00 20 80', descr => '0000.0000.0001.0000, 0000.0100.0001.0000' },
        },
    },

    #***************************************************************************************
    #	Overload_SMI8_RATE1
    #***************************************************************************************
    'SMI8_RATE1_Overload_T1' => {    # X = 0 : 000:0000:1000:0000:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T1' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 08 00 - 00 00 00 00', descr => '0000.0001.0000.0000, 0000.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_RATE1_Overload_T2' => {    # X = 1 : 001:1000:1100:1010:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T2' },
            2.8 => { cmd => '43 - 00 - 02 - 00 01 8C A0 - 00 00 00 00', descr => '0011.0001.1001.0100, 0000.0000.0000.0000' },
        },
    },

    #***************************************************************************************
    'SMI8_RATE1_Overload_T3_Bit9' => {    # X = 0 : 000:0000:1000:0000:0, 000:0001:1000:0000:0
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'SMI8_ACC2_Overload_T3_Bit10' },
            2.8 => { cmd => '43 - 00 - 02 - 00 00 08 00 - 00 00 18 00', descr => '0000.0000.0001.0000, 0000.0100.0001.0000' },
        },
    },

    #***************************************************************************************
    'AccXLgChl_Overload_4x' => {          # X = 0 : 001:0000:0000:0000:0  Mech_overload_ACC2
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 04 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8', descr => 'Ctrl: 111:1111:1111:1111:1' },
            2.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 01 00 00 - 00 01 00 00 - 00 00 00 00', descr => 'Data: 001:0000:0000:0000:0' },
        },
    },

    #***************************************************************************************
    'AccYLgChl_Overload_4x' => {          # X = 0 : 000:0000:0000:0010:0  Mech_overload_ACC1
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 04 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8', descr => 'Ctrl: 111:1111:1111:1111:1' },
            2.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 00 20 - 00 00 00 20 - 00 00 00 00', descr => 'Data: 000:0000:0000:0010:0' },
        },
    },

    #***************************************************************************************
    'AccZLgChl_Overload_4x' => {          # X = 0 : 000:0000:0000:0010:0  Mech_overload_ACC3
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 04 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8', descr => 'Ctrl: 111:1111:1111:1111:1' },
            2.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 80 00 - 00 00 80 00 - 00 00 00 00', descr => 'Data: 000:1000:0000:0000:0' },
        },
    },

    #***************************************************************************************
    'YawRateLfChl_Overload_4x' => {       # X = 0 : 000:0000:0000:1000:0  Mech_overload_Rate2
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 04 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8', descr => 'Ctrl: 111:1111:1111:1111:1' },
            2.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 00 80 - 00 00 00 80 - 00 00 00 00', descr => 'Data: 000:0000:0000:1000:0' },
        },
    },

    #***************************************************************************************
    'RollRateLfChl_Overload_4x' => {      # X = 0 : 000:0000:1000:0000:0  Mech_overload_Rate1
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 04 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8', descr => 'Ctrl: 111:1111:1111:1111:1' },
            2.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 08 00 - 00 00 08 00 - 00 00 00 00', descr => 'Data: 000:0000:1000:0000:0' },
        },
    },

    #***************************************************************************************
    'PitchRateLfChl_Overload_4x' => {     # X = 0 : 000:0000:1000:0000:0  Mech_overload_Rate1
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 00 - 04 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8 - 00 07 FF F8', descr => 'Ctrl: 111:1111:1111:1111:1' },
            2.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 08 00 - 00 00 08 00 - 00 00 00 00', descr => 'Data: 000:0000:1000:0000:0' },
        },
    },

    #***************************************************************************************
    'YawSensor_error_cnt_comb2_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI700 Read_IntErrCnt45
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,      descr => 'Set SPI1 to SMI7_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,  descr => 'Set SPI to SMI7_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $YawSensor_Addr0xD, descr => 'Set SPI Pattern to YawSensor_Addr0xD' },
            0.4 => { cmd => '72 - 00 - ' . $YawSensor_Page2,   descr => 'Select SMI7 YawSensor_Page2' },

            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #***************************************************************************************
    'RollSensor_error_cnt_comb2_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI700 Read_IntErrCnt45
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,       descr => 'Set SPI1 to SMI7_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,   descr => 'Set SPI to SMI7_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $RollSensor_Addr0xD, descr => 'Set SPI Pattern to RollSensor_Addr0xD' },
            0.4 => { cmd => '72 - 00 - ' . $RollSensor_Page2,   descr => 'Select SMI7 RollSensor_Page2' },

            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #***************************************************************************************
    'PitchSensor_error_cnt_comb2_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI700 Read_IntErrCnt45
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,        descr => 'Set SPI1 to SMI7_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,    descr => 'Set SPI to SMI7_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $PitchSensor_Addr0xD, descr => 'Set SPI Pattern to RollSensor_Addr0xD' },
            0.4 => { cmd => '72 - 00 - ' . $PitchSensor_Page2,   descr => 'Select SMI7 RollSensor_Page2' },

            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #***************************************************************************************
    'YawPlausiSensor_error_cnt_comb2_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI700 Read_IntErrCnt45
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMI7_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMI7_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $YawPlausiSensor_Addr0xD, descr => 'Set SPI Pattern to YawPlausiSensor_Addr0xD' },
            0.4 => { cmd => '72 - 00 - ' . $YawPlausiSensor_Page2,   descr => 'Select SMI7 YawPlausiSensor_Page2' },

            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor1_error_cnt_comb0_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI970 Read_IntErrCntcomb0
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMI_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMI_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x0, descr => 'Set SPI Pattern to InertialSensor1_Addr0x0' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Select SMI InertialSensor1_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor1_error_cnt_comb0_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI970 Read_IntErrCntcomb0
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMI_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMI_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x0, descr => 'Set SPI Pattern to InertialSensor1_Addr0x0' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Select SMI InertialSensor1_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor1_error_cnt_comb1_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI970 Read_IntErrCntcomb1
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMI_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMI_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x1, descr => 'Set SPI Pattern to InertialSensor1_Addr0x1' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Select SMI InertialSensor1_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor1_error_cnt_comb2_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI970 Read_IntErrCntcomb2
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMI_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMI_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x2, descr => 'Set SPI Pattern to InertialSensor1_Addr0x2' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Select SMI InertialSensor1_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor1_error_cnt_comb3_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI970 Read_IntErrCntcomb3
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMI_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMI_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x3, descr => 'Set SPI Pattern to InertialSensor1_Addr0x3' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Select SMI InertialSensor1_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor1_error_cnt_comb4_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI970 Read_IntErrCntcomb4
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMI_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMI_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor1_Addr0x4, descr => 'Set SPI Pattern to InertialSensor1_Addr0x4' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor1_Page2,   descr => 'Select SMI InertialSensor1_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor2_error_cnt_comb0_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMU300 Read_IntErrCntcomb0
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMU_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMU_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x0, descr => 'Set SPI Pattern to InertialSensor2_Addr0x0' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Select SMU InertialSensor2_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor2_error_cnt_comb1_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMU300 Read_IntErrCntcomb1
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMU_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMU_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x1, descr => 'Set SPI Pattern to InertialSensor2_Addr0x1' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Select SMU InertialSensor2_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor2_error_cnt_comb2_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMU300 Read_IntErrCntcomb2
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMU_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMU_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x2, descr => 'Set SPI Pattern to InertialSensor2_Addr0x2' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Select SMU InertialSensor2_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor2_error_cnt_comb3_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMU300 Read_IntErrCntcomb3
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMU_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMU_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x3, descr => 'Set SPI Pattern to InertialSensor2_Addr0x3' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Select SMU InertialSensor2_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #**************************************************************************************
    'InertialSensor2_error_cnt_comb4_Read' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMU300 Read_IntErrCntcomb4
            0.1 => { cmd => '31 - 00 - ' . $SMI_SPI1_CS3,            descr => 'Set SPI1 to SMU_CS' },
            0.2 => { cmd => '32 - 00 - ' . $SMI_StandardMask,        descr => 'Set SPI to SMU_ModuleMask' },
            0.3 => { cmd => '33 - 00 - ' . $InertialSensor2_Addr0x4, descr => 'Set SPI Pattern to InertialSensor2_Addr0x4' },
            0.4 => { cmd => '72 - 00 - ' . $InertialSensor2_Page2,   descr => 'Select SMU InertialSensor2_Page2' },

            # Configure FIFOs for SMI8
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Write FIFO data' },
        },
    },

    #***************************************************************************************
    'FieldCalib_VDSFault_CN_Bit_Cal' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI700 YawSensor
            0.1 => { cmd => '31 - 03 - ' . $SMI_SPI1_CS3,   descr => 'Set SPI1 CS and for SMI700 YawSensor' },
            0.2 => { cmd => '32 - 03 - ' . $SMI_SensorMask, descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 03 - ' . $YawRateLfChl,   descr => 'Set SPI Pattern' },

            # Set CN-bit                         950 ms        500 ms         50 ms
            0.6 => { cmd => '41 - 03 - 03 - 40 0E 7E F0 - 40 07 A1 20 - 40 00 C3 50', descr => 'timing mode 1500 ms' },
            0.7 => { cmd => '42 - 03 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 00 00 00', descr => 'manipulate CN-bit' },
            0.8 => { cmd => '43 - 03 - 03 - 00 03 A9 80 - 00 00 12 C0 - 00 00 12 C8', descr => 'manipulate CN-bit' },
        },
    },

    #***************************************************************************************
    'FieldCalib_VDSFault_CN_Bit_Ver' => {
        'CMD_sequence' => {

            # Configure SPI trigger for SMI700 YawSensor
            0.1 => { cmd => '31 - 03 - ' . $SMI_SPI1_CS3,   descr => 'Set SPI1 CS and for SMI700 YawSensor' },
            0.2 => { cmd => '32 - 03 - ' . $SMI_SensorMask, descr => 'Set SPI Mask' },
            0.3 => { cmd => '33 - 03 - ' . $YawRateLfChl,   descr => 'Set SPI Pattern' },

            # Set CN-bit                        1100 ms       1700 ms         50 ms
            0.6 => { cmd => '41 - 03 - 03 - 40 10 C8 E0 - 40 19 F0 A0 - 40 00 C3 50', descr => 'timing mode 1500 ms' },
            0.7 => { cmd => '42 - 03 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 00 00 00', descr => 'manipulate CN-bit' },
            0.8 => { cmd => '43 - 03 - 03 - 00 03 A9 80 - 00 00 12 C0 - 00 00 12 C8', descr => 'manipulate CN-bit' },
        },
    },

    #***************************************************************************************
    'FieldCalib_Basic_Test_Timing' => {
        'CMD_sequence' => {

            # Set trigger value                                           600 ms	 1900 ms 		400 ms 			1900 ms
            0.6 => { cmd => '41 - 00 - 05 - ' . $FieldCalibSyncTime . ' - 40 09 27 C0 - 40 1C FD E0 - 40 06 1A 80 - 40 1C FD E0', descr => 'FieldCalibSyncTime,600ms, 1900 ms, 400 ms, 1900 ms' },

            # 0.6 => { cmd => '41 - 00 - 02 - '.$FieldCalibSyncTime.' - 40 4C 4B 40', descr => 'FieldCalibSyncTime,600ms, 1900 ms, 400 ms, 1900 ms' },
        },
    },

    #---------------------------------------------------------------------------------------

    #***************************************************************************************
    'AccLgChl_FieldCalib_Basic_Test' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 FA 00 - 00 00 24 60 - 00 00 00 00 - 00 00 25 90', descr => 'Write FIFO data' },

        },
    },

    #***************************************************************************************
    'AccZLgChl_FieldCalib_Basic_Test' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 02 1F F0 - 00 0E F5 70 - 00 00 00 00 - 00 0E F8 90', descr => 'Write FIFO data' },
        },
    },

    #***************************************************************************************
    'AccHgMonChl_FieldCalib_Basic_Test' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 05 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 02 1F F0 - 00 00 04 90 - 00 00 00 00 - 00 00 04 C0', descr => 'Write FIFO data' },
        },
    },

    #***************************************************************************************
    'RateLfChl_FieldCalib_Basic_Test' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 FA 00 - 00 00 00 C0 - 00 00 00 00 - 00 00 00 D0', descr => 'Write FIFO data' },
        },
    },

    #***************************************************************************************
    'FieldCalThd_NotOk_Timing' => {
        'CMD_sequence' => {

            #                                    				       950 ms       2300 ms
            0.6 => { cmd => '41 - 00 - 03 - ' . $FieldCalibSyncTime . ' - 40 0E 7E F0 - 40 23 18 60', descr => 'FieldCalibSyncTime, 950 ms, 2300 ms' },
        },
    },

    #***************************************************************************************
    'FieldCalThd_Data_Ok_Timing' => {
        'CMD_sequence' => {

            #                                   				       500 ms       2800 ms
            0.6 => { cmd => '41 - 00 - 03 - ' . $FieldCalibSyncTime . ' - 40 07 A1 20 - 40 2A B9 80', descr => 'FieldCalibSyncTime, 500 ms, 2800 ms' },
        },
    },

    #---------------------------------------------------------------------------------------
    #****************************************************************************************
    'AccLgChl_FieldCal_PosThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                 1000 LSB       736 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 3E 80 - 00 00 2E 00', descr => '1000 LSB, 736 LSB' },
        },
    },

    #****************************************************************************************
    'AccLgChl_FieldCal_NegThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                 1000 LSB      -736 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 3E 80 - 00 0F D2 00', descr => '1000 LSB, -736 LSB' },
        },
    },

    #****************************************************************************************
    'AccZLgChl_FieldCal_PosThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                               -7000 LSB     -4264 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 0E 4A 80 - 00 0E F5 80', descr => '-7000 LSB, -4264 LSB' },
        },
    },

    #****************************************************************************************
    'AccZLgChl_FieldCal_NegThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                -7000 LSB     -5736 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 0E 4A 80 - 00 0E 99 80', descr => '-7000 LSB, -5736 LSB' },
        },
    },

    #****************************************************************************************
    'AccHgMonChl_FieldCal_PosThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                  100 LSB        74 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 06 40 - 00 00 04 A0', descr => '100 LSB, 74 LSB' },
        },
    },

    #****************************************************************************************
    'AccHgMonChl_FieldCal_NegThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                  100 LSB       -74 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 06 40 - 00 0F FB 60', descr => '100 LSB, -74 LSB' },
        },
    },

    #***************************************************************************************
    'RateLfChl_FieldCal_PosThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                 400 LSB        301 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Data field :' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 19 00 - 00 00 12 D0', descr => '400 LSB, 301 LSB' },
        },
    },

    #***************************************************************************************
    'RateLfChl_FieldCal_NegThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                  400 LSB      -301 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 19 00 - 00 0F ED 30', descr => '400 LSB, -301 LSB' },
        },
    },

    #***************************************************************************************
    'FieldCalThd_Ok_Timing' => {
        'CMD_sequence' => {

            #                                   				        950 ms       2500 ms
            0.6 => { cmd => '41 - 00 - 03 - ' . $FieldCalibSyncTime . ' - 40 0E 7E F0 - 40 26 25 A0', descr => 'FieldCalibSyncTime 950 ms, 25000 ms' },
        },
    },

    #---------------------------------------------------------------------------------------
    #***************************************************************************************
    'AccLgChl_FieldCal_PosThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                 1000 LSB       735 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 3E 80 - 00 00 2D F0', descr => '1000 LSB, 735 LSB' },
        },
    },

    #***************************************************************************************
    'AccLgChl_FieldCal_NegThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                 1000 LSB      -735 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 3E 80 - 00 0F D2 10', descr => '1000 LSB, -735 LSB' },
        },
    },

    #****************************************************************************************
    'AccZLgChl_FieldCal_PosThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                -7000 LSB     -4265 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 0E 4A 80 - 00 0E F5 70', descr => '-7000 LSB, -4265 LSB' },
        },
    },

    #***************************************************************************************
    'AccZLgChl_FieldCal_NegThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                -7000 LSB     -5735 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 0E 4A 80 - 00 0E 99 90', descr => '-7000 LSB, -5735 LSB' },
        },
    },

    #***************************************************************************************
    'AccHgMonChl_FieldCal_PosThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                   100 LSB        73 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 06 40 - 00 00 04 90', descr => '100 LSB, 73 LSB' },
        },
    },

    #***************************************************************************************
    'AccHgMonChl_FieldCal_NegThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                  100 LSB       -73 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 06 40 - 00 0F FB 70', descr => '100 LSB, -73 LSB' },
        },
    },

    #***************************************************************************************
    'RateLfChl_FieldCal_PosThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                  400 LSB       300 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 19 00 - 00 00 12 C0', descr => '400 LSB, 300 LSB' },
        },
    },

    #***************************************************************************************
    'RateLfChl_FieldCal_NegThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                  400 LSB      -300 LSB
            0.7 => { cmd => '42 - 00 - 03 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 00 - 00 00 19 00 - 00 0F ED 40', descr => '400 LSB, -300 LSB' },
        },
    },

    #***************************************************************************************
    'FieldVerThd_NotOk_Timing' => {
        'CMD_sequence' => {

            #                                    				        950 ms       1200 ms       2300 ms
            0.6 => { cmd => '41 - 00 - 04 - ' . $FieldCalibSyncTime . ' - 40 0E 7E F0 - 40 12 4F 80 - 40 23 18 60', descr => 'FieldCalibSyncTime, 950 ms, 1200 ms, 2300 ms' },
        },
    },

    #---------------------------------------------------------------------------------------
    #***************************************************************************************
    'AccLgChl_FieldVer_PosThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                 1000 LSB       735 LSB       786 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 3E 80 - 00 00 2D F0 - 00 00 31 20', descr => '1000 LSB, 735 LSB, 786 LSB' },
        },
    },

    #***************************************************************************************
    'AccXLgChl_FieldVer_NegThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                 1000 LSB      -735 LSB      -786 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 3E 80 - 00 0F D2 10 - 00 0F CE E0', descr => '1000 LSB, -735 LSB, -786 LSB' },
        },
    },

    #***************************************************************************************
    'AccYLgChl_FieldVer_NegThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                 1000 LSB      -735 LSB      -786 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 3E 80 - 00 0F D2 10 - 00 0F CE E0', descr => '1000 LSB, -735 LSB, -786 LSB' },
        },
    },

    #***************************************************************************************
    'AccZLgChl_FieldVer_PosThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                -7000 LSB     -4265 LSB     -4214 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 0E 4A 80 - 00 0E F5 70 - 00 0E F8 A0', descr => '-7000 LSB, -4265 LSB, -4214 LSB' },
        },
    },

    #***************************************************************************************
    'AccZLgChl_FieldVer_NegThd_NotOk_1o2' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 04 1F F0 - 00 0E 99 90 - 00 0E 96 60', descr => 'Write FIFO data' },
        },
    },

    #***************************************************************************************
    'AccHgChl_FieldVer_PosThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                  100 LSB        73 LSB        79 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 06 40 - 00 00 04 90 - 00 00 04 F0', descr => '100 LSB, 73 LSB, 79 LSB' },
        },
    },

    #***************************************************************************************
    'AccHgChl_FieldVer_NegThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                  100 LSB       -73 LSB       -79 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 06 40 - 00 0F FB 70 - 00 0F FB 10', descr => '100 LSB, -73 LSB, -79 LSB' },
        },
    },

    #***************************************************************************************
    'RateLfChl_FieldVer_PosThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                  400 LSB       300 LSB       351 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 19 00 - 00 00 12 C0 - 00 00 15 F0', descr => '400 LSB, 300 LSB, 351 LSB' },
        },
    },

    #***************************************************************************************
    'RateLfChl_FieldVer_NegThd_NotOk_1o2' => {
        'CMD_sequence' => {    #                                  400 LSB      -300 LSB      -351 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 19 00 - 00 0F ED 40 - 00 0F EA 10', descr => '400 LSB, -300 LSB, -351 LSB' },
        },
    },

    #***************************************************************************************
    'FieldVerThd_Ok_Timing' => {
        'CMD_sequence' => {

            #                                    				       9500 ms       1200 ms       1300 ms
            0.6 => { cmd => '41 - 00 - 04 - ' . $FieldCalibSyncTime . ' - 40 0E 7E F0 - 40 12 4F 80 - 40 13 D6 20', descr => 'FieldCalibSyncTime, 950 ms, 1200 ms, 1300 ms' },
        },
    },

    #---------------------------------------------------------------------------------------
    #***************************************************************************************
    'AccLgChl_FieldVer_PosThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                 1000 LSB       735 LSB       785 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 3E 80 - 00 00 2D F0 - 00 00 31 10', descr => '1000 LSB, 735 LSB, 785 LSB' },
        },
    },

    #***************************************************************************************
    'AccLgChl_FieldVer_NegThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                 1000 LSB      -735 LSB      -785 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 3E 80 - 00 0F D2 10 - 00 0F CE F0', descr => '1000 LSB, -735 LSB, -785 LSB' },
        },
    },

    #***************************************************************************************
    'AccZLgChl_FieldVer_PosThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                -7000 LSB     -4265 LSB     -4215 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 0E 4A 80 - 00 0E F5 70 - 00 0E F8 90', descr => '-7000 LSB, -4265 LSB, -4315 LSB' },
        },
    },

    #***************************************************************************************
    'AccZLgChl_FieldVer_NegThd_Ok_2o2' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 04 1F F0 - 00 0E 99 90 - 00 0E 96 70', descr => 'Write FIFO data' },
        },
    },

    #***************************************************************************************
    'AccHgChl_FieldVer_PosThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                  100 LSB        73 LSB        78 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 06 40 - 00 00 04 90 - 00 00 04 E0', descr => '100 LSB, 73 LSB, 78 LSB' },
        },
    },

    #***************************************************************************************
    'AccHgChl_FieldVer_NegThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                  100 LSB       -73 LSB       -78 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 06 40 - 00 0F FB 70 - 00 0F FB 20', descr => '100 LSB, -73 LSB, -78 LSB' },
        },
    },

    #***************************************************************************************
    'RateLfChl_FieldVer_PosThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                  400 LSB       300 LSB       350 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 19 00 - 00 00 12 C0 - 00 00 15 E0', descr => '400 LSB, 300 LSB, 350 LSB' },
        },
    },

    #***************************************************************************************
    'RateLfChl_FieldVer_NegThd_Ok_2o2' => {
        'CMD_sequence' => {    #                                  400 LSB      -300 LSB      -350 LSB
            0.7 => { cmd => '42 - 00 - 04 - 00 00 0F F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'DATA' },
            0.8 => { cmd => '43 - 00 - 04 - 00 00 00 00 - 00 00 19 00 - 00 0F ED 40 - 00 0F EA 20', descr => ' 400 LSB, -300 LSB, -351 LSB' },
        },
    },

  },

  1;
__END__
