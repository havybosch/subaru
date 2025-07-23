package LIFT_config;

### Project Specific Config for LIFT_exec_engine

use Sys::Hostname;
use File::Basename;
our ( $left_logo, $right_logo, $LIFT_ProjectDescription, $LIFT_host, $LIFT_exec_path, $LIFT_PRJCFG_path);
our ( $CANoe, @LIFT_TC_paths, $LIFT_TC_DOCS_path, $LIFT_PARA_path, $configuration); 
my $mapping_CAN;
### LIFT host
$LIFT_host = hostname();

### LIFT exec path = path from called LIFT_exec_engine
$LIFT_exec_path = dirname($0);
### Project Configuration PATH = from called Project Configuration
$LIFT_PRJCFG_path = dirname($main::opt_conf);

# relative path related to campaign report
$left_logo  = "./htmldata/images/logo_left.png";
$right_logo = "./htmldata/images/logo_right.png";

# Get the project name
if ( not defined $ENV{'PROJECT'} ) {
	our $EDR_variant_name = "Mainstream";    #default value is custlib
}
else{
	our $EDR_variant_name = $ENV{'PROJECT'};
}

#assign CANoe_cfg is used by project
if(not defined $ENV{'HVCUT'} and not defined $ENV{'THS'})
{
	$CANoe = "CANoeCfg_R03s.cfg";
	$mapping_CAN = "Mapping_CAN_R03s.pm";
}
elsif ($ENV{'HVCUT'} =~ /Support/i or $ENV{'THS'} =~ /Support/i)
{
	$CANoe = "CANoeCfg_R00r.cfg";
	$mapping_CAN = "Mapping_CAN_R00r.pm";
}
else
{
	$CANoe = "CANoeCfg_R03s.cfg";
	$mapping_CAN = "Mapping_CAN_R03s.pm";
}

# related to the mapping EDR and mapping CRIES

if ( not defined $ENV{'SYSTEM'} or $ENV{'SYSTEM'} =~ /2UFS_LHD/ ) {
	$configuration = "3UFS_LHD";                #default value is 3UFS_LHD
}
else {
	$configuration = $ENV{'SYSTEM'};
}
### replace path with SAD file for current ECU SW under test
$SAD_fpath = "$LIFT_PRJCFG_path/../../../results/";
$LIFT_ProjectDescription = $EDR_variant_name . " " . "project";
### SYC interface
# Possible variants in the current SYC, please select only ONE line for your config (I will export all):
our $SYC_export_pm_file = "$LIFT_PRJCFG_path/../Project_Cfg/SystemTesting_SycExport.pm";

### TESTCASES settings, change path if you use different folder.
@LIFT_TC_paths = ( "$LIFT_PRJCFG_path/../../../Custlib/", "$LIFT_PRJCFG_path/../../../Platform/" );
### TESTCASE DOCUMENTATION
$LIFT_TC_DOCS_path = "$LIFT_TC_path/Documentation/html/";
### TESTCASE PARAMETERS
$LIFT_PARA_path = "$LIFT_PRJCFG_path/../../../Custlib/";

our ( $LIFT_LOG_path, $LIFT_RES_path, $LIFT_TC_INIT_path, $LIFT_TC_INIT_CAMPAIGN, $LIFT_TC_END_path, $LIFT_TC_END_CAMPAIGN, $LIFT_ProjectDefaults, $LIFT_Testbench, );

### LOGS and RESULTS PATH
$LIFT_LOG_path = 'C:/Reports/Report_' . $EDR_variant_name;
$LIFT_RES_path = 'C:/Reports/Report_' . $EDR_variant_name;

### INIT CAMPAIGN
$LIFT_TC_INIT_path     = "$LIFT_PRJCFG_path";
$LIFT_TC_INIT_CAMPAIGN = "IC_Subaru_AB12.minimal";    # Init campaign to be executed

### END CAMPAIGN
$LIFT_TC_END_path     = "$LIFT_PRJCFG_path";
$LIFT_TC_END_CAMPAIGN = "EC_Subaru_AB12";             # End campaign to be executed

### PROJECT Defaults
require "$LIFT_PRJCFG_path/Mazda_AB12_ProjectConst.pm";    # contains package LIFT_PROJECT
$LIFT_ProjectDefaults = $LIFT_PROJECT::Defaults;

### Add additional path for funclib_Customer and CANoe for snapshot in IC.pm
our $PATH_funclib = "$LIFT_PRJCFG_path/../../../funclib_Customer";

#require all mapping files
### Project configure file
require "$LIFT_PRJCFG_path/../Project_Cfg/CREIS_ProjectConst.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_ADAS.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_DIAG.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/".$mapping_CAN;
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_DEVICE.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_FAULT.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_QUATE.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_EDR.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_CustomerData.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_SPI_network.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_FAULT_extension.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_EOL.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_PSI5_settings.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/Mapping_OCS.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/CSEM_Config/SMI/AB12_ProjectConst_ManiToo_Para_SMI.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/CSEM_Config/SMI/SMI8/AB12_ProjectConst_ManiToo_Conf_SMI8_6D_C7.pm";
require "$LIFT_PRJCFG_path/../Project_Cfg/CSEM_Config/SMA7/AB12_ProjectConst_ManiToo_SMA760_SMA720.pm";

#require testbench
require "./$LIFT_PRJCFG_path/LIFT_Testbenches.pm";
$LIFT_Testbench = $LIFT_Testbenches::Testbench->{$LIFT_host};

#just to remove the warnings
$LIFT_PROJECT::Defaults      = $LIFT_PROJECT::Defaults;
$LIFT_Testbenches::Testbench = $LIFT_Testbenches::Testbench;
$main::opt_conf              = $main::opt_conf;

1;
