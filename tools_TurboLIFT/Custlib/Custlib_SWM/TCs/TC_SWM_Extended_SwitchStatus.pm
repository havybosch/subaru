#### TEST CASE MODULE
package TC_SWM_Extended_SwitchStatus;

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

TC_SWM_Extended_SwitchStatus

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

TC1: MonitoredBit = '1' and ConfiguredBit ='1'

TC2: MonitoredBit = '1' and ConfiguredBit ='0'


I<B<Stimulation and Measurement>>

1. Switch is available as Present

2. Make ECU HW reset and wait for initalization with  <status_of_switch_1>.

3. Read the extended status of <Switch> in current Position

4. Create <Fault> and wait for <QuafiticationTime> and <status_of_switch_2>

5. Read the extended status of <Switch>

6. Remove and Clear fault condition then wait for <DequalificationTime> and <status_of_switch_1>

7. Read the extended status of <Switch>

8. Make not Present by Open line <Switch> and wait for <QuafiticationTime> and <status_of_switch_2>

9. Read the extended status of <Switch>

10. Remove and Clear fault condition and wait for <DequalificationTime>and <status_of_switch_1>

11. Read the extended status of <Switch>


I<B<Evaluation>>

3. The extended status is <ExtendedStatus_1> 

5. The extended status is <ExtendedStatus_2> 

7. The extended status is <ExtendedStatus_1> 

9. The extended status is <ExtendedStatus_3> 

11. The extended status is <ExtendedStatus_1> 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Purpose' => 
	SCALAR 'Switch' => 
	SCALAR 'MonitoredBit' => 
	SCALAR 'ConfiguredBit' => 
	SCALAR 'Extended_status_of_switch_1' => 
	SCALAR 'Extended_status_of_switch_2' => 
	SCALAR 'Extended_status_of_switch_3' => 
	SCALAR 'status_of_switch_1' => 
	SCALAR 'status_of_switch_2' => 
	SCALAR 'Fault' => 
	SCALAR 'QualificationTime' => 
	SCALAR 'DequalificationTime' => 


=head2 PARAMETER EXAMPLES

	Purpose ='checking the Extended status of switch'
	
	# input parameters 
	Switch = '<Test Heading>'
	
	MonitoredBit = '1'
	ConfiguredBit = '1'
	
	#Extended status of Switch
	Extended_status_of_switch_1 = 'valid'
	Extended_status_of_switch_2 = 'fault'
	Extended_status_of_switch_3 = 'NotPresent'
	
	#Status of switch
	status_of_switch_1 = 'valid'
	status_of_switch_2 = 'fault'
	
	#Fault 
	Fault = 'Short2Gnd'
	QualificationTime = 2000#mS
	DequalificationTime = 4000#mS

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_Purpose;
my $tcpar_Switch;
my $tcpar_MonitoredBit;
my $tcpar_ConfiguredBit;
my $tcpar_Extended_status_of_switch_1;
my $tcpar_Extended_status_of_switch_2;
my $tcpar_Extended_status_of_switch_3;
my $tcpar_status_of_switch_1;
my $tcpar_status_of_switch_2;
my $tcpar_Fault;
my $tcpar_QualificationTime;
my $tcpar_DequalificationTime;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_Purpose =  GEN_Read_mandatory_testcase_parameter( 'Purpose' );
	$tcpar_Switch =  GEN_Read_mandatory_testcase_parameter( 'Switch' );
	$tcpar_MonitoredBit =  GEN_Read_mandatory_testcase_parameter( 'MonitoredBit' );
	$tcpar_ConfiguredBit =  GEN_Read_mandatory_testcase_parameter( 'ConfiguredBit' );
	$tcpar_Extended_status_of_switch_1 =  GEN_Read_mandatory_testcase_parameter( 'Extended_status_of_switch_1' );
	$tcpar_Extended_status_of_switch_2 =  GEN_Read_mandatory_testcase_parameter( 'Extended_status_of_switch_2' );
	$tcpar_Extended_status_of_switch_3 =  GEN_Read_mandatory_testcase_parameter( 'Extended_status_of_switch_3' );
	$tcpar_status_of_switch_1 =  GEN_Read_mandatory_testcase_parameter( 'status_of_switch_1' );
	$tcpar_status_of_switch_2 =  GEN_Read_mandatory_testcase_parameter( 'status_of_switch_2' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_QualificationTime =  GEN_Read_mandatory_testcase_parameter( 'QualificationTime' );
	$tcpar_DequalificationTime =  GEN_Read_mandatory_testcase_parameter( 'DequalificationTime' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("TC1: MonitoredBit = '1' and ConfiguredBit ='1'", 'AUTO_NBR');

	S_teststep("TC2: MonitoredBit = '1' and ConfiguredBit ='0'", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch is available as Present", 'AUTO_NBR');

	S_teststep("Make ECU HW reset and wait for initalization with  '$tcpar_status_of_switch_1'.", 'AUTO_NBR');

	S_teststep("Read the extended status of '$tcpar_Switch' in current Position", 'AUTO_NBR', 'read_the_extended_A');			#measurement 1

	S_teststep("Create '$tcpar_Fault' and wait for '$tcpar_QuafiticationTime' and '$tcpar_status_of_switch_2'", 'AUTO_NBR');

	S_teststep("Read the extended status of '$tcpar_Switch'", 'AUTO_NBR', 'read_the_extended_B');			#measurement 2

	S_teststep("Remove and Clear fault condition then wait for '$tcpar_DequalificationTime' and '$tcpar_status_of_switch_1'", 'AUTO_NBR');

	S_teststep("Read the extended status of '$tcpar_Switch'", 'AUTO_NBR', 'read_the_extended_C');			#measurement 3

	S_teststep("Make not Present by Open line '$tcpar_Switch' and wait for '$tcpar_QuafiticationTime' and '$tcpar_status_of_switch_2'", 'AUTO_NBR');

	S_teststep("Read the extended status of '$tcpar_Switch'", 'AUTO_NBR', 'read_the_extended_D');			#measurement 4

	S_teststep("Remove and Clear fault condition and wait for '$tcpar_DequalificationTime'and '$tcpar_status_of_switch_1'", 'AUTO_NBR');

	S_teststep("Read the extended status of '$tcpar_Switch'", 'AUTO_NBR', 'read_the_extended_E');			#measurement 5

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("The extended status is '$tcpar_ExtendedStatus_1' ", 'read_the_extended_A');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'read_the_extended_A');

	S_teststep_expected("The extended status is '$tcpar_ExtendedStatus_2' ", 'read_the_extended_B');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'read_the_extended_B');

	S_teststep_expected("The extended status is '$tcpar_ExtendedStatus_1' ", 'read_the_extended_C');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'read_the_extended_C');

	S_teststep_expected("The extended status is '$tcpar_ExtendedStatus_3' ", 'read_the_extended_D');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'read_the_extended_D');

	S_teststep_expected("The extended status is '$tcpar_ExtendedStatus_1' ", 'read_the_extended_E');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'read_the_extended_E');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
