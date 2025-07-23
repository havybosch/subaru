#### TEST CASE MODULE
package TC_COA_Idlemode_UARTFault;

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

TC_COA_Idlemode_UARTFault

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

1. Switch ON the IGN

2. Create Idle mode condition and reset ECU

3. Clear fault recorder by PD 

4. Create fault condition <UART_Condition> of UART line 

5. Wait for <t_Time>

6. Send <Req_DTCstatus>


I<B<Evaluation>>

1.-

2.-rb_swm_InitializationFailedSPSFP/ rb_swm_InitializationFailedSPSFD should be qualified

3.- No fault in the system and ECU is in Idle mode 

4.-

5.-

6. <ReadDTCResp> should be observed


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'UART_Condition' => 
	SCALAR 't_Time' => 
	SCALAR 'Req_DTCstatus' => 
	SCALAR 'ReadDTCResp' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the CAN fault dianosis during idle mode' # description of test case
	
	# input parameters
	
	UART_Condition = '<Test Heading>'# CAN UART faults
	t_Time = '300' #ms
	
	Req_DTCstatus='19 02 FF'
	
	#output parameters
	ReadDTCResp = '59 02 0A '

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_UART_Condition;
my $tcpar_t_Time;
my $tcpar_Req_DTCstatus;
my $tcpar_ReadDTCResp;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_UART_Condition =  GEN_Read_mandatory_testcase_parameter( 'UART_Condition' );
	$tcpar_t_Time =  GEN_Read_mandatory_testcase_parameter( 't_Time' );
	$tcpar_Req_DTCstatus =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCstatus' );
	$tcpar_ReadDTCResp =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp' );

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

	S_teststep("Switch ON the IGN", 'AUTO_NBR');

	S_teststep("Create Idle mode condition and reset ECU", 'AUTO_NBR', 'create_idle_mode');			#measurement 1

	S_teststep("Clear fault recorder by PD ", 'AUTO_NBR', 'clear_fault_recorder');			#measurement 2

	S_teststep("Create fault condition '$tcpar_UART_Condition' of UART line ", 'AUTO_NBR');

	S_teststep("Wait for '$tcpar_t_Time'", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_DTCstatus'", 'AUTO_NBR', 'send_req_dtcstatus');			#measurement 3

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("rb_swm_InitializationFailedSPSFP/ rb_swm_InitializationFailedSPSFD should be qualified", 'create_idle_mode');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_idle_mode');

	S_teststep_expected("No fault in the system and ECU is in Idle mode ", 'clear_fault_recorder');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'clear_fault_recorder');

	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed", 'send_req_dtcstatus');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_req_dtcstatus');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
