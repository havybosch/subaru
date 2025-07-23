#### TEST CASE MODULE
package TC_COA_LOCFaultQualicheck_Sporadic;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER  = q$Header: TCs/TCs_Project/CAN/TC_COA_LOCFaultQualicheck_Sporadic.pm 1.1 2016/08/26 16:14:31ICT pnv5kor develop  $;

#----------------------- TEST SPECIFICATION ------------------------------
#This script is based on TS: TS_COA_SubaruTR8COMApplicationlayer
#TS version in DOORS: 0.4
#-------------------------------------------------------------------------

#### INCLUDE ENGINE MODULES ####

use LIFT_general;
use INCLUDES_Project;
use LIFT_can_access;
use LIFT_CANoe;
use LIFT_CD_CAN;
use LIFT_POWER;
use LIFT_PD;
use LIFT_evaluation;
use FuncLib_TNT_COM;
use LIFT_DCOM;    #necessary
#include further modules here
use GENERIC_DCOM;
use LIFT_labcar;    #necessary

##################################

our $PURPOSE = "To check the lost of communication fault qualification check when message is transmitted sporadically";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_LOCFaultQualicheck_Sporadic

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

2.Create <fault> by stop transmission of <MSGID>.

3.Wait for <t_wait> msec 

4.Remove <fault> on <MSGID>

5.Create <fault> by stop transmission of <MSGID>.

6.Wait for <t_wait> msec 

7.Send <Req_readDTC> with status mask is FF.

8.Wait for <t_Quali1> msec.

9.Send <Req_readDTC> with status mask is FF.

 


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.

6.-

7.<ReadDTCResp> should be observed

8.-

9.<ReadDTCResp1> should be observed


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 't_wait' => 
	SCALAR 't_Quali1' => 
	SCALAR 'ReadDTCResp1' => 
	SCALAR 'purpose' => 
	SCALAR 'MSGID' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'fault' => 
	SCALAR 'ReadDTCResp' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the lost of communication fault qualification check when message is transmitted sporadically'
	# input parameters
	MSGID='<Test Heading 2>' #RxMsg ID
	Req_readDTC ='Req_<Fetch {Service description}>'
	fault='rb_coa_<Test Heading 1>RxMsgTimeout_flt'
	#output parameters
	ReadDTCResp='59 02 0A'#no fault  qualified
	
	t_wait='390' #msec
	t_Quali1='400' #msec
	
	ReadDTCResp1 = '59 02 0A C1 00 00 0A'#fault qualified

=cut

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_MSGID;
my $tcpar_Req_readDTC;
my $tcpar_fault;
my $tcpar_ReadDTCResp;
my $tcpar_t_wait;
my $tcpar_t_Quali1;
my $tcpar_ReadDTCResp1;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
my $request;
my $RequestDetails;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose      = GEN_Read_mandatory_testcase_parameter('purpose');
	$tcpar_MSGID        = GEN_Read_mandatory_testcase_parameter('MSGID');
	$tcpar_Req_readDTC  = GEN_Read_mandatory_testcase_parameter('Req_readDTC');
	$tcpar_fault        = GEN_Read_mandatory_testcase_parameter('fault');
	$tcpar_ReadDTCResp  = GEN_Read_mandatory_testcase_parameter('ReadDTCResp');
	$tcpar_t_wait       = GEN_Read_mandatory_testcase_parameter('t_wait');
	$tcpar_t_Quali1     = GEN_Read_mandatory_testcase_parameter('t_Quali1');
	$tcpar_ReadDTCResp1 = GEN_Read_mandatory_testcase_parameter('ReadDTCResp1');
	return 1;
}

sub TC_initialization {
	LC_PowerDisconnect();
	S_wait_ms(6000);
	LC_PowerConnect();
	S_wait_ms(7000);

	GDCOM_init();
	S_teststep( "1.Standard Preparation.",                      'AUTO_NBR' );
	GEN_StandardPrepNoFault();
	S_teststep( "2.Send reprogramming bit as below for Msg id", 'AUTO_NBR' );

	S_teststep( "EGI040,TCU048,VDC139", 'AUTO_NBR' );

	S_teststep("EGI040_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('EGI040_1_7_REPROGRAMING' , '0', 'phys');
	S_teststep("TCU048_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('TCU048_1_7_REPROGRAMING' , '0', 'phys');	
	S_teststep("VDC139_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('VDC139_1_7_REPROGRAMING' , '0', 'phys');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep( "Switch ON the IGN.", 'AUTO_NBR' );
	LC_ECU_On(12);
	S_wait_ms(10000);

	S_teststep( "Create '$tcpar_fault' by stop transmission of '$tcpar_MSGID'.", 'AUTO_NBR' );
	COM_stopMessages( $tcpar_MSGID, 'CAN' );

	S_teststep( "Wait for '$tcpar_t_wait' msec ", 'AUTO_NBR' );
	S_wait_ms($tcpar_t_wait);

	S_teststep( "Remove '$tcpar_fault' on '$tcpar_MSGID'", 'AUTO_NBR' );
	COM_startMessages( $tcpar_MSGID, 'CAN' );

	S_teststep( "Create '$tcpar_fault' by stop transmission of '$tcpar_MSGID'.", 'AUTO_NBR' );
	COM_stopMessages( $tcpar_MSGID, 'CAN' );

	S_teststep( "Wait for '$tcpar_t_wait' msec ", 'AUTO_NBR' );
	S_wait_ms($tcpar_t_wait);

	S_teststep( "Send '$tcpar_Req_readDTC' with status mask is FF.", 'AUTO_NBR', 'send_req_readdtc_A' );    #measurement 1
	$res1 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp, 'strict' );

	S_teststep( "Wait for '$tcpar_t_Quali1' msec.", 'AUTO_NBR' );
	S_wait_ms( $tcpar_t_Quali1);

	S_teststep( "Send '$tcpar_Req_readDTC' with status mask is FF.", 'AUTO_NBR', 'send_req_readdtc_B' );    #measurement 2
	$res2 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp1, 'strict' );

}

sub TC_evaluation {

	S_teststep_expected( "'$tcpar_ReadDTCResp' should be observed", 'send_req_readdtc_A' );                    #evaluation 1
	S_teststep_detected( "$res1", 'send_req_readdtc_A' );
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res1 );
	
	S_teststep_expected( "'$tcpar_ReadDTCResp1' should be observed", 'send_req_readdtc_B' );                   #evaluation 2
	S_teststep_detected( "'$res2'", 'send_req_readdtc_B' );
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp1, $res2);
	
	return 1;
}

sub TC_finalization {

	COM_startMessages( $tcpar_MSGID, 'CAN' );
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request_general('REQ_ClearDTCInformation_all', 'PR_ClearDTCInformation_all','strict');
    S_wait_ms(5000);
	
	return 1;
}

1;
