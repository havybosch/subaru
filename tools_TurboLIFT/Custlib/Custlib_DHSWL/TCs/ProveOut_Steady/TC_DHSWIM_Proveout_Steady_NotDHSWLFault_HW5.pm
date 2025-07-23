#### TEST CASE MODULE
package TC_DHSWIM_Proveout_Steady_NotDHSWLFault_HW5;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER = q$Header: TCs/TCs_Project/DHSWL/ProveOut_Steady/TC_DHSWIM_Proveout_Steady_NotDHSWLFault_HW5.pm 1.1 2018/10/03 09:34:54ICT HQA1HC develop  $;

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

our $PURPOSE = "Check behavior of DHSWL when Faults not related to DHSWL qualified";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_Proveout_Steady_NotDHSWLFault_HW5

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. IGN ON and wait for <ProveOut_Time>

2. Create <Fault> condition and wait for time <t_Qual> ms and Reset ECU

3. Check fault recorder

4. Wait 4s since IGN On and chek state of <DHSWL_signal>.

5. Check <DHSWL_signal> for 2s after 6s from IGN ON.

6. Check <DHSWL_signal> after 8s from IGN ON with updated expected value.

7. Reset ECU  check state of <DHSWL_signal> after <ProveOut_Time>.

8. Execute step 7 for 4 times.

9. Remove <Fault> condition, wait for <t_Dequal>

10. Reset ECU and check fault recorder 

11. Check state of  <DHSWL_signal> after <ProveOut_Time>.

12. Reset ECU check state of <DHSWL_signal> after <ProveOut_Time>.

13. Execute step 12 for 4 times


I<B<Evaluation>>

1.

2.  

3. <Fault> is in <Fault_state>

4. <DHSWL_signal> shall be in <ON_State> for <ON_time_ms> from IGN ON 

5.<DHSWL_signal> shall be   <OFF_State> for <OFF_time_ms>.

6. <DHSWL_signal> is in <Real_State> after <ProveOut_Time> from IGN ON.

7. <DHSWL_signal> is in <Real_State> depend on <Fault_state> after <ProveOut_Time>.

8. The output is expected as step 7 output for 4 times

9.

10. <Fault> is in <Fault_state_after> 

11. <DHSWL_signal> is in <Real_State> after <ProveOut_Time>.

12. <DHSWL_signal> is in <Real_State> after <ProveOut_Time>.

13. The output is expected as step 12 output for 4 times.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Fault_state' => 
	SCALAR 'Real_State' => 
	SCALAR 'Fault_state_after' => 
	SCALAR 'Fault' => 
	SCALAR 'purpose' => 
	SCALAR 'ON_time_ms' => 
	SCALAR 'OFF_time_ms' => 
	SCALAR 'ProveOut_Time' => 
	SCALAR 'ON_State' => 
	SCALAR 'OFF_State' => 
	SCALAR 't_Qual' => 
	SCALAR 't_Dequal' => 
	SCALAR 'DHSWL_signal' => 


=head2 PARAMETER EXAMPLES

	purpose = 'Check behavior of DHSWL when Faults not related to DHSWL qualified'
	ON_time_ms = '6000' #ms (+/-150ms)
	OFF_time_ms = '2000' #ms (+/-150ms)
	ProveOut_Time = '8000' #ms  (+/-300ms)
	ON_State = '1'
	OFF_State = '0'
	t_Qual = '2000' #ms
	t_Dequal = '2000' #ms
	DHSWL_signal = 'DHS_RILReq'
	
	Fault_state = 'Qualified'
	Real_State = '0'
	Fault_state_after = 'Dequalified'
	Fault = 'rb_sqm_SquibResistanceOpenAB1FD_flt'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_ON_time_ms;
my $tcpar_OFF_time_ms;
my $tcpar_ProveOut_Time;
my $tcpar_ON_State;
my $tcpar_OFF_State;
my $tcpar_t_Qual;
my $tcpar_t_Dequal;
my $tcpar_DHSWL_signal;
my $tcpar_Fault_state;
my $tcpar_Real_State;
my $tcpar_Fault_state_after;
my $tcpar_Fault;

################ global parameter declaration ###################
#add any global variables here
my $fault_struct;
my $fault_struct_after;

my $Provetime_Obt_0_4;
my $Provetime_Obt_6_8;
my $Provetime_Obt_8;
my $Provetime_Obt_8_reset;
my $Provetime_Obt_8_reset_1;
my $Provetime_Obt_8_reset_2;
my $Provetime_Obt_8_reset_3;
my $Provetime_Obt_8_reset_4;
my $Provetime_Obt_8_after;
my $Provetime_Obt_8_after_reset;
my $Provetime_Obt_8_after_reset_1;
my $Provetime_Obt_8_after_reset_2;
my $Provetime_Obt_8_after_reset_3;
my $Provetime_Obt_8_after_reset_4;
my $Provetime_Obt_8_ITM;

my @Provetime_Obt_0_4_arr;
my @Provetime_Obt_6_8_arr;
my @Provetime_Obt_8_arr;
my @Provetime_Obt_8_reset_arr;
my @Provetime_Obt_8_reset_1_arr;
my @Provetime_Obt_8_reset_2_arr;
my @Provetime_Obt_8_reset_3_arr;
my @Provetime_Obt_8_reset_4_arr;
my @Provetime_Obt_8_after_arr;
my @Provetime_Obt_8_after_reset_arr;
my @Provetime_Obt_8_after_reset_1_arr;
my @Provetime_Obt_8_after_reset_2_arr;
my @Provetime_Obt_8_after_reset_3_arr;
my @Provetime_Obt_8_after_reset_4_arr;
my @Provetime_Obt_8_ITM_arr;


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_ON_time_ms =  GEN_Read_mandatory_testcase_parameter( 'ON_time_ms' );
	$tcpar_OFF_time_ms =  GEN_Read_mandatory_testcase_parameter( 'OFF_time_ms' );
	$tcpar_ProveOut_Time =  GEN_Read_mandatory_testcase_parameter( 'ProveOut_Time' );
	$tcpar_ON_State =  GEN_Read_mandatory_testcase_parameter( 'ON_State' );
	$tcpar_OFF_State =  GEN_Read_mandatory_testcase_parameter( 'OFF_State' );
	$tcpar_t_Qual =  GEN_Read_mandatory_testcase_parameter( 't_Qual' );
	$tcpar_t_Dequal =  GEN_Read_mandatory_testcase_parameter( 't_Dequal' );
	$tcpar_DHSWL_signal =  GEN_Read_mandatory_testcase_parameter( 'DHSWL_signal' );
	$tcpar_Fault_state =  GEN_Read_mandatory_testcase_parameter( 'Fault_state' );
	$tcpar_Real_State =  GEN_Read_mandatory_testcase_parameter( 'Real_State' );
	$tcpar_Fault_state_after =  GEN_Read_mandatory_testcase_parameter( 'Fault_state_after' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );

	return 1;
}

sub TC_initialization {

	S_teststep( "StandardPrepNoFault", 'AUTO_NBR' );
	CA_trace_start();
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("IGN ON and wait for '$tcpar_ProveOut_Time'", 'AUTO_NBR');
	   LC_SetVoltage('U_BATT_DEFAULT');
	   LC_ECU_On();
       S_wait_ms( $tcpar_ProveOut_Time );	

	S_teststep("Create '$tcpar_Fault' condition and wait for time '$tcpar_t_Qual' ms and Reset ECU", 'AUTO_NBR');
		if ($tcpar_Fault =~ m/^rb_csem/i) {
			#add later for Fault created by Manitoo  
		}	
		elsif ($tcpar_Fault =~ m/^rb_evm_FrontCrash/i) {
			#add later for Fault created by Quate
		}
		elsif ($tcpar_Fault =~ m/^@/i) {
			#add later for Fault created by Manitoo  
		} 
		else {
			FM_createFault($tcpar_Fault); #used for TSG4	
		    S_wait_ms( $tcpar_t_Qual );				
		} 
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	  
		S_wait_ms($tcpar_ProveOut_Time);    	

	S_teststep("Check fault recorder and Reset ECU", 'AUTO_NBR', 'check_fault_recorder');			#measurement 1
		$fault_struct = PD_ReadFaultMemory(1);
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();		
	

	S_teststep("Wait 4s since IGN On and chek state of '$tcpar_DHSWL_signal'.", 'AUTO_NBR', 'wait_4s_since');			#measurement 2
		S_wait_ms(4000);
		foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_0_4) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_0_4 =~ s/0x//;
		  push( @Provetime_Obt_0_4_arr, hex($Provetime_Obt_0_4) );
		  S_wait_ms( 500 );				
		}
	

	S_teststep("Check '$tcpar_DHSWL_signal' for 2s after 6s from IGN ON", 'AUTO_NBR', 'wait_2s_and');			#measurement 3
		S_wait_ms(150);
		foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_6_8) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_6_8 =~ s/0x//;
		  push( @Provetime_Obt_6_8_arr, hex($Provetime_Obt_6_8) );
		  S_wait_ms( 500 );				
		}	

	S_teststep("Waits 0.5s and check '$tcpar_DHSWL_signal' with updated expected value.", 'AUTO_NBR', 'waits_05s_and');			#measurement 4
	     S_wait_ms(150);
	     # Get value with "ITM expand" status 
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_ITM) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_ITM =~ s/0x//;
		  push( @Provetime_Obt_8_ITM_arr, hex($Provetime_Obt_8_ITM) );
		  S_wait_ms( 500 );				
	     }			

	     # Get value with "DHSWL off" status
	     S_wait_ms(6000);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8 =~ s/0x//;
		  push( @Provetime_Obt_8_arr, hex($Provetime_Obt_8) );
		  S_wait_ms( 500 );				
  		 }
		
		
	S_teststep("Reset ECU  check state of '$tcpar_DHSWL_signal' after '$tcpar_ProveOut_Time'.", 'AUTO_NBR', 'reset_ecu__check');			#measurement 5
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 6000);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_reset) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_reset =~ s/0x//;
		  push( @Provetime_Obt_8_reset_arr, hex($Provetime_Obt_8_reset) );
		  S_wait_ms( 500 );				
		}
		
	S_teststep("Execute step 7 for 4 times.", 'AUTO_NBR', 'execute_step_7');			#measurement 6
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 6000);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_reset_1) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_reset_1 =~ s/0x//;
		  push( @Provetime_Obt_8_reset_1_arr, hex($Provetime_Obt_8_reset_1) );
		  S_wait_ms( 500 );				
		}
		
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 6000);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_reset_2) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_reset_2 =~ s/0x//;
		  push( @Provetime_Obt_8_reset_2_arr, hex($Provetime_Obt_8_reset_2) );
		  S_wait_ms( 500 );				
		}
		
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 6000);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_reset_3) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_reset_3 =~ s/0x//;
		  push( @Provetime_Obt_8_reset_3_arr, hex($Provetime_Obt_8_reset_3) );
		  S_wait_ms( 500 );				
		}
		
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 6000);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_reset_4) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_reset_4 =~ s/0x//;
		  push( @Provetime_Obt_8_reset_4_arr, hex($Provetime_Obt_8_reset_4) );
		  S_wait_ms( 500 );				
		}
		
	S_teststep("Remove '$tcpar_Fault' condition, wait for '$tcpar_t_Dequal'", 'AUTO_NBR');
		if ($tcpar_Fault =~ m/^rb_csem/i) {
			#add later for Fault created by Manitoo  
		}	
		elsif ($tcpar_Fault =~ m/^rb_evm_FrontCrash/i) {
			#add later for Fault created by Quate
		}
		elsif ($tcpar_Fault =~ m/^@/i) {
			#add later for Fault created by Manitoo  
		} 
		else {
			FM_removeFault($tcpar_Fault); #used for TSG4	
		    S_wait_ms( $tcpar_t_Dequal );						  
		} 
		  
		  
	S_teststep("Reset ECU and check fault recorder ", 'AUTO_NBR', 'reset_ecu_and');			#measurement 7
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time);
		$fault_struct_after = PD_ReadFaultMemory(1);

	S_teststep("Check state of  '$tcpar_DHSWL_signal' after '$tcpar_ProveOut_Time'.", 'AUTO_NBR', 'check_state_of');			#measurement 8
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after =~ s/0x//;
		 push( @Provetime_Obt_8_after_arr, hex($Provetime_Obt_8_after) );
		  S_wait_ms( 500 );				
		 }
		
	S_teststep("Reset ECU check state of '$tcpar_DHSWL_signal' after '$tcpar_ProveOut_Time'.", 'AUTO_NBR', 'reset_ecu_check');			#measurement 9
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_reset) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after_reset =~ s/0x//;
		  push( @Provetime_Obt_8_after_reset_arr, hex($Provetime_Obt_8_after_reset) );
		  S_wait_ms( 500 );				
		}
		
	S_teststep("Execute step 12 for 4 times", 'AUTO_NBR', 'execute_step_12');			#measurement 10
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_reset_1) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after_reset_1 =~ s/0x//;
		  push( @Provetime_Obt_8_after_reset_1_arr, hex($Provetime_Obt_8_after_reset_1) );
		  S_wait_ms( 500 );				
		}
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_reset_2) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after_reset_2 =~ s/0x//;
		  push( @Provetime_Obt_8_after_reset_2_arr, hex($Provetime_Obt_8_after_reset_2) );
		  S_wait_ms( 500 );				
		}			
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_reset_3) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		   $Provetime_Obt_8_after_reset_3 =~ s/0x//;
		   push( @Provetime_Obt_8_after_reset_3_arr, hex($Provetime_Obt_8_after_reset_3) );
		   S_wait_ms( 500 );				
		}
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_reset_4) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after_reset_4 =~ s/0x//;
		  	push( @Provetime_Obt_8_after_reset_4_arr, hex($Provetime_Obt_8_after_reset_4) );
		  S_wait_ms( 500 );				
		}
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault' is in '$tcpar_Fault_state'", 'check_fault_recorder');			#evaluation 1
		if ($tcpar_Fault =~ m/^@/i) {
			#add later for Fault created by Manitoo  
		} 
		else {
    	    	PD_check_fault_status( $fault_struct, $tcpar_Fault, '0bxxxx1x11' );
		}
    	push(my @state,@{$fault_struct->{'state'}});
    	push(my @flt,@{$fault_struct->{'fault_text'}});			
    	S_teststep_detected("Fault '@flt' is in state '@state' ", 'check_fault_recorder');		      	 
	

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be in '$tcpar_ON_State' for '$tcpar_ON_time_ms' from IGN ON ", 'wait_4s_since');			#evaluation 2
	   foreach (@Provetime_Obt_0_4_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_ON_time_ms' from IGN ON :",	$_, "==", $tcpar_ON_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'wait_4s_since');		   		
	   }	
	

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be   '$tcpar_OFF_State' for '$tcpar_OFF_time_ms'.", 'wait_2s_and');			#evaluation 3
	   foreach (@Provetime_Obt_6_8_arr) {
		   EVAL_evaluate_value( "Observed value in '$tcpar_OFF_State' from from 6s -> 8s from IGN ON :", $_, "==", $tcpar_OFF_State );
		   S_teststep_detected("Observed value after each 500ms: '$_' ", 'wait_2s_and');	   
	   }	
	

	S_teststep_expected("'$tcpar_DHSWL_signal' is in '$tcpar_Real_State' after '$tcpar_ProveOut_Time' from IGN ON.", 'waits_05s_and');			#evaluation 4
	   foreach (@Provetime_Obt_8_ITM_arr) {
	   		if ($tcpar_Fault eq 'rb_sqm_CrosscouplingAB1FD_flt') {
	   				EVAL_evaluate_value( "Observed value in 'ITM Expand status' from 8s from IGN ON :", $_, "==", '0');
	   		}
	  		else {
	   				EVAL_evaluate_value( "Observed value in 'ITM Expand status' from 8s from IGN ON :", $_, "==", $tcpar_Real_State);
	  		}
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'waits_05s_and');	  		
	   }
	   
	   foreach (@Provetime_Obt_8_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from 12s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'waits_05s_and');	   		
	   }	   
	   

	S_teststep_expected("'$tcpar_DHSWL_signal' is in '$tcpar_Real_State' depend on '$tcpar_Fault_state' after '$tcpar_ProveOut_Time'.", 'reset_ecu__check');			#evaluation 5
	   foreach (@Provetime_Obt_8_reset_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'reset_ecu__check');	   		
	   }		

	S_teststep_expected("The output is expected as step 7 output for 4 times", 'execute_step_7');			#evaluation 6
	   foreach (@Provetime_Obt_8_reset_1_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_7');		   		
	   }	
	   
	   foreach (@Provetime_Obt_8_reset_2_arr) {
		    EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_7');		   		
	   }
	   
	   foreach (@Provetime_Obt_8_reset_3_arr) {
			EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_7');		   		
	   }
	   
	   foreach (@Provetime_Obt_8_reset_4_arr) {
	        EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_7');		   		
	   }
	   

	S_teststep_expected("'$tcpar_Fault' is in '$tcpar_Fault_state_after' ", 'reset_ecu_and');			#evaluation 7
    	    	PD_check_fault_status( $fault_struct_after, $tcpar_Fault, '0bxxxx1xx0' );
    			push(my @state1,@{$fault_struct_after->{'state'}});
    			push(my @flt1,@{$fault_struct_after->{'fault_text'}});			
    	    	S_teststep_detected("Fault '@flt1' is in state '@state1' ", 'reset_ecu_and');    	    	



	S_teststep_expected("'$tcpar_DHSWL_signal' is in '$tcpar_Real_State' after '$tcpar_ProveOut_Time'.", 'check_state_of');			#evaluation 8
	   foreach (@Provetime_Obt_8_after_arr) {
		   EVAL_evaluate_value( "Observed value in '$_' at 8s from IGN ON :", $_, "==", $tcpar_Real_State );
		   S_teststep_detected("Observed value after each 500ms: '$_' ", 'check_state_of');				   
	   }		

	S_teststep_expected("'$tcpar_DHSWL_signal' is in '$tcpar_Real_State' after '$tcpar_ProveOut_Time'.", 'reset_ecu_check');			#evaluation 9
	   foreach (@Provetime_Obt_8_after_reset_arr) {
	   		EVAL_evaluate_value( "Observed value in '$_' at 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'reset_ecu_check');	   		
	   }	

	S_teststep_expected("The output is expected as step 12 output for 4 times.", 'execute_step_12');			#evaluation 10
	   foreach (@Provetime_Obt_8_after_reset_1_arr) {
	   		EVAL_evaluate_value( "Observed value in '$_' at 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_12');	   		
	   }	
	   foreach (@Provetime_Obt_8_after_reset_2_arr) {
	   		EVAL_evaluate_value( "Observed value in '$_' at 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_12');	   		
	   }	
	   foreach (@Provetime_Obt_8_after_reset_3_arr) {
	   		EVAL_evaluate_value( "Observed value in '$_' at 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_12');	   		
	   }
	   foreach (@Provetime_Obt_8_after_reset_4_arr) {
	   		EVAL_evaluate_value( "Observed value in '$_' in  8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_12');	   		
	   }
	   	

	return 1;
}

sub TC_finalization {
	S_wait_ms(2000);
	if ($tcpar_Fault =~ m/^rb_csem/i) {
	}	
	elsif ($tcpar_Fault =~ m/^rb_evm_FrontCrash/i) {
	}
	elsif ($tcpar_Fault =~ m/^@/i) {
	} 
	else {
		FM_removeFault($tcpar_Fault); #used for TSG4	
	    S_wait_ms( 5000 );				
	}	
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}


1;
