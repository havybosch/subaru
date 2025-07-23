#### TEST CASE MODULE
package TC_COA_FaultUART_METCond;

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
use LIFT_CD;
use LIFT_evaluation;
use FuncLib_TNT_COM;
use LIFT_DCOM;    #necessary
use FuncLib_Project_FM;
use GENERIC_DCOM;
use LIFT_PRITT;
use LIFT_labcar;    #necessary
##################################

our $PURPOSE = "To check the quali and dequalification of fault UART line in fault condition of MET390";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_FaultUART_METCond

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

1. Switch ON ECU.

2. Wait for 7secs.

3. Send the <Tr_Signal> of <MSG_ID> to <Value1> 

4. Wait for <t_Qual> ms + <tolerance>

5. Read fault recorder

6. Change the <Tr_Signal> of <MSG_ID> to <Value2> 

7. Wait for <t_Frame> ms

8. Create <Condition> in <MSG_ID>

9. Wait for <t_Qual1> ms

10. Remove <Condition> in <MSG_ID> and send the <Tr_Signal> of <MSG_ID> to<Value2> 

11. Wait for <t_Qual> - <t_Frame> ms

12. Send <Req_readDTC>

13. Read fault recorder


I<B<Evaluation>>

1.

2.

3.

4. 

5. <Fault> should be in <State>

6.

7. 

8.

9.

10. 

11.

12. <Resp_DTC> should be observed

13. <Fault> should be in <State1> 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'State' => 
	SCALAR 'State1' => 
	SCALAR 'Resp_DTC' => 
	SCALAR 'purpose' => 
	SCALAR 'Fault' => 
	SCALAR 'Condition' => 
	SCALAR 't_Qual' => 
	SCALAR 't_Qual1' => 
	SCALAR 't_Frame' => 
	SCALAR 'MSG_ID' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'Value1' => 
	SCALAR 'Value2' => 
	SCALAR 'tolerance' => 
	SCALAR 'Tr_Signal' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the quali and dequalification of fault UART line in fault condition of MET390'
	
	# input parameters
	Fault = 'rb_coa_METRxMsgFailUARTLine_flt'
	Condition = '<Test Heading 3>'
	t_Qual = '300' #ms
	t_Qual1 = '200' #ms
	t_Frame = '100' #ms
	MSG_ID='MET390'
	Req_readDTC ='19 02 FF'
	Value1 = '<Test Heading 1>'
	Value2 = '<Test Heading 2>'
	tolerance = '100' #ms
	Tr_Signal = 'MET390_6_5_FAIL_UART_WA_BOX'
	
	
	#output parameters
	State = 'Qualified'
	State1 = 'Dequalified'
	Resp_DTC = '59 02 0A 96 61 00 0A'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Fault;
my $tcpar_Condition;
my $tcpar_t_Qual;
my $tcpar_t_Qual1;
my $tcpar_t_Frame;
my $tcpar_MSG_ID;
my $tcpar_Req_readDTC;
my $tcpar_Value1;
my $tcpar_Value2;
my $tcpar_tolerance;
my $tcpar_Tr_Signal;
my $tcpar_State;
my $tcpar_State1;
my $tcpar_Resp_DTC;

################ global parameter declaration ###################
#add any global variables here
my $DTCmemory1;
my $DTCmemory2;
my $CAN_Mapping;
my $res;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_t_Qual =  GEN_Read_mandatory_testcase_parameter( 't_Qual' );
	$tcpar_t_Qual1 =  GEN_Read_mandatory_testcase_parameter( 't_Qual1' );
	$tcpar_t_Frame =  GEN_Read_mandatory_testcase_parameter( 't_Frame' );
	$tcpar_MSG_ID =  GEN_Read_mandatory_testcase_parameter( 'MSG_ID' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_Value1 =  GEN_Read_mandatory_testcase_parameter( 'Value1' );
	$tcpar_Value2 =  GEN_Read_mandatory_testcase_parameter( 'Value2' );
	$tcpar_tolerance =  GEN_Read_mandatory_testcase_parameter( 'tolerance' );
	$tcpar_Tr_Signal =  GEN_Read_mandatory_testcase_parameter( 'Tr_Signal' );
	$tcpar_State =  GEN_Read_mandatory_testcase_parameter( 'State' );
	$tcpar_State1 =  GEN_Read_mandatory_testcase_parameter( 'State1' );
	$tcpar_Resp_DTC =  GEN_Read_mandatory_testcase_parameter( 'Resp_DTC' );

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

	S_teststep("Switch ON ECU.", 'AUTO_NBR');
	LC_ECU_On(12);
	S_teststep("Wait for 7secs.", 'AUTO_NBR');
	S_wait_ms(7000);
	S_teststep("Send the '$tcpar_Tr_Signal' of '$tcpar_MSG_ID' to '$tcpar_Value1' ", 'AUTO_NBR');
	CA_write_can_signal ($tcpar_Tr_Signal , $tcpar_Value1);
	
	S_teststep("Wait for '$tcpar_t_Qual' ms + '$tcpar_tolerance'", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual + $tcpar_tolerance);
	
	S_teststep("Read fault recorder", 'AUTO_NBR', 'read_fault_recorder_A');			#measurement 1
	PD_ReadFaultMemory();
	$DTCmemory1 = FM_CD_readFaultMemory(0x09);
		
	S_teststep("Change the '$tcpar_Tr_Signal' of '$tcpar_MSG_ID' to '$tcpar_Value2' ", 'AUTO_NBR');
	CA_write_can_signal ($tcpar_Tr_Signal , $tcpar_Value2);
	
	S_teststep("Wait for '$tcpar_t_Frame' ms", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Frame);
	
	S_teststep("Create '$tcpar_Condition' in '$tcpar_MSG_ID'", 'AUTO_NBR');
	$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	if($tcpar_Condition eq 'METRxMsgTimeoutError')
	{
		COM_stopMessages($tcpar_MSG_ID);
	}
	elsif($tcpar_Condition eq 'METRxMsgCounterError')
	{
		my $cntVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSG_ID}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName ,1);
	}
	elsif($tcpar_Condition eq 'METRxMsgDLCError')
	{
		my $DLCVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSG_ID}{'CANOE_DLC'};
		CA_set_EnvVar_value($DLCVarName,0);	
	}
	elsif($tcpar_Condition eq 'METRxMsgChecksumError')
	{
		my $csVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSG_ID}{'CANOE_CS'};
		CA_set_EnvVar_value($csVarName ,1);
	}
	S_teststep("Wait for '$tcpar_t_Qual1' ms", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual1);
	S_teststep("Remove '$tcpar_Condition' in '$tcpar_MSG_ID' and send the '$tcpar_Tr_Signal' of '$tcpar_MSG_ID' to'$tcpar_Value2' ", 'AUTO_NBR');
	if($tcpar_Condition eq 'METRxMsgTimeoutError')
	{
		COM_startMessages($tcpar_MSG_ID);
	}
	elsif($tcpar_Condition eq 'METRxMsgCounterError')
	{
		my $cntVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSG_ID}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName ,0);
	}
	elsif($tcpar_Condition eq 'METRxMsgDLCError')
	{
		my $DLCVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSG_ID}{'CANOE_DLC'};
		CA_set_EnvVar_value($DLCVarName,8);	
	}
	elsif($tcpar_Condition eq 'METRxMsgChecksumError')
	{
		my $csVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSG_ID}{'CANOE_CS'};
		CA_set_EnvVar_value($csVarName ,0);
	}
	CA_write_can_signal ($tcpar_Tr_Signal , $tcpar_Value2);
	
	S_teststep("Wait for '$tcpar_t_Qual' - '$tcpar_t_Frame' ms", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Qual-$tcpar_t_Frame);
	
	S_teststep("Send '$tcpar_Req_readDTC'", 'AUTO_NBR', 'send_req_readdtc');			#measurement 2
	$res =GDCOM_request( $tcpar_Req_readDTC, $tcpar_Resp_DTC, 'strict' );
	
	S_teststep("Read fault recorder", 'AUTO_NBR', 'read_fault_recorder_B');			#measurement 3
	$DTCmemory2 = FM_CD_readFaultMemory(0x09);
	
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault' should be in '$tcpar_State'", 'read_fault_recorder_A');			#evaluation 1
	#S_teststep_detected("<<add detected result here>>", 'read_fault_recorder_A');
	for (my $i=0;$i<@{$DTCmemory1->{DTC}};$i++)
			{			
				S_teststep_detected("'$DTCmemory1->{fault_text}[$i] ($DTCmemory1->{DTC}[$i])' is qualified with $DTCmemory1->{state}[$i]", 'read_fault_recorder_A');
			}
	if ($tcpar_State eq 'Qualified')
	{
		CD_check_fault_status($DTCmemory1, $tcpar_Fault,0x0A);
	}
	elsif($tcpar_State eq 'No fault')
	{
		CD_check_fault_status($DTCmemory1, $tcpar_Fault,0x00);
	}
	S_teststep_expected("'$tcpar_Resp_DTC' should be observed", 'send_req_readdtc');			#evaluation 2
	S_teststep_detected("DTC response is observed $res", 'send_req_readdtc');
	EVAL_evaluate_string( "DTC response Check", $tcpar_Resp_DTC, $res );
	
	S_teststep_expected("'$tcpar_Fault' should be in '$tcpar_State1' ", 'read_fault_recorder_B');			#evaluation 3
	#S_teststep_detected("<<add detected result here>>", 'read_fault_recorder_B');
	for (my $i=0;$i<@{$DTCmemory2->{DTC}};$i++)
			{			
				S_teststep_detected("'$DTCmemory2->{fault_text}[$i] ($DTCmemory2->{DTC}[$i])' is qualified with $DTCmemory2->{state}[$i]", 'read_fault_recorder_B');
			}
	if ($tcpar_State1 eq 'Qualified')
	{
		CD_check_fault_status($DTCmemory2, $tcpar_Fault,0x0A);
	}
	elsif($tcpar_State1 eq 'Dequalified')
	{
		CD_check_fault_status($DTCmemory2, $tcpar_Fault,0x08);
	}
	elsif($tcpar_State1 eq 'Filtered')
	{
		CD_check_fault_status($DTCmemory2, $tcpar_Fault,0x00);
	}
	return 1;
}

sub TC_finalization {
	CA_write_can_signal ('MET390_6_5_FAIL_UART_WA_BOX' , '0', 'phys');
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request_general('REQ_ClearDTCInformation_all', 'PR_ClearDTCInformation_all','strict');
    S_wait_ms(5000);
	return 1;
}


1;
