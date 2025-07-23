#### TEST CASE MODULE
package TC_DHSWIM_Proveout_Steady_Faulty_BusOff;

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
use LIFT_PRITT;
##################################

our $PURPOSE = "Check behavior of DHSWL in Prove out & Steady State in Faulty and Busoff condition";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_Proveout_Steady_FaultyInBusOff

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. ECU ON and wait for <ProveOut_Time>.

2. Create <Fault1> condition wailt for <t_Qual>.

3.  Create <Fault2> condition wailt for <t_Qual_Busoff>.

4. Remove <Fault2> condition and wait for<t_Dequal_Busoff>.

5. Check fault recorder.

6. Check state of <DHSWL_signal>.


I<B<Evaluation>>

1.

2. 

3.

4.

5. <Fault1> is in <Fault_state1> and <Fault2> is in <Fault_state2>.

6. <DHSWL_signal> shall be in <Real_State>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 't_Qual' => 
	SCALAR 't_Qual_Bussoff' => 
	SCALAR 't_Dequal_Busof' => 
	SCALAR 't_wait' => 
	SCALAR 'Fault_state1' => 
	SCALAR 'Fault_state2' => 
	SCALAR 'Real_State' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'purpose' => 
	SCALAR 'ON_time_ms' => 
	SCALAR 'OFF_time_ms' => 
	SCALAR 'ProveOut_Time' => 
	SCALAR 'ON_State' => 
	SCALAR 'OFF_State' => 
	SCALAR 'DHSWL_signal' => 


=head2 PARAMETER EXAMPLES

	purpose = 'Check behavior of DHSWL in Prove out & Steady State in Faulty and Busoff condition' 
	
	ON_time_ms = '6000' #ms (+/-150ms)
	OFF_time_ms = '2000' #ms (+/-150ms)
	ProveOut_Time = '8000' #ms  (+/-300ms)
	ON_State = '1'
	OFF_State = '0'
	
	DHSWL_signal = 'DHS_RILReq'
	t_Qual = '2300'  #ms
	t_Qual_Bussoff = '1510' #ms
	t_Dequal_Busof = '1000' #ms
	t_wait = '5000' #ms
	Fault_state1 = 'Qualified'
	Fault_state2 = 'Stored'
	Real_State = '3'
	Fault1 = 'rb_psem_Short2GndPCS1P_flt' #2300ms
	Fault2 = 'Bus off fault'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_ON_time_ms;
my $tcpar_OFF_time_ms;
my $tcpar_ProveOut_Time;
my $tcpar_ON_State;
my $tcpar_OFF_State;
my $tcpar_DHSWL_signal;
my $tcpar_t_Qual;
my $tcpar_t_Qual_Busoff;
my $tcpar_t_Dequal_Busoff;
my $tcpar_t_wait;
my $tcpar_Fault_state1;
my $tcpar_Fault_state2;
my $tcpar_Real_State;
my $tcpar_Fault1;
my $tcpar_Fault2;

################ global parameter declaration ###################
#add any global variables here

my $fault_struct;
my $Provetime_Obt_0_4; 
my $Provetime_Obt_6_8;
my $Provetime_Obt_8;
my @Provetime_Obt_0_4_arr;
my @Provetime_Obt_8_arr;
my @Provetime_Obt_6_8_arr;
my @DTC;



###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_ON_time_ms =  GEN_Read_mandatory_testcase_parameter( 'ON_time_ms' );
	$tcpar_OFF_time_ms =  GEN_Read_mandatory_testcase_parameter( 'OFF_time_ms' );
	$tcpar_ProveOut_Time =  GEN_Read_mandatory_testcase_parameter( 'ProveOut_Time' );
	$tcpar_ON_State =  GEN_Read_mandatory_testcase_parameter( 'ON_State' );
	$tcpar_OFF_State =  GEN_Read_mandatory_testcase_parameter( 'OFF_State' );
	$tcpar_DHSWL_signal =  GEN_Read_mandatory_testcase_parameter( 'DHSWL_signal' );
	$tcpar_t_Qual =  GEN_Read_mandatory_testcase_parameter( 't_Qual' );
	$tcpar_t_Qual_Busoff =  GEN_Read_mandatory_testcase_parameter( 't_Qual_Busoff' );
	$tcpar_t_Dequal_Busoff =  GEN_Read_mandatory_testcase_parameter( 't_Dequal_Busoff' );
	$tcpar_t_wait =  GEN_Read_mandatory_testcase_parameter( 't_wait' );
	$tcpar_Fault_state1 =  GEN_Read_mandatory_testcase_parameter( 'Fault_state1' );
	$tcpar_Fault_state2 =  GEN_Read_mandatory_testcase_parameter( 'Fault_state2' );
	$tcpar_Real_State =  GEN_Read_mandatory_testcase_parameter( 'Real_State' );
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

	S_teststep("ECU ON and wait for '$tcpar_ProveOut_Time'.", 'AUTO_NBR');
		LC_SetVoltage('U_BATT_DEFAULT');		
		LC_ECU_On();
    	S_wait_ms( $tcpar_ProveOut_Time );	

	S_teststep("Create '$tcpar_Fault1' condition wailt for '$tcpar_t_Qual'.", 'AUTO_NBR');
		FM_createFault($tcpar_Fault1); #used for TSG4	
		S_wait_ms( $tcpar_t_Qual );	

	S_teststep("Create '$tcpar_Fault2' condition wailt for '$tcpar_t_Qual_Busoff'.", 'AUTO_NBR');
		#S_user_action("Set BusOff Fault");
		create_busoffCondtion();
		S_wait_ms( $tcpar_t_Qual_Busoff + 10000);
		
	S_teststep("Remove '$tcpar_Fault2' condition and wait for'$tcpar_t_Dequal_Busoff'.", 'AUTO_NBR');
        #S_user_action("Remove BusOff fault");
		remove_busoffCondtion();
		S_wait_ms( $tcpar_t_Dequal_Busoff + 5000 );	
		
	S_teststep("Check fault recorder.", 'AUTO_NBR', 'check_fault_recorder');			#measurement 1
		  $fault_struct = PD_ReadFaultMemory(1);

	S_teststep("Check state of '$tcpar_DHSWL_signal'.", 'AUTO_NBR', 'check_state_of');			#measurement 2
	     foreach ( 1 .. 8 ) { S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		  ($Provetime_Obt_8) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		  $Provetime_Obt_8 =~ s/0x//;
		 push( @Provetime_Obt_8_arr, hex($Provetime_Obt_8) );
		S_wait_ms(500);
		}
		
	return 1;
	
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault1' is in '$tcpar_Fault_state1' and '$tcpar_Fault2' is in '$tcpar_Fault_state2'.", 'check_fault_recorder');			#evaluation 1
    	PD_check_fault_status( $fault_struct, $tcpar_Fault1, '0bxxxx1x11' );
    	PD_check_fault_status( $fault_struct, $tcpar_Fault2, '0bxxxx1x10' );
    	push(my @state,@{$fault_struct->{'state'}});
    	push(my @flt,@{$fault_struct->{'fault_text'}});			
    	S_teststep_detected("Fault '@flt' is in state '@state' ", 'check_fault_recorder');

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be in '$tcpar_Real_State'.", 'check_state_of');			#evaluation 2
	   	foreach (@Provetime_Obt_8_arr) {
	  		EVAL_evaluate_value( "Observed value in '$tcpar_Real_State' from from from 8s from IGN ON :", $_, "==", $tcpar_Real_State );
			S_teststep_detected("Observed value after each 500ms: '$_' ", 'check_state_of');	  	
	  	}	

	return 1;
}


sub create_busoffCondtion{
	#using ""power Switch"" on Pritt tool to short CAN bus on TSG4 -> create Bus off
	PRT_power_connect();
	 return 1;
}

sub remove_busoffCondtion{
	#using Pritt tool to de-short CAN bus on TSG4 -> -> remove Bus off
    PRT_power_disconnect();
	 return 1;
}


sub TC_finalization {
	S_wait_ms(2000);
	FM_removeFault($tcpar_Fault1); #used for TSG4	
	S_wait_ms( 5000 );		
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}


1;
