#### TEST CASE MODULE
package TC_SWM_SwitchState_with_Fault;

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

##################################
#include further modules here
use LIFT_labcar;
use LIFT_can_access;
use LIFT_CANoe;
use LIFT_ProdDiag;
use LIFT_PD2ProdDiag;
use LIFT_FaultMemory;
use LIFT_evaluation;
use LIFT_general;
use FuncLib_TNT_COM;
use LIFT_PD;
use Data::Dumper;
use FuncLib_SYC_INTERFACE;
use FuncLib_TNT_SYC_INTERFACE;
use FuncLib_TNT_FM;
use FuncLib_TNT_GEN;
use LIFT_DCOM;
##################################

our $PURPOSE = "<This testscript validates switch status when Fault happend by changing switch state Unbuckled to buckled and opposite side >";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_SWM_SwitchState_with_Fault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <Switch> at position A 

2. Make <Fault> with <Switch> at position A.

3.Waiting for <QualificationTime>

4. Change <Switch> to position B.

5. Remove Fault condition. 

6. Clear Fault and Waiting for <DequalificationTime>


I<B<Evaluation>>

1. Read the state and status are: <Switch_state_1> and <Status_of_switch_1>

3. Read the state and status are :<Switch_state_1> and <Status_of_switch_2>

6. Read the state and status are :<Switch_state_2> and <Status_of_switch_1>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Purpose' => 
	SCALAR 'Switch' => 
	SCALAR 'Switch_state_1' => 
	SCALAR 'Switch_state_2' => 
	SCALAR 'Status_of_switch_1' => 
	SCALAR 'Status_of_switch_2' => 
	SCALAR 'Fault' => 
	SCALAR 'QualificationTime' => 
	SCALAR 'DequalificationTime' => 


=head2 PARAMETER EXAMPLES

	Purpose ='checking the state and status of switch when create fault condition'
	
	# input parameters 
	Switch = '<Test Heading>'
	
	#State of Switch
	Switch_state_1 ='PositionA' #Unbuckled
	Switch_state_2 ='PositionB' #Buckled
	
	Status_of_switch_1 = 'valid'
	Status_of_switch_2 = 'fault'
	
	#Fault 
	Fault = 'Short2Gnd'
	QualificationTime = 2000#mS
	DequalificationTime = 4000#mS

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Purpose;
my $tcpar_Switch;
my $tcpar_Switch_state_1;
my $tcpar_Switch_state_2;
my $tcpar_Status_of_switch_1;
my $tcpar_Status_of_switch_2;
my $tcpar_Fault;
my $tcpar_QualificationTime;
my $tcpar_DequalificationTime;

################ global parameter declaration ###################
#add any global variables here
my $faultMemory;
my $success;
my $Signal_MET390_6_0_SEATBELT_DRVR;
my $signal_value;
my $SW_status;
my $MET390;
###############################################################

sub TC_set_parameters {

	$tcpar_Purpose =  GEN_Read_mandatory_testcase_parameter( 'Purpose' );
	$tcpar_Switch =  GEN_Read_mandatory_testcase_parameter( 'Switch' );
	$tcpar_Switch_state_1 =  GEN_Read_mandatory_testcase_parameter( 'Switch_state_1' );
	$tcpar_Switch_state_2 =  GEN_Read_mandatory_testcase_parameter( 'Switch_state_2' );
	$tcpar_Status_of_switch_1 =  GEN_Read_mandatory_testcase_parameter( 'Status_of_switch_1' );
	$tcpar_Status_of_switch_2 =  GEN_Read_mandatory_testcase_parameter( 'Status_of_switch_2' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_QualificationTime =  GEN_Read_mandatory_testcase_parameter( 'QualificationTime' );
	$tcpar_DequalificationTime =  GEN_Read_mandatory_testcase_parameter( 'DequalificationTime' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();	
	S_wait_ms(5000);
	return 1;
}

sub TC_stimulation_and_measurement {   
	my $state_posA = $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{"DataValueTable_SwitchStates_PD"}->{"STATE_POSITIONA"};    #position A
	my $state_posB = $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{"DataValueTable_SwitchStates_PD"}->{"STATE_POSITIONB"};    #position B
	my $status_valid= $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{"DataValueTable_SwitchStates_PD"}->{"STATUS_VALID"};    #status_valid
	my $status_fault = $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{"DataValueTable_SwitchStates_PD"}->{"STATUS_FAULT"};    #status_fault
	my ( $fault, $short2gnd_value ) = SYC_get_ScipPM_Content( [ 'Switches', 'DeviceData', $tcpar_Switch, 'Short2GndValue' ] );
	my ( $init, $ConstantCurrent) = SYC_get_ScipPM_Content( [ 'Switches', 'DeviceData', $tcpar_Switch, 'ConstantCurrent' ] );
	my ( $name_switch1, $posA ) = SYC_get_ScipPM_Content( [ 'Switches', 'DeviceData', $tcpar_Switch, 'PositionA' ] );
	my ( $name_switch2, $posB ) = SYC_get_ScipPM_Content( [ 'Switches', 'DeviceData', $tcpar_Switch, 'PositionB' ] );
	my $myfault  = $LIFT_PROJECT::Defaults->{"Mapping_FAULT"}->{$tcpar_Fault}->{'FAULTLIST'}->{'rb_swm_ShortLineBLFD_flt'};
	my $name_switch  = $LIFT_PROJECT::Defaults->{"Mapping_DEVICE"}->{$tcpar_Switch}->{'label'};
	$Signal_MET390_6_0_SEATBELT_DRVR = $LIFT_PROJECT::Defaults->{"Mapping_CAN"}->{$tcpar_Switch}->{'SIGNAL_NAME'};
	$MET390 = $LIFT_PROJECT::Defaults->{"Mapping_CAN"}->{$tcpar_Switch}->{'MET390_Rx'};
	S_wait_ms(1000);
	if ($name_switch  ne 'SPSFD'){			
		#1.set switch in position A
		S_teststep("Set '$tcpar_Switch' at position A ", 'AUTO_NBR', 'set_switch_at');			#measurement 1
			if ($state_posA == 0){
				S_teststep_expected("Read the state and status are: '$tcpar_Switch_state_1' and '$tcpar_Status_of_switch_1'", 'set_switch_at');			#evaluation 1
				S_teststep_detected("Observed state and status of switch:'$tcpar_Switch_state_1' and  '$tcpar_Status_of_switch_1'", 'set_switch_at');
				EVAL_evaluate_value(' $state_posA', 0,  '==', '0x0' );
				EVAL_evaluate_value(' $status_valid', 1,  '==', '0x01' );
			}
			else {
				S_teststep("Check posion A");
			}
		#2.Make fault	
		S_teststep("Make '$tcpar_Fault' with '$tcpar_Switch' at position A.", 'AUTO_NBR');
		$short2gnd_value = 20 ;	 #set value of switch to make Short2Grnd fault, refer to SYC Hall switch 
			if ($short2gnd_value == 20){
				FM_createFault('rb_swm_ShortLineBLFD_flt');
				my $faultMemory = PRD_Read_Fault_Memory('BOSCH');
				S_wait_ms(1000);
				EVAL_evaluate_string('$faultMemory', $myfault, 'rb_swm_ShortLineBLFD_flt');
				S_wait_ms(100);
			}
		#3.waiting for read fault memory
			 S_teststep("Waiting for '$tcpar_QualificationTime'", 'AUTO_NBR', 'waiting_for_qualificationtime');			#measurement 2
			 S_teststep_expected("Read the state and status are :'$tcpar_Switch_state_1' and '$tcpar_Status_of_switch_2'", 'waiting_for_qualificationtime');			#evaluation 2
			 S_teststep_detected("Observed state and status of switch:'$tcpar_Switch_state_1' and  '$tcpar_Status_of_switch_2'", 'waiting_for_qualificationtime');
			 EVAL_evaluate_value(' $state_posA', 0,  '==', '0x0' );
			 EVAL_evaluate_value(' $status_fault', 2,  '==', '0x02' );
			 S_wait_ms(2000);
					
		#4.set switch in position B
			S_teststep("Change '$tcpar_Switch' to position B.", 'AUTO_NBR');
			
		#5.Remove fault condtion	
			S_teststep("Remove Fault condition. ", 'AUTO_NBR');
			DEVICE_undoShortLines ();
				 
		#6.Clear fault on memory
			S_teststep("Clear Fault and Waiting for '$tcpar_DequalificationTime'", 'AUTO_NBR', 'clear_fault_and');			#measurement 3
			$success = PRD_Clear_Fault_Memory();
			S_wait_ms(4000);
			S_teststep_expected("Read the state and status are :'$tcpar_Switch_state_2' and '$tcpar_Status_of_switch_1'", 'clear_fault_and');			#evaluation 3
			S_teststep_detected("Observed state and status of switch:'$tcpar_Switch_state_2' and '$tcpar_Status_of_switch_1'", 'clear_fault_and');
			EVAL_evaluate_value( '$state_posB',  1,  '==', '0x1' );
			EVAL_evaluate_value(' $status_valid', 1,  '==', '0x01' );
	}
	
	elsif ($name_switch  eq 'SPSFD'){
		#1.set switch in position A
		S_teststep("Set '$tcpar_Switch' at position A ", 'AUTO_NBR', 'set_switch_at');			#measurement 1
		$Signal_MET390_6_0_SEATBELT_DRVR = CA_write_can_signal('MET390_6_0_SEATBELT_DRVR', '1', 'phys');#set SPSFD at position A _unbuckled belt
		$signal_value  = CA_read_can_signal("$Signal_MET390_6_0_SEATBELT_DRVR" , '1', 'phys');
		S_teststep_expected("Read the state and status are: '$tcpar_Switch_state_1' and '$tcpar_Status_of_switch_1'", 'set_switch_at');			#evaluation 1
		S_teststep_detected("Observed state and status of switch:'$tcpar_Switch_state_1' and  '$tcpar_Status_of_switch_1'", 'set_switch_at');
		
		#2.Make fault//Create Timeout fault by stop sending msg 390
		S_teststep("Make '$tcpar_Fault' with '$tcpar_Switch' at position A.", 'AUTO_NBR');
		S_teststep( "Create Timeout fault by stop sending message MET390");
		COM_stopMessages( 'MET390_Rx', 'can' );
	   
		#3.waiting for read fault memory
		 S_teststep("Waiting for '$tcpar_QualificationTime'", 'AUTO_NBR', 'waiting_for_qualificationtime');			#measurement 2
		 $myfault  = PRD_Read_Fault_Memory($fault); 
		 S_teststep_expected("Read the state and status are :'$tcpar_Switch_state_1' and '$tcpar_Status_of_switch_2'", 'waiting_for_qualificationtime');			#evaluation 2
		 S_teststep_detected("Observed state and status of switch:'$tcpar_Switch_state_1' and  '$tcpar_Status_of_switch_2'", 'waiting_for_qualificationtime');
		 S_wait_ms(2000);		 
		
		#4.set switch in position B
		S_teststep("Change '$tcpar_Switch' to position B.", 'AUTO_NBR');
		$Signal_MET390_6_0_SEATBELT_DRVR = CA_write_can_signal('MET390_6_0_SEATBELT_DRVR', '0', 'phys');#set SPSFD at position B _buckled belt
		$signal_value  = CA_read_can_signal("$Signal_MET390_6_0_SEATBELT_DRVR" , '0', 'phys');
		#5.Remove fault condtion //sending msg 390
		S_teststep("Remove Fault condition. ", 'AUTO_NBR');
		COM_startMessages( 'MET390_Rx', 'can' );
		#6.Clear fault on memory
		S_teststep("Clear Fault and Waiting for '$tcpar_DequalificationTime'", 'AUTO_NBR', 'clear_fault_and');			#measurement 3
		DEVICE_resetDeviceState( $tcpar_Switch, $myfault );
		$success = PRD_Clear_Fault_Memory();
		S_wait_ms(4000);
		S_teststep_expected("Read the state and status are :'$tcpar_Switch_state_2' and '$tcpar_Status_of_switch_1'", 'clear_fault_and');			#evaluation 3
		S_teststep_detected("Observed state and status of switch:'$tcpar_Switch_state_2' and '$tcpar_Status_of_switch_1'", 'clear_fault_and');
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
