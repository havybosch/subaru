#### TEST CASE MODULE
package TC_DSM_Service1901_CombinedFaults;

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

our $PURPOSE = "To check response of service1901 when combination of latched and stored fault is present";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service1901_CombinedFaults

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Continue from TS_DSM_383

2. Set <AddressingMode> for <Protocol>

3. Enter to <Session>


I<B<Stimulation and Measurement>>

1. Disqualify <Fault1> and do IGN Reset

2. Wait for <WaitTime>

3. Send <Req_ReadNoofDTC> followed by <StatusMask1>

4. Send <Req_ReadNoofDTC> followed by <StatusMask2>

5. Send <Req_ReadNoofDTC> followed by <StatusMask3>


I<B<Evaluation>>

1.<Fault1> should be in <InactiveState>

2. 

3. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount_Filtered>.

4. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount_Filtered>.

5. <PR_ReadNoofDTC> should be obtained followed by <AvalibilityMask> <FormatIdentifier> <DTCCount_Stored>.


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
	SCALAR 'StatusMask1' => 
	SCALAR 'StatusMask2' => 
	SCALAR 'StatusMask3' => 
	SCALAR 'Fault1' => 
	SCALAR 'PR_ReadNoofDTC' => 
	SCALAR 'InactiveState' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'FormatIdentifier' => 
	SCALAR 'DTCCount_Filtered' => 
	SCALAR 'DTCCount_Stored' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of service1901 when combination of latched and stored fault is present '
	
	# input parameters
	AddressingMode = '<Fetch {Addressing Mode}>'
	Protocol = '<Fetch {Protocol}>'
	Session =@('default','extended')
	
	WaitTime = '3000' #ms
	Req_ReadNoofDTC = 'REQ_<Fetch {Service description}>'
	StatusMask1 = '02'
	StatusMask2 = '04'
	StatusMask3 = '28'
	Fault1 = 'rb_coa_BIURxMsgCounterError_flt'
	
	# output parameters
	PR_ReadNoofDTC = 'PR_ReadDTCInformation_ReportNumberOfDTCByStatusMask'
	InactiveState = 'StoredState' 
	AvalibilityMask = '0A'
	FormatIdentifier = '01'
	DTCCount_Filtered = '3'   
	 #expressed in two bytes of data
	DTCCount_Stored = '1'  #expressed in two bytes of data

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my @tcpar_Session;
my $tcpar_WaitTime;
my $tcpar_Req_ReadNoofDTC;
my $tcpar_StatusMask1;
my $tcpar_StatusMask2;
my $tcpar_StatusMask3;
my $tcpar_Fault1;
my $tcpar_PR_ReadNoofDTC;
my $tcpar_InactiveState;
my $tcpar_AvalibilityMask;
my $tcpar_FormatIdentifier;
my $tcpar_DTCCount_Filtered;
my $tcpar_DTCCount_Stored;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	@tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_WaitTime =  GEN_Read_mandatory_testcase_parameter( 'WaitTime' );
	$tcpar_Req_ReadNoofDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadNoofDTC' );
	$tcpar_StatusMask1 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask1' );
	$tcpar_StatusMask2 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask2' );
	$tcpar_StatusMask3 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask3' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_PR_ReadNoofDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadNoofDTC' );
	$tcpar_InactiveState =  GEN_Read_mandatory_testcase_parameter( 'InactiveState' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_FormatIdentifier =  GEN_Read_mandatory_testcase_parameter( 'FormatIdentifier' );
	$tcpar_DTCCount_Filtered =  GEN_Read_mandatory_testcase_parameter( 'DTCCount_Filtered' );
	$tcpar_DTCCount_Stored =  GEN_Read_mandatory_testcase_parameter( 'DTCCount_Stored' );

	return 1;
}

sub TC_initialization {

	S_teststep("1.Continue from TS_DSM_387", 'AUTO_NBR');
	S_w2rep("Run TC_DSM_Service1901_FilteredStateFaults without fixed faults ", 'Purple');
	
	S_teststep("2. Set '$tcpar_AddressingMode' for '$tcpar_Protocol'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("3. Enter to '$tcpar_Session'", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Disqualify '$tcpar_Fault1' and do IGN Reset", 'AUTO_NBR', 'disqualify_fault1_and');			#measurement 1

	S_teststep("Wait for '$tcpar_WaitTime'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask1'", 'AUTO_NBR', 'send_req_readnoofdtc_A');			#measurement 2

	S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask2'", 'AUTO_NBR', 'send_req_readnoofdtc_B');			#measurement 3

	S_teststep("Send '$tcpar_Req_ReadNoofDTC' followed by '$tcpar_StatusMask3'", 'AUTO_NBR', 'send_req_readnoofdtc_C');			#measurement 4

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault1' should be in '$tcpar_InactiveState'", 'disqualify_fault1_and');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'disqualify_fault1_and');

	S_teststep_expected("'$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount_Filtered'.", 'send_req_readnoofdtc_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readnoofdtc_A');

	S_teststep_expected("'$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount_Filtered'.", 'send_req_readnoofdtc_B');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_req_readnoofdtc_B');

	S_teststep_expected("'$tcpar_PR_ReadNoofDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_FormatIdentifier' '$tcpar_DTCCount_Stored'.", 'send_req_readnoofdtc_C');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_req_readnoofdtc_C');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
