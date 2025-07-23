#### TEST CASE MODULE
package TC_DSM_Service3E_NRC7F;

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

TC_DSM_Service3E_NRC7F

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <Addressing_Mode> for <Protocol>

2. Send Request to <Enter_Session>

3. Send Request <Tester_Present> before session change to defeault session


I<B<Evaluation>>

1.

2. Session entry is successful

 

3. NRC $7F is obtained


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Enter_Session' => 
	SCALAR 'Addressing_Mode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Tester_Present' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response when Server is in busy state'
	
	Enter_Session = '<Test Heading>'
	
	Addressing_Mode = 'Physical'
	Protocol = 'UDS'
	
	Tester_Present = '3E 00'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Enter_Session;
my $tcpar_Addressing_Mode;
my $tcpar_Protocol;
my $tcpar_Tester_Present;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Enter_Session =  GEN_Read_mandatory_testcase_parameter( 'Enter_Session' );
	$tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Tester_Present =  GEN_Read_mandatory_testcase_parameter( 'Tester_Present' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_Addressing_Mode' for '$tcpar_Protocol'", 'AUTO_NBR');

	S_teststep("Send Request to '$tcpar_Enter_Session'", 'AUTO_NBR', 'send_request_to');			#measurement 1

	S_teststep("Send Request '$tcpar_Tester_Present' before session change to defeault session", 'AUTO_NBR', 'send_request_tester');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Session entry is successful", 'send_request_to');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send_request_to');

	S_teststep_expected("NRC $7F is obtained", 'send_request_tester');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_request_tester');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
