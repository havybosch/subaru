#### TEST CASE MODULE
package TC_DSM_Service14_NRCPriorityCheck;

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
##############
##################################

our $PURPOSE = "To check NRC Priority when two different wrong Requests are provided";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_DSM_Service14_NRCPriorityCheck

=head1 PURPOSE

<explain what this test is good for>

=head1 TESTCASE DESCRIPTION


I<B<Initialisation>>

StandardPrepNoFault


I<B<Stimulation and Measurement>>

1. Enter to <Session>

2. Send <Req1_ClearDTC>

3. Create <Fault>

4. Send <Req2_ClearDTC>


I<B<Evaluation>>

1.

2. 

3. <NRC_13> should be obtained.

4. <NRC_11> should be obtained.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'purpose' => 
	SCALAR 'Session' => 
	SCALAR 'Req1_ClearDTC' => 
	SCALAR 'Req2_ClearDTC' => 
	SCALAR 'Fault' => 
	SCALAR 'NRC_13' => 
	SCALAR 'NRC_11' => 


=head2 PARAMETER EXAMPLES

	purpose= 'To check NRC Priority when two different wrong Requests are provided'
	
	# input parameters
	Session = '<Test Heading>'
	Req1_ClearDTC = '02 14 FF FF FF' #length= 02
	Req2_ClearDTC = '04 13 FF FF FF' #length =04
	Fault =  'rb_psem_Short2BatUFSL_flt'
	
	# output parameters
	NRC_13='NR_incorrectMessageLengthOrInvalidFormat'
	NRC_11 = '0x7F 0x13 0x11'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_Session;
my $tcpar_Req1_ClearDTC;
my $tcpar_Req2_ClearDTC;
my $tcpar_Fault;
my $tcpar_NRC_13;
my $tcpar_NRC_11;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;

###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_Session =  GEN_Read_mandatory_testcase_parameter( 'Session' );
	$tcpar_Req1_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req1_ClearDTC' );
	$tcpar_Req2_ClearDTC =  GEN_Read_mandatory_testcase_parameter( 'Req2_ClearDTC' );
	$tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_NRC_13 =  GEN_Read_mandatory_testcase_parameter( 'NRC_13' );
	$tcpar_NRC_11 =  GEN_Read_mandatory_testcase_parameter( 'NRC_11' );

	return 1;
}

sub TC_initialization {

	S_teststep("StandardPrepNoFault", 'AUTO_NBR');
	GEN_StandardPrepNoFault();

	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Enter to '$tcpar_Session'", 'AUTO_NBR');
	GDCOM_request_general('REQ_DiagnosticSessionControl_DefaultSession', 'PR_DiagnosticSessionControl_DefaultSession');
	S_teststep("Send '$tcpar_Req1_ClearDTC'", 'AUTO_NBR');
	$res1=_reqDTC($tcpar_Req1_ClearDTC);
	S_teststep("Create '$tcpar_Fault'", 'AUTO_NBR', 'create_fault');			#measurement 1

	S_teststep("Send '$tcpar_Req2_ClearDTC'", 'AUTO_NBR', 'send_req2_cleardtc');			#measurement 2
	$res2=_reqDTC($tcpar_Req2_ClearDTC);
	return 1;
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_NRC_13' should be obtained.", 'create_fault');			#evaluation 1
	S_teststep_detected("Response is obsered $res1", 'create_fault');

	S_teststep_expected("'$tcpar_NRC_11' should be obtained.", 'send_req2_cleardtc');			#evaluation 2
	S_teststep_detected("Response is obsered $res2", 'send_req2_cleardtc');

	return 1;
}

sub TC_finalization {

	return 1;
}

sub _reqDTC{
	my $sub_request =shift;
	my $options_href;
	my $sub_response;
	my @sub_length =split(/ /,$sub_request,2);
	$options_href->{'Manipulated_length'} = $sub_length[0];
	my @sub_data= split(/ /,$sub_length[1]);
	for(my $i =0; $i<@sub_data; $i++)
	{
		$sub_data[$i] = '0x'.$sub_data[$i];
	}
	my ($sub_status, $Sub_arrayRespone, @Sub_arrResponse);
	($sub_status, $Sub_arrayRespone)=CD_send_request_wait_response(\@sub_data, $options_href);	
	for (my $i = 0; $i< @$Sub_arrayRespone; $i++){
		@Sub_arrResponse[$i] = @$Sub_arrayRespone[$i];
	}
	$sub_response = '';
	for(my $i=0;$i<@Sub_arrResponse;$i++)
	{
		$Sub_arrResponse[$i] = S_dec2hex($Sub_arrResponse[$i]);			
		$sub_response = $sub_response .$Sub_arrResponse[$i] ;
		if ( $i < ( @Sub_arrResponse - 1 ))
		{
			$sub_response = $sub_response . ' ';
		}
	}
	return $sub_response;
	
}
1;
