#### TEST CASE MODULE
package TC_COA_SignalResponse_BusOff;

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

TC_COA_SignalResponse_BusOff

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation


I<B<Stimulation and Measurement>>

1. IGN ON

2. Create <Fault1>,<Fault2>,<Fault3>

3. Create <Condition> and wait for <WaitTime> and recover from <Condition>

4. Check the <Signals> of <Message>

5. ECU reset and make System Fault free.

6. Again Create <Fault1>,<Fault2>,<Fault3>

7. Create <fault4> and Quickly create <Condition>.

8. Before recovering from <Condition> create <Fault5> and recover from <Condition>

9. Check the <Signals> of <Message>


I<B<Evaluation>>

1.

2. All Faults should be in <State1>

3.

4. DTC cyclic transmission shall be restarted from the first DTC and <Signal> should have <Signal_Values>

5. 

6. All Faults should be in <State1>

7. 

8.

9. DTC cyclic transmission shall be restarted from the first DTC and <Signal> should have <Signal_Values> and in next Cyclic transmission <Signal> should have updated <Signal_Values1> 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Message' => 
	SCALAR 'Condition' => 
	SCALAR 'State1' => 
	LIST 'Signals' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Fault3' => 
	SCALAR 'Fault4' => 
	SCALAR 'Fault5' => 
	LIST 'Signal_Values' => 
	LIST 'Signal_Values1' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the Signal Response when System undergoes Bus Off Condition'
	
	# input parameters
	Message = '0x6FB'
	Condition = '<Test Heading>'
	State1 = 'FilteredState'
	Signals = @('ABG6FB_0_0_MSG_COUNTER','ABG6FB_2_0_DTC','ABG6FB_3_0_DTC_STATUS_BIT','ABG6FB_4_0_DTC_NUMBER')
	Fault1 = 'rb_sqm_SquibResistanceOpenAB1FD_flt'
	Fault2 = 'rb_coa_BIURxMsgTimeout_flt'
	Fault3 = 'rb_coa_EGIRxMsgTimeout_flt'
	Fault4 = 'rb_coa_VDCRxMsgTimeout_flt'
	Fault5 = 'rb_coa_TCURxMsgTimeout_flt'
	
	#output parameters
	Signal_Values = @('x1','98','01','xA','4','x2','C1','40','xA','4','x3','C1','00','xA','4','x4','C0','73','0A','4')
	Signal_Values1 = @('x1','98','01','xA','6','x2','C1','40','xA','6','x3','C1','00','xA','6','x4','C1','22','xA','6','x5','C0','73','0A','6','x6','C1','01','xA','6')

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Message;
my $tcpar_Condition;
my $tcpar_State1;
my $tcpar_Signals;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Fault3;
my $tcpar_Fault4;
my $tcpar_Fault5;
my $tcpar_Signal_Values;
my $tcpar_Signal_Values1;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Message =  GEN_Read_mandatory_testcase_parameter( 'Message' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_State1 =  GEN_Read_mandatory_testcase_parameter( 'State1' );
	$tcpar_Signals =  GEN_Read_mandatory_testcase_parameter( 'Signals' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Fault3 =  GEN_Read_mandatory_testcase_parameter( 'Fault3' );
	$tcpar_Fault4 =  GEN_Read_mandatory_testcase_parameter( 'Fault4' );
	$tcpar_Fault5 =  GEN_Read_mandatory_testcase_parameter( 'Fault5' );
	$tcpar_Signal_Values =  GEN_Read_mandatory_testcase_parameter( 'Signal_Values' );
	$tcpar_Signal_Values1 =  GEN_Read_mandatory_testcase_parameter( 'Signal_Values1' );

	return 1;
}

sub TC_initialization {

	S_teststep("Standard Preparation", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("IGN ON", 'AUTO_NBR');

	S_teststep("Create '$tcpar_Fault1','$tcpar_Fault2','$tcpar_Fault3'", 'AUTO_NBR', 'create_fault1fault2fault3');			#measurement 1

	S_teststep("Create '$tcpar_Condition' and wait for '$tcpar_WaitTime' and recover from '$tcpar_Condition'", 'AUTO_NBR');

	S_teststep("Check the '$tcpar_Signals' of '$tcpar_Message'", 'AUTO_NBR', 'check_the_signals_A');			#measurement 2

	S_teststep("ECU reset and make System Fault free.", 'AUTO_NBR');

	S_teststep("Again Create '$tcpar_Fault1','$tcpar_Fault2','$tcpar_Fault3'", 'AUTO_NBR', 'again_create_fault1fault2fault3');			#measurement 3

	S_teststep("Create '$tcpar_fault4' and Quickly create '$tcpar_Condition'.", 'AUTO_NBR');

	S_teststep("Before recovering from '$tcpar_Condition' create '$tcpar_Fault5' and recover from '$tcpar_Condition'", 'AUTO_NBR');

	S_teststep("Check the '$tcpar_Signals' of '$tcpar_Message'", 'AUTO_NBR', 'check_the_signals_B');			#measurement 4

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("All Faults should be in '$tcpar_State1'", 'create_fault1fault2fault3');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_fault1fault2fault3');

	S_teststep_expected("DTC cyclic transmission shall be restarted from the first DTC and '$tcpar_Signal' should have '$tcpar_Signal_Values'", 'check_the_signals_A');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'check_the_signals_A');

	S_teststep_expected("All Faults should be in '$tcpar_State1'", 'again_create_fault1fault2fault3');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'again_create_fault1fault2fault3');

	S_teststep_expected("DTC cyclic transmission shall be restarted from the first DTC and '$tcpar_Signal' should have '$tcpar_Signal_Values' and in next Cyclic transmission '$tcpar_Signal' should have updated '$tcpar_Signal_Values1' ", 'check_the_signals_B');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'check_the_signals_B');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
