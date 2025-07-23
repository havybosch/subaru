#### TEST CASE MODULE
package TC_COA_SignalResponse_DifferentCondition;

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

TC_COA_SignalResponse_DifferentCondition

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation


I<B<Stimulation and Measurement>>

1. IGN ON

7. Create <InitFault>

8. Check the <Signals> of <Message>

9. ECU reset and make System Fault free.

10. Create Maximum no.of faults and check <Signals>


I<B<Evaluation>>

1.

2.

8. <Signals> should have <Signal_Values1> 

9.

10. <Signals> should have all DTC related info.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Message' => 
	LIST 'Signals' => 
	SCALAR 'InitFault' => 
	LIST 'Signal_Values1' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the Signal Response when System has Extra Ram Faults or multiple fault with same DTC'
	
	# input parameters
	Message='<Test Heading 1>'
	Signals ='@('ABG6FB_0_0_MSG_COUNTER','ABG6FB_2_0_DTC','ABG6FB_3_0_DTC_STATUS_BIT','ABG6FB_4_0_DTC_NUMBER')'
	InitFault = 'rb_acc_AlgoDeploySconLocked_flt'
	
	#output parameters
	Signal_Values1 = @('x1','90','00','xF','1')

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Message;
my $tcpar_Signals;
my $tcpar_InitFault;
my $tcpar_Signal_Values1;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_Signals =  GEN_Read_mandatory_testcase_parameter( 'Signals' );
	$tcpar_InitFault =  GEN_Read_mandatory_testcase_parameter( 'InitFault' );
	$tcpar_Signal_Values1 =  GEN_Read_mandatory_testcase_parameter( 'Signal_Values1' );

	return 1;
}

sub TC_initialization {

	S_teststep("Standard Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("IGN ON", 'AUTO_NBR');

	S_teststep("Create '$tcpar_InitFault'", 'AUTO_NBR');

	S_teststep("Check the '$tcpar_Signals' of '$tcpar_Message'", 'AUTO_NBR', 'check_the_signals');			#measurement 1

	S_teststep("ECU reset and make System Fault free.", 'AUTO_NBR');

	S_teststep("Create Maximum no.of faults and check '$tcpar_Signals'", 'AUTO_NBR', 'create_maximum_noof');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Signals' should have '$tcpar_Signal_Values1' ", 'check_the_signals');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'check_the_signals');

	S_teststep_expected("'$tcpar_Signals' should have all DTC related info.", 'create_maximum_noof');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'create_maximum_noof');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
