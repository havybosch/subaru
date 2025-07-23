#### TEST CASE MODULE
package TC_COA_Idlemode;

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

TC_COA_Idlemode

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard Preparation.

2.Send reprogramming bit as below for Msg id

EGI040,TCU048,VDC139

EGI040_1_7_REPROGRAMING=0

TCU048_1_7_REPROGRAMING=0

VDC139_1_7_REPROGRAMING=0


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.Create Idle mode condition.

3.reset the ECU.

4.Create<Fault>on Rx message.

4.Wait for fault to qualify.

5.Send <Req_DTCstatus>


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.<ReadDTCResp> should be observed


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Fault' => 
	SCALAR 'Req_DTCstatus' => 
	SCALAR 'ReadDTCResp' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the CAN fault dianosis during idle mode' # description of test case
	
	# input parameters
	
	Fault='Test Heading'# CAN faults
	Req_DTCstatus='19 02 FF'
	
	#output parameters
	
	ReadDTCResp ='59 02 0A'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Fault;
my $tcpar_Req_DTCstatus;
my $tcpar_ReadDTCResp;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Req_DTCstatus =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCstatus' );
	$tcpar_ReadDTCResp =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp' );

	return 1;
}

sub TC_initialization {

	S_teststep("1.Standard Preparation.", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("2.Send reprogramming bit as below for Msg id", 'AUTO_NBR');

	S_teststep("EGI040,TCU048,VDC139", 'AUTO_NBR');

	S_teststep("EGI040_1_7_REPROGRAMING=0", 'AUTO_NBR');

	S_teststep("TCU048_1_7_REPROGRAMING=0", 'AUTO_NBR');

	S_teststep("VDC139_1_7_REPROGRAMING=0", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN.", 'AUTO_NBR');

	S_teststep("Create Idle mode condition.", 'AUTO_NBR');

	S_teststep("reset the ECU.", 'AUTO_NBR');

	S_teststep("Wait for fault to qualify.", 'AUTO_NBR', 'wait_for_fault');			#measurement 1

	S_teststep("Send '$tcpar_Req_DTCstatus'", 'AUTO_NBR', 'send_req_dtcstatus');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed", 'send_req_dtcstatus');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_dtcstatus');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
