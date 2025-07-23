#### TEST CASE MODULE
package TC_DSM_FunctionalAddressingMode;

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

our $PURPOSE = "To check Response of $19 service in Functional Addressing Mode";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_FunctionalAddressingMode

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session> in <AddressingMode>

2. Send <Req_ReadNoofDTC> 

3.  Send <Req_DTCwithPermanentStatus> 


I<B<Evaluation>>

1. 

2. <NoResponse> should be obtained.

3. <NoResponse> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Session' => 
	SCALAR 'Req_ReadNoofDTC' => 
	SCALAR 'Req_DTCwithPermanentStatus' => 
	SCALAR 'NoResponse' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check Response of $19 service in Functional Addressing Mode'
	
	# input parameters
	AddressingMode = 'Functional'
	Session = 'DefaultSession'
	Req_ReadNoofDTC = '19 01 2E'
	
	Req_DTCwithPermanentStatus = '19 15' 
	
	# output parameters
	NoResponse = 'No_Response'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Session;
my $tcpar_Req_ReadNoofDTC;
my $tcpar_Req_DTCwithPermanentStatus;
my $tcpar_NoResponse;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ReadNoofDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadNoofDTC' );
	$tcpar_Req_DTCwithPermanentStatus =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCwithPermanentStatus' );
	$tcpar_NoResponse =  GEN_Read_mandatory_testcase_parameter( 'NoResponse' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session' in '$tcpar_AddressingMode'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	GDCOM_request_general ('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	
	S_teststep("Send '$tcpar_Req_ReadNoofDTC' ", 'AUTO_NBR', 'send_req_readnoofdtc');			#measurement 1
	$res1 = GDCOM_request($tcpar_Req_ReadNoofDTC,$tcpar_NoResponse,'quiet');
	
	S_teststep("Send '$tcpar_Req_DTCwithPermanentStatus' ", 'AUTO_NBR', 'send_req_dtcwithpermanentstatus');			#measurement 2
	$res2 = GDCOM_request($tcpar_Req_DTCwithPermanentStatus,$tcpar_NoResponse,'quiet');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NoResponse' should be obtained.", 'send_req_readnoofdtc');			#evaluation 1
	S_teststep_detected("ECU should no response $res1 ", 'send_req_readnoofdtc');

	S_teststep_expected("'$tcpar_NoResponse' should be obtained.", 'send_req_dtcwithpermanentstatus');			#evaluation 2
	S_teststep_detected("ECU should no response $res2", 'send_req_dtcwithpermanentstatus');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
