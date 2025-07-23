#### TEST CASE MODULE
package TC_DHSWIM_Proveout_Steady_PlantMode_In_FaultyCondition;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: Include/TCpmGenerator/Create_TCpm.pl 1.1 2015/01/21 16:00:45MEZ Geisler Martin (CC-PS/EPS2) (gem1si) develop  $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: <TS name> (e.g. TS_SWM_SwitchMgt)
#TS version in DOORS: <TS version based on which this script is written/updated> (e.g. 3.30)
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project; #necessary
#include further modules here
use LIFT_labcar;
use LIFT_can_access;
use FuncLib_TNT_FM;
use LIFT_evaluation;
use LIFT_PD;
use GENERIC_DCOM;
##################################

our $PURPOSE = "Check behavior of DHSWL when ECU  in Faulty condition and then goes to Mazda Plant Mode";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_Proveout_Steady_PlantMode_In_FaultyCondition

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set the voltage to <Voltage_1>, ECU ON and wait for <t_Pre>.

2. Create <Fault> condition and wait for time <t_Qual> ms.

3. Check fault recorder.

4. Set the volatage to <Voltage_2> and wait for <time> ms then check fault recorder.

5. Set ECU to <Plant_mode> and Reset The ECU then check ECU mode.

6. Reset ECU and wait 4s then chek state of <DHSWL_signal>.

7. Check <DHSWL_signal> for 2s after 6s from IGN ON. 

8. Check <DHSWL_signal> after 8s from IGN ON with updated expected value.


I<B<Evaluation>>

1.

2.  

3. <Fault> is in <Fault_state>.

4. <Fault_Voltage> is in <Fault_Voltage_state>.

5. ECU is in Plant mode

6. <DHSWL_signal> shall be in <ON_State> for <ON_time_ms> from IGN ON.

7.<DHSWL_signal> shall be   <OFF_State> for <OFF_time_ms>.

8. <DHSWL_signal> is in <Real_State> after <ProveOut_Time> from IGN ON.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Fault_state' => 
	SCALAR 'Fault_Voltage_state' => 
	SCALAR 'Fault_Voltage' => 
	SCALAR 'purpose' => 
	SCALAR 't_Pre' => 
	SCALAR 'Voltage_1' => 
	SCALAR 'Voltage_2' => 
	SCALAR 'ON_time_ms' => 
	SCALAR 'OFF_time_ms' => 
	SCALAR 'ProveOut_Time' => 
	SCALAR 'ON_State' => 
	SCALAR 'OFF_State' => 
	SCALAR 't_Qual' => 
	SCALAR 'time' => 
	SCALAR 'Fault' => 
	SCALAR 'DHSWL_signal' => 


=head2 PARAMETER EXAMPLES

	purpose = 'Check behavior of DHSWL when ECU  in Faulty condition and then goes to Mazda Plant Mode'
	
	t_Pre = '0' 
	Voltage_1 = 'NormalVoltage'
	Voltage_2 = '<Test Heading 2>'
	ON_time_ms = '6000' #ms (+/-150ms)
	OFF_time_ms = '2000' #ms (+/-150ms)
	ProveOut_Time = '8000' #ms  (+/-300ms)
	ON_State = '1'
	OFF_State = '0'
	
	t_Qual = '0'
	time = '500' #ms
	Fault = 'No fault'
	DHSWL_signal = 'DHS_RILReq'
	Fault_state = 'Empty'
	Fault_Voltage_state = 'Empty'
	Fault_Voltage = 'No fault'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_t_Pre;
my $tcpar_Voltage_1;
my $tcpar_Voltage_2;
my $tcpar_ON_time_ms;
my $tcpar_OFF_time_ms;
my $tcpar_ProveOut_Time;
my $tcpar_ON_State;
my $tcpar_OFF_State;
my $tcpar_t_Qual;
my $tcpar_time;
my $tcpar_Fault;
my $tcpar_Fault_temp;
my $tcpar_DHSWL_signal;
my $tcpar_Fault_state;
my $tcpar_Fault_Voltage_state;
my $tcpar_Fault_Voltage;
my $tcpar_Real_State;
my $tcpar_Plant_mode;

################ global parameter declaration ###################
#add any global variables here
my $fault_struct;
my $fault_struct_voltage;
my $Provetime_Obt_0_4; 
my $Provetime_Obt_6_8;
my $Provetime_Obt_8;
my @Provetime_Obt_0_4_arr;
my @Provetime_Obt_8_arr;
my @Provetime_Obt_6_8_arr;
my @DTC;
my $ecu_mode;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_t_Pre =  GEN_Read_mandatory_testcase_parameter( 't_Pre' );
	$tcpar_Voltage_1 =  GEN_Read_mandatory_testcase_parameter( 'Voltage_1' );
	$tcpar_Voltage_2 =  GEN_Read_mandatory_testcase_parameter( 'Voltage_2' );
	$tcpar_ON_time_ms =  GEN_Read_mandatory_testcase_parameter( 'ON_time_ms' );
	$tcpar_OFF_time_ms =  GEN_Read_mandatory_testcase_parameter( 'OFF_time_ms' );
	$tcpar_ProveOut_Time =  GEN_Read_mandatory_testcase_parameter( 'ProveOut_Time' );
	$tcpar_ON_State =  GEN_Read_mandatory_testcase_parameter( 'ON_State' );
	$tcpar_OFF_State =  GEN_Read_mandatory_testcase_parameter( 'OFF_State' );
	$tcpar_t_Qual =  GEN_Read_mandatory_testcase_parameter( 't_Qual' );
	$tcpar_time =  GEN_Read_mandatory_testcase_parameter( 'time' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Fault_temp =  GEN_Read_mandatory_testcase_parameter( 'Fault_temp' );
	$tcpar_DHSWL_signal =  GEN_Read_mandatory_testcase_parameter( 'DHSWL_signal' );
	$tcpar_Fault_state =  GEN_Read_mandatory_testcase_parameter( 'Fault_state' );
	$tcpar_Fault_Voltage_state =  GEN_Read_mandatory_testcase_parameter( 'Fault_Voltage_state' );
	$tcpar_Fault_Voltage =  GEN_Read_mandatory_testcase_parameter( 'Fault_Voltage' );
	$tcpar_Real_State = GEN_Read_mandatory_testcase_parameter( 'Real_State' );
	$tcpar_Plant_mode = GEN_Read_mandatory_testcase_parameter( 'Plant_mode' );

	return 1;
}

sub TC_initialization {

	S_teststep( "StandardPrepNoFault", 'AUTO_NBR' );
	CA_trace_start();
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set the voltage to '$tcpar_Voltage_1', ECU ON and wait for '$tcpar_t_Pre'.", 'AUTO_NBR');
    	LC_SetVoltage('U_BATT_DEFAULT');
		LC_ECU_On();
        S_wait_ms( $tcpar_t_Pre );	

	S_teststep("Create '$tcpar_Fault' condition and wait for time '$tcpar_t_Qual' ms.", 'AUTO_NBR');
		  if ($tcpar_Fault eq 'No fault') {
		  }
		  else {
				if ($tcpar_Fault =~ m/(.*)PCS2(.*)/)                #use TSG4 create fault *PCS1* to create *PCS2/3* fault due to PCS1/2/3 use same pin
				{
					my $temp = "$1PCS1$2";
					GEN_printComment("Temp fault is $temp");
					FM_createFault($temp); #used for TSG4	
				}	
				elsif ($tcpar_Fault =~ m/(.*)PCS3(.*)/) 	{
	 			 	my $temp = "$1PCS1$2";			 	
					GEN_printComment("Temp fault is $temp");
					FM_createFault($temp); #used for TSG4				
				}
				else {
	   			  	FM_createFault($tcpar_Fault); #used for TSG4	
				}
		  }
		  S_wait_ms( $tcpar_t_Qual + 500 );  	 #modify

	S_teststep("Check fault recorder.", 'AUTO_NBR', 'check_fault_recorder');			#measurement 1
		  $fault_struct = PD_ReadFaultMemory();
	
	S_teststep("Set the volatage to '$tcpar_Voltage_2' and wait for '$tcpar_time' ms then check fault recorder.", 'AUTO_NBR', 'set_the_volatage');			#measurement 2
	   	if ($tcpar_Voltage_2 eq 'NormalVoltage') {
    		LC_SetVoltage('U_BATT_DEFAULT');
    	}
    	elsif ($tcpar_Voltage_2 eq 'LowVoltage') {
    		LC_SetVoltage('U_BATT_UNDERVOLTAGE');
    	}
    	else {
    	 	LC_SetVoltage('U_BATT_OVERVOLTAGE');
    	}
    	S_wait_ms( $tcpar_time );	
    	
    	$fault_struct_voltage = PD_ReadFaultMemory();
    	

	S_teststep("Set ECU to Plant mode and Reset The ECU then check ECU mode.", 'AUTO_NBR', 'set_ecu_to');			#measurement 3
		if ($tcpar_Plant_mode eq 'Mazda plant mode') {
			PD_Device_configuration( 'set', ['CustMazdaPlantMode'] );
			S_wait_ms(1000);
		}
		else {  #Bosch Plant Mode
			GEN_setECUMode('PlantMode7_ElectronicFiringMode');
			S_wait_ms(10000);
		}
	    

	S_teststep("Reset ECU and wait 4s then chek state of '$tcpar_DHSWL_signal'.", 'AUTO_NBR', 'reset_ecu_and');			#measurement 4
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();		
		GEN_printComment("-----Measuring the lamp signal after 4s from IGN ON -----");
		S_wait_ms(4000);
		foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_0_4) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_0_4 =~ s/0x//;
		  push( @Provetime_Obt_0_4_arr, hex($Provetime_Obt_0_4) );
		  S_wait_ms(500);		  
		}	

	S_teststep("Check '$tcpar_DHSWL_signal' for 2s after 6s from IGN ON", 'AUTO_NBR', 'wait_2s_and');			#measurement 5
		GEN_printComment("-----Measuring the lamp signal within 2s from 6s -> 8s from IGN ON -----");
		S_wait_ms(150);
		foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_6_8) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_6_8 =~ s/0x//;
		  push( @Provetime_Obt_6_8_arr, hex($Provetime_Obt_6_8) );
		  S_wait_ms(500);		  
		}

	S_teststep("Check '$tcpar_DHSWL_signal' after 8s from IGN ON with updated expected value.", 'AUTO_NBR', 'waits_05s_and');			#measurement 6
	     S_wait_ms(150);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8 =~ s/0x//;
		  push( @Provetime_Obt_8_arr, hex($Provetime_Obt_8) );
		  S_wait_ms(500);
		}
	

	return 1;
}

sub TC_evaluation {

	S_teststep_expected(" DHSWL Fault: '$tcpar_Fault' is in '$tcpar_Fault_state'.", 'check_fault_recorder');			#evaluation 1
 		 if ($tcpar_Fault eq 'No fault') {
  		   		PD_check_fault_status( $fault_struct, $tcpar_Fault, '0' );
		 }
   		 else {
    	    	PD_check_fault_status( $fault_struct, $tcpar_Fault, '0bxxxx1x11' );
     	 }	
    	 push(my @state,@{$fault_struct->{'state'}});
    	 push(my @flt,@{$fault_struct->{'fault_text'}});			
    	 
     	 my $len = scalar(@flt);
     	 if($len == 0){
     			S_teststep_detected("No Fault is Qualified ", 'check_fault_recorder');	 
     	 }      
     	 else {
	     		S_teststep_detected("Fault '@flt' is in state '@state' ", 'check_fault_recorder');	 
     	 }      	 
	  	

	S_teststep_expected("Voltage Fault: '$tcpar_Fault_Voltage' is in '$tcpar_Fault_Voltage_state'.", 'set_the_volatage');			#evaluation 2
	 	if ($tcpar_Voltage_2 eq 'NormalVoltage') {
	 		 PD_check_fault_status( $fault_struct_voltage, 'rb_pom_VbatLow_flt', '0' );
	 		 PD_check_fault_status( $fault_struct_voltage, 'rb_pom_VbatHigh_flt', '0' );
	 	}
   		elsif ($tcpar_Voltage_2 eq 'LowVoltage') {
    	    PD_check_fault_status( $fault_struct_voltage, $tcpar_Fault_Voltage, '0bxxxx1x11' );
   		}
    	else {
			 PD_check_fault_status( $fault_struct_voltage, $tcpar_Fault_Voltage, '0bxxxx1x11' );
    	}
    	push(my @state1,@{$fault_struct_voltage->{'state'}});
    	push(my @flt1,@{$fault_struct_voltage->{'fault_text'}});			
     	my $len = scalar(@flt1);
     	if($len == 0){
     		S_teststep_detected("No Fault is in state Qualified ", 'set_the_volatage');	 
     	}      
     	else {
 			S_teststep_detected("Fault '@flt1' is in state '@state1' ", 'set_the_volatage');
     	} 		
		
		
	S_teststep_expected("ECU is in Plant mode", 'set_ecu_to');			#evaluation 3
		if ($tcpar_Plant_mode eq 'Mazda plant mode') {
		}
		else {  #Bosch Plant Mode
			my $checkECUMode = PD_ReadMemoryByName('rb_sycg_PlantModes_dfst.rb_sycg_ActivePlantModes_au8(0)');
			my $CheckValue = S_aref2dec($checkECUMode, 'U8');
			S_w2rep("ECU check mode variable value:  $CheckValue");
			if ($CheckValue == 64){
				S_set_verdict('VERDICT_PASS');
			}
			else {
				S_set_verdict('VERDICT_FAIL');
			}
		}
		S_teststep_detected("Check ECU mode by Manual method",'set_ecu_to');
	    			
	    
	S_teststep_expected("'$tcpar_DHSWL_signal' shall be in '$tcpar_ON_State' for '$tcpar_ON_time_ms' from IGN ON.", 'reset_ecu_and');			#evaluation 4
	   foreach (@Provetime_Obt_0_4_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_ON_time_ms' from IGN ON :",	$_, "==", $tcpar_ON_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'reset_ecu_and');	   
	   }	

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be   '$tcpar_OFF_State' for '$tcpar_OFF_time_ms'.", 'wait_2s_and');			#evaluation 5
	   foreach (@Provetime_Obt_6_8_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_OFF_State' from from 6s -> 8s from IGN ON :", $_, "==", $tcpar_OFF_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'wait_2s_and');	   
	   }	
	

	S_teststep_expected("'$tcpar_DHSWL_signal' is in '$tcpar_Real_State' after '$tcpar_ProveOut_Time' from IGN ON.", 'waits_05s_and');			#evaluation 6
	   foreach (@Provetime_Obt_8_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'waits_05s_and');	   
	   }	
	

	return 1;
}

sub TC_finalization {
	S_wait_ms(2000);
	if ($tcpar_Fault eq 'No fault') {
	}
	else {
		 	 if ($tcpar_Fault =~ m/(.*)PCS2(.*)/)                #use TSG4 remove  fault *PCS1* to create *PCS2/3* fault due to PCS1/2/3 use same pin
		 	 {
		 	 	my $temp = "$1PCS1$2";
				GEN_printComment("Temp fault is $temp");
		        FM_removeFault($temp); #used for TSG4	
			 }	
			 elsif ($tcpar_Fault =~ m/(.*)PCS3(.*)/) 	{
		 	 	my $temp = "$1PCS1$2";			 	
				GEN_printComment("Temp fault is $temp");
		        FM_removeFault($temp); #used for TSG4	
			 }
			 else {}
	         FM_removeFault($tcpar_Fault); #Remove fault condition from TSG4	
	         S_wait_ms( 5000 );	
	}	

	if ($tcpar_Plant_mode eq 'Mazda plant mode') {
		PD_Device_configuration( 'clear', ['CustMazdaPlantMode'] );	
     	S_wait_ms( 1000 );
    }
	else {  #Bosch Plant Mode
			my $status = GEN_setECUMode('RemovePlantModes');
			if ($status == 0) {
				S_set_verdict('VERDICT_FAIL');
			}
			else {
				S_set_verdict('VERDICT_PASS');
			}
		}

	
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}


1;
