#### TEST CASE MODULE
package TC_DSM_Ser10_FunctionalAddressingMode;

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

TC_DSM_Ser10_FunctionalAddressingMode

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> .

2.  Enter to <DefaultSession>

3. Send <Req1_WrongSubfunction>


I<B<Evaluation>>

1.

2. <PR_DefaultRes> should be obtained.

3.<Neg_Response> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'DefaultSession' => 
	SCALAR 'Req1_WrongSubfunction' => 
	SCALAR 'PR_DefaultRes' => 
	SCALAR 'Neg_Response' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check  response in functional Addressing Mode'
	
	# input parameters
	AddressingMode = '7DF'
	DefaultSession = '10 01' 
	Req1_WrongSubfunction = '10 05'
	
	#output parameters
	PR_DefaultRes = '50 01 XX XX XX XX'
	Neg_Response =  'NR_subFunctionNotSupported' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_DefaultSession;
my $tcpar_Req1_WrongSubfunction;
my $tcpar_PR_DefaultRes;
my $tcpar_Neg_Response;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_DefaultSession =  GEN_Read_mandatory_testcase_parameter( 'DefaultSession' );
	$tcpar_Req1_WrongSubfunction =  GEN_Read_mandatory_testcase_parameter( 'Req1_WrongSubfunction' );
	$tcpar_PR_DefaultRes =  GEN_Read_mandatory_testcase_parameter( 'PR_DefaultRes' );
	$tcpar_Neg_Response =  GEN_Read_mandatory_testcase_parameter( 'Neg_Response' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' .", 'AUTO_NBR');

	S_teststep("Enter to '$tcpar_DefaultSession'", 'AUTO_NBR', 'enter_to_defaultsession');			#measurement 1

	S_teststep("Send '$tcpar_Req1_WrongSubfunction'", 'AUTO_NBR', 'send_req1_wrongsubfunction');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_DefaultRes' should be obtained.", 'enter_to_defaultsession');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'enter_to_defaultsession');

	S_teststep_expected("'$tcpar_Neg_Response' should be obtained.", 'send_req1_wrongsubfunction');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req1_wrongsubfunction');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
