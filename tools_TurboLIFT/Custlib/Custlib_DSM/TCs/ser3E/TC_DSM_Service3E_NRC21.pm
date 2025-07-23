#### TEST CASE MODULE
package TC_DSM_Service3E_NRC21;

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
use LIFT_evaluation;
use LIFT_PD;
use LIFT_CD;
use LIFT_CD_CAN;
use LIFT_labcar;
use LIFT_CANoe;
use GENERIC_DCOM;
use LIFT_can_access;
use FuncLib_TNT_DEVICE;
use FuncLib_TNT_FM;
use FuncLib_TNT_COM;
use LIFT_DCOM;
##################################

our $PURPOSE = "check NRC21 for service3E";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service3E_NRC21

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <Addressing_Mode> for <Protocol>

2. Send Request to <Enter_Session>

3. <Read_Session> to read the active session

4. Send the Request <HardReset> 

5. Send Request to <TesterPresent_SPRMIB> with supress positive response bit set in <Addressing_Mode> adressing mode before/ as soon as the ECU reset happens.

6. <Read_Session> to read the active session


I<B<Evaluation>>

1.

2. Session entry is successful

 

3. Positive response is received with the active <Res_Session> in the data record filed.

4. Positive Response for HardReset is received

5. <Response_Type> is obtained.

6. Positive response is received with the active <Res_Session> in the data record filed.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Enter_Session' => 
	SCALAR 'Read_Session' => 
	SCALAR 'HardReset' => 
	SCALAR 'TesterPresent_SPRMIB' => 
	SCALAR 'Addressing_Mode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Res_Session' => 
	SCALAR 'Response_Type' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response when Server is in busy state'
	
	Enter_Session = 'DefaultSession'
	
	Read_Session = '22 F1 86'
	HardReset = '11 01'
	TesterPresent_SPRMIB = 'TesterPresent_zeroSubfunction_supressPOSResp'
	
	Addressing_Mode ='Physical'
	Protocol = 'UDS'
	
	Res_Session =  '62 F1 86 01'
	
	
	Response_Type = 'NoResponse'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Enter_Session;
my $tcpar_Read_Session;
my $tcpar_HardReset;
my $tcpar_TesterPresent_SPRMIB;
my $tcpar_Addressing_Mode;
my $tcpar_Protocol;
my $tcpar_Res_Session;
my $tcpar_Response_Type;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Enter_Session =  GEN_Read_mandatory_testcase_parameter( 'Enter_Session' );
	$tcpar_Read_Session =  GEN_Read_mandatory_testcase_parameter( 'Read_Session' );
	$tcpar_HardReset =  GEN_Read_mandatory_testcase_parameter( 'HardReset' );
	$tcpar_TesterPresent_SPRMIB =  GEN_Read_mandatory_testcase_parameter( 'TesterPresent_SPRMIB' );
	$tcpar_Addressing_Mode =  GEN_Read_mandatory_testcase_parameter( 'Addressing_Mode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Res_Session =  GEN_Read_mandatory_testcase_parameter( 'Res_Session' );
	$tcpar_Response_Type =  GEN_Read_mandatory_testcase_parameter( 'Response_Type' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_Addressing_Mode' for '$tcpar_Protocol'", 'AUTO_NBR');

	S_teststep("Send Request to '$tcpar_Enter_Session'", 'AUTO_NBR', 'send_request_to_A');			#measurement 1

	S_teststep("'$tcpar_Read_Session' to read the active session", 'AUTO_NBR', 'read_session_to_A');			#measurement 2

	S_teststep("Send the Request '$tcpar_HardReset' ", 'AUTO_NBR', 'send_the_request');			#measurement 3

	S_teststep("Send Request to '$tcpar_TesterPresent_SPRMIB' with supress positive response bit set in '$tcpar_Addressing_Mode' adressing mode before/ as soon as the ECU reset happens.", 'AUTO_NBR', 'send_request_to_B');			#measurement 4

	S_teststep("'$tcpar_Read_Session' to read the active session", 'AUTO_NBR', 'read_session_to_B');			#measurement 5

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Session entry is successful", 'send_request_to_A');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send_request_to_A');

	S_teststep_expected("Positive response is received with the active '$tcpar_Res_Session' in the data record filed.", 'read_session_to_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'read_session_to_A');

	S_teststep_expected("Positive Response for HardReset is received", 'send_the_request');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_the_request');

	S_teststep_expected("'$tcpar_Response_Type' is obtained.", 'send_request_to_B');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_request_to_B');

	S_teststep_expected("Positive response is received with the active '$tcpar_Res_Session' in the data record filed.", 'read_session_to_B');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'read_session_to_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
