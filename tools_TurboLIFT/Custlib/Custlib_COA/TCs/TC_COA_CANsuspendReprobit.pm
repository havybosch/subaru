#### TEST CASE MODULE
package TC_COA_CANsuspendReprobit;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER  = q$Header: TCs/TCs_Project/CAN/TC_COA_CANsuspendReprobit.pm 1.1 2016/08/26 16:14:28ICT pnv5kor develop  $;

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
use LIFT_PD;
use LIFT_evaluation;
use LIFT_DCOM;    #necessary
#include further modules here
use GENERIC_DCOM;
use LIFT_labcar;
use LIFT_POWER;

##################################

our $PURPOSE = "To check the CAN suspend condititon when reprogramming bit is set in other ECU's";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_CANsuspendReprobit

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard Preparation.

2.Start transmitting following Message ID's

EGI40

TCU048

VDC139


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.Send <ReprogSignal1> signal with <ReprogValue1> on <MSGNAME1> cyclically with <CycleTime1>

3.Wait for <t_delay>msec.

4.Send <ReprogSignal2> signal with <ReprogValue2> on <MSGNAME2> cyclically with <CycleTime2>

5.wait for <t_transmit>msec from step 4.

6.Change <ReprogSignal1> signal with <ReprogValue_changed> on <MSGNAME1> cyclically with <CycleTime1>.

7.Check the <Message>transmission state.


I<B<Evaluation>>

1.-

2.-

3.-

4.-

5.-

6.-

7.<Message>transmission state is<trans_state>


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'ReprogValue1' => 
	SCALAR 'ReprogValue2' => 
	SCALAR 'ReprogValue_changed' => 
	SCALAR 't_transmit' => 
	SCALAR 't_delay' => 
	SCALAR 'trans_state' => 
	SCALAR 'purpose' => 
	SCALAR 'ReprogSignal1' => 
	SCALAR 'MSGNAME1' => 
	SCALAR 'CycleTime1' => 
	SCALAR 'ReprogSignal2' => 
	SCALAR 'MSGNAME2' => 
	SCALAR 'CycleTime2' => 
	SCALAR 'Message' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the CAN suspend condititon when reprogramming bit is set in other ECU's' # description of test case
	# input parameters
	ReprogSignal1='EGI040_1_7_REPROGRAMING'
	MSGNAME1='EGI040'
	CycleTime1='10' #msec
	ReprogSignal2='TCU048_1_7_REPROGRAMING'
	MSGNAME2='TCU048'
	CycleTime2='10' #msec
	#output parameters
	Message='ABG33A'
	ReprogValue1='1'
	ReprogValue2='1'
	ReprogValue_changed='0'
	t_transmit='30' #msec
	t_delay='10'#msec
	
	trans_state='Transmit'#transmission happens

=cut

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_ReprogSignal1;
my $tcpar_ReprogSignal2;
my $tcpar_Message;
my $tcpar_ReprogValue1;
my $tcpar_ReprogValue2;
my $tcpar_ReprogValue_changed;
my $tcpar_t_transmit;
my $tcpar_t_delay;
my $tcpar_trans_state;

################ global parameter declaration ###################
#add any global variables here
my $chkSum_value;
my $chkSum_value1;
my $msgCount_value;
my $msgCount_value1;
my $iNDWarn_value;
my $iNDWarn_value1;
my $Transmission_State_Observed;
my $unit;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose             = GEN_Read_mandatory_testcase_parameter('purpose');
	$tcpar_ReprogSignal1       = GEN_Read_mandatory_testcase_parameter('ReprogSignal1');
	$tcpar_ReprogSignal2       = GEN_Read_mandatory_testcase_parameter('ReprogSignal2');
	$tcpar_Message             = GEN_Read_mandatory_testcase_parameter('Message');
	$tcpar_ReprogValue1        = GEN_Read_mandatory_testcase_parameter('ReprogValue1');
	$tcpar_ReprogValue2        = GEN_Read_mandatory_testcase_parameter('ReprogValue2');
	$tcpar_ReprogValue_changed = GEN_Read_mandatory_testcase_parameter('ReprogValue_changed');
	$tcpar_t_transmit          = GEN_Read_mandatory_testcase_parameter('t_transmit');
	$tcpar_t_delay             = GEN_Read_mandatory_testcase_parameter('t_delay');
	$tcpar_trans_state         = GEN_Read_mandatory_testcase_parameter('trans_state');

	return 1;
}

sub TC_initialization {
	LC_PowerDisconnect();
	S_wait_ms(6000);
	LC_PowerConnect();
	S_wait_ms(7000);

	S_teststep( "1.Standard Preparation.", 'AUTO_NBR' );
	GEN_StandardPrepNoFault();
	
	S_teststep( "2.Start transmitting following Message ID's", 'AUTO_NBR' );
	S_teststep( "EGI40",                                       'AUTO_NBR' );
	S_teststep( "TCU048",                                      'AUTO_NBR' );
	S_teststep( "VDC139",                                      'AUTO_NBR' );

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep( "Switch ON the IGN.", 'AUTO_NBR' );

	S_teststep( "Send '$tcpar_ReprogSignal1' signal with '$tcpar_ReprogValue1'", 'AUTO_NBR' );
	CA_write_can_signal( $tcpar_ReprogSignal1, $tcpar_ReprogValue1,'phys' );

	S_teststep( "Wait for '$tcpar_t_delay' msec", 'AUTO_NBR' );
	S_wait_ms($tcpar_t_delay);

	S_teststep( "Send '$tcpar_ReprogSignal2' signal with '$tcpar_ReprogValue2'", 'AUTO_NBR' );
	CA_write_can_signal( $tcpar_ReprogSignal2, $tcpar_ReprogValue2,'phys' );

	S_teststep( "wait for '$tcpar_t_transmit' msec from step 4", 'AUTO_NBR' );
	S_wait_ms($tcpar_t_transmit - $tcpar_t_delay);

	S_teststep( "Change '$tcpar_ReprogSignal1' signal with '$tcpar_ReprogValue_changed'", 'AUTO_NBR' );
	CA_write_can_signal( $tcpar_ReprogSignal1, $tcpar_ReprogValue_changed,'phys' );

	#$chkSum_value = CA_read_can_signal( 'ABG33A_0_0_CHECK_SUM' );
	($chkSum_value,$unit)= CA_read_can_signal('ABG33A_0_0_CHECK_SUM','phys');
	S_w2rep( "CheckSum = $chkSum_value", 'AUTO_NBR' );

	#$msgCount_value = CA_read_can_signal( 'ABG33A_1_0_MSG_COUNTER' );
	($msgCount_value,$unit)= CA_read_can_signal('ABG33A_1_0_MSG_COUNTER','phys');
	S_w2rep( "MsgCounter = $msgCount_value", 'AUTO_NBR' );

	S_wait_ms(3000);

	#$chkSum_value1 = CA_read_can_signal( 'ABG33A_0_0_CHECK_SUM' );
	($chkSum_value1,$unit)= CA_read_can_signal('ABG33A_0_0_CHECK_SUM','phys');
	S_w2rep( "CheckSum = $chkSum_value1", 'AUTO_NBR' );

	#$msgCount_value1 = CA_read_can_signal( 'ABG33A_1_0_MSG_COUNTER' );
	($msgCount_value1,$unit)= CA_read_can_signal('ABG33A_1_0_MSG_COUNTER','phys');
	S_w2rep( "MsgCounter = $msgCount_value1", 'AUTO_NBR' );

	S_teststep( "Check the '$tcpar_Message'transmission state.", 'AUTO_NBR', 'check_the_messagetransmission' );    #measurement 1
	if ( ($chkSum_value == $chkSum_value1) and ($msgCount_value == $msgCount_value1 )) {
		$Transmission_State_Observed = 'Stopped';
	}
	else {
		$Transmission_State_Observed = 'Transmit';
	}

	return 1;
}

sub TC_evaluation {

	S_teststep_expected( "'$tcpar_Message'transmission state is'$tcpar_trans_state'", 'check_the_messagetransmission' );    #evaluation 1
	S_teststep_detected( "$Transmission_State_Observed", 'check_the_messagetransmission' );
	EVAL_evaluate_string( "Transmissin Status Check", $tcpar_trans_state, $Transmission_State_Observed );

	return 1;
}

sub TC_finalization {
	CA_write_can_signal( $tcpar_ReprogSignal1, '0','phys');
	CA_write_can_signal( $tcpar_ReprogSignal2, '0','phys' );
	S_wait_ms(3000);
	return 1;
}

1;
