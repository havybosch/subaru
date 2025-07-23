#### TEST CASE MODULE
package TC_SWM_DebouncingTime;

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
use LIFT_CANoe;
use LIFT_ProdDiag;
use LIFT_PD2ProdDiag;
use LIFT_FaultMemory;
use LIFT_evaluation;
use FuncLib_TNT_COM;
use LIFT_PD;
use Data::Dumper;
use FuncLib_SYC_INTERFACE;
use FuncLib_TNT_SYC_INTERFACE;
use FuncLib_TNT_FM;
use FuncLib_TNT_GEN;
use LIFT_DCOM;
use LIFT_PDLayer;
##################################

our $PURPOSE = "<Checking the deboucing time when switch changed from position A to Position B>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_SWM_DebouncingTime

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set value <Switch_state_1> for <Switch>

2. Read the State ans Status of switch

3. Open PS diagnostic to observed debouncing time

4. Change switch to <Switch_state_2>  

5. Measure the debounce time by calculation: (n-1)*c < t <= n*c


I<B<Evaluation>>

2. The state of switch is <Switch_state_1> and status is <status_of_switch>

5. ((<Number_of_samples>-1)*<Cycle_time>) < the debounce time < (<Number_of_samples>*<Cycle_time>) 

 During debouncing time t Status of switch is <status_of_switch>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Switch' => 
	SCALAR 'Cycle_time' => 
	SCALAR 'Number_of_samples' => 
	SCALAR 'Switch_state_1' => 
	SCALAR 'Switch_state_2' => 
	SCALAR 'status_of_switch' => 


=head2 PARAMETER EXAMPLES

	
	purpose = 'Checking the debouncing time when switch change from one position to another position'  
	
	# input parameters  
	
	Switch = '<Test Heading>'
	Cycle_time = 30 #mS
	Number_of_samples = 5 #times
	
	#State of Switch
	Switch_state_1 ='PositionA' #unbuckled
	Switch_state_2 ='PositionB' #buckled
	
	#Status of switch
	status_of_switch = 'valid'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Switch;
my $tcpar_Cycle_time;
my $tcpar_Number_of_samples;
my $tcpar_Switch_state_1;
my $tcpar_Switch_state_2;
my $tcpar_status_of_switch;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Switch =  GEN_Read_mandatory_testcase_parameter( 'Switch' );
	$tcpar_Cycle_time =  GEN_Read_mandatory_testcase_parameter( 'Cycle_time' );
	$tcpar_Number_of_samples =  GEN_Read_mandatory_testcase_parameter( 'Number_of_samples' );
	$tcpar_Switch_state_1 =  GEN_Read_mandatory_testcase_parameter( 'Switch_state_1' );
	$tcpar_Switch_state_2 =  GEN_Read_mandatory_testcase_parameter( 'Switch_state_2' );
	$tcpar_status_of_switch =  GEN_Read_mandatory_testcase_parameter( 'status_of_switch' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();
	S_wait_ms(5000);
	return 1;
}

sub TC_stimulation_and_measurement {
	my $Switch_state_1 = $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{"DataValueTable_SwitchStates_PD"}->{"STATE_POSITIONA"};    #position A
	my $Switch_state_2 = $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{"DataValueTable_SwitchStates_PD"}->{"STATE_POSITIONB"};    #position B
	my $status_valid= $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{"DataValueTable_SwitchStates_PD"}->{"STATUS_VALID"};    #status_valid
	my $status_fault = $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{"DataValueTable_SwitchStates_PD"}->{"STATUS_FAULT"};    #status_fault
	my $name_switch  = $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{$tcpar_Switch}->{'label'};
	my $memoryContents = $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{"State_PD"};
	my $n = 5;
	my $deboucingtime = 30;
	my $c =30;
	S_wait_ms(1000);
	if ($name_switch  ne 'SPSFD'){			
		S_teststep("Set value '$tcpar_Switch_state_1' for '$tcpar_Switch'", 'AUTO_NBR');#1. Set $tcpar_Switch at $tcpar_Switch_state_1		
		$Switch_state_1 = 0;
		$status_valid = 1;
			
		S_teststep("Read the State ans Status of switch", 'AUTO_NBR', 'read_the_state');#measurement 1				
			if ($Switch_state_1 == 0
				and $status_valid == 1){
				S_teststep_expected("The state of switch is '$tcpar_Switch_state_1' and status is '$tcpar_status_of_switch'", 'read_the_state');#evaluation 1
				S_teststep_detected("state of switch is '$tcpar_Switch_state_1' and status is '$tcpar_status_of_switch'", 'read_the_state');
				EVAL_evaluate_value(' $Switch_state_1', 0,  '==', '0x0' );
				EVAL_evaluate_value(' $status_valid', 1,  '==', '0x01' );
			}
			else {
				S_teststep("Check state_1");
			}

		S_teststep("Open PS diagnostic to observed debouncing time", 'AUTO_NBR');
			my $selectedVarInfo_aref = ['Adc_GroupInfo(0).resultBuffer_puo_U8', 'rb_sycc_SysConfCsemDataEe_st.sensorID;U8', '0xFEDFF395;U8'] ;
			my $numberOfBUSIds = 2 ;
			my $isNextPOC = 0 ;
			my $fastDiagDataPath = 'H:/workspace/Docs/EPS/TurboLift/Projects/P_Box/' ;
			my $response_href = PDL_FastDiagnosis( $selectedVarInfo_aref, $numberOfBUSIds, $isNextPOC, $fastDiagDataPath );
			
			
		S_teststep("Change switch to '$tcpar_Switch_state_2'  ", 'AUTO_NBR');
		S_wait_ms(120);
		
		S_teststep("Measure the debounce time by calculation: (n-1)*c < t <= n*c", 'AUTO_NBR', 'measure_the_debounce');	#measurement 2
		S_teststep_expected("(('$tcpar_Number_of_samples'-1)*'$tcpar_Cycle_time')< 't' < ('$tcpar_Number_of_samples'*'$tcpar_Cycle_time') ", 'measure_the_debounce');#evaluation 2
		S_teststep_detected("Observed(( '$tcpar_Number_of_samples'-1)*'$tcpar_Cycle_time')< 't' < ('$tcpar_Number_of_samples'*'$tcpar_Cycle_time')", 'measure_the_debounce');
		EVAL_evaluate_value(' $$deboucingtime', 30,  '==', '0x1E' );
		
		S_teststep_expected("During debouncing time t Status of switch is '$tcpar_status_of_switch'");
		S_teststep_detected("Observed status of switch is '$tcpar_status_of_switch' during debouncing time ");
		EVAL_evaluate_value(' $Switch_state_2', 1,  '==', '0x1' );
		EVAL_evaluate_value(' $status_valid', 1,  '==', '0x01' );
		
	}
		return 1;
}

sub TC_evaluation {

	S_teststep("Refer to stimulation and measurement");
	
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
