#### TEST CASE MODULE
package TC_COA_SignalResponse_Faults;

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

TC_COA_SignalResponse_Faults

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation


I<B<Stimulation and Measurement>>

1. IGN ON

2. Create <Fault1>,<Fault2>,<Fault3>,<Fault4>

3. Check the <Signals>

4. Create <Fault5> in the middle of cyclic transmission and check the behaviour

5. Disqualify <Fault2>,<Fault4> and do ECU reset

6. Check the <Signals> of <Message>


I<B<Evaluation>>

1.

2. All Faults in <State1>

3. <Signals> should have <Signal_Values> and <MsgCounter_Signal> will roll from<RollingValue>.

4. Information about <Fault5> shall not be transmitted until total count of DTC are transmitted in current sequence of cyclic transmission and updated <Signals> should have updated <Signal_Values1>.

5. Faults should be in <State2>

6.<Signals> should have <Signal_Values2> 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Message' => 
	LIST 'Signals' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Fault3' => 
	SCALAR 'Fault4' => 
	SCALAR 'Fault5' => 
	LIST 'Signal_Values' => 
	SCALAR 'State1' => 
	SCALAR 'State2' => 
	SCALAR 'MsgCounter_Signal' => 
	SCALAR 'RollingValue' => 
	LIST 'Signal_Values1' => 
	LIST 'Signal_Values2' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the Signal Response when System has filtered , Stored and faults with same DTC'
	
	# input parameters
	Message= '<Test Heading 1>'
	Signals = @ ('ABG6FB_0_0_MSG_COUNTER','ABG6FB_2_0_DTC','ABG6FB_3_0_DTC_STATUS_BIT','ABG6FB_4_0_DTC_NUMBER')
	Fault1 = 'rb_sqm_SquibResistanceOpenAB1FD_flt'
	Fault2 = 'rb_coa_VDCRxMsgChecksumError_flt'
	Fault3 = 'rb_coa_VDCRxMsgCounterError_flt'
	Fault4 = 'rb_coa_VDCRxMsgTimeout_flt'
	Fault5 = 'rb_coa_TCURxMsgCounterError_flt'
	
	#output parameters
	Signal_Values = @('x1','98','01','xA','4','x2','C4','16','xA','4','x3','C4','16','xA','4','x4','C1','22','xA','4')
	
	State1 = 'FilteredState' 
	State2 =  'StoredState'
	
	MsgCounter_Signal = 'ABG6FB_0_0_MSG_COUNTER'
	
	RollingValue = '0toF'
	
	Signal_Values1 = @('x1','98','01','xA','5','x2','C4','16','xA','5','x3','C4','16','xA','5','x4','C1','22','xA','5','x5','C4','02','xA','5')
	
	Signal_Values2 = @('x1','98','01','xA','5','x2','C4','16','x8','5','x3','C4','16','xA','5','x4','C1','22','x8','5','x5','C4','02','xA','5')

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Message;
my $tcpar_Signals;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Fault3;
my $tcpar_Fault4;
my $tcpar_Fault5;
my $tcpar_Signal_Values;
my $tcpar_State1;
my $tcpar_State2;
my $tcpar_MsgCounter_Signal;
my $tcpar_RollingValue;
my $tcpar_Signal_Values1;
my $tcpar_Signal_Values2;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_Signals =  GEN_Read_mandatory_testcase_parameter( 'Signals' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Fault3 =  GEN_Read_mandatory_testcase_parameter( 'Fault3' );
	$tcpar_Fault4 =  GEN_Read_mandatory_testcase_parameter( 'Fault4' );
	$tcpar_Fault5 =  GEN_Read_mandatory_testcase_parameter( 'Fault5' );
	$tcpar_Signal_Values =  GEN_Read_mandatory_testcase_parameter( 'Signal_Values' );
	$tcpar_State1 =  GEN_Read_mandatory_testcase_parameter( 'State1' );
	$tcpar_State2 =  GEN_Read_mandatory_testcase_parameter( 'State2' );
	$tcpar_MsgCounter_Signal =  GEN_Read_mandatory_testcase_parameter( 'MsgCounter_Signal' );
	$tcpar_RollingValue =  GEN_Read_mandatory_testcase_parameter( 'RollingValue' );
	$tcpar_Signal_Values1 =  GEN_Read_mandatory_testcase_parameter( 'Signal_Values1' );
	$tcpar_Signal_Values2 =  GEN_Read_mandatory_testcase_parameter( 'Signal_Values2' );

	return 1;
}

sub TC_initialization {

	S_teststep("Standard Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("IGN ON", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Fault1','$tcpar_Fault2','$tcpar_Fault3','$tcpar_Fault4'", 'AUTO_NBR', 'create_fault1fault2fault3fault4');			#measurement 1

	S_teststep("Check the '$tcpar_Signals'", 'AUTO_NBR', 'check_the_signals_A');			#measurement 2

	S_teststep("Create '$tcpar_Fault5' in the middle of cyclic transmission and check the behaviour", 'AUTO_NBR', 'create_fault5_in');			#measurement 3

	S_teststep("Disqualify '$tcpar_Fault2','$tcpar_Fault4' and do ECU reset", 'AUTO_NBR', 'disqualify_fault2fault4_and');			#measurement 4

	S_teststep("Check the '$tcpar_Signals' of '$tcpar_Message'", 'AUTO_NBR', 'check_the_signals_B');			#measurement 5

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("All Faults in '$tcpar_State1'", 'create_fault1fault2fault3fault4');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_fault1fault2fault3fault4');

	S_teststep_expected("'$tcpar_Signals' should have '$tcpar_Signal_Values' and '$tcpar_MsgCounter_Signal' will roll from'$tcpar_RollingValue'.", 'check_the_signals_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'check_the_signals_A');

	S_teststep_expected("Information about '$tcpar_Fault5' shall not be transmitted until total count of DTC are transmitted in current sequence of cyclic transmission and updated '$tcpar_Signals' should have updated '$tcpar_Signal_Values1'.", 'create_fault5_in');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'create_fault5_in');

	S_teststep_expected("Faults should be in '$tcpar_State2'", 'disqualify_fault2fault4_and');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'disqualify_fault2fault4_and');

	S_teststep_expected("'$tcpar_Signals' should have '$tcpar_Signal_Values2' ", 'check_the_signals_B');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'check_the_signals_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
