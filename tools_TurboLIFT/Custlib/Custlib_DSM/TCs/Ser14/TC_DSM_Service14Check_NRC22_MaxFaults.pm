#### TEST CASE MODULE
package TC_DSM_Service14Check_NRC22_MaxFaults;

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

TC_DSM_Service14Check_NRC22_MaxFaults

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Create <Faults> 

3. Send <Req_ClearDTC>


I<B<Evaluation>>

1 

2. Faults> in <QualifiedState>.

3. <BusyResponse> should be obtained followed by <NRC_22> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'Req_ClearDTC' => 
	SCALAR 'Faults' => 
	SCALAR 'QualifiedState' => 
	SCALAR 'NRC_22' => 
	SCALAR 'BusyResponse' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of Clear DTC when maximum no.of  faults are present in filtered state'
	
	# input parameters
	Session = 'DefaultSession'
	Req_ClearDTC = 'REQ_<Fetch {Service description}>' 
	Faults = '<Test Heading>'
	QualifiedState = 'FilteredState'
	
	
	# output parameters
	NRC_22 = 'NR_conditionNotCorrect'
	BusyResponse = 'NR_requestCorrectlyReceived_ResponsePending'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Req_ClearDTC;
my $tcpar_Faults;
my $tcpar_QualifiedState;
my $tcpar_NRC_22;
my $tcpar_BusyResponse;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ClearDTC' );
	$tcpar_Faults =  GEN_Read_mandatory_testcase_parameter( 'Faults' );
	$tcpar_QualifiedState =  GEN_Read_mandatory_testcase_parameter( 'QualifiedState' );
	$tcpar_NRC_22 =  GEN_Read_mandatory_testcase_parameter( 'NRC_22' );
	$tcpar_BusyResponse =  GEN_Read_mandatory_testcase_parameter( 'BusyResponse' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Faults' ", 'AUTO_NBR', 'create_faults');			#measurement 1

	S_teststep("Send '$tcpar_Req_ClearDTC'", 'AUTO_NBR', 'send_req_cleardtc');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Faults> in '$tcpar_QualifiedState'.", 'create_faults');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_faults');

	S_teststep_expected("'$tcpar_BusyResponse' should be obtained followed by '$tcpar_NRC_22' should be obtained.", 'send_req_cleardtc');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_cleardtc');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
