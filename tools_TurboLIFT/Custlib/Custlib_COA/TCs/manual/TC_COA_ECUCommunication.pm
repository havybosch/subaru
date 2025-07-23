#### TEST CASE MODULE
package TC_COA_ECUCommunication;

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

TC_COA_ECUCommunication

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.Measure the time at which first <Message>is transmitted from IGN ON.

3.After step 2 ,the <Message>is tranmsiited periodically


I<B<Evaluation>>

1.-

2.Measured time should be less than or equal to <Inittime1> and greater than or equal to <Inittime2>. 

3.The periodic transmission of <Message> should be <Cyclic_time>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Inittime1' => 
	SCALAR 'Inittime2' => 
	SCALAR 'Cycle_Time' => 
	SCALAR 'purpose' => 
	SCALAR 'Message' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the time of first message transmission from ECU IGN ON' # description of test case
	
	# input parameters
	Message='<Test Heading>'
	
	#output parameters
	Inittime1  =490 #ms
	Inittime2  =210 #ms
	Cycle_Time=120 #ms

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Message;
my $tcpar_Inittime1;
my $tcpar_Inittime2;
my $tcpar_Cycle_Time;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_Inittime1 =  GEN_Read_mandatory_testcase_parameter( 'Inittime1' );
	$tcpar_Inittime2 =  GEN_Read_mandatory_testcase_parameter( 'Inittime2' );
	$tcpar_Cycle_Time =  GEN_Read_mandatory_testcase_parameter( 'Cycle_Time' );

	return 1;
}

sub TC_initialization {

	S_teststep("Standard Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN.", 'AUTO_NBR');

	S_teststep("Measure the time at which first '$tcpar_Message'is transmitted from IGN ON.", 'AUTO_NBR', 'measure_the_time');			#measurement 1

	S_teststep("After step 2 ,the '$tcpar_Message'is tranmsiited periodically", 'AUTO_NBR', 'after_step_2');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Measured time should be less than or equal to '$tcpar_Inittime1' and greater than or equal to '$tcpar_Inittime2'. ", 'measure_the_time');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'measure_the_time');

	S_teststep_expected("The periodic transmission of '$tcpar_Message' should be '$tcpar_Cyclic_time'.", 'after_step_2');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'after_step_2');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
