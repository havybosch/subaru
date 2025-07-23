# *****************************************************************************************************
#
#  Copyright (c)       Robert Bosch GmBH
#                      Germany
#                      All rights reserved
#
#******************************************************************************************************

############################################################
### Project Specific Main Config File for LIFT_exec_engine
############################################################
package LIFT_config;

### used perl packages
use Sys::Hostname;
use File::Basename;

############################################################
### Basic settings
############################################################
### Project Configuration PATH = from called Project Configuration
our $LIFT_PRJCFG_path = dirname(__FILE__) . "/../config/Common_Cfg";


############################################################
### Project settings
############################################################
### Project description for html report
our $LIFT_ProjectDescription = "Testarea development project RT4";

### !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
### replace path with SAD file for current ECU SW under test
our $SAD_fpath = "$LIFT_PRJCFG_path/../../../results/";

#additional setting for SAD file
#our $SAD_fpath = "$LIFT_PRJCFG_path/SW/"; # variable $SAD_file will be replaced with sad file present in the folder SW
# If both $SAD_file and $SAD_fpath is configured then sad file configured in $SAD_file will be considered.
# If both $SAD_file and $SAD_fpath is configured but sad file does not exist then $SAD_fpath is considered.

### !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

### INIT CAMPAIGN
our $LIFT_TC_INIT_path     = "$LIFT_PRJCFG_path/../../FLASH_config";
our $LIFT_TC_INIT_CAMPAIGN = "IC_example";          # Init campaign to be executed

# logos: relative path related to campaign report
our $left_logo  = "./htmldata/images/logo_left.png";
our $right_logo = "./htmldata/images/logo_right.png";

############################################################
### Project defaults and mappings
############################################################

### PROJECT Defaults
require "$LIFT_PRJCFG_path/Mazda_AB12_ProjectConst.pm";
our $LIFT_ProjectDefaults = $LIFT_PROJECT::Defaults;

# require "$LIFT_PRJCFG_path/Mappings/AB12_RefType5_ProjectConst_TSG4.pm";
# require "$LIFT_PRJCFG_path/Mappings/AB12_RefType5_ProjectConst_QuaTe.pm";
# usually no changes are required below this line

############################################################
### Testbench
############################################################

### LIFT host
our $LIFT_host = hostname();

### Testbench configuration
our $LIFT_Testbench;

if ( -f "$LIFT_PRJCFG_path/LIFT_Testbenches.pm" ) {
    require "$LIFT_PRJCFG_path/LIFT_Testbenches.pm";
    $LIFT_Testbench = $LIFT_Testbenches::Testbench->{$LIFT_host};    # to use if run on several testbenches
                                                                     #$LIFT_Testbench = $LIFT_Testbenches::Testbench->{'localhost'}; # to use if runs on single testbench
}

############################################################
### Path settings
############################################################

### LIFT exec path = path from called LIFT_exec_engine
our $LIFT_exec_path = dirname($0);

### TESTCASES settings, change path if you use different folder.
our @LIFT_TC_paths = ( "$LIFT_PRJCFG_path/../../../Custlib/", "$LIFT_PRJCFG_path/../../../Platform/" );
### TESTCASE DOCUMENTATION
our $LIFT_TC_DOCS_path = "$LIFT_TC_path/Documentation/html/";
### TESTCASE PARAMETERS
our $LIFT_PARA_path = "$LIFT_PRJCFG_path/../../../Custlib/";

### LOGS and RESULTS PATH
our $LIFT_LOG_path = "$LIFT_PRJCFG_path/../../reports/";

#just to remove the warnings
$LIFT_PROJECT::Defaults      if 0;
$LIFT_Testbenches::Testbench if 0;
$LIFT_TC_path                if 0;

1;
