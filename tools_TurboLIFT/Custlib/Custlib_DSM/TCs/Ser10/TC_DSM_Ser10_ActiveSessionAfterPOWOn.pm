#### TEST CASE MODULE
package TC_DSM_Ser10_ActiveSessionAfterPOWOn;

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

TC_DSM_Ser10_ActiveSessionAfterPOWOn

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>.

2. Enter to <DefaultSession>

3. Wait for <S3_Server>

4. Enter to <DefaultSession>

5. Enter to <ExtendedSession>

6. Send <Req_CommunicationControl> followed by <CommunicationType>

7. Wait for <S3_Server>

8. Again Send  <Req_CommunicationControl> followed by <CommunicationType>

9. Enter to <ExtendedSession>

10. Send <Tester_Present> continously in an interval of <S3_Client>

11.Again Enter to <ExtendedSession>


I<B<Evaluation>>

1.

2. <PR_DefaultSession> followed by <ServerTime> should be observed within <P2ServerTime>.

3. 

4. <PR_DefaultSession> followed by <ServerTime> should be observed within <P2ServerTime>.

5. <PR_ExtendedSession> followed by <ServerTime> should be observed within <P2ServerTime>. 

6. <PR_CommunicationControl> should be obtained within <P2ServerTime>.

7.

8. <NRC_7F> should be observed within <P2ServerTime>.

9. <PR_ExtendedSession> followed by <ServerTime> should be observed within <P2ServerTime>. 

10. <PR_TesterPresent> should b observed within <P2ServerTime>.

11. <PR_ExtendedSession> followed by <ServerTime> should be observed within <P2ServerTime>. 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'DefaultSession' => 
	SCALAR 'ExtendedSession' => 
	SCALAR 'Tester_Present' => 
	SCALAR 'Req_CommunicationControl' => 
	SCALAR 'CommunicationType' => 
	SCALAR 'S3_Server' => 
	SCALAR 'S3_Client' => 
	SCALAR 'PR_DefaultSession' => 
	SCALAR 'PR_ExtendedSession' => 
	SCALAR 'ServerTime' => 
	SCALAR 'NRC_7F' => 
	SCALAR 'PR_CommunicationControl' => 
	SCALAR 'P2ServerTime' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check which session is active after power on'
	
	# input parameters
	AddressingMode =@'<Fetch {Addressing Mode}>'
	
	Protocol = '<Fetch {Protocol}>'
	DefaultSession = 'REQ_<Fetch {Service description}>'
	ExtendedSession = 'REQ_DiagnosticSessionControl_ExtendedSession'
	Tester_Present = 'REQ_TesterPresent_zeroSubfunction'
	Req_CommunicationControl = 'Req_CommunicationControl_DisableRxAndTx'
	CommunicationType = '1'
	S3_Server = '5' #secs
	S3_Client  = '2' #secs
	
	# output parameters
	PR_DefaultSession = 'PR_DiagnosticSessionControl_DefaultSession' 
	PR_ExtendedSession = 'PR_DiagnosticSessionControl_ExtendedSession' 
	ServerTime = 'XX XX XX XX'
	NRC_7F = 'NR_serviceNotSupportedInActiveSession'
	PR_CommunicationControl = 'PR_CommunicationControl_DisableRxAndTx'
	P2ServerTime = '50' #ms

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_DefaultSession;
my $tcpar_ExtendedSession;
my $tcpar_Tester_Present;
my $tcpar_Req_CommunicationControl;
my $tcpar_CommunicationType;
my $tcpar_S3_Server;
my $tcpar_S3_Client;
my $tcpar_PR_DefaultSession;
my $tcpar_PR_ExtendedSession;
my $tcpar_ServerTime;
my $tcpar_NRC_7F;
my $tcpar_PR_CommunicationControl;
my $tcpar_P2ServerTime;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_DefaultSession =  GEN_Read_mandatory_testcase_parameter( 'DefaultSession' );
	$tcpar_ExtendedSession =  GEN_Read_mandatory_testcase_parameter( 'ExtendedSession' );
	$tcpar_Tester_Present =  GEN_Read_mandatory_testcase_parameter( 'Tester_Present' );
	$tcpar_Req_CommunicationControl =  GEN_Read_mandatory_testcase_parameter( 'Req_CommunicationControl' );
	$tcpar_CommunicationType =  GEN_Read_mandatory_testcase_parameter( 'CommunicationType' );
	$tcpar_S3_Server =  GEN_Read_mandatory_testcase_parameter( 'S3_Server' );
	$tcpar_S3_Client =  GEN_Read_mandatory_testcase_parameter( 'S3_Client' );
	$tcpar_PR_DefaultSession =  GEN_Read_mandatory_testcase_parameter( 'PR_DefaultSession' );
	$tcpar_PR_ExtendedSession =  GEN_Read_mandatory_testcase_parameter( 'PR_ExtendedSession' );
	$tcpar_ServerTime =  GEN_Read_mandatory_testcase_parameter( 'ServerTime' );
	$tcpar_NRC_7F =  GEN_Read_mandatory_testcase_parameter( 'NRC_7F' );
	$tcpar_PR_CommunicationControl =  GEN_Read_mandatory_testcase_parameter( 'PR_CommunicationControl' );
	$tcpar_P2ServerTime =  GEN_Read_mandatory_testcase_parameter( 'P2ServerTime' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' for '$tcpar_Protocol'.", 'AUTO_NBR');

	S_teststep("Enter to '$tcpar_DefaultSession'", 'AUTO_NBR', 'enter_to_defaultsession_A');			#measurement 1

	S_teststep("Wait for '$tcpar_S3_Server'", 'AUTO_NBR');

	S_teststep("Enter to '$tcpar_DefaultSession'", 'AUTO_NBR', 'enter_to_defaultsession_B');			#measurement 2

	S_teststep("Enter to '$tcpar_ExtendedSession'", 'AUTO_NBR', 'enter_to_extendedsession_A');			#measurement 3

	S_teststep("Send '$tcpar_Req_CommunicationControl' followed by '$tcpar_CommunicationType'", 'AUTO_NBR', 'send_req_communicationcontrol');			#measurement 4

	S_teststep("Wait for '$tcpar_S3_Server'", 'AUTO_NBR');

	S_teststep("Again Send  '$tcpar_Req_CommunicationControl' followed by '$tcpar_CommunicationType'", 'AUTO_NBR', 'again_send__req');			#measurement 5

	S_teststep("Enter to '$tcpar_ExtendedSession'", 'AUTO_NBR', 'enter_to_extendedsession_B');			#measurement 6

	S_teststep("Send '$tcpar_Tester_Present' continously in an interval of '$tcpar_S3_Client'", 'AUTO_NBR', 'send_tester_present');			#measurement 7

	S_teststep("Again Enter to '$tcpar_ExtendedSession'", 'AUTO_NBR', 'again_enter_to');			#measurement 8

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_DefaultSession' followed by '$tcpar_ServerTime' should be observed within '$tcpar_P2ServerTime'.", 'enter_to_defaultsession_A');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'enter_to_defaultsession_A');

	S_teststep_expected("'$tcpar_PR_DefaultSession' followed by '$tcpar_ServerTime' should be observed within '$tcpar_P2ServerTime'.", 'enter_to_defaultsession_B');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'enter_to_defaultsession_B');

	S_teststep_expected("'$tcpar_PR_ExtendedSession' followed by '$tcpar_ServerTime' should be observed within '$tcpar_P2ServerTime'. ", 'enter_to_extendedsession_A');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'enter_to_extendedsession_A');

	S_teststep_expected("'$tcpar_PR_CommunicationControl' should be obtained within '$tcpar_P2ServerTime'.", 'send_req_communicationcontrol');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_req_communicationcontrol');

	S_teststep_expected("'$tcpar_NRC_7F' should be observed within '$tcpar_P2ServerTime'.", 'again_send__req');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'again_send__req');

	S_teststep_expected("'$tcpar_PR_ExtendedSession' followed by '$tcpar_ServerTime' should be observed within '$tcpar_P2ServerTime'. ", 'enter_to_extendedsession_B');			#evaluation 6
	S_teststep_detected("<<add detected result here>>", 'enter_to_extendedsession_B');

	S_teststep_expected("'$tcpar_PR_TesterPresent' should b observed within '$tcpar_P2ServerTime'.", 'send_tester_present');			#evaluation 7
	S_teststep_detected("<<add detected result here>>", 'send_tester_present');

	S_teststep_expected("'$tcpar_PR_ExtendedSession' followed by '$tcpar_ServerTime' should be observed within '$tcpar_P2ServerTime'. ", 'again_enter_to');			#evaluation 8
	S_teststep_detected("<<add detected result here>>", 'again_enter_to');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
