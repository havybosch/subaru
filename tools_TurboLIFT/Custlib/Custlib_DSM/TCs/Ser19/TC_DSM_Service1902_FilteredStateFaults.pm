#### TEST CASE MODULE
package TC_DSM_Service1902_FilteredStateFaults;

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

TC_DSM_Service1902_FilteredStateFaults

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> for <Protocol>

2. Enter to <Session>

3. Create <Fault1> ,<Fault2> ,<Fault3> ,<Fault4>

4. Send <Req_ReadDTC> followed by <StatusMask1>

5. Send <Req_ReadDTC> followed by <StatusMask2>

6. Send <Req_ReadDTC> followed by <StatusMask3>

7. Send <Req_ReadDTC> followed by <StatusMask4>

8. Send <Req_ReadDTC> followed by <StatusMask5>

9. Send <Req_ReadDTC> followed by <StatusMask6>


I<B<Evaluation>>

1.

2. 

3. All Faults should be in <ActiveState>

4. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC_1> <DTC_2> <DTC_3> <DTC_4>.

5. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC_1> <DTC_2> <DTC_3> <DTC_4>

6. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC_1> <DTC_2> <DTC_3> <DTC_4>

7. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC_1> <DTC_2> <DTC_3> <DTC_4>

8. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC_1> <DTC_2> <DTC_3> <DTC_4>

9. <PR_ReadDTC> should be obtained followed by <AvalibilityMask> <DTC_1> <DTC_2> <DTC_3> <DTC_4>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	LIST 'Session' => 
	SCALAR 'Req_ReadDTC' => 
	SCALAR 'StatusMask1' => 
	SCALAR 'StatusMask2' => 
	SCALAR 'StatusMask3' => 
	SCALAR 'StatusMask4' => 
	SCALAR 'StatusMask5' => 
	SCALAR 'StatusMask6' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Fault3' => 
	SCALAR 'Fault4' => 
	SCALAR 'ActiveState' => 
	SCALAR 'PR_ReadDTC' => 
	SCALAR 'AvalibilityMask' => 
	SCALAR 'DTC_1' => 
	SCALAR 'DTC_2' => 
	SCALAR 'DTC_3' => 
	SCALAR 'DTC_4' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check response of service 1902 when faults are in filtered state'
	
	# input parameters
	AddressingMode = 'Physical'
	Protocol = 'UDS'
	Session =@('default','extended')
	Req_ReadDTC = 'REQ_<Fetch {Service description}>' 
	StatusMask1 = '02'
	StatusMask2 = '04'
	StatusMask3 = '06'
	StatusMask4 = '28'
	StatusMask5 = '10'
	StatusMask6 = '05'
	Fault1 = 'rb_coa_BIURxMsgCounterError_flt'
	Fault2 = 'rb_psem_Short2BatPASFL_flt'
	Fault3 = 'rb_psem_Short2BatPASFR_flt'
	Fault4 = 'rb_sqm_SquibResistanceOpenAB2FD_flt'
	
	# output parameters
	ActiveState = 'FilteredState'
	PR_ReadDTC = 'PR_ReadDTCInformation_ReportNumberOfDTCByStatusMask' 
	AvalibilityMask = '0A'
	DTC_1 = 'C4 22 00 0A'
	DTC_2 = '96 27 00 0A'
	DTC_3 = '96 22 00 0A'
	DTC_4 = '98 11 00 0A'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Session;
my $tcpar_Req_ReadDTC;
my $tcpar_StatusMask1;
my $tcpar_StatusMask2;
my $tcpar_StatusMask3;
my $tcpar_StatusMask4;
my $tcpar_StatusMask5;
my $tcpar_StatusMask6;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Fault3;
my $tcpar_Fault4;
my $tcpar_ActiveState;
my $tcpar_PR_ReadDTC;
my $tcpar_AvalibilityMask;
my $tcpar_DTC_1;
my $tcpar_DTC_2;
my $tcpar_DTC_3;
my $tcpar_DTC_4;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_StatusMask1 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask1' );
	$tcpar_StatusMask2 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask2' );
	$tcpar_StatusMask3 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask3' );
	$tcpar_StatusMask4 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask4' );
	$tcpar_StatusMask5 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask5' );
	$tcpar_StatusMask6 =  GEN_Read_mandatory_testcase_parameter( 'StatusMask6' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Fault3 =  GEN_Read_mandatory_testcase_parameter( 'Fault3' );
	$tcpar_Fault4 =  GEN_Read_mandatory_testcase_parameter( 'Fault4' );
	$tcpar_ActiveState =  GEN_Read_mandatory_testcase_parameter( 'ActiveState' );
	$tcpar_PR_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC' );
	$tcpar_AvalibilityMask =  GEN_Read_mandatory_testcase_parameter( 'AvalibilityMask' );
	$tcpar_DTC_1 =  GEN_Read_mandatory_testcase_parameter( 'DTC_1' );
	$tcpar_DTC_2 =  GEN_Read_mandatory_testcase_parameter( 'DTC_2' );
	$tcpar_DTC_3 =  GEN_Read_mandatory_testcase_parameter( 'DTC_3' );
	$tcpar_DTC_4 =  GEN_Read_mandatory_testcase_parameter( 'DTC_4' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' for '$tcpar_Protocol'", 'AUTO_NBR');

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Fault1' ,'$tcpar_Fault2' ,'$tcpar_Fault3' ,'$tcpar_Fault4'", 'AUTO_NBR', 'create_fault1_fault2');			#measurement 1

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask1'", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 2

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask2'", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 3

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask3'", 'AUTO_NBR', 'send_req_readdtc_C');			#measurement 4

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask4'", 'AUTO_NBR', 'send_req_readdtc_D');			#measurement 5

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask5'", 'AUTO_NBR', 'send_req_readdtc_E');			#measurement 6

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask6'", 'AUTO_NBR', 'send_req_readdtc_F');			#measurement 7

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("All Faults should be in '$tcpar_ActiveState'", 'create_fault1_fault2');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_fault1_fault2');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC_1' '$tcpar_DTC_2' '$tcpar_DTC_3' '$tcpar_DTC_4'.", 'send_req_readdtc_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_A');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC_1' '$tcpar_DTC_2' '$tcpar_DTC_3' '$tcpar_DTC_4'", 'send_req_readdtc_B');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_B');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC_1' '$tcpar_DTC_2' '$tcpar_DTC_3' '$tcpar_DTC_4'", 'send_req_readdtc_C');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_C');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC_1' '$tcpar_DTC_2' '$tcpar_DTC_3' '$tcpar_DTC_4'", 'send_req_readdtc_D');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_D');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC_1' '$tcpar_DTC_2' '$tcpar_DTC_3' '$tcpar_DTC_4'", 'send_req_readdtc_E');			#evaluation 6
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_E');

	S_teststep_expected("'$tcpar_PR_ReadDTC' should be obtained followed by '$tcpar_AvalibilityMask' '$tcpar_DTC_1' '$tcpar_DTC_2' '$tcpar_DTC_3' '$tcpar_DTC_4'", 'send_req_readdtc_F');			#evaluation 7
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_F');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
