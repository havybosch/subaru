#### TEST CASE MODULE
package TC_COA_Quali_Dequalicheck;

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
use INCLUDES_Project;
use LIFT_can_access;
use LIFT_CANoe;
use LIFT_CD_CAN;
use LIFT_POWER;
use LIFT_PD;
use LIFT_evaluation;
use FuncLib_TNT_COM;
use LIFT_DCOM;    #necessary
use FuncLib_Project_FM;
#include further modules here
use GENERIC_DCOM;
use LIFT_PRITT;
use LIFT_labcar;    #necessary
##################################

our $PURPOSE = "To check status of Fault by DTC status mask";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

TC_COA_Quali_Dequalicheck

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

1.Switch ON the IGN.

2.Create <Fault> on <MSGID>.

3.Wait until the fault is qualified

4.Send <Req_DTCstatus>.

5.Remove <Fault> from <MSGID>

6.Send <Req_DTCstatus>.

7.Reset the ECU.

8.Send <Req_DTCstatus>.

 


I<B<Evaluation>>

1.-

2.-

3.-

4.<ReadDTCResp> should be observed.

5.-

6.-<ReadDTCResp> should be observed.

7.-

8.<ReadDTCResp_dequali> should be observed.


I<B<Finalisation>>

Reset/Remove the test condition created in test case


=head1 PARAMETER DESCRIPTION


=head2 PARAMETER NAMES

	SCALAR 'ReadDTCResp' => 
	SCALAR 'ReadDTCResp_dequali' => 
	SCALAR 'purpose' => 
	SCALAR 'MSGID' => 
	SCALAR 'Req_DTCstatus' => 
	LIST 'Fault' => 


=head2 PARAMETER EXAMPLES

	purpose = 'To check qualification /de-qualification condition for different Rx MsgID's'# description of test case
	
	# input parameters
	
	MSGID='<Test Heading 1>' #RxMsg ID
	
	Req_DTCstatus='19 02 FF'
	Fault=@('rb_coa_<Test Heading 2>_flt')
	
	
	#output parameters
	ReadDTCResp = '59 02 0A C1 00 00 0A'
	ReadDTCResp_dequali = '59 02 0A C1 00 00 08'

=cut



#PARAMETERS
################ Parameters from .par file ###################
my $tcpar_purpose;
my $tcpar_MSGID;
my $tcpar_Req_DTCstatus;
my @tcpar_Fault;
my $tcpar_ReadDTCResp;
my $tcpar_ReadDTCResp_dequali;

################ global parameter declaration ###################
#add any global variables here
my $res1;
my $res2;
my $res3;
my $CAN_Mapping;
###############################################################

sub TC_set_parameters {

	$tcpar_purpose =  GEN_Read_mandatory_testcase_parameter( 'purpose' );
	$tcpar_MSGID =  GEN_Read_mandatory_testcase_parameter( 'MSGID' );
	$tcpar_Req_DTCstatus =  GEN_Read_mandatory_testcase_parameter( 'Req_DTCstatus' );
	@tcpar_Fault =  GEN_Read_mandatory_testcase_parameter( 'Fault' );
	$tcpar_ReadDTCResp =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp' );
	$tcpar_ReadDTCResp_dequali =  GEN_Read_mandatory_testcase_parameter( 'ReadDTCResp_dequali' );

	return 1;
}

sub TC_initialization {
	S_w2rep("Start the CANOe Measurement and CAN trace\n",'Purple');
	CA_trace_start();
	
	S_w2rep("Fetch the DIAG Mapping and CAN Mapping Info\n",'Purple');
	GDCOM_init(); 
	
	S_teststep("1.Standard Preparation.", 'AUTO_NBR');
	#GEN_StandardPrepNoFault();
	PD_ClearFaultMemory();
    S_wait_ms(2000);
    
	S_teststep("2.Send reprogramming bit as below for Msg id", 'AUTO_NBR');

	S_teststep("EGI040,TCU048,VDC139", 'AUTO_NBR');
	
	S_teststep("EGI040_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('EGI040_1_7_REPROGRAMING' , '0', 'phys');
	S_teststep("TCU048_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('TCU048_1_7_REPROGRAMING' , '0', 'phys');	
	S_teststep("VDC139_1_7_REPROGRAMING=0", 'AUTO_NBR');
	CA_write_can_signal ('VDC139_1_7_REPROGRAMING' , '0', 'phys');
	#LC_ECU_Off();
	#S_wait_ms(10000);	
	
	return 1;
}

sub TC_stimulation_and_measurement {

	S_teststep("Switch ON the IGN.", 'AUTO_NBR');
	LC_ECU_On(12);
	S_wait_ms(10000);
	
	S_teststep("Create '@tcpar_Fault' on '$tcpar_MSGID'.", 'AUTO_NBR');
	$CAN_Mapping = S_get_contents_of_hash( ['Mapping_CAN'] );
	if (grep $_ =~ /Timeout/,@tcpar_Fault){		
		COM_stopMessages($tcpar_MSGID);
	}elsif(grep $_ =~ /DLC/,@tcpar_Fault){
		my $DLCVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_DLC'};
		CA_set_EnvVar_value($DLCVarName,0);	
	}elsif(grep $_ =~ /Counter/,@tcpar_Fault){
		my $cntVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName ,1);
	}elsif(grep $_ =~ /Checksum/,@tcpar_Fault){
		my $csVarName = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_CS'};
		CA_set_EnvVar_value($csVarName ,1);
	}	
	
	S_teststep("Wait until the fault is qualified", 'AUTO_NBR');
	S_wait_ms(800);
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_DTCstatus'.", 'AUTO_NBR', 'send_req_dtcstatus_A');			#measurement 1
	$res1 = GDCOM_request( $tcpar_Req_DTCstatus, $tcpar_ReadDTCResp, 'strict' );
	S_wait_ms(5000);
		
	S_teststep("Remove ' @tcpar_Fault' from '$tcpar_MSGID'", 'AUTO_NBR');
	if (grep $_ =~ /Timeout/,@tcpar_Fault){		
		COM_startMessages($tcpar_MSGID);
	}elsif(grep $_ =~ /DLC/,@tcpar_Fault){
		my $DLCVarName2 = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_DLC'};
		CA_set_EnvVar_value($DLCVarName2,8);	
	}elsif(grep $_ =~ /Counter/,@tcpar_Fault){
		my $cntVarName2 = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_CNT'};
		CA_set_EnvVar_value($cntVarName2 ,0);
	}elsif(grep $_ =~ /Checksum/,@tcpar_Fault){
		my $csVarName2 = $CAN_Mapping->{'CAN_MESSAGES'}{$tcpar_MSGID}{'CANOE_CS'};
		CA_set_EnvVar_value($csVarName2 ,0);
	}	
	S_wait_ms(10000);
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_DTCstatus'.", 'AUTO_NBR', 'send_req_dtcstatus_B');			#measurement 2
	$res2 = GDCOM_request( $tcpar_Req_DTCstatus,$tcpar_ReadDTCResp, 'strict' );
	S_wait_ms(5000);
	
	S_teststep("Reset the ECU.", 'AUTO_NBR');
	LC_ECU_Reset();
	PD_ReadFaultMemory();
	
	S_teststep("Send '$tcpar_Req_DTCstatus'.", 'AUTO_NBR', 'send_req_dtcstatus_C');			#measurement 3
	$res3 = GDCOM_request( $tcpar_Req_DTCstatus, $tcpar_ReadDTCResp_dequali, 'strict' );
	return 1;
	
}

sub TC_evaluation {

	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed.", 'send_req_dtcstatus_A');			#evaluation 1
	S_teststep_detected("DTC response is obtained $res1 ", 'send_req_dtcstatus_A');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res1 );
	
	S_teststep_expected("'$tcpar_ReadDTCResp' should be observed.", 'send_req_dtcstatus_B');			#evaluation 2
	S_teststep_detected("DTC response is obtained $res2", 'send_req_dtcstatus_B');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp, $res2 );
	
	S_teststep_expected("'$tcpar_ReadDTCResp_dequali' should be observed.", 'send_req_dtcstatus_C');			#evaluation 3
	S_teststep_detected("DTC response is obtained $res3", 'send_req_dtcstatus_C');
	EVAL_evaluate_string( "DTC response Check", $tcpar_ReadDTCResp_dequali, $res3 );
	return 1;
}

sub TC_finalization {
	S_w2rep("Sending AllClear Request\n",'Purple');
	GDCOM_request_general('REQ_ClearDTCInformation_all', 'PR_ClearDTCInformation_all','strict');
    S_wait_ms(5000);
	return 1;
}


1;
