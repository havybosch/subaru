#### TEST CASE MODULE
package TC_DHSWIM_Proveout_Steady_Reset_Sequence;

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

our $PURPOSE = "Check behavior of DHSWL with faulty condition in Reset sequence";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_Proveout_Steady_Reset_Sequence

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. ECU ON and wait for <t_Pre>

2. Create <Fault1> and <Fault2> condition and wait for time <t_Qual> ms

3. Check fault recorder, Reset ECU

4. Wait 4s since IGN On and chek state of <DHSWL_signal>.

5. Check <DHSWL_signal> for 2s after 6s from IGN ON.

6. Check <DHSWL_signal> after 8s from IGN ON with updated expected value.

7. Reset ECU  check state of <DHSWL_signal> after <ProveOut_Time>.

8. Execute step 5 for 4 times.

9. Remove <Fault1> condition, wait for <t_Dequal> and Check fault recorder.

10. Check state of <DHSWL_signal>  after <ProveOut_Time>.

11. Reset ECU  check state of <DHSWL_signal> after <ProveOut_Time>.

12. Execute step 11 for 4 times


I<B<Evaluation>>

1.

2.  

3. <Fault1> is in <Fault_state1> and <Fault2> is in <Fault_state2>

4. <DHSWL_signal> shall be in <ON_State> for <ON_time_ms> from IGN ON 

5. <DHSWL_signal> shall be <OFF_State> for <OFF_time_ms>.

6. <DHSWL_signal> is in <Real_State> after <ProveOut_Time> from IGN ON.

7. <DHSWL_signal> is in <Real_State> after <ProveOut_Time> from IGN ON.

8. The output is expected as step 7 output for 4 times

9. <Fault1> is in <Fault_state1_after> and <Fault2> is in <Fault_state2_after>.

10. <DHSWL_signal> is in <Real_State2> after <ProveOut_Time> from IGN ON.

11.  <DHSWL_signal> is in <Real_State2> after <ProveOut_Time>.

12. The output is expected as step 11 output for 4 times.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 't_Pre' => 
	SCALAR 'Fault_state1' => 
	SCALAR 'Fault_state2' => 
	SCALAR 'Real_State' => 
	SCALAR 'Real_State2' => 
	SCALAR 'Fault_state1_after' => 
	SCALAR 'Fault_state2_after' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
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

	purpose = 'check behavior of DHSWL with faulty condition in Reset sequence'
	
	ON_time_ms = '6000' #ms (+/-150ms)
	OFF_time_ms = '2000' #ms (+/-150ms)
	ProveOut_Time = '8000' #ms  (+/-300ms)
	ON_State = '1'
	OFF_State = '0'
	
	t_Qual = '2300' #ms
	t_Dequal = '2500' #ms
	DHSWL_signal = 'DHS_RILReq'
	t_Pre = '2700' #ms
	Fault_state1 = 'Qualified'
	Fault_state2 = 'Empty'
	Real_State = '3'
	Real_State2 = '0'
	Fault_state1_after = 'Dequalified'
	Fault_state2_after = 'Empty'
	Fault1 = 'rb_psem_Short2GndPCS1D_flt'   #2300ms qualifi. time
	Fault2 = 'No fault'

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
my $tcpar_t_Pre;
my $tcpar_Fault_state1;
my $tcpar_Fault_state2;
my $tcpar_Real_State;
my $tcpar_Real_State2;
my $tcpar_Fault_state1_after;
my $tcpar_Fault_state2_after;
my $tcpar_Fault1;
my $tcpar_Fault2;

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
	$tcpar_t_Pre =  GEN_Read_mandatory_testcase_parameter( 't_Pre' );
	$tcpar_Fault_state1 =  GEN_Read_mandatory_testcase_parameter( 'Fault_state1' );
	$tcpar_Fault_state2 =  GEN_Read_mandatory_testcase_parameter( 'Fault_state2' );
	$tcpar_Real_State =  GEN_Read_mandatory_testcase_parameter( 'Real_State' );
	$tcpar_Real_State2 =  GEN_Read_mandatory_testcase_parameter( 'Real_State2' );
	$tcpar_Fault_state1_after =  GEN_Read_mandatory_testcase_parameter( 'Fault_state1_after' );
	$tcpar_Fault_state2_after =  GEN_Read_mandatory_testcase_parameter( 'Fault_state2_after' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );

	return 1;
}

sub TC_initialization {
	S_teststep( "StandardPrepNoFault", 'AUTO_NBR' );
	CA_trace_start();
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("ECU ON and wait for '$tcpar_t_Pre'", 'AUTO_NBR');
	   LC_SetVoltage('U_BATT_DEFAULT');
	   LC_ECU_On();
       S_wait_ms( $tcpar_t_Pre );		

	S_teststep("Create '$tcpar_Fault1' and '$tcpar_Fault2' condition and wait for time '$tcpar_t_Qual' ms", 'AUTO_NBR');
		  if ($tcpar_Fault2 eq 'No fault') {
				if ($tcpar_Fault1 =~ m/(.*)PCS2(.*)/)               #create fault 1,   #use TSG4 create fault *PCS1* to create *PCS2/3* fault due to PCS1/2/3 use same pin
				{
					my $temp = "$1PCS1$2";
					GEN_printComment("Temp fault is $temp");
					FM_createFault($temp); #used for TSG4	
				}	
				elsif ($tcpar_Fault1 =~ m/(.*)PCS3(.*)/) 	{
	 			 	my $temp = "$1PCS1$2";			 	
					GEN_printComment("Temp fault is $temp");
					FM_createFault($temp); #used for TSG4				
				}
				else {
	   		  		FM_createFault($tcpar_Fault1); #used for TSG4	
				}
		  }
		  
		  else {
				if ($tcpar_Fault1 =~ m/(.*)PCS2(.*)/)              #create fault 1 & fault 2   #use TSG4 create fault *PCS1* to create *PCS2/3* fault due to PCS1/2/3 use same pin
				{
					my $temp = "$1PCS1$2";
					GEN_printComment("Temp fault is $temp");
					FM_createFault($temp); #used for TSG4	
				}	
				elsif ($tcpar_Fault1 =~ m/(.*)PCS3(.*)/) 	{
	 			 	my $temp = "$1PCS1$2";			 	
					GEN_printComment("Temp fault is $temp");
					FM_createFault($temp); #used for TSG4				
				}
				else {
	   		  		FM_createFault($tcpar_Fault1); #used for TSG4	
				}
				
				if ($tcpar_Fault2 =~ m/(.*)PCS2(.*)/)                #use TSG4 create fault *PCS1* to create *PCS2/3* fault due to PCS1/2/3 use same pin
				{
					my $temp = "$1PCS1$2";
					GEN_printComment("Temp fault is $temp");
					FM_createFault($temp); #used for TSG4	
				}	
				elsif ($tcpar_Fault2 =~ m/(.*)PCS3(.*)/) 	{
	 			 	my $temp = "$1PCS1$2";			 	
					GEN_printComment("Temp fault is $temp");
					FM_createFault($temp); #used for TSG4				
				}
				else {
	   		  		FM_createFault($tcpar_Fault2); #used for TSG4	
				}
		  }
		  S_wait_ms( $tcpar_t_Qual + 500);
		  
	S_teststep("Check fault recorder, Reset ECU", 'AUTO_NBR', 'check_fault_recorder');			#measurement 1
		  $fault_struct = PD_ReadFaultMemory(1);
	
	S_teststep("Wait 4s since IGN On and chek state of '$tcpar_DHSWL_signal'.", 'AUTO_NBR', 'wait_4s_since');			#measurement 2
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms(4000);
		foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_0_4) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_0_4 =~ s/0x//;
		  push( @Provetime_Obt_0_4_arr, hex($Provetime_Obt_0_4) );
		  S_wait_ms( 500);
		}

	S_teststep("Check '$tcpar_DHSWL_signal' for 2s after 6s from IGN ON", 'AUTO_NBR', 'wait_2s_and');			#measurement 3
		S_wait_ms(150);
		foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_6_8) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_6_8 =~ s/0x//;
		  push( @Provetime_Obt_6_8_arr, hex($Provetime_Obt_6_8) );
		  S_wait_ms( 500);
		}  
		  
	S_teststep("Check '$tcpar_DHSWL_signal' after 8s from IGN ON with updated expected value.", 'AUTO_NBR', 'waits_05s_and');			#measurement 4
	     S_wait_ms(150);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8 =~ s/0x//;
		 push( @Provetime_Obt_8_arr, hex($Provetime_Obt_8) );
		  S_wait_ms( 500);
		}
		
	S_teststep("Reset ECU  check state of '$tcpar_DHSWL_signal' after '$tcpar_ProveOut_Time'.", 'AUTO_NBR', 'reset_ecu__check_A');			#measurement 5
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_reset) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_reset =~ s/0x//;
		 push( @Provetime_Obt_8_reset_arr, hex($Provetime_Obt_8_reset) );
		  S_wait_ms( 500);
		}

	S_teststep("Execute step 5 for 4 times.", 'AUTO_NBR', 'execute_step_5');			#measurement 6
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_reset_1) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_reset_1 =~ s/0x//;
		 push( @Provetime_Obt_8_reset_1_arr, hex($Provetime_Obt_8_reset_1) );
		  S_wait_ms( 500);
		}
		
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_reset_2) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_reset_2 =~ s/0x//;
		 push( @Provetime_Obt_8_reset_2_arr, hex($Provetime_Obt_8_reset_2) );
		  S_wait_ms( 500);
		}
		
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_reset_3) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_reset_3 =~ s/0x//;
		 push( @Provetime_Obt_8_reset_3_arr, hex($Provetime_Obt_8_reset_3) );
		  S_wait_ms( 500);
		}
		
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_reset_4) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_reset_4 =~ s/0x//;
		 push( @Provetime_Obt_8_reset_4_arr, hex($Provetime_Obt_8_reset_4) );
		  S_wait_ms( 500);
		}
		
		
	S_teststep("Remove '$tcpar_Fault1' condition, wait for '$tcpar_t_Dequal' and Check fault recorder.", 'AUTO_NBR', 'remove_fault1_condition');			#measurement 7
		### remove condtion
		if ($tcpar_Fault1 =~ m/(.*)PCS2(.*)/)              #create fault 1 & fault 2   #use TSG4 create fault *PCS1* to create *PCS2/3* fault due to PCS1/2/3 use same pin
		{
			my $temp = "$1PCS1$2";
			GEN_printComment("Temp fault is $temp");
			FM_removeFault($temp); #used for TSG4	
		}	
		elsif ($tcpar_Fault1 =~ m/(.*)PCS3(.*)/) 	{
			my $temp = "$1PCS1$2";			 	
			GEN_printComment("Temp fault is $temp");
			FM_removeFault($temp); #used for TSG4	
		}
		else {
			FM_removeFault($tcpar_Fault1); #used for TSG4	
		}
		 S_wait_ms( $tcpar_t_Dequal );	 #dequalification time is not correct	
		 $fault_struct_after = PD_ReadFaultMemory(1);
		  

	S_teststep("Check state of '$tcpar_DHSWL_signal'  after '$tcpar_ProveOut_Time'.", 'AUTO_NBR', 'check_state_of');			#measurement 8
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after =~ s/0x//;
		 push( @Provetime_Obt_8_after_arr, hex($Provetime_Obt_8_after) );
		  S_wait_ms( 500);
		}
		
	S_teststep("Reset ECU  check state of '$tcpar_DHSWL_signal' after '$tcpar_ProveOut_Time'.", 'AUTO_NBR', 'reset_ecu__check_B');			#measurement 9
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_reset) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after_reset =~ s/0x//;
		 push( @Provetime_Obt_8_after_reset_arr, hex($Provetime_Obt_8_after_reset) );
		  S_wait_ms( 500);
		}
		
	S_teststep("Execute step 11 for 4 times", 'AUTO_NBR', 'execute_step_11');			#measurement 10
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_reset_1) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after_reset_1 =~ s/0x//;
		 push( @Provetime_Obt_8_after_reset_1_arr, hex($Provetime_Obt_8_after_reset_1) );
		  S_wait_ms( 500);
		}
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_reset_2) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after_reset_2 =~ s/0x//;
		 push( @Provetime_Obt_8_after_reset_2_arr, hex($Provetime_Obt_8_after_reset_2) );
		  S_wait_ms( 500);
		}			
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_reset_3) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after_reset_3 =~ s/0x//;
		 push( @Provetime_Obt_8_after_reset_3_arr, hex($Provetime_Obt_8_after_reset_3) );
		  S_wait_ms( 500);
		}
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();	
		S_wait_ms($tcpar_ProveOut_Time + 300);
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after_reset_4) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after_reset_4 =~ s/0x//;
		 push( @Provetime_Obt_8_after_reset_4_arr, hex($Provetime_Obt_8_after_reset_4) );
		  S_wait_ms( 500);
		}
				
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault1' is in '$tcpar_Fault_state1' and '$tcpar_Fault2' is in '$tcpar_Fault_state2'", 'check_fault_recorder');			#evaluation 1
	     if ($tcpar_Fault_state2 eq 'Empty') {
    	    PD_check_fault_status( $fault_struct, $tcpar_Fault1, '0bxxxx1x11' );
			PD_check_fault_status( $fault_struct, $tcpar_Fault2, '0' );	    	    		     	
	     }
	     else {
    	    PD_check_fault_status( $fault_struct, $tcpar_Fault1, '0bxxxx1x11' );
			PD_check_fault_status( $fault_struct, $tcpar_Fault2, '0bxxxx1x11' );	 
	     }
    		push(my @state,@{$fault_struct->{'state'}});
    		push(my @flt,@{$fault_struct->{'fault_text'}});			
    	    S_teststep_detected("Fault '@flt' is in state '@state' ", 'check_fault_recorder');	

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be in '$tcpar_ON_State' for '$tcpar_ON_time_ms' from IGN ON ", 'wait_4s_since');			#evaluation 2
	   foreach (@Provetime_Obt_0_4_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_ON_time_ms' from IGN ON :",	$_, "==", $tcpar_ON_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'wait_4s_since');	   
	   }	

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be '$tcpar_OFF_State' for '$tcpar_OFF_time_ms'.", 'wait_2s_and');			#evaluation 3
	   foreach (@Provetime_Obt_6_8_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_OFF_State' from from 6s -> 8s from IGN ON :", $_, "==", $tcpar_OFF_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'wait_2s_and');	   
	   }	

	S_teststep_expected("'$tcpar_DHSWL_signal' is in '$tcpar_Real_State' after '$tcpar_ProveOut_Time' from IGN ON.", 'waits_05s_and');			#evaluation 4
	   foreach (@Provetime_Obt_8_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'waits_05s_and');	   
	   }	

	S_teststep_expected("'$tcpar_DHSWL_signal' is in '$tcpar_Real_State' after '$tcpar_ProveOut_Time' from IGN ON.", 'reset_ecu__check_A');			#evaluation 5
	   foreach (@Provetime_Obt_8_reset_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'reset_ecu__check_A');	   
	   }	

	S_teststep_expected("The output is expected as step 7 output for 4 times", 'execute_step_5');			#evaluation 6
	   foreach (@Provetime_Obt_8_reset_1_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_5');	   
	   }	
	   
	   foreach (@Provetime_Obt_8_reset_2_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_5');	   
	   }
	   
	   foreach (@Provetime_Obt_8_reset_3_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_5');	   
	   }
	   
	   foreach (@Provetime_Obt_8_reset_4_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_5');	   
	   }	   

	S_teststep_expected("'$tcpar_Fault1' is in '$tcpar_Fault_state1_after' and '$tcpar_Fault2' is in '$tcpar_Fault_state2_after'.", 'remove_fault1_condition');			#evaluation 7
	     if ($tcpar_Fault_state2 eq 'Empty') {
    	    PD_check_fault_status( $fault_struct_after, $tcpar_Fault1, '0bxxxx1xx0' );
	     }
	     else {
    	    PD_check_fault_status( $fault_struct_after, $tcpar_Fault1, '0bxxxx1xx0' );
			PD_check_fault_status( $fault_struct_after, $tcpar_Fault2, '0bxxxx1x11' );  	    	    		     	
	     }
    		push(my @state1,@{$fault_struct_after->{'state'}});
    		push(my @flt1,@{$fault_struct_after->{'fault_text'}});			
    	    S_teststep_detected("Fault '@flt1' is in state '@state1' ", 'remove_fault1_condition');	     
		  	    
   
	S_teststep_expected("'$tcpar_DHSWL_signal' is in '$tcpar_Real_State2' after '$tcpar_ProveOut_Time' from IGN ON.", 'check_state_of');			#evaluation 8
	   foreach (@Provetime_Obt_8_after_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State2' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State2 );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'check_state_of');	   
	   }	

	S_teststep_expected("'$tcpar_DHSWL_signal' is in '$tcpar_Real_State2' after '$tcpar_ProveOut_Time'.", 'reset_ecu__check_B');			#evaluation 9
	   foreach (@Provetime_Obt_8_after_reset_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State2' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State2 );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'reset_ecu__check_B');	   
	   }	

	S_teststep_expected("The output is expected as step 11 output for 4 times.", 'execute_step_11');			#evaluation 10
	   foreach (@Provetime_Obt_8_after_reset_1_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State2' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State2 );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_11');	   
	   }	
	   foreach (@Provetime_Obt_8_after_reset_2_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State2' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State2 );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_11');	   
	   }	
	   foreach (@Provetime_Obt_8_after_reset_3_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State2' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State2 );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_11');	   
	   }
	   foreach (@Provetime_Obt_8_after_reset_4_arr) {
	   		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State2' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State2 );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'execute_step_11');	   
	   }
	   
	   	   	   	   

	return 1;
}

sub TC_finalization {
	S_wait_ms(2000);
	### remove condtion
	if ($tcpar_Fault2 eq 'No fault') {
		FM_removeFault($tcpar_Fault1); #used for TSG4	
	}
	else {	
		if ($tcpar_Fault1 =~ m/(.*)PCS2(.*)/)              #create fault 1 & fault 2   #use TSG4 create fault *PCS1* to create *PCS2/3* fault due to PCS1/2/3 use same pin
		{
			my $temp = "$1PCS1$2";
			GEN_printComment("Temp fault is $temp");
			FM_removeFault($temp); #used for TSG4	
		}	
		elsif ($tcpar_Fault1 =~ m/(.*)PCS3(.*)/) 	{
			my $temp = "$1PCS1$2";			 	
			GEN_printComment("Temp fault is $temp");
			FM_removeFault($temp); #used for TSG4	
		}
		else {
			FM_removeFault($tcpar_Fault1); #used for TSG4	
		}
		if ($tcpar_Fault2 =~ m/(.*)PCS2(.*)/)                #use TSG4 create fault *PCS1* to create *PCS2/3* fault due to PCS1/2/3 use same pin
		{
			my $temp = "$1PCS1$2";
			GEN_printComment("Temp fault is $temp");
			FM_removeFault($temp); #used for TSG4	
		}	
		elsif ($tcpar_Fault2 =~ m/(.*)PCS3(.*)/) 	{
			my $temp = "$1PCS1$2";			 	
			GEN_printComment("Temp fault is $temp");
			FM_removeFault($temp); #used for TSG4	
		}
		else {
		FM_removeFault($tcpar_Fault2); #used for TSG4	
		}
		S_wait_ms(5000);
    }
	#####		
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}


1;
