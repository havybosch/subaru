#### TEST CASE MODULE
package TC_COA_UARTLineFault_Autarky;

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

TC_COA_UARTLineFault_Autarky

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation No Fault


I<B<Stimulation and Measurement>>

1. Switch ON the IGN

2. Set <Tr_Signal> of <Message> to <Value>

3. Wait for <t_Time> with <tolerance>

4. Set <Tr_Signal> of <Message> to <Value1>

5. Turn off ECU

6. Wait for <t_Time1>

7. Read fault recorder


I<B<Evaluation>>

1.-

2.-

3.

4.

5. 

6.

7. <Fault> should be in <State>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Value' => 
	SCALAR 'Value1' => 
	SCALAR 'Message' => 
	SCALAR 'Fault' => 
	SCALAR 'Tr_Signal' => 
	SCALAR 'State' => 
	SCALAR 't_Time' => 
	SCALAR 't_Time1' => 
	SCALAR 'tolerance' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check that the UART fault is qualified when ECU is in Autarky mode' # description of test case
	
	# input parameters
	Value='<Test Heading 1>'
	Value1='<Test Heading 2>'
	Message ='MET390'
	Fault = 'rb_coa_METRxMsgFailUARTLineFault_flt'
	Tr_Signal = 'MET390_6_5_FAIL_UART_WA_BOX'
	
	State = '<Test Heading 3>'
	
	#output parameters
	t_Time = '300' #ms
	t_Time1 = '300' #ms
	tolerance = '100' # ms

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Value;
my $tcpar_Value1;
my $tcpar_Message;
my $tcpar_Fault;
my $tcpar_Tr_Signal;
my $tcpar_State;
my $tcpar_t_Time;
my $tcpar_t_Time1;
my $tcpar_tolerance;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Value =  GEN_Read_mandatory_testcase_parameter( 'Value' );
	$tcpar_Value1 =  GEN_Read_mandatory_testcase_parameter( 'Value1' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Tr_Signal =  GEN_Read_mandatory_testcase_parameter( 'Tr_Signal' );
	$tcpar_State =  GEN_Read_mandatory_testcase_parameter( 'State' );
	$tcpar_t_Time =  GEN_Read_mandatory_testcase_parameter( 't_Time' );
	$tcpar_t_Time1 =  GEN_Read_mandatory_testcase_parameter( 't_Time1' );
	$tcpar_tolerance =  GEN_Read_mandatory_testcase_parameter( 'tolerance' );

	return 1;
}

sub TC_initialization {

	S_teststep("Standard Preparation No Fault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN", 'AUTO_NBR');

	S_teststep("Set '$tcpar_Tr_Signal' of '$tcpar_Message' to '$tcpar_Value'", 'AUTO_NBR');

	S_teststep("Wait for '$tcpar_t_Time' with '$tcpar_tolerance'", 'AUTO_NBR');

	S_teststep("Set '$tcpar_Tr_Signal' of '$tcpar_Message' to '$tcpar_Value1'", 'AUTO_NBR');

	S_teststep("Turn off ECU", 'AUTO_NBR');

	S_teststep("Wait for '$tcpar_t_Time1'", 'AUTO_NBR');

	S_teststep("Read fault recorder", 'AUTO_NBR', 'read_fault_recorder');			#measurement 1

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Fault' should be in '$tcpar_State'", 'read_fault_recorder');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'read_fault_recorder');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
