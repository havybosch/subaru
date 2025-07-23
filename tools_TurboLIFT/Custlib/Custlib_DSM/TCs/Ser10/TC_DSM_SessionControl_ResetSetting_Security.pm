#### TEST CASE MODULE
package TC_DSM_SessionControl_ResetSetting_Security;

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

TC_DSM_SessionControl_ResetSetting_Security

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Send Request to enter session <Session>

2. Get the Security with <SecurityLevel> 

3. Send Request to write data<SendRequest> with <Data>

4. Send Request to enter new session <NewSession>

5. Send Request to write data<SendRequest> with <Data>


I<B<Evaluation>>

1. Session Entry successful

2. Security access granted

3.  Response <PR_Response> is obtained

4. Session entry successful

5. <Response_Type> is obtained


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'PR_Response' => 
	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'SendRequest' => 
	SCALAR 'NewSession' => 
	SCALAR 'SecurityLevel' => 
	SCALAR 'Data' => 
	SCALAR 'Response_Type' => 


=head2 PARAMETER EXAMPLES

	purpose =  'Session change will reset the Security settings made in the earlier session, if not supported in active session and Security shall be relocked.(Even if the New Non Default Session is the same as the Old Non Default Session)'
	
	Session =	'<Fetch {Session}>'
	SendRequest =	 '<Fetch {Service description}>'
	NewSession =	'<Test Heading 2>'
	SecurityLevel = 	'<Fetch {Security Access}>'
	Data =		'XX1...XXn' 
	#n = 4 Bytes of data with respect which bytes needs to be configure or deconfigure
	
	Response_Type = 'NR_securityAccessDenied'
	
	#Currently Below data
	#'WriteDatabyID_XXXX'
	#Ex : WriteDatabyID_6001_EOLConfig 
	PR_Response ='PR_WriteDatabyID_XXXX'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_SendRequest;
my $tcpar_NewSession;
my $tcpar_SecurityLevel;
my $tcpar_Data;
my $tcpar_Response_Type;
my $tcpar_PR_Response;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_SendRequest =  GEN_Read_mandatory_testcase_parameter( 'SendRequest' );
	$tcpar_NewSession =  GEN_Read_mandatory_testcase_parameter( 'NewSession' );
	$tcpar_SecurityLevel =  GEN_Read_mandatory_testcase_parameter( 'SecurityLevel' );
	$tcpar_Data =  GEN_Read_mandatory_testcase_parameter( 'Data' );
	$tcpar_Response_Type =  GEN_Read_mandatory_testcase_parameter( 'Response_Type' );
	$tcpar_PR_Response =  GEN_Read_mandatory_testcase_parameter( 'PR_Response' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Send Request to enter session '$tcpar_Session'", 'AUTO_NBR', 'send_request_to_A');			#measurement 1

	S_teststep("Get the Security with '$tcpar_SecurityLevel' ", 'AUTO_NBR', 'get_the_security');			#measurement 2

	S_teststep("Send Request to write data'$tcpar_SendRequest' with '$tcpar_Data'", 'AUTO_NBR', 'send_request_to_B');			#measurement 3

	S_teststep("Send Request to enter new session '$tcpar_NewSession'", 'AUTO_NBR', 'send_request_to_C');			#measurement 4

	S_teststep("Send Request to write data'$tcpar_SendRequest' with '$tcpar_Data'", 'AUTO_NBR', 'send_request_to_D');			#measurement 5

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Session Entry successful", 'send_request_to_A');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send_request_to_A');

	S_teststep_expected("Security access granted", 'get_the_security');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'get_the_security');

	S_teststep_expected("Response '$tcpar_PR_Response' is obtained", 'send_request_to_B');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_request_to_B');

	S_teststep_expected("Session entry successful", 'send_request_to_C');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_request_to_C');

	S_teststep_expected("'$tcpar_Response_Type' is obtained", 'send_request_to_D');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'send_request_to_D');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
