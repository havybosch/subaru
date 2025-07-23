#### TEST CASE MODULE
package TC_DHSWIM_PowerDown_FaultChange;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.2 $;
our $HEADER = q$Header: TCs/TCs_Project/DHSWL/ProveOut_Steady/TC_DHSWIM_PowerDown_FaultChange.pm 1.2 2018/10/03 09:12:52ICT HQA1HC develop  $;

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

our $PURPOSE = "Check behavior of DHSWL in autarky mode when power is cut off before fault qualified or dequalified";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_PowerDown_FaultChange

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set IGN on

2. Wait for <time> ms for ECU in steady state and set Voltage to <Voltage>

3. Read WL <DHSWL_signal> status

4. Create <Fault> fault condition and Wait  <t_Qual1> ms

5. IGN off and wait for <t_Aut> ms

6. Read fault recorder before the ECU off completely

7. Read WL status <DHSWL_signal> until the power is off completely

8. IGN on and wait for <time> ms

9. Read fault recorder

10. Read WL status <DHSWL_signal> status

11. Remove <Fault> fault condition and Wait <t_DeQual1> ms

12. IGN off and wait for <t_Aut> ms

13. Read fault recorder before the ECU off completely

14. Read WL status <DHSWL_signal> until the power is off completely

15. IGN on and wait for <time> ms

16. Read fault recorder 

17. Read WL status <DHSWL_signal> status

18. Clear fault recorder

19. Read WL status <DHSWL_signal> status


I<B<Evaluation>>

1. 

2. 

3. <DHSWL_signal> lamp signal should be <Value_Off> value

4. 

5. 

6. Fault <Fault> is qualified during Autarky time

7. <DHSWL_signal> lamp signal should be <Value_Off_Au> value continuously till power off

8. 

9. Fault <Fault> is in <Quali_State> state

10. <DHSWL_signal> lamp signal should be in <Value_On> value

11. 

12. 

13. Fault <Fault> is in <Dequali_State> state

14. <DHSWL_signal> lamp signal should be in <Value_On_Au> value

15.

16. Fault <Fault> is in <Store_State> state

17. <DHSWL_signal> lamp signal should be in <Value_Off> value

18. Fault is clear 

19. <DHSWL_signal> lamp signal should be in <Value_Off> value


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Fault' => 
	SCALAR 'purpose' => 
	SCALAR 'Voltage' => 
	SCALAR 'time' => 
	SCALAR 'DHSWL_signal' => 
	SCALAR 'Value_Off' => 
	SCALAR 'Value_On' => 
	SCALAR 'Value_Off_Au' => 
	SCALAR 'Value_On_Au' => 
	SCALAR 'Value_On_1' => 
	SCALAR 't_Qual1' => 
	SCALAR 't_DeQual1' => 
	SCALAR 't_Aut' => 
	SCALAR 'Quali_State' => 
	SCALAR 'Dequali_State' => 
	SCALAR 'Store_State' => 


=head2 PARAMETER EXAMPLES

	purpose = 'Check behavior of DHSWL in autarky mode when power is cut off before fault qualified or dequalified'
	
	Voltage = '<Test Heading 2>'
	time = '8000' #ms  (+/-300ms)
	DHSWL_signal = 'RILReq'
	Value_Off = '0'
	Value_On = '3'
	
	Value_Off_Au = '0'
	Value_On_Au = '3'
	
	Value_On_1 = '3' 
	
	### to make sure the cut off power is before the fault change state
	
	#t_Qual1 = t_Qual - t_Aut
	#t_DeQual1 = t_DeQual - t_Aut
	t_Qual1 = '2100' #ms
	t_DeQual1 = '4200' #ms
	t_Aut = '200' #ms
	
	Quali_State = 'Qualified' #0xxxxx1x11
	Dequali_State = 'Dequalified' #0xxxxx1x10
	Store_State = 'Stored' #0xxxxx1x00
	Fault = 'rb_psem_OpenLinePCS1D_flt'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Voltage;
my $tcpar_time;
my $tcpar_DHSWL_signal;
my $tcpar_Value_Off;
my $tcpar_Value_On;
my $tcpar_Value_Off_Au;
my $tcpar_Value_On_Au;
my $tcpar_Value_On_1;
my $tcpar_t_Qual1;
my $tcpar_t_DeQual1;
my $tcpar_t_Aut;
my $tcpar_Quali_State;
my $tcpar_Dequali_State;
my $tcpar_Store_State;
my $tcpar_Fault;

################ global parameter declaration ###################
#add any global variables here
my $fault_struct;
my $fault_struct1;
my $fault_struct2;
my $fault_struct3;
my $fault_struct4;

my $Provetime_Obt;
my $Provetime_Obt_Qua_Aut;
my $Provetime_Obt_Qua_2;
my $Provetime_Obt_DeQ_Aut;
my $Provetime_Obt_DeQ_2;
my $Provetime_Obt_clear;

my @Provetime_Obt_arr;
my @Provetime_Obt_Qua_Aut_arr;
my @Provetime_Obt_Qua_2_arr;
my @Provetime_Obt_DeQ_Aut_arr;
my @Provetime_Obt_clear_arr;
my @Provetime_Obt_DeQ_2_arr;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Voltage =  GEN_Read_mandatory_testcase_parameter( 'Voltage' );
	$tcpar_time =  GEN_Read_mandatory_testcase_parameter( 'time' );
	$tcpar_DHSWL_signal =  GEN_Read_mandatory_testcase_parameter( 'DHSWL_signal' );
	$tcpar_Value_Off =  GEN_Read_mandatory_testcase_parameter( 'Value_Off' );
	$tcpar_Value_On =  GEN_Read_mandatory_testcase_parameter( 'Value_On' );
	$tcpar_Value_Off_Au =  GEN_Read_mandatory_testcase_parameter( 'Value_Off_Au' );
	$tcpar_Value_On_Au =  GEN_Read_mandatory_testcase_parameter( 'Value_On_Au' );
	$tcpar_Value_On_1 =  GEN_Read_mandatory_testcase_parameter( 'Value_On_1' );
	$tcpar_t_Qual1 =  GEN_Read_mandatory_testcase_parameter( 't_Qual1' );
	$tcpar_t_DeQual1 =  GEN_Read_mandatory_testcase_parameter( 't_DeQual1' );
	$tcpar_t_Aut =  GEN_Read_mandatory_testcase_parameter( 't_Aut' );
	$tcpar_Quali_State =  GEN_Read_mandatory_testcase_parameter( 'Quali_State' );
	$tcpar_Dequali_State =  GEN_Read_mandatory_testcase_parameter( 'Dequali_State' );
	$tcpar_Store_State =  GEN_Read_mandatory_testcase_parameter( 'Store_State' );
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

	S_teststep("Set IGN on", 'AUTO_NBR');
		LC_SetVoltage('U_BATT_DEFAULT');
		LC_ECU_On();
	
	S_teststep("Wait for '$tcpar_time' ms for ECU in steady state and set Voltage to '$tcpar_Voltage' ", 'AUTO_NBR');
        S_wait_ms( $tcpar_time ); 	
	
	   	if ($tcpar_Voltage eq '12V') {
    		LC_SetVoltage('U_BATT_DEFAULT');
    	}
    	elsif ($tcpar_Voltage eq '7V') {
    		LC_SetVoltage('U_BATT_UNDERVOLTAGE');
    	}
    	else {
    	 	LC_SetVoltage('U_BATT_OVERVOLTAGE');
    	}
        S_wait_ms( 10000 ); #qualified Voltage Fault		


       	
       	#### check fault Voltage ###
		GEN_printComment("#### Check fault Voltage ###");
		$fault_struct = PD_ReadFaultMemory(1);
 	 	if ($tcpar_Voltage eq '12V') {
	 	}
   		elsif ($tcpar_Voltage eq '7V') {
    	    PD_check_fault_status( $fault_struct, 'rb_pom_VbatLow_flt', '0bxxxx1x11' );
   		}
    	else {
			 PD_check_fault_status( $fault_struct, 'rb_pom_VbatHigh_flt', '0bxxxx1x11' );
    	}	
    	        

	S_teststep("Read WL '$tcpar_DHSWL_signal' status", 'AUTO_NBR', 'read_wl_dhswl');			#measurement 1
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  	($Provetime_Obt)= CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  	$Provetime_Obt=~ s/0x//;
		 	push( @Provetime_Obt_arr, hex($Provetime_Obt) );
        	S_wait_ms( 100 ); 		
		 }	

	S_teststep("Create '$tcpar_Fault' fault condition and Wait  '$tcpar_t_Qual1' ms", 'AUTO_NBR');
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
		S_wait_ms( $tcpar_t_Qual1 + 140 );	 #qualification time is not correct
		
	S_teststep("IGN off and wait for '$tcpar_t_Aut' ms", 'AUTO_NBR');
		LC_ECU_Off();
		S_wait_ms( $tcpar_t_Aut);

	S_teststep("Read fault recorder before the ECU off completely", 'AUTO_NBR', 'read_fault_recorder_A');			#measurement 2
		$fault_struct = PD_ReadFaultMemory(1);

	S_teststep("Read WL status '$tcpar_DHSWL_signal' until the power is off completely", 'AUTO_NBR', 'read_wl_status_A');			#measurement 3
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  	($Provetime_Obt_Qua_Aut) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  	$Provetime_Obt_Qua_Aut=~ s/0x//;
		 	push( @Provetime_Obt_Qua_Aut_arr, hex($Provetime_Obt_Qua_Aut) );
    		S_wait_ms( 100 );
		 }	
    	S_wait_ms( 'TIMER_ECU_OFF' );
		 
	S_teststep("IGN on and wait for '$tcpar_time' ms", 'AUTO_NBR');
		LC_ECU_On();
       	S_wait_ms( $tcpar_time );	
	
	S_teststep("Read fault recorder", 'AUTO_NBR', 'read_fault_recorder_B');			#measurement 4
		$fault_struct1 = PD_ReadFaultMemory(1);

	S_teststep("Read WL status '$tcpar_DHSWL_signal' status", 'AUTO_NBR', 'read_wl_status_B');			#measurement 5
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  	($Provetime_Obt_Qua_2) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  	$Provetime_Obt_Qua_2=~ s/0x//;
		 	push( @Provetime_Obt_Qua_2_arr, hex($Provetime_Obt_Qua_2) );
    		S_wait_ms( 100 );
		 }	
		 
	S_teststep("Remove '$tcpar_Fault' fault condition and Wait '$tcpar_t_DeQual1' ms", 'AUTO_NBR');
		FM_removeFault($tcpar_Fault); #used for TSG4	
		S_wait_ms( $tcpar_t_DeQual1 + 80 );	#Dequalification time is not stable

	S_teststep("IGN off and wait for '$tcpar_t_Aut' ms", 'AUTO_NBR');
		LC_ECU_Off();
		S_wait_ms( $tcpar_t_Aut);	

	S_teststep("Read fault recorder before the ECU off completely", 'AUTO_NBR', 'read_fault_recorder_C');			#measurement 6
		$fault_struct2 = PD_ReadFaultMemory();			
		
	S_teststep("Read WL status '$tcpar_DHSWL_signal' until the power is off completely", 'AUTO_NBR', 'read_wl_status_C');			#measurement 7
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  	($Provetime_Obt_DeQ_Aut) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  	$Provetime_Obt_DeQ_Aut=~ s/0x//;
		 	push( @Provetime_Obt_DeQ_Aut_arr, hex($Provetime_Obt_DeQ_Aut) );
    		S_wait_ms( 100 );
		 }		

	S_teststep("IGN on and wait for '$tcpar_time' ms", 'AUTO_NBR');
		LC_ECU_On();
       	S_wait_ms( $tcpar_time );		

	S_teststep("Read fault recorder ", 'AUTO_NBR', 'read_fault_recorder_D');			#measurement 8
		$fault_struct3 = PD_ReadFaultMemory(1);	

	S_teststep("Read WL status '$tcpar_DHSWL_signal' status", 'AUTO_NBR', 'read_wl_status_D');			#measurement 9
	     foreach ( 1 .. 4 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  	($Provetime_Obt_DeQ_2)= CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  	$Provetime_Obt_DeQ_2=~ s/0x//;
		 	push( @Provetime_Obt_DeQ_2_arr, hex($Provetime_Obt_DeQ_2) );
    		S_wait_ms( 100 );
		 }		

	S_teststep("Clear fault recorder", 'AUTO_NBR', 'clear_fault_recorder');			#measurement 10
		 PD_ClearFaultMemory();	
		 $fault_struct4 = PD_ReadFaultMemory(1);	
	     S_wait_ms(4000);
		 

	S_teststep("Read WL status '$tcpar_DHSWL_signal' status", 'AUTO_NBR', 'read_wl_status_E');			#measurement 11
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  	($Provetime_Obt_clear) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  	$Provetime_Obt_clear=~ s/0x//;
		 	push( @Provetime_Obt_clear_arr, hex($Provetime_Obt_clear) );
    		S_wait_ms( 100 );
		 }
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_DHSWL_signal' lamp signal should be '$tcpar_Value_Off' value", 'read_wl_dhswl');			#evaluation 1
	   foreach (@Provetime_Obt_arr) {
	   EVAL_evaluate_value( "Observed value :", $_, "==", $tcpar_Value_Off );
	   S_teststep_detected("Observed value after each 100ms: '$_' ", 'read_wl_dhswl');
		   
	   }	

	S_teststep_expected("Fault '$tcpar_Fault' is qualified during Autarky time", 'read_fault_recorder_A');			#evaluation 2
       PD_check_fault_status( $fault_struct, $tcpar_Fault, '0bxxxx1x11' );      	
    		push(my @state,@{$fault_struct->{'state'}});
    		push(my @flt,@{$fault_struct->{'fault_text'}});			
     		my $len = scalar(@flt);
     		if($len == 0){
     			S_teststep_detected("No Fault is Qualified ", 'read_fault_recorder_A');	 
     		}      
     		else {
	     		S_teststep_detected("Fault '@flt' is in state '@state' ", 'read_fault_recorder_A');	 
     		}        	    
    	    
       

	S_teststep_expected("'$tcpar_DHSWL_signal' lamp signal should be '$tcpar_Value_Off_Au' value continuously till power off", 'read_wl_status_A');			#evaluation 3
	   foreach (@Provetime_Obt_Qua_Aut_arr) {
	   		EVAL_evaluate_value( "Observed value :", $_, "==", $tcpar_Value_Off_Au );
		   	S_teststep_detected("Observed value after each 100ms: '$_' ", 'read_wl_status_A');
		   
	   }		
	
	S_teststep_expected("Fault '$tcpar_Fault' is in '$tcpar_Quali_State' state", 'read_fault_recorder_B');			#evaluation 4
    	PD_check_fault_status( $fault_struct1, $tcpar_Fault, '0bxxxx1x11' );	
    		push(my @state1,@{$fault_struct1->{'state'}});
    		push(my @flt1,@{$fault_struct1->{'fault_text'}});			
     		my $len = scalar(@flt1);
     		if($len == 0){
     			S_teststep_detected("No Fault is Qualified ", 'read_fault_recorder_B');	 
     		}      
     		else {
	     		S_teststep_detected("Fault '@flt1' is in state '@state1' ", 'read_fault_recorder_B');	 
     		}        	    
    	    
	
	S_teststep_expected("'$tcpar_DHSWL_signal' lamp signal should be in '$tcpar_Value_On' value", 'read_wl_status_B');			#evaluation 5
	   foreach (@Provetime_Obt_Qua_2_arr) {
	   		EVAL_evaluate_value( "Observed value :", $_, "==", $tcpar_Value_On );
			S_teststep_detected("Observed value after each 100ms: '$_' ", 'read_wl_status_B');
	   		
	   }		

	S_teststep_expected("Fault '$tcpar_Fault' is in '$tcpar_Dequali_State' state", 'read_fault_recorder_C');			#evaluation 6
    	PD_check_fault_status( $fault_struct2, $tcpar_Fault, '0bxxxx1x10' );
    		push(my @state2,@{$fault_struct2->{'state'}});
    		push(my @flt2,@{$fault_struct2->{'fault_text'}});			
     		my $len = scalar(@flt2);
     		if($len == 0){
     			S_teststep_detected("No Fault is Qualified ", 'read_fault_recorder_C');	 
     		}      
     		else {
	     		S_teststep_detected("Fault '@flt2' is in state '@state2' ", 'read_fault_recorder_C');	 
     		}        	    
    	        	

	S_teststep_expected("'$tcpar_DHSWL_signal' lamp signal should be in '$tcpar_Value_On_Au' value", 'read_wl_status_C');			#evaluation 7
	   foreach (@Provetime_Obt_DeQ_Aut_arr) {
	   		EVAL_evaluate_value( "Observed value :", $_, "==", $tcpar_Value_On_Au );
			S_teststep_detected("Observed value after each 100ms: '$_' " , 'read_wl_status_C');
	   
	   }	
	   
	S_teststep_expected("Fault '$tcpar_Fault' is in '$tcpar_Store_State' state", 'read_fault_recorder_D');			#evaluation 8
    	PD_check_fault_status( $fault_struct3, $tcpar_Fault, '0bxxxx1xx0' );	
    		push(my @state3,@{$fault_struct3->{'state'}});
    		push(my @flt3,@{$fault_struct3->{'fault_text'}});			
     		my $len = scalar(@flt3);
     		if($len == 0){
     			S_teststep_detected("No Fault is Qualified ", 'read_fault_recorder_D');	 
     		}      
     		else {
	     		S_teststep_detected("Fault '@flt3' is in state '@state3' ", 'read_fault_recorder_D');	 
     		}  	

	S_teststep_expected("'$tcpar_DHSWL_signal' lamp signal should be in '$tcpar_Value_Off' value", 'read_wl_status_D');			#evaluation 9
	   foreach (@Provetime_Obt_DeQ_2_arr) {
	   		EVAL_evaluate_value( "Observed value :", $_, "==", $tcpar_Value_Off );
			S_teststep_detected("Observed value after each 100ms: '$_' ", 'read_wl_status_D');	   
	   }		
	
	S_teststep_expected("Fault is clear ", 'clear_fault_recorder');			#evaluation 10
    	PD_check_fault_status( $fault_struct4, $tcpar_Fault, '0' );
    	push(my @state4,@{$fault_struct4->{'state'}});
    	push(my @flt4,@{$fault_struct4->{'fault_text'}});			
     		my $len = scalar(@flt4);
     		if($len == 0){
     			S_teststep_detected("No Fault is Qualified ", 'clear_fault_recorder');	 
     		}      
     		else {
	     		S_teststep_detected("Fault '@flt4' is in state '@state4' ", 'clear_fault_recorder');	 
     		}  	

	S_teststep_expected("'$tcpar_DHSWL_signal' lamp signal should be in '$tcpar_Value_Off' value", 'read_wl_status_E');			#evaluation 11
	S_teststep_detected("Observed Lamp value when fault is cleared:", 'read_wl_status_E');
	   foreach (@Provetime_Obt_clear_arr) {
	   EVAL_evaluate_value( "Observed value :", $_, "==", $tcpar_Value_Off );
	   S_teststep_detected("Observed value after each 100ms: '$_' ", 'read_wl_status_E');	   
	   }		

	return 1;
}

sub TC_finalization {
	S_wait_ms(2000);
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
	else {
		FM_removeFault($tcpar_Fault); #Remove fault condition from TSG4	
	}
	S_wait_ms( 5000 );	
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}


1;
