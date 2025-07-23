#### TEST CASE MODULE
package TC_COA_BusOffQualificationCheck;

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
use LIFT_labcar;
use GENERIC_DCOM;
use LIFT_PD;
use LIFT_CD;
use LIFT_PRITT;
use LIFT_evaluation;     #necessary
##################################

our $PURPOSE = "<summarize what this test is good for>";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_BusOffQualificationCheck

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault

Monitor CAN Bus line in oscilloscope.


I<B<Stimulation and Measurement>>

1. Switch ON the ECU.

2. Create <Condition>

3. Create <Fault_Condition> for <Time>.

4. Check for Tx Messages.

5. Recover <Fault_Condition>

6. Check for all Messages.

7. Send <Req_ReadDTC> followed by <StatusMask>.

8. Reset ECU

9. Send <Req_ReadDTC> followed by <StatusMask>.


I<B<Evaluation>>

1.

2.

3.

4. <Transmission1> 

5.  <Fault> should be <FaultState>.

6. <Transmission2> 

7. <PR_ReadDTC1> should be obtained

8.

9. <PR_ReadDTC2> should be obtained 

 


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Transmission1' => 
	SCALAR 'Transmission2' => 
	SCALAR 'FaultState' => 
	SCALAR 'PR_ReadDTC1' => 
	SCALAR 'PR_ReadDTC2' => 
	SCALAR 'purpose' => 
	SCALAR 'Condition' => 
	SCALAR 'Fault_Condition' => 
	SCALAR 'Time' => 
	SCALAR 'Req_DTCstatus' => 
	SCALAR 'Fault' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check Qualification of CAN Bus Off Fault in different ECU Modes'
	
	# input parameters
	Condition = '<Test Heading>'
	Fault_Condition = 'CANBusoff' 
	Time = '550' #ms
	Req_DTCstatus = '19 02 FF'
	Fault = 'rb_coa_CANBusOff_flt' #DTCno: C07300
	
	#output parameters
	Transmission1 = 'Stopped'
	Transmission2 = 'Start'
	FaultState = 'Qualified'
	PR_ReadDTC1 = '59 02 0A C0 73 00 0A'
	PR_ReadDTC2 = '59 02 0A C0 73 00 08'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Condition;
my $tcpar_Fault_Condition;
my $tcpar_Time;
my $tcpar_Req_DTCstatus;
my $tcpar_Fault;
my $tcpar_Transmission1;
my $tcpar_Transmission2;
my $tcpar_FaultState;
my $tcpar_PR_ReadDTC1;
my $tcpar_PR_ReadDTC2;

################ global parameter declaration ###################
#add any global variables here
my %flt_mem_struct_pd_qualification;
my %flt_expected = (
    'NotQualified'  => '0b00000000',
    'NA'  => '0b00000000',
    'Qualified'   => '0bxxxx1xx1',
    'Dequalified' => '0bxxxx1xx0',)

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Condition =  GEN_Read_mandatory_testcase_parameter( 'Condition' );
	$tcpar_Fault_Condition =  GEN_Read_mandatory_testcase_parameter( 'Fault_Condition' );
	$tcpar_Time =  GEN_Read_mandatory_testcase_parameter( 'Time' );
	$tcpar_Req_DTCstatus =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCstatus' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_Transmission1 =  GEN_Read_mandatory_testcase_parameter( 'Transmission1' );
	$tcpar_Transmission2 =  GEN_Read_mandatory_testcase_parameter( 'Transmission2' );
	$tcpar_FaultState =  GEN_Read_mandatory_testcase_parameter( 'FaultState' );
	$tcpar_PR_ReadDTC1 =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC1' );
	$tcpar_PR_ReadDTC2 =  GEN_Read_mandatory_testcase_parameter( 'PR_ReadDTC2' );

	return 1;
}

sub TC_initialization {
	CA_simulation_start();	
	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	S_teststep("Monitor CAN Bus line in oscilloscope.", 'AUTO_NBR');

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the ECU.", 'AUTO_NBR');
	LC_ECU_On();
	S_wait_ms(8000);
	
	S_teststep("Create '$tcpar_Condition'", 'AUTO_NBR');
	if($tcpar_Condition eq 'ReprogrammingMode')
	{
		CA_write_can_signal ('EGI040_1_7_REPROGRAMING' , '1', 'phys');	
		CA_write_can_signal ('TCU048_1_7_REPROGRAMING' , '0', 'phys');	
		CA_write_can_signal ('VDC139_1_7_REPROGRAMING' , '0', 'phys');
	}
	elsif($tcpar_Condition eq 'IdleMode')
	{
		GEN_setECUMode('IdleMode');
	}
	else
	{
		S_w2rep(" No specific handling is required for Normal modes \n");
	}	

	S_teststep("Create '$tcpar_Fault_Condition' for '$tcpar_Time'.", 'AUTO_NBR');	
	PRT_connect();
	S_wait_ms($tcpar_Time);
	
	S_teststep("Check for Tx Messages.", 'AUTO_NBR', 'check_for_tx');			#measurement 1

	S_teststep("Recover '$tcpar_Fault_Condition'", 'AUTO_NBR', 'recover_fault_condition');			#measurement 2
	PRT_disconnect(); 
	
	S_teststep("Check for all Messages.", 'AUTO_NBR', 'check_for_all');			#measurement 3

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask'.", 'AUTO_NBR', 'send_req_readdtc_A');			#measurement 4

	S_teststep("Reset ECU", 'AUTO_NBR');

	S_teststep("Send '$tcpar_Req_ReadDTC' followed by '$tcpar_StatusMask'.", 'AUTO_NBR', 'send_req_readdtc_B');			#measurement 5

	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_Transmission1' ", 'check_for_tx');			#evaluation 1
	S_teststep_detected("<<add detected result here>>", 'check_for_tx');

	S_teststep_expected("'$tcpar_Fault' should be '$tcpar_FaultState'.", 'recover_fault_condition');			#evaluation 2
	S_teststep_detected("<<add detected result here>>", 'recover_fault_condition');

	S_teststep_expected("'$tcpar_Transmission2' ", 'check_for_all');			#evaluation 3
	S_teststep_detected("<<add detected result here>>", 'check_for_all');

	S_teststep_expected("'$tcpar_PR_ReadDTC1' should be obtained", 'send_req_readdtc_A');			#evaluation 4
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_A');

	S_teststep_expected("'$tcpar_PR_ReadDTC2' should be obtained ", 'send_req_readdtc_B');			#evaluation 5
	S_teststep_detected("<<add detected result here>>", 'send_req_readdtc_B');

	return 1;
}

sub TC_finalization {
	
	S_w2rep("TC FINALIZATION\n"); 	
	 
	if($tcpar_Condition eq 'ReprogrammingMode')
	{
		CA_write_can_signal ('EGI040_1_7_REPROGRAMING' , '0', 'phys');	
	}
	
	if($tcpar_Condition eq 'IdleMode')
	{
		GEN_setECUMode('RemoveIdleMode');
		S_wait_ms (5000);
	}
	PD_ClearFaultMemory();
		
return 1;
}


1;
