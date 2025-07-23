#### TEST CASE MODULE
package TC_DSM_Service1901_ExtraRamFault;

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

our $PURPOSE = "To check response of sevice 19 01 when created 33 faults";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service1901_ExtraRamFault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Create 33 faults.

2. Wait for <WaitTime>

3. Send <Req_ReadNoofDTC> followed by <StatusMask>


I<B<Evaluation>>

1.All Faults should be in <ActiveState>

2.

3. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount_Filtered>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	LIST 'Session' => 
	SCALAR 'WaitTime' => 
	SCALAR 'Req_ReadNoofDTC' => 
	SCALAR 'StatusMask' => 
	SCALAR 'PR_ReadNoofDTC' => 
	SCALAR 'ActiveState' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'FormatIdentifier' => 
	SCALAR 'DTCCount_Filtered' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of sevice 19 01 when fault is present in Extra Ram'
	
	# input parameters
	AddressingMode = 'Physical'
	Protocol = 'UDS'
	Session =@('default','extended')
	WaitTime = '3000' #ms
	Req_ReadNoofDTC = 'REQ_<Fetch {Service description}>'
	StatusMask = '2E'
	
	# output parameters
	PR_ReadNoofDTC = 'PR_ReadDTCInformation_ReportNumberOfDTCByStatusMask'
	ActiveState = 'FilteredState' 
	AvalibilityMask = '0A'
	FormatIdentifier = '01'
	DTCCount_Filtered = '21'   
	 #expressed in two bytes of data(00 21) means 33 faults

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_WaitTime;
my $tcpar_Req_ReadNoofDTC;
my $tcpar_StatusMask;
my $tcpar_PR_ReadNoofDTC;
my $tcpar_ActiveState;
my $tcpar_AvalibilityMask;
my $tcpar_FormatIdentifier;
my $tcpar_DTCCount_Filtered;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_Req_ReadNoofDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadNoofDTC' );
	$tcpar_StatusMask =  GEN_Read_mandatory_testcase_parameter( 'StatusMask' );
	$tcpar_PR_ReadNoofDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadNoofDTC' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_FormatIdentifier =  GEN_Read_mandatory_testcase_parameter( 'FormatIdentifier' );
	$tcpar_DTCCount_Filtered =  GEN_Read_mandatory_testcase_parameter( 'DTCCount_Filtered' );

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

	S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask'", 'AUTO_NBR', 'send_req_readnoofdtc');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("All Faults should be in '$tcpar_ActiveState'", 'create_33_faults');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_33_faults');

	S_teststep_expected("'$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount_Filtered'.", 'send_req_readnoofdtc');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readnoofdtc');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
