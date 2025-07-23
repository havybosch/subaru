#### TEST CASE MODULE
package TC_DHSWIM_Proveout_Steady_IdleMode;

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
use FuncLib_ACEA_TNT;

##################################

our $PURPOSE = "Check behavior of DHSWL after Proveout time if ECU in Idle mode";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DHSWIM_Proveout_Steady_IdleMode

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set The voltage to <Voltage> and check fault recorder.

2. Set ECU Idle Mode.

3. Reset ECU.

4. Wait for <ProveOut_Time>

5. Check ECU mode.

6. Check state of <DHSWL_signal> at <ProveOut_Time> continuously from IGN ON.


I<B<Evaluation>>

1.

2.

3.

4.

5. ECU goes to Idle mode.

6. 

7. <DHSWL_signal> shall be 0x1.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Voltage' => 
	SCALAR 'ProveOut_Time' => 
	SCALAR 'DHSWL_signal' => 


=head2 PARAMETER EXAMPLES

	purpose = 'Check behavior of DHSWL after Proveout time if ECU in Idle mode'
	
	Voltage = '<Test Heading>'
	ProveOut_Time = '8000' #ms  (+/-300ms)
	DHSWL_signal = 'DHS_RILReq'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Voltage;
my $tcpar_ProveOut_Time;
my $tcpar_DHSWL_signal;

################ global parameter declaration ###################
#add any global variables here
my ($IdleMode_var, $Value);
my $SystemMode = 'Idle';
my $Provetime_Obt;
my @Provetime_Obt_arr;
my $CheckValueOfMode;
my $checkECUMode;
my $tcpar_Fault_Voltage;
my $tcpar_Fault_Voltage_state;
my $fault_struct;


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Voltage =  GEN_Read_mandatory_testcase_parameter( 'Voltage' );
	$tcpar_ProveOut_Time =  GEN_Read_mandatory_testcase_parameter( 'ProveOut_Time' );
	$tcpar_DHSWL_signal =  GEN_Read_mandatory_testcase_parameter( 'DHSWL_signal' );
	$tcpar_Fault_Voltage =  GEN_Read_mandatory_testcase_parameter( 'Fault_Voltage' );
	$tcpar_Fault_Voltage_state =  GEN_Read_mandatory_testcase_parameter( 'Fault_Voltage_state' );
	

	return 1;
}

sub TC_initialization {

	S_w2rep("Standard_Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	S_wait_ms(5000);
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}




sub TC_stimulation_and_measurement {

	S_teststep("Set The voltage to '$tcpar_Voltage' and check fault recorder", 'AUTO_NBR', 'check_voltage_fault');
		LC_SetVoltage('U_BATT_DEFAULT');
    	LC_ECU_On();  	
    	S_wait_ms( $tcpar_ProveOut_Time);
   
       	if ($tcpar_Voltage eq 'NormalVoltage') {
    		LC_SetVoltage('U_BATT_DEFAULT');
    	}
    	elsif ($tcpar_Voltage eq 'LowVoltage') {
    		LC_SetVoltage('U_BATT_UNDERVOLTAGE');
    	}
    	else {
    	 	LC_SetVoltage('U_BATT_OVERVOLTAGE');
    	}	
    	S_wait_ms( 10000 );

		$fault_struct = PD_ReadFaultMemory(1);


	S_teststep("Set ECU Idle Mode.", 'AUTO_NBR');
		#($IdleMode_var, $Value) = ACEA_SetECUMode($SystemMode);
#		GEN_setECUMode ('IdleMode');
		GEN_setECUMode('IdleMode');
	    #S_user_action("Please, set IDLE manually");
			

	S_teststep("Reset ECU.", 'AUTO_NBR');
    	LC_ECU_Off();
    	S_wait_ms( 'TIMER_ECU_OFF' );
    	LC_ECU_On();  	


	S_teststep("Wait for '$tcpar_ProveOut_Time'", 'AUTO_NBR');
    	S_wait_ms( $tcpar_ProveOut_Time);

	S_teststep("Check ECU mode.", 'AUTO_NBR', 'check_ecu_mode');			#measurement 1
		$checkECUMode = PD_ReadMemoryByName('rb_bswm_ActualSystemMode_au16(0)');
		$CheckValueOfMode = S_aref2dec($checkECUMode, 'U16');
		S_w2rep("ECU check mode variable value:  $CheckValueOfMode");
		
		S_teststep_expected("ECU goes to Idle mode.", 'check_ecu_mode');			#evaluation 1
			if($CheckValueOfMode == 4){
				S_teststep_detected("ECU in IdleMode - with value mode: $CheckValueOfMode","check_ecu_mode");
			}
			else{
				S_teststep_detected("ECU is not in IdleMode","check_ecu_mode");
				S_set_verdict('VERDICT_FAIL');
			}		
		
	S_teststep("Check state of '$tcpar_DHSWL_signal' at '$tcpar_ProveOut_Time' continuously from IGN ON.", 'AUTO_NBR');
#		LC_ECU_Off();
#    	S_wait_ms( 'TIMER_ECU_OFF' );
#    	LC_ECU_On();
#    	S_wait_ms( $tcpar_ProveOut_Time + 300 );   #tolerance +/-300ms
    	GEN_printComment("-----Measuring the lamp signal after 8s prove out-----");
		foreach ( 1 .. 8 ) {S_w2rep( "Get the '$tcpar_DHSWL_signal' prove out in step $_\n",'blue' );
		($Provetime_Obt) = CA_read_can_signal($tcpar_DHSWL_signal, 'hex' );
		$Provetime_Obt =~ s/0x//;
		push( @Provetime_Obt_arr, hex($Provetime_Obt) );
		}
		
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault_Voltage' is in state '$tcpar_Fault_Voltage_state'", 'check_voltage_fault');
       	if ($tcpar_Voltage eq 'NormalVoltage') {
    	}
    	elsif ($tcpar_Voltage eq 'LowVoltage') {
    	    PD_check_fault_status( $fault_struct, 'rb_pom_VbatLow_flt', '0bxxxx1x11' );
    	}
    	else {
			 PD_check_fault_status( $fault_struct, 'rb_pom_VbatHigh_flt', '0bxxxx1x11' );
    	}
   	 	
   	 	push(my @state,@{$fault_struct->{'state'}});
     	push(my @flt,@{$fault_struct->{'fault_text'}});	
     	my $len = scalar(@flt);
     	if($len == 0){
     		S_teststep_detected("No Fault is Qualified ", 'check_voltage_fault');	 
     	}      
     	else {
	     	S_teststep_detected("Fault '@flt' is in state '@state' ", 'check_voltage_fault');	 
     	} 
            		

	S_teststep_expected("'$tcpar_DHSWL_signal' shall be 0x1.");
			foreach (@Provetime_Obt_arr) {
				EVAL_evaluate_value( "Observed value in Prove out time", $_, "==", '1' );
				S_teststep_detected("Observed value: '$_' ");					
			}

	return 1;
}

sub TC_finalization {
#	S_wait_ms(2000);
		GEN_setECUMode('RemoveIdleMode');
		S_wait_ms(10000);
		
		#my $myECUMode = Get_ECU_Mode();
		$checkECUMode = PD_ReadMemoryByName('rb_bswm_ActualSystemMode_au16(0)');
		$CheckValueOfMode = S_aref2dec($checkECUMode, 'U16');
		S_w2rep("ECU check mode variable value:  $CheckValueOfMode");
		if($CheckValueOfMode == 5){
			S_w2rep("ECU is in NormalMode");
			
		}else{
			S_w2rep("Any way! Please config ECU to NormalMode");
		}
	#GEN_setECUMode('RemoveIdleMode');
#	S_user_action("Please, remove IDLE manually");
	LC_ECU_Reset(); 
	PD_ClearFaultMemory();
	S_wait_ms(5000);
	return 1;
}


1;
