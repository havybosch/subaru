#### TEST CASE MODULE
package TC_DSM_Service19_NRC7F;

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

our $PURPOSE = "To check response of $19 service when service is not supported in active session";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service19_NRC7F

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Send <Wrong_Req1>

3.  Send <Wrong_Req2>

4.  Send <Wrong_Req3>

5.  Send <Wrong_Req4>


I<B<Evaluation>>

1.

2. <NRC_7F> should be obtained.

3. <NRC_7F> should be obtained.

4.<NRC_7F> should be obtained.

5. <NRC_7F> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'NRC' => 
	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'Wrong_Req1' => 
	SCALAR 'Wrong_Req2' => 
	SCALAR 'Wrong_Req3' => 
	SCALAR 'Wrong_Req4' => 
	SCALAR 'NRC_7F' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of $19 service when service is not supported in active session'
	
	# input parameters
	Session = '<Test Heading>'
	Wrong_Req1 = '19 01 2E'  #length = 03
	Wrong_Req2 = '19 02 FF'  #length = 03
	Wrong_Req3 = '19 05 FF'  #length = 03
	Wrong_Req4 = '19 15'  #length = 02
	
	# output parameters
	NRC_7F = 'NR_serviceNotSupportedInActiveSession'
	NRC = '7F 19 11'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Wrong_Req1;
my $tcpar_Wrong_Req2;
my $tcpar_Wrong_Req3;
my $tcpar_Wrong_Req4;
my $tcpar_NRC_7F;
my $tcpar_NRC;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Wrong_Req1 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req1' );
	$tcpar_Wrong_Req2 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req2' );
	$tcpar_Wrong_Req3 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req3' );
	$tcpar_Wrong_Req4 =  GEN_Read_mandatory_testcase_parameter( 'Wrong_Req4' );
	$tcpar_NRC_7F =  GEN_Read_mandatory_testcase_parameter( 'NRC_7F' );
	$tcpar_NRC =  GEN_Read_mandatory_testcase_parameter( 'NRC' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Wrong_Req1'", 'AUTO_NBR', 'send_wrong_req1');			#measurement 1

	S_teststep("Send '$tcpar_Wrong_Req2'", 'AUTO_NBR', 'send_wrong_req2');			#measurement 2

	S_teststep("Send '$tcpar_Wrong_Req3'", 'AUTO_NBR', 'send_wrong_req3');			#measurement 3

	S_teststep("Send '$tcpar_Wrong_Req4'", 'AUTO_NBR', 'send_wrong_req4');			#measurement 4

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NRC_7F' should be obtained.", 'send_wrong_req1');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send_wrong_req1');

	S_teststep_expected("'$tcpar_NRC_7F' should be obtained.", 'send_wrong_req2');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_wrong_req2');

	S_teststep_expected("'$tcpar_NRC_7F' should be obtained.", 'send_wrong_req3');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_wrong_req3');

	S_teststep_expected("'$tcpar_NRC_7F' should be obtained.", 'send_wrong_req4');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_wrong_req4');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
