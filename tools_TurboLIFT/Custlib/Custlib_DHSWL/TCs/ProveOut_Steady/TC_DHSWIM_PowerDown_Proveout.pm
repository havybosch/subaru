#### TEST CASE MODULE
package TC_DHSWIM_PowerDown_Proveout;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.2 $;
our $HEADER = q$Header: TCs/TCs_Project/DHSWL/ProveOut_Steady/TC_DHSWIM_PowerDown_Proveout.pm 1.2 2018/10/03 09:12:52ICT HQA1HC develop  $;

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

our $PURPOSE = "Check behavior of DHSWL when power is cut off in Prove out mode";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_PowerDown_Proveout

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set ECU ON

2. Wait for 8s for ECU in steady state

3. Set voltage to <Condition> and Check fault recorder

4. Reset ECU

5. Wait for <time1> and turn off ECU

6. Read WL status <DHSWL_signal> until power is off completely

7. IGN on

8. Wait for <time2> and turn off ECU

9. Read WL status <DHSWL_signal> since step 7 until power is off completely

10. IGN on

11. Wait for <time3> and turn off ECU

12. Read WL status <DHSWL_signal> since step 10 until power is off completely


I<B<Evaluation>>

1. 

2. 

3. 

4. 

5. 

6. <DHSWL_signal> shall be in <Value_On> for <time_proveout_on> from IGNON, and keep <Value_Off> since <time_proveout_on> till power off completely

7. 

8.

9. <DHSWL_signal> shall be in shall be in <Value_On> for <time_proveout_on> since IGN on, and keep <Value_Off> since <time_proveout_on> till power off

10.

11.

12. <DHSWL_signal> shall be in <Value_On> since IGN on till power off completely 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'DHSWL_signal' => 
	SCALAR 'Condition' => 
	SCALAR 'Value_Off' => 
	SCALAR 'Value_On' => 
	SCALAR 'time1' => 
	SCALAR 'time_proveout_on' => 
	SCALAR 'time2' => 
	SCALAR 'time3' => 


=head2 PARAMETER EXAMPLES

	purpose = 'check behavior of DHSWL when power is cut off in Prove out mode'
	
	DHSWL_signal = 'DHS_RILReq'
	Condition = '<Test Heading 2>'
	Value_Off = '0'
	Value_On = '1'
	
	time1 = '4000' #ms
	time_proveout_on = '6000' #ms (+/-150ms)
	time2 = '6500' #ms
	time3 = '2000' #ms (+/-150ms)

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_DHSWL_signal;
my $tcpar_Condition;
my $tcpar_Value_Off;
my $tcpar_Value_On;
my $tcpar_time1;
my $tcpar_time_proveout_on;
my $tcpar_time2;
my $tcpar_time3;

################ global parameter declaration ###################
#add any global variables here
my $fault_struct;
my $Provetime_Obt;
my $Provetime_Obt_after;
my $Provetime_Obt_last;
my $tcpar_Voltage_Fault;
my @Provetime_Obt_arr;
my @Provetime_Obt_after_arr;
my @Provetime_Obt_last_arr;


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_DHSWL_signal =  GEN_Read_mandatory_testcase_parameter( 'DHSWL_signal' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_Value_Off =  GEN_Read_mandatory_testcase_parameter( 'Value_Off' );
	$tcpar_Value_On =  GEN_Read_mandatory_testcase_parameter( 'Value_On' );
	$tcpar_time1 =  GEN_Read_mandatory_testcase_parameter( 'time1' );
	$tcpar_time_proveout_on =  GEN_Read_mandatory_testcase_parameter( 'time_proveout_on' );
	$tcpar_time2 =  GEN_Read_mandatory_testcase_parameter( 'time2' );
	$tcpar_time3 =  GEN_Read_mandatory_testcase_parameter( 'time3' );
	$tcpar_Voltage_Fault =  GEN_Read_mandatory_testcase_parameter( 'Voltage_Fault' );
	

	return 1;
}

sub TC_initialization {


	S_teststep( "StandardPrepNoFault", 'AUTO_NBR' );
	CA_trace_start();
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set ECU ON", 'AUTO_NBR');
   		LC_SetVoltage('U_BATT_DEFAULT');
        LC_ECU_On();
        
	S_teststep("Wait for 8s for ECU in steady state", 'AUTO_NBR');
    	S_wait_ms( 8000 );
    	
	S_teststep("Set voltage to <Condition> and Check fault recorder", 'AUTO_NBR', 'set_the_volatage');
	   	if ($tcpar_Condition eq '12V') {
    		LC_SetVoltage('U_BATT_DEFAULT');
    	}
    	elsif ($tcpar_Condition eq '7V') {
    		LC_SetVoltage('U_BATT_UNDERVOLTAGE');
    	}
    	else {
    	 	LC_SetVoltage('U_BATT_OVERVOLTAGE');
    	}
    	S_wait_ms( 10000 );

		$fault_struct = PD_ReadFaultMemory(1);
    	
	
	S_teststep("Reset ECU", 'AUTO_NBR');
		LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );        
        LC_ECU_On();    		
        
	S_teststep("Wait for '$tcpar_time1' and turn off ECU", 'AUTO_NBR');
    	S_wait_ms( $tcpar_time1 );	
		LC_ECU_Off();        

	S_teststep("Read WL status '$tcpar_DHSWL_signal' until power is off completely", 'AUTO_NBR', 'read_wl_status_A');			#measurement 1
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  	($Provetime_Obt) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  	 $Provetime_Obt =~ s/0x//;
		 	 push( @Provetime_Obt_arr, hex($Provetime_Obt) );
    		 S_wait_ms( 100 );	
		 }
		
    	S_wait_ms( 'TIMER_ECU_OFF' );
		
		
	S_teststep("IGN on", 'AUTO_NBR');
        LC_ECU_On();
	

	S_teststep("Wait for '$tcpar_time2' and turn off ECU", 'AUTO_NBR');
    	S_wait_ms( $tcpar_time2 );	
		LC_ECU_Off();	

	S_teststep("Read WL status '$tcpar_DHSWL_signal' since step 7 until power is off completely", 'AUTO_NBR', 'read_wl_status_B');			#measurement 2
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  	($Provetime_Obt_after) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  	 $Provetime_Obt_after =~ s/0x//;
		 	 push( @Provetime_Obt_after_arr, hex($Provetime_Obt_after) );
    		 S_wait_ms( 100 );	
		  }
    	S_wait_ms( 'TIMER_ECU_OFF' );
		 
	S_teststep("IGN on", 'AUTO_NBR');
        LC_ECU_On();

	S_teststep("Wait for '$tcpar_time3' and turn off ECU", 'AUTO_NBR');
    	S_wait_ms( $tcpar_time3 );	

	S_teststep("Read WL status '$tcpar_DHSWL_signal' since step 10 until power is off completely", 'AUTO_NBR', 'read_wl_status_C');			#measurement 3
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  	($Provetime_Obt_last) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  	$Provetime_Obt_last =~ s/0x//;
		 	push( @Provetime_Obt_last_arr, hex($Provetime_Obt_last) );
    		S_wait_ms( 100 );	
		 }
		 
		 
	return 1;
}

sub TC_evaluation {
	S_teststep_expected("Voltage Fault: '$tcpar_Voltage_Fault' is Qualified", 'set_the_volatage');			#evaluation 2
   		push(my @state,@{$fault_struct->{'state'}});
    	push(my @flt,@{$fault_struct->{'fault_text'}});	
     	my $len = scalar(@flt);
     	if($len == 0){
     		S_teststep_detected("No Fault is Qualified ", 'set_the_volatage');	 
     	}      
     	else {
 			S_teststep_detected("Fault '@flt' is in state '@state' ", 'set_the_volatage');
     	}
     	
    	#### check fault Voltage ###
 	 	if ($tcpar_Condition eq '12V') {
	 		 PD_check_fault_status( $fault_struct, 'rb_pom_VbatLow_flt', '0' );
	 		 PD_check_fault_status( $fault_struct, 'rb_pom_VbatHigh_flt', '0' );
	 	}
   		elsif ($tcpar_Condition eq '7V') {
    	    PD_check_fault_status( $fault_struct, 'rb_pom_VbatLow_flt', '0bxxxx1x11' );
   		}
    	else {
			 PD_check_fault_status( $fault_struct, 'rb_pom_VbatHigh_flt', '0bxxxx1x11' );
    	}	 
    	#### finish check fault Voltage ###             	     	
	
	
	

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be in '$tcpar_Value_On' for '$tcpar_time_proveout_on' from IGNON, and keep '$tcpar_Value_Off' since '$tcpar_time_proveout_on' till power off completely", 'read_wl_status_A');			#evaluation 1
	   foreach (@Provetime_Obt_arr) {
	  		EVAL_evaluate_value( "Observed value in Autarky time :", $_, "==", $tcpar_Value_On );
			S_teststep_detected("Observed value after each 100ms: '$_' ", 'read_wl_status_A');
	   }	

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be in shall be in '$tcpar_Value_On' for '$tcpar_time_proveout_on' since IGN on, and keep '$tcpar_Value_Off' since '$tcpar_time_proveout_on' till power off", 'read_wl_status_B');			#evaluation 2
	   foreach (@Provetime_Obt_after_arr) {
	   		EVAL_evaluate_value( "Observed value in Autarky time :", $_, "==", $tcpar_Value_Off );
			S_teststep_detected("Observed value after each 100ms: '$_' ", 'read_wl_status_B');		   		
	   }		

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be in '$tcpar_Value_On' since IGN on till power off completely ", 'read_wl_status_C');			#evaluation 3
	   foreach (@Provetime_Obt_last_arr) {
	   		EVAL_evaluate_value( "Observed value in Autarky time :", $_, "==", $tcpar_Value_On );
			S_teststep_detected("Observed value after each 100ms: '$_' ", 'read_wl_status_C');			   		
	   }		

	return 1;
}

sub TC_finalization {
	S_wait_ms(2000);
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}


1;
