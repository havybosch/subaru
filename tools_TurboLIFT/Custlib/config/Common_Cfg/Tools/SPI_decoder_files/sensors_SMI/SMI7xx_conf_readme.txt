
#******************************
# SMI7xx_conf_1  -> CoreAsset *
#-------------------------------------------------------------------------
# Yaw = SMI700, Roll = SMI710                 : CoreAsset 5D configuration
#                   OR
# Yaw = SMI700, Roll = SMI710, YAW_R = SMI700 : 5D_R configuration: 
#                   OR
# Roll = 720
#-------------------------------------------------------------------------
# SMI700
 $YawRateLfChl  		= '50 00 00 00';    #YawRateLfChl 
 $AccXLgChl     		= '70 00 00 00';    #AccXLgChl     		CH2
 $AccXHgMonChl  		= '78 00 00 00';    #AccXHgMonChl  		CH2
 $AccYLgChl     		= '60 00 00 00';    #AccYLgChl     		CH1
# SMI710 / 720
 $RollRateLfChl 		= 'D0 00 00 00';    #RollRateLfChl 
 $AccZLgChl     		= 'F0 00 00 00';    #AccZLgChl     		CH2
# SMI700
 $YawRateLfPlausiChl 	= '10 00 00 00';    #YawRateLfPlausiChl 
 $AccYLgPlausiChl    	= '20 00 00 00';    #AccYLgPlausiChl	CH1

#*****************************
# SMI7xx_conf_2 -> CoreAsset *
#-------------------------------------------------------------------------
# Yaw = SMI700, Roll = SMI710, YAW_R = SMI700 Pitch = 710 : 6D configuration: 
#-------------------------------------------------------------------------
#SMI700
 $YawRateLfChl  		= '50 00 00 00';    #YawRateLfChl 
 $AccYLgChl     		= '60 00 00 00';    #AccYLgChl			CH1
# SMI710
 $RollRateLfChl 		= 'D0 00 00 00';    #RollRateLfChl 
# SMI700
 $YawRateLfPlausiChl  	= '10 00 00 00';    #YawRateLfPlausiChl 
 $AccYLgPlausiChl    	= '20 00 00 00';    #AccYLgPlausiChl	CH1
#SMI710
 $PitchRateLfChl      	= '90 00 00 00';    #PitchRateLfChl 
 $AccXLgChl     		= 'A0 00 00 00';    #AccXLgChl			CH1
 $AccXHgMonChl  		= 'A8 00 00 00';    #AccXHgMonChl		CH1
 $AccZLgChl     		= 'B0 00 00 00';    #AccZLgChl			CH2

#*****************************
# SMI7xx_conf_3 -> CoreAsset *
#-------------------------------------------------------------------------
# Yaw = SMI705, Roll = SMI715 : 5D configuration
#-------------------------------------------------------------------------
# SMI705
 $YawRateLfChl  		= '50 00 00 00';    #YawRateLfChl 
 $AccYLgChl     		= '60 00 00 00';    #AccYLgChl			CH1
 $AccZLgChl     		= '70 00 00 00';    #AccZLgChl			CH2
# SMI715
 $RollRateLfChl 		= 'D0 00 00 00';    #RollRateLfChl 
 $AccXLgChl     		= 'F0 00 00 00';    #AccXLgChl			CH2
 $AccXHgMonChl  		= 'F8 00 00 00';    #AccXHgMonChl		CH2

#***********************
# SMI7xx_conf_4 -> HMC *
#-------------------------------------------------------------------------
# Yaw = SMI700, Roll = SMI710 : 5D configuration
#-------------------------------------------------------------------------
# SMI700
 $YawRateLfChl  		= '50 00 00 00';    #YawRateLfChl     
 $AccXLgChl     		= '70 00 00 00';    #AccXLgChl			CH2 
 $AccXHgMonChl  		= '78 00 00 00';    #AccXHgMonChl		CH2
 $AccYLgPlausiChl    	= '60 00 00 00';    #AccYLgPlausiChl	CH1
# SMI710
 $RollRateLfChl 		= 'D0 00 00 00';    #RollRateLfChl    
 $AccYLgChl     		= 'E0 00 00 00';    #AccYLgChl			CH1
 $AccZLgChl     		= 'F0 00 00 00';    #AccZLgChl			CH2
 