#### TEST CASE MODULE
package TC_COA_SignalResponse_Filtered&StoredStateFault;

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

TC_COA_SignalResponse_Filtered&StoredStateFault

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

Standard Preparation


I<B<Stimulation and Measurement>>

1. IGN ON

2. Create <Fault1>,<Fault2>,<Fault3>,<Fault4>

3. Disqualify all faults and do ECU Reset

4. Send <Request> and check the cyclic transmission.


I<B<Evaluation>>

1.

2. All Faults should be in <State1>

3. Faults should be in <State2>

4. DTC Cyclic transmission is not impacted and new status will be updated in the next DTC transmission cycle and <Signals> should have updated <Signal_Values1>.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Request' => 
	SCALAR 'State1' => 
	SCALAR 'State2' => 
	LIST 'Signals' => 
	SCALAR 'Fault1' => 
	SCALAR 'Fault2' => 
	SCALAR 'Fault3' => 
	SCALAR 'Fault4' => 
	LIST 'Signal_Values' => 
	LIST 'Signal_Values1' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check the Signal Response when System has both  filtered and Stored Faults'
	
	# input parameters
	Request = '<Test Heading 2>'
	State1 = 'FilteredState'
	State2 = 'StoredState'
	Signals = @ ('ABG6FB_0_0_MSG_COUNTER','ABG6FB_2_0_DTC','ABG6FB_3_0_DTC_STATUS_BIT','ABG6FB_4_0_DTC_NUMBER')
	Fault1 = 'rb_sqm_SquibResistanceOpenAB1FD_flt'
	Fault2 = 'rb_coa_BIURxMsgTimeout_flt'
	Fault3 = 'rb_coa_EGIRxMsgTimeout_flt'
	Fault4 = 'rb_coa_VDCRxMsgTimeout_flt'
	
	
	#output parameters
	Signal_Values = @('x1','98','01','xA','4','x2','C1','40','x8','4','x3','C1','00','x8','4','x4','C1','22','xA','4')
	
	Signal_Values1 = @ ('1','0','0','0','0')

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Request;
my $tcpar_State1;
my $tcpar_State2;
my $tcpar_Signals;
my $tcpar_Fault1;
my $tcpar_Fault2;
my $tcpar_Fault3;
my $tcpar_Fault4;
my $tcpar_Signal_Values;
my $tcpar_Signal_Values1;

################ global parameter declaration ###################
#add any global variables here


###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Request =  GEN_Read_mandatory_testcase_parameter( 'Request' );
	$tcpar_State1 =  GEN_Read_mandatory_testcase_parameter( 'State1' );
	$tcpar_State2 =  GEN_Read_mandatory_testcase_parameter( 'State2' );
	$tcpar_Signals =  GEN_Read_mandatory_testcase_parameter( 'Signals' );
	$tcpar_Fault1 =  GEN_Read_mandatory_testcase_parameter( 'Fault1' );
	$tcpar_Fault2 =  GEN_Read_mandatory_testcase_parameter( 'Fault2' );
	$tcpar_Fault3 =  GEN_Read_mandatory_testcase_parameter( 'Fault3' );
	$tcpar_Fault4 =  GEN_Read_mandatory_testcase_parameter( 'Fault4' );
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

	S_teststep("Create '$tcpar_Fault1','$tcpar_Fault2','$tcpar_Fault3','$tcpar_Fault4'", 'AUTO_NBR', 'create_fault1fault2fault3fault4');			#measurement 1

	S_teststep("Disqualify all faults and do ECU Reset", 'AUTO_NBR', 'disqualify_all_faults');			#measurement 2

	S_teststep("Send '$tcpar_Request' and check the cyclic transmission.", 'AUTO_NBR', 'send_request_and');			#measurement 3

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("All Faults should be in '$tcpar_State1'", 'create_fault1fault2fault3fault4');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'create_fault1fault2fault3fault4');

	S_teststep_expected("Faults should be in '$tcpar_State2'", 'disqualify_all_faults');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'disqualify_all_faults');

	S_teststep_expected("DTC Cyclic transmission is not impacted and new status will be updated in the next DTC transmission cycle and '$tcpar_Signals' should have updated '$tcpar_Signal_Values1'.", 'send_request_and');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'send_request_and');

	return 1;
}

sub TC_finalization {

	return 1;
}


1;
