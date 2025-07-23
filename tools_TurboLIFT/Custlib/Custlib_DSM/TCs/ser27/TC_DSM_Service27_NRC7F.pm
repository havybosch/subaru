#### TEST CASE MODULE
package TC_DSM_Service27_NRC7F;

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
use LIFT_evaluation;
use LIFT_PD;
use LIFT_CD;
use LIFT_CD_CAN;
use LIFT_labcar;
use LIFT_CANoe;
use GENERIC_DCOM;
use LIFT_can_access;
use FuncLib_TNT_DEVICE;
use FuncLib_TNT_FM;
use FuncLib_TNT_COM;
use LIFT_DCOM;
##################################

our $PURPOSE = "to check NRC7F for service27";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service27_NRC7F

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Set <AddressingMode> in <Protocol>

2. Enter <Default_Session>

3. Send <Req_Seed> as <level>

4. IGN Reset

5. Enter <Disposal_Session>

6. Send <Req_Seed> as <level>

7. IGN Reset

8. Enter <Programming_Session>

9. Send <Req_Seed>  as <level>


I<B<Evaluation>>

1.  

2. Default session response is <Res_default> should be obtained.

3. <NRC_7F> should be obtained.

4.

5. Disposal session response is <Res_disposal> should be obtained.

6. <NRC_7F> should be obtained.

7.

8.Disposal session response is <Res_programming> should be obtained.

9. <NRC_7F> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req_Seed' => 
	SCALAR 'purpose' => 
	SCALAR 'AddressingMode' => 
	SCALAR 'Protocol' => 
	SCALAR 'Default_Session' => 
	SCALAR 'Res_default' => 
	SCALAR 'Disposal_Session' => 
	SCALAR 'Res_disposal' => 
	SCALAR 'Programming_Session' => 
	SCALAR 'Res_programming' => 
	SCALAR 'level' => 
	SCALAR 'NRC_7F' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To verify the condition for NRC 7F'
	
	AddressingMode = 'Physical'
	Protocol =  'UDS'
	Default_Session = '10 01'
	Res_default = '50 01 00 32 01 F4'
	Disposal_Session = '10 04'
	Res_disposal = '50 04 00 32 01 F4'
	Programming_Session='10 02'
	Res_programming = '50 02 00 32 01 F4'
	level = '<Test Heading 2>'
	NRC_7F  = '7F 27 7F'
	Req_Seed = '27 01'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_AddressingMode;
my $tcpar_Protocol;
my $tcpar_Default_Session;
my $tcpar_Res_default;
my $tcpar_Disposal_Session;
my $tcpar_Res_disposal;
my $tcpar_Programming_Session;
my $tcpar_Res_programming;
my $tcpar_level;
my $tcpar_NRC_7F;
my $tcpar_Req_Seed;

################ global parameter declaration ###################
#add any global variables here
my $res_default;
my $res_programming;
my $res_proposal;
my $resseed1;
my $resseed2;
my $resseed3;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_AddressingMode =  GEN_Read_mandatory_testcase_parameter( 'AddressingMode' );
	$tcpar_Protocol =  GEN_Read_mandatory_testcase_parameter( 'Protocol' );
	$tcpar_Default_Session =  GEN_Read_mandatory_testcase_parameter( 'Default_Session' );
	$tcpar_Res_default =  GEN_Read_mandatory_testcase_parameter( 'Res_default' );
	$tcpar_Disposal_Session =  GEN_Read_mandatory_testcase_parameter( 'Disposal_Session' );
	$tcpar_Res_disposal =  GEN_Read_mandatory_testcase_parameter( 'Res_disposal' );
	$tcpar_Programming_Session =  GEN_Read_mandatory_testcase_parameter( 'Programming_Session' );
	$tcpar_Res_programming =  GEN_Read_mandatory_testcase_parameter( 'Res_programming' );
	$tcpar_level =  GEN_Read_mandatory_testcase_parameter( 'level' );
	$tcpar_NRC_7F =  GEN_Read_mandatory_testcase_parameter( 'NRC_7F' );
	$tcpar_Req_Seed =  GEN_Read_mandatory_testcase_parameter( 'Req_Seed' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Set '$tcpar_AddressingMode' in '$tcpar_Protocol'", 'AUTO_NBR');
	GDCOM_set_addressing_mode($tcpar_AddressingMode);
	
	S_teststep("Enter '$tcpar_Default_Session'", 'AUTO_NBR', 'enter_default_session');			#measurement 1
	$res_default = GDCOM_request($tcpar_Default_Session,$tcpar_Res_default,'strict');
	
	S_teststep("Send '$tcpar_Req_Seed' as '$tcpar_level'", 'AUTO_NBR', 'send_req_seed_A');			#measurement 2
	$resseed1 = GDCOM_request($tcpar_Req_Seed,$tcpar_NRC_7F,'strict');
	
	S_teststep("IGN Reset", 'AUTO_NBR');
	LC_ECU_Reset();
	
	S_teststep("Enter '$tcpar_Disposal_Session'", 'AUTO_NBR', 'enter_disposal_session');			#measurement 3
	$res_proposal = GDCOM_request($tcpar_Disposal_Session,$tcpar_Res_disposal,'strict');
	
	S_teststep("Send '$tcpar_Req_Seed' as '$tcpar_level'", 'AUTO_NBR', 'send_req_seed_B');			#measurement 4
	$resseed2 = GDCOM_request($tcpar_Req_Seed,$tcpar_NRC_7F,'strict');
	
	S_teststep("IGN Reset", 'AUTO_NBR');
	LC_ECU_Reset();
	
	S_teststep("Enter '$tcpar_Programming_Session'", 'AUTO_NBR', 'enter_programming_session');			#measurement 5
	$res_programming = GDCOM_request($tcpar_Programming_Session,$tcpar_Res_programming,'strict');
	
	S_teststep("Send '$tcpar_Req_Seed'  as '$tcpar_level'", 'AUTO_NBR', 'send_req_seed_C');			#measurement 6
	$resseed3 = GDCOM_request($tcpar_Req_Seed,$tcpar_NRC_7F,'strict');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("Default session response is '$tcpar_Res_default' should be obtained.", 'enter_default_session');			#evaluation 1
	S_teststep_detected(" Default session response is $res_default", 'enter_default_session');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_default,$res_default);

	S_teststep_expected("'$tcpar_NRC_7F' should be obtained.", 'send_req_seed_A');			#evaluation 2
	S_teststep_detected("NRC should be observed is $resseed1", 'send_req_seed_A');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_7F,$resseed1);
	
	S_teststep_expected("Disposal session response is '$tcpar_Res_disposal' should be obtained.", 'enter_disposal_session');			#evaluation 3
	S_teststep_detected("Disposal session response is $res_proposal", 'enter_disposal_session');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_disposal,$res_proposal);
	
	S_teststep_expected("'$tcpar_NRC_7F' should be obtained.", 'send_req_seed_B');			#evaluation 4
	S_teststep_detected("NRC should be observed is $resseed2", 'send_req_seed_B');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_7F,$resseed2);
	
	S_teststep_expected("Disposal session response is '$tcpar_Res_programming' should be obtained.", 'enter_programming_session');			#evaluation 5
	S_teststep_detected("Disposal session response is $res_programming", 'enter_programming_session');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_Res_programming,$res_programming);
	
	S_teststep_expected("'$tcpar_NRC_7F' should be obtained.", 'send_req_seed_C');			#evaluation 6
	S_teststep_detected("NRC should be observed is $resseed3", 'send_req_seed_C');
	EVAL_evaluate_string("Evaluating DTC response",$tcpar_NRC_7F,$resseed3);
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
