#### TEST CASE MODULE
package TC_COA_SignalResponse_Internal&CrashFault;

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

TC_COA_SignalResponse_Internal&CrashFault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation


I<B<Stimulation and Measurement>>

1. IGN ON

2. Create <Fault>

3. Check the <Signals> of <Message>

4. Disqualify <Fault> and do ECU Reset

5. Check the <Signals> of <Message>

#Note: Step4,5 is not valid for Crash Faults


I<B<Evaluation>>

1.

2. <Fault> should be in <State1>

3.<Signals> should have <Signal_Values> 

4. <Fault> should be in <State2>

5. <Signals> should have <Signal_Values> 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	LIST 'Signal_Values' => 
	SCALAR 'purpose' => 
	SCALAR 'Fault' => 
	SCALAR 'Message' => 
	SCALAR 'State1' => 
	SCALAR 'State2' => 
	LIST 'Signals' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the Signal Response when System has both Internal and Crash Faults'
	
	# input parameters
	Fault = '<Test Heading 1>'
	Message = '0x6FB'
	State1 = 'FilteredState'
	State2 = 'StoredState'
	Signals = @('ABG6FB_0_0_MSG_COUNTER','ABG6FB_2_0_DTC','ABG6FB_3_0_DTC_STATUS_BIT','ABG6FB_4_0_DTC_NUMBER')
	
	#output parameters
	Signal_Values = @('x1','90','00','xA','2')

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Fault;
my $tcpar_Message;
my $tcpar_State1;
my $tcpar_State2;
my $tcpar_Signals;
my $tcpar_Signal_Values;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_State1 =  GEN_Read_mandatory_testcase_parameter( 'State1' );
	$tcpar_State2 =  GEN_Read_mandatory_testcase_parameter( 'State2' );
	$tcpar_Signals =  GEN_Read_mandatory_testcase_parameter( 'Signals' );
	$tcpar_Signal_Values =  GEN_Read_mandatory_testcase_parameter( 'Signal_Values' );

	return 1;
}

sub TC_initialization {

	S_teststep("Standard Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("IGN ON", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Fault'", 'AUTO_NBR', 'create_fault');			#measurement 1

	S_teststep("Check the '$tcpar_Signals' of '$tcpar_Message'", 'AUTO_NBR', 'check_the_signals_A');			#measurement 2

	S_teststep("Disqualify '$tcpar_Fault' and do ECU Reset", 'AUTO_NBR', 'disqualify_fault_and');			#measurement 3

	S_teststep("Check the '$tcpar_Signals' of '$tcpar_Message'", 'AUTO_NBR', 'check_the_signals_B');			#measurement 4

	S_teststep("#Note: Step4,5 is not valid for Crash Faults", 'AUTO_NBR');

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault' should be in '$tcpar_State1'", 'create_fault');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_fault');

	S_teststep_expected("'$tcpar_Signals' should have '$tcpar_Signal_Values' ", 'check_the_signals_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'check_the_signals_A');

	S_teststep_expected("'$tcpar_Fault' should be in '$tcpar_State2'", 'disqualify_fault_and');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'disqualify_fault_and');

	S_teststep_expected("'$tcpar_Signals' should have '$tcpar_Signal_Values' ", 'check_the_signals_B');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'check_the_signals_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
