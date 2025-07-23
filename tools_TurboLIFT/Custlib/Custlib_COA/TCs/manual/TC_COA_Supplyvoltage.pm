#### TEST CASE MODULE
package TC_COA_Supplyvoltage;

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

TC_COA_Supplyvoltage

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.Create<Mode>condition.

3.Observe <Message>transmission state.


I<B<Evaluation>>

1.-

2.-

3.Messagetransmission state should not happen<Tx_state>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Tx_state' => 
	SCALAR 'purpose' => 
	SCALAR 'Message' => 
	SCALAR 'Mode' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the ABG message transmission in different ECU modes' # description of test case
	# input parameters
	Message='<Test Heading 1>'
	Mode='<Test Heading 2>'
	#output parameters
	
	Tx_state='No'#no transmission happens

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Message;
my $tcpar_Mode;
my $tcpar_Tx_state;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_Mode =  GEN_Read_mandatory_testcase_parameter( 'Mode' );
	$tcpar_Tx_state =  GEN_Read_mandatory_testcase_parameter( 'Tx_state' );

	return 1;
}

sub TC_initialization {

	S_teststep("Standard Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN.", 'AUTO_NBR');

	S_teststep("Create'$tcpar_Mode'condition.", 'AUTO_NBR');

	S_teststep("Observe '$tcpar_Message'transmission state.", 'AUTO_NBR', 'observe_messagetransmission_state');			#measurement 1

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Messagetransmission state should not happen'$tcpar_Tx_state'.", 'observe_messagetransmission_state');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'observe_messagetransmission_state');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
