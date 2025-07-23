#### TEST CASE MODULE
package TC_DHSWIM_Proveout_Steady_ITM_NotFinish;

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
use INCLUDES_Project;    #necessary

#include further modules here
use LIFT_labcar;
use LIFT_can_access;
use FuncLib_TNT_FM;
use LIFT_evaluation;
use LIFT_PD;
use GENERIC_DCOM;
##################################

our $PURPOSE = "Check behavior of DHSWL after Proveout time if ITM mode is not finished";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_Proveout_Steady_ITM_NotFinish

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set The voltage to <Voltage> and check fault recorder.

2. Create <Fault> condition to keep ECU in ITM mode after <ProveOut_Time> and wait for <Fault_Qua_Time>.

3. Reset ECU.

4. Wait for <ProveOut_Time>

5. Check fault recorder.

6. Check ECU mode.

7. Check state of <DHSWL_signal> after <ProveOut_Time> from IGN ON.


I<B<Evaluation>>

1. <Fault_Voltage> is in <Fault_Voltage_state>.

2.

3.

4.

5. <Fault> is in <Fault_state> and <Fault_Voltage> in <Fault_Voltage_State>.

6. ECU goes to ITM mode.

7. <DHSWL_signal> shall be 0x1.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Voltage' => 
	SCALAR 'Fault' => 
	SCALAR 'Fault_state' => 
	SCALAR 'Fault_Qua_Time' => 
	SCALAR 'Fault_Voltage' => 
	SCALAR 'Fault_Voltage_State' => 
	SCALAR 'ProveOut_Time' => 
	SCALAR 'DHSWL_signal' => 


=head2 PARAMETER EXAMPLES

	purpose = 'check behavior of DHSWL after Proveout time if ITM mode is not finished'
	
	Voltage = '<Test Heading>'
	Fault = 'rb_swm_OpenLineSPSFD_flt'
	Fault_state = 'Qualified'
	Fault_Qua_Time = '2000' #ms
	Fault_Voltage = 'No fault'
	Fault_Voltage_State = 'Empty'
	ProveOut_Time = '8000' #ms  (+/-300ms)
	DHSWL_signal = 'DHS_RILReq'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Voltage;
my $tcpar_Fault;
my $tcpar_Fault_state;
my $tcpar_Fault_Qua_Time;
my $tcpar_Fault_Voltage;
my $tcpar_Voltage_state;
my $tcpar_ProveOut_Time;
my $tcpar_DHSWL_signal;
################ global parameter declaration ###################
#add any global variables here
my $Provetime_Obt_8_ITM;
my @Provetime_Obt_8_ITM_arr;
my $Provetime_Obt_8;
my @Provetime_Obt_8_arr;
my $fault_struct_voltage;
my $fault_struct;
my $checkECUMode;
my $CheckValue;
my $flag = 0;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Voltage =  GEN_Read_mandatory_testcase_parameter( 'Voltage' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Fault_state =  GEN_Read_mandatory_testcase_parameter( 'Fault_state' );
	$tcpar_Fault_Qua_Time =  GEN_Read_mandatory_testcase_parameter( 'Fault_Qua_Time' );
	$tcpar_Fault_Voltage =  GEN_Read_mandatory_testcase_parameter( 'Fault_Voltage' );
	$tcpar_Voltage_state =  GEN_Read_mandatory_testcase_parameter( 'Fault_Voltage_State' );
	$tcpar_ProveOut_Time =  GEN_Read_mandatory_testcase_parameter( 'ProveOut_Time' );
	$tcpar_DHSWL_signal =  GEN_Read_mandatory_testcase_parameter( 'DHSWL_signal' );

	return 1;
}

sub TC_initialization {
	S_teststep( "StandardPrepNoFault", 'AUTO_NBR' );
	CA_trace_start();
	GEN_StandardPrepNoFault();
	PD_ClearFaultMemory();
	S_wait_ms(5000);  

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set The voltage to '$tcpar_Voltage' and check fault recorder.", 'AUTO_NBR', 'set_the_voltage');			#measurement 1
	   LC_SetVoltage('U_BATT_DEFAULT');
	   LC_ECU_On();
       #test
       $fault_struct_voltage = PD_ReadFaultMemory();	   
	   
       S_wait_ms( $tcpar_ProveOut_Time );
       
	   	if ($tcpar_Voltage eq 'LowVoltage') {
    		LC_SetVoltage('U_BATT_UNDERVOLTAGE');
    	}
    	elsif ($tcpar_Voltage eq 'HighVoltage') {
    		LC_SetVoltage('U_BATT_OVERVOLTAGE');
    	}
    	else {
    	 	LC_SetVoltage('U_BATT_DEFAULT');
    	}
    	S_wait_ms( 10000 );
    	
    	$fault_struct_voltage = PD_ReadFaultMemory();
       		

	S_teststep("Create '$tcpar_Fault' condition to keep ECU in ITM mode after '$tcpar_ProveOut_Time' and wait for '$tcpar_Fault_Qua_Time'.", 'AUTO_NBR');
		#FM_createFault($tcpar_Fault); #used for TSG4
		PD_Device_configuration ('clear', ['CentralSensorMain']);	
		S_wait_ms( $tcpar_Fault_Qua_Time + 5000);	
		    
		    
	S_teststep("Reset ECU.", 'AUTO_NBR');
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	  
		
	S_teststep("Wait for '$tcpar_ProveOut_Time'", 'AUTO_NBR');
		S_wait_ms($tcpar_ProveOut_Time + 100); 

	S_teststep("Check fault recorder.", 'AUTO_NBR', 'check_fault_recorder');			#measurement 2
		$fault_struct = PD_ReadFaultMemory();

	S_teststep("Check ECU mode.", 'AUTO_NBR', 'check_ecu_mode');			#measurement 3
		$checkECUMode = PD_ReadMemoryByName('rb_bswm_ActualSystemMode_au16(0)');
		$CheckValue = S_aref2dec($checkECUMode, 'U16');

     
	     			    		

	S_teststep("Check state of '$tcpar_DHSWL_signal' after '$tcpar_ProveOut_Time' from IGN ON.", 'AUTO_NBR', 'check_state_of');			#measurement 4
	     # Get value with "ITM expand" status 
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_ITM) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_ITM =~ s/0x//;
		  push( @Provetime_Obt_8_ITM_arr, hex($Provetime_Obt_8_ITM) );
 	      S_wait_ms(500);
	     }			

	 	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Voltage Fault: '$tcpar_Fault_Voltage' is in state'$tcpar_Voltage_state'.", 'set_the_voltage');			#evaluation 1
	 	if ($tcpar_Voltage eq 'NormalVoltage') {
	 	}
   		elsif ($tcpar_Voltage eq 'LowVoltage') {
    	     PD_check_fault_status( $fault_struct_voltage, $tcpar_Fault_Voltage, '0bxxxx1x11' );
   		}
    	else {
			 PD_check_fault_status( $fault_struct_voltage, $tcpar_Fault_Voltage, '0bxxxx1x11' );
    	 }      
    	push(my @state,@{$fault_struct_voltage->{'state'}});
    	push(my @flt,@{$fault_struct_voltage->{'fault_text'}});			
    	    		
 			my $len = scalar(@flt);
     			if($len == 0){
    				S_teststep_detected("No Fault is Qualified", 'set_the_voltage');
    			}
    			else {
    				S_teststep_detected("Fault '@flt' is in state '@state' ", 'set_the_voltage');
    			}    			     	    	
    	    	  			     	    	
    	    	    	    		
    	    		

	S_teststep_expected("ITM Expand Fault: '$tcpar_Fault' is in state '$tcpar_Fault_state', and Voltage Fault: '$tcpar_Fault_Voltage' in state '$tcpar_Voltage_state'.", 'check_fault_recorder');			#evaluation 2
    	    	my $flag = PD_check_fault_status( $fault_struct, $tcpar_Fault, '0bxxxx1x11' );	
    			push(my @state1,@{$fault_struct->{'state'}});
		    	push(my @flt1,@{$fault_struct->{'fault_text'}});			
    			my $len = scalar(@flt1);
     			if($len == 0){
    				S_teststep_detected("No Fault is Qualified", 'check_fault_recorder');
    			}
    			else {
    				S_teststep_detected("Fault '@flt1' is in state '@state1' ", 'check_fault_recorder');
    			}    			     	    	
    	    	

    	    	

	S_teststep_expected("ECU ITM not finished", 'check_ecu_mode');			#evaluation 3
		S_w2rep("ECU check mode variable value:  $CheckValue");
		if($CheckValue == 2){
			GEN_printComment("ITM Expand");
			S_set_verdict('VERDICT_PASS');
		}
		else
		{
			GEN_printComment("NO ITM EXPAND");
			S_set_verdict('VERDICT_FAIL');
		}		
		S_teststep_detected("ECU Mode value is: $CheckValue  (Init Mode Value is 2) ", 'check_ecu_mode');
	

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be 0x1.", 'check_state_of');			#evaluation 4
	   foreach (@Provetime_Obt_8_ITM_arr) {
	   		EVAL_evaluate_value( "Observed value in 'ITM Expand status' from 8s from IGN ON :", $_, "==", '1');
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'check_state_of');			   		
	   }
	   
	
	return 1;
}

sub TC_finalization {
	S_wait_ms(2000);
	#FM_removeFault($tcpar_Fault); #Remove fault condition from TSG4	
	PD_Device_configuration ('set', ['CentralSensorMain']); 
	S_wait_ms(5000);  
	PD_ClearFaultMemory();
	S_wait_ms(5000);  
	return 1;
}


1;
