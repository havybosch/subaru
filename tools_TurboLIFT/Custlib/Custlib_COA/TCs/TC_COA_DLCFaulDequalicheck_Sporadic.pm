#### TEST CASE MODULE
package TC_COA_DLCFaulDequalicheck_Sporadic;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER  = q$Header: TCs/TCs_Project/CAN/TC_COA_DLCFaulDequalicheck_Sporadic.pm 1.1 2016/08/26 16:14:30ICT pnv5kor develop  $;

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

our $PURPOSE = "To check the DLC failurefault dequalification check when the message is transmitted sporadically";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_DLCFaulDequalicheck_Sporadic

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Continue from TS_COA_1439.


I<B<Stimulation and Measurement>>

1.Remove <fault> on <MSGID>.

2.Wait for <t_wait> msec.

3.Create <fault> by changing the DLC less than 8 on <MSGID>.

4.Wait for<t_wait1> msec.

5.Send <Req_readDTC> with status mask is FF.

6.Remove <fault> on <MSGID>.

7.Wait for<t_wait2> msec.

8.Send <Req_readDTC> with status mask is FF.

 


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.<ReadDTCResp> should be observed.

6.-  

7.

8.<ReadDTCResp> should be observed.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 't_wait' => 
	SCALAR 't_wait1' => 
	SCALAR 't_wait2' => 
	SCALAR 'ReadDTCResp' => 
	SCALAR 'purpose' => 
	SCALAR 'MSGID' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'fault' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the DLC failurefault dequalification check when the message is transmitted sporadically' 
	
	# input parameters
	
	MSGID='<Test Heading 2>'#RxMsg ID
	Req_readDTC ='Req_<Fetch {Service description}>'
	fault='rb_coa_<Test Heading 1>RxMsgTimeout_flt'
	#output parameters
	t_wait=790 #msec
	t_wait1=390 #msec
	t_wait2=20 #msec
	ReadDTCResp='59 02 0A C1 00 00 0A'# fault  qualified
	#ReadDTCResp1 = '59 02 0A C1 00 00 08'#fault dequalified

=cut

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_MSGID;
my $tcpar_Req_readDTC;
my $tcpar_fault;
my $tcpar_t_wait;
my $tcpar_t_wait1;
my $tcpar_t_wait2;
my $tcpar_ReadDTCResp;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
my @arry_env;
my @arry_msg;
my $arry_pos;
my $WarningLamp_Status;
my $unit;
my $res3;
my $request;
my $CAN_Mapping;
my $DLCVarName;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose       = GEN_Read_mandatory_testcase_parameter('purpose');
	$tcpar_MSGID         = GEN_Read_mandatory_testcase_parameter('MSGID');
	$tcpar_Req_readDTC   = GEN_Read_mandatory_testcase_parameter('Req_readDTC');
	$tcpar_fault         = GEN_Read_mandatory_testcase_parameter('fault');
	$tcpar_t_wait        = GEN_Read_mandatory_testcase_parameter('t_wait');
	$tcpar_t_wait1       = GEN_Read_mandatory_testcase_parameter('t_wait1');
	$tcpar_t_wait2       = GEN_Read_mandatory_testcase_parameter('t_wait2');
	$tcpar_ReadDTCResp   = GEN_Read_mandatory_testcase_parameter('ReadDTCResp');
		
	@arry_env            = ( 'enV_EGI040_DLC', 'enV_EGI345_DLC', 'enV_MET390_DLC', 'enV_TCU048_DLC', 'enV_BIU3AC_DLC', 'enV_BIU660_DLC', 'enV_VDC138_DLC', 'enV_VDC139_DLC', 'enV_VDC328_DLC' );
	@arry_msg            = ( 'EGI040', 'EGI345', 'MET390', 'TCU048', 'BIU3AC', 'BIU660', 'VDC138', 'VDC139', 'VDC328' );
	$arry_pos            = 0;
	return 1;
}

sub TC_initialization {

	LC_PowerDisconnect();
	S_wait_ms(6000);
	LC_PowerConnect();
	S_wait_ms(7000);
	PD_ClearFaultMemory();

	GDCOM_init();

	#my EnvironmentVariable_func();
	S_teststep( "1.Continue from TS_COA_1439.", 'AUTO_NBR' );

	S_teststep( "Create '$tcpar_fault' by changing the DLC less than 8 on '$tcpar_MSGID'.", 'AUTO_NBR' );
	#GDCOM_comment( 'M', $arry_env[$arry_pos] );
	#CAN_set_EnvVar_value( $arry_env[$arry_pos], 7 );
	$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	$DLCVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_DLC'};
	CA_set_EnvVar_value($DLCVarName,0);
	S_wait_ms($tcpar_t_wait1);
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep( "Remove '$tcpar_fault' on '$tcpar_MSGID'.", 'AUTO_NBR' );
	#CAN_set_EnvVar_value( $arry_env[$arry_pos], 8 );
	CA_set_EnvVar_value($DLCVarName,8);
	
	S_teststep( "Wait for '$tcpar_t_wait' msec.", 'AUTO_NBR' );
	S_wait_ms($tcpar_t_wait);

	S_teststep( "Create '$tcpar_fault' by changing the DLC less than 8 on '$tcpar_MSGID'.", 'AUTO_NBR' );
	#CAN_set_EnvVar_value( $arry_env[$arry_pos], 7 );
	CA_set_EnvVar_value($DLCVarName,0);

	S_teststep( "Wait for'$tcpar_t_wait1' msec.", 'AUTO_NBR' );
	S_wait_ms($tcpar_t_wait1);

	S_teststep( "Send '$tcpar_Req_readDTC' with status mask is FF.", 'AUTO_NBR', 'send_req_readdtc_A' );    #measurement 1
	#my $RequestDetails = DCOM_getReqestResponseFromMapping($tcpar_Req_readDTC);
	#my $request        = $RequestDetails->{'Request'} . " " . $tcpar_Status_Mask;
	$res1 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp, 'strict' );

	S_teststep( "Remove '$tcpar_fault' on '$tcpar_MSGID'.", 'AUTO_NBR' );
	CA_set_EnvVar_value($DLCVarName,8);

	S_teststep( "Wait for'$tcpar_t_wait2' msec.", 'AUTO_NBR' );
	S_wait_ms($tcpar_t_wait2);

	S_teststep( "Send '$tcpar_Req_readDTC' with status mask is FF.", 'AUTO_NBR', 'send_req_readdtc_B' );    #measurement 2
	$res2 = GDCOM_request($tcpar_Req_readDTC, $tcpar_ReadDTCResp, 'strict' );
	
	S_w2rep("check Warning lamp indicator signal");
	#S_teststep( "Check the '$tcpar_LampIndSignal' Status on '$tcpar_MSGID1'", 'AUTO_NBR', 'check_the_lampindsignal' );    #measurement 3
	#$WarningLamp_Status = CAN_get_Signal_value( 1, ABG33A, ABG33A_2_0_IND_WARN_ABG );
	($WarningLamp_Status,$unit)= CA_read_can_signal('ABG33A_2_0_IND_WARN_ABG','phys');
	EVAL_evaluate_value( "WarningLamp Status Check", 0,'==', $WarningLamp_Status );
	#S_w2rep( "print $WarningLamp_Status", 'green' );

	return 1;
}

sub TC_evaluation {

	S_teststep_expected( "'$tcpar_ReadDTCResp' should be observed.", 'send_req_readdtc_A' );                              #evaluation 1
	S_teststep_detected( "$res1", 'send_req_readdtc_A' );
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res1 );
	
	S_teststep_expected( "'$tcpar_ReadDTCResp' should be observed.", 'send_req_readdtc_B' );                             #evaluation 2
	S_teststep_detected( "$res2", 'send_req_readdtc_B' );
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res2 );
	#S_teststep_expected( "The value of '$tcpar_LampIndSignal' is set to '$tcpar_OFF'", 'check_the_lampindsignal' );       #evaluation 3
	#S_teststep_detected( "$WarningLamp_Status", 'check_the_lampindsignal' );
	#EVAL_evaluate_string( "WarningLamp Status Check", $tcpar_OFF, $WarningLamp_Status );

	return 1;
}

sub TC_finalization {
	$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	$DLCVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_DLC'};
	CA_set_EnvVar_value($DLCVarName,8);
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request_general('REQ_ClearDTCInformation_all', 'PR_ClearDTCInformation_all','strict');
    S_wait_ms(5000);
	#CAN_set_EnvVar_value( $arry_env[$arry_pos], 8 );
	#COM_startMessages($tcpar_MSGID,'CAN');
	#S_wait_ms(3000);
	return 1;
}

sub EnvironmentVariable_func() {

	if ( $tcpar_MSGID eq $arry_msg[0] ) {
		$arry_pos = 0;
	}
	elsif ( $tcpar_MSGID eq $arry_msg[1] ) {
		$arry_pos = 1;
	}
	elsif ( $tcpar_MSGID eq $arry_msg[2] ) {
		$arry_pos = 2;
	}
	elsif ( $tcpar_MSGID eq $arry_msg[3] ) {
		$arry_pos = 3;
	}
	elsif ( $tcpar_MSGID eq $arry_msg[4] ) {
		$arry_pos = 4;
	}
	elsif ( $tcpar_MSGID eq $arry_msg[5] ) {
		$arry_pos = 5;
	}
	elsif ( $tcpar_MSGID eq $arry_msg[6] ) {
		$arry_pos = 6;
	}
	elsif ( $tcpar_MSGID eq $arry_msg[7] ) {
		$arry_pos = 7;
	}
	elsif ( $tcpar_MSGID eq $arry_msg[8] ) {
		$arry_pos = 8;
	}

}

1;
