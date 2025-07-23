#### TEST CASE MODULE
package TC_COA_Triggerforevent;

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

TC_COA_Triggerforevent

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.Wait for 7 secs.

3.Create <fault> and check the <Message> transmission.

4.After Step 3 ,check the <Message> message transmission time


I<B<Evaluation>>

1.-

2.

3.Trigger message of<Message>should be transmitted within  <Event_frame> from previous message frame.

4.<Message> should be retriggered cyclically at<cyclic_time>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Message' => 
	SCALAR 'fault' => 
	SCALAR 'Event_frame' => 
	SCALAR 'cyclic_time' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the event mode transmission of ABG ECU' # description of test case
	
	# input parameters
	Message='<Test Heading 1>'
	fault='rb_sqm_SquibResistanceOpenAB1FD_flt'# fault which trigger warning lamp to ON state'.
	
	#output parameters
	Event_frame=20#ms
	cyclic_time=120#ms

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Message;
my $tcpar_fault;
my $tcpar_Event_frame;
my $tcpar_cyclic_time;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_fault =  GEN_Read_mandatory_testcase_parameter( 'fault' );
	$tcpar_Event_frame =  GEN_Read_mandatory_testcase_parameter( 'Event_frame' );
	$tcpar_cyclic_time =  GEN_Read_mandatory_testcase_parameter( 'cyclic_time' );

	return 1;
}

sub TC_initialization {

	S_teststep("Standard Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN.", 'AUTO_NBR');

	S_teststep("Wait for 7 secs.", 'AUTO_NBR');

	S_teststep("Create '$tcpar_fault' and check the '$tcpar_Message' transmission.", 'AUTO_NBR', 'create_fault_and');			#measurement 1

	S_teststep("After Step 3 ,check the '$tcpar_Message' message transmission time", 'AUTO_NBR', 'after_step_3');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Trigger message of'$tcpar_Message'should be transmitted within  '$tcpar_Event_frame' from previous message frame.", 'create_fault_and');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_fault_and');

	S_teststep_expected("'$tcpar_Message' should be retriggered cyclically at'$tcpar_cyclic_time'", 'after_step_3');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'after_step_3');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
