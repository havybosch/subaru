#### TEST CASE MODULE
package TC_COA_UARTLineFault_Undervoltage;

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

TC_COA_UARTLineFault_Undervoltage

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation

Transmit signal MET390_6_5_FAIL_UART_WA_BOX = 0 


I<B<Stimulation and Measurement>>

1. Switch ON the IGN

4. Set ECU voltage as <IGN_voltage> volts

5. Set <Tr_Signal> of <Message> to <Value1>

6. Wait for <t_Time>

7. Send <Req_ReadDTC> read DTC 

8. Read fault recorder

9. Set <Tr_Signal> of <Message> to <Value2>

10. Wait for <t_Time>

11. Send <Req_ReadDTC>

12. Read fault recorder


I<B<Evaluation>>

1.-

2.-

3.

4.

5. 

6.

7. <Resp_ReadDTC> should be observed

8. Fault <Fault> should be in <State>

9. 

10.

11. <Resp_ReadDTC> should be observed

12. Fault <Fault> should be in <State1>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'IGN_Voltage' => 
	SCALAR 'Resp_ReadDTC' => 
	SCALAR 'State' => 
	SCALAR 'State' => 
	SCALAR 'purpose' => 
	SCALAR 'Value' => 
	SCALAR 'Value' => 
	SCALAR 'Message' => 
	SCALAR 'Fault' => 
	SCALAR 'Tr_Signal' => 
	SCALAR 't_Time' => 
	SCALAR 'tolerance' => 
	SCALAR 'Req_ReadDTC' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check that the UART fault is not depended on supply voltage' # description of test case
	# input parameters
	Value='<Test Heading 1>'
	Value='<Test Heading 2>'
	Message ='MET390'
	Fault = 'rb_coa_METRxMsgFailUARTLineFault_flt'
	Tr_Signal = 'MET390_6_5_FAIL_UART_WA_BOX'
	#output parameters
	t_Time = '300' #ms
	tolerance = '100' # ms
	Req_ReadDTC = '19 02 FF'
	IGN_Voltage= 8 #less than predefined threshold 8.63
	
	Resp_ReadDTC = '59 02 0A 96 61 00 0A '
	State = 'Filtered'
	State = 'Stored'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Value;
my $tcpar_Value;
my $tcpar_Message;
my $tcpar_Fault;
my $tcpar_Tr_Signal;
my $tcpar_t_Time;
my $tcpar_tolerance;
my $tcpar_Req_ReadDTC;
my $tcpar_IGN_Voltage;
my $tcpar_Resp_ReadDTC;
my $tcpar_State;
my $tcpar_State;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Value =  GEN_Read_mandatory_testcase_parameter( 'Value' );
	$tcpar_Value =  GEN_Read_mandatory_testcase_parameter( 'Value' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Tr_Signal =  GEN_Read_mandatory_testcase_parameter( 'Tr_Signal' );
	$tcpar_t_Time =  GEN_Read_mandatory_testcase_parameter( 't_Time' );
	$tcpar_tolerance =  GEN_Read_mandatory_testcase_parameter( 'tolerance' );
	$tcpar_Req_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Req_ReadDTC' );
	$tcpar_IGN_Voltage =  GEN_Read_mandatory_testcase_parameter( 'IGN_Voltage' );
	$tcpar_Resp_ReadDTC =  GEN_Read_mandatory_testcase_parameter( 'Resp_ReadDTC' );
	$tcpar_State =  GEN_Read_mandatory_testcase_parameter( 'State' );
	$tcpar_State =  GEN_Read_mandatory_testcase_parameter( 'State' );

	return 1;
}

sub TC_initialization {

	S_teststep("Standard Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("Transmit signal MET390_6_5_FAIL_UART_WA_BOX = 0 ", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN", 'AUTO_NBR');

	S_teststep("Set ECU voltage as '$tcpar_IGN_voltage' volts", 'AUTO_NBR');

	S_teststep("Set '$tcpar_Tr_Signal' of '$tcpar_Message' to '$tcpar_Value1'", 'AUTO_NBR');

	S_teststep("Wait for '$tcpar_t_Time'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTC' read DTC ", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 1

	S_teststep("Read fault recorder", 'AUTO_NBR', 'read_fault_recorder_A');			#measurement 2

	S_teststep("Set '$tcpar_Tr_Signal' of '$tcpar_Message' to '$tcpar_Value2'", 'AUTO_NBR');

	S_teststep("Wait for '$tcpar_t_Time'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTC'", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 3

	S_teststep("Read fault recorder", 'AUTO_NBR', 'read_fault_recorder_B');			#measurement 4

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Resp_ReadDTC' should be observed", 'send_req_readdtc_A');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_A');

	S_teststep_expected("Fault '$tcpar_Fault' should be in '$tcpar_State'", 'read_fault_recorder_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'read_fault_recorder_A');

	S_teststep_expected("'$tcpar_Resp_ReadDTC' should be observed", 'send_req_readdtc_B');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_B');

	S_teststep_expected("Fault '$tcpar_Fault' should be in '$tcpar_State1'", 'read_fault_recorder_B');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'read_fault_recorder_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
