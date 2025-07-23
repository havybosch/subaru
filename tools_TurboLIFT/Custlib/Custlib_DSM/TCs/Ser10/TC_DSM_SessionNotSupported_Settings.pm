#### TEST CASE MODULE
package TC_DSM_SessionNotSupported_Settings;

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

TC_DSM_SessionNotSupported_Settings

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Send  <Enter_ExtendedSession>

2. Send Request <ControlDTCOFF>

3. Create any fault

4. Read the fault recorder

5. Send Request to <Enter_Session>

6. Read the fault recorder


I<B<Evaluation>>

1. Session Entry successful

2. Response <ControlDTCOFF_Response> is obtained

3.

4. Fault is not qualfied in fault recorder

5. Session entry successful

6. Fault is qualfied in fault recorder


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Enter_Session' => 
	SCALAR 'ControlDTCOFF' => 
	SCALAR 'ControlDTCOFF_Response' => 
	SCALAR 'Enter_ExtendedSession' => 


=head2 PARAMETER EXAMPLES

	purpose =  'Session change will reset the settings made in the earlier session, if supported in active session'
	
	Enter_Session = '<Fetch {Service description}>'
	
	ControlDTCOFF = 'ControlDTCSetting_Off'
	ControlDTCOFF_Response =  'PR_ControlDTCSetting_Off'
	
	Enter_ExtendedSession = 'DiagnosticSessionControl_ExtendedSession'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Enter_Session;
my $tcpar_ControlDTCOFF;
my $tcpar_ControlDTCOFF_Response;
my $tcpar_Enter_ExtendedSession;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Enter_Session =  GEN_Read_mandatory_testcase_parameter( 'Enter_Session' );
	$tcpar_ControlDTCOFF =  GEN_Read_mandatory_testcase_parameter( 'ControlDTCOFF' );
	$tcpar_ControlDTCOFF_Response =  GEN_Read_mandatory_testcase_parameter( 'ControlDTCOFF_Response' );
	$tcpar_Enter_ExtendedSession =  GEN_Read_mandatory_testcase_parameter( 'Enter_ExtendedSession' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Send  '$tcpar_Enter_ExtendedSession'", 'AUTO_NBR', 'send__enter_extendedsession');			#measurement 1

	S_teststep("Send Request '$tcpar_ControlDTCOFF'", 'AUTO_NBR', 'send_request_controldtcoff');			#measurement 2

	S_teststep("Create any fault", 'AUTO_NBR');

	S_teststep("Read the fault recorder", 'AUTO_NBR', 'read_the_fault_A');			#measurement 3

	S_teststep("Send Request to '$tcpar_Enter_Session'", 'AUTO_NBR', 'send_request_to');			#measurement 4

	S_teststep("Read the fault recorder", 'AUTO_NBR', 'read_the_fault_B');			#measurement 5

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Session Entry successful", 'send__enter_extendedsession');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send__enter_extendedsession');

	S_teststep_expected("Response '$tcpar_ControlDTCOFF_Response' is obtained", 'send_request_controldtcoff');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_request_controldtcoff');

	S_teststep_expected("Fault is not qualfied in fault recorder", 'read_the_fault_A');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'read_the_fault_A');

	S_teststep_expected("Session entry successful", 'send_request_to');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_request_to');

	S_teststep_expected("Fault is qualfied in fault recorder", 'read_the_fault_B');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'read_the_fault_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
