#### TEST CASE MODULE
package TC_COA_CANsuspendcondition_notcontinous;

#### DONT MODIFY THIS SECTION ####
use strict;
use warnings;

###-------------------------------###
our $VERSION = q$Revision: 1.1 $;
our $HEADER  = q$Header: TCs/TCs_Project/CAN/TC_COA_CANsuspendcondition_notcontinous.pm 1.1 2016/08/26 16:14:29ICT pnv5kor develop  $;

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
use LIFT_DCOM;    #necessary

#include further modules here
use GENERIC_DCOM;
use LIFT_labcar;
use LIFT_evaluation;
##################################

our $PURPOSE = "To check the CAN suspend condititon when reprogramming bit is set in other ECU's";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_CANsuspendcondition_notcontinous

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

1.Standard Preparation.

2.Start transmitting following Message ID's

EGI040

TCU048

VDC139


I<B<Stimulation and Measurement>>

1.Switch ON the IGN.

2.Send below mentioned reprogramming sequences 

EGI040_1_7_REPROGRAMING=<EGIReprogValue>

TCU048_1_7_REPROGRAMING=<TCUReprogValue>

VDC139_1_7_REPROGRAMING=<VDCReprogValue>

3.Wait for <Wait_time>msec.

4.Send below mentioned reprogramming sequences 

EGI040_1_7_REPROGRAMING=<EGIReprogValue1>

TCU048_1_7_REPROGRAMING=<TCUReprogValue1>

VDC139_1_7_REPROGRAMING=<VDCReprogValue1>

5.Check the <Message>transmission state.


I<B<Evaluation>>

1.-

2.-

3.-

4.

5.<Message>transmission state should be <trans_state>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'EGIReprogValue' => 
	SCALAR 'TCUReprogValue' => 
	SCALAR 'VDCReprogValue' => 
	SCALAR 'EGIReprogValue1' => 
	SCALAR 'TCUReprogValue1' => 
	SCALAR 'VDCReprogValue1' => 
	SCALAR 'Wait_time' => 
	SCALAR 'trans_state' => 
	SCALAR 'Rx_state' => 
	SCALAR 'purpose' => 
	SCALAR 'Message' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the CAN suspend condititon when reprogramming bit is set in other ECU's' # description of test case
	# input parameters
	#output parameters
	Message='ABG33A'
	EGIReprogValue='1'
	TCUReprogValue='1'
	VDCReprogValue='0'
	EGIReprogValue1='0'
	TCUReprogValue1='1'
	VDCReprogValue1='0'
	Wait_time='20' #msec
	
	trans_state='Transmit'#transmission happens
	Rx_state ='Received'#rx msg transmitted to ABG ECU

=cut

#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Message;
my $tcpar_EGIReprogValue;
my $tcpar_TCUReprogValue;
my $tcpar_VDCReprogValue;
my $tcpar_EGIReprogValue1;
my $tcpar_TCUReprogValue1;
my $tcpar_VDCReprogValue1;
my $tcpar_Wait_time;
my $tcpar_trans_state;

################ global parameter declaration ###################
#add any global variables here
my $chkSum_value;
my $unit;
my $chkSum_value1;
my $msgCount_value;
my $msgCount_value1;
my $iNDWarn_value;
my $iNDWarn_value1;
my $c;
my $Transmission_State_Observed;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose         = GEN_Read_mandatory_testcase_parameter('purpose');
	$tcpar_Message         = GEN_Read_mandatory_testcase_parameter('Message');
	$tcpar_EGIReprogValue  = GEN_Read_mandatory_testcase_parameter('EGIReprogValue');
	$tcpar_TCUReprogValue  = GEN_Read_mandatory_testcase_parameter('TCUReprogValue');
	$tcpar_VDCReprogValue  = GEN_Read_mandatory_testcase_parameter('VDCReprogValue');
	$tcpar_EGIReprogValue1 = GEN_Read_mandatory_testcase_parameter('EGIReprogValue1');
	$tcpar_TCUReprogValue1 = GEN_Read_mandatory_testcase_parameter('TCUReprogValue1');
	$tcpar_VDCReprogValue1 = GEN_Read_mandatory_testcase_parameter('VDCReprogValue1');
	$tcpar_Wait_time       = GEN_Read_mandatory_testcase_parameter('Wait_time');
	$tcpar_trans_state     = GEN_Read_mandatory_testcase_parameter('trans_state');

	return 1;
}

sub TC_initialization {
#	LC_PowerDisconnect();
#	S_wait_ms(6000);
#	LC_PowerConnect();
#	S_wait_ms(7000);
	S_w2rep("Start the CANOe Measurement and CAN trace\n",'Purple');
	CA_trace_start();
	
	S_w2rep("Fetch the DIAG Mapping and CAN Mapping Info\n",'Purple');
	GDCOM_init(); 
	
	S_teststep( "1.Standard Preparation.",                     'AUTO_NBR' );
	GEN_StandardPrepNoFault();
	
	S_teststep( "2.Start transmitting following Message ID's", 'AUTO_NBR' );
	S_teststep( "EGI040",                                       'AUTO_NBR' );
	COM_startMessages('EGI040');
	S_teststep( "TCU048",                                      'AUTO_NBR' );
	COM_startMessages('TCU048');
	S_teststep( "VDC139",                                      'AUTO_NBR' );
	COM_startMessages('VDC139');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep( "Switch ON the IGN.", 'AUTO_NBR' );
		#done in initialization part
	S_teststep( "Send below mentioned reprogramming sequences ", 'AUTO_NBR' );

	S_teststep( "EGI040_1_7_REPROGRAMING='$tcpar_EGIReprogValue'", 'AUTO_NBR' );
	COM_setSignalState( 'EGI040_1_7_REPROGRAMING', $tcpar_EGIReprogValue,'CAN' );
	S_teststep( "TCU048_1_7_REPROGRAMING='$tcpar_TCUReprogValue'", 'AUTO_NBR' );
	COM_setSignalState( 'TCU048_1_7_REPROGRAMING', $tcpar_TCUReprogValue,'CAN' );
	S_teststep( "VDC139_1_7_REPROGRAMING='$tcpar_VDCReprogValue'", 'AUTO_NBR' );
	COM_setSignalState( 'VDC139_1_7_REPROGRAMING', $tcpar_VDCReprogValue,'CAN' );

	S_teststep( "Wait for '$tcpar_Wait_time' msec.", 'AUTO_NBR' );
	S_wait_ms($tcpar_Wait_time);

	S_teststep( "Send below mentioned reprogramming sequences ", 'AUTO_NBR' );

	S_teststep( "EGI040_1_7_REPROGRAMING='$tcpar_EGIReprogValue1'", 'AUTO_NBR' );
	COM_setSignalState( 'EGI040_1_7_REPROGRAMING', $tcpar_EGIReprogValue1,'CAN' );
	S_teststep( "TCU048_1_7_REPROGRAMING='$tcpar_TCUReprogValue1'", 'AUTO_NBR' );
	COM_setSignalState( 'TCU048_1_7_REPROGRAMING', $tcpar_TCUReprogValue1,'CAN' );
	S_teststep( "VDC139_1_7_REPROGRAMING='$tcpar_VDCReprogValue1'", 'AUTO_NBR' );
	COM_setSignalState( 'VDC139_1_7_REPROGRAMING', $tcpar_VDCReprogValue1,'CAN' );
	
	S_wait_ms(10);
	
	#$chkSum_value = CAN_get_Signal_value( 1, $tcpar_Message, 'ABG33A_0_0_CHECK_SUM' );
	($chkSum_value,$unit)= CA_read_can_signal('ABG33A_0_0_CHECK_SUM','phys');
	S_w2rep( "CheckSum = $chkSum_value", 'AUTO_NBR' );

	#$msgCount_value = CAN_get_Signal_value( 1, $tcpar_Message, 'ABG33A_1_0_MSG_COUNTER' );
	($msgCount_value,$unit)= CA_read_can_signal('ABG33A_1_0_MSG_COUNTER','phys');
	S_w2rep( "MsgCounter = $msgCount_value", 'AUTO_NBR' );

	S_wait_ms(3000);

	#$chkSum_value1 = CAN_get_Signal_value( 1, $tcpar_Message, 'ABG33A_0_0_CHECK_SUM' );
	($chkSum_value1,$unit)= CA_read_can_signal('ABG33A_0_0_CHECK_SUM','phys');
	S_w2rep( "CheckSum = $chkSum_value1", 'AUTO_NBR' );

	#$msgCount_value1 = CAN_get_Signal_value( 1, $tcpar_Message, 'ABG33A_1_0_MSG_COUNTER' );
	($msgCount_value1,$unit)= CA_read_can_signal('ABG33A_1_0_MSG_COUNTER','phys');
	S_w2rep( "MsgCounter = $msgCount_value1", 'AUTO_NBR' );

	S_teststep( "Check the '$tcpar_Message' transmission state.", 'AUTO_NBR', 'check_the_messagetransmission' );    #measurement 1
	if(( $chkSum_value == $chkSum_value1) and ($msgCount_value == $msgCount_value1 )) {
		$Transmission_State_Observed = 'Stopped';
	}
	else {
		$Transmission_State_Observed = 'Transmit';
	}
	return 1;
}

sub TC_evaluation {

	S_teststep_expected( "'$tcpar_Message' transmission state should be '$tcpar_trans_state'.", 'check_the_messagetransmission' );    #evaluation 1
	S_teststep_detected( "Transmission state of $tcpar_Message is $Transmission_State_Observed", 'check_the_messagetransmission' );
	EVAL_evaluate_string( "Transmissin Status Check", $tcpar_trans_state, $Transmission_State_Observed );
	return 1;
}

sub TC_finalization {
	COM_setSignalState( 'EGI040_1_7_REPROGRAMING', 0,'CAN' );
	COM_setSignalState( 'TCU048_1_7_REPROGRAMING', 0,'CAN' );
	COM_setSignalState( 'VDC139_1_7_REPROGRAMING', 0,'CAN' );
	S_wait_ms(3000);
	return 1;
}

1;
