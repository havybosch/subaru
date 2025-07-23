#### TEST CASE MODULE
package TC_COA_SignaInitValue;

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

TC_COA_SignaInitValue

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard Preparation

2.Set the Buckle switch status to 'not Buckled'

3.Set the Pasenger occupant detection status to 'Unoccupied'


I<B<Stimulation and Measurement>>

1.Reset the ECU.

2.Check the values of <Signal> of<Message>.


I<B<Evaluation>>

1.-

2.The  values of <Signal>transmitted should be <init_value>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Message' => 
	LIST 'Signal' => 
	LIST 'init_value' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the first message transmission of value when valid value is present' # description of test case
	
	# input parameters
	Message='<Test Heading 1>'
	Signal='@('ABG33A_0_0_CHECK_SUM','ABG33A_1_0_MSG_COUNTER','ABG33A_2_0_IND_WARN_ABG','ABG33A_2_2_DETECT_CRUSH','ABG33A_2_5_STATUS_CRUSH_ECALL','ABG33A_3_0_BUCKLESW_PASS','ABG33A_3_4_OCCUPATION_PASS','ABG33A_3_6_IND_ACT_ABG_PASS','ABG33A_1_6_NUMBER_OF_CRASH','ABG33A_4_0_FRONT_CRASH','ABG33A_5_0_SIDE_CRASH','ABG33A_6_0_DELTA_X_MAX','ABG33A_7_0_DELTA_Y_MAX', 'ABG33A_1_4_01_FLG_ABGIND_CTRL')
	
	#output parameters
	init_value='@('0x72','00b','11b','000b','000b','10b','10b','00b','00b','00000000b','00000000b','00000000b','00000000b', '1b')

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Message;
my $tcpar_Signal;
my $tcpar_init_value;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_Signal =  GEN_Read_mandatory_testcase_parameter( 'Signal' );
	$tcpar_init_value =  GEN_Read_mandatory_testcase_parameter( 'init_value' );

	return 1;
}

sub TC_initialization {

	S_teststep("1.Standard Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("2.Set the Buckle switch status to 'not Buckled'", 'AUTO_NBR');

	S_teststep("3.Set the Pasenger occupant detection status to 'Unoccupied'", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Reset the ECU.", 'AUTO_NBR');

	S_teststep("Check the values of '$tcpar_Signal' of'$tcpar_Message'.", 'AUTO_NBR', 'check_the_values');			#measurement 1

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("The  values of '$tcpar_Signal'transmitted should be '$tcpar_init_value'.", 'check_the_values');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'check_the_values');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
