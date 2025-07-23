#### TEST CASE MODULE
package TC_DSM_Service14Check_NRC22_InternalFault;

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

TC_DSM_Service14Check_NRC22_InternalFault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Create <InternalFault> 

3. Send <Req_ClearDTC>


I<B<Evaluation>>

1. 

2. <InternalFault> in <QualifiedState>.

3. <NRC_22> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'Req_ClearDTC' => 
	SCALAR 'InternalFault' => 
	SCALAR 'QualifiedState' => 
	SCALAR 'NRC_22' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check Response of Clear DTC when internal fault: VBat High is qualified '
	
	# input parameters
	Session = 'DefaultSession'
	Req_ClearDTC = 'REQ_<Fetch {Service description}>' 
	InternalFault = '<Test Heading>'
	QualifiedState = 'FilteredState'
	
	# output parameters
	NRC_22 = 'NR_conditionNotCorrect'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Req_ClearDTC;
my $tcpar_InternalFault;
my $tcpar_QualifiedState;
my $tcpar_NRC_22;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ClearDTC' );
	$tcpar_InternalFault =  GEN_Read_mandatory_testcase_parameter( 'InternalFault' );
	$tcpar_QualifiedState =  GEN_Read_mandatory_testcase_parameter( 'QualifiedState' );
	$tcpar_NRC_22 =  GEN_Read_mandatory_testcase_parameter( 'NRC_22' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');

	S_teststep("Create '$tcpar_InternalFault' ", 'AUTO_NBR', 'create_internalfault');			#measurement 1

	S_teststep("Send '$tcpar_Req_ClearDTC'", 'AUTO_NBR', 'send_req_cleardtc');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_InternalFault' in '$tcpar_QualifiedState'.", 'create_internalfault');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_internalfault');

	S_teststep_expected("'$tcpar_NRC_22' should be obtained.", 'send_req_cleardtc');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_cleardtc');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
