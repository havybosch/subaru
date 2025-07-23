#### TEST CASE MODULE
package TC_DHSWIM_PowerDown_Steady;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.2 $;
our $HEADER = q$Header: TCs/TCs_Project/DHSWL/ProveOut_Steady/TC_DHSWIM_PowerDown_Steady.pm 1.2 2018/10/03 09:12:52ICT HQA1HC develop  $;

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

our $PURPOSE = "Check behavior of DHSWL in normal mode when power is cut off";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_PowerDown_Steady

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. IGN on

2. Wait for <Proveout_time> ECU in steady state

3. Read WL <DHSWL_signal> status

4. IGN off

5. Read WL status <DHSWL_signal> until the power is off completely

6. IGN on

7. Wait for <Proveout_time> ECU ready

8. Set voltage to <Voltage> and Wait <t_Qual> for <Fault_Voltage> qualified

9. Read fault recorder

10. Read WL status <DHSWL_signal> 

11. IGN off

12. Read WL status <DHSWL_signal> until the power is off completely


I<B<Evaluation>>

1. 

2. 

3. <DHSWL_signal> should be <Value_Off>

4. 

5. <DHSWL_signal> should be <Value_Off> continuosly till power off

6. 

7. 

8. 

9. <Fault_Voltage> is qualified 

10. <DHSWL_signal> should be <Value2>

11. 

12. <DHSWL_signal> should be <Value2> continously till power off


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Fault_Voltage' => 
	SCALAR 'purpose' => 
	SCALAR 'DHSWL_signal' => 
	SCALAR 'Voltage' => 
	SCALAR 'Value_Off' => 
	SCALAR 'Proveout_time' => 
	SCALAR 't_Qual' => 
	SCALAR 'Value2' => 


=head2 PARAMETER EXAMPLES

	purpose = 'Check behavior of DHSWL in normal mode when power is cut off'
	
	DHSWL_signal = 'DHS_RILReq'
	Voltage = '<Test Heading 1>'
	Value_Off = '0'
	Proveout_time = '8000' #ms  (+/-300ms)
	t_Qual = '0' #ms
	Value2 = '0'
	Fault_Voltage = 'Empty'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_DHSWL_signal;
my $tcpar_Voltage;
my $tcpar_Value_Off;
my $tcpar_Proveout_time;
my $tcpar_t_Qual;
my $tcpar_Value2;
my $tcpar_Fault_Voltage;

################ global parameter declaration ###################
#add any global variables here
my $fault_struct;
my $Provetime_Obt_8;
my $Provetime_Obt_8_after;
my $Provetime_Obt_8_poweroff;
my $Provetime_Obt_8_after_poweroff;
my @Provetime_Obt_8_arr;
my @Provetime_Obt_8_after_arr;
my @Provetime_Obt_8_poweroff_arr;
my @Provetime_Obt_8_after_poweroff_arr;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_DHSWL_signal =  GEN_Read_mandatory_testcase_parameter( 'DHSWL_signal' );
	$tcpar_Voltage =  GEN_Read_mandatory_testcase_parameter( 'Voltage' );
	$tcpar_Value_Off =  GEN_Read_mandatory_testcase_parameter( 'Value_Off' );
	$tcpar_Proveout_time =  GEN_Read_mandatory_testcase_parameter( 'Proveout_time' );
	$tcpar_t_Qual =  GEN_Read_mandatory_testcase_parameter( 't_Qual' );
	$tcpar_Value2 =  GEN_Read_mandatory_testcase_parameter( 'Value2' );
	$tcpar_Fault_Voltage =  GEN_Read_mandatory_testcase_parameter( 'Fault_Voltage' );

	return 1;
}

sub TC_initialization {

	S_teststep( "StandardPrepNoFault", 'AUTO_NBR' );
	CA_trace_start();
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("IGN on", 'AUTO_NBR');
	   LC_SetVoltage('U_BATT_DEFAULT');
	   LC_ECU_On();
	   
	S_teststep("Wait for '$tcpar_Proveout_time' ECU in steady state", 'AUTO_NBR');
       S_wait_ms( $tcpar_Proveout_time );	

	S_teststep("Read WL '$tcpar_DHSWL_signal' status", 'AUTO_NBR', 'read_wl_dhswl');			#measurement 1
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8 =~ s/0x//;
		  push( @Provetime_Obt_8_arr, hex($Provetime_Obt_8) );
      	  S_wait_ms( 500 );
		}
		
	S_teststep("IGN off", 'AUTO_NBR');
		LC_ECU_Off();

	S_teststep("Read WL status '$tcpar_DHSWL_signal' until the power is off completely", 'AUTO_NBR', 'read_wl_status_A');			#measurement 2
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		   ($Provetime_Obt_8_poweroff) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		   $Provetime_Obt_8_poweroff =~ s/0x//;
		   push( @Provetime_Obt_8_poweroff_arr, hex($Provetime_Obt_8_poweroff) );
      	   S_wait_ms( 100 );
		 }
    	S_wait_ms( 'TIMER_ECU_OFF' );
		
		
	S_teststep("IGN on", 'AUTO_NBR');
	   LC_ECU_On();

	S_teststep("Wait for '$tcpar_Proveout_time' ECU ready", 'AUTO_NBR');
       S_wait_ms( $tcpar_Proveout_time );	

	S_teststep("Set voltage to '$tcpar_Voltage' and Wait '$tcpar_t_Qual' for '$tcpar_Fault_Voltage' qualified", 'AUTO_NBR');
	   	if ($tcpar_Voltage eq 'LowVoltage') {
    		LC_SetVoltage('LowVoltage');
    	}
    	elsif ($tcpar_Voltage eq 'HighVoltage') {
    		LC_SetVoltage('HighVoltage');
    	}
    	else {
    	 	LC_SetVoltage('NormalVoltage');
    	}
    	S_wait_ms( 10000 );
	
	S_teststep("Read fault recorder", 'AUTO_NBR', 'read_fault_recorder');			#measurement 3
		$fault_struct = PD_ReadFaultMemory(1);

	S_teststep("Read WL status '$tcpar_DHSWL_signal' ", 'AUTO_NBR', 'read_wl_status_B');			#measurement 4
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after =~ s/0x//;
		  push( @Provetime_Obt_8_after_arr, hex($Provetime_Obt_8_after) );
      	  S_wait_ms( 500 );
		}
		
		
	S_teststep("IGN off", 'AUTO_NBR');
		LC_ECU_Off();

	S_teststep("Read WL status '$tcpar_DHSWL_signal' until the power is off completely", 'AUTO_NBR', 'read_wl_status_C');			#measurement 5
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_poweroff) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after_poweroff =~ s/0x//;
		 push( @Provetime_Obt_8_after_poweroff_arr, hex($Provetime_Obt_8_after_poweroff) );
      	  S_wait_ms( 100 );
		}
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_DHSWL_signal' should be '$tcpar_Value_Off'", 'read_wl_dhswl');			#evaluation 1
	   foreach (@Provetime_Obt_8_arr) {
	   		EVAL_evaluate_value( "Observed value in '$_' at 8s from IGN ON :", $_, "==", $tcpar_Value_Off );
			S_teststep_detected("Observed value after each 500ms:: '$_' ", 'read_wl_dhswl');	   		
	   }	

	S_teststep_expected("'$tcpar_DHSWL_signal' should be '$tcpar_Value_Off' continuosly till power off", 'read_wl_status_A');			#evaluation 2
	   foreach (@Provetime_Obt_8_poweroff_arr) {
	  		EVAL_evaluate_value( "Observed value in '$_' at Autarky time :", $_, "==", $tcpar_Value_Off );
			S_teststep_detected("Observed value after each 100ms: '$_' ", 'read_wl_status_A');			  		
	   }	
	

	S_teststep_expected("'$tcpar_Fault_Voltage' is qualified ", 'read_fault_recorder');			#evaluation 3
	
	 	if ($tcpar_Voltage eq 'NormalVoltage') {
	 		 PD_check_fault_status( $fault_struct, 'rb_pom_VbatLow_flt', '0' );
	 		 PD_check_fault_status( $fault_struct, 'rb_pom_VbatHigh_flt', '0' );
	 	}
   		elsif ($tcpar_Voltage eq 'LowVoltage') {
    	    PD_check_fault_status( $fault_struct, $tcpar_Fault_Voltage, '0bxxxx1x11' );
   		}
    	else {
			 PD_check_fault_status( $fault_struct, $tcpar_Fault_Voltage, '0bxxxx1x11' );
    	 }
    	 
    	push(my @state,@{$fault_struct->{'state'}});
    	push(my @flt,@{$fault_struct->{'fault_text'}});	
     		my $len = scalar(@flt);
     		if($len == 0){
     			S_teststep_detected("No Fault is Qualified ", 'read_fault_recorder');	 
     		}      
     		else {
	     		S_teststep_detected("Fault '@flt' is in state '@state' ", 'read_fault_recorder');	 
     		}        	    
    		    
        
    	
    	
	S_teststep_expected("'$tcpar_DHSWL_signal' should be '$tcpar_Value2'", 'read_wl_status_B');			#evaluation 4
	   foreach (@Provetime_Obt_8_after_arr) {
	   		EVAL_evaluate_value( "Observed value in '$_' at 8s from IGN ON :", $_, "==", $tcpar_Value2 );
			S_teststep_detected("Observed value after each 500ms:: '$_' ", 'read_wl_status_B');		   		
	   }	
		

	S_teststep_expected("'$tcpar_DHSWL_signal' should be '$tcpar_Value2' continously till power off", 'read_wl_status_C');			#evaluation 5
	   foreach (@Provetime_Obt_8_after_poweroff_arr) {
	   		EVAL_evaluate_value( "Observed value in '$_' Autarky time :", $_, "==", $tcpar_Value2 );
			S_teststep_detected("Observed value after each 100ms:: '$_' ", 'read_wl_status_C');	   
	   }	
	   
	   
	return 1;
}

sub TC_finalization {
	S_teststep("IGN on", 'AUTO_NBR');
	LC_ECU_On();
	S_wait_ms(2000);
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}


1;
