#### TEST CASE MODULE
package TC_DSM_RelockIfClientUnlocked_DiagSession;

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

TC_DSM_RelockIfClientUnlocked_DiagSession

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Send  <Enter_Session>

2. Get the <Security>

3. Send the <SendService>

4. Send  <Enter_DefaultSession>

5. Send the <SendService>

6. Send  <Enter_Session>

7. Obtain Level 3 security access

8. Send  <Write_ProgramVIN>

9. Send  <Enter_Session>

10. Send  <REQ_Write_ProgramVIN>


I<B<Evaluation>>

1. <Enter_ExtendedSession_Response> is obtained

2.

3. <Response_Type> is obtained

4. <Enter_Session_Response> is obtained

5. <Response_Type> is obtained

6.  <Enter_ExtendedSession_Response> is obtained

7. Security access granted

8. Response <Write_ProgramVIN_Response> is obtained

9. <Enter_Session_Response> is obtained

10 <Response_Type> is obtained


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Enter_ExtendedSession' => 
	SCALAR 'Enter_ExtendedSession_Response' => 
	SCALAR 'Enter_Session' => 
	SCALAR 'Enter_Session_Response' => 
	SCALAR 'Write_ProgramVIN' => 
	SCALAR 'Write_ProgramVIN_Response' => 
	SCALAR 'Response_Type' => 
	LIST 'SecurityAcess' => 
	LIST 'SendService' => 


=head2 PARAMETER EXAMPLES

	purpose =  'Session change will reset the settings made in the earlier session, if not supported in active session'
	
	
	Enter_ExtendedSession 		= 'DiagnosticSessionControl_ExtendedSession'
	Enter_ExtendedSession_Response 	= 'PR_DiagnosticSessionControl_ExtendedSession'
	Enter_Session 			= '<Fetch {Service description}>'
	Enter_Session_Response 		= 'PR_<Fetch {Service description}>'
	Write_ProgramVIN 		= 'WriteDatabyID_OriginalVIN'
	Write_ProgramVIN_Response	= 'PR_WriteDatabyID_OriginalVIN'
	Response_Type 			= 'NRC_7F'
	SecurityAcess			= @'<Fetch {Security Access}>'              	#ToBe lined with SPS/SPR
	SendService 			= @'<Fetch {Service description}>' 		#To be lined to SPS/SPR

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Enter_ExtendedSession;
my $tcpar_Enter_ExtendedSession_Response;
my $tcpar_Enter_Session;
my $tcpar_Enter_Session_Response;
my $tcpar_Write_ProgramVIN;
my $tcpar_Write_ProgramVIN_Response;
my $tcpar_Response_Type;
my $tcpar_SecurityAcess;
my $tcpar_SendService;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Enter_ExtendedSession =  GEN_Read_mandatory_testcase_parameter( 'Enter_ExtendedSession' );
	$tcpar_Enter_ExtendedSession_Response =  GEN_Read_mandatory_testcase_parameter( 'Enter_ExtendedSession_Response' );
	$tcpar_Enter_Session =  GEN_Read_mandatory_testcase_parameter( 'Enter_Session' );
	$tcpar_Enter_Session_Response =  GEN_Read_mandatory_testcase_parameter( 'Enter_Session_Response' );
	$tcpar_Write_ProgramVIN =  GEN_Read_mandatory_testcase_parameter( 'Write_ProgramVIN' );
	$tcpar_Write_ProgramVIN_Response =  GEN_Read_mandatory_testcase_parameter( 'Write_ProgramVIN_Response' );
	$tcpar_Response_Type =  GEN_Read_mandatory_testcase_parameter( 'Response_Type' );
	$tcpar_SecurityAcess =  GEN_Read_mandatory_testcase_parameter( 'SecurityAcess' );
	$tcpar_SendService =  GEN_Read_mandatory_testcase_parameter( 'SendService' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Send  '$tcpar_Enter_Session'", 'AUTO_NBR', 'send__enter_session_A');			#measurement 1

	S_teststep("Get the '$tcpar_Security'", 'AUTO_NBR');

	S_teststep("Send the '$tcpar_SendService'", 'AUTO_NBR', 'send_the_sendservice_A');			#measurement 2

	S_teststep("Send  '$tcpar_Enter_DefaultSession'", 'AUTO_NBR', 'send__enter_defaultsession');			#measurement 3

	S_teststep("Send the '$tcpar_SendService'", 'AUTO_NBR', 'send_the_sendservice_B');			#measurement 4

	S_teststep("Send  '$tcpar_Enter_Session'", 'AUTO_NBR', 'send__enter_session_B');			#measurement 5

	S_teststep("Obtain Level 3 security access", 'AUTO_NBR', 'obtain_level_3');			#measurement 6

	S_teststep("Send  '$tcpar_Write_ProgramVIN'", 'AUTO_NBR', 'send__write_programvin');			#measurement 7

	S_teststep("Send  '$tcpar_Enter_Session'", 'AUTO_NBR', 'send__enter_session_C');			#measurement 8

	S_teststep("Send  '$tcpar_REQ_Write_ProgramVIN'", 'AUTO_NBR', 'send__req_write');			#measurement 9

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Enter_ExtendedSession_Response' is obtained", 'send__enter_session_A');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send__enter_session_A');

	S_teststep_expected("'$tcpar_Response_Type' is obtained", 'send_the_sendservice_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_the_sendservice_A');

	S_teststep_expected("'$tcpar_Enter_Session_Response' is obtained", 'send__enter_defaultsession');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send__enter_defaultsession');

	S_teststep_expected("'$tcpar_Response_Type' is obtained", 'send_the_sendservice_B');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_the_sendservice_B');

	S_teststep_expected("'$tcpar_Enter_ExtendedSession_Response' is obtained", 'send__enter_session_B');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'send__enter_session_B');

	S_teststep_expected("Security access granted", 'obtain_level_3');			#evaluation 6
	S_teststep_detected("<<add detected result here>>", 'obtain_level_3');

	S_teststep_expected("Response '$tcpar_Write_ProgramVIN_Response' is obtained", 'send__write_programvin');			#evaluation 7
	S_teststep_detected("<<add detected result here>>", 'send__write_programvin');

	S_teststep_expected("'$tcpar_Enter_Session_Response' is obtained", 'send__enter_session_C');			#evaluation 8
	S_teststep_detected("<<add detected result here>>", 'send__enter_session_C');

	S_teststep_expected("'$tcpar_Response_Type' is obtained", 'send__req_write');			#evaluation 9
	S_teststep_detected("<<add detected result here>>", 'send__req_write');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
