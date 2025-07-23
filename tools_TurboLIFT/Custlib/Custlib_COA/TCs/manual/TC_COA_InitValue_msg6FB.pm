#### TEST CASE MODULE
package TC_COA_InitValue_msg6FB;

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

TC_COA_InitValue_msg6FB

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.Create <Mode> condition.

3.Check the values for <Signals> in <Message>.

4. Check the CycleTime of <Message> and <Tx_State>


I<B<Evaluation>>

1.-

2.-

3.The  values of <Signals>transmitted should be <init_value>.

4. <Message> : <CycleTime>

    <Message> : <Tx_State>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Tx_state' => 
	SCALAR 'purpose' => 
	SCALAR 'Message' => 
	SCALAR 'Mode' => 
	LIST 'Signals' => 
	SCALAR 'CycleTime' => 
	LIST 'init_value' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To Check the init values of Signals in different ECU Mode'
	
	# input parameters
	Message = '<Test Heading 1>'
	Mode= '<Test Heading 2>'
	Signals = @ ('ABG6FB_0_0_MSG_COUNTER','ABG6FB_2_0_DTC','ABG6FB_3_0_DTC_STATUS_BIT','ABG6FB_4_0_DTC_NUMBER')
	
	#output parameters
	CycleTime = '1000' #ms
	init_value = '@ ('0x00','0xFF','0xFF','0x00')
	Tx_state= 'Transmit'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Message;
my $tcpar_Mode;
my $tcpar_Signals;
my $tcpar_CycleTime;
my $tcpar_init_value;
my $tcpar_Tx_state;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_Mode =  GEN_Read_mandatory_testcase_parameter( 'Mode' );
	$tcpar_Signals =  GEN_Read_mandatory_testcase_parameter( 'Signals' );
	$tcpar_CycleTime =  GEN_Read_mandatory_testcase_parameter( 'CycleTime' );
	$tcpar_init_value =  GEN_Read_mandatory_testcase_parameter( 'init_value' );
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

	S_teststep("Create '$tcpar_Mode' condition.", 'AUTO_NBR');

	S_teststep("Check the values for '$tcpar_Signals' in '$tcpar_Message'.", 'AUTO_NBR', 'check_the_values');			#measurement 1

	S_teststep("Check the CycleTime of '$tcpar_Message' and '$tcpar_Tx_State'", 'AUTO_NBR', 'check_the_cycletime');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("The  values of '$tcpar_Signals'transmitted should be '$tcpar_init_value'.", 'check_the_values');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'check_the_values');

	S_teststep_expected("'$tcpar_Message' : '$tcpar_CycleTime'", 'check_the_cycletime');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'check_the_cycletime');

	S_teststep_expected("'$tcpar_Message' : '$tcpar_Tx_State'");
	S_teststep_detected("<<add detected result here>>");

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
