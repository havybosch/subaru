#### TEST CASE MODULE
package TC_DSM_Ser10_NRC11;

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

our $PURPOSE = "To check behavior of NRC11 in session control";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Ser10_NRC11

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Send <Req1_WrongSession>

2. Send <Req2_WrongSession>


I<B<Evaluation>>

1. <NRC_11_1> should be obtained.

2. <NRC_11_2> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'Req1_WrongSession' => 
	SCALAR 'Req2_WrongSession' => 
	SCALAR 'purpose' => 
	SCALAR 'NRC_11_1' =>
	SCALAR 'NRC_11_2' =>  


=head2 PARAMETER EXAMPLES

	purpose= 'To check response when Service is not supported'
	
	# input parameters
	
	# output parameters
	NRC_11_1 =  '7F 3D 11'
	NRC_11_2 =  '7F 87 11'
	Req1_WrongSession = '3D 01' 
	Req2_WrongSession = '87 03' 

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_NRC_11_1;
my $tcpar_NRC_11_2;
my $tcpar_Req1_WrongSession;
my $tcpar_Req2_WrongSession;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_NRC_11_1 =  GEN_Read_mandatory_testcase_parameter( 'NRC_11_1' );
	$tcpar_NRC_11_2 =  GEN_Read_mandatory_testcase_parameter( 'NRC_11_2' );
	$tcpar_Req1_WrongSession =  GEN_Read_mandatory_testcase_parameter( 'Req1_WrongSession' );
	$tcpar_Req2_WrongSession =  GEN_Read_mandatory_testcase_parameter( 'Req2_WrongSession' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Send '$tcpar_Req1_WrongSession'", 'AUTO_NBR', 'send_req1_wrongsession');			#measurement 1
	$res1= GDCOM_request($tcpar_Req1_WrongSession,'7F 3D 11','strict');
	S_teststep("Send '$tcpar_Req2_WrongSession'", 'AUTO_NBR', 'send_req2_wrongsession');			#measurement 2
	$res2= GDCOM_request($tcpar_Req2_WrongSession,'7F 87 11','strict');
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NRC_11_1' should be obtained.", 'send_req1_wrongsession');			#evaluation 1
	S_teststep_detected("Response is $res1", 'send_req1_wrongsession');
	EVAL_evaluate_string("Evaluating response",$tcpar_NRC_11_1,$res1);
	
	S_teststep_expected("'$tcpar_NRC_11_2' should be obtained.", 'send_req2_wrongsession');			#evaluation 2
	S_teststep_detected("Response is $res2", 'send_req2_wrongsession');
	EVAL_evaluate_string("Evaluating response",$tcpar_NRC_11_2,$res2);
	return 1;
}

sub TC_finalization {

	return 1;
}


1;
