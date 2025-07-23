#### TEST CASE MODULE
package TC_COA_FaultUART_Check;

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

our $PURPOSE = "To check the qualificaiton and dequalification of UART Fault";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_FaultUART_Check

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard Preparation No Fault

2.Send reprogramming bit as below for Msg id

EGI040,TCU048,VDC139

EGI040_1_7_REPROGRAMING=0

TCU048_1_7_REPROGRAMING=0

VDC139_1_7_REPROGRAMING=0

3. Send signal MET390_6_5_FAIL_UART_WA_BOX = 0


I<B<Stimulation and Measurement>>

1. IGN on

2. Wait for 7sec

3. Change the <Tr_Signal> of <MSG_ID> to <Value1>

4. Wait for <t_Quali> with <tolerance>

5. Send <Req_readDTC> 

6. Change the <Tr_Signal> of <MSG_ID> to <Value2>

7. Wait for <t_Dequali> - <t_Frame> msec with <tolerance>

8. Change the <Tr_Signal> of <MSG_ID> to <Value3>

9. Wait for <t_Frame> msec

10. Send <Req_readDTC> 

11. Check fault recoder


I<B<Evaluation>>

1.

2.

3.

4.

5. <ReadDTCResp1> should be observed

6.

7. 

8.

9.

10. <ReadDTCResp2> should be observed

11. <Fault> should be in <Fault_Status> state


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'ReadDTCResp1' => 
	SCALAR 'ReadDTCResp2' => 
	SCALAR 'purpose' => 
	SCALAR 'Tr_Signal' => 
	SCALAR 'MSG_ID' => 
	SCALAR 't_Quali' => 
	SCALAR 't_Dequali' => 
	SCALAR 't_Frame' => 
	SCALAR 'Req_readDTC' => 
	SCALAR 'Value1' => 
	SCALAR 'Value2' => 
	SCALAR 'Value3' => 
	SCALAR 'Fault' => 
	SCALAR 'tolerance' => 
	SCALAR 'Fault_Status' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the qualificaiton and dequalification of UART Fault'
	# input parameters
	Tr_Signal = 'MET390_6_5_FAIL_UART_WA_BOX'
	MSG_ID = 'MET390'
	t_Quali = '300' #ms
	t_Dequali = '300' #ms
	t_Frame = '100' #ms
	Req_readDTC ='19 02 FF'
	Value1 = '<Test Heading 1>'
	Value2 = '<Test Heading 2>'
	Value3 = '<Test Heading 3>'
	Fault = 'rb_coa_METRxMsgFailUARTLine_flt'
	tolerance = '100' #ms
	Fault_Status = '<Test Heading 4>'
	ReadDTCResp1 = '59 02 0A 96 61 00 0A'#UART fault qualified
	
	ReadDTCResp2 = '59 02 0A 96 61 00 08' # UART fault is dequalified

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Tr_Signal;
my $tcpar_MSG_ID;
my $tcpar_t_Quali;
my $tcpar_t_Dequali;
my $tcpar_t_Frame;
my $tcpar_Req_readDTC;
my $tcpar_Value1;
my $tcpar_Value2;
my $tcpar_Value3;
my $tcpar_Fault;
my $tcpar_tolerance;
my $tcpar_Fault_Status;
my $tcpar_ReadDTCResp1;
my $tcpar_ReadDTCResp2;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
my @fault;
my $DTCmemory;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Tr_Signal =  GEN_Read_mandatory_testcase_parameter( 'Tr_Signal' );
	$tcpar_MSG_ID =  GEN_Read_mandatory_testcase_parameter( 'MSG_ID' );
	$tcpar_t_Quali =  GEN_Read_mandatory_testcase_parameter( 't_Quali' );
	$tcpar_t_Dequali =  GEN_Read_mandatory_testcase_parameter( 't_Dequali' );
	$tcpar_t_Frame =  GEN_Read_mandatory_testcase_parameter( 't_Frame' );
	$tcpar_Req_readDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_readDTC' );
	$tcpar_Value1 =  GEN_Read_mandatory_testcase_parameter( 'Value1' );
	$tcpar_Value2 =  GEN_Read_mandatory_testcase_parameter( 'Value2' );
	$tcpar_Value3 =  GEN_Read_mandatory_testcase_parameter( 'Value3' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_tolerance =  GEN_Read_mandatory_testcase_parameter( 'tolerance' );
	$tcpar_Fault_Status =  GEN_Read_mandatory_testcase_parameter( 'Fault_Status' );
	$tcpar_ReadDTCResp1 =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp1' );
	$tcpar_ReadDTCResp2 =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp2' );

	return 1;
}

sub TC_initialization {

	S_teststep("1.Standard Preparation No Fault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("2.Send reprogramming bit as below for Msg id", 'AUTO_NBR');

	S_teststep("EGI040,TCU048,VDC139", 'AUTO_NBR');

	S_teststep("EGI040_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('EGI040_1_7_REPROGRAMING' , '0', 'phys');
	S_teststep("TCU048_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('TCU048_1_7_REPROGRAMING' , '0', 'phys');	
	S_teststep("VDC139_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('VDC139_1_7_REPROGRAMING' , '0', 'phys');

	S_teststep("3. Send signal MET390_6_5_FAIL_UART_WA_BOX = 0", 'AUTO_NBR');
	CA_write_can_signal ('MET390_6_5_FAIL_UART_WA_BOX' , '0', 'phys');
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("IGN on", 'AUTO_NBR');
	LC_ECU_On(12);
	
	S_teststep("Wait for 7sec", 'AUTO_NBR');
	S_wait_ms(7000);
	
	S_teststep("Change the '$tcpar_Tr_Signal' of '$tcpar_MSG_ID' to '$tcpar_Value1'", 'AUTO_NBR');
	CA_write_can_signal ($tcpar_Tr_Signal , $tcpar_Value1);
	
	S_teststep("Wait for '$tcpar_t_Quali' with '$tcpar_tolerance'", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Quali + $tcpar_tolerance);
	
	S_teststep("Send '$tcpar_Req_readDTC' ", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 1
	$res1 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp1, 'strict' );
	
	S_teststep("Change the '$tcpar_Tr_Signal' of '$tcpar_MSG_ID' to '$tcpar_Value2'", 'AUTO_NBR');
	CA_write_can_signal ($tcpar_Tr_Signal , $tcpar_Value2);
	
	S_teststep("Wait for '$tcpar_t_Dequali' - '$tcpar_t_Frame' msec with '$tcpar_tolerance'", 'AUTO_NBR');
	S_wait_ms(($tcpar_t_Dequali - $tcpar_t_Frame)+ $tcpar_tolerance);
	
	S_teststep("Change the '$tcpar_Tr_Signal' of '$tcpar_MSG_ID' to '$tcpar_Value3'", 'AUTO_NBR');
	CA_write_can_signal ($tcpar_Tr_Signal , $tcpar_Value3);
	
	S_teststep("Wait for '$tcpar_t_Frame' msec", 'AUTO_NBR');
	S_wait_ms($tcpar_t_Frame);
	
	S_teststep("Send '$tcpar_Req_readDTC' ", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 2
	$res2 = GDCOM_request( $tcpar_Req_readDTC, $tcpar_ReadDTCResp2, 'strict' );
	
	S_teststep("Check fault recoder", 'AUTO_NBR', 'check_fault_recoder');			#measurement 3
	@fault= PD_ReadFaultMemory();
	$DTCmemory = FM_CD_readFaultMemory(0x09);
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_ReadDTCResp1' should be observed", 'send_req_readdtc_A');			#evaluation 1
	S_teststep_detected("DTC response is obtained $res1", 'send_req_readdtc_A');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp1, $res1 );
	
	S_teststep_expected("'$tcpar_ReadDTCResp2' should be observed", 'send_req_readdtc_B');			#evaluation 2
	S_teststep_detected("DTC response is obtained $res2", 'send_req_readdtc_B');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp2, $res2 );
	
	S_teststep_expected("'$tcpar_Fault' should be in '$tcpar_Fault_Status' state", 'check_fault_recoder');			#evaluation 3
	#S_teststep_detected("Status fault is @fault", 'check_fault_recoder');
	my $size =@{$DTCmemory->{DTC}};
	if ($size==0)
	{
		S_teststep_detected("No Fault is qualified", 'check_fault_recoder');
	}
	else
	{
		for (my $i=0;$i<@{$DTCmemory->{DTC}};$i++)
			{			
				S_teststep_detected("'$DTCmemory->{fault_text}[$i] ($DTCmemory->{DTC}[$i])' is qualified with $DTCmemory->{state}[$i]", 'check_fault_recoder');
			}
	}
	S_w2rep("Checking for required faults and no other faults should be qualified", 'Purple');
	if (grep $_ eq 'rb_coa_METRxMsgFailUARTLine_flt',@fault)
	{	
		CD_evaluate_faults($DTCmemory,[@fault]);
		
	}
	else 
	{	
		S_w2rep("stored DTC",'green');
		CD_evaluate_faults($DTCmemory,[]);
		
	}
	if ($tcpar_Fault_Status eq 'Stored')
	{
		CD_check_fault_status($DTCmemory, $tcpar_Fault,0x08);
	}
	elsif($tcpar_Fault_Status eq 'Filtered')
	{
		CD_check_fault_status($DTCmemory, $tcpar_Fault,0x0A);
	}
	else
	{
		CD_check_fault_status($DTCmemory, $tcpar_Fault,0x00);
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
