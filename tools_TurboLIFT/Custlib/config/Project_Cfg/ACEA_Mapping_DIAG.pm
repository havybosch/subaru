package LIFT_PROJECT;

$Defaults->{"CUSTOMER_DIAGNOSIS"} = {
							'RequestID_disposal'                          => '0x7F1',                                           #as hex string
                            'ResponseID_disposal'                         => '0x7F9',                                           #as hex string
                            'FlowControlID_disposal'                      => '0x7F1',
                            'Timeout_disposal'                            => 20000,   
							'P3_mintime_disposal'						  => 100,
							
							'RequestID_physical'                          => '0x737',                                           #as hex string
                            'ResponseID_physical'                         => '0x73F',                                           #as hex string
                            'FlowControlID_physical'                      => '0x737',
                            'Timeout_physical'                            => 20000,   
							'P3_mintime_physical'						  => 4000,								
							
							'FlowControl'                             	  => [0x30,0x00,0x01],
							'CAN_TesterPresent_Req'                       => [0x02,0x3E,0x80,0x00,0x00,0x00,0x00,0x00],          #do not add DLC in the request
                            'CAN_TesterPresent_Time'                      => 4000,                                              # cyclic TP cycle time is milli
							'clearDTC'                                	  => [0x14,0xff,0xff,0xff],                             #Bytes as array ref   
                            'DTC_SAM'                                     => '0b10011001',                                      #DTC Status availability Mask 
                            'SAM'                                         => 1,
                            'SJW'                                         => 3,
                            'Tseg1'                                       => 0xc,
                            'Tseg2'                                       => 3,
                            'Baudrate'                                    => 500000,
                            'DLCmode'                                     => 0,                                                 #0 for 8 byte, 1 for dynamic DLC
                            'DTCdefaultstate'                             => 0x08,                                              #read current fault
                            'DTCbytes'                                    => 3,                                                 #bytes per DTC
                            'ExtID'                                       => 0,                                                 # 1 for Extended Identifier, 0 for Standard 
                            'ExtAddressing'                               => 0,                                                 # 1 for Extended Addressing, 0 for Normal
                            'EcuAddr'                                     => 0x01,                                              # ECU id for Extended Addressing.
                            'TargetAddr'                                  => 0x55,      
                            'DISABLE'                                 	  => 0,                                                 # optional, to disable all CD features (similar to debug mode)
                            'DTCdefaultsubfunction'                       => '02',							
};	

$Defaults->{"ECUSESSION"} = {

						'ECUSession_Var'		=> 'Dcm_DsldGlobal_st.idxActiveSession_u8',#s_stDspDscActiveSession_u8 for AB10
						'ECUSessionVal_Disposal'=> '0x03',
						'ECUSessionVal_Default' => '0x00',						

};						
$Defaults->{"Mapping_DIAG"} = {

    #----------------------------------------------------------------

    "PRJ_SUPPORTED_SERVICES" => {
    	"StartSession"				=> "10",
    	"ReadDatabyID" 				=> "22",
    	"WriteDatabyID" 			=> "2E",      	
        "RoutineControl"            => "31",        
		"ECUReset" 					=> "11",
		"DiagnosticSessionControl"  => "10",
		"TesterPresent" 			=> "3E",	

    },
	"DIAG_SERVICES" => {
	
		#----------------------------------------------------------------------------------------
		#************************** Customer Diagnosis services *******************************
		#----------------------------------------------------------------------------------------	
    	
    	"StartSession" => {  
			"Service_ID" => "10", 
			
 			"Supported_SubFuns" => { 
				"DefaultSession"                   => "01" ,
            	"DisposalSession"                  => "04" ,
				"DefaultSession_supressPOSResp"    => "81" ,
            	"DisposalSession_supressPOSResp"   => "84" ,

			 },  
			"NEG_Responses" => { 
				"NR_busyRepeatRequest"      					=> { "Response" =>  "7F 10 21" , "Mode" =>  "strict" , "Desc" =>  "StartSession: busyRepeatRequest" , 						"AddrModes" => ["Physical","Functional"]},
				"NR_conditionsNotCorrect"      					=> { "Response" =>  "7F 10 22" , "Mode" =>  "strict" , "Desc" =>  "StartSession: conditionsNotCorrect", 					"AddrModes" => ["Physical","Functional", "disposal"]},
              	"NR_incorrectMessageLengthOrInvalidFormat"      => { "Response" =>  "7F 10 13" , "Mode" =>  "strict" , "Desc" =>  "StartSession: incorrectMessageLengthOrInvalidFormat" , 	"AddrModes" => ["Physical","Functional"]},
              	"NR_requestCorrectlyReceived_ResponsePending"	=> { "Response" =>  "7F 10 78" , "Mode" =>  "strict" , "Desc" =>  "StartSession: requestCorrectlyReceived_ResponsePending",	"AddrModes" => ["Physical","Functional"]},
              	"NR_requestOutOfRange"      					=> { "Response" =>  "7F 10 31" , "Mode" =>  "strict" , "Desc" =>  "StartSession: requestOutOfRange" , 						"AddrModes" => ["Physical","Functional"]},
              	"NR_serviceNotSupported"      					=> { "Response" =>  "7F 10 11" , "Mode" =>  "strict" , "Desc" =>  "StartSession: serviceNotSupported" , 					"AddrModes" => ["Physical","Functional", 'disposal']},
              	"NR_serviceNotSupportedInActiveSession"      	=> { "Response" =>  "7F 10 7F" , "Mode" =>  "strict" , "Desc" =>  "StartSession: serviceNotSupportedInActiveSession" , 		"AddrModes" => ["Physical","Functional"]},
              	"NR_subFunctionNotSupported"      				=> { "Response" =>  "7F 10 12" , "Mode" =>  "strict" , "Desc" =>  "StartSession: subFunctionNotSupported" , 				"AddrModes" => ["Physical"]},
              	"NR_subFunctionNotSupportedInActiveSession"    	=> { "Response" =>  "7F 10 7E" , "Mode" =>  "strict" , "Desc" =>  "StartSession: subFunctionNotSupportedInActiveSession" , 	"AddrModes" => ["Physical","Functional"]},
              	"NR_vehicleSpeedTooHigh"      					=> { "Response" =>  "7F 10 88" , "Mode" =>  "strict" , "Desc" =>  "StartSession: vehicleSpeedTooHigh" , 					"AddrModes" => ["Physical","Functional"]},
			 },  
		 }, 
		 
		"ReadDatabyID" => {  
			"Service_ID" => "22" , 
				"Supported_SubFuns" => { 
  			        "ReadVIN " => "F1 90",
  			        "ReadNumberOfPCU" => "FA 00",
  			        "ReadPCUHWDPLMethod " => "FA 01",					
  			        "ReadAddressInfoOfPCU" => "FA 02",
  			        "ReadDeploymentLoopTable " => "FA 06",					
					"ReadDismantlerInfo" => "FA 07",						
					}, 
       
				"NEG_Responses" => { 
					"NR_busyRepeatRequest"      					=> { "Response" =>  "7F 22 21" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: busyRepeatRequest"  , 						"AddrModes" => ["Physical","Functional"]},
					"NR_requestOutOfRange"      					=> { "Response" =>  "7F 22 31" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: requestOutOfRange"  , 						"AddrModes" => ["Physical","Functional"]},             
					"NR_conditionsNotCorrect"      					=> { "Response" =>  "7F 22 22" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: conditionsNotCorrect"  , 					"AddrModes" => ["Physical","Functional"]},
					"NR_incorrectMessageLengthOrInvalidFormat"		=> { "Response" =>  "7F 22 13" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: incorrectMessageLengthOrInvalidFormat"  ,	"AddrModes" => ["Physical","Functional"]},
					"NR_requestCorrectlyReceived_ResponsePending"	=> { "Response" =>  "7F 22 78" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: requestCorrectlyReceived_ResponsePending" ,"AddrModes" => ["Physical","Functional"]},
					"NR_requiredTimeDelayNotExpired"    			=> { "Response" =>  "7F 22 37" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: requiredTimeDelayNotExpired"  , 			"AddrModes" => ["Physical","Functional"]},
					"NR_securityAccessDenied"      					=> { "Response" =>  "7F 22 33" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: securityAccessDenied"  , 					"AddrModes" => ["Physical","Functional"]},
					"NR_serviceNotSupported"     					=> { "Response" =>  "7F 22 11" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: serviceNotSupported"  , 					"AddrModes" => ["Physical","Functional"]},
					"NR_serviceNotSupportedInActiveSession"      	=> { "Response" =>  "7F 22 7F" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: serviceNotSupportedInActiveSession"  ,		"AddrModes" => ["Physical","Functional"]},
					"NR_subFunctionNotSupported"      				=> { "Response" =>  "7F 22 12" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: subFunctionNotSupported"  , 				"AddrModes" => ["Physical","Functional"]},
					"NR_subFunctionNotSupportedInActiveSession"     => { "Response" =>  "7F 22 7E" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: subFunctionNotSupportedInActiveSession"  , "AddrModes" => ["Physical","Functional"]},
					"NR_vehicleSpeedTooHigh"      					=> { "Response" =>  "7F 22 88" , "Mode" =>  "strict" , "Desc" =>  "ReadDatabyID: vehicleSpeedTooHigh" , 					"AddrModes" => ["Physical","Functional"]},
				},  
			},
    	
    	
#----------------------------------------------------------------- 
		"RoutineControl" => {  
			"Service_ID" => "31" , 
 			"Supported_SubFuns" => { 
				"StartRoutine" 		=> "01" ,
				"StopRoutine"      	=> "02" ,
				"ReqRoutineResult" 	=> "03"	, 
				},
 			"Supported_IDs" => { 
				"ExecuteDisposalProgramLoader"  => "E2 00",
				"DeployLoopRoutineID" 			=> "E2 01",
	
				},				
			"NEG_Responses" => { 
				"NR_busyRepeatRequest"      						=> { "Response" =>  "7F 31 21" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: busyRepeatRequest" , "AddrModes" => ["physical","functional"]},
				"NR_conditionsNotCorrect"      						=> { "Response" =>  "7F 31 22" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: conditionsNotCorrect" , "AddrModes" => ["physical","functional"]},
				"NR_exceedNumberOfAttempts"      					=> { "Response" =>  "7F 31 36" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: exceedNumberOfAttempts", "AddrModes" => ["physical","functional"]},
				"NR_incorrectMessageLengthOrInvalidFormat"      	=> { "Response" =>  "7F 31 13" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: incorrectMessageLengthOrInvalidFormat" , "AddrModes" => ["physical","functional"]},
				"NR_invalidKey"      								=> { "Response" =>  "7F 31 35" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: invalidKey" , "AddrModes" => ["physical","functional"]},
				"NR_noResponseFromSubnetComponent"      			=> { "Response" =>  "7F 31 25" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: noResponseFromSubnetComponent" , "AddrModes" => ["physical","functional"]},
				"NR_requestCorrectlyReceived_ResponsePending"      	=> { "Response" =>  "7F 31 78" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: requestCorrectlyReceived_ResponsePending" , "AddrModes" => ["physical","functional"]},
				"NR_requestOutOfRange"      						=> { "Response" =>  "7F 31 31" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: requestOutOfRange" , "AddrModes" => ["physical"]},
				"NR_requiredTimeDelayNotExpired"      				=> { "Response" =>  "7F 31 37" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: requiredTimeDelayNotExpired" , "AddrModes" => ["physical","functional"]},
				"NR_securityAccessDenied"      						=> { "Response" =>  "7F 31 33" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: securityAccessDenied" , "AddrModes" => ["physical","functional"]},
				"NR_serviceNotSupported"     						=> { "Response" =>  "7F 31 11" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: serviceNotSupported" , "AddrModes" => ["physical"]},
				"NR_serviceNotSupportedInActiveSession"      		=> { "Response" =>  "7F 31 7F" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: serviceNotSupportedInActiveSession" , "AddrModes" => ["physical","functional"]},
				"NR_subFunctionNotSupported"      					=> { "Response" =>  "7F 31 12" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: subFunctionNotSupported" , "AddrModes" => ["physical"]},
				"NR_subFunctionNotSupportedInActiveSession"      	=> { "Response" =>  "7F 31 7E" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: subFunctionNotSupportedInActiveSession" , "AddrModes" => ["physical","functional"]},
				"NR_vehicleSpeedTooHigh"      						=> { "Response" =>  "7F 31 88" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: vehicleSpeedTooHigh" , "AddrModes" => ["physical","functional"]},
				"NR_requestSequenceError"      						=> { "Response" =>  "7F 31 24" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: SequenceError" ,"AddrModes" => ["physical","functional"]},		
				"NR_voltageTooHigh"      							=> { "Response" =>  "7F 31 92" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: voltageTooHigh" ,"AddrModes" => ["physical","functional"]},				
				"NR_voltageTooLow"      							=> { "Response" =>  "7F 31 93" , "Mode" =>  "strict" , "Desc" =>  "RoutineControl: voltageTooLow" ,"AddrModes" => ["physical","functional"]},								

			 },
			"Service_Supported_Sessions" => ["DisposalSession","DisposalSession_supressPOSResp","EOLSession","EOLSession_supressPOSResp","ExtendedSession","ExtendedSession_supressPOSResp","DevelopmentSession","DevelopmentSession_supressPOSResp"],			 
		 },  
        #----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	"SecurityAccess" => {  
		"Service_ID" => "27" , 
			"Supported_SubFuns" => {
                "RequestSeed"  									=> "5F",
				"SendKey"      									=> "60",                     
    
		 	},  
			"NEG_Responses" => { 
           		"NR_busyRepeatRequest"      					=> { "Response" =>  "7F 27 21" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: busyRepeatRequest" , "AddrModes" => ["Physical","Functional"]},
           		"NR_conditionsNotCorrect"      					=> { "Response" =>  "7F 27 22" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: conditionsNotCorrect" , "AddrModes" => ["Physical","Functional"]},
           		"NR_exceedNumberOfAttempts"      				=> { "Response" =>  "7F 27 36" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: exceedNumberOfAttempts" , "AddrModes" => ["Physical","Functional"]},
           		"NR_incorrectMessageLengthOrInvalidFormat"      => { "Response" =>  "7F 27 13" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: incorrectMessageLengthOrInvalidFormat", "AddrModes" => ["Physical","Functional"]},
           		"NR_invalidKey"      							=> { "Response" =>  "7F 27 35" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: invalidKey" , "AddrModes" => ["Physical","Functional"]},
           		"NR_noResponseFromSubnetComponent"     			=> { "Response" =>  "7F 27 25" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: noResponseFromSubnetComponent" , "AddrModes" => ["Physical","Functional"]},
           		"NR_requestCorrectlyReceived_ResponsePending" 	=> { "Response" =>  "7F 27 78" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: requestCorrectlyReceived_ResponsePending" , "AddrModes" => ["Physical","Functional"]},
           		"NR_requestOutOfRange"      					=> { "Response" =>  "7F 27 31" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: requestOutOfRange" , "AddrModes" => ["Physical","Functional"]},
           		"NR_requiredTimeDelayNotExpired"      			=> { "Response" =>  "7F 27 37" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: requiredTimeDelayNotExpired" , "AddrModes" => ["Physical","Functional"]},
           		"NR_securityAccessDenied"      					=> { "Response" =>  "7F 27 33" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: securityAccessDenied" , "AddrModes" => ["Physical","Functional"]},
           		"NR_serviceNotSupported"      					=> { "Response" =>  "7F 27 11" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: serviceNotSupported" , "AddrModes" => ["Physical","Functional"]},
           		"NR_serviceNotSupportedInActiveSession"      	=> { "Response" =>  "7F 27 7F" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: serviceNotSupportedInActiveSession", "AddrModes" => ["Physical","Functional"]},
           		"NR_subFunctionNotSupported"      				=> { "Response" =>  "7F 27 12" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: subFunctionNotSupported" , "AddrModes" => ["Physical","Functional"]},
           		"NR_subFunctionNotSupportedInActiveSession"     => { "Response" =>  "7F 27 7E" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: subFunctionNotSupportedInActiveSession" , "AddrModes" => ["Physical","Functional"]},
           		"NR_vehicleSpeedTooHigh"      					=> { "Response" =>  "7F 27 88" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: vehicleSpeedTooHigh" , "AddrModes" => ["Physical","Functional"]},
           		"NR_requestSequenceError"      					=> { "Response" =>  "7F 27 24" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess: RequestSequenceError" , "AddrModes" => ["Physical","Functional"]},            
           		"NR_InvalidKey"           						=> { "Response" =>  "7F 27 35" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess - Negative Response Invalid Key" , "AddrModes" => ["Physical","Functional"]},
           		"NR_TimeDelaynotExpired"  						=> { "Response" =>  "7F 27 37" , "Mode" =>  "strict" , "Desc" =>  "SecurityAccess - Negative Response Time delay not expired" , "AddrModes" => ["Physical","Functional"]},             
		 	},  
	 	},  
	

		"WriteDatabyID" => {  
			"Service_ID" => "2E" , 
				"Supported_SubFuns" => { 
		        
				"WriteDismantlerInfo" => "FA 07",					
			 },  
			"NEG_Responses" => { 
              "NR_busyRepeatRequest"      							=> { "Response" =>  "7F 2E 21" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: busyRepeatRequest" ,"AddrModes" => ["Physical","Functional"]},
              "NR_conditionsNotCorrect"      						=> { "Response" =>  "7F 2E 22" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: conditionsNotCorrect" ,"AddrModes" => ["Physical","Functional"]},
              "NR_exceedNumberOfAttempts"      						=> { "Response" =>  "7F 2E 36" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: exceedNumberOfAttempts" ,"AddrModes" => ["Physical","Functional"]},
              "NR_incorrectMessageLengthOrInvalidFormat"      		=> { "Response" =>  "7F 2E 13" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: incorrectMessageLengthOrInvalidFormat" ,"AddrModes" => ["Physical","Functional"]},
              "NR_invalidKey"      									=> { "Response" =>  "7F 2E 35" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: invalidKey" ,"AddrModes" => ["Physical","Functional"]},
              "NR_noResponseFromSubnetComponent"      				=> { "Response" =>  "7F 2E 25" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: noResponseFromSubnetComponent" ,"AddrModes" => ["Physical","Functional"]},
              "NR_requestCorrectlyReceived_ResponsePending"      	=> { "Response" =>  "7F 2E 78" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: requestCorrectlyReceived_ResponsePending" ,"AddrModes" => ["Physical","Functional"]},
              "NR_requestOutOfRange"      							=> { "Response" =>  "7F 2E 31" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: requestOutOfRange" ,"AddrModes" => ["Physical","Functional"]},
              "NR_requiredTimeDelayNotExpired"      				=> { "Response" =>  "7F 2E 37" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: requiredTimeDelayNotExpired" ,"AddrModes" => ["Physical","Functional"]},
              "NR_securityAccessDenied"      						=> { "Response" =>  "7F 2E 33" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: securityAccessDenied" ,"AddrModes" => ["Physical","Functional"]},
              "NR_serviceNotSupported"      						=> { "Response" =>  "7F 2E 11" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: serviceNotSupported" ,"AddrModes" => ["Physical","Functional"]},
              "NR_serviceNotSupportedInActiveSession"      			=> { "Response" =>  "7F 2E 7F" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: serviceNotSupportedInActiveSession" ,"AddrModes" => ["Physical","Functional"]},
              "NR_subFunctionNotSupported"      					=> { "Response" =>  "7F 2E 12" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: subFunctionNotSupported" ,"AddrModes" => ["Physical","Functional"]},
              "NR_subFunctionNotSupportedInActiveSession"      		=> { "Response" =>  "7F 2E 7E" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: subFunctionNotSupportedInActiveSession" ,"AddrModes" => ["Physical","Functional"]},
              "NR_vehicleSpeedTooHigh"      						=> { "Response" =>  "7F 2E 88" , "Mode" =>  "strict" , "Desc" =>  "WriteDatabyID: vehicleSpeedTooHigh" ,"AddrModes" => ["Physical","Functional"]},
			 },  
		 }, 
		#----------------------------------------------------------------- 
		"TesterPresent" => {  
		"Service_ID" => "3E" , 
 			"Supported_SubFuns" => { 
					"TesterPresentPosResp"        => "00" ,
					"TesterPresentsupressPosResp" => "80" , 
			 },  
			"NEG_Responses" => { 
              "NR_incorrectMessageLengthOrInvalidFormat"      => { "Response" =>  "7F 3E 13" , "Mode" =>  "strict" , "Desc" =>  "TesterPresent: incorrectMessageLengthOrInvalidFormat" ,"AddrModes" => ["Physical","Functional"]},
              "NR_subFunctionNotSupported"      => { "Response" =>  "7F 3E 12" , "Mode" =>  "strict" , "Desc" =>  "TesterPresent: subFunctionNotSupported" ,"AddrModes" => ["Physical","Functional"]},
			 },  
		 }, 
		       
#----
#----------------------------------------------------------------- 

		"ECUReset" => {  
		"Service_ID" => "11" , 
 			"Supported_SubFuns" => { 
 			 			  "HardReset"                    => "01",
						  "HardResetsupressPOSResp"     => "81", 
								   },  
			"NEG_Responses" => { 
              "NR_incorrectMessageLengthOrInvalidFormat"      => { "Response" =>  "7F 11 13" , "Mode" =>  "strict" , "Desc" =>  "ECUReset: incorrectMessageLengthOrInvalidFormat" ,"AddrModes" => ["Physical","Functional"]},
              "NR_serviceNotSupportedInActiveSession"      => { "Response" =>  "7F 11 7F" , "Mode" =>  "strict" , "Desc" =>  "ECUReset: serviceNotSupportedInActiveSession" ,},
              "NR_subFunctionNotSupported"      => { "Response" =>  "7F 11 12" , "Mode" =>  "strict" , "Desc" =>  "ECUReset: subFunctionNotSupported" ,"AddrModes" => ["Physical","Functional"]},
			 },  
		 }, 

	 },
#-----------------------------------------------------------------  
"Requests_Responses" => {
    	
#------------------------------------------------------ StartSession Request and Responses Starts here--------------------------------------------------------------------------	
		"StartSession_DefaultSession" => {  
			
			"Requests" => { 
				"REQ_StartSession_DefaultSession" 	=> { "Request" => "10 01"},
			},  
			
			"POS_Responses" => { 
				"PR_StartSession_DefaultSession"	=> { "Response" =>  "50 01 00 32 01 F4" , "Mode" =>  "strict" , "Desc" =>  "Start Session: StartSession_DefaultSession" , "DataLength" => "" , "DoorsIDs" => [ "" ]},
			},  
			
		},  
			"StartSession_DisposalSession" => {  
			
			"Requests" => { 
				"REQ_StartSession_DisposalSession" 	=> { "Request" => "10 04"},
			},  
			
			"POS_Responses" => { 
				"PR_StartSession_DisposalSession"	=> { "Response" =>  "50 04 00 32 01 F4" , "Mode" =>  "strict" , "Desc" =>  "Start Session: StartSession_DisposalSession" , "DataLength" => "" , "DoorsIDs" => [ "" ]},
			},
			"NEG_Responses" => {
				"NR_conditionsNotCorrect"      					=> { "Response" =>  "7F 10 22" , "Mode" =>  "strict" , "Desc" =>  "StartSession: conditionsNotCorrect", 					"AddrModes" => ["Physical","Functional", "disposal"]},  
			},
			"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,  
			'protocol' => 'Disposal',
			'preconditions_prohibiting_execution' => ['IdleModeCheck', 'VehicleSpeedTooHighCheck', 'VoltageTooHighCheck', 'VoltageTooLowCheck', 'InitTestNotCompletedCheck', 'ProductionModeActiveCheck'],
			'allowed_in_addressingmodes' => ['disposal'],
			'allowed_in_securitylevels' => ['None'],
			'additional_parameter' => 'n/a', 
		}, 
		#----------------------------------------------------------------------------------- 
		"ECUReset_HardReset" => {  
                "Requests" => { 
					"REQ_ECUReset_HardReset"       =>  { 'Request' => "11 01" },
                 },  
                "POS_Responses" => { 
					"PR_ECUReset_HardReset"      => { "Response" =>  "51 01" , "Mode" =>  "strict" , "Desc" =>  "PR: ECU Reset Hard Reset" , "DoorsIDs" => [ "" ]},
                 }, 
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },  
		 "ECUReset_HardResetSupressPOSResp" => {  
                "Requests" => { 
                    "REQ_ECUReset_HardResetSupressPOSResp"       =>  { 'Request' => "11 81" },
                 },  
                "POS_Responses" => { 
                    "PR_ECUReset_HardResetSupressPOSResp"      => { "Response" =>  undef , "Mode" =>  "quiet" , "Desc" =>  "PR: ECU Reset Hard Reset suppress positive response" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },  
		 	
		"ECUReset_SoftReset" => {  
               "Requests" => { 
					"REQ_ECUReset_SoftReset"       =>  { 'Request' => "11 03" },
                 },  
                "POS_Responses" => { 
					"PR_ECUReset_SoftReset"      => { "Response" =>  "51 03" , "Mode" =>  "strict" , "Desc" =>  "PR: ECU Reset SoftReset" , "DoorsIDs" => [ "" ]},
                 }, 
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },  
		 
		 "ECUReset_SoftResetSupressPOSResp" => {  
                "Requests" => { 
                    "REQ_ECUReset_SoftResetSupressPOSResp"       =>  { 'Request' => "11 83" },
                 },  
                "POS_Responses" => { 
                    "PR_ECUReset_SoftResetSupressPOSResp"      => { "Response" =>  undef , "Mode" =>  "quiet" , "Desc" =>  "PR: ECU Reset Soft Reset suppress positive response" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         }, 
		 #---------------------------------------------------------------------------------
		"ReadDatabyID_ReadVIN" => {  
                "Requests" => { 
					"REQ_ReadDatabyID_ReadVIN"       =>  { 'Request' => "22 F1 90" } ,
                 },  
                "POS_Responses" => { 
                    "PR_ReadDatabyID_ReadVIN"      => { "Response" =>  "62 F1 90" , "Mode" =>  "relax" , "Desc" =>  "PR: Read Data by ID - Read VIN" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },  
		
		"ReadDatabyID_ReadNumberOfPCU" => {  
                "Requests" => { 
					"REQ_ReadDatabyID_ReadNumberOfPCU"       =>  { 'Request' => "22 FA 00" },
                 },  
                "POS_Responses" => { 
                    "PR_ReadDatabyID_ReadNumberOfPCU"      => { "Response" =>  "62 FA 00 01" , "Mode" =>  "strict" , "Desc" =>  "PR: Read Data by ID - Read Number Of PCU" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         }, 
		
		"ReadDatabyID_ReadPCUHWDPLMethod" => {  
                "Requests" => { 
					"REQ_ReadDatabyID_ReadPCUHWDPLMethod"        =>  { 'Request' => "22 FA 01" },
                 },  
                "POS_Responses" => { 
                    "PR_ReadDatabyID_ReadPCUHWDPLMethod"      => { "Response" =>  "62 FA 01 01 00 00 00 00 00 00 00 00 00" , "Mode" =>  "strict" , "Desc" =>  "PR: Read Data by ID - Read PCU HW DPL Method" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         }, 
		
		"ReadDatabyID_ReadAddressInfoOfPCU" => {  
                "Requests" => { 
					"REQ_ReadDatabyID_ReadAddressInfoOfPCU"       =>  { 'Request' => "22 FA 02"},
                 },  
                "POS_Responses" => { 
                    "PR_ReadDatabyID_ReadAddressInfoOfPCU"      => { "Response" =>  "62 FA 02 01 00 00 07 F1 00 00 07 F9" , "Mode" =>  "strict" , "Desc" =>  "PR: Read Data by ID - SRead Address Info Of PCU" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },  
		
		"ReadDatabyID_ReadDeploymentLoopTable" => {  
                "Requests" => { 
					"REQ_ReadDatabyID_ReadDeploymentLoopTable"       =>  { 'Request' => "22 FA 06"},
                 },  
                "POS_Responses" => { 
                    "PR_ReadDatabyID_ReadDeploymentLoopTable"      => { "Response" =>  "62 FA 06" , "Mode" =>  "relax" , "Desc" =>  "PR: Read Data by ID - Read Deployment Loop Table" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },  
		
		"ReadDatabyID_ReadDismantlerInfo" => {  
                "Requests" => { 
					"REQ_ReadDatabyID_ReadDismantlerInfo"       =>  { 'Request' => "22 FA 07"},
                 },  
                "POS_Responses" => { 
                    "PR_ReadDatabyID_ReadDismantlerInfo"      => { "Response" =>  "62 FA 07" , "Mode" =>  "relax" , "Desc" =>  "PR: Read Data by ID - Read Dismantler Info" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },	
#-------------------------------------------------------------------------------------------
		"WriteDatabyID_WriteDismantlerInfo" => {  
                "Requests" => { 
					"REQ_WriteDatabyID_WriteDismantlerInfo"       =>  { 'Request' => "2E FA 07 DismantlerInfo"},
                 },  
                "POS_Responses" => { 
                    "PR_WriteDatabyID_WriteDismantlerInfo"      => { "Response" =>  "6E FA 07" , "Mode" =>  "strict" , "Desc" =>  "PR: Write Data by ID - Write Dismantler Infon" ,},
                 }, 
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },	
#-------------------------------------------------------------------------------------------
		"RoutineControl_StartRoutine_ExecuteDisposalProgramLoader" => {  
                "Requests" => { 
					"REQ_RoutineControl_StartRoutine_ExecuteDisposalProgramLoader"       =>  { 'Request' => "31 01 E2 00 RoutineControlOption"},
                 },  
                "POS_Responses" => { 
                    "PR_RoutineControl_StartRoutine_ExecuteDisposalProgramLoader"      => { "Response" =>  "71 01 E2 00 RoutineControlResponse" , "Mode" =>  "strict" , "Desc" =>  "PR: Start Routine Control Service - Execute Disposal Program Loader" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },	

		"RoutineControl_StartRoutine_DeployLoopRoutineID" => {  
                "Requests" => { 
					"REQ_RoutineControl_StartRoutine_DeployLoopRoutineID"       =>  { 'Request' => "31 01 E2 01 LoopId"} ,
                 },  
                "POS_Responses" => { 
                    "PR_RoutineControl_StartRoutine_DeployLoopRoutineID"      => { "Response" =>  "71 01 E2 01 LoopId_Response" , "Mode" =>  "relax" , "Desc" =>  "PR: Start Routine Control Service - Deploy Loop Routine ID" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },	

		"RoutineControl_ReqRoutineResult_ExecuteDisposalProgramLoader" => {  
                "Requests" => { 
					"REQ_RoutineControl_ReqRoutineResult_ExecuteDisposalProgramLoader"       =>  { 'Request' => "31 03 E2 00"},
                 },  
                "POS_Responses" => { 
                    "PR_RoutineControl_ReqRoutineResult_ExecuteDisposalProgramLoader"      => { "Response" =>  "71 03 E2 00 RoutineControlResult" , "Mode" =>  "strict" , "Desc" =>  "PR: Request Routine Results - Execute Disposal Program Loader" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },	

		"RoutineControl_ReqRoutineResult_DeployLoopRoutineID" => {  
                "Requests" => { 
					"REQ_RoutineControl_ReqRoutineResult_DeployLoopRoutineID"       =>  { 'Request' => "31 03 E2 01 LoopId"},
                 },  
                "POS_Responses" => { 
                    "PR_RoutineControl_ReqRoutineResult_DeployLoopRoutineID"      => { "Response" =>  "71 03 E2 01 LoopResults" , "Mode" =>  "relax" , "Desc" =>  "PR: Request Routine Results - Deploy Loop Routine ID" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },			 
#-----------------------------------------------------------------------------
		"SecurityAccess_CD_RequestSeed" => {  
                "Requests" => { 
					"REQ_SecurityAccess_CD_RequestSeed"       =>  { 'Request' => "27 5F" },
                 },  
                "POS_Responses" => { 
                    "PR_SecurityAccess_CD_RequestSeed"      => { "Response" =>  "67 5F" , "Mode" =>  "relax" , "Desc" =>  "PR: Security Access - Request Seed" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         }, 	

		"SecurityAccess_CD_SendKey" => {  
                "Requests" => { 
					"REQ_SecurityAccess_CD_SendKey"     => { 'Request' => "27 60 Key" },
                 },  
                "POS_Responses" => { 
                    "PR_SecurityAccess_CD_SendKey"      => { "Response" =>  "67 60" , "Mode" =>  "strict" , "Desc" =>  "PR: Security Access - Send Seed" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },  	
#------------------------------------------------------------------------------
		"TesterPresent_TesterPresentPosResp" => {  
                "Requests" => { 
					"REQ_TesterPresent_TesterPresentPosResp"       =>  { 'Request' => "3E 80" },
                 },  
                "POS_Responses" => { 
                    "PR_TesterPresent_TesterPresentPosResp"      => { "Response" =>  undef , "Mode" =>  "quiet" , "Desc" =>  "PR: Tester Present - Supress Positive Response" ,},
                 },  
		"allowed_in_sessions" => [  "DefaultSession" , "safetySystemDiagnosticSession"] ,    				 
         },
		 
	},
"GlobalNRC" => {
        "10" => "generalReject",
        "11" => "serviceNotSupported",
        "12" => "subFunctionNotSupported",
        "13" => "incorrectMessageLengthOrInvalidFormat",
        "14" => "responseTooLong",
        "21" => "busyRepeatRequest",
        "22" => "conditionsNotCorrect",
        "24" => "requestSequenceError",
        "25" => "noResponseFromSubnetComponent",
        "26" => "failurePreventsExecutionOfRequestedAction",
        "31" => "requestOutOfRange",
        "33" => "securityAccessDenied",
        "35" => "invalidKey",
        "36" => "exceedNumberOfAttempts",
        "37" => "requiredTimeDelayNotExpired",
        "70" => "uploadDownloadNotAccepted",
        "71" => "transferDataSuspended",
        "72" => "generalProgrammingFailure",
        "73" => "wrongBlockSequenceCounter",
        "78" => "requestCorrectlyReceived_ResponsePending",
        "7E" => "subFunctionNotSupportedInActiveSession",
        "7F" => "serviceNotSupportedInActiveSession",
        "81" => "rpmTooHigh",
        "82" => "rpmTooLow",
        "83" => "engineIsRunning",
        "84" => "engineIsNotRunning",
        "85" => "engineRunTimeTooLow",
        "86" => "temperatureTooHigh",
        "87" => "temperatureTooLow",
        "88" => "vehicleSpeedTooHigh",
        "89" => "vehicleSpeedTooLow",
        "8A" => "throttle_PedalTooHigh",
        "8B" => "throttle_PedalTooLow",
        "8C" => "transmissionRangeNotInNeutral",
        "8D" => "transmissionRangeNotInGear",
        "8F" => "brakeSwitchNotClosed",
        "90" => "shifterLeverNotInPark",
        "91" => "torqueConverterClutchLocked",
        "92" => "voltageTooHigh",
        "93" => "voltageTooLow",
    },    #end of Global NRC	

};
1;	
		 