package LIFT_PROJECT;

#use strict;
use warnings;

#
#SMA CS and Mask definitions
#---------------------------
my $SMA_SPI_CS		= '00 10 00 04';
my $SMAP_SPI_CS		= '00 10 00 10';
my $SMA_SensorMask	= 'FC 00 00 00';
my $SMA_Channel_1	= '80 00 00 00';
my $SMA_Channel_2	= 'C4 00 00 00';

#SMI7 CS and Mask definitions
#----------------------------
my $SMI_SPI1_CS3		= '00 10 00 08';
my $SMI_SensorMask		= 'F8 00 00 00';
my $SMI_StandardMask	= 'FF 80 00 00';
#my $SMI_StandardMask_avoid_read_addr0 = 'FF 90 00 00';

#PreTrigger
#----------
my $PreTrigger_0	= '00 00 00 01';
my $PreTrigger_1	= '00 00 00 02';
#my $PreTrigger_2	= '00 00 00 04';
#my $PreTrigger_3	= '00 00 00 08';

#------------------------------------------------------------------------
# SMI700, SMI705, SMI710, SMI715
#------------------------------------------------------------------------
#
#*****************************
# SMI7xx_conf_1 -> CoreAsset *
#------------------------------------------------------------------------
# Yaw = SMI700, Roll = SMI710 : 5D configuration
#                   OR
# Yaw = SMI700, Roll = SMI710, YAW_R = SMI700 : 5D_R configuration: 
#------------------------------------------------------------------------
## SMI700
#my $YawRateLfChl  		= '50 00 00 00';    #YawRateLfChl
#my $AccXLgChl     		= '70 00 00 00';    #AccXLgChl     		CH2
#my $AccXHgMonChl  		= '78 00 00 00';    #AccXHgMonChl  		CH2
#my $AccYLgChl     		= '60 00 00 00';    #AccYLgChl     		CH1
## SMI710
#my $RollRateLfChl 		= 'D0 00 00 00';    #RollRateLfChl 
#my $AccZLgChl     		= 'F0 00 00 00';    #AccZLgChl     		CH2
## SMI700
#my $YawRateLfPlausiChl = '10 00 00 00';    #YawRateLfPlausiChl
#my $AccYLgPlausiChl    = '20 00 00 00';    #AccYLgPlausiChl	CH1
##
##dummy (suppress warnings)
#my $PitchRateLfChl     = 'FF 00 00 00'; 
#my $AccYHgMonChl  		= 'FF 00 00 00'; 

#*****************************
# SMI7xx_conf_2 -> CoreAsset *
#------------------------------------------------------------------------
# Yaw = SMI700, Roll = SMI710, YAW_R = SMI700 Pitch = 710 : 6DR configuration: 
#------------------------------------------------------------------------
##SMI700
#my $YawRateLfChl  		= '50 00 00 00';    #YawRateLfChl 
#my $AccYLgChl     		= '60 00 00 00';    #AccYLgChl			CH1
## SMI710
#my $RollRateLfChl 		= 'D0 00 00 00';    #RollRateLfChl 
## SMI700
#my $YawRateLfPlausiChl = '10 00 00 00';    #YawRateLfPlausiChl 
#my $AccYLgPlausiChl    = '20 00 00 00';    #AccYLgPlausiChl	CH1
##SMI710
#my $PitchRateLfChl     = '90 00 00 00';    #PitchRateLfChl 
#my $AccXLgChl     		= 'A0 00 00 00';    #AccXLgChl			CH1
#my $AccXHgMonChl  		= 'A8 00 00 00';    #AccXHgMonChl		CH1
#my $AccZLgChl     		= 'B0 00 00 00';    #AccZLgChl			CH2
##
##dummy (suppress warnings)
#my $AccYHgMonChl  		= 'FF 00 00 00';

#*****************************
# SMI7xx_conf_3 -> CoreAsset *
#------------------------------------------------------------------------
# Yaw = SMI705, Roll = SMI715 : 5D configuration
#------------------------------------------------------------------------
## SMI705
#my $YawRateLfChl  		= '50 00 00 00';    #YawRateLfChl 
#my $AccYLgChl     		= '60 00 00 00';    #AccYLgChl			CH1
#my $AccZLgChl     		= '70 00 00 00';    #AccZLgChl			CH2
## SMI715
#my $RollRateLfChl 		= 'D0 00 00 00';    #RollRateLfChl 
#my $AccXLgChl     		= 'F0 00 00 00';    #AccXLgChl			CH2
#my $AccXHgMonChl  		= 'F8 00 00 00';    #AccXHgMonChl		CH2
##
##dummy (suppress warnings)
#my $AccYHgMonChl  		= 'FF 00 00 00'; 
#my $PitchRateLfChl     = 'FF 00 00 00';
#my $YawRateLfPlausiChl = 'FF 00 00 00';
#my $AccYLgPlausiChl    = 'FF 00 00 00';

#*****************************
# SMI7xx_conf_6 -> MRA2      *
#------------------------------------------------------------------------
# Yaw = SMI705, Roll = SMI715, Pitch = SMI715 : 6D configuration
#------------------------------------------------------------------------
# SMI705
my $YawRateLfChl  		= '50 00 00 00';    #YawRateLfChl 
my $AccYLgChl     		= '60 00 00 00';    #AccYLgChl			CH1
my $AccYHgMonChl     	= '68 00 00 00';    #AccYHgMonChl		CH1
my $AccZLgChl     		= '70 00 00 00';    #AccZLgChl			CH2
# SMI715
my $RollRateLfChl 		= 'D0 00 00 00';    #RollRateLfChl 
my $AccXLgChl     		= 'F0 00 00 00';    #AccXLgChl			CH2
my $AccXHgMonChl  		= 'F8 00 00 00';    #AccXHgMonChl		CH2
# SMI715
my $PitchRateLfChl		= '90 00 00 00';	#PitchRateLfChl
#
#dummy (suppress warnings)
my $YawRateLfPlausiChl	= 'FF 00 00 00';
my $AccYLgPlausiChl		= 'FF 00 00 00';

#-------------------------------                  conf_1       conf_2      conf_3      conf_6
# Bit 1..0    Acc1                                                                    
my $SMI7_ACC1_HF_StatHwScon_01 = '00 00 00 08';                # AccXHg                #AccYHg
my $SMI7_ACC1_HF_StatHwScon_10 = '00 00 00 10';                #                       #
my $SMI7_ACC1_HF_StatHwScon_11 = '00 00 00 18';                #                       #
# Bit 3..2    Acc1                                                                    
my $SMI7_ACC1_LF_StatHwScon_01 = '00 00 00 20';   # AccYLg     # AccYLg	   # AccYLg    # AccYLg
my $SMI7_ACC1_LF_StatHwScon_10 = '00 00 00 40';   # AccYLgP    # AccYLgP   #           #
my $SMI7_ACC1_LF_StatHwScon_11 = '00 00 00 60';   #            # AccXLg    #           #
# Bit 5..4    Acc2                                                                    
my $SMI7_ACC2_HF_StatHwScon_01 = '00 00 00 80';	  # AccXHg                 # AccXHg    # AccXHg
my $SMI7_ACC2_HF_StatHwScon_10 = '00 00 01 00';   #                        #           # 
my $SMI7_ACC2_HF_StatHwScon_11 = '00 00 01 80';   #                        #           #
# Bit 7..6    Acc2                                                                    
my $SMI7_ACC2_LF_StatHwScon_01 = '00 00 02 00';   # AccXLg     #           # AccXLg    # AccXLg
my $SMI7_ACC2_LF_StatHwScon_10 = '00 00 04 00';   # AccZLg     # AccZLg    # AccZLg    # AccZLg
my $SMI7_ACC2_LF_StatHwScon_11 = '00 00 06 00';   #            #           #           #
# Bit 9..8    Rate                                                                   
my $SMI7_RATE_HF_StatHwScon_01 = '00 00 08 00';                                       
my $SMI7_RATE_HF_StatHwScon_10 = '00 00 10 00';                                       
my $SMI7_RATE_HF_StatHwScon_11 = '00 00 18 00';                                       
# Bit 11..10  Rate                                                                  
my $SMI7_RATE_LF_StatHwScon_01 = '00 00 20 00';   # Yaw		   # Yaw       # Yaw       # Yaw
my $SMI7_RATE_LF_StatHwScon_10 = '00 00 40 00';   # Roll       # Roll      # Roll      # Roll
my $SMI7_RATE_LF_StatHwScon_11 = '00 00 60 00';   # 		   # Pitch     #           # Pitch
                                                  # YawP       # YawP      #           #
#YawSensor module commands
#-------------------------
my $YawSensor_Page0 = '00 00 01 00';
my $YawSensor_Page1 = '00 00 02 00';
my $YawSensor_Page2 = '00 00 04 00';
my $YawSensor_Page4 = '00 00 10 00';
#
my $YawSensor_Addr0x0 = '48 00 00 00';
my $YawSensor_Addr0x1 = '48 80 00 00';
my $YawSensor_Addr0x2 = '49 00 00 00';
my $YawSensor_Addr0x3 = '49 80 00 00';
my $YawSensor_Addr0x4 = '4A 00 00 00';
my $YawSensor_Addr0x5 = '4A 80 00 00';
my $YawSensor_Addr0x6 = '4B 00 00 00';
my $YawSensor_Addr0x7 = '4B 80 00 00';
my $YawSensor_Addr0x8 = '4C 00 00 00';
my $YawSensor_Addr0x9 = '4C 80 00 00';
my $YawSensor_Addr0xA = '4D 00 00 00';
my $YawSensor_Addr0xB = '4D 80 00 00';
my $YawSensor_Addr0xC = '4E 00 00 00';
my $YawSensor_Addr0xD = '4E 80 00 00';
my $YawSensor_Addr0xE = '4F 00 00 00';
my $YawSensor_Addr0xF = '4F 80 00 00';

#RollSensor module commands
#--------------------------
my $RollSensor_Page0 = '01 00 00 00';
my $RollSensor_Page1 = '02 00 00 00';
my $RollSensor_Page2 = '04 00 00 00';
my $RollSensor_Page4 = '10 00 00 00';
#
my $RollSensor_Addr0x0 = 'C8 00 00 00';
my $RollSensor_Addr0x1 = 'C8 80 00 00';
my $RollSensor_Addr0x2 = 'C9 00 00 00';
my $RollSensor_Addr0x3 = 'C9 80 00 00';
my $RollSensor_Addr0x4 = 'CA 00 00 00';
my $RollSensor_Addr0x5 = 'CA 80 00 00';
my $RollSensor_Addr0x6 = 'CB 00 00 00';
my $RollSensor_Addr0x7 = 'CB 80 00 00';
my $RollSensor_Addr0x8 = 'CC 00 00 00';
my $RollSensor_Addr0x9 = 'CC 80 00 00';
my $RollSensor_Addr0xA = 'CD 00 00 00';
my $RollSensor_Addr0xB = 'CD 80 00 00';
my $RollSensor_Addr0xC = 'CE 00 00 00';
my $RollSensor_Addr0xD = 'CE 80 00 00';
my $RollSensor_Addr0xE = 'CF 00 00 00';
my $RollSensor_Addr0xF = 'CF 80 00 00';

#PitchSensor module commands
#---------------------------
my $PitchSensor_Page0 = '00 01 00 00';
my $PitchSensor_Page1 = '00 02 00 00';
my $PitchSensor_Page2 = '00 04 00 00';
my $PitchSensor_Page4 = '00 10 00 00';
#
my $PitchSensor_Addr0x0 = '88 00 00 00';
my $PitchSensor_Addr0x1 = '88 80 00 00';
my $PitchSensor_Addr0x2 = '89 00 00 00';
my $PitchSensor_Addr0x3 = '89 80 00 00';
my $PitchSensor_Addr0x4 = '8A 00 00 00';
my $PitchSensor_Addr0x5 = '8A 80 00 00';
my $PitchSensor_Addr0x6 = '8B 00 00 00';
my $PitchSensor_Addr0x7 = '8B 80 00 00';
my $PitchSensor_Addr0x8 = '8C 00 00 00';
my $PitchSensor_Addr0x9 = '8C 80 00 00';
my $PitchSensor_Addr0xA = '8D 00 00 00';
my $PitchSensor_Addr0xB = '8D 80 00 00';
my $PitchSensor_Addr0xC = '8E 00 00 00';
my $PitchSensor_Addr0xD = '8E 80 00 00';
my $PitchSensor_Addr0xE = '8F 00 00 00';
my $PitchSensor_Addr0xF = '8F 80 00 00';

#YawPlausiSensor module commands
#-------------------------------
my $YawPlausiSensor_Page0 = '00 00 00 01';
my $YawPlausiSensor_Page1 = '00 00 00 02';
my $YawPlausiSensor_Page2 = '00 00 00 04';
my $YawPlausiSensor_Page4 = '00 00 00 10';
#
my $YawPlausiSensor_Addr0x0 = '08 00 00 00';
my $YawPlausiSensor_Addr0x1 = '08 80 00 00';
my $YawPlausiSensor_Addr0x2 = '09 00 00 00';
my $YawPlausiSensor_Addr0x3 = '09 80 00 00';
my $YawPlausiSensor_Addr0x4 = '0A 00 00 00';
my $YawPlausiSensor_Addr0x5 = '0A 80 00 00';
my $YawPlausiSensor_Addr0x6 = '0B 00 00 00';
my $YawPlausiSensor_Addr0x7 = '0B 80 00 00';
my $YawPlausiSensor_Addr0x8 = '0C 00 00 00';
my $YawPlausiSensor_Addr0x9 = '0C 80 00 00';
my $YawPlausiSensor_Addr0xA = '0D 00 00 00';
my $YawPlausiSensor_Addr0xB = '0D 80 00 00';
my $YawPlausiSensor_Addr0xC = '0E 00 00 00';
my $YawPlausiSensor_Addr0xD = '0E 80 00 00';
my $YawPlausiSensor_Addr0xE = '0F 00 00 00';
my $YawPlausiSensor_Addr0xF = '0F 80 00 00';
												  
#------------------------------------------------------------------------
# SMI800, SMI810, SMI860
#------------------------------------------------------------------------
#
#*****************************
# SMI8xx_conf_4 -> CoreAsset *
#------------------------------------------------------------------------
# Yaw, Roll = SMI860,  Pitch = SMG810 : 6D configuration: 
#------------------------------------------------------------------------
##SMI860
#my $AccYLgChl     		= '60 00 00 00';    #AccYLgChl          CH1
#my $AccYHgMonChl  		= '68 00 00 00';    #AccYHgMonChl       CH1
#my $AccXLgChl     		= '70 00 00 00';    #AccXLgChl			CH2	
#my $AccXHgMonChl  		= '78 00 00 00';    #AccXHgMonChl       CH2
#my $AccZLgChl     		= 'F0 00 00 00';    #AccZLgChl          CH3
#my $RollRateLfChl      = '50 00 00 00';    #RollRateLfChl
#my $YawRateLfChl  		= 'D0 00 00 00';    #YawRateLfChl
##SMG810
#my $PitchRateLfChl 	= '90 00 00 00';    #PitchRateLfChl
##
##dummy (suppress warnings)
#my $YawRateLfPlausiChl  = 'FF 00 00 00';
#my $AccYLgPlausiChl     = 'FF 00 00 00';

#*****************************
# SMI8xx_conf_5 -> CoreAsset *
#------------------------------------------------------------------------
# Yaw = SMI800 : 3D configuration: 
#------------------------------------------------------------------------
##SMI800
#my $AccYLgChl     		= '60 00 00 00';    #AccYLgChl          CH1
#my $AccYHgMonChl  		= '68 00 00 00';    #AccYHgMonChl       CH1
#my $AccXLgChl     		= '70 00 00 00';    #AccXLgChl			CH2	
#my $AccXHgMonChl  		= '78 00 00 00';    #AccXHgMonChl       CH2
#my $YawRateLfChl  		= '50 00 00 00';    #YawRateLfChl
##
##dummy (suppress warnings)
#my $YawRateLfPlausiChl  = 'FF 00 00 00';
#my $AccYLgPlausiChl     = 'FF 00 00 00';
#my $AccZLgChl     		= 'FF 00 00 00';
#my $RollRateLfChl       = 'FF 00 00 00';
#my $PitchRateLfChl 		= 'FF 00 00 00';

#-------------------------------
# SMI860, SMG810, SMI8 C-sample
#-------------------------------                  conf_4               conf_5
#                                                   SMI860   SMG810      SMI800
# Bit 1..0    Acc1                                                
my $SMI8_ACC1_HF_StatHwScon_01 = '00 00 00 08';   # AccYHg             # AccYHg
my $SMI8_ACC1_HF_StatHwScon_10 = '00 00 00 10';   #                    # 
my $SMI8_ACC1_HF_StatHwScon_11 = '00 00 00 18';   #                    # 
# Bit 3..2    Acc1
my $SMI8_ACC1_LF_StatHwScon_01 = '00 00 00 20';   # AccYLg             # AccYLg
my $SMI8_ACC1_LF_StatHwScon_10 = '00 00 00 40';   #                    # 
my $SMI8_ACC1_LF_StatHwScon_11 = '00 00 00 60';   #                    # 
# Bit 5..4    Acc2
my $SMI8_ACC2_HF_StatHwScon_01 = '00 00 00 80';   # AccXHg             # AccXHg
my $SMI8_ACC2_HF_StatHwScon_10 = '00 00 01 00';   #                    # 
my $SMI8_ACC2_HF_StatHwScon_11 = '00 00 01 80';   #                    # 
# Bit 7..6    Acc2
my $SMI8_ACC2_LF_StatHwScon_01 = '00 00 02 00';   # AccXLg             # AccXLg
my $SMI8_ACC2_LF_StatHwScon_10 = '00 00 04 00';   #                    # 
my $SMI8_ACC2_LF_StatHwScon_11 = '00 00 06 00';   #                    # 
# Bit 9..8     Rate2
my $SMI8_RATE2_LF_StatHwScon_01  = '00 00 08 00'; # Yaw                     
my $SMI8_RATE2_LF_StatHwScon_10  = '00 00 10 00'; #                      
my $SMI8_RATE2_LF_StatHwScon_11  = '00 00 18 00'; #                      
# Bit 11..10   Rate1
my $SMI8_RATE1_LF_StatHwScon_01  = '00 00 20 00'; # Roll    # Pitch    # Yaw
my $SMI8_RATE1_LF_StatHwScon_10  = '00 00 40 00'; #         #          #
my $SMI8_RATE1_LF_StatHwScon_11  = '00 00 60 00'; #         #          #
# Bit 13..12  Acc3
my $SMI8_ACC3_HF_StatHwScon_01 = '00 00 80 00';   # AccZHg       
my $SMI8_ACC3_HF_StatHwScon_10 = '00 01 00 00';   #         
my $SMI8_ACC3_HF_StatHwScon_11 = '00 01 80 00';   #         
# Bit 15..14  Acc3
my $SMI8_ACC3_LF_StatHwScon_01 = '00 02 00 00';   # AccZLg 
my $SMI8_ACC3_LF_StatHwScon_10 = '00 04 00 00';   #
my $SMI8_ACC3_LF_StatHwScon_11 = '00 06 00 00';   #
												  
#InertialSensor1 module commands
#-------------------------
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

$Defaults->{'MANITOO_TEMP'}{'SERVICES'} = {
    #
    #  SERVICES
    #
	
#    'power_ON'  => {
#       'CMD_sequence' => {
#            1.1 => { cmd => '80 - 00 01 00 01',  descr => 'Power-ON' },
#        },
#    },

#    'power_OFF'  => {
#       'CMD_sequence' => {
#            1.1 => { cmd => '80 - 00 01 00 00',  descr => 'Power-OFF' },
#        },
#    },

#    'init'  => { # Init
#       'CMD_sequence' => {
#            # get version
#            #1.1 => { cmd => '10', descr => 'Get Version' },
#            # Reset of PS & PL
#            #2.1 => { cmd => '22', descr => 'Reset PS & PL' },
#            # config_rti_trigger
#            #3.1 => { cmd => '51 - 00 00 00 01',  descr => 'Set CS for Cobra_M' },
#            #3.2 => { cmd => '52 - FF C0 00 00',  descr => 'Set SPI Mask for WD command' },
#            #3.3 => { cmd => '53 - 01 00 00 00',  descr => 'Set SPI Pattern for WD command' },
#            # Config_spi_smi7 page detection
#            4.1 => { cmd => '71 - '.$SMI_SPI1_CS3,  descr => 'Enable SMI7 Page Detection' },
#            # Copy data to PL
#            5.1 => { cmd => '20', descr => 'Copy data to PL' },
#            # Enable ManiToo debug mode
#            #6.1 => { cmd => 'FA - 00 00 00 01',  descr => 'Enable ManiToo debugging mode' },
#        },
#    },
	
    'SMI_page_detection'  => { # Init
       'CMD_sequence' => {
			#Enable SMI7 Page Detection
            1.1 => { cmd => '71 - '.$SMI_SPI1_CS3,  descr => 'Enable SMI7 Page Detection' },
            # Copy data to PL
            1.2 => { cmd => '20', descr => 'Copy data to PL' },
            # Enable ManiToo debug mode
            #6.1 => { cmd => 'FA 	- 00 00 00 01',  descr => 'Enable ManiToo debugging mode' },
        },
    },
		
    'start_manipulation'  => {  # Start manipulation
        'CMD_sequence' => {
            1.1 => { cmd => '20', descr => 'Copy data to PL' },
            1.2 => { cmd => '21 - 00 00 00 01', descr => 'Start manipulation' },
        },
    },
	
	'stop_manipulation'  => { # Stop manipulation
       'CMD_sequence' => {
           1.1 => { cmd => '21 - 00 00 00 00',  descr => 'Stop manipulation' },
           1.2 => { cmd => '23', descr => 'Partial Reset PS & PL' },
        },
    },
	
#	'read_manipu_counter'  => {
#       'CMD_sequence' => {
#           1.1 => { cmd => 'E0 - 00', descr => 'Read manipulation counter unit_0' },
#           1.2 => { cmd => 'E0 - 01', descr => 'Read manipulation counter unit_1' },
#           1.3 => { cmd => 'E0 - 02', descr => 'Read manipulation counter unit_2' },
#           1.4 => { cmd => 'E0 - 03', descr => 'Read manipulation counter unit_3' },
#        },
#    },
  
#	'read_manipu_counter'  => {
#       'CMD_sequence' => {
#           1.1 => { cmd => 'E0 - FF', descr => 'Read manipulation counter all units' },
#        },
#    },    
}; 
           
$Defaults->{'MANITOO_TEMP'}{'TESTCASES'} = {
#
# Unit_0: AccXLgChl, AccXHgMonChl, AccYLgChl, AccYHgMonChl, AccYLgPlausiChl, AccZLgChl
#         RollRateLfChl, YawRateLfChl, YawRateLfPlausiChl, PitchRateLfChl 
#
# Unit_1: DeviceID, RevisionID, ASIC_Serial0, SMI_Serial0, FW_Version, OREG1, OREG2, OREG3,
#         ChStatHwScon, ErrorFlag16_Bank0, ErrorFlag16_Bank7
#
# Unit_2: ASIC_Serial1, SMI_Serial1, ClusterFlags, YawSensor_Temp1, ErrorFlag16_Bank1
#
# Unit_3: ASIC_Serial2, SMI_Serial2, SMA_Channel_1
#
	  
#Unit_0
#*************************************************************	
#SPI_CS and SensorMask
#---------------------
    'U0_SMI_SensorMask'  => {
        'CMD_sequence' => {
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: SMI_SPI1_CS3'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: SMI_SensorMask'} ,
        },
    },    
#Trigger pattern
#---------------
    'U0_AccXLgChl'  => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: AccXLgChl' },
        },
    },    
    'U0_AccXHgMonChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - '.$AccXHgMonChl,		descr => 'Unit_0: AccXHgMonChl' },
        },
    },    
    'U0_AccYLgChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - '.$AccYLgChl,		descr => 'Unit_0: AccYLgChl' },
        },
    },    
    'U0_AccYHgMonChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - '.$AccYHgMonChl,		descr => 'Unit_0: AccYHgMonChl' },
        },
    },    
    'U0_AccYLgPlausiChl' => {
        'CMD_sequence' => {			
            0.3 => { cmd => '33 - 00 - '.$AccYLgPlausiChl,	descr => 'Unit_0: AccYLgPlausiChl' },
        },
    },    
    'U0_AccZLgChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - '.$AccZLgChl,		descr => 'Unit_0: AccZLgChl' },
        },
    },    
    'U0_RollRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: RollRateLfChl' },
        },
    },    
    'U0_YawRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - '.$YawRateLfChl,		descr => 'Unit_0: YawRateLfChl' },
        },
    },    
    'U0_YawRateLfPlausiChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - '.$YawRateLfPlausiChl,	descr => 'Unit_0: YawRateLfPlausiChl' },
        },
    },    
    'U0_PitchRateLfChl' => {
        'CMD_sequence' => {
            0.3 => { cmd => '33 - 00 - '.$PitchRateLfChl,	descr => 'Unit_0: PitchRateLfChl' },
        },
    },    
#Mode, time and count
#--------------------
	'U0_Mode_InitTest_2x'  => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 01 - 10 00 00 02',		descr => 'Unit_0_Mode: 10 00 00 02' },
        },											  		  
    },	
	'U0_Mode_InitTest_3x'  => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 00 - 01 - 10 00 00 03',		descr => 'Unit_0_Mode: 10 00 00 03' },
        },											  		  
    },
    'U0_Mode_65ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 00 FF FF',	descr => 'Unit_0_Mode: 40 00 FF FF' },
        },
    },
    'U0_Mode_10200ms' => {
        'CMD_sequence' => {
            0.6 => { cmd => '41 - 00 - 01 - 40 9B A3 C0', 	descr => 'Unit_0_Mode: 40 9B A3 C0' },
        },
    },    
#Manipulate, ctrl and data
#-------------------------
    'U0_Set_CI_Bit' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 08',	descr => 'Unit_0_Ctrl: 00 00 00 08' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08',	descr => 'Unit_0_Data: 00 00 00 08' },
        },
    },   
    'U0_Invert_SID_Bit2' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0_Ctrl: 00 00 00 00' },
            0.8 => { cmd => '43 - 00 - 01 - 00 40 00 00', descr => 'Unit_0_Data: 00 40 00 00' },
        },
    },
    'U0_Set_SD_Bit' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0_Ctrl: 02 00 00 00' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Unit_0_Data: 00 00 00 00' },
        },
    },   
	
    'U0_Set_Data_+5.2g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Unit_0_Ctrl: 00 0F FF F0' },
            0.8 => { cmd => '43 - 00 - 01 - 00 06 59 00', descr => 'Unit_0_Data: 00 06 59 00, +5.2g' },
        },
    },
    'U0_Set_Data_-5.2g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Unit_0_Ctrl: 00 0F FF F0' },
            0.8 => { cmd => '43 - 00 - 01 - 00 09 A7 00', descr => 'Unit_0_Data: 00 09 A7 00, -5.2g' },
        },
    },
    'U0_Set_Data_+40g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Unit_0_Ctrl: 00 0F FF F0' },
            0.8 => { cmd => '43 - 00 - 01 - 00 04 E2 00', descr => 'Unit_0_Data: 00 04 E2 00, +40g' },
        },
    },
    'U0_Set_Data_-40g' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Unit_0_Ctrl: 00 0F FF F0' },
            0.8 => { cmd => '43 - 00 - 01 - 00 0B 1E 00', descr => 'Unit_0_Data: 00 0B 1E 00, -40g' },
        },
    },
    'U0_Set_Data_+320grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Unit_0_Ctrl: 00 0F FF F0' },
            0.8 => { cmd => '43 - 00 - 01 - 00 07 D0 00', descr => 'Unit_0_Data: 00 07 D0 00, +320grad/s' },
        },
    },
    'U0_Set_Data_-320grad/s' => {
        'CMD_sequence' => {
            0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0', descr => 'Unit_0_Ctrl: 00 0F FF F0' },
            0.8 => { cmd => '43 - 00 - 01 - 00 08 30 00', descr => 'Unit_0_Data: 00 08 30 00, -320grad/s' },
        },
    },
    
	
#Unit_1
#*************************************************************	
#SPI_CS and StandardMask
#-----------------------
    'U1_SMI_StandardMask'  => {
        'CMD_sequence' => {
            1.1 => { cmd => '31 - 01 - '.$SMI_SPI1_CS3,		descr => 'Unit_1: SMI_SPI1_CS3' },
            1.2 => { cmd => '32 - 01 - '.$SMI_StandardMask,	descr => 'Unit_1: SMI_StandardMask'},
        },
    },
    'U1_PreTrigger_0'  => {
        'CMD_sequence' => {
			1.5 => { cmd => '65 - 01 - '.$PreTrigger_0,		descr => 'Unit_1: PreTrigger_0'},
        },
    },    
#Trigger pattern
#---------------
#DeviceID
	'U1_YawSensor_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawSensor_Addr0x3,		descr => 'Unit_1: YawSensor_Addr0x3' },
            1.4 => { cmd => '72 - 01 - '.$YawSensor_Page4,			descr => 'Unit_1: YawSensor_Page4' },
        },											  		  
    },
	'U1_YawPlausiSensor_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawPlausiSensor_Addr0x3,	descr => 'Unit_1: YawPlausiSensor_Addr0x3' },
            1.4 => { cmd => '72 - 01 - '.$YawPlausiSensor_Page4,	descr => 'Unit_1: YawPlausiSensor_Page4' },			
        },											  		  
    },
	'U1_RollSensor_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$RollSensor_Addr0x3,		descr => 'Unit_1: RollSensor_Addr0x3' },
            1.4 => { cmd => '72 - 01 - '.$RollSensor_Page4,			descr => 'Unit_1: RollSensor_Page4' },
        },											  		  
    },
	'U1_PitchSensor_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$PitchSensor_Addr0x3,		descr => 'Unit_1: PitchSensor_Addr0x3' },
            1.4 => { cmd => '72 - 01 - '.$PitchSensor_Page4,		descr => 'Unit_1: PitchSensor_Page4' },			
        },											  		  
    },
	'U1_InertialSensor1_DeviceID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x3,	descr => 'Unit_1: InertialSensor1_Addr0x3' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page4,	descr => 'Unit_1: InertialSensor1_Page4' },
        },											  		  
    },
#RevisionID
	'U1_YawSensor_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawSensor_Addr0x4,		descr => 'Unit_1: YawSensor_Addr0x4' },
            1.4 => { cmd => '72 - 01 - '.$YawSensor_Page4,			descr => 'Unit_1: YawSensor_Page4' },
        },											  		  
    },
	'U1_YawPlausiSensor_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawPlausiSensor_Addr0x4,	descr => 'Unit_1: YawPlausiSensor_Addr0x4' },
            1.4 => { cmd => '72 - 01 - '.$YawPlausiSensor_Page4,	descr => 'Unit_1: YawPlausiSensor_Page4' },			
        },											  		  
    },
	'U1_RollSensor_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$RollSensor_Addr0x4,		descr => 'Unit_1: RollSensor_Addr0x4' },
            1.4 => { cmd => '72 - 01 - '.$RollSensor_Page4,			descr => 'Unit_1: RollSensor_Page4' },
        },											  		  
    },
	'U1_PitchSensor_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$PitchSensor_Addr0x4,		descr => 'Unit_1: PitchSensor_Addr0x4' },
            1.4 => { cmd => '72 - 01 - '.$PitchSensor_Page4,		descr => 'Unit_1: PitchSensor_Page4' },			
        },											  		  
    },
	'U1_InertialSensor1_RevisionID' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x4,	descr => 'Unit_1: InertialSensor1_Addr0x4' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page4,	descr => 'Unit_1: InertialSensor1_Page4' },
        },											  		  
    },
#ASIC_Serial0
	'U1_YawSensor_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawSensor_Addr0x0,		descr => 'Unit_1: YawSensor_Addr0x0' },
            1.4 => { cmd => '72 - 01 - '.$YawSensor_Page4,			descr => 'Unit_1: YawSensor_Page4' },
        },											  		  
    },
	'U1_YawPlausiSensor_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawPlausiSensor_Addr0x0,	descr => 'Unit_1: YawPlausiSensor_Addr0x0' },
            1.4 => { cmd => '72 - 01 - '.$YawPlausiSensor_Page4,	descr => 'Unit_1: YawPlausiSensor_Page4' },
        },											  		  
    },
	'U1_RollSensor_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$RollSensor_Addr0x0,		descr => 'Unit_1: RollSensor_Addr0x0' },
            1.4 => { cmd => '72 - 01 - '.$RollSensor_Page4,			descr => 'Unit_1: RollSensor_Page4' },
        },											  		  
    },
	'U1_PitchSensor_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$PitchSensor_Addr0x0,		descr => 'Unit_1: PitchSensor_Addr0x0' },
            1.4 => { cmd => '72 - 01 - '.$PitchSensor_Page4,		descr => 'Unit_1: PitchSensor_Page4' },
        },											  		  
    },
	'U1_InertialSensor1_ASIC_Serial0' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x0,	descr => 'Unit_1: InertialSensor1_Addr0x0' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page4,	descr => 'Unit_1: InertialSensor1_Page4' },
        },											  		  
    },	
#SMI_Serial0	
    'U1_YawSensor_SMI_Serial0'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawSensor_Addr0x5,	descr => 'Unit_1: YawSensor_Addr0x5' },
            1.4 => { cmd => '72 - 01 - '.$YawSensor_Page4,		descr => 'Unit_1: YawSensor_Page4' },
        },
    },    
    'U1_YawPlausiSensor_SMI_Serial0'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawPlausiSensor_Addr0x5,	descr => 'Unit_1: YawPlausiSensor_Addr0x5' },
            1.4 => { cmd => '72 - 01 - '.$YawPlausiSensor_Page4,	descr => 'Unit_1: YawPlausiSensor_Page4' },
        },
    },    
    'U1_RollSensor_SMI_Serial0'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$RollSensor_Addr0x5,	descr => 'Unit_1: RollSensor_Addr0x5' },
            1.4 => { cmd => '72 - 01 - '.$RollSensor_Page4,		descr => 'Unit_1: RollSensor_Page4' },
        },
    },    
    'U1_PitchSensor_SMI_Serial0'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$PitchSensor_Addr0x5,	descr => 'Unit_1: PitchSensor_Addr0x5' },
            1.4 => { cmd => '72 - 01 - '.$PitchSensor_Page4,	descr => 'Unit_1: PitchSensor_Page4' } ,
        },
    },    
    'U1_InertialSensor1_SMI_Serial0'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x5,	descr => 'Unit_1: InertialSensor1_Addr0x5' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page4,	descr => 'Unit_1: InertialSensor1_Page4' },
        },
    },
#FW_Version	
    'U1_InertialSensor1_FW_Version'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x9,	descr => 'Unit_1: InertialSensor1_Addr0x9' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page4,	descr => 'Unit_1: InertialSensor1_Page4' },
        },
    },    	
#EoC	
    'U1_InertialSensor1_EoC'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0xA,	descr => 'Unit_1: InertialSensor1_Addr0xA' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page0,	descr => 'Unit_1: InertialSensor1_Page0' },
        },
    },    	
#OREG1, OREG2, OREG3
	'U1_InertialSensor1_OREG1' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x5,		descr => 'Unit_1: InertialSensor1_Addr0x5' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page0,		descr => 'Unit_1: InertialSensor1_Page0' },
        },											  		  
    },
	'U1_InertialSensor1_OREG2' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x6,	descr => 'Unit_1: InertialSensor1_Addr0x6' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page0,	descr => 'Unit_1: InertialSensor1_Page0' },
        },											  		  
    },
	'U1_InertialSensor1_OREG3' => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x7,	descr => 'Unit_1: InertialSensor1_Addr0x7' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page0,	descr => 'Unit_1: InertialSensor1_Page0' },
        },											  		  
    },
#ChStatHwScon
    'U1_YawSensor_ChStatHwScon'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawSensor_Addr0x8,	descr => 'Unit_1: YawSensor_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$YawSensor_Page1,		descr => 'Unit_1: YawSensor_Page1' },
        },
    },    
    'U1_RollSensor_ChStatHwScon'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$RollSensor_Addr0x8,	descr => 'Unit_1: RollSensor_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$RollSensor_Page1,		descr => 'Unit_1: RollSensor_Page1' },
        },
    },    
    'U1_PitchSensor_ChStatHwScon'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$PitchSensor_Addr0x8,	descr => 'Unit_1: PitchSensor_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$PitchSensor_Page1,	descr => 'Unit_1: PitchSensor_Page1' },
        },
    },    
    'U1_YawPlausiSensor_ChStatHwScon'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawPlausiSensor_Addr0x8,	descr => 'Unit_1: YawPlausiSensor_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$YawPlausiSensor_Page1,	descr => 'Unit_1: YawPlausiSensor_Page1' },
        },
    },
    'U1_InertialSensor1_ChStatHwScon'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x8,	descr => 'Unit_1: InertialSensor1_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page1,	descr => 'Unit_1: InertialSensor1_Page1' },
        },
    },
    'U1_InertialSensor2_ChStatHwScon'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor2_Addr0x8,	descr => 'Unit_1: InertialSensor2_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor2_Page1,	descr => 'Unit_1: InertialSensor2_Page1' },
        },
    },
#ErrorFlag16_Bank0
    'U1_YawSensor_ErrorFlag16_Bank0'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawSensor_Addr0x1,	descr => 'Unit_1: YawSensor_Addr0x1' },
            1.4 => { cmd => '72 - 01 - '.$YawSensor_Page2,		descr => 'Unit_1: YawSensor_Page2' },
        },
    },    
    'U1_RollSensor_ErrorFlag16_Bank0'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$RollSensor_Addr0x1,	descr => 'Unit_1: RollSensor_Addr0x1' },
            1.4 => { cmd => '72 - 01 - '.$RollSensor_Page2,		descr => 'Unit_1: RollSensor_Page2' },
        },
    },    
    'U1_PitchSensor_ErrorFlag16_Bank0'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$PitchSensor_Addr0x1,	descr => 'Unit_1: PitchSensor_Addr0x1' },
            1.4 => { cmd => '72 - 01 - '.$PitchSensor_Page2,	descr => 'Unit_1: PitchSensor_Page2' },
        },
    },    
    'U1_YawPlausiSensor_ErrorFlag16_Bank0'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawPlausiSensor_Addr0x1,	descr => 'Unit_1: YawPlausiSensor_Addr0x1' },
            1.4 => { cmd => '72 - 01 - '.$YawPlausiSensor_Page2,	descr => 'Unit_1: YawPlausiSensor_Page2' },
        },
    },
    'U1_InertialSensor1_ErrorFlag16_Bank0'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x1,	descr => 'Unit_1: YawPlausiSensor_Addr0x1' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page2,	descr => 'Unit_1: YawPlausiSensor_Page2' },
        },
    },
#ErrorFlag16_Bank7
    'U1_YawSensor_ErrorFlag16_Bank7'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawSensor_Addr0x8,	descr => 'Unit_1: YawSensor_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$YawSensor_Page2,		descr => 'Unit_1: YawSensor_Page2' },
        },
    },    
    'U1_RollSensor_ErrorFlag16_Bank7'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$RollSensor_Addr0x8,	descr => 'Unit_1: RollSensor_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$RollSensor_Page2,		descr => 'Unit_1: RollSensor_Page2' },
        },
    },    
    'U1_PitchSensor_ErrorFlag16_Bank7'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$PitchSensor_Addr0x8,	descr => 'Unit_1: PitchSensor_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$PitchSensor_Page2,	descr => 'Unit_1: PitchSensor_Page2' },
        },
    },    
    'U1_YawPlausiSensor_ErrorFlag16_Bank7'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$YawPlausiSensor_Addr0x8,	descr => 'Unit_1: YawPlausiSensor_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$YawPlausiSensor_Page2,	descr => 'Unit_1: YawPlausiSensor_Page2' },
        },
    },
    'U1_InertialSensor1_ErrorFlag16_Bank7'  => {
        'CMD_sequence' => {
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x8,	descr => 'Unit_1: InertialSensor1_Addr0x8' },
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page2,	descr => 'Unit_1: InertialSensor1_Page2' },
        },
    },
   	
#Mode, time and count
#--------------------
    'U1_Mode_65ms' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 01 - 01 - 40 00 FF FF',	descr => 'Unit_1_Mode:40 00 FF FF' },
        },
    },    
    'U1_Mode_1500ms' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_1: Mode: 40 16 E3 60' },
        },
    },    
    'U1_Mode_10200ms' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 01 - 01 - 40 9B A3 C0', 	descr => 'Unit_1_Mode: 40 9B A3 C0' },
        },
    },
	'U1_Mode_InitTest_2x'  => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 01 - 01 - 10 00 00 02',		descr => 'Unit_1_Mode: 10 00 00 02' },
        },											  		  
    },	
	'U1_Mode_InitTest_3x'  => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 01 - 01 - 10 00 00 03',		descr => 'Unit_1_Mode: 10 00 00 03' },
        },											  		  
    },
	'U1_Mode_InitTest_4x'  => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 01 - 01 - 10 00 00 04',		descr => 'Unit_1_Mode: 10 00 00 04' },
        },											  		  
    },
	'U1_Mode_InitTest_6x'  => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 01 - 01 - 10 00 00 06',		descr => 'Unit_1_Mode: 10 00 00 06' },
        },											  		  
    },
#Manipulate, ctrl and data
#-------------------------
    'U1_Invert_Data_Bit3'  => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - 00 00 00 00', descr => 'Unit_1_Ctrl: 00 00 00 00' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 00 40', descr => 'Unit_1_Data: 00 00 00 40' },
        },											  	  		  
    },	
    'U1_Invert_Data_Bit5'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - 00 00 00 00',	descr => 'Unit_1_Ctrl: 00 00 00 00' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 01 00',	descr => 'Unit_1_Data: 00 00 01 00' },
        },
    }, 

    'U1_Invert_PAGE_Bit1' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - 00 00 00 00',	descr => 'Unit_1_Ctrl: 00 00 00 00' },
            1.8 => { cmd => '43 - 01 - 01 - 00 10 00 00',	descr => 'Unit_1_Data: 00 10 00 00' },
        },
    }, 

    'U1_Invert_MID_Bit0' => {
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - 00 00 00 00',	descr => 'Unit_1_Ctrl: 00 00 00 00' },
            1.8 => { cmd => '43 - 01 - 01 - 00 40 00 00',	descr => 'Unit_1_Data: 00 40 00 00' },
        },
    },
    'U1_SerialNr_Set_Data'  =>  {
        'CMD_sequence' => {			
            1.7 => { cmd => '42 - 01 - 01 - 00 07 FF F8',	descr => 'Unit_1_Ctrl: 00 07 FF F8' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 00 88',	descr => 'Unit_1_Data: 00 00 08 88' },
        },
    },    			
    'U1_RevisionID_Set_Data'  =>  {
        'CMD_sequence' => {			
            1.7 => { cmd => '42 - 01 - 01 - 00 07 FF F8',	descr => 'Unit_1_Ctrl: 00 07 FF F8' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 88 88',	descr => 'Unit_1_Data: 00 00 88 88' },
        },
    },    			
    'U1_EoC_Set_Data'  =>  {
        'CMD_sequence' => {			
            1.7 => { cmd => '42 - 01 - 01 - 00 07 FF F8',	descr => 'Unit_1_Ctrl: 00 07 FF F8' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 00 00',	descr => 'Unit_1_Data: 00 00 00 00' },
        },
    },    			

# SMI7	
    'U1_SMI7_Set_ACC1_HF_StatHwScon_01'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC1_HF_StatHwScon_01,	descr => 'Unit_1_Ctrl: SMI7_ACC1_HF_StatHwScon_01' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC1_HF_StatHwScon_01,	descr => 'Unit_1_Data: SMI7_ACC1_HF_StatHwScon_01' },
        },
    }, 
    'U1_SMI7_Set_ACC1_HF_StatHwScon_10'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC1_HF_StatHwScon_10,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC1_HF_StatHwScon_10,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_10' },
        },
    }, 
    'U1_SMI7_Set_ACC1_HF_StatHwScon_11'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC1_HF_StatHwScon_11,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC1_HF_StatHwScon_11,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_11' },
        },
    }, 
    'U1_SMI7_Set_ACC1_LF_StatHwScon_01'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC1_LF_StatHwScon_01,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC1_LF_StatHwScon_01,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_01' },
        },
    }, 
    'U1_SMI7_Set_ACC1_LF_StatHwScon_10'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC1_LF_StatHwScon_10,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC1_LF_StatHwScon_10,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_10' },
        },
    }, 
    'U1_SMI7_Set_ACC1_LF_StatHwScon_11'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC1_LF_StatHwScon_11,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC1_LF_StatHwScon_11,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_11' },
        },
    }, 
    'U1_SMI7_Set_ACC2_HF_StatHwScon_01'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC2_HF_StatHwScon_01,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC2_HF_StatHwScon_01,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_01' },
        },
    }, 
    'U1_SMI7_Set_ACC2_HF_StatHwScon_10'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC2_HF_StatHwScon_10,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC2_HF_StatHwScon_10,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_10' },
        },
    }, 
    'U1_SMI7_Set_ACC2_HF_StatHwScon_11'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC2_HF_StatHwScon_11,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC2_HF_StatHwScon_11,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_11' },
        },
    }, 
    'U1_SMI7_Set_ACC2_LF_StatHwScon_01'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC2_LF_StatHwScon_01,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC2_LF_StatHwScon_01,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_01' },
        },
    }, 
    'U1_SMI7_Set_ACC2_LF_StatHwScon_10'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC2_LF_StatHwScon_10,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC2_LF_StatHwScon_10,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_10' },
        },
    }, 
    'U1_SMI7_Set_ACC2_LF_StatHwScon_11'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_ACC2_LF_StatHwScon_11,	descr => 'Unit_1_Ctrl: SMI7_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_ACC2_LF_StatHwScon_11,	descr => 'Unit_1_Data: SMI7_ACC3_LF_StatHwScon_11' },
        },
    }, 
    'U1_SMI7_Set_RATE_LF_StatHwScon_01'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_RATE_LF_StatHwScon_01,	descr => 'Unit_1_Ctrl: SMI7_RATE_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_RATE_LF_StatHwScon_01,	descr => 'Unit_1_Data: SMI7_RATE_LF_StatHwScon_01' },
        },
    }, 
    'U1_SMI7_Set_RATE_LF_StatHwScon_10'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_RATE_LF_StatHwScon_10,	descr => 'Unit_1_Ctrl: SMI7_RATE1_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_RATE_LF_StatHwScon_10,	descr => 'Unit_1_Data: SMI7_RATE1_LF_StatHwScon_10' },
        },
    }, 
    'U1_SMI7_Set_RATE_LF_StatHwScon_11'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI7_RATE_LF_StatHwScon_11,	descr => 'Unit_1_Ctrl: SMI7_RATE1_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI7_RATE_LF_StatHwScon_11,	descr => 'Unit_1_Data: SMI7_RATE1_LF_StatHwScon_11' },
        },
    }, 
	
# SMI8	
    'U1_SMI8_Set_ACC1_HF_StatHwScon_01'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC1_HF_StatHwScon_01,	descr => 'Unit_1_Ctrl: SMI8_ACC1_HF_StatHwScon_01' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC1_HF_StatHwScon_01,	descr => 'Unit_1_Data: SMI8_ACC1_HF_StatHwScon_01' },
        },
    }, 
    'U1_SMI8_Set_ACC1_HF_StatHwScon_10'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC1_HF_StatHwScon_10,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC1_HF_StatHwScon_10,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_10' },
        },
    }, 
    'U1_SMI8_Set_ACC1_HF_StatHwScon_11'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC1_HF_StatHwScon_11,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC1_HF_StatHwScon_11,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_11' },
        },
    }, 
    'U1_SMI8_Set_ACC1_LF_StatHwScon_01'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC1_LF_StatHwScon_01,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC1_LF_StatHwScon_01,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_01' },
        },
    }, 
    'U1_SMI8_Set_ACC1_LF_StatHwScon_10'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC1_LF_StatHwScon_10,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC1_LF_StatHwScon_10,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_10' },
        },
    }, 
    'U1_SMI8_Set_ACC1_LF_StatHwScon_11'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC1_LF_StatHwScon_11,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC1_LF_StatHwScon_11,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_11' },
        },
    }, 
    'U1_SMI8_Set_ACC2_HF_StatHwScon_01'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC2_HF_StatHwScon_01,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC2_HF_StatHwScon_01,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_01' },
        },
    }, 
    'U1_SMI8_Set_ACC2_HF_StatHwScon_10'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC2_HF_StatHwScon_10,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC2_HF_StatHwScon_10,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_10' },
        },
    }, 
    'U1_SMI8_Set_ACC2_HF_StatHwScon_11'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC2_HF_StatHwScon_11,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC2_HF_StatHwScon_11,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_11' },
        },
    }, 
    'U1_SMI8_Set_ACC2_LF_StatHwScon_01'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC2_LF_StatHwScon_01,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC2_LF_StatHwScon_01,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_01' },
        },
    }, 
    'U1_SMI8_Set_ACC2_LF_StatHwScon_10'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC2_LF_StatHwScon_10,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC2_LF_StatHwScon_10,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_10' },
        },
    }, 
    'U1_SMI8_Set_ACC2_LF_StatHwScon_11'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_ACC2_LF_StatHwScon_11,	descr => 'Unit_1_Ctrl: SMI8_ACC3_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_ACC2_LF_StatHwScon_11,	descr => 'Unit_1_Data: SMI8_ACC3_LF_StatHwScon_11' },
        },
    }, 
    'U1_SMI8_Set_RATE1_LF_StatHwScon_01'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_RATE1_LF_StatHwScon_01,	descr => 'Unit_1_Ctrl: SMI8_RATE1_LF_StatHwScon_01' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_RATE1_LF_StatHwScon_01,	descr => 'Unit_1_Data: SMI8_RATE1_LF_StatHwScon_01' },
        },
    }, 
    'U1_SMI8_Set_RATE1_LF_StatHwScon_10'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_RATE1_LF_StatHwScon_10,	descr => 'Unit_1_Ctrl: SMI8_RATE1_LF_StatHwScon_10' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_RATE1_LF_StatHwScon_10,	descr => 'Unit_1_Data: SMI8_RATE1_LF_StatHwScon_10' },
        },
    }, 
    'U1_SMI8_Set_RATE1_LF_StatHwScon_11'  =>  { 
        'CMD_sequence' => {
            1.7 => { cmd => '42 - 01 - 01 - '.$SMI8_RATE1_LF_StatHwScon_11,	descr => 'Unit_1_Ctrl: SMI8_RATE1_LF_StatHwScon_11' },
            1.8 => { cmd => '43 - 01 - 01 - '.$SMI8_RATE1_LF_StatHwScon_11,	descr => 'Unit_1_Data: SMI8_RATE1_LF_StatHwScon_11' },
        },
    }, 

#Mode, time and count Manipulate, ctrl and data
#-------------------- -------------------------	
    'U1_Read_Status_HW_SCON' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 01 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Unit_1_Mode: 10 00 00 01 - 10 00 00 01 - 10 00 00 01' },
            1.7 => { cmd => '42 - 01 - 03 - 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8', descr => 'Unit_1_Ctrl; 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Unit_1_Data: 00 00 00 80 - 00 00 00 40 - 00 00 00 20' },         
        },
    },
    'U1_Read_ErrorFlags' => {
        'CMD_sequence' => {
            1.6 => { cmd => '41 - 01 - 04 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Unit_1_Mode: 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01' },
            1.7 => { cmd => '42 - 01 - 04 - 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8', descr => 'Unit_1_Ctrl: 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8' },
            1.8 => { cmd => '43 - 01 - 04 - 00 00 00 10 - 00 00 00 80 - 00 00 00 40 - 00 00 00 10', descr => 'Unit_1_Data: 00 00 00 10 - 00 00 00 80 - 00 00 00 40 - 00 00 00 10' },         
        },
    },
	
#PreTrigger
#----------
	'U1_PreTrig_Mask' => {
        'CMD_sequence' => {
			1.5 => { cmd => '65 - 01 - '.$PreTrigger_0,			descr => 'Unit_0: Configure PreTrig_Unit: Unit=0' },
        },											  		  
    },
	
	'PreTrig0_Mask' => {
        'CMD_sequence' => {
            0.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3,			descr => 'PreTrig0: SMI7_SPI1_CS3' },
			0.2 => { cmd => '62 - 00 - FF C0 01 E0',			descr => 'PreTrig0: FF C0 01 E0' },
            0.4 => { cmd => '64 - 00 - 00 00 0B B8',			descr => 'PreTrig0: 00 00 0B B8, 3ms' },			
        },											  		  
    },

	'PreTrig0_Sensor1_ParID0'  => {
        'CMD_sequence' => {
			0.3 => { cmd => '63 - 00 - 48 C0 00 00',			descr => 'PreTrigUnit_0: Configure PreTrig_Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },											  		  
    },
	'PreTrig0_Sensor1_ParID1'  => {
        'CMD_sequence' => {
			0.3 => { cmd => '63 - 00 - 48 C0 00 20',			descr => 'PreTrigUnit_0: Configure PreTrig_Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },											  		  
    },			
	'PreTrig0_Sensor1_ParID2'  => {
        'CMD_sequence' => {
			0.3 => { cmd => '63 - 00 - 48 C0 00 40',			descr => 'PreTrigUnit_0: Configure PreTrig_Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },											  		  
    },			
	'PreTrig0_Sensor1_ParID3'  => {
        'CMD_sequence' => {
			0.3 => { cmd => '63 - 00 - 48 C0 00 60',			descr => 'PreTrigUnit_0: Configure PreTrig_Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },											  		  
    },			
	'PreTrig0_Sensor1_ParID4'  => {
        'CMD_sequence' => {
			0.3 => { cmd => '63 - 00 - 48 C0 00 80',			descr => 'PreTrigUnit_0: Configure PreTrig_Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },											  		  
    },			
	'PreTrig0_Sensor1_ParID5'  => {
        'CMD_sequence' => {
			0.3 => { cmd => '63 - 00 - 48 C0 00 A0',			descr => 'PreTrigUnit_0: Configure PreTrig_Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },											  		  
    },			
	'PreTrig0_Sensor1_ParID6'  => {
        'CMD_sequence' => {
			0.3 => { cmd => '63 - 00 - 48 C0 00 C0',			descr => 'PreTrigUnit_0: Configure PreTrig_Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },											  		  
    },			
	'PreTrig0_Sensor1_ParID7'  => {
        'CMD_sequence' => {
			0.3 => { cmd => '63 - 00 - 48 C0 00 E0',			descr => 'PreTrigUnit_0: Configure PreTrig_Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },											  		  
    },			
	'PreTrig0_Sensor1_ParID8'  => {
        'CMD_sequence' => {
			0.3 => { cmd => '63 - 00 - 48 C0 01 00',			descr => 'PreTrigUnit_0: Configure PreTrig_Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },											  		  
    },			
	'PreTrig0_Sensor1_ParID9'  => {
        'CMD_sequence' => {
			0.3 => { cmd => '63 - 00 - 48 C0 01 20',			descr => 'PreTrigUnit_0: Configure PreTrig_Pattern: YawSensor_Addr0x1(IREG1), & WriteMode' },
        },											  		  
    },

#Unit_2
#*************************************************************	
#SPI_CS and StandardMask
#----------------------
    'U2_SMI_StandardMask'  => {
        'CMD_sequence' => {
            2.1 => { cmd => '31 - 02 - '.$SMI_SPI1_CS3,			descr => 'Unit_2: SMI_SPI1_CS3' },
            2.2 => { cmd => '32 - 02 - '.$SMI_StandardMask,		descr => 'Unit_2: SMI_StandardMask'},
        },
    },    
#Trigger pattern
#---------------
#ASIC_Serial1
	'U2_YawSensor_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$YawSensor_Addr0x1,		descr => 'Unit_2: YawSensor_Addr0x1' },
            2.4 => { cmd => '72 - 02 - '.$YawSensor_Page4,			descr => 'Unit_2: YawSensor_Page4' },
        },											  		  
    },
	'U2_YawPlausiSensor_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$YawPlausiSensor_Addr0x1,	descr => 'Unit_2: YawPlausiSensor_Addr0x1' },
            2.4 => { cmd => '72 - 02 - '.$YawPlausiSensor_Page4,	descr => 'Unit_2: YawPlausiSensor_Page4' },
        },											  		  
    },
	'U2_RollSensor_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$RollSensor_Addr0x1,		descr => 'Unit_2: RollSensor_Addr0x1' },
            2.4 => { cmd => '72 - 02 - '.$RollSensor_Page4,			descr => 'Unit_2: RollSensor_Page4' },
        },											  		  
    },
	'U2_PitchSensor_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$PitchSensor_Addr0x1,		descr => 'Unit_2: PitchSensor_Addr0x1' },
            2.4 => { cmd => '72 - 02 - '.$PitchSensor_Page4,		descr => 'Unit_2: PitchSensor_Page4' },
        },											  		  
    },
	'U2_InertialSensor1_ASIC_Serial1' => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$InertialSensor1_Addr0x1,	descr => 'Unit_2: InertialSensor1_Addr0x1' },
            2.4 => { cmd => '72 - 02 - '.$InertialSensor1_Page4,	descr => 'Unit_2: InertialSensor1_Page4' } ,
        },											  		  
    },
#SMI_Serial1	
    'U2_YawSensor_SMI_Serial1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$YawSensor_Addr0x6,	descr => 'Unit_2: YawSensor_Addr0x6' },
            2.4 => { cmd => '72 - 02 - '.$YawSensor_Page4,		descr => 'Unit_2: YawSensor_Page4' },
        },
    },    
    'U2_YawPlausiSensor_SMI_Serial1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$YawPlausiSensor_Addr0x6,	descr => 'Unit_2: YawPlausiSensor_Addr0x6' },
            2.4 => { cmd => '72 - 02 - '.$YawPlausiSensor_Page4,	descr => 'Unit_2: YawPlausiSensor_Page4' },
        },
    },    
    'U2_RollSensor_SMI_Serial1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$RollSensor_Addr0x6,	descr => 'Unit_2: RollSensor_Addr0x6' },
            2.4 => { cmd => '72 - 02 - '.$RollSensor_Page4,		descr => 'Unit_2: RollSensor_Page4' },
        },
    },    
    'U2_PitchSensor_SMI_Serial1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$PitchSensor_Addr0x6,	descr => 'Unit_2: PitchSensor_Addr0x6' },
            2.4 => { cmd => '72 - 02 - '.$PitchSensor_Page4,	descr => 'Unit_2: PitchSensor_Page4' },
        },
    },    
    'U2_InertialSensor1_SMI_Serial1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$InertialSensor1_Addr0x6,	descr => 'Unit_2: InertialSensor1_Addr0x6' },
            2.4 => { cmd => '72 - 02 - '.$InertialSensor1_Page4,	descr => 'Unit_2: InertialSensor1_Page4' } ,
        },
    },    		
#ClusterFlags
	'U2_YawSensor_ClusterFlags'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$YawSensor_Addr0xF,	descr => 'Unit_2: YawSensor_Addr0xF' },
	        2.4 => { cmd => '72 - 02 - '.$YawSensor_Page2,		descr => 'Unit_2: YawSensor_Page2' },
        },
    },
	'U2_RollSensor_ClusterFlags'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$RollSensor_Addr0xF,	descr => 'Unit_2: RollSensor_Addr0xF' },
	        2.4 => { cmd => '72 - 02 - '.$RollSensor_Page2,		descr => 'Unit_2: RollSensor_Page2' },
        },
    },
	'U2_PitchSensor_ClusterFlags'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$PitchSensor_Addr0xF,	descr => 'Unit_2: PitchSensor_Addr0xF' },
	        2.4 => { cmd => '72 - 02 - '.$PitchSensor_Page2,	descr => 'Unit_2: PitchSensor_Page2' },
        },
    },
'	U2_YawPlausiSensor_ClusterFlags'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$YawPlausiSensor_Addr0xF,	descr => 'Unit_2: YawPlausiSensor_Addr0xF' },
	        2.4 => { cmd => '72 - 02 - '.$YawPlausiSensor_Page2,	descr => 'Unit_2: YawPlausiSensor_Page2' },
        },
    },	
	'U2_InertialSensor1_ClusterFlags'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$InertialSensor1_Addr0xF,	descr => 'Unit_2: InertialSensor1_Addr0xF' },
	        2.4 => { cmd => '72 - 02 - '.$InertialSensor1_Page2,	descr => 'Unit_2: InertialSensor1_Page2' },
        },
    },
#Temp1
	'U2_YawSensor_Temp1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$YawSensor_Addr0x0,	descr => 'Unit_2: YawSensor_Addr0x0' },
	        2.4 => { cmd => '72 - 02 - '.$YawSensor_Page2,		descr => 'Unit_2: YawSensor_Page2' },
        },
    },
	'U2_YawPlausiSensor_Temp1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$YawPlausiSensor_Addr0x0,	descr => 'Unit_2: YawPlausiSensor_Addr0x0' },
	        2.4 => { cmd => '72 - 02 - '.$YawPlausiSensor_Page2,	descr => 'Unit_2: YawPlausiSensor_Page2' },
        },
    },	
	'U2_RollSensor_Temp1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$RollSensor_Addr0x0,	descr => 'Unit_2: RollSensor_Addr0x0' },
	        2.4 => { cmd => '72 - 02 - '.$RollSensor_Page2,		descr => 'Unit_2: RollSensor_Page2' },
        },
    },
	'U2_PitchSensor_Temp1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$PitchSensor_Addr0x0,	descr => 'Unit_2: PitchSensor_Addr0x0' },
	        2.4 => { cmd => '72 - 02 - '.$PitchSensor_Page2,	descr => 'Unit_2: PitchSensor_Page2' },
        },
    },
	'U2_InertialSensor1_Temp1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$InertialSensor1_Addr0x0,	descr => 'Unit_2: InertialSensor1_Addr0x0' },
	        2.4 => { cmd => '72 - 02 - '.$InertialSensor1_Page2,	descr => 'Unit_2: InertialSensor1_Page2' },
        },
    },
#ErrorFlag16_Bank1
    'U2_YawSensor_ErrorFlag16_Bank1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$YawSensor_Addr0x2,	descr => 'Unit_2: YawSensor_Addr0x2' },
            2.4 => { cmd => '72 - 02 - '.$YawSensor_Page2,		descr => 'Unit_2: YawSensor_Page2' },
        },
    },    
    'U2_RollSensor_ErrorFlag16_Bank1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$RollSensor_Addr0x2,	descr => 'Unit_2: RollSensor_Addr0x2' },
            2.4 => { cmd => '72 - 02 - '.$RollSensor_Page2,		descr => 'Unit_2: RollSensor_Page2' },
        },
    },    
    'U2_PitchSensor_ErrorFlag16_Bank1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$PitchSensor_Addr0x2,	descr => 'Unit_2: PitchSensor_Addr0x2' },
            2.4 => { cmd => '72 - 02 - '.$PitchSensor_Page2,	descr => 'Unit_2: PitchSensor_Page2' },
        },
    },    
    'U2_YawPlausiSensor_ErrorFlag16_Bank1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$YawPlausiSensor_Addr0x2,	descr => 'Unit_2: YawPlausiSensor_Addr0x2' },
            2.4 => { cmd => '72 - 02 - '.$YawPlausiSensor_Page2,	descr => 'Unit_2: YawPlausiSensor_Page2' },
        },
    },
    'U2_InertialSensor1_ErrorFlag16_Bank1'  => {
        'CMD_sequence' => {
            2.3 => { cmd => '33 - 02 - '.$InertialSensor1_Addr0x2,	descr => 'Unit_2: YawPlausiSensor_Addr0x2' },
            2.4 => { cmd => '72 - 02 - '.$InertialSensor1_Page2,	descr => 'Unit_2: YawPlausiSensor_Page2' },
        },
    },
	
#Mode, time and count
#--------------------
    'U2_Mode_65ms' => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 02 - 01 - 40 00 FF FF',	descr => 'Unit_2_Mode: 40 00 FF FF' },
        },
    },
    'U2_Mode_1500ms' => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 02 - 01 - 40 16 E3 60',	descr => 'Unit_2_Mode: 40 16 E3 60' },
        },
    },    
	'U2_Mode_InitTest_2x'  => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 02 - 01 - 10 00 00 02',		descr => 'Unit_2_Mode: 10 00 00 02' },
        },											  		  
    },
	'U2_Mode_InitTest_3x'  => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 02 - 01 - 10 00 00 03',		descr => 'Unit_2_Mode: 10 00 00 03' },
        },											  		  
    },
	
#Manipulate, ctrl and data
#-------------------------
    'U2_Invert_CRC_Bit2' => {
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 00 00 00', 	descr => 'Unit_2_Ctrl: 00 00 00 00' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 00 04', 	descr => 'Unit_2_Data: 00 00 00 07' },
        },
    },
    'U2_Invert_PAGE_Bit1' => {
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 00 00 00',	descr => 'Unit_2_Ctrl: 00 00 00 00' },
            2.8 => { cmd => '43 - 02 - 01 - 00 10 00 00',	descr => 'Unit_2_Data: 00 10 00 00' },
        },
    },
    'U2_StoreEE_Value' => {
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2_Ctrl: 00 07 FF F8' },
            2.8 => { cmd => '43 - 02 - 01 - 00 04 21 08', descr => 'Unit_2_Data: 00 04 21 08' },
        },
    },
    'U2_SerialNr_Set_Data'  =>  {
        'CMD_sequence' => {			
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8',	descr => 'Unit_2_Ctrl: 00 07 FF F8' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 88 00',	descr => 'Unit_2_Data: 00 00 08 88' },
        },
    },    			
	
#Mode, time and count Manipulate, ctrl and data
#-------------------- -------------------------	
    'U2_Read_Cluster_Flags' => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 02 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Unit_2_Mode: 10 00 00 01 - 10 00 00 01 - 10 00 00 01' },
            2.7 => { cmd => '42 - 02 - 03 - 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8', descr => 'Unit_2_Ctrl; 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8' },
            2.8 => { cmd => '43 - 02 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Unit_2_Data: 00 00 00 80 - 00 00 00 40 - 00 00 00 20' },         
        },
    },
    'U2_Read_ErrorFlags' => {
        'CMD_sequence' => {
            2.6 => { cmd => '41 - 02 - 04 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Unit_2_Mode: 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01' },
            2.7 => { cmd => '42 - 02 - 04 - 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8', descr => 'Unit_2_Ctrl: 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8 - 00 00 07 F8' },
            2.8 => { cmd => '43 - 02 - 04 - 00 00 00 10 - 00 00 01 00 - 00 00 00 80 - 00 00 00 10', descr => 'Unit_2_Data: 00 00 00 10 - 00 00 01 00 - 00 00 00 80 - 00 00 00 10' },         
        },
    },
	
#Unit_3
#*************************************************************	
#SPI_CS and SensorMask
#---------------------
    'U3_SMA_SensorMask'  =>  {
        'CMD_sequence' => {
            3.1 => { cmd => '31 - 03 - '.$SMA_SPI_CS,     descr => 'Unit_3: SMA_SPI_CS' },
            3.2 => { cmd => '32 - 03 - '.$SMA_SensorMask, descr => 'Unit_3: SMA_SensorMask' },
        },
    },
    'U3_SMI_StandardMask'  => {
        'CMD_sequence' => {
            3.1 => { cmd => '31 - 03 - '.$SMI_SPI1_CS3,			descr => 'Unit_3: SMI_SPI1_CS3' },
            3.2 => { cmd => '32 - 03 - '.$SMI_StandardMask,		descr => 'Unit_3: SMI_StandardMask'},
        },
    },        
#Trigger pattern
#---------------
    'U3_SMA_Channel_1'  =>  {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$SMA_Channel_1,  descr => 'Unit_3: SMA_Channel_1' },
        },
    },
#ASIC_Serial2
	'U3_YawSensor_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$YawSensor_Addr0x2,		descr => 'Unit_3: YawSensor_Addr0x2' },
            3.4 => { cmd => '72 - 03 - '.$YawSensor_Page4,			descr => 'Unit_3: YawSensor_Page4' },
        },											  		  
    },
	'U3_YawPlausiSensor_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$YawPlausiSensor_Addr0x2,	descr => 'Unit_3: YawPlausiSensor_Addr0x2' },
            3.4 => { cmd => '72 - 03 - '.$YawPlausiSensor_Page4,	descr => 'Unit_3: YawPlausiSensor_Page4' },
        },											  		  
    },
	'U3_RollSensor_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$RollSensor_Addr0x2,		descr => 'Unit_3: RollSensor_Addr0x2' },
            3.4 => { cmd => '72 - 03 - '.$RollSensor_Page4,			descr => 'Unit_3: RollSensor_Page4' },
        },											  		  
    },
	'U3_PitchSensor_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$PitchSensor_Addr0x2,		descr => 'Unit_3: PitchSensor_Addr0x2' },
            3.4 => { cmd => '72 - 03 - '.$PitchSensor_Page4,		descr => 'Unit_3: PitchSensor_Page4' },
        },											  		  
    },
	'U3_InertialSensor1_ASIC_Serial2' => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$InertialSensor1_Addr0x2,	descr => 'Unit_3: InertialSensor1_Addr0x2' },
            3.4 => { cmd => '72 - 03 - '.$InertialSensor1_Page4,	descr => 'Unit_3: InertialSensor1_Page4' },
        },											  		  
    },
#SMI_Serial2	
    'U3_YawSensor_SMI_Serial2'  => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$YawSensor_Addr0x7,	descr => 'Unit_3: YawSensor_Addr0x7' },
            3.4 => { cmd => '72 - 03 - '.$YawSensor_Page4,		descr => 'Unit_3: YawSensor_Page4' },
        },
    },    
    'U3_YawPlausiSensor_SMI_Serial2'  => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$YawPlausiSensor_Addr0x7,	descr => 'Unit_3: YawPlausiSensor_Addr0x7' },
            3.4 => { cmd => '72 - 03 - '.$YawPlausiSensor_Page4,		descr => 'Unit_3: YawPlausiSensor_Page4' },
        },
    },    
    'U3_RollSensor_SMI_Serial2'  => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$RollSensor_Addr0x7,	descr => 'Unit_3: RollSensor_Addr0x7' },
            3.4 => { cmd => '72 - 03 - '.$RollSensor_Page4,		descr => 'Unit_3: RollSensor_Page4' },
        },
    },    
    'U3_PitchSensor_SMI_Serial2'  => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$PitchSensor_Addr0x7,	descr => 'Unit_3: PitchSensor_Addr0x7' },
            3.4 => { cmd => '72 - 03 - '.$PitchSensor_Page4,		descr => 'Unit_3: PitchSensor_Page4' },
        },
    },    
    'U3_InertialSensor1_SMI_Serial2'  => {
        'CMD_sequence' => {
            3.3 => { cmd => '33 - 03 - '.$YawSensor_Addr0x7,	descr => 'Unit_3: InertialSensor1_Addr0x7' },
            3.4 => { cmd => '72 - 03 - '.$YawSensor_Page4,		descr => 'Unit_3: InertialSensor1_Page4' },
        },
    },	
#Mode and time 
#-------------
    'U3_Mode_65ms' => {
        'CMD_sequence' => {
            3.6 => { cmd => '41 - 03 - 01 - 40 00 FF FF',	descr => 'Unit_3: 40 00 FF FF' },
        },
    },       
    'U3_Mode_1500ms' => {
        'CMD_sequence' => {
            3.6 => { cmd => '41 - 03 - 01 - 40 16 E3 60', descr => 'Unit_3: Mode: 40 16 E3 60' },
        },
    },    
    'U3_Mode_10200ms' => {
        'CMD_sequence' => {
            3.6 => { cmd => '41 - 03 - 01 - 40 9B A3 C0', 	descr => 'Unit_3: 40 9B A3 C0' },
        },
    },
	'U3_Mode_InitTest_3x'  => {
        'CMD_sequence' => {
            3.6 => { cmd => '41 - 03 - 01 - 10 00 00 03',		descr => 'Unit_3_Mode: 10 00 00 03' },
        },											  		  
    },
    
#Manipulate, ctrl and data
#-------------------------
    'U3_Set_Data_4'  =>  {
        'CMD_sequence' => {			
            3.7 => { cmd => '42 - 03 - 01 - 00 0F FF F0',	descr => 'Unit_3_Ctrl: 00 0F FF F0' },
            3.8 => { cmd => '43 - 03 - 01 - 00 00 04 00',	descr => 'Unit_3_Data: 00 00 04 00' },
        },
    },    			
    'U3_SerialNr_Set_Data'  =>  {
        'CMD_sequence' => {			
            3.7 => { cmd => '42 - 03 - 01 - 00 07 FF F8',	descr => 'Unit_3_Ctrl: 00 07 FF F8' },
            3.8 => { cmd => '43 - 03 - 01 - 00 00 88 88',	descr => 'Unit_3_Data: 00 00 08 88' },
        },
    },    			
    'U3_SerialNr_Set_Data_Ok'  =>  {
        'CMD_sequence' => {			
            3.7 => { cmd => '42 - 03 - 01 - 00 00 7F F8',	descr => 'Unit_3_Ctrl: 00 00 7F F8' },
            3.8 => { cmd => '43 - 03 - 01 - 00 00 08 88',	descr => 'Unit_3_Data: 00 00 08 88' },
        },
    },    			
		
#***************************************************************************************
    'YawSensor_Read_Temperature'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x0, descr => 'Unit_0: Set SPI Pattern for command SMI7xx_YAW:20_TEMP1:MOSI' },
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'},
            # Configure FIFOs for SMI7xx        #100ms
            0.6 => { cmd => '41 - 00 - 02 - 40 01 86 A0 - 40 01 86 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 03 FF F8 - 00 04 7F F8', descr => 'Unit_0: Write FIFO data' },
        },
    },
#***************************************************************************************
    'YawPlausiSensor_Read_Temperature'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - '.$YawPlausiSensor_Addr0x0, descr => 'Unit_0: Set SPI Pattern for command SMI7xx_YAW:20_TEMP1:MOSI' },
            0.4 => { cmd => '72 - 00 - '.$YawPlausiSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'},
            # Configure FIFOs for SMI7xx        #100ms
            0.6 => { cmd => '41 - 00 - 02 - 40 01 86 A0 - 40 01 86 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 03 FF F8 - 00 04 7F F8', descr => 'Unit_0: Write FIFO data' },
        },
    },
#***************************************************************************************
    'RollSensor_Read_Temperature'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx RollSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x0, descr => 'Unit_0: Set SPI Pattern for command SMI7xx_ROLL:20_TEMP1:MOSI'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_2'} ,
            # Configure FIFOs for SMI7xx        #100ms
            0.6 => { cmd => '41 - 00 - 02 - 40 01 86 A0 - 40 01 86 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 03 FF F8 - 00 04 7F F8', descr => 'Unit_0: Write FIFO data' },
        },
    },
#***************************************************************************************
    'PitchSensor_Read_Temperature'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx RollSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$PitchSensor_Addr0x0, descr => 'Unit_0: Set SPI Pattern for command SMI7xx_ROLL:20_TEMP1:MOSI'} ,
            0.4 => { cmd => '72 - 00 - '.$PitchSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_2'} ,
            # Configure FIFOs for SMI7xx        #100ms
            0.6 => { cmd => '41 - 00 - 02 - 40 01 86 A0 - 40 01 86 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 03 FF F8 - 00 04 7F F8', descr => 'Unit_0: Write FIFO data' },
        },
    },
#***************************************************************************************
    'InertialSensor1_Read_Temperature'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' },
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' },
            0.3 => { cmd => '33 - 00 - '.$InertialSensor1_Addr0x0, descr => 'Unit_0: Set SPI Pattern for command SMI7xx_YAW:20_TEMP1:MOSI' },
            0.4 => { cmd => '72 - 00 - '.$InertialSensor1_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'},
            # Configure FIFOs for SMI7xx        #100ms
            0.6 => { cmd => '41 - 00 - 02 - 40 01 86 A0 - 40 01 86 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 07 FF F8 - 00 07 FF F8', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 03 FF F8 - 00 04 7F F8', descr => 'Unit_0: Write FIFO data' },
        },
    },
        	
#***************************************************************************************
    'YawRateLfPlausiChl_CN_Flag_Ini_Check_3x'  =>  {
#***************************************************************************************
# SMI7_SensorMask    = FF 00 00 00 
# YawRateLfPlausiChl = 13 00 00 00
# in order to avoid that AUTO_CALIB command
# is manipulated instead of YawRateLfPlausiChl.
# For the first 6 bits YawRateLfPlausiChl is the same as AUTO_CALIB command.
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - FF 00 00 00', descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - 13 00 00 00', descr => 'Unit_0: Set SPI Pattern for command SMI7xx_ROLL:20_TEMP1:MOSI'} ,
            # Configure FIFOs for SMI7xx                     
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 03', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
        },
    },   
#***************************************************************************************
    'YawRateLfPlausiChl_CN_Flag_Ini_Check_2x'  =>  {
#***************************************************************************************
# SMI7_SensorMask    = FF 00 00 00 
# YawRateLfPlausiChl = 13 00 00 00
# in order to avoid that AUTO_CALIB command
# is manipulated instead of YawRateLfPlausiChl.
# For the first 6 bits YawRateLfPlausiChl is the same as AUTO_CALIB command.
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - FF 00 00 00', descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - 13 00 00 00', descr => 'Unit_0: Set SPI Pattern for command SMI7xx_ROLL:20_TEMP1:MOSI'} ,
            # Configure FIFOs for SMI7xx                     
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 02', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
        },
    },   

# Do not check OE bit
#***************************************************************************************
    'InertialSensor1_OE_Bit_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            1.1 => { cmd => '31 - 01 - '.$SMI_SPI1_CS3,		 		descr => 'Unit_1: Set SPI1 and CS for SMI7xx YawSensor' } ,
            1.2 => { cmd => '32 - 01 - '.$SMI_SensorMask,	 		descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$InertialSensor1_Addr0x3,	descr => 'Unit_1: Select YawSensor Adr_3'} ,
            1.4 => { cmd => '72 - 01 - '.$InertialSensor1_Page4,	descr => 'Unit_1: Select YawSensor Page_4'} ,
            # Manipulate OE-flag              
            1.6 => { cmd => '41 - 01 - 01 - 10 00 00 03', 	descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 04 00 00 00', 	descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 04 00 00 00', 	descr => 'Unit_1: Write FIFO data' },
        },											  	  		  
    },	
#***************************************************************************************
    'YawRateLfChl_OE_Bit_Check'  =>  { #cluster flag command page fault
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI manipulation for YawRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI7'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI SensorMask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfChl,		descr => 'Unit_0: Set trigger to YawRateLfChl'} ,
            # Manipulate OE-flag              
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 1F', 	descr => 'Unit_0: SCM-mode 31 manipulations' },
            0.7 => { cmd => '42 - 00 - 01 - 04 00 00 00', 	descr => 'Unit_0: set OE-bit' },
            0.8 => { cmd => '43 - 00 - 01 - 04 00 00 00', 	descr => 'Unit_0: set OE-bit' },
        },											  	  		  
    },	
				
#Initial absolute offset check (ax, ay, az)
#***************************************************************************************
    'AccXLgChl_InitAbsOffset_Check_T3'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl, descr => 'Unit_0: Set SPI Pattern for command SMI7'} ,
            # Configure FIFOs for SMI7xx	   						  	  
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 01 97 40 - 00 01 98 40 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },											  	  		  
    },
#***************************************************************************************
    'AccXLgChl_InitAbsOffset_Check_T2'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl, descr => 'Unit_0: Set SPI Pattern for command SMI7'} ,
            # Configure FIFOs for SMI7xx	   						  	  
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 01 97 40 - 00 00 05 40 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },											  	  		  
    },
#***************************************************************************************
    'AccXLgChl_InitAbsOffset_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl, descr => 'Unit_0: Set SPI Pattern for command SMI7'} ,
            # Configure FIFOs for SMI7xx	   						  	  
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 00 05 40 - 00 00 04 40 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },											  	  		  
    },

#***************************************************************************************
    'AccYLgChl_InitAbsOffset_Check_T3'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to AccYLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgChl, descr => 'Unit_0: Set SPI Pattern for command SMI7'} ,
            # Configure FIFOs for SMI7xx				  	  
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 01 97 40 - 00 01 98 40 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },											  	  		  
    },				
#***************************************************************************************
    'AccYLgChl_InitAbsOffset_Check_T2'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to AccYLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgChl, descr => 'Unit_0: Set SPI Pattern for command SMI7'} ,
            # Configure FIFOs for SMI7xx				  	  
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 01 97 40 - 00 00 05 40 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },											  	  		  
    },				
#***************************************************************************************
    'AccYLgChl_InitAbsOffset_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to AccYLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgChl, descr => 'Unit_0: Set SPI Pattern for command SMI7'} ,
            # Configure FIFOs for SMI7xx				  	  
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 96 40 - 00 00 05 40 - 00 00 04 40 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },											  	  		  
    },				

#***************************************************************************************
    'AccZLgChl_InitAbsOffset_Check_T3'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to AccZLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccZLgChl, descr => 'Unit_0: Set SPI Pattern for command SMI7'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 04 - 00 04 C2 C0 - 00 04 C3 C0 - 00 04 C4 C0 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },											  	  		  
    },
#***************************************************************************************
    'AccZLgChl_InitAbsOffset_Check_T2'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to AccZLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccZLgChl, descr => 'Unit_0: Set SPI Pattern for command SMI7'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 04 - 00 04 C2 C0 - 00 04 C3 C0 - 00 00 01 C0 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },											  	  		  
    },
#***************************************************************************************
    'AccZLgChl_InitAbsOffset_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to AccZLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccZLgChl, descr => 'Unit_0: Set SPI Pattern for command SMI7'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.6 => { cmd => '41 - 00 - 04 - 10 00 01 FF - 10 00 01 FF - 10 00 01 FF - 10 00 05 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 04 - 00 04 C3 C0 - 00 00 02 C0 - 00 00 01 C0 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },											  	  		  
    },

#-------------------------------------------------------------------------------------
#	                            SMI7 OTP content check
#-------------------------------------------------------------------------------------

# Common use for SMI7 and SMI8 OTP content check
#*************************************************************************************
	'OTPCheck_InitTest_3x'  => {
#*************************************************************************************
        'CMD_sequence' => {
            # Configure FIFOs for SMI7xx						  	  
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 03',		descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
#            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 FF',		descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
        },											  		  
    },

# Common use for SMI7 and SMI8 OTP content check
#*************************************************************************************
	'OTPCheck_InitTest_2x'  => {
#*************************************************************************************
        'CMD_sequence' => {
            # Configure FIFOs for SMI7xx						  	  
            0.6 => { cmd => '41 - 00 - 01 - 10 00 00 02',		descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 2' },
        },											  		  
    },

#***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG0_Check1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Select SPI1 and CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask for SMI7xx Module Command' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x4, descr => 'Unit_0: Set SPI Pattern to Adr=0x4'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Select SMI7xx Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 07 F8 00', descr => 'Unit_0: Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 10 00', descr => 'Unit_0: Configure data-register' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 38', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG0_Check2_pass'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Select SPI1 and CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask for SMI7xx Module Command' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x4, descr => 'Unit_0: Set SPI Pattern to Adr=0x4'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Select SMI7xx Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx					# 95 ms	  	  
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 73 18 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Unit_0: Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 20 00 - 00 00 20 00 - 00 00 10 00', descr => 'Unit_0: Configure data-register' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 38', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 01 9A 28', descr => 'Unit_0: PT Time: 105 ms'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG0_Check3_pass'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx RollSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x4, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x5'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx				    # 95 ms	  
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 73 18 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Unit_0: Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 30 00 - 00 00 30 00 - 00 00 10 00', descr => 'Unit_0: Configure data-register' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 38', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 01 9A 28', descr => 'Unit_0: PT Time: 105 ms'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG0_Check2_fail'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Select SPI1 and CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask for SMI7xx Module Command' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x4, descr => 'Unit_0: Set SPI Pattern to Adr=0x4'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Select SMI7xx Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx					# 305 ms	  	  
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 04 A7 68 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
#                                                              105 ms
#            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 9A 28 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Unit_0: Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 20 00 - 00 00 20 00 - 00 00 10 00', descr => 'Unit_0: Configure data-register' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 38', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 04 CE 78', descr => 'Unit_0: PT Time: 315 ms'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG0_Check3_fail'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx RollSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x4, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x5'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx				    # 305 ms	  
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 04 A7 68 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
#                                                              105 ms
#            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 9A 28 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Unit_0: Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 30 00 - 00 00 30 00 - 00 00 10 00', descr => 'Unit_0: Configure data-register' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 38', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 04 CE 78', descr => 'Unit_0: PT Time: 315 ms'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG1_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx RollSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x5, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x5'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 38', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 38', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_B0C1_OREG3_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx RollSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x7, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x7'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 80', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 38', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'RollSensor_OTPcontent_B0C3_OREG0_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x4, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x5'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 07 F8 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 10 00', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
			1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 60', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  		  
    },
	
#***************************************************************************************
    'RollSensor_OTPcontent_B0C1_OREG0_Check2_pass'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Select SPI1 and CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask for SMI7xx Module Command' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x4, descr => 'Unit_0: Set SPI Pattern to Adr=0x4'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Select SMI7xx Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx					# 95 ms	  	  
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 73 18 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Unit_0: Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 20 00 - 00 00 20 00 - 00 00 10 00', descr => 'Unit_0: Configure data-register' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 60', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 01 9A 28', descr => 'Unit_0: PT Time: 105 ms'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'RollSensor_OTPcontent_B0C1_OREG0_Check3_pass'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx RollSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x4, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x5'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx				    # 95 ms	  
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 73 18 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Unit_0: Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 30 00 - 00 00 30 00 - 00 00 10 00', descr => 'Unit_0: Configure data-register' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 60', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 01 9A 28', descr => 'Unit_0: PT Time: 105 ms'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'RollSensor_OTPcontent_B0C1_OREG0_Check2_fail'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Select SPI1 and CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask for SMI7xx Module Command' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x4, descr => 'Unit_0: Set SPI Pattern to Adr=0x4'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Select SMI7xx Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx					# 305 ms	  	  
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 04 A7 68 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
#                                                              105 ms
#            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 9A 28 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Unit_0: Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 20 00 - 00 00 20 00 - 00 00 10 00', descr => 'Unit_0: Configure data-register' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 60', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 04 CE 78', descr => 'Unit_0: PT Time: 315 ms'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'RollSensor_OTPcontent_B0C1_OREG0_Check3_fail'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx RollSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x4, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x5'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx				    # 305 ms	  
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 04 A7 68 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
#                                                              105 ms
#            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 02 - 40 01 9A 28 - 10 00 00 02', descr => 'Unit_0: Configure Mode: Mode = SCM, Cnt = 3' },
            0.7 => { cmd => '42 - 00 - 03 - 00 07 F8 00 - 00 07 F8 00 - 00 07 F8 00', descr => 'Unit_0: Configure ctrl-register' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 30 00 - 00 00 30 00 - 00 00 10 00', descr => 'Unit_0: Configure data-register' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 60', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 04 CE 78', descr => 'Unit_0: PT Time: 315 ms'} ,			
        },											  	  		  
    },	

#***************************************************************************************
    'RollSensor_OTPcontent_B0C3_OREG1_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x5, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x5'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
			1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 60', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  		  
    },
#*************************************************************************************
	'RollSensor_OTPcontent_B0C3_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 60', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  		  
    },
#*************************************************************************************	    
	'RollSensor_OTPcontent_B0C3_OREG3_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x7, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x7'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 80', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 60', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  		  
    },
    
#***************************************************************************************
    'YawSensor_OTPcontent_B0C2_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 4C', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_B0C3_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 60', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_E01C_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 03 80', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_E01E_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 03 D8', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_E020_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 04 04', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_E022_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 04 5C', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_E024_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 04 98', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_E026_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 04 C0', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },	
#***************************************************************************************
    'YawSensor_OTPcontent_850D_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command SMI710 Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D0 A1 B8', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
        },											  	  		  
    },
	
#*************************************************************************************
	'RollSensor_OTPcontent_B0C1_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 38', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  		  
    },
#*************************************************************************************
	'RollSensor_OTPcontent_B0C2_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D6 18 4C', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  		  
    },
#*************************************************************************************
	'RollSensor_OTPcontent_E01C_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 03 80', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  		  
    },
#*************************************************************************************
	'RollSensor_OTPcontent_E01E_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 03 D8', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  		  
    },
#*************************************************************************************
	'RollSensor_OTPcontent_E020_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 04 04', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  		  
    },
#*************************************************************************************
	'RollSensor_OTPcontent_E022_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 04 5C', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  		  
    },
#*************************************************************************************
	'RollSensor_OTPcontent_E024_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 04 98', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  		  
    },
#*************************************************************************************
	'RollSensor_OTPcontent_E026_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx YawSensor' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command Roll Adr=0x6'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0, descr => 'Unit_0: Set trigger_1'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: Write FIFO data' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0', descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 DC 04 C0', descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF', descr => 'Unit_0: PT Time'} ,			
         },											  		  
    },
#*************************************************************************************
	'RollSensor_OTPcontent_850D_OREG2_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,	 		descr => 'Unit_0: Configure SMI7_SPI1_CS3' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, 	descr => 'Unit_0: Configure SMI7_StandardMask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6,	descr => 'Unit_0: Configure RollSensor_Addr0x6, OREG2'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page0,	 	descr => 'Unit_0: Configure RollSensor_Page0'} ,
			0.5 => { cmd => '65 - 00 - '.$PreTrigger_0,	 	descr => 'Unit_0: Configure PreTrigger_0'} ,
            # Configure FIFOs for SMI7xx						  	  
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00',	 	descr => 'Unit_0:' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08',	 	descr => 'Unit_0: Invert DataBit_0' },
			# Configure 1. pre trigger to SMI7xx
            1.1 => { cmd => '61 - 00 - '.$SMI_SPI1_CS3,	 		descr => 'Unit_0: Set SPI1 CS pre trigger' } ,
			1.2 => { cmd => '62 - 00 - 00 1F FF E0',		 	descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '63 - 00 - 48 D0 A1 B8',		 	descr => 'Unit_0: Set SPI Pattern'} ,
            1.4 => { cmd => '64 - 00 - 00 00 FF FF',		 	descr => 'Unit_0: PT Time'} ,			
        },											  		  
    },
		
#-------------------------------------------------------------------------------------	
	
# SD Realtime
#***************************************************************************************
    'YawRateLfChl_SD_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfChl, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },	
#***************************************************************************************
    'YawRateLfPlausiChl_SD_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfPlausiChl, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },	
#***************************************************************************************
    'AccZLgChl_SD_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccZLgChl, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },
#***************************************************************************************
    'AccYLgChl_SD_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgChl, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },
#***************************************************************************************
    'AccYLgPlausiChl_SD_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgPlausiChl, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },
#***************************************************************************************
    'AccXLgChl_SD_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },
#***************************************************************************************
    'AccXHgMonChl_SD_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$AccXHgMonChl, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 00 C3 50', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },
#***************************************************************************************
    'RollRateLfChl_SD_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 00 E3 50', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 00 E3 50', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },
#***************************************************************************************
    'PitchRateLfChl_SD_Check'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$PitchRateLfChl, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 00 E3 50', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 00 E3 50', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },
		
# MID check Background 
#***************************************************************************************
    'YawSensor_MID_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x5, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx		#1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 40 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
#***************************************************************************************
    'YawPlausiSensor_MID_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawPlausiSensor_Addr0x5, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$YawPlausiSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx		#1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 40 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
	
#***************************************************************************************
    'RollSensor_MID_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx	     #1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 40 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },		
#***************************************************************************************
    'PitchSensor_MID_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$PitchSensor_Addr0x6, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$PitchSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx	     #1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 40 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },		
#***************************************************************************************
    'InertialSensor1_MID_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$InertialSensor1_Addr0x5, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$InertialSensor1_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx		#1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 40 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
	
# Page Bit check Background
#***************************************************************************************
    'YawSensor_Page_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx	     #1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 38 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx	    #1.5s			
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
#***************************************************************************************
    'YawPlausiSensor_Page_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawPlausiSensor_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$YawPlausiSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx	     #1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 38 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx	    #1.5s			
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
#***************************************************************************************
    'RollSensor_Page_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x9, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_2'} ,
            # Configure FIFOs for SMI7xx		#1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 38 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx		#1.5s		
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
#***************************************************************************************
    'PitchSensor_Page_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$PitchSensor_Addr0x9, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$PitchSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_2'} ,
            # Configure FIFOs for SMI7xx		#1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 38 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx		#1.5s		
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
#***************************************************************************************
    'InertialSensor1_Page_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$InertialSensor1_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$InertialSensor1_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx	     #1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 38 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx	    #1.5s			
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },	
	
		
# CRC Bits check Background
#***************************************************************************************
    'YawSensor_CRC_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx	     #1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 02', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx	    #1.5s			
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
#***************************************************************************************
    'YawPlausiSensor_CRC_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawPlausiSensor_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$YawPlausiSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx	     #1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 02', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx	    #1.5s			
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
#***************************************************************************************
    'RollSensor_CRC_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x9, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_2'} ,
            # Configure FIFOs for SMI7xx		#1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 02', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx		#1.5s		
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },	
#***************************************************************************************
    'PitchSensor_CRC_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$PitchSensor_Addr0x9, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$PitchSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_2'} ,
            # Configure FIFOs for SMI7xx		#1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 02', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx		#1.5s		
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
#***************************************************************************************
    'InertialSensor1_CRC_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$InertialSensor1_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$InertialSensor1_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx	     #1.5s
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 02', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx	    #1.5s			
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	

#SD bit check Background
#***************************************************************************************
	'YawSensor_SD_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - FC 00 00 00', descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
#***************************************************************************************
    'YawPlausiSensor_SD_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - FC 00 00 00', descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawPlausiSensor_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$YawPlausiSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	
	
#***************************************************************************************
    'RollSensor_SD_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - - FC 00 00 00', descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_2'} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },
#***************************************************************************************
    'PitchSensor_SD_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - - FC 00 00 00', descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$PitchSensor_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$PitchSensor_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_11 Page_2'} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
        },											 
    },
#***************************************************************************************
	'InertialSensor1_SD_Check_T1'  => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - FC 00 00 00', descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$InertialSensor1_Addr0x8, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$InertialSensor1_Page2, descr => 'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx					
            0.6 => { cmd => '41 - 00 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 01 - 02 00 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx					
            1.6 => { cmd => '41 - 01 - 01 - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00', descr => 'Unit_0: Write FIFO data' },
         },											 
    },	

#***************************************************************************************
#	Overload
#***************************************************************************************
#***************************************************************************************
    'YawRateLfChl_Overload_X0_T1'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 08 00', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
        
#***************************************************************************************
    'YawRateLfPlausiChl_Overload_X0_T1'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 08 00', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'RollRateLfChl_Overload_X0_T1'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 01 00 00', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'PitchRateLfChl_Overload_X0_T1'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 01 00 00', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'AccZLgChl_Overload_X0_T1'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 01 00 00', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'AccZLgChl_Overload_X0_T2'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 01 08 00', descr => 'Unit_2: Write FIFO data X -> 0' },         
        },
    },        
#***************************************************************************************
    'AccYLgChl_Overload_X0_T1'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 00 20', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'AccYLgChl_Overload_X0_T2'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 08 20', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'AccYLgPlausiChl_Overload_X0_T1'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 00 20', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'AccYLgPlausiChl_Overload_X0_T2'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI manipulation for AccYLgChl
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 08 20', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'AccXLgChl_Overload_X0_T1'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 01 00 00', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'AccXLgChl_Overload_X0_T2'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 01 08 00', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'AccXHgMonChl_Overload_X0_T1'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 01 00 00', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
#***************************************************************************************
    'AccXHgMonChl_Overload_X0_T2'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            2.7 => { cmd => '42 - 02 - 01 - 00 07 FF F8', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 01 08 00', descr => 'Unit_2: Write FIFO data' },         
        },
    },        
    
#************************************************************************************
    'Relative_Offset_Check_T3'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl, descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 07 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 01 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 07 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 07 - 00 01 02 00 - 00 01 04 00 - 00 01 02 00 - 00 01 04 00 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
            # Configure SPI trigger for AccYLgChl                                                                            
            1.1 => { cmd => '31 - 01 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},                   
            1.2 => { cmd => '32 - 01 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask'} ,                                    
            1.3 => { cmd => '33 - 01 - '.$AccYLgChl, descr => 'Unit_0: Set SPI Pattern'} ,                                 
            # Configure FIFOs for SMI7                                                                                       
            1.6 => { cmd => '41 - 01 - 07 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 01 FF', descr => 'Unit_0: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 07 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 07 - 00 01 02 00 - 00 01 04 00 - 00 01 02 00 - 00 01 04 00 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
            # Configure SPI trigger for AccZLgChl                                                                            
            2.1 => { cmd => '31 - 02 - '.$SMI_SPI1_CS3, descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},                   
            2.2 => { cmd => '32 - 02 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask'} ,                                    
            2.3 => { cmd => '33 - 02 - '.$AccZLgChl, descr => 'Unit_0: Set SPI Pattern'} ,                                 
            # Configure FIFOs for SMI7                                                                                       
            2.6 => { cmd => '41 - 02 - 07 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 01 FF', descr => 'Unit_0: Write FIFO mode and time' },
            2.7 => { cmd => '42 - 02 - 07 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 07 - 00 01 34 80 - 00 01 38 80 - 00 01 34 80 - 00 01 38 80 - 00 01 34 80 - 00 01 38 80 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'Relative_Offset_Check_T2'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 03 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 01 02 00 - 00 01 04 00 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
            # Configure SPI trigger for AccYLgChl                                                                            
            1.1 => { cmd => '31 - 01 - '.$SMI_SPI1_CS3,		descr => 'Unit_1: Set SPI1 CS for SMI700 YawSensor'},                   
            1.2 => { cmd => '32 - 01 - '.$SMI_SensorMask,	descr => 'Unit_1: Set SPI Mask'} ,                                    
            1.3 => { cmd => '33 - 01 - '.$AccYLgChl,		descr => 'Unit_1: Set SPI Pattern'} ,                                 
            # Configure FIFOs for SMI7                                                                                       
            1.6 => { cmd => '41 - 01 - 05 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 03 FF', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 05 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 05 - 00 01 02 00 - 00 01 04 00 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Unit_1: Write FIFO data' },
            # Configure SPI trigger for AccZLgChl                                                                            
            2.1 => { cmd => '31 - 02 - '.$SMI_SPI1_CS3,		descr => 'Unit_2: Set SPI1 CS for SMI700 YawSensor'},                   
            2.2 => { cmd => '32 - 02 - '.$SMI_SensorMask,	descr => 'Unit_2: Set SPI Mask'} ,                                    
            2.3 => { cmd => '33 - 02 - '.$AccZLgChl,		descr => 'Unit_2: Set SPI Pattern'} ,                                 
            # Configure FIFOs for SMI7                                                                                       
            2.6 => { cmd => '41 - 02 - 05 - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 00 FF - 10 00 03 FF', descr => 'Unit_2: Write FIFO mode and time' },
            2.7 => { cmd => '42 - 02 - 05 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF F0', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 05 - 00 01 34 80 - 00 01 38 80 - 00 01 34 80 - 00 01 38 80 - 00 01 34 80', descr => 'Unit_2: Write FIFO data' },
        },
    },
#************************************************************************************
    'Relative_Offset_Check_T1'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 FF - 10 00 00 FF - 10 00 05 FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
            # Configure SPI trigger for AccYLgChl                                                                            
            1.1 => { cmd => '31 - 01 - '.$SMI_SPI1_CS3,		descr => 'Unit_1: Set SPI1 CS for SMI700 YawSensor'},                   
            1.2 => { cmd => '32 - 01 - '.$SMI_SensorMask,	descr => 'Unit_1: Set SPI Mask'} ,                                    
            1.3 => { cmd => '33 - 01 - '.$AccYLgChl,		descr => 'Unit_1: Set SPI Pattern'} ,                                 
            # Configure FIFOs for SMI7                                                                                       
            1.6 => { cmd => '41 - 01 - 03 - 10 00 00 FF - 10 00 00 FF - 10 00 05 FF', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF 00 - 00 0F FF 00 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 01 02 00 - 00 01 04 00 - 00 00 00 00', descr => 'Unit_1: Write FIFO data' },
            # Configure SPI trigger for AccZLgChl                                                                            
            2.1 => { cmd => '31 - 02 - '.$SMI_SPI1_CS3,		descr => 'Unit_2: Set SPI1 CS for SMI700 YawSensor'},                   
            2.2 => { cmd => '32 - 02 - '.$SMI_SensorMask,	descr => 'Unit_2: Set SPI Mask'} ,                                    
            2.3 => { cmd => '33 - 02 - '.$AccZLgChl,		descr => 'Unit_2: Set SPI Pattern'} ,                                 
            # Configure FIFOs for SMI7                                                                                       
            2.6 => { cmd => '41 - 02 - 03 - 10 00 00 FF - 10 00 00 FF - 10 00 05 FF', descr => 'Unit_2: Write FIFO mode and time' },
            2.7 => { cmd => '42 - 02 - 03 - 00 0F FF 80 - 00 0F FF 80 - 00 0F FF F0', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 03 - 00 01 34 80 - 00 01 38 80 - 00 01 34 80', descr => 'Unit_2: Write FIFO data' },
        },
    },

#************************************************************************************
    'YawRateLfChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'YawRateLfPlausiChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgPlausiChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		  descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	  descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfPlausiChl, descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'RollRateLfChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'PitchRateLfChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$PitchRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'AccZLgChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccZLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'AccYLgChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'AccYLgPlausiChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgPlausiChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'AccXLgChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'AccXHgMonChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXHgMonChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'AccYHgMonChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccYHgMonChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'YawRateLfPlausiChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		  descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	  descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfPlausiChl, descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#************************************************************************************
    'AccYLgPlausiChl_Read_Sensor_Data'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgPlausiChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7	       
            0.6 => { cmd => '41 - 00 - 05 - 10 00 00 0F - 10 00 00 01 - 10 00 00 01 - 10 00 00 01 - 10 00 00 0F', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 05 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 05 - 00 00 00 00 - 00 00 08 00 - 00 00 07 00 - 00 00 06 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO data' },
        },
    },

#***************************************************************************************
    'YawSensor_Read_IntErrCnt45'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI700 Read_IntErrCnt45
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,			descr => 'Unit_0: Set SPI1 to SMI7_CS'},
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask,		descr => 'Unit_0: Set SPI to SMI7_ModuleMask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0xD,	descr => 'Unit_0: Set SPI Pattern to YawSensor_Addr0xD'} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page2,		descr => 'Unit_0: Select SMI7 YawSensor_Page2' },
            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Unit_0: Write FIFO data' },
        },
    },    
#***************************************************************************************
    'RollSensor_Read_IntErrCnt45'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI700 Read_IntErrCnt45
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,			descr => 'Unit_0: Set SPI1 to SMI7_CS'},
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask,		descr => 'Unit_0: Set SPI to SMI7_ModuleMask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollSensor_Addr0xD,	descr => 'Unit_0: Set SPI Pattern to RollSensor_Addr0xD'} ,
            0.4 => { cmd => '72 - 00 - '.$RollSensor_Page2,		descr => 'Unit_0: Select SMI7 RollSensor_Page2' },
            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Unit_0: Write FIFO data' },
        },
    },    
#***************************************************************************************
    'PitchSensor_Read_IntErrCnt45'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI700 Read_IntErrCnt45
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,			descr => 'Unit_0: Set SPI1 to SMI7_CS'},
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask,		descr => 'Unit_0: Set SPI to SMI7_ModuleMask'} ,
            0.3 => { cmd => '33 - 00 - '.$PitchSensor_Addr0xD,	descr => 'Unit_0: Set SPI Pattern to RollSensor_Addr0xD'} ,
            0.4 => { cmd => '72 - 00 - '.$PitchSensor_Page2,	descr => 'Unit_0: Select SMI7 RollSensor_Page2' },
            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Unit_0: Write FIFO data' },
        },
    },    
#***************************************************************************************
    'YawPlausiSensor_Read_IntErrCnt45'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI700 Read_IntErrCnt45
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,				descr => 'Unit_0: Set SPI1 to SMI7_CS'},
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask,			descr => 'Unit_0: Set SPI to SMI7_ModuleMask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawPlausiSensor_Addr0xD,	descr => 'Unit_0: Set SPI Pattern to YawPlausiSensor_Addr0xD'} ,
            0.4 => { cmd => '72 - 00 - '.$YawPlausiSensor_Page2,	descr => 'Unit_0: Select SMI7 YawPlausiSensor_Page2' },
            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Unit_0: Write FIFO data' },
        },
    },    
#**************************************************************************************
    'InertialSensor1_Read_IntErrCnt45'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI700 Read_IntErrCnt45
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,			descr => 'Unit_0: Set SPI1 to SMI7_CS'},
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask,		descr => 'Unit_0: Set SPI to SMI7_ModuleMask'} ,
            0.3 => { cmd => '33 - 00 - '.$InertialSensor1_Addr0xD,	descr => 'Unit_0: Set SPI Pattern to YawSensor_Addr0xD'} ,
            0.4 => { cmd => '72 - 00 - '.$InertialSensor1_Page2,	descr => 'Unit_0: Select SMI7 YawSensor_Page2' },
            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 03 - 10 00 00 01 - 10 00 00 01 - 10 00 00 01', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 00 00 F8 - 00 00 00 F8 - 00 00 00 F8', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 00 00 80 - 00 00 00 40 - 00 00 00 20', descr => 'Unit_0: Write FIFO data' },
        },
    },    
#*

##***************************************************************************************
    'FieldCalibration'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
           # Configure SPI trigger to SMA66x channel_0
            0.1 => { cmd => '31 - 00 - '.$SMA_SPI_CS,		descr => 'Unit_0: Set SPI1' } ,
            0.2 => { cmd => '32 - 00 - '.$SMA_SensorMask,	descr => 'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$SMA_Channel_1,		descr => 'Unit_0: Set SPI Pattern for command  '} ,
            # Set trigger value           	   1048 ms       1048 ms
            0.6 => { cmd => '41 - 00 - 02 - 40 0F FF FF - 40 0F FF FF', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_0: Write FIFO data' },
        },
    },

#***************************************************************************************
	'FieldCalib_VDS_SensorFault'   => {
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger to SMI7xx
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3, descr =>		'Unit_0: Set SPI1 CS for SMI7xx ' } ,
            0.2 => { cmd => '32 - 00 - '.$SMI_StandardMask, descr =>	'Unit_0: Set SPI Mask' } ,
            0.3 => { cmd => '33 - 00 - '.$YawSensor_Addr0x8, descr =>	'Unit_0: Set SPI Pattern for command  '} ,
            0.4 => { cmd => '72 - 00 - '.$YawSensor_Page2, descr =>		'Unit_0: Set Mask for SMI7xx Adr_01 Page_2'} ,
            # Configure FIFOs for SMI7xx	     #4s          #1.5s
            0.6 => { cmd => '41 - 00 - 02 - 40 4F FF FF - 40 16 E3 60', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 00 00 00 - 00 00 00 00', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 00 00 00 - 00 38 00 00', descr => 'Unit_0: Write FIFO data' },
           # Configure data reference signal
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr =>		'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr =>	'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr =>	'Unit_1: Set SPI Pattern for command  '} ,
            # Configure FIFOs for SMI7xx		#4s		      #1.5s
            1.6 => { cmd => '41 - 01 - 02 - 40 4F FF FF - 40 16 E3 60', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 00 00 00 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 00 00 - 00 00 04 00', descr => 'Unit_1: Write FIFO data' },
        },											 
    },
	
#***************************************************************************************
    'FieldCalib_VDSFault_CN_Bit_Cal'  =>  { #CN fault + SCON Status = CRC fault #doors
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI700 YawSensor
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS and for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 01 - 40 00 FF FF', descr => 'Unit_0: timing mode 65 ms' },
            0.7 => { cmd => '42 - 00 - 01 - 00 00 00 00', descr => 'Unit_0: manipulate CN-bit' },
            0.8 => { cmd => '43 - 00 - 01 - 00 00 00 08', descr => 'Unit_0: manipulate CN-bit' },
            # Configure SPI trigger for SMI700 channel_status_hw_scon
            1.1 => { cmd => '31 - 01 - '.$SMI_SPI1_CS3,			descr => 'Unit_1: Select SPI1 and CS for SMI7xx'},
            1.2 => { cmd => '32 - 01 - '.$SMI_StandardMask, 	descr => 'Unit_1: Set SPI Mask'} ,
            1.3 => { cmd => '33 - 01 - '.$YawSensor_Addr0x8,	descr => 'Unit_1: Set SPI Pattern'} ,
            1.4 => { cmd => '72 - 01 - '.$YawSensor_Page1,		descr => 'Unit_1: Enable SMI7 Page Mask' },
            # Configure FIFOs for SMI7
            1.6 => { cmd => '41 - 01 - 01 - 40 00 FF FF', descr => 'Unit_1: timing mode 65 ms' },
            1.7 => { cmd => '42 - 01 - 01 - 00 00 00 00', descr => 'Unit_1: manipulate MID' },
            1.8 => { cmd => '43 - 01 - 01 - 00 40 00 00', descr => 'Unit_1: manipulate MID' },
           # Configure SPI trigger to SMA66x channel_0
            2.1 => { cmd => '31 - 02 - '.$SMA_SPI_CS,		descr => 'Unit_2: Set SPI1' } ,
            2.2 => { cmd => '32 - 02 - '.$SMA_SensorMask,	descr => 'Unit_2: Set SPI Mask' } ,
            2.3 => { cmd => '33 - 02 - '.$SMA_Channel_1,		descr => 'Unit_2: Set SPI Pattern for command  '} ,
            # Set trigger value           	      65 ms
            2.6 => { cmd => '41 - 02 - 01 - 40 00 FF FF', descr => 'Unit_2: Write FIFO mode and time' },
            2.7 => { cmd => '42 - 02 - 01 - 00 0F FF F0', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 02 00', descr => 'Unit_2: Write FIFO data' },
         },
    },    

#***************************************************************************************
    'FieldCalib_VDSFault_CN_Bit_Ver'  =>  { #CN fault + SCON Status = CRC fault #doors
#***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI700 YawSensor
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS and for SMI700 YawSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # Configure FIFOs for SMI7
            0.6 => { cmd => '41 - 00 - 02 - 40 0E FF FF - 40 00 FF FF', descr => 'Unit_0: timing mode 65 ms' },
            0.7 => { cmd => '42 - 00 - 02 - 00 00 00 00 - 00 00 00 00', descr => 'Unit_0: manipulate CN-bit' },
            0.8 => { cmd => '43 - 00 - 02 - 00 00 00 00 - 00 00 00 08', descr => 'Unit_0: manipulate CN-bit' },
            # Configure SPI trigger for SMI700 channel_status_hw_scon
            1.1 => { cmd => '31 - 01 - '.$SMI_SPI1_CS3,			descr => 'Unit_1: Select SPI1 and CS for SMI7xx'},
            1.2 => { cmd => '32 - 01 - '.$SMI_StandardMask,		descr => 'Unit_1: Set SPI Mask'} ,
            1.3 => { cmd => '33 - 01 - '.$YawSensor_Addr0x8,	descr => 'Unit_1: Set SPI Pattern'} ,
            1.4 => { cmd => '72 - 01 - '.$YawSensor_Page1,		descr => 'Unit_1: Enable SMI7 Page Mask' },
            # Configure FIFOs for SMI7
            1.6 => { cmd => '41 - 01 - 02 - 40 0E FF FF - 40 00 FF FF', descr => 'Unit_1: timing mode 65 ms' },
            1.7 => { cmd => '42 - 01 - 02 - 00 00 00 00 - 00 00 00 00', descr => 'Unit_1: manipulate MID' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 00 00 - 00 40 00 00', descr => 'Unit_1: manipulate MID' },
           # Configure SPI trigger to SMA66x channel_0
            2.1 => { cmd => '31 - 02 - '.$SMA_SPI_CS,		descr => 'Unit_2: Set SPI1' } ,
            2.2 => { cmd => '32 - 02 - '.$SMA_SensorMask,	descr => 'Unit_2: Set SPI Mask' } ,
            2.3 => { cmd => '33 - 02 - '.$SMA_Channel_1,		descr => 'Unit_2: Set SPI Pattern for command  '} ,
            # Set trigger value           	                    65 ms
            2.6 => { cmd => '41 - 02 - 02 - 40 0E FF FF - 40 00 FF FF', descr => 'Unit_2: Write FIFO mode and time' },
            2.7 => { cmd => '42 - 02 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 02 - 00 00 00 00 - 00 00 02 00', descr => 'Unit_2: Write FIFO data' },
         },
    },    
	
#***************************************************************************************
    'FieldCalibVer_sampling_check'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 RollRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            # Set trigger value           	    200 ms       1800 ms       200 ms        1900 ms
            0.6 => { cmd => '41 - 00 - 04 - 40 03 0D 40 - 40 1B 77 40 - 40 03 0D 40 - 40 1C FD E0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 00 00 00 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 04 - 00 01 1F F0 - 00 00 12 C0 - 00 00 00 00 - 00 00 12 C0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # Set trigger value           	    200 ms       1800 ms       200 ms        1900 ms
            1.6 => { cmd => '41 - 01 - 04 - 40 03 0D 40 - 40 1B 77 40 - 40 03 0D 40 - 40 1C FD E0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 04 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 04 - 00 00 04 00 - 00 00 02 00 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },

#***************************************************************************************
    'RollRateLfChl_FieldCalThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 RollRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                  200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 01 1F F0 - 00 00 12 D0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
#            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS, descr => 'Unit_0: Set SPI1' } ,
#            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
#            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, descr => 'Unit_0: Set SPI Pattern for command  '} ,
#            # Set trigger value           	    200 ms       2800 ms 
#            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
#            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
#            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_0: Write FIFO data' },
        },
    },
#***************************************************************************************
    'RollRateLfChl_FieldCalThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 RollRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            #                                 200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 01 1F F0 - 00 00 12 C0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # Set trigger value           	    200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'RollRateLfChl_FieldVerThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 RollRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            #                                  200 ms       1400 ms        2500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 01 1F F0 - 00 00 12 C0 - 00 00 15 F0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # Set trigger value           	    200 ms       1400 ms        2500 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'RollRateLfChl_FieldVerThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 RollRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            #                                200 ms       1400 ms        1400 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 01 1F F0 - 00 00 12 C0 - 00 00 15 E0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # Set trigger value           	    200 ms       1400 ms        1400 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'RollRateLfChl_FieldCalThdNeg_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 RollRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                  200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 01 1F F0 - 00 0F ED 30', descr => 'Unit_0: Write FIFO data' },
            # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                  200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'RollRateLfChl_FieldCalThdNeg_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 RollRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                  200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 01 1F F0 - 00 0F ED 40', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                  200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'RollRateLfChl_FieldVerThdNeg_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 RollRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            #                                  200 ms       1400 ms        2500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 01 1F F0 - 00 0F ED 40 - 00 0F EA 10', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                  200 ms       1400 ms        2500 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'RollRateLfChl_FieldVerThdNeg_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 RollRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$RollRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            #                                200 ms       1400 ms        1400 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 01 1F F0 - 00 0F ED 40 - 00 0F EA 20', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                200 ms       1400 ms        1400 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },

#***************************************************************************************
    'YawRateLfChl_FieldCalThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 YawRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                  200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 01 1F F0 - 00 00 12 D0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                  200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'YawRateLfChl_FieldCalThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 YawRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                  200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 01 1F F0 - 00 00 12 C0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1, 	descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                  200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'YawRateLfChl_FieldVerThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 YawRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            #                                  200 ms       1400 ms        2500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 01 1F F0 - 00 00 12 C0 - 00 00 15 F0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                  200 ms       1400 ms        2500 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'YawRateLfChl_FieldVerThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 YawRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$YawRateLfChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            #                                200 ms       1400 ms        1400 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 01 1F F0 - 00 00 12 C0 - 00 00 15 E0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                200 ms       1400 ms        1400 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },

#***************************************************************************************
    'PitchRateLfChl_FieldCalThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 PitchRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$PitchRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                  200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 01 1F F0 - 00 00 12 D0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                  200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'PitchRateLfChl_FieldCalThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 PitchRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$PitchRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                  200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 01 1F F0 - 00 00 12 C0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                  200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'PitchRateLfChl_FieldVerThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 PitchRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$PitchRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            #                                  200 ms       1400 ms        2500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 01 1F F0 - 00 00 12 C0 - 00 00 15 F0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                  200 ms       1400 ms        2500 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'PitchRateLfChl_FieldVerThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 PitchRateLfChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$PitchRateLfChl,	descr => 'Unit_0: Set SPI Pattern'} ,
            #                                200 ms       1400 ms        1400 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 01 1F F0 - 00 00 12 C0 - 00 00 15 E0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                200 ms       1400 ms        1400 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },

##***************************************************************************************
    'AccXLgChl_FieldCalThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                  200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 02 1F F0 - 00 00 2E 00', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                  200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccXLgChl_FieldCalThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                  200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 02 1F F0 - 00 00 2D F0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                  200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccXLgChl_FieldVerThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            #                                    200 ms       1400 ms       2500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 1F F0 - 00 00 2D F0 - 00 00 31 20', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                   200 ms        1400 ms       2500 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccXLgChl_FieldVerThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            #                                    200 ms       1400 ms       1400 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 1F F0 - 00 00 2D F0 - 00 00 31 10', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                    200 ms       1400 ms       1400 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
##***************************************************************************************
    'AccXLgChl_FieldCalThdNeg_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                     200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 02 1F F0 - 00 0F D2 00', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                     200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccXLgChl_FieldCalThdNeg_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                     200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 02 1F F0 - 00 0F D2 10', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                     200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccXLgChl_FieldVerThdNeg_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            #                                    200 ms       1400 ms       2500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 1F F0 - 00 0F D2 10 - 00 0F CE E0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                    200 ms       1400 ms       2500 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 0F CE F0', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccXLgChl_FieldVerThdNeg_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccXLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI sensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccXLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            #                                    200 ms       1400 ms       1400 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 1F F0 - 00 0F D2 10 - 00 0F CE F0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                    200 ms       1400 ms       1400 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },

##***************************************************************************************
    'AccYLgChl_FieldCalThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccYLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI sensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SMI SensorMask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgChl,		descr => 'Unit_0: Set SPI Pattern for AccYLgChl '} ,
            # 				                     200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 02 1F F0 - 00 00 2E 00', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                     200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccYLgChl_FieldCalThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccYLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                     200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 02 1F F0 - 00 00 2D F0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                     200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccYLgChl_FieldVerThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccYLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            #                                    200 ms       1400 ms       2500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 1F F0 - 00 00 2D F0 - 00 00 31 20', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                    200 ms       1400 ms       2500 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccYLgChl_FieldVerThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccYLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccYLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            #                                    200 ms       1400 ms       1400 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 02 1F F0 - 00 00 2D F0 - 00 00 31 10', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                200 ms       1400 ms        1400 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },

##***************************************************************************************
    'AccZLgChl_FieldCalThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccZLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccZLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                     200 ms       2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 04 1F F0 - 00 01 66 80', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                     200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccZLgChl_FieldCalThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccZLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccZLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            # 				                    200 ms        2800 ms 
            0.6 => { cmd => '41 - 00 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 02 - 00 04 1F F0 - 00 01 66 70', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            # 				                  200 ms       2800 ms 
            1.6 => { cmd => '41 - 01 - 02 - 40 03 0D 40 - 40 2A B9 80', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 02 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 02 - 00 00 04 00 - 00 00 02 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccZLgChl_FieldVerThd_NotOk'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccZLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccZLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            #                                  200 ms       1400 ms        2500 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 04 1F F0 - 00 01 66 70 - 00 01 69 A0', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                  200 ms       1400 ms        2500 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 26 25 A0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
#***************************************************************************************
    'AccZLgChl_FieldVerThd_Ok'  =>  {
##***************************************************************************************
        'CMD_sequence' => {
            # Configure SPI trigger for SMI7 AccZLgChl
            0.1 => { cmd => '31 - 00 - '.$SMI_SPI1_CS3,		descr => 'Unit_0: Set SPI1 CS for SMI710 RollSensor'},
            0.2 => { cmd => '32 - 00 - '.$SMI_SensorMask,	descr => 'Unit_0: Set SPI Mask'} ,
            0.3 => { cmd => '33 - 00 - '.$AccZLgChl,		descr => 'Unit_0: Set SPI Pattern'} ,
            #                                    200 ms       1400 ms       1400 ms
            0.6 => { cmd => '41 - 00 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_0: Write FIFO mode and time' },
            0.7 => { cmd => '42 - 00 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_0: Write FIFO ctrl' },
            0.8 => { cmd => '43 - 00 - 03 - 00 04 1F F0 - 00 01 66 70 - 00 01 69 90', descr => 'Unit_0: Write FIFO data' },
           # Configure SPI trigger to SMA66x channel_0
            1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
            1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
            1.3 => { cmd => '33 - 01 - '.$SMA_Channel_1,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
            #                                    200 ms       1400 ms       1400 ms
            1.6 => { cmd => '41 - 01 - 03 - 40 03 0D 40 - 40 15 5C C0 - 40 15 5C C0', descr => 'Unit_1: Write FIFO mode and time' },
            1.7 => { cmd => '42 - 01 - 03 - 00 0F FF F0 - 00 0F FF F0 - 00 0F FF F0', descr => 'Unit_1: Write FIFO ctrl' },
            1.8 => { cmd => '43 - 01 - 03 - 00 00 04 00 - 00 00 02 00 - 00 00 01 00', descr => 'Unit_1: Write FIFO data' },
        },
    },
	
#***************************************************************************************
    'Use_All_Para_Example_SMI'  =>  {
#***************************************************************************************
        'CMD_sequence' => {
			# Configure SPI trigger to SMA66x channel_0
			0.1 => { cmd => '31 - 00 - '.$SMA_SPI_CS,		descr => 'Unit_0: Set SPI1' } ,
			0.2 => { cmd => '32 - 00 - '.$SMA_SensorMask,	descr => 'Unit_0: Set SPI Mask' } ,
			0.3 => { cmd => '33 - 00 - '.$SMA_Channel_1,		descr => 'Unit_0: Set SPI Pattern for command  '} ,
			# Set trigger value           	    1000 ms
			0.6 => { cmd => '41 - 00 - 01 - 40 0F 42 40',		descr => 'Unit_0: Write FIFO mode and time' },
			0.7 => { cmd => '42 - 00 - 01 - 00 0F FF F0',		descr => 'Unit_0: Write FIFO ctrl' },
			0.8 => { cmd => '43 - 00 - 01 - 00 00 04 00',		descr => 'Unit_0: Write FIFO data' },
			# Configure SPI trigger to SMA66x channel_1
			1.1 => { cmd => '31 - 01 - '.$SMA_SPI_CS,		descr => 'Unit_1: Set SPI1' } ,
			1.2 => { cmd => '32 - 01 - '.$SMA_SensorMask,	descr => 'Unit_1: Set SPI Mask' } ,
			1.3 => { cmd => '33 - 01 - '.$SMA_Channel_2,		descr => 'Unit_1: Set SPI Pattern for command  '} ,
			# Set trigger value           	    1000 ms
			1.6 => { cmd => '41 - 01 - 01 - 40 0F 42 40',		descr => 'Unit_1: Write FIFO mode and time' },
			1.7 => { cmd => '42 - 01 - 01 - 00 0F FF F0',		descr => 'Unit_1: Write FIFO ctrl' },
			1.8 => { cmd => '43 - 01 - 01 - 00 00 04 00',		descr => 'Unit_1: Write FIFO data' },
            # Configure SPI trigger for SMI7 channel_status_hw_scon register
			2.1 => { cmd => '31 - 02 - '.$SMI_SPI1_CS3,			descr => 'Unit_2: Set SPI1 CS for SMI7x'},
			2.2 => { cmd => '32 - 02 - '.$SMI_StandardMask,		descr => 'Unit_2: Set SPI ModuleMask'} ,
			2.3 => { cmd => '33 - 02 - '.$YawSensor_Addr0x8,	descr => 'Unit_2: Set SPI Pattern'} ,
			2.4 => { cmd => '72 - 02 - '.$YawSensor_Page1,		descr => 'Unit_2: Enable SMI7 Page Mask' },
			# Configure FIFOs for SMI7          1000 ms
            2.6 => { cmd => '41 - 02 - 01 - 40 0F 42 40',		descr => 'Unit_2: Write FIFO mode and time' },
            2.7 => { cmd => '42 - 02 - 01 - 00 00 00 80',		descr => 'Unit_2: Write FIFO ctrl' },
            2.8 => { cmd => '43 - 02 - 01 - 00 00 00 80',		descr => 'Unit_2: Write FIFO data' },
            # Configure SPI trigger for SMI700 error_group_out register
            3.1 => { cmd => '31 - 03 - '.$SMI_SPI1_CS3, 		descr => 'Unit_3: Set SPI1 CS4'},
            3.2 => { cmd => '32 - 03 - '.$SMI_StandardMask,		descr => 'Unit_3: Set SPI Mask'} ,
            3.3 => { cmd => '33 - 03 - '.$YawSensor_Addr0xF,	descr => 'Unit_3: Set SPI Pattern'} ,
            3.4 => { cmd => '72 - 03 - '.$YawSensor_Page2,		descr => 'Unit_3: Enable SMI7 Page Mask' },
            # Configure FIFOs for SMI7	        1000 ms
            3.6 => { cmd => '41 - 03 - 01 - 40 0F 42 40',		descr => 'Unit_3: Write FIFO mode and time' },
            3.7 => { cmd => '42 - 03 - 01 - 00 07 FF F8',		descr => 'Unit_3: Write FIFO ctrl' },
            3.8 => { cmd => '43 - 03 - 01 - 00 00 08 00',		descr => 'Unit_3: Write FIFO data' },         
        },
    },        
		
},

$Defaults->{'TC_MANITOO_MAP'} = {
#***************************************************************************************
# Fast Diagnosis and CAN trigger definition
# -----------------------------------------
# Remark: 
# FD_Trigger_S8 and CAN_Trigger_U8 are synchronized via SPI manipulation to Channel_0 or Channel_1 of SMA Sensor!!
	'FD_Trigger_S8'		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(1)_S8',	
	'CAN_Trigger_U8'	=> 'ProDiag_Response1Byte2',  

#********************************************************************************************
			
# index for for bit position  rb_csem_SensorDataRT_st.DataValid_b32 taken from *.cns file

#    API to Algo: Data Valid
	'AlgoDataValid_b32.0_U8'		=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
	'AlgoDataValid_b32.1_U8'		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',

#    API to Algo: Data Overload
	'InertDataOverload_b32.0'		=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
	'InertDataOverload_b32.1'		=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',

#    API to Algo
	'AlgoDataValid_V'  		 		=> 'rb_csem_SensorDataRT_st.DataValid_b32',

#**********************************************************************
#*                  conf_All
#**********************************************************************	   			   
#
#* enum;rb_csem_ChannelState_ten;rb_csem_ChlInitInProgress_e;0;Channel initialization in progress
#* enum;rb_csem_ChannelState_ten;rb_csem_ChlNotConfigured_e;1;Channel not configured
#* enum;rb_csem_ChannelState_ten;rb_csem_ChlOk_e;2;Channel OK
#* enum;rb_csem_ChannelState_ten;rb_csem_ChlTemporaryError_e;3;Channel temporary error (out of spec)
#* enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorDueSensorErr_e;4;Channel permanent error (sensor perm flt)
#* enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorCyclThisPOC_e;5;Channel permanent error (cyclic this POC)
#* enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorCyclPrevPOC_e;6;Channel permanent error (cyclic prev POC)
#* enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorDueExtReq_e;7;Channel permanent error (external request, e.g. ASI)
#* enum;rb_csem_ChannelState_ten;rb_csem_ChlNotSupported_e;8;Channel is not supported

#**********************************************************************
#*                  conf_1,2,3,4,5 SMI7 / SMI8 -> CoreAsset
#**********************************************************************	   			   	
#
#*enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXLg_e;0;
#*enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXHgMon_e;1;
#*enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLg_e;2;
#*enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYHgMon_e;3;
#*enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLgPlausi_e;4;
#*enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccZLg_e;5;
#*enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollRateLf_e;6;
#*enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLf_e;7;
#*enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLfPlausi_e;8;
#*enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchRateLf_e;9;

#   ChlState API to Customer
#---------------------------
#	'AccXLgChl_State_U8'                => 'rb_cs7m_ChlState_aen(0)_U8',
#	'AccXHgMonChl_State_U8'             => 'rb_cs7m_ChlState_aen(1)_U8',               
#	'AccYLgChl_State_U8'                => 'rb_cs7m_ChlState_aen(2)_U8',
#	'AccYHgMonChl_State_U8'             => 'rb_cs7m_ChlState_aen(3)_U8',               
#	'AccYLgPlausiChl_State_U8'			=> 'rb_cs7m_ChlState_aen(4)_U8',
#	'AccZLgChl_State_U8'                => 'rb_cs7m_ChlState_aen(5)_U8',               
#	'RollRateLfChl_State_U8'            => 'rb_cs7m_ChlState_aen(6)_U8',
#	'YawRateLfChl_State_U8'             => 'rb_cs7m_ChlState_aen(7)_U8',
#	'YawRateLfPlausiChl_State_U8'       => 'rb_cs7m_ChlState_aen(8)_U8',
#	'PitchRateLfChl_State_U8'       	=> 'rb_cs7m_ChlState_aen(9)_U8',			

#   RawData_U16
#--------------
#	'AccXLgChl_RawData_U16'   			=> 'rb_cs7c_RtComRxPayload_au16(0)_U16',  # ACC2
#	'AccXHgMonChl_RawData_U16'   	    => 'rb_cs7c_RtComRxPayload_au16(1)_U16',
#	'AccYLgChl_RawData_U16'   			=> 'rb_cs7c_RtComRxPayload_au16(2)_U16',  # ACC1
#	'AccYHgMonChl_RawData_U16'   	    => 'rb_cs7c_RtComRxPayload_au16(3)_U16',
#	'AccYLgPlausiChl_RawData_U16'   	=> 'rb_cs7c_RtComRxPayload_au16(4)_U16',  # ACC2
#	'AccZLgChl_RawData_U16'   			=> 'rb_cs7c_RtComRxPayload_au16(5)_U16',  # ACC2
#	'RollRateLfChl_RawData_U16'     	=> 'rb_cs7c_RtComRxPayload_au16(6)_U16',
#	'YawRateLfChl_RawData_U16'   		=> 'rb_cs7c_RtComRxPayload_au16(7)_U16',
#	'YawRateLfPlausiChl_RawData_U16'   	=> 'rb_cs7c_RtComRxPayload_au16(8)_U16',
#	'PitchRateLfChl_RawData_U16'   		=> 'rb_cs7c_RtComRxPayload_au16(9)_U16',

#   RawData_U8
#-------------          
#	'AccXLgChl_RawData_U8'   			=> 'rb_cs7c_RtComRxPayload_au16(0)_U8',  # ACC2
#	'AccXHgMonChl_RawData_U8'   	    => 'rb_cs7c_RtComRxPayload_au16(1)_U8',
#	'AccYLgChl_RawData_U8'   			=> 'rb_cs7c_RtComRxPayload_au16(2)_U8',  # ACC1
#	'AccYHgMonChl_RawData_U8'   	    => 'rb_cs7c_RtComRxPayload_au16(3)_U8',
#	'AccYLgPlausiChl_RawData_U8'   		=> 'rb_cs7c_RtComRxPayload_au16(4)_U8',
#	'AccZLgChl_RawData_U8'   			=> 'rb_cs7c_RtComRxPayload_au16(5)_U8',  # ACC2
#	'RollRateLfChl_RawData_U8'   		=> 'rb_cs7c_RtComRxPayload_au16(6)_U8',
#	'YawRateLfChl_RawData_U8'   		=> 'rb_cs7c_RtComRxPayload_au16(7)_U8',                                            
#	'YawRateLfPlausiChl_RawData_U8'     => 'rb_cs7c_RtComRxPayload_au16(8)_U8',                                            
#	'PitchRateLfChl_RawData_U8'     	=> 'rb_cs7c_RtComRxPayload_au16(9)_U8',	
	
#   Smi7FieldCalibDataEe
#-----------------------
#	'AccXLgChl_FieldCalibValue_EE_S16'   		=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(0)_S16',
#	'AccXHgMonChl_FieldCalibValue_EE_S16'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(1)_S16',
#	'AccYLgChl_FieldCalibValue_EE_S16'   		=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(2)_S16',
#	'AccYHgMonChl_FieldCalibValue_EE_S16'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(3)_S16',
#	'AccYLgPlausi_FieldCalibValue_EE_S16'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(4)_S16',
#	'AccZLgChl_FieldCalibValue_EE_S16'          => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(5)_S16',
#	'RollRateLfChl_FieldCalibValue_EE_S16'      => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(6)_S16',
#	'YawRateLfChl_FieldCalibValue_EE_S16'       => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(7)_S16',
#	'YawRateLfPlausiChl_FieldCalibValue_EE_S16' => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(8)_S16',
#	'PitchRateLfChl_FieldCalibValue_EE_S16'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(9)_S16',

#    API to Customer
#-------------------
#	'AccXLgChl_State_V'         	=> 'rb_cs7m_ChlState_aen(0)',
#	'AccXHgMonChl_State_V'      	=> 'rb_cs7m_ChlState_aen(1)',               
#	'AccYLgChl_State_V'         	=> 'rb_cs7m_ChlState_aen(2)',               
#	'AccYHgMonChl_State_V'      	=> 'rb_cs7m_ChlState_aen(3)',               
#	'AccYLgPlausiChl_State_V'   	=> 'rb_cs7m_ChlState_aen(4)',               
#	'AccZLgChl_State_V'         	=> 'rb_cs7m_ChlState_aen(5)',               
#	'RollRateLfChl_State_V'     	=> 'rb_cs7m_ChlState_aen(6)',
#	'YawRateLfChl_State_V'      	=> 'rb_cs7m_ChlState_aen(7)',
#	'YawRateLfPlausiChl_State_V'	=> 'rb_cs7m_ChlState_aen(8)',
#	'PitchRateLfChl_State_V'      	=> 'rb_cs7m_ChlState_aen(9)',

#	RawData_U16
#--------------
#	'AccXLgChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(0)',
#	'AccXHgMonChl_RawData_V'   	    => 'rb_cs7c_RtComRxPayload_au16(1)',
#	'AccYLgChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(2)',
#	'AccYHgMonChl_RawData_V'   	    => 'rb_cs7c_RtComRxPayload_au16(3)',
#	'AccYLgPlausiChl_RawData_V'   	=> 'rb_cs7c_RtComRxPayload_au16(4)',
#	'AccZLgChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(5)',
#	'RollRateLfChl_RawData_V'     	=> 'rb_cs7c_RtComRxPayload_au16(6)',
#	'YawRateLfChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(7)',
#	'YawRateLfPlausiChl_RawData_V'  => 'rb_cs7c_RtComRxPayload_au16(8)',
#	'PitchRateLfChl_RawData_V'   	=> 'rb_cs7c_RtComRxPayload_au16(9)',	

#    FieldCalibValue
#-------------------	
#	'AccXLgChl_FieldCalibValue_EE_V'   		    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(0)',
#	'AccXHgMonChl_FieldCalibValue_EE_V'   	    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(1)',
#	'AccYLgChl_FieldCalibValue_EE_V'   		    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(2)',
#	'AccYHgMonChl_FieldCalibValue_EE_V'   	    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(3)',
#	'AccYLgPlausi_FieldCalibValue_EE_V'   		=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(4)',
#	'AccZLgChl_FieldCalibValue_EE_V'            => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(5)',
#	'RollRateLfChl_FieldCalibValue_EE_V'        => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(6)',
#	'YawRateLfChl_FieldCalibValue_EE_V'         => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(7)',
#	'YawRateLfPlausiChl_FieldCalibValue_EE_V'   => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(8)',
#	'PitchRateLfChl_FieldCalibValue_EE_V'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(9)',

	
#**********************************************************************
#*                  conf_1,2,3 SMI7 -> CoreAsset
#**********************************************************************	   			   

#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccM45_e;0;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccP45_e;1;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccM45_e;2;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccP45_e;3;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXLg_e;4;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXHgMon_e;5;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLg_e;6;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYHgMon_e;7;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLgPlausi_e;8;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccZLg_e;9;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_RollRateLf_e;10;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLf_e;11;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLfPlausi_e;12;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PitchRateLf_e;13;
#* enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_CentralSensorChannelsMax_e;14;

#   API to Algo
#--------------		
#	'AccXLgChl_AlgoDataValid_U8'         		=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
#	'AccXHgMonChl_AlgoDataValid_U8'      		=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
#	'AccYLgChl_AlgoDataValid_U8'         		=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
#	'AccYHgMonChl_AlgoDataValid_U8'      		=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',			
#	'AccYHgMonChl_AlgoDataValid_U8'      		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',	
#	'AccYLgPlausiChl_AlgoDataValid_U8'   		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
#	'AccZLgChl_AlgoDataValid_U8'         		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
#	'RollRateLfChl_AlgoDataValid_U8'     		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
#	'YawRateLfChl_AlgoDataValid_U8'      		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',    
#	'YawRateLfPlausiChl_AlgoDataValid_U8'		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',    
#	'PitchRateLfChl_AlgoDataValid_U8'    		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',    
	
#	'AccXLgChl_InertDataOverload_U8'         	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
#	'AccXHgMonChl_InertDataOverload_U8'      	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
#	'AccYLgChl_InertDataOverload_U8'         	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
#	'AccYHgMonChl_InertDataOverload_U8'      	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
#	'AccYLgPlausiChl_InertDataOverload_U8'   	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'AccZLgChl_InertDataOverload_U8'         	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'RollRateLfChl_InertDataOverload_U8'     	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'YawRateLfChl_InertDataOverload_U8'      	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',    
#	'YawRateLfPlausiChl_InertDataOverload_U8'	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'PitchRateLfChl_InertDataOverload_U8'    	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',    	

#  Offset corrected data_S16 (NhtsaData data)    
#---------------------------
#	'AccXLgChl_NhtsaData_S16'   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(4)_S16',
#	'AccXHgMonChl_NhtsaData_S16'   	    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(5)_S16',
#	'AccYLgChl_NhtsaData_S16'   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(6)_S16',
#	'AccYLgPlausiChl_NhtsaData_S16'   	=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(8)_S16',				
#	'AccZLgChl_NhtsaData_S16'           => 'rb_csem_SensorDataRT_st.ChannelValue_as16(9)_S16',
#	'RollRateLfChl_NhtsaData_S16'       => 'rb_csem_SensorDataRT_st.ChannelValue_as16(10)_S16',
#	'YawRateLfChl_NhtsaData_S16'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(11)_S16', 
#	'YawRateLfPlausiChl_NhtsaData_S16'  => 'rb_csem_SensorDataRT_st.ChannelValue_as16(12)_S16', 
#	'PitchRateLfChl_NhtsaData_S16'      => 'rb_csem_SensorDataRT_st.ChannelValue_as16(13)_S16', 

#	 Offset corrected data_S8 (NhtsaData data)
#----------------------------
#	'AccXLgChl_NhtsaData_S8'   		    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(4).1_S8',
#	'AccXHgMonChl_NhtsaData_S8'   	    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(5).1_S8',
#	'AccYLgChl_NhtsaData_S8'   		    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(6).1_S8',
#	'AccYLgPlausiChl_NhtsaData_S8'   	=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(8).1_S8',
#	'AccZLgChl_NhtsaData_S8'            => 'rb_csem_SensorDataRT_st.ChannelValue_as16(9).1_S8',
#	'RollRateLfChl_NhtsaData_S8'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(10).1_S8',
#	'YawRateLfChl_NhtsaData_S8'         => 'rb_csem_SensorDataRT_st.ChannelValue_as16(11).1_S8',
#	'YawRateLfPlausiChl_NhtsaData_S8'   => 'rb_csem_SensorDataRT_st.ChannelValue_as16(12).1_S8',
#	'PitchRateLfChl_NhtsaData_S8'   	=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(13).1_S8',				

#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorYaw_e;0;Yaw Rate Sensor (for ESP)
#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorYawPlausi_e;1;Yaw Rate 2nd Sensor (Plausibility)
#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorRoll_e;2;Roll Rate Sensor
#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorPitch_e;3;Pitch Rate Sensor
#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorMax_e;4;Max Value (number of all SMI7 sensors)

#    ClusterFlags
#----------------
#	'YawSensor_ClusterFlags_U8'      	=> 'rb_cs7c_StatusData_ast(0).ClustFlg_u16_U8',
#	'YawPlausiSensor_ClusterFlags_U8'	=> 'rb_cs7c_StatusData_ast(1).ClustFlg_u16_U8',
#	'RollSensor_ClusterFlags_U8'     	=> 'rb_cs7c_StatusData_ast(2).ClustFlg_u16_U8',
#	'PitchSensor_ClusterFlags_U8'    	=> 'rb_cs7c_StatusData_ast(3).ClustFlg_u16_U8',

#    ErrorFlags
#--------------
#	'YawSensor_ErrorFlag0_U8'      		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(0)_U8',
#	'YawSensor_ErrorFlag1_U8'      		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(1)_U8',
#	'YawSensor_ErrorFlag2_U8'      		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(2)_U8',
#	'YawPlausiSensor_ErrorFlag0_U8'		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(0)_U8',
#	'YawPlausiSensor_ErrorFlag1_U8'		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(1)_U8',
#	'YawPlausiSensor_ErrorFlag2_U8'		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(2)_U8',
#	'RollSensor_ErrorFlag0_U8'     		=> 'rb_cs7c_StatusData_ast(2).ErFlg_au16(0)_U8',
#	'RollSensor_ErrorFlag1_U8'     		=> 'rb_cs7c_StatusData_ast(2).ErFlg_au16(1)_U8',
#	'RollSensor_ErrorFlag2_U8'     		=> 'rb_cs7c_StatusData_ast(2).ErFlg_au16(2)_U8',
#	'PitchSensor_ErrorFlag0_U8'    		=> 'rb_cs7c_StatusData_ast(3).ErFlg_au16(0)_U8',
#	'PitchSensor_ErrorFlag1_U8'    		=> 'rb_cs7c_StatusData_ast(3).ErFlg_au16(1)_U8',
#	'PitchSensor_ErrorFlag2_U8'    		=> 'rb_cs7c_StatusData_ast(3).ErFlg_au16(2)_U8',

#    Temp1
#---------
#	'YawSensor_Temp1_S16'      			=> 'rb_cs7c_StatusData_ast(0).Temperat1_s16_S16',                             
#	'RollSensor_Temp1_S16'     			=> 'rb_cs7c_StatusData_ast(2).Temperat1_s16_S16',		
#	'YawPlausiSensor_Temp1_S16'			=> 'rb_cs7c_StatusData_ast(1).Temperat1_s16_S16',                             
#	'PitchSensor_Temp1_S16'    			=> 'rb_cs7c_StatusData_ast(3).Temperat1_s16_S16',						

#	 ClusterFlags stored in Field Claim Data area		
#------------------------------------------------
#	'YawSensor_ClusterFlags_EE_U8'			=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16_U8',
#	'YawPlausiSensor_ClusterFlags_EE_U8'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16_U8',
#	'RollSensor_ClusterFlags_EE_U8'	    	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ClustFlg_u16_U8',
#	'PitchSensor_ClusterFlags_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ClustFlg_u16_U8',

#	 ErrorFlags stored in Field Claim Data area		
#----------------------------------------------
#	'YawSensor_ErrorFlag1_EE_U8'      		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(0)_U8',
#	'YawPlausiSensor_ErrorFlag1_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0)_U8',
#	'RollSensor_ErrorFlag1_EE_U8'     		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(0)_U8',
#	'PitchSensor_ErrorFlag1_EE_U8'    		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(0)_U8',

#	 Temperature stored in Field Claim Data area		
#-----------------------------------------------
#	'YawSensor_Temperature_EE_U8'      		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16_U8',
#	'YawPlausiSensor_Temperature_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16_U8',
#	'RollSensor_Temperature_EE_U8'     		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).Temperat1_s16_U8',
#	'PitchSensor_Temperature_EE_U8'    		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).Temperat1_s16_U8',

#	 Temperature stored in RAM		
#-----------------------------
#	'YawSensor_Temperature_RAM_U8'			=> 'rb_cs7c_StatusData_ast(0).Temperat1_s16_U8',	
#	'YawPlausiSensor_Temperature_RAM_U8'	=> 'rb_cs7c_StatusData_ast(1).Temperat1_s16_U8',	
#	'RollSensor_Temperature_RAM_U8'			=> 'rb_cs7c_StatusData_ast(2).Temperat1_s16_U8',	
#	'PitchSensor_Temperature_RAM_U8'		=> 'rb_cs7c_StatusData_ast(3).Temperat1_s16_U8',	

#	AsicSerialNr
#---------------
#	'YawSensor_AsicSerialNr0_V'       	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(0)',
#	'YawSensor_AsicSerialNr1_V'       	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(1)',
#	'YawSensor_AsicSerialNr2_V'       	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(2)',
#	'YawPlausiSensor_AsicSerialNr0_V' 	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(0)',
#	'YawPlausiSensor_AsicSerialNr1_V' 	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(1)',
#	'YawPlausiSensor_AsicSerialNr2_V' 	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(2)',
#	'RollSensor_AsicSerialNr0_V'      	=> 'rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(0)',
#	'RollSensor_AsicSerialNr1_V'      	=> 'rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(1)',
#	'RollSensor_AsicSerialNr2_V'      	=> 'rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(2)',
#	'PitchSensor_AsicSerialNr0_V'     	=> 'rb_cs7m_AsicIdData_ast(3).AsicSerialNr_au16(0)',
#	'PitchSensor_AsicSerialNr1_V'     	=> 'rb_cs7m_AsicIdData_ast(3).AsicSerialNr_au16(1)',
#	'PitchSensor_AsicSerialNr2_V'     	=> 'rb_cs7m_AsicIdData_ast(3).AsicSerialNr_au16(2)',

#	SmiSerialNr
#--------------
#	'YawSensor_SmiSerialNr0_V'        	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(0)',
#	'YawSensor_SmiSerialNr1_V'        	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(1)',
#	'YawSensor_SmiSerialNr2_V'        	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(2)',
#	'YawPlausiSensor_SmiSerialNr0_V'  	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(0)',
#	'YawPlausiSensor_SmiSerialNr1_V'  	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(1)',
#	'YawPlausiSensor_SmiSerialNr2_V'  	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(2)',
#	'RollSensor_SmiSerialNr0_V'       	=> 'rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(0)',
#	'RollSensor_SmiSerialNr1_V'       	=> 'rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(1)',
#	'RollSensor_SmiSerialNr2_V'       	=> 'rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(2)',
#	'PitchSensor_SmiSerialNr0_V'      	=> 'rb_cs7m_AsicIdData_ast(3).SmiSerialNr_au16(0)',
#	'PitchSensor_SmiSerialNr1_V'      	=> 'rb_cs7m_AsicIdData_ast(3).SmiSerialNr_au16(1)',
#	'PitchSensor_SmiSerialNr2_V'      	=> 'rb_cs7m_AsicIdData_ast(3).SmiSerialNr_au16(2)',

#	FieldClaimDataEe ClusterFlags
#--------------------------------
#	'YawSensor_ClusterFlags_EE_V'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16',
#	'YawPlausiSensor_ClusterFlags_EE_V' => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16',
#	'RollSensor_ClusterFlags_EE_V'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ClustFlg_u16',
#	'PitchSensor_ClusterFlags_EE_V'	    => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ClustFlg_u16',

#	FieldClaimDataEe ErrorFlag1
#------------------------------
#	'YawSensor_ErrorFlag1_EE_V'         => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(1)',
#	'YawPlausiSensor_ErrorFlag1_EE_V'   => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(1)',
#	'RollSensor_ErrorFlag1_EE_V'        => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(1)',
#	'PitchSensor_ErrorFlag1_EE_V'       => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(1)',

#	FieldClaimDataEe Temperature
#-------------------------------
#	'YawSensor_Temperature_EE_V'        => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16',
#	'YawPlausiSensor_Temperature_EE_V'  => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16',
#	'RollSensor_Temperature_EE_V'       => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).Temperat1_s16',
#	'PitchSensor_Temperature_EE_V'      => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).Temperat1_s16',

#	DeviceId
#-----------
#	'YawSensor_DeviceId_V'    	 		=> 'rb_syca_AsicDeviceId_au16(4)',
#	'YawPlausiSensor_DeviceId_V' 		=> 'rb_syca_AsicDeviceId_au16(5)',
#	'RollSensor_DeviceId_V'   	 		=> 'rb_syca_AsicDeviceId_au16(6)',
#	'PitchSensor_DeviceId_V'   	 		=> 'rb_syca_AsicDeviceId_au16(7)',

#    RevisionId
#--------------
#	'YawSensor_RevisionId_V'        	=> 'rb_syca_AsicRevisionId_au16(4)',
#	'YawPlausiSensor_RevisionId_V' 		=> 'rb_syca_AsicRevisionId_au16(5)',
#	'RollSensor_RevisionId_V'       	=> 'rb_syca_AsicRevisionId_au16(6)',
#	'PitchSensor_RevisionId_V'      	=> 'rb_syca_AsicRevisionId_au16(7)',
	
#    ErrorCounter
#----------------
#	'YawSensor_IntErrCnt45_U8'         	=> 'rb_cs7c_RtComRxPayload_au16(20)_U8',
#	'YawPlausiSensor_IntErrCnt45_U8'   	=> 'rb_cs7c_RtComRxPayload_au16(24)_U8',
#	'RollSensor_IntErrCnt45_U8'        	=> 'rb_cs7c_RtComRxPayload_au16(28)_U8',
#	'PitchSensor_IntErrCnt45_U8'       	=> 'rb_cs7c_RtComRxPayload_au16(32)_U8',                 

#    Status HW SCON
#------------------
#	'YawSensor_Status_HW_SCON_U8'         	=> 'rb_cs7c_RtComRxPayload_au16(14)_U8',
#	'YawPlausiSensor_Status_HW_SCON_U8'   	=> 'rb_cs7c_RtComRxPayload_au16(15)_U8',
#	'RollSensor_Status_HW_SCON_U8'        	=> 'rb_cs7c_RtComRxPayload_au16(16)_U8',
#	'PitchSensor_Status_HW_SCON_U8'       	=> 'rb_cs7c_RtComRxPayload_au16(17)_U8',

#**********************************************************************
#*                       conf_4,5 SMI8 -> CoreAsset
#**********************************************************************	   			   

#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccX_e;0;
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccY_e;1;
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccX_e;2;
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccY_e;3;
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccZ_e;4;SMA_az_highG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXLg_e;5;SMI_ax_lowG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXHgMon_e;6;SMI_ax_midG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLg_e;7;SMI_ay_lowG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYHgMon_e;8;SMI_ay_midG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLgPlausi_e;9;SMI_ay_lowG_redundant
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccZLg_e;10;SMI_az_lowG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_RollRateLf_e;11;SMI_rateX
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLf_e;12;SMI_rateZ
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLfPlausi_e;13;SMI_rateZ_redundant
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PitchRateLf_e;14;SMI_rateY
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_CentralSensorChannelsMax_e;15;gives the total number of supported  central sensor channels.

#   API to Algo
#--------------		
#	'AccXLgChl_AlgoDataValid_U8'         		=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
#	'AccXHgMonChl_AlgoDataValid_U8'      		=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
#	'AccYLgChl_AlgoDataValid_U8'         		=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',		
#	'AccYHgMonChl_AlgoDataValid_U8'      		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',	
#	'AccYLgPlausiChl_AlgoDataValid_U8'   		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
#	'AccZLgChl_AlgoDataValid_U8'         		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
#	'RollRateLfChl_AlgoDataValid_U8'     		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',
#	'YawRateLfChl_AlgoDataValid_U8'      		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',    
#	'YawRateLfPlausiChl_AlgoDataValid_U8'		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',    
#	'PitchRateLfChl_AlgoDataValid_U8'    		=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',    
	
#	'AccXLgChl_InertDataOverload_U8'         	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
#	'AccXHgMonChl_InertDataOverload_U8'      	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
#	'AccYLgChl_InertDataOverload_U8'         	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',		
#	'AccYHgMonChl_InertDataOverload_U8'      	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'AccYLgPlausiChl_InertDataOverload_U8'   	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'AccZLgChl_InertDataOverload_U8'         	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'RollRateLfChl_InertDataOverload_U8'     	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'YawRateLfChl_InertDataOverload_U8'      	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',    
#	'YawRateLfPlausiChl_InertDataOverload_U8'	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',
#	'PitchRateLfChl_InertDataOverload_U8'    	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',    	

#  Offset corrected data_S16 (NhtsaData data)    
#---------------------------
#	'AccXLgChl_NhtsaData_S16'   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(5)_S16',
#	'AccXHgMonChl_NhtsaData_S16'   	    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(6)_S16',
#	'AccYLgChl_NhtsaData_S16'   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(7)_S16',
#	'AccYHgMonChl_NhtsaData_S16'   	    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(8)_S16',
#	'AccYLgPlausiChl_NhtsaData_S16'   	=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(9)_S16',				
#	'AccZLgChl_NhtsaData_S16'           => 'rb_csem_SensorDataRT_st.ChannelValue_as16(10)_S16',
#	'RollRateLfChl_NhtsaData_S16'       => 'rb_csem_SensorDataRT_st.ChannelValue_as16(11)_S16',
#	'YawRateLfChl_NhtsaData_S16'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(12)_S16', 
#	'YawRateLfPlausiChl_NhtsaData_S16'  => 'rb_csem_SensorDataRT_st.ChannelValue_as16(13)_S16', 
#	'PitchRateLfChl_NhtsaData_S16'      => 'rb_csem_SensorDataRT_st.ChannelValue_as16(14)_S16', 

#	 Offset corrected data_S8 (NhtsaData data)
#----------------------------
#	'AccXLgChl_NhtsaData_S8'   		    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(5).1_S8',
#	'AccXHgMonChl_NhtsaData_S8'   	    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(6).1_S8',
#	'AccYLgChl_NhtsaData_S8'   		    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(7).1_S8',
#	'AccYHgMonChl_NhtsaData_S8'   	    => 'rb_csem_SensorDataRT_st.ChannelValue_as16(8).1_S8',
#	'AccYLgPlausiChl_NhtsaData_S8'   	=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(9).1_S8',
#	'AccZLgChl_NhtsaData_S8'            => 'rb_csem_SensorDataRT_st.ChannelValue_as16(10).1_S8',
#	'RollRateLfChl_NhtsaData_S8'        => 'rb_csem_SensorDataRT_st.ChannelValue_as16(11).1_S8',
#	'YawRateLfChl_NhtsaData_S8'         => 'rb_csem_SensorDataRT_st.ChannelValue_as16(12).1_S8',
#	'YawRateLfPlausiChl_NhtsaData_S8'   => 'rb_csem_SensorDataRT_st.ChannelValue_as16(13).1_S8',
#	'PitchRateLfChl_NhtsaData_S8'   	=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(14).1_S8',				

#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_InertialSensor1_e;0;First inertial sensor
#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_InertialSensor2_e;1;Second inertial sensor
#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorMax_e;2;Max Value

#    ClusterFlags
#----------------
#	'InertialSensor1_ClusterFlags_U8'	=> 'rb_cs7c_StatusData_ast(0).ClustFlg_u16_U8',#
#	'InertialSensor2_ClusterFlags_U8'	=> 'rb_cs7c_StatusData_ast(1).ClustFlg_u16_U8',
		
#    ErrorFlags
#--------------
#	'InertialSensor1_ErrorFlag0_U8'		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(0)_U8',
#	'InertialSensor1_ErrorFlag1_U8'		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(1)_U8',
#	'InertialSensor1_ErrorFlag2_U8'		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(2)_U8',
#	'InertialSensor2_ErrorFlag0_U8'		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(0)_U8',
#	'InertialSensor2_ErrorFlag1_U8'		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(1)_U8',
#	'InertialSensor2_ErrorFlag2_U8'		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(2)_U8',

#    Temp1
#---------
#	'InertialSensor1_Temp1_S16'			=> 'rb_cs7c_StatusData_ast(0).Temperat1_s16_S16',                             
#	'InertialSensor2_Temp1_S16'			=> 'rb_cs7c_StatusData_ast(1).Temperat1_s16_S16',						

#	 ClusterFlags stored in Field Claim Data area		
#------------------------------------------------
#	'InertialSensor1_ClusterFlags_EE_U8'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16_U8',
#	'InertialSensor2_ClusterFlags_EE_U8'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16_U8',

#	 ErrorFlags stored in Field Claim Data area		
#----------------------------------------------
#	'InertialSensor1_ErrorFlag1_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(0)_U8',
#	'InertialSensor2_ErrorFlag1_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0)_U8',

#	 Temperature stored in Field Claim Data area		
#-----------------------------------------------
#	'InertialSensor1_Temperature_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16_U8',
#	'InertialSensor2_Temperature_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16_U8',

#	 Temperature stored in RAM		
#-----------------------------
#	'InertialSensor1_Temperature_RAM_U8'	=> 'rb_cs7c_StatusData_ast(0).Temperat1_s16_U8',	
#	'InertialSensor2_Temperature_RAM_U8'	=> 'rb_cs7c_StatusData_ast(1).Temperat1_s16_U8',	

#	AsicSerialNr
#---------------
#	'InertialSensor1_AsicSerialNr0_V'	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(0)',
#	'InertialSensor1_AsicSerialNr1_V'	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(1)',
#	'InertialSensor1_AsicSerialNr2_V'	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(2)',
#	'InertialSensor2_AsicSerialNr0_V'	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(0)',
#	'InertialSensor2_AsicSerialNr1_V'	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(1)',
#	'InertialSensor2_AsicSerialNr2_V'	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(2)',

#	SmiSerialNr
#--------------
#	'InertialSensor1_SmiSerialNr0_V'	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(0)',
#	'InertialSensor1_SmiSerialNr1_V'	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(1)',
#	'InertialSensor1_SmiSerialNr2_V'	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(2)',
#	'InertialSensor2_SmiSerialNr0_V'	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(0)',
#	'InertialSensor2_SmiSerialNr1_V'	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(1)',
#	'InertialSensor2_SmiSerialNr2_V'	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(2)',
	
#	FieldClaimDataEe ClusterFlags
#--------------------------------
#	'InertialSensor1_ClusterFlags_EE_V'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16',
#	'InertialSensor2_ClusterFlags_EE_V'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16',

#	FieldClaimDataEe ErrorFlag1
#------------------------------
#	'InertialSensor1_ErrorFlag1_EE_V'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(1)',
#	'InertialSensor2_ErrorFlag1_EE_V'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(1)',

#	FieldClaimDataEe Temperature
#-------------------------------
#	'InertialSensor1_Temperature_EE_V'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16',
#	'InertialSensor2_Temperature_EE_V'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16',

#	DeviceId
#-----------
#	'InertialSensor1_DeviceId_V'    	=> 'rb_syca_AsicDeviceId_au16(4)',
#	'InertialSensor2_DeviceId_V'   	 	=> 'rb_syca_AsicDeviceId_au16(5)',

#	RevisionId
#-------------
#	'InertialSensor1_RevisionId_V'      => 'rb_syca_AsicRevisionId_au16(4)',
#	'InertialSensor2_RevisionId_V'      => 'rb_syca_AsicRevisionId_au16(5)',

#    ErrorCounter
#----------------
#	'InertialSensor1_IntErrCnt45_U8'	=> 'rb_cs7c_RtComRxPayload_au16(16)_U8',
#	'InertialSensor2_IntErrCnt45_U8'	=> 'rb_cs7c_RtComRxPayload_au16(20)_U8',                 

#    Status HW SCON
#------------------
#	'InertialSensor1_Status_HW_SCON_U8'	=> 'rb_cs7c_RtComRxPayload_au16(12)_U8',
#	'InertialSensor2_Status_HW_SCON_U8'	=> 'rb_cs7c_RtComRxPayload_au16(13)_U8',


#**********************************************************************
#*                       conf_6 SMI7 -> MRA2
#**********************************************************************	   			    			   
#
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXLg_e;0;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXHgMon_e;1;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLg_e;2;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYHgMon_e;3;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccZLg_e;4;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollRateLf_e;5;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLf_e;6;
#enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchRateLf_e;7;

#   ChlState API to Customer
#---------------------------
	'AccXLgChl_State_U8'                => 'rb_cs7m_ChlState_aen(0)_U8',
	'AccXHgMonChl_State_U8'             => 'rb_cs7m_ChlState_aen(1)_U8',               
	'AccYLgChl_State_U8'                => 'rb_cs7m_ChlState_aen(2)_U8',
	'AccYHgMonChl_State_U8'             => 'rb_cs7m_ChlState_aen(3)_U8',               
	'AccZLgChl_State_U8'                => 'rb_cs7m_ChlState_aen(4)_U8',               
	'RollRateLfChl_State_U8'            => 'rb_cs7m_ChlState_aen(5)_U8',
	'YawRateLfChl_State_U8'             => 'rb_cs7m_ChlState_aen(6)_U8',
	'PitchRateLfChl_State_U8'       	=> 'rb_cs7m_ChlState_aen(7)_U8',			
	
#   RawData_U16
#--------------
	'AccXLgChl_RawData_U16'   			=> 'rb_cs7c_RtComRxPayload_au16(0)_U16',  # ACC2
	'AccXHgMonChl_RawData_U16'   	    => 'rb_cs7c_RtComRxPayload_au16(1)_U16',
	'AccYLgChl_RawData_U16'   			=> 'rb_cs7c_RtComRxPayload_au16(2)_U16',  # ACC1
	'AccYHgMonChl_RawData_U16'   	    => 'rb_cs7c_RtComRxPayload_au16(3)_U16',
	'AccZLgChl_RawData_U16'   			=> 'rb_cs7c_RtComRxPayload_au16(4)_U16',  # ACC2
	'RollRateLfChl_RawData_U16'     	=> 'rb_cs7c_RtComRxPayload_au16(5)_U16',
	'YawRateLfChl_RawData_U16'   		=> 'rb_cs7c_RtComRxPayload_au16(6)_U16',
	'PitchRateLfChl_RawData_U16'   		=> 'rb_cs7c_RtComRxPayload_au16(7)_U16',

#   RawData_U8
#-------------          
	'AccXLgChl_RawData_U8'   			=> 'rb_cs7c_RtComRxPayload_au16(0)_U8',  # ACC2
	'AccXHgMonChl_RawData_U8'   	    => 'rb_cs7c_RtComRxPayload_au16(1)_U8',
	'AccYLgChl_RawData_U8'   			=> 'rb_cs7c_RtComRxPayload_au16(2)_U8',  # ACC1
	'AccYHgMonChl_RawData_U8'   	    => 'rb_cs7c_RtComRxPayload_au16(3)_U8',
	'AccZLgChl_RawData_U8'   			=> 'rb_cs7c_RtComRxPayload_au16(4)_U8',  # ACC2
	'RollRateLfChl_RawData_U8'   		=> 'rb_cs7c_RtComRxPayload_au16(5)_U8',
	'YawRateLfChl_RawData_U8'   		=> 'rb_cs7c_RtComRxPayload_au16(6)_U8',                                            
	'PitchRateLfChl_RawData_U8'     	=> 'rb_cs7c_RtComRxPayload_au16(7)_U8',	
	
#   Smi7FieldCalibDataEe
#-----------------------
	'AccXLgChl_FieldCalibValue_EE_S16'   		=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(0)_S16',
	'AccXHgMonChl_FieldCalibValue_EE_S16'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(1)_S16',
	'AccYLgChl_FieldCalibValue_EE_S16'   		=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(2)_S16',
	'AccYHgMonChl_FieldCalibValue_EE_S16'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(3)_S16',
	'AccZLgChl_FieldCalibValue_EE_S16'          => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(4)_S16',
	'RollRateLfChl_FieldCalibValue_EE_S16'      => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(5)_S16',
	'YawRateLfChl_FieldCalibValue_EE_S16'       => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(6)_S16',
	'PitchRateLfChl_FieldCalibValue_EE_S16'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(7)_S16',

#    API to Customer
#-------------------
	'AccXLgChl_State_V'         	=> 'rb_cs7m_ChlState_aen(0)',
	'AccXHgMonChl_State_V'      	=> 'rb_cs7m_ChlState_aen(1)',               
	'AccYLgChl_State_V'         	=> 'rb_cs7m_ChlState_aen(2)',               
	'AccYHgMonChl_State_V'      	=> 'rb_cs7m_ChlState_aen(3)',               
	'AccZLgChl_State_V'         	=> 'rb_cs7m_ChlState_aen(4)',               
	'RollRateLfChl_State_V'     	=> 'rb_cs7m_ChlState_aen(5)',
	'YawRateLfChl_State_V'      	=> 'rb_cs7m_ChlState_aen(6)',
	'PitchRateLfChl_State_V'      	=> 'rb_cs7m_ChlState_aen(7)',

#	RawData_U16
#--------------
	'AccXLgChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(0)',
	'AccXHgMonChl_RawData_V'   	    => 'rb_cs7c_RtComRxPayload_au16(1)',
	'AccYLgChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(2)',
	'AccYHgMonChl_RawData_V'   	    => 'rb_cs7c_RtComRxPayload_au16(3)',
	'AccZLgChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(4)',
	'RollRateLfChl_RawData_V'     	=> 'rb_cs7c_RtComRxPayload_au16(5)',
	'YawRateLfChl_RawData_V'   		=> 'rb_cs7c_RtComRxPayload_au16(6)',
	'PitchRateLfChl_RawData_V'   	=> 'rb_cs7c_RtComRxPayload_au16(7)',	

#    FieldCalibValue
#-------------------	
	'AccXLgChl_FieldCalibValue_EE_V'   		    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(0)',
	'AccXHgMonChl_FieldCalibValue_EE_V'   	    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(1)',
	'AccYLgChl_FieldCalibValue_EE_V'   		    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(2)',
	'AccYHgMonChl_FieldCalibValue_EE_V'   	    => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(3)',
	'AccZLgChl_FieldCalibValue_EE_V'            => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(4)',
	'RollRateLfChl_FieldCalibValue_EE_V'        => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(5)',
	'YawRateLfChl_FieldCalibValue_EE_V'         => 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(6)',
	'PitchRateLfChl_FieldCalibValue_EE_V'   	=> 'rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibValue_as16(7)',
	
	
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccX_e;0;SMA_ax_highG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccY_e;1;SMA_ay_highG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXLg_e;2;SMI_ax_lowG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXHgMon_e;3;SMI_ax_midG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLg_e;4;SMI_ay_lowG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYHgMon_e;5;SMI_ay_midG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccZLg_e;6;SMI_az_lowG
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_RollRateLf_e;7;SMI_rateX
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLf_e;8;SMI_rateZ
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PitchRateLf_e;9;SMI_rateY
#*enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_CentralSensorChannelsMax_e;10;gives the total number of supported  central sensor channels.

#   API to Algo
#--------------		
	'AccXLgChl_AlgoDataValid_U8'         	=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
	'AccXHgMonChl_AlgoDataValid_U8'      	=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
	'AccYLgChl_AlgoDataValid_U8'         	=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',		
	'AccYHgMonChl_AlgoDataValid_U8'      	=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',	
	'AccZLgChl_AlgoDataValid_U8'         	=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',
	'RollRateLfChl_AlgoDataValid_U8'     	=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8',	
	'YawRateLfChl_AlgoDataValid_U8'      	=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',    
	'PitchRateLfChl_AlgoDataValid_U8'    	=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8',    
	
	'AccXLgChl_InertDataOverload_U8'         => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
	'AccXHgMonChl_InertDataOverload_U8'      => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
	'AccYLgChl_InertDataOverload_U8'         => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',		
	'AccYHgMonChl_InertDataOverload_U8'      => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
	'AccZLgChl_InertDataOverload_U8'         => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
	'RollRateLfChl_InertDataOverload_U8'     => 'rb_csem_SensorDataRT_st.InertDataOverload_b32_U8',
	'YawRateLfChl_InertDataOverload_U8'      => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',    
	'PitchRateLfChl_InertDataOverload_U8'    => 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8',    	

#  Offset corrected data_S16 (NhtsaData data)    
#---------------------------
	'AccXLgChl_NhtsaData_S16'   			=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(2)_S16',
	'AccXHgMonChl_NhtsaData_S16'   			=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(3)_S16',
	'AccYLgChl_NhtsaData_S16'   			=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(4)_S16',
	'AccYHgMonChl_NhtsaData_S16'   			=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(5)_S16',
	'AccZLgChl_NhtsaData_S16'       		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(6)_S16',
	'RollRateLfChl_NhtsaData_S16'   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(7)_S16',
	'YawRateLfChl_NhtsaData_S16'    		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(8)_S16', 
	'PitchRateLfChl_NhtsaData_S16'  		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(9)_S16', 
		
#	 Offset corrected data_S8 (NhtsaData data)
#----------------------------
	'AccXLgChl_NhtsaData_S8'   		   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(2).1_S8',
	'AccXHgMonChl_NhtsaData_S8'   	   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(3).1_S8',
	'AccYLgChl_NhtsaData_S8'   		   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(4).1_S8',
	'AccYHgMonChl_NhtsaData_S8'   	   		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(5).1_S8',
	'AccZLgChl_NhtsaData_S8'           		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(6).1_S8',
	'RollRateLfChl_NhtsaData_S8'       		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(7).1_S8',
	'YawRateLfChl_NhtsaData_S8'        		=> 'rb_csem_SensorDataRT_st.ChannelValue_as16(8).1_S8',
	'PitchRateLfChl_NhtsaData_S8'			=> 	'rb_csem_SensorDataRT_st.ChannelValue_as16(9).1_S8',				

#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorYaw_e;0;Yaw Rate Sensor (for ESP)
#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorRoll_e;1;Roll Rate Sensor
#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorPitch_e;2;Pitch Rate Sensor
#*enum;rb_sycc_Smi7Sensors_ten;rb_sycc_Smi7SensorMax_e;3;Max Value (number of all SMI7 sensors)

#    ClusterFlags
#----------------
	'YawSensor_ClusterFlags_U8'      	=> 'rb_cs7c_StatusData_ast(0).ClustFlg_u16_U8',
	'RollSensor_ClusterFlags_U8'     	=> 'rb_cs7c_StatusData_ast(1).ClustFlg_u16_U8',
	'PitchSensor_ClusterFlags_U8'    	=> 'rb_cs7c_StatusData_ast(2).ClustFlg_u16_U8',

#    ErrorFlags
#--------------
	'YawSensor_ErrorFlag0_U8'      		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(0)_U8',
	'YawSensor_ErrorFlag1_U8'      		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(1)_U8',
	'YawSensor_ErrorFlag2_U8'      		=> 'rb_cs7c_StatusData_ast(0).ErFlg_au16(2)_U8',
	'RollSensor_ErrorFlag0_U8'     		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(0)_U8',
	'RollSensor_ErrorFlag1_U8'     		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(1)_U8',
	'RollSensor_ErrorFlag2_U8'     		=> 'rb_cs7c_StatusData_ast(1).ErFlg_au16(2)_U8',
	'PitchSensor_ErrorFlag0_U8'    		=> 'rb_cs7c_StatusData_ast(2).ErFlg_au16(0)_U8',
	'PitchSensor_ErrorFlag1_U8'    		=> 'rb_cs7c_StatusData_ast(2).ErFlg_au16(1)_U8',
	'PitchSensor_ErrorFlag2_U8'    		=> 'rb_cs7c_StatusData_ast(2).ErFlg_au16(2)_U8',

#    Temp1
#---------
	'YawSensor_Temp1_S16'      			=> 'rb_cs7c_StatusData_ast(0).Temperat1_s16_S16',                             
	'RollSensor_Temp1_S16'     			=> 'rb_cs7c_StatusData_ast(1).Temperat1_s16_S16',		
	'PitchSensor_Temp1_S16'    			=> 'rb_cs7c_StatusData_ast(2).Temperat1_s16_S16',						

#	 ClusterFlags stored in Field Claim Data area		
#------------------------------------------------
	'YawSensor_ClusterFlags_EE_U8'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16_U8',
	'RollSensor_ClusterFlags_EE_U8'	    => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16_U8',
	'PitchSensor_ClusterFlags_EE_U8'	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ClustFlg_u16_U8',

#	 ErrorFlags stored in Field Claim Data area		
#----------------------------------------------
	'YawSensor_ErrorFlag1_EE_U8'      	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(0)_U8',
	'RollSensor_ErrorFlag1_EE_U8'     	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0)_U8',
	'PitchSensor_ErrorFlag1_EE_U8'    	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(0)_U8',

#	 Temperature stored in Field Claim Data area		
#-----------------------------------------------
	'YawSensor_Temperature_EE_U8'      	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16_U8',
	'RollSensor_Temperature_EE_U8'     	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16_U8',
	'PitchSensor_Temperature_EE_U8'    	=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).Temperat1_s16_U8',

#	 Temperature stored in RAM		
#-----------------------------
	'YawSensor_Temperature_RAM_U8'		=> 'rb_cs7c_StatusData_ast(0).Temperat1_s16_U8',	
	'RollSensor_Temperature_RAM_U8'		=> 'rb_cs7c_StatusData_ast(1).Temperat1_s16_U8',	
	'PitchSensor_Temperature_RAM_U8'	=> 'rb_cs7c_StatusData_ast(2).Temperat1_s16_U8',	

#	AsicSerialNr
#---------------
	'YawSensor_AsicSerialNr0_V'       	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(0)',
	'YawSensor_AsicSerialNr1_V'       	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(1)',
	'YawSensor_AsicSerialNr2_V'       	=> 'rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(2)',
	'RollSensor_AsicSerialNr0_V'      	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(0)',
	'RollSensor_AsicSerialNr1_V'      	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(1)',
	'RollSensor_AsicSerialNr2_V'      	=> 'rb_cs7m_AsicIdData_ast(1).AsicSerialNr_au16(2)',
	'PitchSensor_AsicSerialNr0_V'     	=> 'rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(0)',
	'PitchSensor_AsicSerialNr1_V'     	=> 'rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(1)',
	'PitchSensor_AsicSerialNr2_V'     	=> 'rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(2)',

#	SmiSerialNr
#--------------
	'YawSensor_SmiSerialNr0_V'        	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(0)',
	'YawSensor_SmiSerialNr1_V'        	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(1)',
	'YawSensor_SmiSerialNr2_V'        	=> 'rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(2)',
	'RollSensor_SmiSerialNr0_V'       	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(0)',
	'RollSensor_SmiSerialNr1_V'       	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(1)',
	'RollSensor_SmiSerialNr2_V'       	=> 'rb_cs7m_AsicIdData_ast(1).SmiSerialNr_au16(2)',
	'PitchSensor_SmiSerialNr0_V'      	=> 'rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(0)',
	'PitchSensor_SmiSerialNr1_V'      	=> 'rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(1)',
	'PitchSensor_SmiSerialNr2_V'      	=> 'rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(2)',

#	FieldClaimDataEe ClusterFlags
#--------------------------------
	'YawSensor_ClusterFlags_EE_V'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16',
	'RollSensor_ClusterFlags_EE_V'		=> 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16',
	'PitchSensor_ClusterFlags_EE_V'	    => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ClustFlg_u16',

#	FieldClaimDataEe ErrorFlag1
#------------------------------
	'YawSensor_ErrorFlag1_EE_V'         => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(1)',
	'RollSensor_ErrorFlag1_EE_V'        => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(1)',
	'PitchSensor_ErrorFlag1_EE_V'       => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(1)',

#	FieldClaimDataEe Temperature
#-------------------------------
	'YawSensor_Temperature_EE_V'        => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16',
	'RollSensor_Temperature_EE_V'       => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16',
	'PitchSensor_Temperature_EE_V'      => 'rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).Temperat1_s16',

#	DeviceId
#-----------
	'YawSensor_DeviceId_V'    	 		=> 'rb_syca_AsicDeviceId_au16(4)',
	'RollSensor_DeviceId_V'   	 		=> 'rb_syca_AsicDeviceId_au16(5)',
	'PitchSensor_DeviceId_V'   	 		=> 'rb_syca_AsicDeviceId_au16(6)',

#    RevisionId
#--------------
	'YawSensor_RevisionId_V'        	=> 'rb_syca_AsicRevisionId_au16(4)',
	'RollSensor_RevisionId_V'       	=> 'rb_syca_AsicRevisionId_au16(5)',
	'PitchSensor_RevisionId_V'      	=> 'rb_syca_AsicRevisionId_au16(6)',
	
#    ErrorCounter
#----------------
	'YawSensor_IntErrCnt45_U8'         	=> 'rb_cs7c_RtComRxPayload_au16(16)_U8',
	'RollSensor_IntErrCnt45_U8'        	=> 'rb_cs7c_RtComRxPayload_au16(20)_U8',
	'PitchSensor_IntErrCnt45_U8'       	=> 'rb_cs7c_RtComRxPayload_au16(24)_U8',                 

#    Status HW SCON
#------------------
	'YawSensor_Status_HW_SCON_U8'  		=> 'rb_cs7c_RtComRxPayload_au16(11)_U8',
	'RollSensor_Status_HW_SCON_U8' 		=> 'rb_cs7c_RtComRxPayload_au16(12)_U8',
	'PitchSensor_Status_HW_SCON_U8'		=> 'rb_cs7c_RtComRxPayload_au16(13)_U8',
	
#*********************************************************************************				
#    InitialRelOffsetCheckFailure
	'cs7m_ManagerStateRT_U8'              	=> 'rb_cs7m_ManagerStateRT_en_U8',                
	'csem_InitialRelOffsetCheckFailure_U8'	=> 'rb_csem_SensorDataRT_st.InitialRelOffsetCheckFailure_bo_U8',

#    rb_cia_EgoVelocity_u16_U8
#	'VehSpeed_U8'	=> 'rb_cia_UnfrozenVelocity_u16_U8',
	
#***************************************************************************************
#                          CONSTANTS
#***************************************************************************************
# conf_x
# Fast Diagnosis and CAN evaluation
#	'FD_Trigger_A' 	=> 16,  #CA	
#	'CAN_Trigger_A' => 16,  #CA
	'FD_Trigger_A' 	=> 4,   #MRA  	
	'CAN_Trigger_A' => 4,   #MRA
	
	'SMI7_ChannelState_OK_C' => 2,				

#**********************************************************************
#*                  conf_1,2,3 SMI7 -> CoreAsset
#**********************************************************************	   			   
		
##   'AlgoDataValid_b32.0_U8'
#---------------------------
#	'AccXLgChl_AlgoData_NotValid_C'     	 	=> '0bxxx0xxxx',   # **AccXLg    flt_int=18ms ACC2
#	'AccXLgChl_AlgoData_Valid_C'        	 	=> '0bxxx1xxxx',		
#	'AccXHgMonChl_AlgoData_NotValid_C'  	 	=> '0bxx0xxxxx',   # AccXHgMon   flt_int=0ms
#	'AccXHgMonChl_AlgoData_Valid_C'     	 	=> '0bxx1xxxxx',
#	'AccYLgChl_AlgoData_NotValid_C'     	 	=> '0bx0xxxxxx',   # AccYLg      flt_int=2ms 
#	'AccYLgChl_AlgoData_Valid_C'        	 	=> '0bx1xxxxxx',               

##	'AlgoDataValid_b32.1_U8'
#---------------------------
#	'AccYLgPlausiChl_AlgoData_NotValid_C'    	=> '0bxxxxxxx0',   # AccYLgPlausi
#	'AccYLgPlausiChl_AlgoData_Valid_C'       	=> '0bxxxxxxx1',		
#	'AccZLgChl_AlgoData_NotValid_C'          	=> '0bxxxxxx0x',   # AccZLg      flt_int=2ms
#	'AccZLgChl_AlgoData_Valid_C'             	=> '0bxxxxxx1x',	
#	'RollRateLfChl_AlgoData_NotValid_C'      	=> '0bxxxxx0xx',   # RollRateLf  flt_int=2ms
#	'RollRateLfChl_AlgoData_Valid_C'         	=> '0bxxxxx1xx',		
#	'YawRateLfChl_AlgoData_NotValid_C'       	=> '0bxxxx0xxx',   # YawRateLf flt_int=18ms
#	'YawRateLfChl_AlgoData_Valid_C'          	=> '0bxxxx1xxx',		
#	'YawRateLfPlausiChl_AlgoData_NotValid_C' 	=> '0bxxx0xxxx',   # YawRateLfPlausi
#	'YawRateLfPlausiChl_AlgoData_Valid_C'    	=> '0bxxx1xxxx',		
#	'PitchRateLfChl_AlgoData_NotValid_C'     	=> '0bxx0xxxxx',   # PitchRateLf
#	'PitchRateLfChl_AlgoData_Valid_C'        	=> '0bxx1xxxxx',
		
#	'AllSMI7Sensors_AlgoData_NotValid_C'     	=> '0bxxxxxxxxxxxxxxxxxx0000000000xxxx',

			   			   
##   'InertDataOverload_b32.0'   	   		   	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.0_U8'
#----------------------------
#	'AccXLgChl_InertDataOverload_0_C'    	   	=> '0bxxx0xxxx',
#	'AccXLgChl_InertDataOverload_1_C'    	   	=> '0bxxx1xxxx',
#	'AccXHgMonChl_InertDataOverload_0_C' 	   	=> '0bxx0xxxxx',
#	'AccXHgMonChl_InertDataOverload_1_C' 	   	=> '0bxx1xxxxx',
#	'AccYLgChl_InertDataOverload_0_C'    	   	=> '0bx0xxxxxx',
#	'AccYLgChl_InertDataOverload_1_C'    	   	=> '0bx1xxxxxx',
               
##	'InertDataOverload_b32.1'   	           	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8'
#----------------------------
#	'AccYLgPlausiChl_InertDataOverload_0_C'    	=> '0bxxxxxxx0',
#	'AccYLgPlausiChl_InertDataOverload_1_C'    	=> '0bxxxxxxx1',
#	'AccZLgChl_InertDataOverload_0_C'          	=> '0bxxxxxx0x',
#	'AccZLgChl_InertDataOverload_1_C'          	=> '0bxxxxxx1x',
#	'RollRateLfChl_InertDataOverload_0_C'      	=> '0bxxxxx0xx',
#	'RollRateLfChl_InertDataOverload_1_C'      	=> '0bxxxxx1xx',
#	'YawRateLfChl_InertDataOverload_0_C'       	=> '0bxxxx0xxx',
#	'YawRateLfChl_InertDataOverload_1_C'       	=> '0bxxxx1xxx',
#	'YawRateLfPlausiChl_InertDataOverload_0_C' 	=> '0bxxx0xxxx',
#	'YawRateLfPlausiChl_InertDataOverload_1_C' 	=> '0bxxx1xxxx',
#	'PitchRateLfChl_InertDataOverload_0_C'     	=> '0bxx0xxxxx',
#	'PitchRateLfChl_InertDataOverload_1_C'     	=> '0bxx1xxxxx',

#**********************************************************************
#*                  conf_4,5 SMI7 -> CoreAsset
#**********************************************************************	   			   

#   'AlgoDataValid_b32.0'   	      		 	=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8'
#	'AccXLgChl_AlgoData_NotValid_C'     	 	=> '0bxx0xxxxx',   # **AccXLg    flt_int=18ms ACC2
#	'AccXLgChl_AlgoData_Valid_C'        	 	=> '0bxx1xxxxx',		
#	'AccXHgMonChl_AlgoData_NotValid_C'  	 	=> '0bx0xxxxxx',   # AccXHgMon   flt_int=0ms
#	'AccXHgMonChl_AlgoData_Valid_C'     	 	=> '0bx1xxxxxx',		
#	'AccYLgChl_AlgoData_NotValid_C'     	 	=> '0b0xxxxxxx',   # AccYLg      flt_int=2ms 
#	'AccYLgChl_AlgoData_Valid_C'        	 	=> '0b1xxxxxxx',               
#	
#	'AlgoDataValid_b32.1'  					 	=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8'
#	'AccYHgMonChl_AlgoData_NotValid_C'    	    => '0bxxxxxxx0',   # AccYLgPlausi
#	'AccYHgMonChl_AlgoData_Valid_C'         	=> '0bxxxxxxx1',		
#	'AccYLgPlausiChl_AlgoData_NotValid_C'    	=> '0bxxxxxx0x',   # AccYLgPlausi
#	'AccYLgPlausiChl_AlgoData_Valid_C'       	=> '0bxxxxxx1x',
#	'AccZLgChl_AlgoData_NotValid_C'          	=> '0bxxxxx0xx',   # AccZLg      flt_int=2ms
#	'AccZLgChl_AlgoData_Valid_C'             	=> '0bxxxxx1xx',		
#	'RollRateLfChl_AlgoData_NotValid_C'      	=> '0bxxxx0xxx',   # RollRateLf  flt_int=2ms
#	'RollRateLfChl_AlgoData_Valid_C'         	=> '0bxxxx1xxx',		
#	'YawRateLfChl_AlgoData_NotValid_C'       	=> '0bxxx0xxxx',   # YawRateLf flt_int=18ms
#	'YawRateLfChl_AlgoData_Valid_C'          	=> '0bxxx1xxxx',		
#	'YawRateLfPlausiChl_AlgoData_NotValid_C' 	=> '0bxx0xxxxx',   # YawRateLfPlausi
#	'YawRateLfPlausiChl_AlgoData_Valid_C'    	=> '0bxx1xxxxx',		
#	'PitchRateLfChl_AlgoData_NotValid_C'     	=> '0bx0xxxxxx',   # PitchRateLf
#	'PitchRateLfChl_AlgoData_Valid_C'        	=> '0bx1xxxxxx',
		
#	'AllSMI7Sensors_AlgoData_NotValid_C'     	=> '0bxxxxxxxxxxxxxxxxx0000000000xxxxx',
			   			   
#   'InertDataOverload_b32.0'   	   		   	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.0_U8'
#----------------------------
#	'AccXLgChl_InertDataOverload_0_C'    	   	=> '0bxx0xxxxx',
#	'AccXLgChl_InertDataOverload_1_C'    	   	=> '0bxx1xxxxx',
#	'AccXHgMonChl_InertDataOverload_0_C' 	   	=> '0bx0xxxxxx',
#	'AccXHgMonChl_InertDataOverload_1_C' 	   	=> '0bx1xxxxxx',
#	'AccYLgChl_InertDataOverload_0_C'    	   	=> '0b0xxxxxxx',
#	'AccYLgChl_InertDataOverload_1_C'    	   	=> '0b1xxxxxxx',
	
#	'InertDataOverload_b32.1'   	           	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8'
#----------------------------
#	'AccYHgMonChl_InertDataOverload_0_C' 	   	=> '0bxxxxxxx0',
#	'AccYHgMonChl_InertDataOverload_1_C' 	   	=> '0bxxxxxxx1',
#	'AccYLgPlausiChl_InertDataOverload_0_C'    	=> '0bxxxxxx0x',
#	'AccYLgPlausiChl_InertDataOverload_1_C'    	=> '0bxxxxxx1x',
#	'AccZLgChl_InertDataOverload_0_C'          	=> '0bxxxxx0xx',
#	'AccZLgChl_InertDataOverload_1_C'          	=> '0bxxxxx1xx',
#	'RollRateLfChl_InertDataOverload_0_C'      	=> '0bxxxx0xxx',
#	'RollRateLfChl_InertDataOverload_1_C'      	=> '0bxxxx1xxx',
#	'YawRateLfChl_InertDataOverload_0_C'       	=> '0bxxx0xxxx',
#	'YawRateLfChl_InertDataOverload_1_C'       	=> '0bxxx1xxxx',
#	'YawRateLfPlausiChl_InertDataOverload_0_C' 	=> '0bxx0xxxxx',
#	'YawRateLfPlausiChl_InertDataOverload_1_C' 	=> '0bxx1xxxxx',
#	'PitchRateLfChl_InertDataOverload_0_C'     	=> '0bx0xxxxxx',
#	'PitchRateLfChl_InertDataOverload_1_C'     	=> '0bx1xxxxxx',

#**********************************************************************
#*                  conf_6 SMI7 -> MRA2
#**********************************************************************	   			   

#   'AlgoDataValid_b32.0'   	      		 	=> 'rb_csem_SensorDataRT_st.DataValid_b32_U8'
#------------------------
	'AccXLgChl_AlgoData_NotValid_C'     	 	=> '0bxxxxx0xx',
	'AccXLgChl_AlgoData_Valid_C'        	 	=> '0bxxxxx1xx',
	'AccXHgMonChl_AlgoData_NotValid_C'  	 	=> '0bxxxx0xxx',
	'AccXHgMonChl_AlgoData_Valid_C'     	 	=> '0bxxxx1xxx',
	'AccYLgChl_AlgoData_NotValid_C'     	 	=> '0bxxx0xxxx',
	'AccYLgChl_AlgoData_Valid_C'        	 	=> '0bxxx1xxxx',
	'AccYHgMonChl_AlgoData_NotValid_C'    	    => '0bxx0xxxxx',
	'AccYHgMonChl_AlgoData_Valid_C'         	=> '0bxx1xxxxx',
	'AccZLgChl_AlgoData_NotValid_C'    			=> '0bx0xxxxxx',
	'AccZLgChl_AlgoData_Valid_C'             	=> '0bx1xxxxxx',
	'RollRateLfChl_AlgoData_NotValid_C'      	=> '0b0xxxxxxx',
	'RollRateLfChl_AlgoData_Valid_C'         	=> '0b1xxxxxxx',
#	
#	'AlgoDataValid_b32.1'  					 	=> 'rb_csem_SensorDataRT_st.DataValid_b32.1_U8'
#-----------------------
	'YawRateLfChl_AlgoData_NotValid_C'       	=> '0bxxxxxxx0',
	'YawRateLfChl_AlgoData_Valid_C'          	=> '0bxxxxxxx1',
	'PitchRateLfChl_AlgoData_NotValid_C'     	=> '0bxxxxxx0x',
	'PitchRateLfChl_AlgoData_Valid_C'        	=> '0bxxxxxx1x',
		
	'AllSMI7Sensors_AlgoData_NotValid_C'     	=> '0bxxxxxxxxxxxxxxxxxxxxxx00000000xx',
			   			   
#   'InertDataOverload_b32.0'   	   		   	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.0_U8'
#----------------------------
	'AccXLgChl_InertDataOverload_0_C'    	   	=> '0bxxxxx0xx',
	'AccXLgChl_InertDataOverload_1_C'    	   	=> '0bxxxxx1xx',
	'AccXHgMonChl_InertDataOverload_0_C' 	   	=> '0bxxxx0xxx',
	'AccXHgMonChl_InertDataOverload_1_C' 	   	=> '0bxxxx1xxx',
	'AccYLgChl_InertDataOverload_0_C'    	   	=> '0bxxx0xxxx',
	'AccYLgChl_InertDataOverload_1_C'    	   	=> '0bxxx1xxxx',	
	'AccYHgMonChl_InertDataOverload_0_C' 	   	=> '0bxx0xxxxx',
	'AccYHgMonChl_InertDataOverload_1_C' 	   	=> '0bxx1xxxxx',
	'AccZLgChl_InertDataOverload_0_C'          	=> '0bx0xxxxxx',
	'AccZLgChl_InertDataOverload_1_C'          	=> '0bx1xxxxxx',
	'RollRateLfChl_InertDataOverload_0_C'      	=> '0b0xxxxxxx',
	'RollRateLfChl_InertDataOverload_1_C'      	=> '0b1xxxxxxx',
#	
#	'InertDataOverload_b32.1'   	           	=> 'rb_csem_SensorDataRT_st.InertDataOverload_b32.1_U8'
#----------------------------
	'YawRateLfChl_InertDataOverload_0_C'       	=> '0bxxxxxxx0',
	'YawRateLfChl_InertDataOverload_1_C'       	=> '0bxxxxxxx1',
	'PitchRateLfChl_InertDataOverload_0_C'     	=> '0bxxxxxx0x',
	'PitchRateLfChl_InertDataOverload_1_C'     	=> '0bxxxxxx1x',
	
# conf_1 -> CoreAsset			   			   
#	'YawSensor_AlgoData_NotValid_C'       		=> '0bxxxxxxxxxxxxxxxxxxxx0xxxx000xxxx', # YawRateLf + AccYLgChl + AccXHgMonChl + AccXLgChl
#	'YawSensor_AlgoData_Valid_C'          		=> '0bxxxxxxxxxxxxxxxxxxxx1xxxx111xxxx',		
#	'RollSensor_AlgoData_NotValid_C'      		=> '0bxxxxxxxxxxxxxxxxxxxxx00xxxxxxxxx', # RollRateLfChl + AccZLgChl
#	'RollSensor_AlgoData_Valid_C'         		=> '0bxxxxxxxxxxxxxxxxxxxxx11xxxxxxxxx',
#	'YawPlausiSensor_AlgoData_NotValid_C' 		=> '0bxxxxxxxxxxxxxxxxxxx0xxx0xxxxxxxx', # YawRateLfPlausiChl + AccYLgPlausiChl
#	'YawPlausiSensor_AlgoData_Valid_C'    		=> '0bxxxxxxxxxxxxxxxxxxx1xxx1xxxxxxxx',

#
#	'YawSensor_DeviceId_C'      		=> '0x0701',
#	'YawPlausiSensor_DeviceId_C'      	=> '0x0701',
#	'RollSensor_DeviceId_C'      		=> '0x0702',

# conf_2 -> CoreAsset			   				   
#	'YawSensor_AlgoData_NotValid_C'       		=> '0bxxxxxxxxxxxxxxxxxxxx0xxxx0xxxxxx', # YawRateLf + AccYLgChl
#	'YawSensor_AlgoData_Valid_C'          		=> '0bxxxxxxxxxxxxxxxxxxxx1xxxx1xxxxxx',		
#	'RollSensor_AlgoData_NotValid_C'      		=> '0bxxxxxxxxxxxxxxxxxxxxx0xxxxxxxxxx', # RollRateLfChl
#	'RollSensor_AlgoData_Valid_C'         		=> '0bxxxxxxxxxxxxxxxxxxxxx1xxxxxxxxxx',
#	'YawPlausiSensor_AlgoData_NotValid_C' 		=> '0bxxxxxxxxxxxxxxxxxxx0xxx0xxxxxxxx', # YawRateLfPlausiChl + AccYLgPlausiChl
#	'YawPlausiSensor_AlgoData_Valid_C'    		=> '0bxxxxxxxxxxxxxxxxxxx1xxx1xxxxxxxx',
#	'PitchSensor_AlgoData_NotValid_C'     		=> '0bxxxxxxxxxxxxxxxxxx0xxx0xxx00xxxx', # PitchRateLfChl + AccZLgChl + AccXHgMonChl + AccXLgChl
#	'PitchSensor_AlgoData_Valid_C'        		=> '0bxxxxxxxxxxxxxxxxxx1xxx1xxx11xxxx',
#
#	'YawSensor_DeviceId_C'      		=> '0x0701',
#	'YawPlausiSensor_DeviceId_C'      	=> '0x0701',
#	'RollSensor_DeviceId_C'      		=> '0x0702',
#	'PitchSensor_DeviceId_C'      		=> '0x0702',

# conf_3 -> CoreAsset	
#	'YawSensor_AlgoData_NotValid_C'         	=> '0bxxxxxxxxxxxxxxxxxxxx0x0xx0xxxxxx', # YawRateLf + AccZLgChl+ AccYLgChl 
#	'YawSensor_AlgoData_Valid_C'            	=> '0bxxxxxxxxxxxxxxxxxxxx1x1xx1xxxxxx',
#	'RollSensor_AlgoData_NotValid_C'        	=> '0bxxxxxxxxxxxxxxxxxxxxx0xxxx00xxxx', # RollRateLfChl + AccXHgMonChl + AccXLgChl 
#	'RollSensor_AlgoData_Valid_C'           	=> '0bxxxxxxxxxxxxxxxxxxxxx1xxxx11xxxx',
#
#	'YawSensor_DeviceId_C'      		=> '0x0701',
#	'RollSensor_DeviceId_C'      		=> '0x0702',

# conf_4 -> CoreAsset			   			   
#	'YawSensor_AlgoData_NotValid_C'       		=> '0bxxxxxxxxxxxxxxxxx1000000000xxxxx', # YawRateLf + AccXLgChl + AccXHgMonChl + AccYLgChl + AccYHgMonChl + AccZLgChl + RollRateLfChl
#	'YawSensor_AlgoData_Valid_C'          		=> '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',		
#	'PitchSensor_AlgoData_NotValid_C'      		=> '0bxxxxxxxxxxxxxxxxx0011101111xxxxx', # PitchRateLfChl
#	'PitchSensor_AlgoData_Valid_C'         		=> '0bxxxxxxxxxxxxxxxxx1011101111xxxxx',
#
#	'InertialSensor1_DeviceId_C'      		=> '0x0801',
#	'InertialSensor2_DeviceId_C'      		=> '0x0802',

# conf_5 -> CoreAsset			   			   
#	'InertialSensor1_AlgoData_NotValid_C'       => '0bxxxxxxxxxxxxxxxxx0000000000xxxxx', # YawRateLf + AccXLgChl + AccXHgMonChl + AccYLgChl + AccYHgMonChl + AccZLgChl + RollRateLfChl
#	'InertialSensor1_AlgoData_Valid_C'          => '0bxxxxxxxxxxxxxxxxx0010001111xxxxx',		
#
#	'InertialSensor1_DeviceId_C'		=> '0x0801',
#
#	'InertialSensor1_RevisionId_C'		=> '0x0000', # SMI800 C0-sample

# conf_6 -> MRA2			   				   
	'YawSensor_AlgoData_NotValid_C'       		=> '0bxxxxxxxxxxxxxxxxxxxxxxx0x000xxxx', # YawRateLf + AccZLg + AccYHgMon + AccYLgChl
	'YawSensor_AlgoData_Valid_C'          		=> '0bxxxxxxxxxxxxxxxxxxxxxxx1x111xxxx',		
	'RollSensor_AlgoData_NotValid_C'      		=> '0bxxxxxxxxxxxxxxxxxxxxxxxx0xxx00xx', # RollRateLfChl + AccXHgMon + AccXLg
	'RollSensor_AlgoData_Valid_C'         		=> '0bxxxxxxxxxxxxxxxxxxxxxxxx1xxx11xx',
	'PitchSensor_AlgoData_NotValid_C'     		=> '0bxxxxxxxxxxxxxxxxxxxxxx0xxxxxxxxx', # PitchRateLfChl
	'PitchSensor_AlgoData_Valid_C'        		=> '0bxxxxxxxxxxxxxxxxxxxxxx1xxxxxxxxx',
#
	'YawSensor_DeviceId_C'      		=> '0x0704',
	'RollSensor_DeviceId_C'      		=> '0x0707',
	'PitchSensor_DeviceId_C'      		=> '0x0707',

#**********************************************************************
#*                  conf -> All
#**********************************************************************	   			   
	'RevisionId_C'    		=> '0x1111',
	'SmiSerialNr0_C'  		=> '0x0011',               
	'SmiSerialNr1_C'  		=> '0x1100',                 
	'SmiSerialNr2_C'  		=> '0bxxxx000100010001', 
	'AsicSerialNr0_C' 		=> '0x0011',               
	'AsicSerialNr1_C' 		=> '0x1100',               
	'AsicSerialNr2_C' 		=> '0x1111',
	
#	 ErrorFlags stored in Field Claim Data area		
	'ClusterFlags_EE_C'					=> '0x8421',
	'ErrorFlag1_EE_C'       			=> '0x8421',
	'Temperature_EE_C'      			=> '0x8421',				

#    Set crunking off (write to RAM)            
	'varName_Cranking' 					=> 'rb_csei_IgnitionOffOrEngineOn_bo',                                
	'andMask_Cranking' 					=> '0x00',
	'orMask_Cranking'  					=> '0x00',
				
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
				
#    De-configure all SMI7 sensors            
	'varName_AsicConfigured' 			=> 'rb_syca_SysConfAsicEeData_dfst.AsicConfigured_ab8(0)',                                
	'andMask_AsicConfigured' 			=> '0x0F',
	'orMask_AsicConfigured'  			=> '0x00',
	'restore_AsicConfigured_yes'		=> 'yes',
				
#    Delay Init Test Manager by 4s           
	'varName_InitDelay' 				=> 'rb_sycg_StaticBehaviorBits_dfst.rb_sycg_StaticBits_ab8(0)',                                
	'andMask_InitDelay' 				=> '0xFF',
	'orMask_InitDelay'  				=> '0x01',
	'restore_InitDelay_yes'  			=> 'yes',
				
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


#***************************************************************************************
#                Faults -> CoreAsset
#***************************************************************************************
# index for Dem_AllEventsStatusByte datafrom *.flt file

#* rb_csem_MonPermInitPitchSensor_flt
#* rb_csem_MonPermInitRollSensor_flt
#* rb_csem_MonPermInitYawPlausiSensor_flt
#* rb_csem_MonPermInitYawSensor_flt
#
# MonPermInitSensorFlt
#---------------------
#	'PitchSensor_MonPermInit_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(56)_U8',
#	'RollSensor_MonPermInit_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(57)_U8',
#	'YawPlausiSensor_MonPermInit_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(58)_U8',
#	'YawSensor_MonPermInit_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(59)_U8',
#	'InertialSensor1_MonPermInit_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(59)_U8',

#* rb_csem_MonPermBGPitchSensor_flt
#* rb_csem_MonPermBGRollSensor_flt
#* rb_csem_MonPermBGYawPlausiSensor_flt
#* rb_csem_MonPermBGYawSensor_flt
#
# MonPermBGSensorFlt
#-------------------
#	'PitchSensor_MonPermBG_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(52)_U8',
#	'RollSensor_MonPermBG_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(53)_U8',
#	'YawPlausiSensor_MonPermBG_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(54)_U8',
#	'YawSensor_MonPermBG_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(55)_U8',
#	'InertialSensor1_MonPermBG_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(55)_U8',
               
#* rb_csem_MonTempAccXHgMonChl_flt
#* rb_csem_MonTempAccXLgChl_flt
#* rb_csem_MonTempAccYHgMonChl_flt
#* rb_csem_MonTempAccYLgChl_flt
#* rb_csem_MonTempAccYLgPlausiChl_flt
#* rb_csem_MonTempAccZLgChl_flt
#* rb_csem_MonTempPitchRateLfChl_flt
#* rb_csem_MonTempRollRateLfChl_flt
#* rb_csem_MonTempYawRateLfChl_flt
#* rb_csem_MonTempYawRateLfPlausiChl_flt
#
# MonTempChlFlt
#--------------
#	'AccXHgMonChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(64)_U8',
#	'AccXLgChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(65)_U8',
#	'AccYHgMonChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(66)_U8',
#	'AccYLgChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(67)_U8',
#	'AccYLgPlausiChl_MonTemp_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(68)_U8',
#	'AccZLgChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(69)_U8',
#	'PitchRateLfChl_MonTemp_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(70)_U8',
#	'RollRateLfChl_MonTemp_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(71)_U8',
#	'YawRateLfChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(72)_U8',
#	'YawRateLfPlausiChl_MonTemp_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(73)_U8',
                
#* rb_csem_MonPermAccXHgMonChl_flt
#* rb_csem_MonPermAccXLgChl_flt
#* rb_csem_MonPermAccYHgMonChl_flt
#* rb_csem_MonPermAccYLgChl_flt
#* rb_csem_MonPermAccYLgPlausiChl_flt
#* rb_csem_MonPermAccZLgChl_flt
#* rb_csem_MonPermPitchRateLfChl_flt
#* rb_csem_MonPermRollRateLfChl_flt
#* rb_csem_MonPermYawRateLfChl_flt
#* rb_csem_MonPermYawRateLfPlausiChl_flt
#
# MonPermChlFlt
#--------------
#	'AccXHgMonChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(46)_U8',
#	'AccXLgChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(47)_U8',
#	'AccYHgMonChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(48)_U8',
#	'AccYLgChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(49)_U8',
#	'AccYLgPlausiChl_MonPerm_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(50)_U8',
#	'AccZLgChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(51)_U8',
#	'PitchRateLfChl_MonPerm_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(60)_U8',
#	'RollRateLfChl_MonPerm_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(61)_U8',
#	'YawRateLfChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(62)_U8',
#	'YawRateLfPlausiChl_MonPerm_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(63)_U8',
			
#* rb_simc_SignalMonCtrlHighgXMon_flt
#* rb_simc_SignalMonCtrlHighgYMon_flt
#* rb_simc_SignalMonCtrlLowgX_flt
#* rb_simc_SignalMonCtrlLowgYPls_flt
#* rb_simc_SignalMonCtrlLowgY_flt
#* rb_simc_SignalMonCtrlLowgZ_flt
#* rb_simc_SignalMonCtrlMain_flt
#* rb_simc_SignalMonCtrlPitchRateLf_flt
#* rb_simc_SignalMonCtrlPlausi_flt
#* rb_simc_SignalMonCtrlRollRateLf_flt
#* rb_simc_SignalMonCtrlYawRateLfPls_flt
#* rb_simc_SignalMonCtrlYawRateLf_flt
#
# SignalMonCtrl	
#--------------
#	'AccXHgMonChl_SignalMonCtrl_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(229)_U8',
#	'AccYHgMonChl_SignalMonCtrl_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(230)_U8',
#	'AccXLgChl_SignalMonCtrl_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(231)_U8',
#	'AccYLgPlausiChl_SignalMonCtrl_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(232)_U8',
#	'AccYLgChl_SignalMonCtrl_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(233)_U8',
#	'AccZLgChl_SignalMonCtrl_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(234)_U8',
#	'PitchRateLfChl_SignalMonCtrl_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(236)_U8',
#	'RollRateLfChl_SignalMonCtrl_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(238)_U8', 
#	'YawRateLfPlausiChl_SignalMonCtrl_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(239)_U8',
#	'YawRateLfChl_SignalMonCtrl_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(240)_U8',
		
#* rb_syc_AsicIdMismatch_flt
#* rb_spi_SpiRcvMsgCrcWrong_flt
#
#	'AsicIdMismatch_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(543)_U8',				
#	'CRC_fltStatus_U8'				=> 'Dem_AllEventsStatusByte(255)_U8', #rb_spi_SpiRcvMsgTff_flt	
	
#***************************************************************************************
#                DTCs -> CoreAsset
#***************************************************************************************
#    MonPermInit_flt
#-------------------
#	'rb_csem_MonPermInitYawSensor_flt'          => '0xF00049',
#	'rb_csem_MonPermInitRollSensor_flt'         => '0xF00049',
#	'rb_csem_MonPermInitPitchSensor_flt'        => '0xF00049',
#	'rb_csem_MonPermInitYawPlausiSensor_flt'    => '0xF00049',

#    MonPermBG_flt
#-----------------
#	'rb_csem_MonPermBGYawSensor_flt'            => '0xF00049',
#	'rb_csem_MonPermBGRollSensor_flt'           => '0xF00049',
#	'rb_csem_MonPermBGPitchSensor_flt'          => '0xF00049',
#	'rb_csem_MonPermBGYawPlausiSensor_flt'      => '0xF00049',

#    MonTempChl_flt
#------------------
#	'rb_csem_MonTempYawRateLfChl_flt'           => '0x00001A',
#	'rb_csem_MonTempAccXLgChl_flt'              => '0x000013',
#	'rb_csem_MonTempAccYLgChl_flt'              => '0x000015',
#	'rb_csem_MonTempAccXHgMonChl_flt'           => '0x000012',
#	'rb_csem_MonTempAccYHgMonChl_flt'           => '0x000014',
#	'rb_csem_MonTempRollRateLfChl_flt'          => '0x000019',
#	'rb_csem_MonTempAccZLgChl_flt'              => '0x000017',
#	'rb_csem_MonTempPitchRateLfChl_flt'         => '0x000018',
#	'rb_csem_MonTempYawRateLfPlausiChl_flt'     => '0x00001B',
#	'rb_csem_MonTempAccYLgPlausiChl_flt'        => '0x000016',

#    MonPermChl_flt
#------------------
#	'rb_csem_MonPermYawRateLfChl_flt'           => '0xF00049',
#	'rb_csem_MonPermAccXLgChl_flt'              => '0xF00049',
#	'rb_csem_MonPermAccYLgChl_flt'              => '0xF00049',
#	'rb_csem_MonPermAccXHgMonChl_flt'           => '0xF00049',
#	'rb_csem_MonPermAccYHgMonChl_flt'           => '0xF00049',
#	'rb_csem_MonPermRollRateLfChl_flt'          => '0xF00049',
#	'rb_csem_MonPermAccZLgChl_flt'              => '0xF00049',
#	'rb_csem_MonPermPitchRateLfChl_flt'         => '0xF00049',
#	'rb_csem_MonPermYawRateLfPlausiChl_flt'     => '0xF00049',
#	'rb_csem_MonPermAccYLgPlausiChl_flt'        => '0xF00049',
	
#	 Field calibration
#---------------------
#	'rb_csem_FieldCalibMissing_flt'				=> '0x00001B',

#	 SignalMonCtrl_flt
#---------------------
#	'rb_simc_SignalMonCtrlHighgXMon_flt'		=> '0xF00049',
#	'rb_simc_SignalMonCtrlLowgX_flt'			=> '0xF00049',
#	'rb_simc_SignalMonCtrlLowgYPls_flt'			=> '0xF00049',
#	'rb_simc_SignalMonCtrlLowgY_flt'			=> '0xF00049',
#	'rb_simc_SignalMonCtrlLowgZ_flt'			=> '0xF00049',
#	'rb_simc_SignalMonCtrlPitchRateLf_flt'		=> '0xF00049',
#	'rb_simc_SignalMonCtrlRollRateLf_flt'		=> '0xF00049',
#	'rb_simc_SignalMonCtrlYawRateLfPls_flt'		=> '0xF00049',
#	'rb_simc_SignalMonCtrlYawRateLf_flt'		=> '0xF00049',

#----------------------
#	'rb_spi_SpiRcvMsgCrcWrong_flt'              => '0xF00049',
#	'rb_syc_AsicIdMismatch_flt'					=> '0xF00049',
#
	

#***************************************************************************************
#                Faults -> SMI7 MRA2
#***************************************************************************************
# index for Dem_AllEventsStatusByte datafrom *.flt file

#* rb_csem_MonPermInitPitchSensor_flt
#* rb_csem_MonPermInitRollSensor_flt
#* rb_csem_MonPermInitYawSensor_flt
#
# MonPermInitSensorFlt
#---------------------
	'PitchSensor_MonPermInit_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(148)_U8',
	'RollSensor_MonPermInit_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(149)_U8',
	'YawSensor_MonPermInit_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(151)_U8',

#* rb_csem_MonPermBGPitchSensor_flt
#* rb_csem_MonPermBGRollSensor_flt
#* rb_csem_MonPermBGYawSensor_flt
#
# MonPermBGSensorFlt
#-------------------
	'PitchSensor_MonPermBG_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(144)_U8',
	'RollSensor_MonPermBG_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(145)_U8',
	'YawSensor_MonPermBG_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(147)_U8',

#* rb_csem_MonTempAccXHgMonChl_flt
#* rb_csem_MonTempAccXLgChl_flt
#* rb_csem_MonTempAccYHgMonChl_flt
#* rb_csem_MonTempAccYLgChl_flt
#* rb_csem_MonTempAccZLgChl_flt
#* rb_csem_MonTempPitchRateLfChl_flt
#* rb_csem_MonTempRollRateLfChl_flt
#* rb_csem_MonTempYawRateLfChl_flt
#	
# MonTempChlFlt
#--------------
	'AccXHgMonChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(156)_U8',
	'AccXLgChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(157)_U8',
	'AccYHgMonChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(158)_U8',
	'AccYLgChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(159)_U8',
	'AccZLgChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(161)_U8',
	'PitchRateLfChl_MonTemp_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(162)_U8',
	'RollRateLfChl_MonTemp_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(163)_U8',
	'YawRateLfChl_MonTemp_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(164)_U8',
  
#* rb_csem_MonPermAccXHgMonChl_flt
#* rb_csem_MonPermAccXLgChl_flt
#* rb_csem_MonPermAccYHgMonChl_flt
#* rb_csem_MonPermAccYLgChl_flt
#* rb_csem_MonPermAccZLgChl_flt
#* rb_csem_MonPermPitchRateLfChl_flt
#* rb_csem_MonPermRollRateLfChl_flt
#* rb_csem_MonPermYawRateLfChl_flt
#  
# MonPermChlFlt
#--------------
	'AccXHgMonChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(138)_U8',
	'AccXLgChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(139)_U8',
	'AccYHgMonChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(140)_U8',
	'AccYLgChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(141)_U8',
	'AccZLgChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(143)_U8',
	'PitchRateLfChl_MonPerm_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(152)_U8',
	'RollRateLfChl_MonPerm_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(153)_U8',
	'YawRateLfChl_MonPerm_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(154)_U8',

#* rb_simc_SignalMonCtrlHighgXMon_flt
#* rb_simc_SignalMonCtrlHighgYMon_flt
#* rb_simc_SignalMonCtrlLowgX_flt
#* rb_simc_SignalMonCtrlLowgY_flt
#* rb_simc_SignalMonCtrlLowgZ_flt
#* rb_simc_SignalMonCtrlMain_flt
#* rb_simc_SignalMonCtrlPitchRateLf_flt
#* rb_simc_SignalMonCtrlPlausi_flt
#* rb_simc_SignalMonCtrlRollRateLf_flt
#* rb_simc_SignalMonCtrlYawRateLf_flt
#	
# SignalMonCtrl
#--------------
	'AccXHgMonChl_SignalMonCtrl_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(345)_U8',
	'AccYHgMonChl_SignalMonCtrl_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(346)_U8',
	'AccXLgChl_SignalMonCtrl_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(347)_U8',
	'AccYLgChl_SignalMonCtrl_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(349)_U8',
	'AccZLgChl_SignalMonCtrl_fltStatus_U8'			=> 'Dem_AllEventsStatusByte(350)_U8',
	'PitchRateLfChl_SignalMonCtrl_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(352)_U8',
	'RollRateLfChl_SignalMonCtrl_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(354)_U8', 
	'YawRateLfChl_SignalMonCtrl_fltStatus_U8'		=> 'Dem_AllEventsStatusByte(356)_U8',

#rb_syc_AsicIdMismatch_flt
#rb_spi_SpiRcvMsgCrcWrong_flt
#	
#--------------
	'AsicIdMismatch_fltStatus_U8'	=> 'Dem_AllEventsStatusByte(750)_U8',				
	'CRC_fltStatus_U8'				=> 'Dem_AllEventsStatusByte(369)_U8',	
	
#***************************************************************************************
#                DTCs ->  Customer Project
#***************************************************************************************
#    MonPermInit_flt
#-------------------
	'rb_csem_MonPermInitYawSensor_flt'          => '0x9BC749',
	'rb_csem_MonPermInitRollSensor_flt'         => '0x809996',
	'rb_csem_MonPermInitPitchSensor_flt'        => '0x809996',

#    MonPermBG_flt
#-----------------
	'rb_csem_MonPermBGYawSensor_flt'            => '0x9BC749',
	'rb_csem_MonPermBGRollSensor_flt'           => '0x809996',
	'rb_csem_MonPermBGPitchSensor_flt'          => '0x809996',

#    MonTempChl_flt
#------------------
	'rb_csem_MonTempYawRateLfChl_flt'           => '0x406A00',
	'rb_csem_MonTempAccXLgChl_flt'              => '0x406A00',
	'rb_csem_MonTempAccYLgChl_flt'              => '0x406A00',
	'rb_csem_MonTempAccXHgMonChl_flt'           => '0x406A00',
	'rb_csem_MonTempAccYHgMonChl_flt'           => '0x406A00',
	'rb_csem_MonTempRollRateLfChl_flt'          => '0x406A00',
	'rb_csem_MonTempAccZLgChl_flt'              => '0x406A00',
	'rb_csem_MonTempPitchRateLfChl_flt'         => '0x406A00',

#    MonPermChl_flt
#------------------
	'rb_csem_MonPermYawRateLfChl_flt'           => '0x9BC797',
	'rb_csem_MonPermAccXLgChl_flt'              => '0x9BC797',
	'rb_csem_MonPermAccYLgChl_flt'              => '0x9BC749',
	'rb_csem_MonPermAccXHgMonChl_flt'           => '0x9BC749',
	'rb_csem_MonPermAccYHgMonChl_flt'           => '0x9BC749',
	'rb_csem_MonPermRollRateLfChl_flt'          => '0x809996',
	'rb_csem_MonPermAccZLgChl_flt'              => '0x9BC749',
	'rb_csem_MonPermPitchRateLfChl_flt'         => '0x809996',

#	 Field calibration
#---------------------
	'rb_csem_FieldCalibMissing_flt'				=> '0x00001B',

#	 SignalMonCtrl_flt
#---------------------
	'rb_simc_SignalMonCtrlHighgXMon_flt'		=> '0x9BC797',
	'rb_simc_SignalMonCtrlLowgX_flt'			=> '0x9BC797',
	'rb_simc_SignalMonCtrlHighgYMon_flt'		=> '0x9BC797',
	'rb_simc_SignalMonCtrlLowgY_flt'			=> '0x9BC797',
	'rb_simc_SignalMonCtrlLowgZ_flt'			=> '0x9BC797',
	'rb_simc_SignalMonCtrlPitchRateLf_flt'		=> '0x9BC797',
	'rb_simc_SignalMonCtrlRollRateLf_flt'		=> '0x9BC797',
	'rb_simc_SignalMonCtrlYawRateLf_flt'		=> '0x9BC797',

	'rb_spi_SpiRcvMsgCrcWrong_flt'              => '0xF00049',
	'rb_syc_AsicIdMismatch_flt'					=> '0xD60100',
	
};

1;
__END__

***************************************************************************************
   
 Definitions for module TC_CSEM_SMI7
 ------------------------------------
typedef enum {
   rb_sycc_SMI700BusAddress00_e, 	// YAW_R
   rb_sycc_SMI700BusAddress01_e, 	// YAW
   rb_sycc_SMI710BusAddress10_e,    // PITCH
   rb_sycc_SMI710BusAddress11_e		// ROLL
} rb_sycc_Smi7BusAddress_ten;

#-1*****************************************************************************

!!!!Achtung: little endian ====> Ausgabe in LIFT auch little endian!!!!!!
'AlgoDataValid_b32' => 'rb_csem_SensorDataRT_st.DataValid_b32',
.cns file

#-1
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccM45_e;0;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccP45_e;1;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccM45_e;2;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccP45_e;3;

enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXLg_e;4;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXHgMon_e;5;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLg_e;6;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYHgMon_e;7;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLgPlausi_e;8;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccZLg_e;9;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_RollRateLf_e;10;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLf_e;11;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLfPlausi_e;12;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PitchRateLf_e;13;

enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_CentralSensorChannelsMax_e;14;

#-1 API to Algo invalid
rb_csem_SensorDataRT_st.DataValid_b32,FEDFABD4,PDI for sensor channel data which contains the data for each sensor channel itself and some.Flags if sensor channel data is valid,,,,,,,,,
rb_csem_SensorDataRT_st.DataValid_b32.1,FEDFABD5,PDI for sensor channel data which contains the data for each sensor channel itself and some.Flags if sensor channel data is valid,,,,,,,,,
rb_csem_SensorDataRT_st.DataValid_b32.2,FEDFABD6,PDI for sensor channel data which contains the data for each sensor channel itself and some.Flags if sensor channel data is valid,,,,,,,,,
rb_csem_SensorDataRT_st.DataValid_b32.3,FEDFABD7,PDI for sensor channel data which contains the data for each sensor channel itself and some.Flags if sensor channel data is valid,,,,,,,,,

#-1
rb_csem_SensorDataRT_st.InertDataOverload_b32,FEDFABD8,PDI for sensor channel data which contains the data for each sensor channel itself and some.Flags if sensor channel data is in mechanical overload for the inertial sensors only (e.g.,,,,,,,,,
rb_csem_SensorDataRT_st.InertDataOverload_b32.1,FEDFABD9,PDI for sensor channel data which contains the data for each sensor channel itself and some.Flags if sensor channel data is in mechanical overload for the inertial sensors only (e.g.,,,,,,,,,
rb_csem_SensorDataRT_st.InertDataOverload_b32.2,FEDFABDA,PDI for sensor channel data which contains the data for each sensor channel itself and some.Flags if sensor channel data is in mechanical overload for the inertial sensors only (e.g.,,,,,,,,,
rb_csem_SensorDataRT_st.InertDataOverload_b32.3,FEDFABDB,PDI for sensor channel data which contains the data for each sensor channel itself and some.Flags if sensor channel data is in mechanical overload for the inertial sensors only (e.g.,,,,,,,,,

#-1
rb_csem_SensorDataRT_st.ChannelValue_as16(0),FEDFABB8,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(0).1,FEDFABB9,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(1),FEDFABBA,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(1).1,FEDFABBB,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(10),FEDFABCC,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(10).1,FEDFABCD,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(11),FEDFABCE,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(11).1,FEDFABCF,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(12),FEDFABD0,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(12).1,FEDFABD1,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(13),FEDFABD2,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(13).1,FEDFABD3,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(2),FEDFABBC,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(2).1,FEDFABBD,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(3),FEDFABBE,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(3).1,FEDFABBF,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(4),FEDFABC0,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(4).1,FEDFABC1,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(5),FEDFABC2,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(5).1,FEDFABC3,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(6),FEDFABC4,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(6).1,FEDFABC5,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(7),FEDFABC6,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(7).1,FEDFABC7,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(8),FEDFABC8,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(8).1,FEDFABC9,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(9),FEDFABCA,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
rb_csem_SensorDataRT_st.ChannelValue_as16(9).1,FEDFABCB,PDI for sensor channel data which contains the data for each sensor channel itself and some.Pre-processed sensor channel data,,,,,,,,,
#-1*****************************************************************************

#-2*****************************************************************************
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXLg_e;          0;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXHgMon_e;       1;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLg_e;          2;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYHgMon_e;       3;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLgPlausi_e;    4;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccZLg_e;          5;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollRateLf_e;      6;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLf_e;       7;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLfPlausi_e; 8;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchRateLf_e;     9;

#-2 API to Customer invalid
rb_cs7m_ChlState_aen(0),FEDFAB24,Current state of each SMI7 channel
rb_cs7m_ChlState_aen(1),FEDFAB25,Current state of each SMI7 channel
rb_cs7m_ChlState_aen(2),FEDFAB26,Current state of each SMI7 channel
rb_cs7m_ChlState_aen(3),FEDFAB27,Current state of each SMI7 channel
rb_cs7m_ChlState_aen(4),FEDFAB28,Current state of each SMI7 channel
rb_cs7m_ChlState_aen(5),FEDFAB29,Current state of each SMI7 channel
rb_cs7m_ChlState_aen(6),FEDFAB2A,Current state of each SMI7 channel
rb_cs7m_ChlState_aen(7),FEDFAB2B,Current state of each SMI7 channel
rb_cs7m_ChlState_aen(8),FEDFAB2C,Current state of each SMI7 channel
rb_cs7m_ChlState_aen(9),FEDFAB2D,Current state of each SMI7 channel

#-2
enum;rb_csem_ChannelState_ten;rb_csem_ChlInitInProgress_e;          0;Channel initialization in progress
enum;rb_csem_ChannelState_ten;rb_csem_ChlNotConfigured_e;           1;Channel not configured
enum;rb_csem_ChannelState_ten;rb_csem_ChlOk_e;                      2;Channel OK
enum;rb_csem_ChannelState_ten;rb_csem_ChlTemporaryError_e;          3;Channel temporary error (out of spec)
enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorDueSensorErr_e;   4;Channel permanent error (sensor perm flt)
enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorCyclThisPOC_e;    5;Channel permanent error (cyclic this POC)
enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorCyclPrevPOC_e;    6;Channel permanent error (cyclic prev POC)
enum;rb_csem_ChannelState_ten;rb_csem_ChlPermErrorDueExtReq_e;      7;Channel permanent error (external request  e.g. ASI)
enum;rb_csem_ChannelState_ten;rb_csem_ChlNotSupported_e;            8;Channel is not supported
-2*****************************************************************************

#-3*****************************************************************************
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXLg_e;0;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXHgMon_e;1;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLg_e;2;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYHgMon_e;3;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLgPlausi_e;4;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccZLg_e;5;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollRateLf_e;6;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLf_e;7;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLfPlausi_e;8;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchRateLf_e;9;

enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorStatusClusFlags_e;10;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorStatusClusFlags_e;11;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorStatusClusFlags_e;12;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorStatusClusFlags_e;13;

enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorStatusHwScon_e;14;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorStatusHwScon_e;15;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorStatusHwScon_e;16;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorStatusHwScon_e;17;

enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorIntErrCnt01_e;18;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorIntErrCnt23_e;19;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorIntErrCnt45_e;20;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorIntErrCnt67_e;21;

enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorIntErrCnt01_e;22;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorIntErrCnt23_e;23;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorIntErrCnt45_e;24;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorIntErrCnt67_e;25;

enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorIntErrCnt01_e;26;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorIntErrCnt23_e;27;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorIntErrCnt45_e;28;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorIntErrCnt67_e;29;

enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorIntErrCnt01_e;30;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorIntErrCnt23_e;31;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorIntErrCnt45_e;32;
enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorIntErrCnt67_e;33;

enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_MaxPossibleRtCmdsTxReasons_e;34;

/*! rb_cs7c_RtComRxPayload_au16:    Payload of the real-time communications */
volatile uint16 rb_cs7c_RtComRxPayload_au16[rb_cs7c_MaxPossibleRtCmdsTxReasons_e]; 

/*! rb_cs7c_RtComRxFaults_ab8:    Rx faults of the real-time communications */
volatile uint8 rb_cs7c_RtComRxFaults_ab8[rb_cs7c_MaxPossibleRtCmdsTxReasons_e]; /* 
-3*****************************************************************************

-4*****************************************************************************
enum;rb_scm_SafetyChannelSettings_tst;rb_sycc_Smi7SensorYaw_e;0;
enum;rb_scm_SafetyChannelSettings_tst;rb_sycc_Smi7SensorYawPlausi_e;1;
enum;rb_scm_SafetyChannelSettings_tst;rb_sycc_Smi7SensorRoll_e;2;
enum;rb_scm_SafetyChannelSettings_tst;rb_sycc_Smi7SensorPitch_e;3;
enum;rb_scm_SafetyChannelSettings_tst;rb_sycc_Smi7SensorMax_e;4;

rb_cs7c_TemperatureData_au16(0)
rb_cs7c_TemperatureData_au16(0).1
rb_cs7c_TemperatureData_au16(1)
rb_cs7c_TemperatureData_au16(1).1
rb_cs7c_TemperatureData_au16(2)
rb_cs7c_TemperatureData_au16(2).1
rb_cs7c_TemperatureData_au16(3),
rb_cs7c_TemperatureData_au16(3).1
-4*****************************************************************************

-5*****************************************************************************
rb_syca_AsicDeviceId_au16(4),FEDFD24C,4.0 ASIC Device ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
rb_syca_AsicDeviceId_au16(4).1,FEDFD24D,4.1 ASIC Device ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
-rb_syca_AsicDeviceId_au16(5),FEDFD24E,5.0 ASIC Device ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
-rb_syca_AsicDeviceId_au16(5).1,FEDFD24F,5.1 ASIC Device ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
rb_syca_AsicDeviceId_au16(6),FEDFD250,6.0 ASIC Device ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
rb_syca_AsicDeviceId_au16(6).1,FEDFD251,6.1 ASIC Device ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
-rb_syca_AsicDeviceId_au16(7),FEDFD252,7.0 ASIC Device ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
-rb_syca_AsicDeviceId_au16(7).1,FEDFD253,7.1 ASIC Device ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,

rb_syca_AsicRevisionId_au16(4),FEDFD25C,4.0 ASIC Revision ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
rb_syca_AsicRevisionId_au16(4).1,FEDFD25D,4.1 ASIC Revision ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
-rb_syca_AsicRevisionId_au16(5),FEDFD25E,5.0 ASIC Revision ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
-rb_syca_AsicRevisionId_au16(5).1,FEDFD25F,5.1 ASIC Revision ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
rb_syca_AsicRevisionId_au16(6),FEDFD260,6.0 ASIC Revision ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
rb_syca_AsicRevisionId_au16(6).1,FEDFD261,6.1 ASIC Revision ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
-rb_syca_AsicRevisionId_au16(7),FEDFD262,7.0 ASIC Revision ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,
-rb_syca_AsicRevisionId_au16(7).1,FEDFD263,7.1 ASIC Revision ID read from ASIC via SPI (some AB12 devices use only the lower 8 bit).,,,,,,,,,

-5*****************************************************************************

Yaw
rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(0),FEDFA962,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(0).1,FEDFA963,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(1),FEDFA964,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(1).1,FEDFA965,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(2),FEDFA966,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).AsicSerialNr_au16(2).1,FEDFA967,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(0),FEDFA95C,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(0).1,FEDFA95D,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(1),FEDFA95E,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(1).1,FEDFA95F,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(2),FEDFA960,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(0).SmiSerialNr_au16(2).1,FEDFA961,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,

Roll
rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(0),FEDFA97A,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(0).1,FEDFA97B,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(1),FEDFA97C,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(1).1,FEDFA97D,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(2),FEDFA97E,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).AsicSerialNr_au16(2).1,FEDFA97F,Smi7 Identification data for each sensor.ASIC serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(0),FEDFA974,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(0).1,FEDFA975,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(1),FEDFA976,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(1).1,FEDFA977,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(2),FEDFA978,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,
rb_cs7m_AsicIdData_ast(2).SmiSerialNr_au16(2).1,FEDFA979,Smi7 Identification data for each sensor.SMI serial numbers 3x16 bits,,,,,,,,,


rb_cs7m_ClippingFaultCnt_as8(0),FEDFA66C,Sensor data clipping fault counter for all SMI7 channels,
rb_cs7m_ClippingFaultCnt_as8(1),FEDFA66D,Sensor data clipping fault counter for all SMI7 channels,
rb_cs7m_ClippingFaultCnt_as8(2),FEDFA66E,Sensor data clipping fault counter for all SMI7 channels,
rb_cs7m_ClippingFaultCnt_as8(3),FEDFA66F,Sensor data clipping fault counter for all SMI7 channels,
rb_cs7m_ClippingFaultCnt_as8(4),FEDFA670,Sensor data clipping fault counter for all SMI7 channels,
rb_cs7m_ClippingFaultCnt_as8(5),FEDFA671,Sensor data clipping fault counter for all SMI7 channels,
rb_cs7m_ClippingFaultCnt_as8(6),FEDFA672,Sensor data clipping fault counter for all SMI7 channels,
rb_cs7m_ClippingFaultCnt_as8(7),FEDFA673,Sensor data clipping fault counter for all SMI7 channels,
rb_cs7m_ClippingFaultCnt_as8(8),FEDFA674,Sensor data clipping fault counter for all SMI7 channels,
rb_cs7m_ClippingFaultCnt_as8(9),FEDFA675,Sensor data clipping fault counter for all SMI7 channels,

rb_cs7m_CnTempFaultCnt_as8(0),FEDFA678,CN flag temporary fault counter for all SMI7 channels,
rb_cs7m_CnTempFaultCnt_as8(1),FEDFA679,CN flag temporary fault counter for all SMI7 channels,
rb_cs7m_CnTempFaultCnt_as8(2),FEDFA67A,CN flag temporary fault counter for all SMI7 channels,
rb_cs7m_CnTempFaultCnt_as8(3),FEDFA67B,CN flag temporary fault counter for all SMI7 channels,
rb_cs7m_CnTempFaultCnt_as8(4),FEDFA67C,CN flag temporary fault counter for all SMI7 channels,
rb_cs7m_CnTempFaultCnt_as8(5),FEDFA67D,CN flag temporary fault counter for all SMI7 channels,
rb_cs7m_CnTempFaultCnt_as8(6),FEDFA67E,CN flag temporary fault counter for all SMI7 channels,
rb_cs7m_CnTempFaultCnt_as8(7),FEDFA67F,CN flag temporary fault counter for all SMI7 channels,
rb_cs7m_CnTempFaultCnt_as8(8),FEDFA680,CN flag temporary fault counter for all SMI7 channels,
rb_cs7m_CnTempFaultCnt_as8(9),FEDFA681,CN flag temporary fault counter for all SMI7 channels,


FieldClaimDataEe_st
***********************************************************************************
Yawrate:
00,00,00,00,00,00,00,00,   SMA66x
00,00,00,00,
            00,00,00,00,   YAW
00,00,00,00,00,00,00,00,
00,00,00,00,00,04,00,00,
00,00,0D,F6,
            00,00,00,00,   YAW_Plausi
00,00,00,00,00,00,00,00,
00,00,00,00,00,00,00,00,
00,00,00,00,
            00,00,00,00,   ROLL
00,00,00,00,00,00,00,00,
00,00,00,00,00,00,00,00,
00,00,00,00,
            00,00,00,00,   PITCH
00,00,00,00,00,00,00,00,
00,00,00,00,00,00,00,00,
00,00,00,00

Rollrate:
00,00,00,00,00,00,00,00,
00,00,00,00,
            00,00,00,00,  YAW
00,00,00,00,00,00,00,00,
00,00,00,00,00,00,00,00,
00,00,00,00,
            00,00,00,00,  YAW_Plausi
00,00,00,00,00,00,00,00,
00,00,00,00,00,00,00,00,
00,00,00,00,
            00,00,00,00,   ROLL
00,00,00,00,00,00,00,00,
00,00,00,00,00,04,00,00,
00,00,25,F3,
            00,00,00,00,   PITCH
00,00,00,00,00,00,00,00,
00,00,00,00,00,00,00,00,
00,00,00,00

SMA66x:
-------
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(0).FaultFlag_u8,FEDFD2B8,.SMA monitoring data.Fault flags during moni data reading,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(0).FaultFlag_u8.PADDINGBYTE(0),FEDFD2B9,PADDING BYTE (0) - IGNORE,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(0).MoniData1_u16,FEDFD2B4,.SMA monitoring data.Monitoring data 1,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(0).MoniData1_u16.1,FEDFD2B5,.SMA monitoring data.Monitoring data 1,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(0).MoniData2_u16,FEDFD2B6,.SMA monitoring data.Monitoring data 2,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(0).MoniData2_u16.1,FEDFD2B7,.SMA monitoring data.Monitoring data 2,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(1).FaultFlag_u8,FEDFD2BE,.SMA monitoring data.Fault flags during moni data reading,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(1).FaultFlag_u8.PADDINGBYTE(0),FEDFD2BF,PADDING BYTE (0) - IGNORE,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(1).MoniData1_u16,FEDFD2BA,.SMA monitoring data.Monitoring data 1,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(1).MoniData1_u16.1,FEDFD2BB,.SMA monitoring data.Monitoring data 1,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(1).MoniData2_u16,FEDFD2BC,.SMA monitoring data.Monitoring data 2,,,,,,,,,
rb_csem_FieldClaimDataEe_st.SmaMonitorData_ast(1).MoniData2_u16.1,FEDFD2BD,.SMA monitoring data.Monitoring data 2,,,,,,,,,

SMI7xx:
-------
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16,FEDFE5F4,Cluster flags 16 bits,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ClustFlg_u16.1,FEDFE5F5,Cluster flags 16 bits,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(0),FEDFE5F6,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(0).1,FEDFE5F7,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(1),FEDFE5F8,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(1).1,FEDFE5F9,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(2),FEDFE5FA,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(2).1,FEDFE5FB,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(3),FEDFE5FC,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(3).1,FEDFE5FD,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(4),FEDFE5FE,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(4).1,FEDFE5FF,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(5),FEDFE600,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(5).1,FEDFE601,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(6),FEDFE602,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(6).1,FEDFE603,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(7),FEDFE604,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(7).1,FEDFE605,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(8),FEDFE606,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(8).1,FEDFE607,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(9),FEDFE608,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).ErFlg_au16(9).1,FEDFE609,Detailed error flags,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16,FEDFE60A,Temperature 1,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(0).Temperat1_s16.1,FEDFE60B,Temperature 1,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16,FEDFE60C,Cluster flags 16 bits,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ClustFlg_u16.1,FEDFE60D,Cluster flags 16 bits,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0),FEDFE60E,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(0).1,FEDFE60F,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(1),FEDFE610,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(1).1,FEDFE611,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(2),FEDFE612,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(2).1,FEDFE613,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(3),FEDFE614,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(3).1,FEDFE615,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(4),FEDFE616,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(4).1,FEDFE617,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(5),FEDFE618,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(5).1,FEDFE619,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(6),FEDFE61A,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(6).1,FEDFE61B,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(7),FEDFE61C,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(7).1,FEDFE61D,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(8),FEDFE61E,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(8).1,FEDFE61F,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(9),FEDFE620,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).ErFlg_au16(9).1,FEDFE621,Detailed error flags,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16,FEDFE622,Temperature 1,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(1).Temperat1_s16.1,FEDFE623,Temperature 1,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ClustFlg_u16,FEDFE624,Cluster flags 16 bits,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ClustFlg_u16.1,FEDFE625,Cluster flags 16 bits,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(0),FEDFE626,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(0).1,FEDFE627,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(1),FEDFE628,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(1).1,FEDFE629,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(2),FEDFE62A,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(2).1,FEDFE62B,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(3),FEDFE62C,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(3).1,FEDFE62D,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(4),FEDFE62E,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(4).1,FEDFE62F,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(5),FEDFE630,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(5).1,FEDFE631,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(6),FEDFE632,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(6).1,FEDFE633,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(7),FEDFE634,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(7).1,FEDFE635,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(8),FEDFE636,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(8).1,FEDFE637,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(9),FEDFE638,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).ErFlg_au16(9).1,FEDFE639,Detailed error flags,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).Temperat1_s16,FEDFE63A,Temperature 1,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(2).Temperat1_s16.1,FEDFE63B,Temperature 1,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ClustFlg_u16,FEDFE63C,Cluster flags 16 bits,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ClustFlg_u16.1,FEDFE63D,Cluster flags 16 bits,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(0),FEDFE63E,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(0).1,FEDFE63F,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(1),FEDFE640,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(1).1,FEDFE641,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(2),FEDFE642,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(2).1,FEDFE643,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(3),FEDFE644,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(3).1,FEDFE645,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(4),FEDFE646,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(4).1,FEDFE647,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(5),FEDFE648,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(5).1,FEDFE649,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(6),FEDFE64A,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(6).1,FEDFE64B,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(7),FEDFE64C,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(7).1,FEDFE64D,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(8),FEDFE64E,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(8).1,FEDFE64F,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(9),FEDFE650,Detailed error flags,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).ErFlg_au16(9).1,FEDFE651,Detailed error flags,

rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).Temperat1_s16,FEDFE652,Temperature 1,
rb_csem_FieldClaimDataEe_st.Smi7StatusData_ast(3).Temperat1_s16.1,FEDFE653,Temperature 1,
***********************

***********************???
rb_itm_DebugInfoWrittenToNVM_bo,FEE041F7,,,,,,,,,,

rb_itm_DebugModeDelayTimestamp_u32,FEE079D8,,,,,,,,,,
rb_itm_DebugModeDelayTimestamp_u32.1,FEE079D9,,,,,,,,,,
rb_itm_DebugModeDelayTimestamp_u32.2,FEE079DA,,,,,,,,,,
rb_itm_DebugModeDelayTimestamp_u32.3,FEE079DB,,,,,,,,,,

***********************????
rb_itm_EndOfItmTimestamp_u32,FEE07A0C,This is the timestamp of the end of the ITM.,,,,,,,,,
rb_itm_EndOfItmTimestamp_u32.1,FEE07A0D,This is the timestamp of the end of the ITM.,,,,,,,,,
rb_itm_EndOfItmTimestamp_u32.2,FEE07A0E,This is the timestamp of the end of the ITM.,,,,,,,,,
rb_itm_EndOfItmTimestamp_u32.3,FEE07A0F,This is the timestamp of the end of the ITM.,,,,,,,,,

***********************
rb_itm_TestStarted_u64
rb_itm_TestFinished_u64
rb_itm_TestFailed_u64
rb_itm_TestSkipped_u64

enum;rb_itm_InitialTest_ten;rb_itm_InitialTestFinished_e;0;Marker that all initial tests have finished. This entry has to be always at the first position
enum;rb_itm_InitialTest_ten;rb_itm_PsemInitPsifProgramming_e;1;PAS IF programming test
enum;rb_itm_InitialTest_ten;rb_itm_WD1Test_e;2;Watchdog 1 test
enum;rb_itm_InitialTest_ten;rb_itm_WdALPDisableTimeTest_e;3;Monitor the time at which the DIS_ALP is disabled
enum;rb_itm_InitialTest_ten;rb_itm_CsemInitialTest_e;4;Central sensor management initial test
enum;rb_itm_InitialTest_ten;rb_itm_PowerPlausiTest_e;5;Initial power plausi test
enum;rb_itm_InitialTest_ten;rb_itm_ChargeUpErTestLevel_e;6;Initial ER loading upto intermediate test level (11V)
enum;rb_itm_InitialTest_ten;rb_itm_PsemInitLineTests_e;7;PSEM init line test

enum;rb_itm_InitialTest_ten;rb_itm_EnergyReserveTest_e;8;Initial energy reserve test
enum;rb_itm_InitialTest_ten;rb_itm_StartCyclicSwm_e;9;Start the cyclic switch measurement (without SCON handling)
enum;rb_itm_InitialTest_ten;rb_itm_SquibConCapTest_e;10;Squib Connector Capacitor test
enum;rb_itm_InitialTest_ten;rb_itm_SquibPstTASODeactivationTest_e;11;TASO deactivation test
enum;rb_itm_InitialTest_ten;rb_itm_SquibPstHSTest_e;12;High side power stage test
enum;rb_itm_InitialTest_ten;rb_itm_ChargeUpErFinalLevel_e;13;ER loading test upto high level
enum;rb_itm_InitialTest_ten;rb_itm_PsemInitSensors_e;14;PSEM Init sensors
enum;rb_itm_InitialTest_ten;rb_itm_SquibPstSplDisableTest_e;15;Special disable line test

enum;rb_itm_InitialTest_ten;rb_itm_SwmInitialSwitchMsmt_e;16;Initial switch measurement.
enum;rb_itm_InitialTest_ten;rb_itm_AmuInitTest_e;17;Initial ADC and multiplexer test of the Cobra ASICs.
enum;rb_itm_InitialTest_ten;rb_itm_SwmCCTest_e;18;Initial switch cross coupling test.
enum;rb_itm_InitialTest_ten;rb_itm_ProgEOP1_e;19;Programming EOP1
enum;rb_itm_InitialTest_ten;rb_itm_ScmSconEnableTimeTest_e;20;SCON enable time test
enum;rb_itm_InitialTest_ten;rb_itm_ScmSconThresholdTest_e;21;SCON threshold test
enum;rb_itm_InitialTest_ten;rb_itm_SVROnTest_e;22;SVR ON test
enum;rb_itm_InitialTest_ten;rb_itm_ProgEOP2_e;23;Programming EOP2

enum;rb_itm_InitialTest_ten;rb_itm_SquibCrossConnectionTest_e;24;Squib cross connection test
enum;rb_itm_InitialTest_ten;rb_itm_squibPstLsTest_e;25;Low side power stage test
enum;rb_itm_InitialTest_ten;rb_itm_StartCyclicSqm_e;26;Start cyclic squib monitoring
enum;rb_itm_InitialTest_ten;rb_itm_EnableFiringSqm_e;27;Enable squib firing
enum;rb_itm_InitialTest_ten;rb_itm_StartCyclicSwmSconMon_e;28;Start cyclic switch monitoring (with SCON handling)
enum;rb_itm_InitialTest_ten;rb_itm_StartCyclicCsem_e;29;Start cyclic central sensor management
enum;rb_itm_InitialTest_ten;rb_itm_StartCyclicPsem_e;30;Start cyclic peripheral sensor management
enum;rb_itm_InitialTest_ten;rb_itm_EcoModeCheck_e;31;Check if ECO mode should be entered

enum;rb_itm_InitialTest_ten;rb_itm_AlgoReleaseMatrix_e;32;Initial release matrix calculation
enum;rb_itm_InitialTest_ten;rb_itm_AutarkyTest_e;33;POM autarky test
enum;rb_itm_InitialTest_ten;rb_itm_AutoPlantModeDet_e;34;Automatic plant mode detection
enum;rb_itm_InitialTest_ten;rb_itm_WimInit_e;35;Initialization of warning lamps
enum;rb_itm_InitialTest_ten;rb_itm_SysCfgBitPlantModeDep_e;36;System configuration information
enum;rb_itm_InitialTest_ten;rb_itm_SwmInit_e;37;Initialization of switch management
enum;rb_itm_InitialTest_ten;rb_itm_SwmConCapTest_e;38;Switch management connector capacitor test
enum;rb_itm_InitialTest_ten;rb_itm_AodInit_e;39;Initialization of AOD
enum;rb_itm_InitialTest_ten;rb_itm_SquibFLMAmuTest_e;40;FLM AMU test to check that short detection is working
enum;rb_itm_InitialTest_ten;rb_itm_SquibLsDisableTest_e;41;Low side power stage disable test
enum;rb_itm_InitialTest_ten;rb_itm_StartCyclicRamTest_e;42;Start cyclic RAM test
enum;rb_itm_InitialTest_ten;rb_itm_SVROffTest_e;43;SVR OFF test
enum;rb_itm_InitialTest_ten;rb_itm_SquibHsDisableTest_e;44;High side power stage disable test
enum;rb_itm_InitialTest_ten;rb_itm_StartCyclicRomTest_e;45;Start cyclic ROM test
enum;rb_itm_InitialTest_ten;rb_itm_InadvertentResetTest_e;46;Inadvertent Power Test Test
enum;rb_itm_InitialTest_ten;rb_itm_InitialERCapMissingTest_e;47;Initial ER capacitor Test
enum;rb_itm_InitialTest_ten;rb_itm_PsemMuxPathTest_e;48;PSEM Mux Path test
enum;rb_itm_InitialTest_ten;rb_itm_LEAPolarityTest_e;49;LEA Polarity Test
enum;rb_itm_InitialTest_ten;rb_itm_WimiPAOxInit_e;50;Start PAOx Initialization
enum;rb_itm_InitialTest_ten;rb_itm_WimiSysWIInit_e;51;Start SysWI Initalization
enum;rb_itm_InitialTest_ten;rb_itm_BatteryEsrTest_e;52;Battery ESR Test
enum;rb_itm_InitialTest_ten;rb_itm_VerVignCouplingTest_e;53;Ver-Vign-Coupling Test
enum;rb_itm_InitialTest_ten;rb_itm_McbInitTest_e;54;Multi-Collision-Brake line test
enum;rb_itm_InitialTest_ten;rb_itm_SquibDisSHPTest_e;55;DIS SHP control test
enum;rb_itm_InitialTest_ten;rb_itm_TestMax_e;56;
***********************

enum;rb_sycg_PlantModes_ten;rb_sycg_AdaptedTestThresholdMode_e;0;Adapted test thresholds plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_NoExternalDevicesMode_e;1;No external device plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_NoErChargingMode_e;2;No ER charging plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_NoFaultQualiService_e;3;No fault qualification plant service mode
enum;rb_sycg_PlantModes_ten;rb_sycg_FastFaultQualiMode_e;4;Fast fault qualification plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_DisableDeploymentMode_e;5;Disable deployment plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_ElectronicFiringMode_e;6;Electronic firing plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_SuppressPesFaults_e;7;Suppress PES faults plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_AIxTestMode_e;8;AIO and AIN test mode
enum;rb_sycg_PlantModes_ten;rb_sycg_SuppressComFaults_e;9;Suppress COM faults plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_PerformEmcCapTests_e;10;Perform Emc Cap tests plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_OnlyPlantDemActive_e;11;Only plant fault memory (DEM) active plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_AutomaticPlantModeDetection_e;12;Automatic plant mode detection plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_Smi7OtpProgramming_e;13;Perform OTP programming of SMI7 sensors
enum;rb_sycg_PlantModes_ten;rb_sycg_FastSleepMode_e;14;Fast activation of sleep mode plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_Smi7RampUpSelfDiagnosis_e;15;SMI7 ramp up self diagnosis plant mode
enum;rb_sycg_PlantModes_ten;rb_sycg_DynamicNoErChargingMode_e;16;Mode for not charging the energy reserve
enum;rb_sycg_PlantModes_ten;rb_sycg_PlantModeMax_e;17;Has no meaning  just max plant modes
***********************

 SMI700_YawRateLfChl_SPIRawData_Check
            1.2 => { cmd => '0A - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask'} ,
            1.3 => { cmd => '0B - 00 - 50 00 00 00', descr => 'Unit_0: Set SPI Pattern'} ,
 SMI710_RollRateLfChl_SPIRawData_Check
            1.2 => { cmd => '0A - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask'} ,
            1.3 => { cmd => '0B - 00 - D0 00 00 00', descr => 'Unit_0: Set SPI Pattern'} ,
 SMI700_AccXLgChl_SPIRawData_Check
           1.2 => { cmd => '0A - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask'} ,
            1.3 => { cmd => '0B - 00 - 70 00 00 00', descr => 'Unit_0: Set SPI Pattern'} ,
 SMI700_AccYLgChl_SPIRawData_Check
            1.2 => { cmd => '0A - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask'} ,
            1.3 => { cmd => '0B - 00 - 60 00 00 00', descr => 'Unit_0: Set SPI Pattern'} ,
 SMI710_AccZLgChl_SPIRawData_Check
            1.2 => { cmd => '0A - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask'} ,
            1.3 => { cmd => '0B - 00 - F0 00 00 00', descr => 'Unit_0: Set SPI Pattern'} ,
 SMI700_AccXHgMonChl_SPIRawData_Check
            1.2 => { cmd => '0A - 00 - '.$SMI_SensorMask, descr => 'Unit_0: Set SPI Mask' } ,
            1.3 => { cmd => '0B - 00 - 78 00 00 00', descr => 'Unit_0: Set SPI Pattern for command SMI7xx_ROLL:20_TEMP1:MOSI'} ,

43,rb_csem_FieldCalibMissing_flt,1B  FieldCalibMissing

703,rb_syc_AsicIdMismatch_flt,F00049  AsicIdMismatch

62,rb_csem_MonPermInitPitchSensor_flt,F00049  MonPermInitPitchSensor
63,rb_csem_MonPermInitRollSensor_flt,F00049  MonPermInitRollSensor
64,rb_csem_MonPermInitYawPlausiSensor_flt,F00049  MonPermInitYawPlausiSensor
65,rb_csem_MonPermInitYawSensor_flt,F00049  MonPermInitYawSensor

58,rb_csem_MonPermBGPitchSensor_flt,F00049  MonPermBGPitchSensor
59,rb_csem_MonPermBGRollSensor_flt,F00049  MonPermBGRollSensor
60,rb_csem_MonPermBGYawPlausiSensor_flt,F00049  MonPermBGYawPlausiSensor
61,rb_csem_MonPermBGYawSensor_flt,F00049  MonPermBGYawSensor

70,rb_csem_MonTempAccXHgMonChl_flt,12  MonTempAccXHgMonChl
71,rb_csem_MonTempAccXLgChl_flt,13  MonTempAccXLgChl
  72,rb_csem_MonTempAccYHgMonChl_flt,14  MonTempAccYHgMonChl
73,rb_csem_MonTempAccYLgChl_flt,15  MonTempAccYLgChl
  74,rb_csem_MonTempAccYLgPlausiChl_flt,16  MonTempAccYLgPlausiChl
75,rb_csem_MonTempAccZLgChl_flt,17  MonTempAccZLgChl
  76,rb_csem_MonTempPitchRateLfChl_flt,18  MonTempPitchRateLfChl
77,rb_csem_MonTempRollRateLfChl_flt,19  MonTempRollRateLfChl
78,rb_csem_MonTempYawRateLfChl_flt,1A  MonTempYawRateLfChl
  79,rb_csem_MonTempYawRateLfPlausiChl_flt,1B  MonTempYawRateLfPlausiChl
 
52,rb_csem_MonPermAccXHgMonChl_flt,F00049  MonPermAccXHgMonChl
53,rb_csem_MonPermAccXLgChl_flt,F00049  MonPermAccXLgChl
  54,rb_csem_MonPermAccYHgMonChl_flt,F00049  MonPermAccYHgMonChl
55,rb_csem_MonPermAccYLgChl_flt,F00049  MonPermAccYLgChl
  56,rb_csem_MonPermAccYLgPlausiChl_flt,F00049  MonPermAccYLgPlausiChl
57,rb_csem_MonPermAccZLgChl_flt,F00049  MonPermAccZLgChl 
  66,rb_csem_MonPermPitchRateLfChl_flt,F00049  MonPermPitchRateLfChl
67,rb_csem_MonPermRollRateLfChl_flt,F00049  MonPermRollRateLfChl
68,rb_csem_MonPermYawRateLfChl_flt,F00049  MonPermYawRateLfChl
  69,rb_csem_MonPermYawRateLfPlausiChl_flt,F00049  MonPermYawRateLfPlausiChl

Info: Stefan
Aber ich weiß dass:
-	die ASIC Device ID für alle SMI7 Sensoren 0x0700 ist (außer SMI720, der hat auch wirklich 0x0720)
-	die SMI serial ID dann dazu verwendet wird (eigentlich nur drei Bits davon) 
    um SMI700, SMI705, SMi710, usw. zu unterscheiden (siehe unten).
    Die anderen Bits sind mir egal, ist eben eine Seriennummer zur Traceablity,
	die bei uns im Werk dann gespeichert wird.
-	Wenn bei den oberen zwei Werten was falsches gesendet wird, dann führt das zum ASIC ID mismatch
    Fehler und damit is das SG im Idle mode.
-	ASIC Serial number und ASIC revision ist ebenfalls nur für Traceablity im Werk gedacht.

Info: Julia
wir setzen das Overload Flag in 2 Fällen
-	Bei einem TempFehler 
-	Wenn X HG Clipping vorliegt (auch wenn noch kein TempFehler qualifiziert wurde)

Info: Julia
es geht um folgenden:
#enum;rb_sycg_PlantModes_ten;rb_sycg_SuppressComFaults_e;9;Suppress COM faults plant mode

Info: Julia
rb_cs7m_ManagerStateRT_en  SMI7 State: (used and written in RT and BG)
  enum;"rb_cs7m_Idle_e" enumval 0, EnumVal  Info 
  enum;"rb_cs7m_Init_e" enumval 1, EnumVal  Info 
  enum;"rb_cs7m_ReadAsicSerialNumbers_e" enumval 2, EnumVal  Info 
  enum;"rb_cs7m_ProgOrVerifyOtpAndSmi720Init_e" enumval 3, EnumVal  Info 
  enum;"rb_cs7m_WaitForSensorInit_e" enumval 4, EnumVal  Info 
  enum;"rb_cs7m_VerifyInitFlags_e" enumval 5, EnumVal  Info 
  enum;"rb_cs7m_HandleChlFaultsPrevPoc_e" enumval 6, EnumVal  Info 
  enum;"rb_cs7m_HandleFaultsInInit_e" enumval 7, EnumVal  Info 
  enum;"rb_cs7m_PrepareSystemInitBG_e" enumval 8, EnumVal  Info 
  enum;"rb_cs7m_PrepareSystemInitRT_e" enumval 9, EnumVal  Info 
  enum;"rb_cs7m_SystemInit_e" enumval 10, EnumVal  Info 
  enum;"rb_cs7m_PrepareSteadyStateRT_e" enumval 11, EnumVal  Info 
  enum;"rb_cs7m_SteadyState_e" enumval 12, EnumVal  Info 
  enum;"rb_cs7m_ExitSteadyState_e" enumval 13, EnumVal  Info 
  enum;"rb_cs7m_PrepareRUVinBG_e" enumval 14, EnumVal  Info 
  enum;"rb_cs7m_PrepareRUVinRT_e" enumval 15, EnumVal  Info 
  enum;"rb_cs7m_SampleRUVData_e" enumval 16, EnumVal  Info 
  enum;"rb_cs7m_RUVDataReady_e" enumval 17, EnumVal  Info 
  enum;"rb_cs7m_Disabled_e" enumval 18, EnumVal  Info 

  -	SysInit = 10 (hier wird Absolute und Relative Initial Offset check gemacht
  -	Steady = 12

rb_csem_SensorDataRT_st.InitialRelOffsetCheckFailure_bo muss 0 sein falls Relativer Offset check erfolgreich

Info: Stefan
OTP plant mode in rb_sycg_PlantModes_st:
- einschalten: 00,20,00,00,FC,99,09,19
- ausschalten: 00,00,00,00,1C,DF,44,21

Plant mode 10 (to suppress field calib) einschalten:
00,02,00,00,72,0B,C0,22

rb_csem_NvmConfigDataEe_st
00,00,02,00,9E,BD,72,13 --> enable JokerMessages
00,00,01,00,5D,EE,5F,38 --> enable InternalErrorMsgs

Block Idle mode in rb_bswm_IdleModeData_st:
- blocken: 0C,B1,1E,1D
- default: FF,FF,FF,FF

Info: Willi
FastDiag:  record timing.
1xU8 0.5ms 
 
2xU8   1ms  1xU16 1ms
3xU8   1ms 

4xU8   2ms  2xU16 2ms
5xU8   2ms  3xU16 2ms
6xU8   2ms
7xU8   2ms

8xU8   4ms  4xU16 4ms

Info: Stefan
im Array:
rb_cs7c_RtComRxPayload_au16

Den Arrayindex im *.str file nachschauen, Bsp:

Nach �rb_cs7c_MaxPossibleRtCmdsTxReasons_e� suchen, davor findest Du dann die Indexe:

  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXLg_e;0;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccXHgMon_e;1;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLg_e;2;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYHgMon_e;3;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccYLgPlausi_e;4;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_AccZLg_e;5;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollRateLf_e;6;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLf_e;7;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawRateLfPlausi_e;8;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchRateLf_e;9;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorStatusClusFlags_e;10;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorStatusClusFlags_e;11;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorStatusClusFlags_e;12;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorStatusClusFlags_e;13;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorStatusHwScon_e;14;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorStatusHwScon_e;15;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorStatusHwScon_e;16;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorStatusHwScon_e;17;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorIntErrCnt01_e;18;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorIntErrCnt23_e;19;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorIntErrCnt45_e;20;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawSensorIntErrCnt67_e;21;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorIntErrCnt01_e;22;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorIntErrCnt23_e;23;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorIntErrCnt45_e;24;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_YawPlausiSensorIntErrCnt67_e;25;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorIntErrCnt01_e;26;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorIntErrCnt23_e;27;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorIntErrCnt45_e;28;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_RollSensorIntErrCnt67_e;29;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorIntErrCnt01_e;30;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorIntErrCnt23_e;31;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorIntErrCnt45_e;32;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_PitchSensorIntErrCnt67_e;33;
  enum;rb_cs7c_AllPossibleRtCmdsTxReasons_ten;rb_cs7c_MaxPossibleRtCmdsTxReasons_e;34;

Info: Julia
rb_csem_NvmConfigDataEe_st
00,00,01,00,5D,EE,5F,38 --> enable InternalErrorMsgs

rb_csem_NvmConfigDataEe_dfst.CsemMode_b32,204B0000,.Activation of special CSEM modes,,,,,,,,
rb_csem_NvmConfigDataEe_dfst.CsemMode_b32.1,204B0001,.Activation of special CSEM modes,,,,,,,,
rb_csem_NvmConfigDataEe_dfst.CsemMode_b32.2,204B0002,.Activation of special CSEM modes,,,,,,,,
rb_csem_NvmConfigDataEe_dfst.CsemMode_b32.3,204B0003,.Activation of special CSEM modes,,,,,,,,

Hallo zusammen,

VDS Field Calibration ist hier spezifiziert:
doors://si-airbag-doors.de.bosch.com:36681/?version=2&prodID=0&view=00000001&urn=urn:telelogic::1-0000000000000000-O-2708-000554f7

Es existieren ja bereits TS dazu, bitte Kontakt mit Deephu und co aufnehmen.

Mit freundlichen Grüßen / Best regards

Anne-Helene Kindsvater 
CC-PS/EPS3

Field Calibration
Flash------------

Start Info: Julia --------------------
rb_cs7m_Smi7FieldCalibDataEe_st.FieldCalibStatus_u32
?	3 bedeutet Succeeded =)

rb_cs7m_Smi7FieldCalibDataEe_nvmst.FieldCalibStatus_u32,00005ED0,Field calibration status,
rb_cs7m_Smi7FieldCalibDataEe_nvmst.FieldCalibStatus_u32.1,00005ED1,Field calibration status,
rb_cs7m_Smi7FieldCalibDataEe_nvmst.FieldCalibStatus_u32.2,00005ED2,Field calibration status,
rb_cs7m_Smi7FieldCalibDataEe_nvmst.FieldCalibStatus_u32.3,00005ED3,Field calibration status,

Info: Julia 13.10.2016

das ist leider mit Defines gemacht, da gibt es kein Enum.

 *    0x00: Not calibrated
 *    0x01: Calibration not finished
 *    0x02: Calibration failed
 *    0x03: Calibration succeeded

Ich bin mir allerdings gerade selber nicht ganz sicher,
ob wir da vielleicht die Typen durcheinander bringen.
Ich muss das mal genauer angucken…

Probier mal aus. Wahrscheinlich reicht das, damit der Fehler nicht mehr qualifiziert wird.
End Info: Julia ------------------------------

rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(0),203F0000,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(0).1,203F0001,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(1),203F0002,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(1).1,203F0003,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(2),203F0004,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(2).1,203F0005,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(3),203F0006,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(3).1,203F0007,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(4),203F0008,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(4).1,203F0009,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(5),203F000A,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(5).1,203F000B,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(6),203F000C,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(6).1,203F000D,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(7),203F000E,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(7).1,203F000F,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(8),203F0010,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(8).1,203F0011,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(9),203F0012,Field calibration offset values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibValue_as16(9).1,203F0013,Field calibration offset values,

rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(0),203F0014,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(1),203F0015,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(2),203F0016,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(3),203F0017,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(4),203F0018,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(5),203F0019,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(6),203F001A,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(7),203F001B,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(8),203F001C,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(9),203F001D,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(10),203F001E,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(11),203F001F,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(12),203F0020,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(13),203F0021,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(14),203F0022,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(15),203F0023,Field calibration vehicle identification number (VIN) values,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibVinValue_au8(16),203F0024,Field calibration vehicle identification number (VIN) values,
	rb_cs7m_Smi7FieldCalibDataEe_dfst.PaddingByte(0),203F0025,Padding byte inserted by linker,
	rb_cs7m_Smi7FieldCalibDataEe_dfst.PaddingByte(1),203F0026,Padding byte inserted by linker,
	rb_cs7m_Smi7FieldCalibDataEe_dfst.PaddingByte(2),203F0027,Padding byte inserted by linker,

rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibStatus_u32,203F0028,Field calibration status,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibStatus_u32.1,203F0029,Field calibration status,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibStatus_u32.2,203F002A,Field calibration status,
rb_cs7m_Smi7FieldCalibDataEe_dfst.FieldCalibStatus_u32.3,203F002B,Field calibration status,

rb_cs7m_Smi7FieldCalibDataEe_dfst.Crc_u32,203F002C,CRC,
rb_cs7m_Smi7FieldCalibDataEe_dfst.Crc_u32.1,203F002D,CRC,
rb_cs7m_Smi7FieldCalibDataEe_dfst.Crc_u32.2,203F002E,CRC,
rb_cs7m_Smi7FieldCalibDataEe_dfst.Crc_u32.3,203F002F,CRC,

rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibRateThd_s16,20400000,Rate calibration threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibRateThd_s16.1,20400001,Rate calibration threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibAccLgThd_s16,20400002,Low-g acceleration calibration threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibAccLgThd_s16.1,20400003,Low-g acceleration calibration threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibAccHgThd_s16,20400004,High-g acceleration calibration threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibAccHgThd_s16.1,20400005,High-g acceleration calibration threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibVerRateThd_s16,20400006,Rate calibration verification threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibVerRateThd_s16.1,20400007,Rate calibration verification threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibVerAccLgThd_s16,20400008,Low-g calibration verification threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibVerAccLgThd_s16.1,20400009,Low-g calibration verification threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibVerAccHgThd_s16,2040000A,High-g calibration verification threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.FieldCalibVerAccHgThd_s16.1,2040000B,High-g calibration verification threshold,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.Crc_u32,2040000C,CRC32,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.Crc_u32.1,2040000D,CRC32,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.Crc_u32.2,2040000E,CRC32,
rb_cs7o_Smi7FieldCalibThdsEe_dfst.Crc_u32.3,2040000F,CRC32,

RAM------------
Hallo Willi,

wir hatten uns letzte Woche ja noch über den Counter für die Field Calibration unterhalten:
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(0),FEDFA658,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(0).1,FEDFA659,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(1),FEDFA65A,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(1).1,FEDFA65B,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(2),FEDFA65C,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(2).1,FEDFA65D,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(3),FEDFA65E,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(3).1,FEDFA65F,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(4),FEDFA660,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(4).1,FEDFA661,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(5),FEDFA662,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(5).1,FEDFA663,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(6),FEDFA664,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(6).1,FEDFA665,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(7),FEDFA666,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(7).1,FEDFA667,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(8),FEDFA668,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(8).1,FEDFA669,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(9),FEDFA66A,current offset calculation data sampling counter for each SMI7 channel,
rb_cs7m_Smi7OffsCalcSampleCntRT_au16(9).1,FEDFA66B,current offset calculation data sampling counter for each SMI7 channel,

Der Counter wird allerdings an mehreren Stellen benutzt:
-	In der Initialisierung für die Initial Offset Checks 
   (wird immer gemacht, unabhängig davon ob du eine Feldkalibrierung startest)
-	Wenn eine Feldkalibrierung gestartet wird 2x
	1. Calibration Phase
	2. Verification Phase

Der Counter wird immer wieder auf 0 zurückgesetzt, wenn einer der oberen Schritte abgeschlossen wurde.


rb_cs7o_Smi7FieldCalibration_st.Info_st.FieldCalibState_u8,FEDFA76E,Field calibration state,
	enum;rb_cs7o_Smi7FieldCalibPhase_ten;rb_cs7o_Smi7NormalOffsCorrPhase_e;0;Normal offset correction phase (field calibration not running)
	enum;rb_cs7o_Smi7FieldCalibPhase_ten;rb_cs7o_Smi7CalibrationPhase_e;1;Field calibration calibration phase
	enum;rb_cs7o_Smi7FieldCalibPhase_ten;rb_cs7o_Smi7EndCalibrationPhase_e;2;Field calibration end of calibration phase (waiting for successful/failed NVM write)
	enum;rb_cs7o_Smi7FieldCalibPhase_ten;rb_cs7o_Smi7VerificationPhase_e;3;Field calibration verification phase

#******************************************************************
Falls es weiterhilft haben wir auch eine Status-Variable (also eigentlich gibt es 2,
aber der Status ist der interessantere):

rb_cs7o_Smi7FieldCalibration_st.Info_st.FieldCalibStatus_u8,FEDFA76F,Field calibration status,
	/* calibration status: routine start successfully */
	#define RB_cs7o_Smi7StatusCalibStartSuccess_cu8	(uint8)0x00u
	/* calibration status: routine start unsuccessfully */
	#define RB_cs7o_Smi7StatusCalibStartFail_cu8	(uint8)0x01u
	/* calibration status: routine in progress */
	#define RB_cs7o_Smi7StatusCalibInProgress_cu8	(uint8)0x02u
	/* calibration status: routine successfully */
	#define RB_cs7o_Smi7StatusCalibSuccess_cu8		(uint8)0x03u
	/* calibration status: routine unsuccessfully */
	#define RB_cs7o_Smi7StatusCalibFail_cu8			(uint8)0x04u

Calibration status xx:
00h:	not calibrated
01h:	calibration not finished     always available, also in the next power on cycle (information read from data NVM)
02h:	calibration failed
03h:	calibration successful	

Hallo Willi,
wir haben 2 wichtige Infos: Fehler Reasons und Source

rb_cs7o_Smi7FieldCalibration_st.Info_st.FieldCalibFailureReason_b16,FEDFA76C,Field calibration failure reason,
rb_cs7o_Smi7FieldCalibration_st.Info_st.FieldCalibFailureReason_b16.1,FEDFA76D,Field calibration failure reason,

#define RB_cs7o_Smi7CalibNormalRun_cu16			(uint16)0x0000u
/* failure reason: no VIN received */
#define RB_cs7o_Smi7CalibNoVinRcvd_cu16			(uint16)0x0001u
/* failure reason: sensor initialization not finished */
#define RB_cs7o_Smi7CalibInitPend_cu16			(uint16)0x0002u
/* failure reason: sensor run in drift not finished */
#define RB_cs7o_Smi7CalibRunInPend_cu16			(uint16)0x0004u
/* failure reason: IMU sensor failure */
#define RB_cs7o_Smi7CalibSensFail_cu16			(uint16)0x0008u
/* failure reason: vehicle speed out of range */
#define RB_cs7o_Smi7CalibSpeedFail_cu16			(uint16)0x0010u
/* failure reason: wrong ignition status */
#define RB_cs7o_Smi7CalibIgnFail_cu16			(uint16)0x0020u
/* failure reason: CN-flag of sensor channel set */
#define RB_cs7o_Smi7CalibCNFlagFail_cu16		(uint16)0x0040u
/* failure reason: calibration result out of calibration range */
#define RB_cs7o_Smi7CalibCalRngFail_cu16		(uint16)0x0080u
/* failure reason: data flash writing failure */
#define RB_cs7o_Smi7CalibWriteFail_cu16			(uint16)0x0100u
/* failure reason: verify result out of verification range */
#define RB_cs7o_Smi7CalibVerRngFail_cu16		(uint16)0x0200u
/* failure reason: input parameter failure */
#define RB_cs7o_Smi7CalibParamFail_cu16			(uint16)0x8000u

Failure reason yy yy:
00 00h:	Routine normally running
00 01h:	No VIN recieved
00 02h:	Sensor initialisation not finished
00 04h:	Sensor RunIn drift not finished
00 08h:	VDS sensor failure
00 10h:	Vehicle speed out of range	only available in the same power on cycle (information read from RAM)
00 20h:	Wrong ignition status
00 40h:	CN- Flag of sensor channel
00 80h:	Calibration result out of calibration range
01 00h:	Data flash writing failure
02 00h:	Verify result out of verification range

rb_cs7o_Smi7FieldCalibration_st.Info_st.FieldCalibFailureSource_b32,FEDFA768,Field calibration failure source,
rb_cs7o_Smi7FieldCalibration_st.Info_st.FieldCalibFailureSource_b32.1,FEDFA769,Field calibration failure source,
rb_cs7o_Smi7FieldCalibration_st.Info_st.FieldCalibFailureSource_b32.2,FEDFA76A,Field calibration failure source,
rb_cs7o_Smi7FieldCalibration_st.Info_st.FieldCalibFailureSource_b32.3,FEDFA76B,Field calibration failure source,
	#define RB_cs7o_Smi7CalibNoChlFail_cu32			(uint32)0x00000000u
	/* failure source: ACC x LF channel failure */
	#define RB_cs7o_Smi7CalibAccXLfFail_cu32		(uint32)0x00000001u
	/* failure source: ACC x HF channel failure */
	#define RB_cs7o_Smi7CalibAccXHfFail_cu32		(uint32)0x00000002u
	/* failure source: ACC y LF channel failure */
	#define RB_cs7o_Smi7CalibAccYLfFail_cu32		(uint32)0x00000004u
		/* failure source: ACC y HF channel failure - channel currently not used */
		#define RB_cs7o_Smi7CalibAccYHfFail_cu32		(uint32)0x00000008u
	/* failure source: ACC z LF channel failure */
	#define RB_cs7o_Smi7CalibAccZLfFail_cu32		(uint32)0x00000010u
		/* failure source: ACC z HF channel failure - channel currently not used */
		#define RB_cs7o_Smi7CalibAccZHfFail_cu32		(uint32)0x00000020u
	/* failure source: ACC y red. LF channel failure */
	#define RB_cs7o_Smi7CalibAccYRedLfFail_cu32		(uint32)0x00000040u
		/* failure source: ACC y red. HF channel failure - channel currently not used */
		#define RB_cs7o_Smi7CalibAccYRedHfFail_cu32		(uint32)0x00000080u
	/* failure source: rate x LF channel failure */
	#define RB_cs7o_Smi7CalibRateXLfFail_cu32		(uint32)0x00010000u
		/* failure source: rate x HF channel failure - channel currently not used */
		#define RB_cs7o_Smi7CalibRateXHfFail_cu32		(uint32)0x00020000u
	/* failure source: rate y LF channel failure */
	#define RB_cs7o_Smi7CalibRateYLfFail_cu32		(uint32)0x00040000u
		/* failure source: rate y HF channel failure - channel currently not used */
		#define RB_cs7o_Smi7CalibRateYHfFail_cu32		(uint32)0x00080000u
	/* failure source: rate z LF channel failure */
	#define RB_cs7o_Smi7CalibRateZLfFail_cu32		(uint32)0x00100000u
		/* failure source: rate z HF channel failure - channel currently not used */
		#define RB_cs7o_Smi7CalibRateZHfFail_cu32		(uint32)0x00200000u
	/* failure source: rate y red. LF channel failure */
	#define RB_cs7o_Smi7CalibRateZRedLfFail_cu32	(uint32)0x00400000u
		/* failure source: rate y red. HF channel failure - channel currently not used */
		#define RB_cs7o_Smi7CalibRateZRedHfFail_cu32	(uint32)0x00800000u
		
Failure source zz zz zz zz:
00 00 00 00h:	no sensor channel failure
00 00 00 01h: 	ACC x LF channel failure
00 00 00 02h: 	ACC x MID_G channel failure
00 00 00 04h: 	ACC y LF channel failure
00 00 00 08h: 	ACC y MID_G channel failure	
00 00 00 10h: 	ACC z LF channel failure
00 00 00 20h: 	not used
00 00 00 40h: 	ACC y red. LF channel failure
00 00 00 80h: 	not used			only available in the same power on cycle (information read from RAM)
00 01 00 00h: 	Rate x LF channel failure
00 02 00 00h: 	not used
00 04 00 00h: 	Rate y LF channel failure
00 08 00 00h: 	not used
00 10 00 00h: 	Rate z LF channel failure
00 20 00 00h: 	not used
00 40 00 00h: 	Rate z red. LF channel failure
00 80 00 00h: 	not used
#******************************************************************
		
rb_cs7o_Smi7InitialCalibChks_st.VinCheckTimeStamp_u32,FEDFA760,Time stamp of the check of the vehicle identification number (VIN),
rb_cs7o_Smi7InitialCalibChks_st.VinCheckTimeStamp_u32.1,FEDFA761,Time stamp of the check of the vehicle identification number (VIN),
rb_cs7o_Smi7InitialCalibChks_st.VinCheckTimeStamp_u32.2,FEDFA762,Time stamp of the check of the vehicle identification number (VIN),
rb_cs7o_Smi7InitialCalibChks_st.VinCheckTimeStamp_u32.3,FEDFA763,Time stamp of the check of the vehicle identification number (VIN),

rb_cs7o_Smi7InitialCalibChks_st.FieldCalibCheckResult_en,FEDFA764,Result of the check of the field calibration state,rb_cs7o_Smi7CalibCheckResult_ten

rb_cs7o_Smi7InitialCalibChks_st.VinCheckResult_en,FEDFA765,Result of the check of the vehicle identification number (VIN),rb_cs7o_Smi7VinCheckResult_ten

rb_cs7o_Smi7InitialCalibChks_st.VinCheckCnt_u16,FEDFA766,Counter for counting repetitions of the check of the vehicle identification number (VIN),
rb_cs7o_Smi7InitialCalibChks_st.VinCheckCnt_u16.1,FEDFA767,Counter for counting repetitions of the check of the vehicle identification number (VIN),

	
rb_cs7o_Smi7FieldCalibration_st.Phase_en,FEDFA770,Field calibration phase,rb_cs7o_Smi7FieldCalibPhase_ten
rb_cs7o_Smi7FieldCalibration_st.WriteStatus_en,FEDFA771,Field calibration status of NVM write,rb_cs7o_Smi7CalibWriteStatus_ten
rb_cs7o_Smi7FieldCalibration_st.PaddingByte(0),FEDFA772,Padding byte inserted by linker,
rb_cs7o_Smi7FieldCalibration_st.PaddingByte(1),FEDFA773,Padding byte inserted by linker,

rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(0),FEDFA774,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(0).1,FEDFA775,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(0).2,FEDFA776,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(0).3,FEDFA777,Field calibration offsets,

rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(1),FEDFA778,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(1).1,FEDFA779,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(1).2,FEDFA77A,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(1).3,FEDFA77B,Field calibration offsets,

rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(2),FEDFA77C,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(2).1,FEDFA77D,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(2).2,FEDFA77E,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(2).3,FEDFA77F,Field calibration offsets,

rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(3),FEDFA780,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(3).1,FEDFA781,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(3).2,FEDFA782,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(3).3,FEDFA783,Field calibration offsets,

rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(4),FEDFA784,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(4).1,FEDFA785,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(4).2,FEDFA786,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(4).3,FEDFA787,Field calibration offsets,

rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(5),FEDFA788,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(5).1,FEDFA789,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(5).2,FEDFA78A,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(5).3,FEDFA78B,Field calibration offsets,

rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(6),FEDFA78C,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(6).1,FEDFA78D,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(6).2,FEDFA78E,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(6).3,FEDFA78F,Field calibration offsets,

rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(7),FEDFA790,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(7).1,FEDFA791,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(7).2,FEDFA792,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(7).3,FEDFA793,Field calibration offsets,

rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(8),FEDFA794,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(8).1,FEDFA795,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(8).2,FEDFA796,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(8).3,FEDFA797,Field calibration offsets,

rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(9),FEDFA798,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(9).1,FEDFA799,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(9).2,FEDFA79A,Field calibration offsets,
rb_cs7o_Smi7FieldCalibration_st.Offsets_as32(9).3,FEDFA79B,Field calibration offsets,

rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(0),FEDFA79C,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(1),FEDFA79D,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(2),FEDFA79E,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(3),FEDFA79F,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(4),FEDFA7A0,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(5),FEDFA7A1,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(6),FEDFA7A2,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(7),FEDFA7A3,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(8),FEDFA7A4,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(9),FEDFA7A5,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(10),FEDFA7A6,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(11),FEDFA7A7,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(12),FEDFA7A8,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(13),FEDFA7A9,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(14),FEDFA7AA,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(15),FEDFA7AB,Field calibration vehicle identification number (VIN) received from COM,
rb_cs7o_Smi7FieldCalibration_st.ComVin_au8(16),FEDFA7AC,Field calibration vehicle identification number (VIN) received from COM,

rb_cs7o_Smi7FieldCalibration_st.Cnt_u8,FEDFA7AD,Field calibration counter of calibration and verification tries,
rb_cs7o_Smi7FieldCalibration_st.WriteRetryCnt_u16,FEDFA7AE,Field calibration counter of end of NVM write checks,
rb_cs7o_Smi7FieldCalibration_st.WriteRetryCnt_u16.1,FEDFA7AF,Field calibration counter of end of NVM write checks,

rb_cs7o_Smi7FieldCalibration_st.ChlSelect_b16,FEDFA7B0,Field calibration selected channels,
rb_cs7o_Smi7FieldCalibration_st.ChlSelect_b16.1,FEDFA7B1,Field calibration selected channels,

rb_cs7o_Smi7FieldCalibration_st.CnFlags_b16,FEDFA7B2,Field calibration CN flags from SMI7 sensors,
rb_cs7o_Smi7FieldCalibration_st.CnFlags_b16.1,FEDFA7B3,Field calibration CN flags from SMI7 sensors,

rb_cs7o_Smi7FieldCalibration_st.NumOfSamples_u16,FEDFA7B4,Number of samples used for field calibration offset calculation,
rb_cs7o_Smi7FieldCalibration_st.NumOfSamples_u16.1,FEDFA7B5,Number of samples used for field calibration offset calculation,

rb_dcdd_FreeSamplerBuffer_st.Env1_ast(0).VehSpeed_u8,FEE04872,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(0).AccPedal_u8,FEE04873,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(1).VehSpeed_u8,FEE04874,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(1).AccPedal_u8,FEE04875,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(2).VehSpeed_u8,FEE04876,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(2).AccPedal_u8,FEE04877,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(3).VehSpeed_u8,FEE04878,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(3).AccPedal_u8,FEE04879,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(4).VehSpeed_u8,FEE0487A,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(4).AccPedal_u8,FEE0487B,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(5).VehSpeed_u8,FEE0487C,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(5).AccPedal_u8,FEE0487D,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(6).VehSpeed_u8,FEE0487E,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(6).AccPedal_u8,FEE0487F,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(7).VehSpeed_u8,FEE04880,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(7).AccPedal_u8,FEE04881,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(8).VehSpeed_u8,FEE04882,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(8).AccPedal_u8,FEE04883,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(9).VehSpeed_u8,FEE04884,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(9).AccPedal_u8,FEE04885,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(10).VehSpeed_u8,FEE04886,,
rb_dcdd_FreeSamplerBuffer_st.Env1_ast(10).AccPedal_u8,FEE04887,,

enum;rb_cs7o_Smi7CalibCheckResult_ten;rb_cs7o_Smi7CalibCheckNotDone_e;0;Field calibration check not done
enum;rb_cs7o_Smi7CalibCheckResult_ten;rb_cs7o_Smi7CalibCheckFailed_e;1;Field calibration check failed
enum;rb_cs7o_Smi7CalibCheckResult_ten;rb_cs7o_Smi7CalibCheckPassed_e;2;Field calibration check passed

rb_cs7m_FieldCalibandVINCheckReady_bo,FEDF8D55,,

rb_csei_IgnitionOffOrEngineOn_bo,FEDF8D56,,        false = 0

Hallo Willi,
ich habe nochmal gründlich darüber nachgedacht und es anschließend nochmal mit Julia verfeinert.
Daraus ergibt sich jetzt leider aber nochmal ein etwas anderer Vorschlag.

Wir haben folgende Konfiguration aus der SYDS zu unterstützen:

a)	6DredSMI700/710 swapped:			Roll	710	710	Pitch
						Yaw	700	700	YawPlausi
	Damit kann man auch abdecken:
o	6DSMI700/710 swapped

b)	Wie a), allerdings mit 720 als Roll:	Roll	720	710	Pitch
						Yaw	700	700	YawPlausi

c)	6DredSMI705/715:				Roll	715	715	Pitch
						Yaw	705	700	YawPlausi
	Damit kann man auch abdecken:
o	6DSMI705/715
o	5DredSMI705/SMI715
o	5DSMI705/SMI715

d)	Wie c), allerdings mit 710 als Pitch:	Roll	715	710	Pitch
						Yaw	705	700	YawPlausi

e)	5DredSMI700/710:				Roll	710	 ---	Pitch
						Yaw	700	700	YawPlausi
	Damit kann man auch abdecken:
o	5DSMI700/710
o	3DredESP
o	3DESP

f)	Wie e), allerdings mit 720 als Roll:	Roll	720	 ---	Pitch
						Yaw	700	700	YawPlausi

g)	5DSMI700/710 Hyundai:			Roll	710	 ---	Pitch
						Yaw	700	 ---	YawPlausi
	Damit kann man auch abdecken:
o	3DRoll mit 710

h)	3DRoll mit 720:				Roll	720	 ---	Pitch
						Yaw	 ---	 ---	YawPlausi
	Ist bereits abgedeckt durch:
o	b)   oder
o	f)

Damit würden wir für uns in der SW gerne bestellen:

Konfiguration	Anzahl bei der SW bereits vorhanden	Anzahl neu zu bestellen
a	1	2
b	0	0*
c	0	2
d	0	1**
e	>2	0
f	0	3
g	0	2
h***	---	---

*:	Wir verzichten bewusst darauf, der SMI720 wird derzeit nur als stand-alone 3DRoll mit 720 benutzt, als mixed-usage können wir Ihn in f) testen
**:	SMI710 als Pitch ist unwahrscheinlich, weil etwas teurer, trotzdem wollen wir eines haben (anstatt 3*c))
***:	wir benutzen dann f) um diese Konfiguration zu testen

Mit freundlichen Grüßen / Best regards
Stefan Funk 
CC-PS/EPS1

Info: Willi
Start Remote Desktop Connection frome Home Office: C:\>mstsc.exe /w:1920 /h:1200


SMI8 RT4 System
---------------
enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsSystemAsic1_e;0;Master System ASIC
enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsSystemAsic2_e;1;2nd System ASIC
enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorMain_e;2;Main HighG Sensor
enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralSensorPlausi_e;3;Plausibility HighG Sensor
enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralInertialSensor1_e;4;
enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsCentralInertialSensor2_e;5;
enum;rb_syca_AllAsics_ten;rb_syca_AllAsicsMax_e;6;Max Value (number of all ASICs)

enum;rb_syca_AsicTypes_ten;rb_syca_CG901_e;0;AB12 System ASIC CG901 (4 loops, 0 PasIf)
enum;rb_syca_AsicTypes_ten;rb_syca_CG902_e;1;AB12 System ASIC CG902 (8 loops, 2 PasIf)
enum;rb_syca_AsicTypes_ten;rb_syca_CG903_e;2;AB12 System ASIC CG903 (12 loops, 4 PasIf)
enum;rb_syca_AsicTypes_ten;rb_syca_CG904_e;3;AB12 System ASIC CG904 (16 loops, 6 PasIf)
enum;rb_syca_AsicTypes_ten;rb_syca_CG912_e;4;AB12 Light System ASIC CG912
enum;rb_syca_AsicTypes_ten;rb_syca_SMA660_e;5;AB12 High-g central sensor SMA660
enum;rb_syca_AsicTypes_ten;rb_syca_SMA661_e;6;AB12 High-g central sensor SMA661
enum;rb_syca_AsicTypes_ten;rb_syca_SMA665_e;7;AB12 Plausi vertical axis high-g central sensor SMA665
enum;rb_syca_AsicTypes_ten;rb_syca_SMA760_e;8;AB12 High-g central sensor SMA760
enum;rb_syca_AsicTypes_ten;rb_syca_SMA720_e;9;AB12 Plausi vertical axis central sensor SMA720 (high-g in-plane, mid-g out-plane channel)
enum;rb_syca_AsicTypes_ten;rb_syca_SMI700_e;10;AB12 Inertial sensor SMI700 (wz, ax, ay)
enum;rb_syca_AsicTypes_ten;rb_syca_SMI705_e;11;AB12 Inertial sensor SMI705 (wz, ax or ay, az)
enum;rb_syca_AsicTypes_ten;rb_syca_SMI710_e;12;AB12 Inertial sensor SMI710 (wx or wy, ax or ay, az)
enum;rb_syca_AsicTypes_ten;rb_syca_SMI715_e;13;AB12 Inertial sensor SMI715 (wx or wy, ax, ay)
enum;rb_syca_AsicTypes_ten;rb_syca_SMI720_e;14;AB12 Inertial sensor SMI720 (wx or wy, az)
enum;rb_syca_AsicTypes_ten;rb_syca_SMI800_e;15;AB12 Inertial sensor SMI800 (wz, ax, ay)
enum;rb_syca_AsicTypes_ten;rb_syca_SMI860_e;16;AB12 Inertial sensor SMI860 (wz, wx or wy, ax, ay, az)
enum;rb_syca_AsicTypes_ten;rb_syca_SMG810_e;17;AB12 Angular rate sensor SMG810 (wx or wy)
enum;rb_syca_AsicTypes_ten;rb_syca_CF190_e;18;AB12 PSI Interface ASIC CF190 (up to 4 sensors)
enum;rb_syca_AsicTypes_ten;rb_syca_AsicTypesMax_e;19;Max. value for array initializations.

enum;rb_syca_SysAsics_ten;rb_syca_SysAsicsSystemAsic1_e;0;Master System ASIC
enum;rb_syca_SysAsics_ten;rb_syca_SysAsicsSystemAsic2_e;1;2nd System ASIC
enum;rb_syca_SysAsics_ten;rb_syca_SysAsicsMax_e;2;Max Value (number of all System-ASICs)

enum;rb_sycc_AllSensors_ten;rb_sycc_AllSensorsSmaCentralMain_e;0;Main HighG Sensor
enum;rb_sycc_AllSensors_ten;rb_sycc_AllSensorsSmaCentralPlausi_e;1;Plausibility HighG Sensor
enum;rb_sycc_AllSensors_ten;rb_sycc_AllSensorsInertialSensor1_e;2;
enum;rb_sycc_AllSensors_ten;rb_sycc_AllSensorsInertialSensor2_e;3;
enum;rb_sycc_AllSensors_ten;rb_sycc_AllSensorsMax_e;4;Max Value (number of all sensors)
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccX_e;0;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_MainAccY_e;1;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccX_e;2;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccY_e;3;
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PlausiAccZ_e;4;SMA_az_highG
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXLg_e;5;SMI_ax_lowG
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccXHgMon_e;6;SMI_ax_midG
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLg_e;7;SMI_ay_lowG
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYHgMon_e;8;SMI_ay_midG
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccYLgPlausi_e;9;SMI_ay_lowG_redundant
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_AccZLg_e;10;SMI_az_lowG
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_RollRateLf_e;11;SMI_rateX
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLf_e;12;SMI_rateZ
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_YawRateLfPlausi_e;13;SMI_rateZ_redundant
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_PitchRateLf_e;14;SMI_rateY
enum;rb_sycc_CentralSensorChannels_ten;rb_sycc_CentralSensorChannelsMax_e;15;gives the total number of supported  central sensor channels.

enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDMainAccX_e;0;
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDMainAccY_e;1;
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDPlausiAccX_e;2;
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDPlausiAccY_e;3;
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDPlausiAccZ_e;4;SMA_az_highG
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDAccXLg_e;5;SMI_ax_lowG
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDAccXHgMon_e;6;SMI_ax_midG
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDAccYLg_e;7;SMI_ay_lowG
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDAccYHgMon_e;8;SMI_ay_midG
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDAccYLgPlausi_e;9;SMI_ay_lowG_redundant
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDAccZLg_e;10;SMI_az_lowG
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDRollRateLf_e;11;SMI_rateX
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDYawRateLf_e;12;SMI_rateZ
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDYawRateLfPlausi_e;13;SMI_rateZ_redundant
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDPitchRateLf_e;14;SMI_rateY
enum;rb_sycc_SIDCentralSensorChannels_ten;rb_sycc_SIDCentralSensorChannelsMax_e;15;gives the total number of supported SID central sensor channels.

