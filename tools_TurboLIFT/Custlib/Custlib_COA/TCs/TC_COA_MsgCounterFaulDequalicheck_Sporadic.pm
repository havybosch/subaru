#### TEST CASE MODULE
package TC_COA_MsgCounterFaulDequalicheck_Sporadic;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER  = q$Header: TCs/TCs_Project/CAN/TC_COA_MsgCounterFaulDequalicheck_Sporadic.pm 1.1 2016/08/26 16:14:31ICT pnv5kor develop  $;

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

#include further modules here

##################################

our $PURPOSE = "To check the message counter fault dequalification check when the message is transmitted sporadically";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_MsgCounterFaulDequalicheck_Sporadic

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Continue from TS_COA_982.


I<B<Stimulation and Measurement>>

1.Remove <fault> on <MSGID>.

2.Wait for <t_wait> msec .

3.Create <fault> by stopping transmission of <MSGID>.

4.Wait for<t_wait1> msec.

5.Send <Req_readDTC> with status mask is FF.

6.Remove <fault> on <MSGID>.

7.Wait for<t_wait2> msec with <tolerance>.

8.Send <Req_readDTC> with status mask is FF.

9. Check the <LampIndSignal> Status on <MSGID1>

 


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.<ReadDTCResp> should be observed.

6.-  

7.

8.<ReadDTCResp> should be observed.

9. The value of <LampIndSignal> is set to <OFF>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 't_wait' => 
	SCALAR 't_wait1' => 
	SCALAR 't_wait2' => 
	SCALAR 'tolerance' => 
	SCALAR 'ReadDTCResp' => 
	SCALAR 'purpose' => 
	SCALAR 'MSGID' => 
	SCALAR 'fault' => 
	SCALAR 'LampIndSignal' => 
	SCALAR 'MSGID1' => 
	SCALAR 'OFF' => 
	SCALAR 'Req_readDTC' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the lost of communication fault dequalification check when the message is transmitted sporadically' 
	# input parameters
	MSGID= '<Test Heading 2>_1_0_MSG_COUNTER'  #RxMsg ID
	fault ='rb_coa_<Test Heading 1>RxMsgCounterError_flt'
	LampIndSignal = 'ABG33A_2_0_IND_WARN_ABG'
	MSGID1 = 'ABG33A'
	OFF = '0'
	Req_readDTC ='Req_<Fetch {Service description}>'
	#output parameters
	
	t_wait=790 #msec
	t_wait1=390 #msec
	t_wait2=20 #msec
	tolerance = 10 #msecs
	ReadDTCResp = '59 02 0A C4 01 00 0A' #fault dequalified

=cut

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_MSGID;
my $tcpar_fault;
my $tcpar_LampIndSignal;
my $unit;
my $tcpar_MSGID1;
my $tcpar_OFF;
my $tcpar_Req_readDTC;
my $tcpar_t_wait;
my $tcpar_t_wait1;
my $tcpar_t_wait2;
my $tcpar_tolerance;
my $tcpar_ReadDTCResp;

################ global parameter declaration ###################
#add any global variables here
my $WarningLamp_Status;
my $res1;
my $res2;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose       = GEN_Read_mandatory_testcase_parameter('purpose');
	$tcpar_MSGID         = GEN_Read_mandatory_testcase_parameter('MSGID');
	$tcpar_fault         = GEN_Read_mandatory_testcase_parameter('fault');
	$tcpar_LampIndSignal = GEN_Read_mandatory_testcase_parameter('LampIndSignal');
	$tcpar_MSGID1        = GEN_Read_mandatory_testcase_parameter('MSGID1');
	$tcpar_OFF           = GEN_Read_mandatory_testcase_parameter('OFF');
	$tcpar_Req_readDTC   = GEN_Read_mandatory_testcase_parameter('Req_readDTC');
	$tcpar_t_wait        = GEN_Read_mandatory_testcase_parameter('t_wait');
	$tcpar_t_wait1       = GEN_Read_mandatory_testcase_parameter('t_wait1');
	$tcpar_t_wait2       = GEN_Read_mandatory_testcase_parameter('t_wait2');
	$tcpar_tolerance     = GEN_Read_mandatory_testcase_parameter('tolerance');
	$tcpar_ReadDTCResp   = GEN_Read_mandatory_testcase_parameter('ReadDTCResp');
	return 1;
}

sub TC_initialization {
	LC_PowerDisconnect();
	S_wait_ms(6000);
	LC_PowerConnect();
	S_wait_ms(7000);
	PD_ClearFaultMemory();

	S_teststep( "1.Continue from TS_COA_982.", 'AUTO_NBR' );

	S_teststep( "Create '$tcpar_fault' by stop transmission of '$tcpar_MSGID'.", 'AUTO_NBR' );
	COM_setSignalState( $tcpar_MSGID, '1','CAN' );


	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep( "Remove '$tcpar_fault' on '$tcpar_MSGID'.", 'AUTO_NBR' );
	COM_setSignalState( $tcpar_MSGID, '0','CAN' );

	S_teststep( "Wait for '$tcpar_t_wait' msec .", 'AUTO_NBR' );
	S_wait_ms($tcpar_t_wait);

	S_teststep( "Create '$tcpar_fault' by stopping transmission of '$tcpar_MSGID'.", 'AUTO_NBR' );
	COM_setSignalState( $tcpar_MSGID, '1','CAN' );

	S_teststep( "Wait for'$tcpar_t_wait1' msec.", 'AUTO_NBR' );
	S_wait_ms($tcpar_t_wait1);

	S_teststep( "Send '$tcpar_Req_readDTC' with status mask is FF.", 'AUTO_NBR', 'send_req_readdtc_A' );    #measurement 1
	#my $RequestDetails = DCOM_getReqestResponseFromMapping($tcpar_Req_readDTC);
	#my $request        = $RequestDetails->{'Request'} . " " . $tcpar_Status_Mask;
	$res1 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp, 'strict' );

	S_teststep( "Remove '$tcpar_fault' on '$tcpar_MSGID'.", 'AUTO_NBR' );
	COM_setSignalState( $tcpar_MSGID, '0','CAN' );

	S_teststep( "Wait for'$tcpar_t_wait2' msec with '$tcpar_tolerance'.", 'AUTO_NBR' );
	S_wait_ms( $tcpar_t_wait2 + $tcpar_tolerance );

	S_teststep( "Send '$tcpar_Req_readDTC' with status mask is FF.", 'AUTO_NBR', 'send_req_readdtc_B' );    #measurement 2
	$res2 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp, 'strict' );

	S_teststep( "Check the '$tcpar_LampIndSignal' Status on '$tcpar_MSGID1'", 'AUTO_NBR', 'check_the_lampindsignal' );    #measurement 3
	#$WarningLamp_Status = CAN_get_Signal_value( 1, $tcpar_MSGID1, $tcpar_LampIndSignal );
	#S_w2rep( "Warning lamp = '$WarningLamp_Status'", 'AUTO_NBR' );
	($WarningLamp_Status,$unit)= CA_read_can_signal($tcpar_LampIndSignal,'phys');

	return 1;
}

sub TC_evaluation {

	S_teststep_expected( "'$tcpar_ReadDTCResp' should be observed.", 'send_req_readdtc_A' );                              #evaluation 1
	S_teststep_detected( "$res1", 'send_req_readdtc_A' );
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res1 );
	
	S_teststep_expected( "'$tcpar_ReadDTCResp' should be observed.", 'send_req_readdtc_B' );                              #evaluation 2
	S_teststep_detected( "$res2", 'send_req_readdtc_B' );
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res2 );
	
	S_teststep_expected( "The value of '$tcpar_LampIndSignal' is set to '$tcpar_OFF'", 'check_the_lampindsignal' );       #evaluation 3
	S_teststep_detected( "$WarningLamp_Status", 'check_the_lampindsignal' );
	#EVAL_evaluate_string( "WarningLamp Status Check", $tcpar_OFF, $WarningLamp_Status );
	EVAL_evaluate_value( "WarningLamp Status Check", $tcpar_OFF,'==', $WarningLamp_Status );

	return 1;
}

sub TC_finalization {

	COM_setSignalState( $tcpar_MSGID, '0','CAN' );
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request_general('REQ_ClearDTCInformation_all', 'PR_ClearDTCInformation_all','strict');
    S_wait_ms(5000);

	return 1;
}

1;
