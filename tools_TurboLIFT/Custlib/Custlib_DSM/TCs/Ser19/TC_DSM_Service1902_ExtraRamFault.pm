#### TEST CASE MODULE
package TC_DSM_Service1902_ExtraRamFault;

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

TC_DSM_Service1902_ExtraRamFault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Create 33 faults.

2. Wait for <WaitTime>

3. Send <Req_ReadDTC> followed by <StatusMask>


I<B<Evaluation>>

1. All fault should be in <ActiveState>

2.

3. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC1_Current> <DTC2_Current>... till <DTC33_Current>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	LIST 'Session' => 
	SCALAR 'WaitTime' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'StatusMask' => 
	SCALAR 'PR_ReadDTC' => 
	SCALAR 'ActiveState' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'DTC1_Current' => 
	SCALAR 'DTC2_Current' => 
	SCALAR 'DTC33_Current' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of service 19 02 when fault is stored in Extra Ram'
	
	# input parameters
	AddressingMode = '<Fetch {Addressing Mode}>'
	Protocol = '<Fetch {Protocol}>'
	Session = @('default','extended')
	WaitTime = '3' #secs
	Req_ReadDTC = 'REQ_<Fetch {Service description}>' 
	StatusMask = 'FF'
	
	# output parameters
	PR_ReadDTC = 'PR_ReadDTCInformation_ReportDTCByStatusMask' 
	ActiveState = 'FilteredState' 
	AvalibilityMask = '0A'
	DTC1_Current = 'XX XX 00 0A'
	DTC2_Current = 'XX XX 00 0A'
	DTC33_Current = 'XX XX 00 0A' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_WaitTime;
my $tcpar_Req_ReadDTC;
my $tcpar_StatusMask;
my $tcpar_PR_ReadDTC;
my $tcpar_ActiveState;
my $tcpar_AvalibilityMask;
my $tcpar_DTC1_Current;
my $tcpar_DTC2_Current;
my $tcpar_DTC33_Current;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_StatusMask =  GEN_Read_mandatory_testcase_parameter( 'StatusMask' );
	$tcpar_PR_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_DTC1_Current =  GEN_Read_mandatory_testcase_parameter( 'DTC1_Current' );
	$tcpar_DTC2_Current =  GEN_Read_mandatory_testcase_parameter( 'DTC2_Current' );
	$tcpar_DTC33_Current =  GEN_Read_mandatory_testcase_parameter( 'DTC33_Current' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Create 33 faults.", 'AUTO_NBR', 'create_33_faults');			#measurement 1

	S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask'", 'AUTO_NBR', 'send_req_readdtc');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("All fault should be in '$tcpar_ActiveState'", 'create_33_faults');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_33_faults');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC1_Current' '$tcpar_DTC2_Current'... till '$tcpar_DTC33_Current'.", 'send_req_readdtc');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
