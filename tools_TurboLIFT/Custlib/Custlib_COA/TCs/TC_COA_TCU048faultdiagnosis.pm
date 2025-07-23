#### TEST CASE MODULE
package TC_COA_TCU048faultdiagnosis;

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
use FuncLib_Project_FM;
#include further modules here
use GENERIC_DCOM;
use LIFT_PRITT;
use LIFT_labcar;    #necessary
##################################

our $PURPOSE = "to check fault status of msg TCU048 when transmission type changed";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_TCU048faultdiagnosis

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

3.Set below transmission type in RX Msg EGI345,

EGI345_2_7_TRANSMISSION_TYPE = 1 


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.Create <fault> on TCU048.

3.Wait for <t_Qual> msec.

4.Send <Req_readDTC> with status mask is <Status_Mask>.

5.Change the <Tr_Signal>  of  <Tr_MSGID> to <Value1>. 

6.Wait for <t_Qual> msec.

7.Send <Req_readDTC> with status mask is  <Status_Mask>.

8.Change the <Tr_Signal>  of  <Tr_MSGID> to <Value>. 

9.Remove <fault>  and wait for  <t_Disqual> msec.

10.Send <Req_readDTC>  with status mask is <Status_Mask>.

11.Change the <Tr_Signal>  of  <Tr_MSGID> to <Value>. 

12.Wait for <t_Disqual> msec and  <Reset_ECU>

13.Send <Req_readDTC> with status mask is <Status_Mask>.


I<B<Evaluation>>

1.-

2.-

3.-

4.<ReadDTCResp> should be observed

5.-

6.-

7.<ReadDTCResp1> should be observed

8.-

9.-

10.<ReadDTCResp1> should be observed

11.-

12.-

13.<ReadDTCResp2> should be observed


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'fault' => 
	SCALAR 't_Qual' => 
	SCALAR 't_Disqual' => 
	SCALAR 'Reset_ECU' => 
	SCALAR 'ReadDTCResp1' => 
	SCALAR 'ReadDTCResp2' => 
	SCALAR 'purpose' => 
	SCALAR 'Tr_MSGID' => 
	SCALAR 'Tr_Signal' => 
	SCALAR 'Value' => 
	SCALAR 'Value1' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'Status_Mask' => 
	SCALAR 'ReadDTCResp' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check TCU048 fault diagnosis dependency on transmission type'
	# input parameters
	Tr_MSGID = 'EGI345'
	Tr_Signal = 'EGI345_2_7_TRANSMISSION_TYPE'
	Value = '1'
	Value1 = '0'
	Req_readDTC = '19 02 FF'
	Status_Mask = 'FF'
	#output parameters
	ReadDTCResp = '59 02 0A'
	fault= 'rb_coa_TCURxMsgTimeout_flt'
	t_Qual='400'
	t_Disqual='800'
	
	Reset_ECU='NA' #Not Apllicable step
	ReadDTCResp1 = '59 02 0A C1 01 00 0A' #DLC fault qualified
	ReadDTCResp2 = '59 02 0A C1 01 00 08' #DLC fault disqualified

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Tr_MSGID;
my $tcpar_Tr_Signal;
my $tcpar_Value;
my $tcpar_Value1;
my $tcpar_Req_readDTC;
my $tcpar_Status_Mask;
my $tcpar_ReadDTCResp;
my $tcpar_fault;
my $tcpar_t_Qual;
my $tcpar_t_Disqual;
my $tcpar_Reset_ECU;
my $tcpar_ReadDTCResp1;
my $tcpar_ReadDTCResp2;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
my $res3;
my $res4;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Tr_MSGID =  GEN_Read_mandatory_testcase_parameter( 'Tr_MSGID' );
	$tcpar_Tr_Signal =  GEN_Read_mandatory_testcase_parameter( 'Tr_Signal' );
	$tcpar_Value =  GEN_Read_mandatory_testcase_parameter( 'Value' );
	$tcpar_Value1 =  GEN_Read_mandatory_testcase_parameter( 'Value1' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_Status_Mask =  GEN_Read_mandatory_testcase_parameter( 'Status_Mask' );
	$tcpar_ReadDTCResp =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp' );
	$tcpar_fault =  GEN_Read_mandatory_testcase_parameter( 'fault' );
	$tcpar_t_Qual =  GEN_Read_mandatory_testcase_parameter( 't_Qual' );
	$tcpar_t_Disqual =  GEN_Read_mandatory_testcase_parameter( 't_Disqual' );
	$tcpar_Reset_ECU =  GEN_Read_mandatory_testcase_parameter( 'Reset_ECU' );
	$tcpar_ReadDTCResp1 =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp1' );
	$tcpar_ReadDTCResp2 =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp2' );

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
	
	S_teststep("3.Set below transmission type in RX Msg EGI345,", 'AUTO_NBR');

	S_teststep("EGI345_2_7_TRANSMISSION_TYPE = 1 ", 'AUTO_NBR');
	CA_write_can_signal('EGI345_2_7_TRANSMISSION_TYPE', '1','phys');
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN.", 'AUTO_NBR');
	LC_ECU_On();
	
	S_teststep("Create '$tcpar_fault' on TCU048.", 'AUTO_NBR');
	if ($tcpar_fault =~ /Timeout/){		
		CA_set_EnvVar_value('_enV_TCU048_StartStop',1);	
	}elsif($tcpar_fault =~ /DLC/){
		CA_set_EnvVar_value('enV_TCU048_DLC',0);	
	}elsif($tcpar_fault =~ /Counter/){
		CA_set_EnvVar_value('_enV_TCU048_MsgCtrError',1);
	}elsif($tcpar_fault =~ /Checksum/){
		CA_set_EnvVar_value('_enV_TCU048_CheckSumError',1);
	}	
	
	S_teststep("Wait for '$tcpar_t_Qual' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual);
	
	S_teststep("Send '$tcpar_Req_readDTC' with status mask is '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 1
	$res1 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp, 'strict');
	
	S_teststep("Change the '$tcpar_Tr_Signal'  of  '$tcpar_Tr_MSGID' to '$tcpar_Value1'. ", 'AUTO_NBR');
	CA_write_can_signal($tcpar_Tr_Signal,$tcpar_Value1,'phys');
	
	S_teststep("Wait for '$tcpar_t_Qual' msec.", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual);
	
	S_teststep("Send '$tcpar_Req_readDTC' with status mask is  '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 2
	$res2 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp1, 'strict');
	
	S_teststep("Change the '$tcpar_Tr_Signal'  of  '$tcpar_Tr_MSGID' to '$tcpar_Value'. ", 'AUTO_NBR');
	CA_write_can_signal($tcpar_Tr_Signal,$tcpar_Value,'phys');
	
	S_teststep("Remove '$tcpar_fault'  and wait for  '$tcpar_t_Disqual' msec.", 'AUTO_NBR');
	if ($tcpar_fault =~ /Timeout/){		
		CA_set_EnvVar_value('_enV_TCU048_StartStop',0);	
	}elsif($tcpar_fault =~ /DLC/){
		CA_set_EnvVar_value('enV_TCU048_DLC',8);	
	}elsif($tcpar_fault =~ /Counter/){
		CA_set_EnvVar_value('_enV_TCU048_MsgCtrError',0);
	}elsif($tcpar_fault =~ /Checksum/){
		CA_set_EnvVar_value('_enV_TCU048_CheckSumError',0);
	}	
	S_wait_ms($tcpar_t_Disqual);
	
	S_teststep("Send '$tcpar_Req_readDTC'  with status mask is '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_readdtc_C');			#measurement 3
	$res3 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp1, 'strict');
	
	S_teststep("Change the '$tcpar_Tr_Signal'  of  '$tcpar_Tr_MSGID' to '$tcpar_Value'. ", 'AUTO_NBR');
	CA_write_can_signal($tcpar_Tr_Signal,$tcpar_Value,'phys');
	
	S_teststep("Wait for '$tcpar_t_Disqual' msec and  '$tcpar_Reset_ECU'", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Disqual);
	if ($tcpar_Reset_ECU eq 'Yes')
	{
		LC_ECU_Reset();
	}else{	
		S_w2rep("No need to do ECU reset", 'Purple');
	}
	S_teststep("Send '$tcpar_Req_readDTC' with status mask is '$tcpar_Status_Mask'.", 'AUTO_NBR', 'send_req_readdtc_D');			#measurement 4
	$res4 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp2, 'strict');
	
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed", 'send_req_readdtc_A');			#evaluation 1
	S_teststep_detected("DTC response should be $res1", 'send_req_readdtc_A');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res1);
	
	S_teststep_expected("'$tcpar_ReadDTCResp1' should be observed", 'send_req_readdtc_B');			#evaluation 2
	S_teststep_detected("DTC response should be $res2", 'send_req_readdtc_B');
	EVAL_evaluate_string( "DTC response Check",$tcpar_ReadDTCResp1, $res2);
	
	S_teststep_expected("'$tcpar_ReadDTCResp1' should be observed", 'send_req_readdtc_C');			#evaluation 3
	S_teststep_detected("DTC response should be $res3", 'send_req_readdtc_C');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp1, $res3);
	
	S_teststep_expected("'$tcpar_ReadDTCResp2' should be observed", 'send_req_readdtc_D');			#evaluation 4
	S_teststep_detected("DTC response should be $res4", 'send_req_readdtc_D');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp2, $res4);
	return 1;
}

sub TC_finalization {
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request_general('REQ_ClearDTCInformation_all', 'PR_ClearDTCInformation_all','strict');
    S_wait_ms(5000);
	return 1;
}


1;
