#### TEST CASE MODULE
package TC_COA_BSWStatus;

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

TC_COA_BSWStatus

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.After 5 secs from step 1.

3.Change the Buckle switch status sent from PODS as <Status>.

4.Check the ABG33A_3_0_BUCKLESW_PASS signal value of ABG33A message ID.


I<B<Evaluation>>

1.-

2.-

3.-

4.ABG33A_3_0_BUCKLESW_PASS signal value should be <value>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'value' => 
	SCALAR 'purpose' => 
	SCALAR 'Status' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the transmission of Buckle switch status data in ABG ECU.' # description of test case
	
	# input parameters
	Status='<Test Heading>'
	
	#output parameters
	value='10'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Status;
my $tcpar_value;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Status =  GEN_Read_mandatory_testcase_parameter( 'Status' );
	$tcpar_value =  GEN_Read_mandatory_testcase_parameter( 'value' );

	return 1;
}

sub TC_initialization {

	S_teststep("Standard Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN.", 'AUTO_NBR');

	S_teststep("After 5 secs from step 1.", 'AUTO_NBR');

	S_teststep("Change the Buckle switch status sent from PODS as '$tcpar_Status'.", 'AUTO_NBR');

	S_teststep("Check the ABG33A_3_0_BUCKLESW_PASS signal value of ABG33A message ID.", 'AUTO_NBR', 'check_the_abg33a');			#measurement 1

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("ABG33A_3_0_BUCKLESW_PASS signal value should be '$tcpar_value'", 'check_the_abg33a');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'check_the_abg33a');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
