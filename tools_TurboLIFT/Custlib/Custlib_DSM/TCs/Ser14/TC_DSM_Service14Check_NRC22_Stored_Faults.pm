#### TEST CASE MODULE
package TC_DSM_Service14Check_NRC22_Stored_Faults;

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

TC_DSM_Service14Check_NRC22_Stored_Faults

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Continue from above


I<B<Stimulation and Measurement>>

1. Disqualify all faults.

2. Do IGN Reset and wait for <WaitTime>

3. Send <Req_ClearDTC>


I<B<Evaluation>>

1.

2. 

3. <Res_ClearDTC> should be obtained


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	LIST 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Session' => 
	SCALAR 'Req_ClearDTC' => 
	SCALAR 'Faults' => 
	SCALAR 'WaitTime' => 
	SCALAR 'QualifiedState' => 
	SCALAR 'Res_ClearDTC' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of Clear DTC when stored fault is present'
	
	# input parameters
	AddressingMode = @'<Fetch {Addressing Mode}>'
	Protocol = '<Fetch {Protocol}>'
	Session = 'DefaultSession'
	Req_ClearDTC = 'REQ_<Fetch {Service description}>'  
	Faults = '<Test Heading>'
	WaitTime = '6' #secs
	QualifiedState = 'FilteredState'
	
	# output parameters
	Res_ClearDTC = 'PR_ClearDTCInformation_all' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_Req_ClearDTC;
my $tcpar_Faults;
my $tcpar_WaitTime;
my $tcpar_QualifiedState;
my $tcpar_Res_ClearDTC;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ClearDTC' );
	$tcpar_Faults =  GEN_Read_mandatory_testcase_parameter( 'Faults' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_QualifiedState =  GEN_Read_mandatory_testcase_parameter( 'QualifiedState' );
	$tcpar_Res_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Res_ClearDTC' );

	return 1;
}

sub TC_initialization {

	S_teststep("Continue from above", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Disqualify all faults.", 'AUTO_NBR');

	S_teststep("Do IGN Reset and wait for '$tcpar_WaitTime'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ClearDTC'", 'AUTO_NBR', 'send_req_cleardtc');			#measurement 1

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Res_ClearDTC' should be obtained", 'send_req_cleardtc');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send_req_cleardtc');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
