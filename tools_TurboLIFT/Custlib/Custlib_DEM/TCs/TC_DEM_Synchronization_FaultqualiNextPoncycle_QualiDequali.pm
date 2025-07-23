#### TEST CASE MODULE
package TC_DEM_Synchronization_FaultqualiNextPoncycle_QualiDequali;

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

TC_DEM_Synchronization_FaultqualiNextPoncycle_QualiDequali

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard preparation

2.Initialize EEPROM

3.Set following values for signals of message 

BIU660_3_0_COUNT_TRIP = 00 08

BIU660_7_0_COUNT_TIME = 00 00 09


I<B<Stimulation and Measurement>>

1.Switch ON ECU.

2.Wait for 7 sec.

3.Create <fault1> condition and Wait for <t_Qual1> msec.

4.Send <Req_DTCSnapshotdata> with <Status_Mask>.

5.Remove <fault1> condition and wait for <t_DisQual1> msec.

6.Set following values for signals of message 

BIU660_3_0_COUNT_TRIP = 00 0A

BIU660_7_0_COUNT_TIME = 00 00 04

7.Reset the ECU.

8.Create <fault2> condition and wait for <t_Qual2> msec.

9.Send <Req_DTCSnapshotdata> with <Status_Mask>.


I<B<Evaluation>>

1.-

2.-

3.-

4.<PR_ReportDTCSnapshot_reponse1> should be recorded.

5.-

6.-

7.-

8.-

9.<PR_ReportDTCSnapshot_reponse2> should be recorded.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'PR_ReportDTCSnapshot_reponse1' => 
	SCALAR 'PR_ReportDTCSnapshot_reponse2' => 
	SCALAR 'purpose' => 
	LIST 'fault1' => 
	SCALAR 't_Qual1' => 
	SCALAR 't_DisQual1' => 
	LIST 'fault2' => 
	SCALAR 't_Qual2' => 
	SCALAR 'Req_DTCSnapshotdata' => 
	SCALAR 'Status_Mask' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the trip and time counter value for the fault that has qualified or requalified in next Power On cycle.'
	# description of test case
	# input parameters
	fault1=@('rb_coa_TCURxMsgCounterError_flt','rb_sqm_SquibResistanceShortBT1FL_flt')
	t_Qual1='2000'
	t_DisQual1='2000'
	fault2=@('rb_psem_Short2BatUFSR_flt','rb_pods_PODSFault_flt')
	#EM6:-fault2=@('rb_psem_Short2BatUFSR_flt','rb_psem_OpenLinePASFL_flt')
	t_Qual2= '2000'
	Req_DTCSnapshotdata = '19 05'
	Status_Mask= 'FF'
	#output parameters 
	PR_ReportDTCSnapshot_reponse1='59 05 01 C4 02 00 0A 01 10 1E 00 08 00 00 00 0X 02 99 05 00 0A 01 10 1E 00 08 00 00 00 0X'
	PR_ReportDTCSnapshot_reponse2='59 05 01 C4 02 00 08 01 10 1E 00 08 00 00 00 0X 02 99 05 00 08 01 10 1E 00 08 00 00 00 0X 03 96 12 00 0A 01 10 1E 00 0A 00 00 00 0Y 04 96 50 00 0A 01 10 1E  00 0A 00 00 00 0Y'
	#Note=X varies from 9 to C and Y varies from 4-7

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_fault1;
my $tcpar_t_Qual1;
my $tcpar_t_DisQual1;
my $tcpar_fault2;
my $tcpar_t_Qual2;
my $tcpar_Req_DTCSnapshotdata;
my $tcpar_Status_Mask;
my $tcpar_PR_ReportDTCSnapshot_reponse1;
my $tcpar_PR_ReportDTCSnapshot_reponse2;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_fault1 =  GEN_Read_mandatory_testcase_parameter( 'fault1' );
	$tcpar_t_Qual1 =  GEN_Read_mandatory_testcase_parameter( 't_Qual1' );
	$tcpar_t_DisQual1 =  GEN_Read_mandatory_testcase_parameter( 't_DisQual1' );
	$tcpar_fault2 =  GEN_Read_mandatory_testcase_parameter( 'fault2' );
	$tcpar_t_Qual2 =  GEN_Read_mandatory_testcase_parameter( 't_Qual2' );
	$tcpar_Req_DTCSnapshotdata =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCSnapshotdata' );
	$tcpar_Status_Mask =  GEN_Read_mandatory_testcase_parameter( 'Status_Mask' );
	$tcpar_PR_ReportDTCSnapshot_reponse1 =  GEN_Read_mandatory_testcase_parameter( 'PR_ReportDTCSnapshot_reponse1' );
	$tcpar_PR_ReportDTCSnapshot_reponse2 =  GEN_Read_mandatory_testcase_parameter( 'PR_ReportDTCSnapshot_reponse2' );

	return 1;
}

sub TC_initialization {

	S_teststep("1.Standard preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("2.Initialize EEPROM", 'AUTO_NBR');

	S_teststep("3.Set following values for signals of message ", 'AUTO_NBR');

	S_teststep("BIU660_3_0_COUNT_TRIP = 00 08", 'AUTO_NBR');

	S_teststep("BIU660_7_0_COUNT_TIME = 00 00 09", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON ECU.", 'AUTO_NBR');

	S_teststep("Wait for 7 sec.", 'AUTO_NBR');

	S_teststep("Create '$tcpar_fault1' condition and Wait for '$tcpar_t_Qual1' msec.", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_DTCSnapshotdata' with '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_dtcsnapshotdata_A');			#measurement 1

	S_teststep("Remove '$tcpar_fault1' condition and wait for '$tcpar_t_DisQual1' msec.", 'AUTO_NBR');

	S_teststep("Set following values for signals of message ", 'AUTO_NBR');

	S_teststep("BIU660_3_0_COUNT_TRIP = 00 0A", 'AUTO_NBR');

	S_teststep("BIU660_7_0_COUNT_TIME = 00 00 04", 'AUTO_NBR');

	S_teststep("Reset the ECU.", 'AUTO_NBR');

	S_teststep("Create '$tcpar_fault2' condition and wait for '$tcpar_t_Qual2' msec.", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_DTCSnapshotdata' with '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_dtcsnapshotdata_B');			#measurement 2

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse1' should be recorded.", 'send_req_dtcsnapshotdata_A');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send_req_dtcsnapshotdata_A');

	S_teststep_expected("'$tcpar_PR_ReportDTCSnapshot_reponse2' should be recorded.", 'send_req_dtcsnapshotdata_B');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_dtcsnapshotdata_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
