#### TEST CASE MODULE
package TC_COA_MultipleMessage_VDCMsgCounterFaultQuaidequali_onthreeMessages;

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

TC_COA_MultipleMessage_VDCMsgCounterFaultQuaidequali_onthreeMessages

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

2.Creat <Fault> on  <MSGID1>

3.Creat <Fault> on  <MSGID2>.

4.Creat <Fault> on  <MSGID3>

5.Wait for <t_quali> msec.

6.Send <Req_readDTC> with <Status_Mask>

7.Remove <Fault> on <MSGID1> and <MSGID2>

8.Reset the IGN.

9.Send <Req_readDTC> with <Status_Mask>

10.Remove <Fault> on <MSGID3>

11.Reset the IGN.

12.Send <Req_readDTC> with <Status_Mask>

 


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.-

6.<ReadDTCResp> should be observed

7.-

8.-

9.<ReadDTCResp> should be observed

10.-

11.-

12.<ReadDTCResp_dequali> should be observed.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'MSGID1' => 
	SCALAR 'MSGID2' => 
	SCALAR 'MSGID3' => 
	SCALAR 'Req_DTCstatus' => 
	SCALAR 't_Quali' => 
	SCALAR 't_Dequali' => 
	SCALAR 'Fault' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'ReadDTCResp' => 
	SCALAR 'ReadDTCResp_dequali' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the fault qualification when the fault is present in one message and not in other message of same ECU' 
	
	# input parameters
	
	MSGID1='VDC138'
	MSGID2='VDC139'
	MSGID3='VDC328'
	Req_DTCstatus ='19 02 FF'
	t_Quali=4000 #msec
	t_Dequali=8000 #msec
	Fault ='rb_coa_<Test Heading 1>RxMsgCounterError_flt'
	
	Req_readDTC ='19 02 FF'
	
	
	
	#output parameters
	ReadDTCResp = '59 02 0A C4 16 00 08'#fault qualified
	ReadDTCResp_dequali='59 02 0A C4 16 00 08' #fault dequalified

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_MSGID1;
my $tcpar_MSGID2;
my $tcpar_MSGID3;
my $tcpar_Req_DTCstatus;
my $tcpar_t_Quali;
my $tcpar_t_Dequali;
my $tcpar_Fault;
my $tcpar_Req_readDTC;
my $tcpar_ReadDTCResp;
my $tcpar_ReadDTCResp_dequali;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_MSGID1 =  GEN_Read_mandatory_testcase_parameter( 'MSGID1' );
	$tcpar_MSGID2 =  GEN_Read_mandatory_testcase_parameter( 'MSGID2' );
	$tcpar_MSGID3 =  GEN_Read_mandatory_testcase_parameter( 'MSGID3' );
	$tcpar_Req_DTCstatus =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCstatus' );
	$tcpar_t_Quali =  GEN_Read_mandatory_testcase_parameter( 't_Quali' );
	$tcpar_t_Dequali =  GEN_Read_mandatory_testcase_parameter( 't_Dequali' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_ReadDTCResp =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp' );
	$tcpar_ReadDTCResp_dequali =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp_dequali' );

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

	S_teststep("Creat '$tcpar_Fault' on  '$tcpar_MSGID1'", 'AUTO_NBR');

	S_teststep("Creat '$tcpar_Fault' on  '$tcpar_MSGID2'.", 'AUTO_NBR');

	S_teststep("Creat '$tcpar_Fault' on  '$tcpar_MSGID3'", 'AUTO_NBR');

	S_teststep("Wait for '$tcpar_t_quali' msec.", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_readDTC' with '$tcpar_Status_Mask'", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 1

	S_teststep("Remove '$tcpar_Fault' on '$tcpar_MSGID1' and '$tcpar_MSGID2'", 'AUTO_NBR');

	S_teststep("Reset the IGN.", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_readDTC' with '$tcpar_Status_Mask'", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 2

	S_teststep("Remove '$tcpar_Fault' on '$tcpar_MSGID3'", 'AUTO_NBR');

	S_teststep("Reset the IGN.", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_readDTC' with '$tcpar_Status_Mask'", 'AUTO_NBR', 'send_req_readdtc_C');			#measurement 3

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed", 'send_req_readdtc_A');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_A');

	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed", 'send_req_readdtc_B');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_B');

	S_teststep_expected("'$tcpar_ReadDTCResp_dequali' should be observed.", 'send_req_readdtc_C');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_C');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
