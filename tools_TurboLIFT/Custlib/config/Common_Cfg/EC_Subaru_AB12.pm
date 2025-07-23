#### TEST CASE MODULE
package EC_Subaru_AB12;

#### DONT MODIFY THIS SECTION ####
use strict;
###-------------------------------
my $VERSION = q$Revision: 1.1 $;
my $HEADER = q$Header: config/EC_Subaru_AB12.pm 1.1 2018/08/15 11:59:45ICT RNO1HC develop  $;
##################################

#### HERE SELECTION OF AUTOTEST MODULES ####
use LIFT_general;
use LIFT_evaluation;
use LIFT_PD;
use LIFT_POWER;
use LIFT_IDEFIX;
use LIFT_labcar;
use LIFT_equipment;
use LIFT_PRITT;

##################################

## testcase parameters

## other local vars

our $PURPOSE = "LIFT END CAMPAIGN for template project";

=head 

sorry, no description available

=cut

##################################
####  TESTCASE STARTS HERE    ####
##################################

my ($tcpar_diag,$tcpar_quate);

sub TC_set_parameters {

    ###-----------------------------------------------------------------------
    ### Reading Testcase Parameter from Testcase Parameter File
    ###-----------------------------------------------------------------------

    return 1;
}



#### INITIALIZE TC #####
sub TC_initialization {

    S_w2rep(" *** Starting End Campaign ***\n") ;

    S_w2rep( " EC -> cleaning up test bench equipment \n" );

    #PD_CloseDiagnosis();
#    LC_Exit();

#    # close Idefix if not already done by POW_init function
#    if ($LIFT_config::LIFT_Testbench->{'Functions'}{'POWER'}{'device'} ne 'IDX'){
#        IDX_CloseHW();
#    }

    S_w2rep(" EC -> set vercict PASS to finish init campaign\n");
    S_set_verdict( VERDICT_PASS );

    return 1;
}

### STIMULATION AND MEASUREMENT ###
sub TC_stimulation_and_measurement {
	LC_ECU_On();
	return 1;
}

#### EVALUATE TC #####
sub TC_evaluation {
return 1;
}


#### TC FINALIZATION #####
#-- set system in original state --##
sub TC_finalization {
	
#	LC_PowerDisconnect();
#	S_wait_ms('TIMER_ECU_OFF');
	
return 1;
}


1;