#### TEST CASE MODULE
package TC_COA_VDCMultipleMessage_Checksumfault;

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
use LIFT_can_access;
use LIFT_CANoe;
use LIFT_CD_CAN;
use LIFT_POWER;
use LIFT_PD;
use LIFT_evaluation;
use FuncLib_TNT_COM;
use LIFT_DCOM;    #necessary
use FuncLib_Project_FM;
#include further modules here
use GENERIC_DCOM;
use LIFT_PRITT;
use LIFT_labcar;    #necessary
##################################

our $PURPOSE = "To check the checksum fault status when sending VDC multiple messages";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_VDCMultipleMessage_Checksumfault

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

6.Send <Req_readDTC> with Status_Mask is FF.

7.Remove <Fault> on <MSGID1> and <MSGID2>

8.Reset the IGN.

9.Send <Req_readDTC> with Status_Mask is FF.

10.Remove <Fault> on <MSGID3>

11.Reset the IGN.

12.Send <Req_readDTC> with Status_Mask is FF.

 


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
	SCALAR 'Req_readDTC' => 
	SCALAR 'Fault' => 
	SCALAR 't_quali' => 
	SCALAR 'ReadDTCResp' => 
	SCALAR 'ReadDTCResp_dequali' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the fault qualification Disqualification when the fault present or not present in three message from same ECU' 
	
	# input parameters
	
	MSGID1='VDC138'
	MSGID2='VDC139'
	MSGID3='VDC328'
	Req_readDTC ='19 02 FF'
	
	Fault='rb_coa_<Test Heading 1>RxMsgChecksumError_flt'
	
	
	
	
	#output parameters
	t_quali='4000' #msec
	
	ReadDTCResp = '59 02 0A C4 16 00 0A'#fault qualified
	ReadDTCResp_dequali = '59 02 0A C4 16 00 08'#fault dequalified

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_MSGID1;
my $tcpar_MSGID2;
my $tcpar_MSGID3;
my $tcpar_Req_readDTC;
my $tcpar_Fault;
my $tcpar_t_quali;
my $tcpar_ReadDTCResp;
my $tcpar_ReadDTCResp_dequali;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
my $res3;
my $CAN_Mapping;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_MSGID1 =  GEN_Read_mandatory_testcase_parameter( 'MSGID1' );
	$tcpar_MSGID2 =  GEN_Read_mandatory_testcase_parameter( 'MSGID2' );
	$tcpar_MSGID3 =  GEN_Read_mandatory_testcase_parameter( 'MSGID3' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_t_quali =  GEN_Read_mandatory_testcase_parameter( 't_quali' );
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
	CA_write_can_signal ('EGI040_1_7_REPROGRAMING' , '0', 'phys');
	S_teststep("TCU048_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('TCU048_1_7_REPROGRAMING' , '0', 'phys');
	S_teststep("VDC139_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('VDC139_1_7_REPROGRAMING' , '0', 'phys');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN.", 'AUTO_NBR');
	LC_ECU_On(12);
	S_wait_ms(10000);
	$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	S_teststep("Creat '$tcpar_Fault' on  '$tcpar_MSGID1'", 'AUTO_NBR');
	my $csVarName1 = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID1}{'CANOE_CS'};
	CA_set_EnvVar_value($csVarName1 ,1);
	PD_ReadFaultMemory();
	
	S_teststep("Creat '$tcpar_Fault' on  '$tcpar_MSGID2'.", 'AUTO_NBR');
	my $csVarName2 = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID2}{'CANOE_CS'};
	CA_set_EnvVar_value($csVarName2 ,1);
	PD_ReadFaultMemory();
	
	S_teststep("Creat '$tcpar_Fault' on  '$tcpar_MSGID3'", 'AUTO_NBR');
	my $csVarName3 = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID3}{'CANOE_CS'};
	CA_set_EnvVar_value($csVarName3 ,1);
	PD_ReadFaultMemory();
	
	S_teststep("Wait for '$tcpar_t_quali' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_quali);
	
	S_teststep("Send '$tcpar_Req_readDTC' with Status_Mask is FF.", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 1
	$res1 = GDCOM_request( $tcpar_Req_readDTC,$tcpar_ReadDTCResp, 'strict' );
	
	S_teststep("Remove '$tcpar_Fault' on '$tcpar_MSGID1' and '$tcpar_MSGID2'", 'AUTO_NBR');
	my $csVarName4 = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID1}{'CANOE_CS'};
	CA_set_EnvVar_value($csVarName3 ,0);
	my $csVarName5 = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID2}{'CANOE_CS'};
	CA_set_EnvVar_value($csVarName3 ,0);
	
	PD_ReadFaultMemory();
	S_teststep("Reset the IGN.", 'AUTO_NBR');
	LC_ECU_Reset();
	
	S_teststep("Send '$tcpar_Req_readDTC' with Status_Mask is FF.", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 2
	$res2 = GDCOM_request( $tcpar_Req_readDTC,$tcpar_ReadDTCResp, 'strict' );
	
	S_teststep("Remove '$tcpar_Fault' on '$tcpar_MSGID3'", 'AUTO_NBR');
	my $csVarName6 = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID3}{'CANOE_CS'};
	CA_set_EnvVar_value($csVarName3 ,0);
	
	S_teststep("Reset the IGN.", 'AUTO_NBR');
	LC_ECU_Reset();
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_readDTC' with Status_Mask is FF.", 'AUTO_NBR', 'send_req_readdtc_C');			#measurement 3
	$res3 = GDCOM_request( $tcpar_Req_readDTC,$tcpar_ReadDTCResp_dequali, 'strict' ); 
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed", 'send_req_readdtc_A');			#evaluation 1
	S_teststep_detected("DTC response is obtained $res1", 'send_req_readdtc_A');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res1 );

	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed", 'send_req_readdtc_B');			#evaluation 2
	S_teststep_detected("DTC response is obtained $res2", 'send_req_readdtc_B');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res2 );

	S_teststep_expected("'$tcpar_ReadDTCResp_dequali' should be observed.", 'send_req_readdtc_C');			#evaluation 3
	S_teststep_detected("DTC response is obtained $res3", 'send_req_readdtc_C');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp_dequali, $res3 );

	return 1;
}

sub TC_finalization {
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request_general('REQ_ClearDTCInformation_all', 'PR_ClearDTCInformation_all','strict');
    S_wait_ms(5000);
	return 1;
}


1;
