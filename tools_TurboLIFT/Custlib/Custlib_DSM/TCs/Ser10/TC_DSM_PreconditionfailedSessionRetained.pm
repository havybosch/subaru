#### TEST CASE MODULE
package TC_DSM_PreconditionfailedSessionRetained;

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
################
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_PreconditionfailedSessionRetained

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <Addressing_Mode> for <Protocol>	

2. Create <Condition>

3. Enter <ExtendedSession> and get Security access

4. Enter <ProgrammingSession>

5. Send <ReadSession> 


I<B<Evaluation>>

1. 	

2.

3. Positive Response is obtained	

4. <NRC22> should be observed

5.Positive response with <ExtendedSession>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'ExtendedSession' => 
	SCALAR 'ProgrammingSession' => 
	SCALAR 'ReadSession' => 
	SCALAR 'NRC22' => 
	SCALAR 'Condition' => 
	SCALAR 'PR_ExtendedSession' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To test that session remains same when condition not correct is obtained then active session remains active'
	
	# input parameters
	AddressingMode = @'<Fetch {Addressing Mode}>'
	Protocol = '<Fetch {Protocol}>'
	ExtendedSession = 'REQ_DiagnosticSessionControl_ExtendedSession'
	ProgrammingSession = '10 02'
	ReadSession = '22 F1 86'
	NRC22 = '7F 10 22'
	Condition = 'ConditionsNotCorrect'
	
	# output parameters
	PR_ExtendedSession = 'PR_DiagnosticSessionControl_ExtendedSession' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_ExtendedSession;
my $tcpar_ProgrammingSession;
my $tcpar_ReadSession;
my $tcpar_NRC22;
my $tcpar_Condition;
my $tcpar_PR_ExtendedSession;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_ExtendedSession =  GEN_Read_mandatory_testcase_parameter( 'ExtendedSession' );
	$tcpar_ProgrammingSession =  GEN_Read_mandatory_testcase_parameter( 'ProgrammingSession' );
	$tcpar_ReadSession =  GEN_Read_mandatory_testcase_parameter( 'ReadSession' );
	$tcpar_NRC22 =  GEN_Read_mandatory_testcase_parameter( 'NRC22' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_PR_ExtendedSession =  GEN_Read_mandatory_testcase_parameter( 'PR_ExtendedSession' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_Addressing_Mode' for '$tcpar_Protocol'	", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Condition'", 'AUTO_NBR');

	S_teststep("Enter '$tcpar_ExtendedSession' and get Security access", 'AUTO_NBR', 'enter_extendedsession_and');			#measurement 1

	S_teststep("Enter '$tcpar_ProgrammingSession'", 'AUTO_NBR', 'enter_programmingsession');			#measurement 2

	S_teststep("Send '$tcpar_ReadSession' ", 'AUTO_NBR', 'send_readsession');			#measurement 3

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Positive Response is obtained	", 'enter_extendedsession_and');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'enter_extendedsession_and');

	S_teststep_expected("'$tcpar_NRC22' should be observed", 'enter_programmingsession');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'enter_programmingsession');

	S_teststep_expected("Positive response with '$tcpar_ExtendedSession'", 'send_readsession');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_readsession');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
