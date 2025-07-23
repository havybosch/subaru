#### TEST CASE MODULE
package TC_DHSWIM_Proveout_Steady_TimingCheck;
        

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

our $PURPOSE = "Check timing from Fault qualified to Request signal sent";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_Proveout_Steady_TimingCheck

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. IGN ON and wait for <t_Proveout>

2. Create <Fault> condition and wait for time <t_Qual> ms

3. Check fault recorder

4. Check state of <DHSWL_signal> 

5. Remove <Fault> condition, wait for <t_Dequal> ms

6. Check fault recorder 

7. Check state of <DHSWL_signal>


I<B<Evaluation>>

1.

2.  

3. <Fault> is in <Fault_state>

4. <DHSWL_signal> change s from $0 to $3 within 120 ms from step 2

5.

6.  <Fault> is in <Fault_state_after> 

7. <DHSWL_signal> change s from $3 to $0 within 120 ms from step 5


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 't_Proveout' => 
	SCALAR 't_Qual' => 
	SCALAR 't_Dequal' => 
	SCALAR 'DHSWL_signal' => 
	SCALAR 'Fault_state' => 
	SCALAR 'Fault_state_after' => 
	SCALAR 'Fault' => 


=head2 PARAMETER EXAMPLES

	purpose = 'Check timing from Fault qualified to Request signal sent'
	
	t_Proveout = '8000' #ms  (+/-300ms) 
	t_Qual = 2300' #ms
	t_Dequal = '2500' #ms
	DHSWL_signal = 'DHS_RILReq'
	
	Fault_state = 'Qualified'
	Fault_state_after = 'Dequalified'
	Fault = 'rb_psem_Short2GndPCS2D_flt'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_t_Proveout;
my $tcpar_t_Qual;
my $tcpar_t_Dequal;
my $tcpar_DHSWL_signal;
my $tcpar_Fault_state;
my $tcpar_Fault_state_after;
my $tcpar_Fault;

################ global parameter declaration ###################
#add any global variables here
my $fault_struct;
my $Provetime_Obt_8;
my $Provetime_Obt_8_after;
my $fault_struct_after;
my @Provetime_Obt_8_after_arr;
my @Provetime_Obt_8_arr;


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_t_Proveout =  GEN_Read_mandatory_testcase_parameter( 't_Proveout' );
	$tcpar_t_Qual =  GEN_Read_mandatory_testcase_parameter( 't_Qual' );
	$tcpar_t_Dequal =  GEN_Read_mandatory_testcase_parameter( 't_Dequal' );
	$tcpar_DHSWL_signal =  GEN_Read_mandatory_testcase_parameter( 'DHSWL_signal' );
	$tcpar_Fault_state =  GEN_Read_mandatory_testcase_parameter( 'Fault_state' );
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

	S_teststep("IGN ON and wait for '$tcpar_t_Proveout'", 'AUTO_NBR');
	   LC_SetVoltage('U_BATT_DEFAULT');
	   LC_ECU_On();
       S_wait_ms( $tcpar_t_Proveout );	

	S_teststep("Create '$tcpar_Fault' condition and wait for time '$tcpar_t_Qual' ms", 'AUTO_NBR');
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
		S_wait_ms( $tcpar_t_Qual);
			my $status = 0;	
			while ($status eq '0') {
				$fault_struct = PD_ReadFaultMemory(1);
				$status = PD_get_fault_status( $fault_struct, $tcpar_Fault );
			}
		

	S_teststep("Check state of '$tcpar_DHSWL_signal' ", 'AUTO_NBR', 'check_state_of_A');			#measurement 2
 		 S_wait_ms(50);
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8 =~ s/0x//;
		 push( @Provetime_Obt_8_arr, hex($Provetime_Obt_8) );
		}


 	# move #measurement 1 to here because ReadFaultMemory time may affect to timing check
	S_teststep("Check fault recorder", 'AUTO_NBR', 'check_fault_recorder_A');			#measurement 1
		$fault_struct = PD_ReadFaultMemory(1);
	


	S_teststep("Remove '$tcpar_Fault' condition, wait for '$tcpar_t_Dequal' ms", 'AUTO_NBR');
		FM_removeFault($tcpar_Fault); #used for TSG4	
		S_wait_ms( $tcpar_t_Dequal );	
			my $status = '0xAF';	
			while ($status eq '0xAF') {
				$fault_struct_after = PD_ReadFaultMemory(1);
				$status = PD_get_fault_status( $fault_struct_after, $tcpar_Fault );
			}		

	S_teststep("Check state of '$tcpar_DHSWL_signal'", 'AUTO_NBR', 'check_state_of_B');			#measurement 4
		 S_wait_ms( 45 );	#wait for new expected updated value	
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8_after) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8_after =~ s/0x//;
		 push( @Provetime_Obt_8_after_arr, hex($Provetime_Obt_8_after) );
		}
	
	S_teststep("Check fault recorder ", 'AUTO_NBR', 'check_fault_recorder_B');			#measurement 3 moved to here for not affecting to timming check   	
		$fault_struct_after = PD_ReadFaultMemory(1);


	return 1;
}

sub TC_evaluation {


	S_teststep_expected("'$tcpar_DHSWL_signal' change s from '0x0' to '0x3' within 120 ms from step 2", 'check_state_of_A');			#evaluation 2
	   foreach (@Provetime_Obt_8_arr) {
	   S_teststep_detected("Observed value : '$_' ", 'check_state_of_A');	
	   EVAL_evaluate_value ("Observed value :",	$_, "==", 3 );
	   }
	   	
	S_teststep_expected("'$tcpar_Fault' is in '$tcpar_Fault_state'", 'check_fault_recorder_A');			#evaluation 1
    		push(my @state,@{$fault_struct->{'state'}});
    		push(my @flt,@{$fault_struct->{'fault_text'}});			
    	    PD_check_fault_status( $fault_struct, $tcpar_Fault, '0bxxxx1x11' );
    	    S_teststep_detected("Fault '@flt' is in '@state' ", 'check_fault_recorder_A');
    	    	


	S_teststep_expected("'$tcpar_DHSWL_signal' change s from '0x3' to '0x0' within 120 ms from step 5", 'check_state_of_B');			#evaluation 4
	   foreach (@Provetime_Obt_8_after_arr) {
	   S_teststep_detected("Observed value : '$_' ", 'check_state_of_B');	
	   EVAL_evaluate_value ("Observed value :",	$_, "==", 0 );
	   }
	
	# Evaluation 3 moved to here for not affecting to timming check   	
	S_teststep_expected("'$tcpar_Fault' is in '$tcpar_Fault_state_after' ", 'check_fault_recorder_B');			#evaluation 3
   	    PD_check_fault_status( $fault_struct_after, $tcpar_Fault, '0bxxxx1xx0' );
    	push(my @state1,@{$fault_struct_after->{'state'}});
    	push(my @flt1,@{$fault_struct_after->{'fault_text'}});	   	    
	   	S_teststep_detected("Fault '@flt1' is in '@state1' ", 'check_fault_recorder_B');
	   	    
 

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
	else {}
	FM_removeFault($tcpar_Fault); #Remove fault condition from TSG4	
	S_wait_ms( 5000 );		
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}


1;
