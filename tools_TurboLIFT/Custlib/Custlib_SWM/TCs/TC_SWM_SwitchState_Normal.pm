#### TEST CASE MODULE
package TC_SWM_SwitchState_Normal;

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

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_SWM_SwitchState_Normal

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set value and boundary value of 'PositionA' for <Switch>

2. Read the state and status of switch

3. Set value and boundary value of 'PositionB'

4. Read the state and status of switch

#repeat above steps with from 'PositionB' to 'PositionA'


I<B<Evaluation>>

1.

2. the active state of switch is <Switch_state_1> and the status is <Status_of_switch>

3.

4. the active state of switch is <Switch_state_2> and the status is <Status_of_switch>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Purpose' => 
	SCALAR 'Switch' => 
	SCALAR 'Switch_state_1' => 
	SCALAR 'Switch_state_2' => 
	SCALAR 'Status_of_switch' => 


=head2 PARAMETER EXAMPLES

	Purpose = 'Checking the state of Switch in High band and Low band' # description of test case
	
	# input 
	Switch = '<Test Heading>'
	
	#output
	Switch_state_1 ='PositionA' (not buckled, seat back, airbag off,  seat not occupied)
	Switch_state_2 ='PositionB' (buckled, seat front, airbag on,  seat occupied)
	
	Status_of_switch = 'valid'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Purpose;
my $tcpar_Switch;
my $tcpar_Switch_state_1;
my $tcpar_Switch_state_2;
my $tcpar_Status_of_switch;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_Purpose =  GEN_Read_mandatory_testcase_parameter( 'Purpose' );
	$tcpar_Switch =  GEN_Read_mandatory_testcase_parameter( 'Switch' );
	$tcpar_Switch_state_1 =  GEN_Read_mandatory_testcase_parameter( 'Switch_state_1' );
	$tcpar_Switch_state_2 =  GEN_Read_mandatory_testcase_parameter( 'Switch_state_2' );
	$tcpar_Status_of_switch =  GEN_Read_mandatory_testcase_parameter( 'Status_of_switch' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set value and boundary value of 'PositionA' for '$tcpar_Switch'", 'AUTO_NBR');

	S_teststep("Read the state and status of switch", 'AUTO_NBR', 'read_the_state_A');			#measurement 1

	S_teststep("Set value and boundary value of 'PositionB'", 'AUTO_NBR');

	S_teststep("Read the state and status of switch", 'AUTO_NBR', 'read_the_state_B');			#measurement 2

	S_teststep("#repeat above steps with from 'PositionB' to 'PositionA'", 'AUTO_NBR');

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("the active state of switch is '$tcpar_Switch_state_1' and the status is '$tcpar_Status_of_switch'", 'read_the_state_A');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'read_the_state_A');

	S_teststep_expected("the active state of switch is '$tcpar_Switch_state_2' and the status is '$tcpar_Status_of_switch'", 'read_the_state_B');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'read_the_state_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
