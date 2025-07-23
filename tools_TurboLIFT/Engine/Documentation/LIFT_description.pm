# :::::::::::::::::::::::::::::::::::::::::::::::: #
# :::::::::::::::::::::::::::::::::::::::::::::::: #
# :::                                          ::: #
# ::: this file is only used for documentation ::: #
# :::                                          ::: #
# :::::::::::::::::::::::::::::::::::::::::::::::: #
# :::::::::::::::::::::::::::::::::::::::::::::::: #

=head1 NAME

TurboLIFT_description

=for html
<span style="font-size:1.5em">TurboLIFT</span>
<br>
<a href="https://connect.bosch.com/wikis/home?lang=de-de#!/wiki/Wad0c302c3442_4748_8eef_7d10157fb564/page/TurboLIFT" target="blank">
<IMG SRC='../pics/LifT_logo.png' width="40%" alt="LifT Homepage" border="0"></a> 

=head1 REQUIREMENTS

=for html
<UL>
<LI>Usually TurboLIFT will be run on one single test bench PC.</LI>
<LI>A simulator that provides the environment for the ECU, like TSG4 or MLC.</LI>
<LI>CAN hardware for diagnosis.</LI>
<LI>CANoe for more CAN manipulation.</LI>
<LI>GPIB interface for programmable power supply control and for digital storage oscilloscope control.</LI>
<LI>A typical lab configuration is: TurboLIFT, TSG4, PD, CANoe, GPIB and on the same PC. </LI>
</UL>

=head1 SYSTEM DESIGN

The system design is devided into three parts: 

=for html
<OL>
<LI>Engine</LI>
<LI>Testcases</LI>
<LI>Project configuration</LI>
</OL>

=head1 Engine

Execution Engine with all function modules for accessing testbench hardware. The Engine is maintained by Tools team.

The Engine also consists of TNT (Team New Testlibrary) function libraries which concentrates on more Airbags Domain-oriented test functions.

=head1 Testcases

All generic testcases, maintained by a test library team to ensure highest reusability

=head1 Verdicts

The B<verdict is the "result"> of a test case. In TurboLIFT it can have the following values (perl constants): 

=for html
<ul dir="ltr">   
<li><strong><span style="color: rgb(0, 0, 255);">VERDICT_NONE</span></strong>     
  <ul><li>If a test has this verdict then the test case was not executed or the test case doesn’t contain any evaluation<br /> &nbsp; </li></ul>
</li>   
<li><strong><span style="color: rgb(0, 128, 0);">VERDICT_PASS</span></strong>     
    <ul><li>all measured quantities for evaluation were as expected<br /> &nbsp; </li></ul>
</li>   
<li><strong><span style="color: rgb(128, 0, 128);">VERDICT_INCONC</span></strong> (inconclusive)     
    <ul><li>one ore more quantities for evaluation could not be measured</li>       
    <li>mostly this happens if there was an error in the tool<br /> &nbsp; </li></ul>
</li>
<li><strong><span style="color: rgb(255, 0, 0);">VERDICT_FAIL</span></strong>     
    <ul><li>one ore more measured quantities for evaluation were not as expected<br /> &nbsp; </li></ul>
</li>
<li><strong><span style="color: rgb(0, 0, 255);">VERDICT_BLOCKED</span></strong>     
    <ul><li>the test case cannot run because the preconditions for its execution are not fulfilled<br /></li>
    <li>this is a special value if test code is executed outside of TurboLIFT<br /> &nbsp; </li></ul>
</li> 
</ul>

The above verdict values are sorted by quality.

When setting the verdict repeatedly in a test case then the verdict can never get better, only worse. 
Especially when you set the verdict in a test case once to VERDICT_FAIL then it will remain fail no matter what happens afterwards in the test case,
except if the verdict is set to VERDICT_BLOCKED.

In your test case you can set the verdict directly with the function S_set_verdict (e.g. S_set_verdict( VERDICT_PASS );).
Some other useful functions (e.g. EVAL_evaluate_value) set the verdict indirectly depending on their inputs. 
The execution engine sets the verdict to VERDICT_INCONC if any of the useful functions that were called in the test case raises an error. 

=head1 Project configuration

A configuration setup for a dedicated customer project contains the following files:

=for html
<UL>
<LI>MAIN PROJECT CONFIGURATION</LI>
<LI>TESTBENCH CONFIGURATION</LI>
<LI>PROJECT CONSTANTS</LI>
</UL>

=head2 MAIN PROJECT CONFIGURATION

The MAIN PROJECT CONFIGURATION file (<project_name>_CFG.pm) defines all necessary paths, e.g. for SAD file,
init campaign, logo, test cases, test parameter, etc.

It also loads subsequent configuration files, like TESTBENCH CONFIGURATION, PROJECT CONSTANTS and all required mapping files.

An example MAIN PROJECT CONFIGURATION (default_CFG.pm) can be found in the TurboLIFT Template project.

=head2 TESTBENCH CONFIGURATION

All testbench dependent data like serial numbers, connected devices, etc.
The testbench is identified by the PC name where TurboLIFT was started. 

An example TESTBENCH CONFIGURATION (LIFT_testbenches.pm) with all possible Devices and Functions can be found in the TurboLIFT Template project.

e.g. 
 
  'SI60169' => {      # TurboLIFT PC host name
    ### ----------- Device Configuration Section -----------
    'Devices' => {
        'PD' => {
            'CANchannel' => 1,
            'CANHWSerialNo' => 30679,         # written on CAN device e.g. "007129-030679" -> 30679
        },
        'TSG4' => {
            'Test_Bench_Number' => 42,          # only for logging purpose
            'Description' => "Test bench xyz",  # only for logging purpose 
            'CANchannel' => 2,
            'CANHWSerialNo' => 30679,       # written on CAN device e.g. "007129-030679" -> 30679
            'POWER' => {
                ### if LIFT_labcar is used then this section will be ignored
                'Ubat' => 'internal',
                'UF' => 'internal',
            },
        },
        # more Devices can be configured here
    }, ## end of ~~~ Device Configuration Section ~~~
    ### ----------- Function Configuration Section -----------
    'Functions' => {
        'Labcar' => {       # see documentaton of LIFT_labcar for possible devices
            'line'     =>              'TSG4',       # possible devices: TSG4, MLC, PeriBox
            'extended' =>              'TSG4',       # device only TSG4
            'disposal' =>              'TSG4',       # possible devices: TSG4, MLC (with ACL box), 
                                                     # PeriBox (with ACL box)
            'power_Ubat' =>            'TSG4',       # possible devices: TSG4, MLC, TOE1, TOELLNER, NIDAQ, IDX,
                                                     # IXS, GOS1, PRITT, Manitoo, NONE
            #'power_UF' =>              'TOELLNER',  # possible devices: TSG4, MLC, TOE1, TOELLNER, NIDAQ, IDX,
                                                     # IXS, GOS1, PRITT, NONE
            #'measure_connector' =>     'TSG4',      # possible devices: TSG4, wired
            #'measure_trace_digital' => 'LCT',       # possible devices: TRC, LCT
            #'measure_trace_analog' =>  'TRC',       # device only TRC
            #'measure_once' =>          'DMM1',      # possible devices: DMM1, later possibly more    
        },
        'PD' => 'PD',          # only device PD is currently possible
        # more Functions can be configured here
    }, ## end of ~~~ Function Configuration Section ~~~
  },


=head2 PROJECT CONSTANTS

In the PROJECT CONSTANTS file (<project_name>_ProjectConst.pm) project specific constants are defined, 
which will be used by generic test cases.

 e.g.
 
 'VEHICLE'           => {
                        'U_BATT_DEFAULT'                   => 13.8, 
                        'U_BATT_UNDERVOLTAGE'              => 7.5,
                        'U_BATT_OVERVOLTAGE'               => 17.5,
                       },
 'TIMER'             => {
                        'TIMER_ECU_READY'                => 10000,
                        'TIMER_ECU_OFF'                  => 5000,
                       },
 'TEMP_OPTIONAL_FAULTS' => [ 'FltPasLineSissi4Short2Gnd','FltCANDriverTrainFlt' ],

An example  PROJECT CONSTANTS file (default_ProjectConst.pm) can be found in the TurboLIFT Template project.

Note :
ECU-Hardware Information shall be added to Project Defaults section ( fields to be filled by the user ),    

     'ECU_HW_INFO'  => {
        'fingerprint_A'  => { 
            'TT_No'=> '1236',
            'HW_version'=>'2.36',
            'HW_serial_no'=>'65328',
        },
        'fingerprint_B'  => { 
            'TT_No'=> '1238',
            'HW_version'=>'2.311',
            'HW_serial_no'=>'56490',
        },
    }, 

The HW information corresponding to the ECU currently being used will be added to report header.    

=head2 Configuration possibilities per TurboLIFT module

In the following table links are given to all configuration possibilities for the various TurboLIFT modules:

=begin html

<table border=1>
<tr><td><b>TurboLIFT module</b></td><td><b>Layer</b></td><td><b>Configuration Documentation</b></td></tr>
<tr><td>LIFT_labcar</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_labcar.html#DESCRIPTION">LIFT_labcar DESCRIPTION</a></td></tr>
<tr><td>LIFT_ProdDiag</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_ProdDiag.html#CONFIGURATION">LIFT_ProdDiag CONFIGURATION</a></td></tr>
<tr><td>LIFT_CD</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_CD.html#CONFIGURATION">LIFT_CD CONFIGURATION</a></td></tr>
<tr><td>LIFT_spi_access</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_spi_access.html#DESCRIPTION">LIFT_spi_access DESCRIPTION</a></td></tr>
<tr><td>LIFT_PSI5_access</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_PSI5_access.html#DESCRIPTION">LIFT_PSI5_access DESCRIPTION</a></td></tr>
<tr><td>LIFT_can_access</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_can_access.html#DESCRIPTION">LIFT_can_access DESCRIPTION</a></td></tr>
<tr><td>LIFT_flexray_access</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_flexray_access.html#DESCRIPTION">LIFT_flexray_access DESCRIPTION</a></td></tr>
<tr><td>LIFT_LIN_Access</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_LIN_Access.html#DESCRIPTION">LIFT_LIN_Access DESCRIPTION</a></td></tr>
<tr><td>LIFT_TEMPERATURE</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_TEMPERATURE.html#DESCRIPTION">LIFT_TEMPERATURE DESCRIPTION</a></td></tr>
<tr><td>LIFT_motion</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_motion.html#DESCRIPTION">LIFT_motion DESCRIPTION</a></td></tr>
<tr><td>LIFT_crash_simulation</td><td>functional</td><td><a href="modules/Functional_layer/LIFT_crash_simulation.html#DESCRIPTION">LIFT_crash_simulation DESCRIPTION</a></td></tr>
<tr><td>GENERIC_DCOM</td><td>convenience</td><td><a href="modules/Convenience_layer/GENERIC_DCOM.html#Diag-mapping">GENERIC_DCOM Diag-mapping</a></td></tr>
<tr><td>LIFT_equipment</td><td>convenience</td><td><a href="modules/Convenience_layer/LIFT_equipment.html#DESCRIPTION">LIFT_equipment DESCRIPTION</a></td></tr>
<tr><td>LIFT_general</td><td>common</td><td><a href="modules/Common_library/LIFT_general.html#CONFIGURATION">LIFT_general DESCRIPTION</a></td></tr>
<tr><td>LIFT_TSG4</td><td>device</td><td><a href="modules/Device_layer/TSG4/LIFT_TSG4.html#CONFIGURATION">LIFT_TSG4 CONFIGURATION</a></td></tr>
<tr><td>LIFT_MLC</td><td>device</td><td><a href="modules/Device_layer/MLC/LIFT_MLC.html#SYNOPSIS">LIFT_MLC SYNOPSIS</a></td></tr>
<tr><td>LIFT_TOELLNER</td><td>device</td><td><a href="modules/Device_layer/LIFT_TOELLNER.html#CONFIGURATION">LIFT_TOELLNER CONFIGURATION</a></td></tr>
<tr><td>LIFT_NIDAQ</td><td>device</td><td><a href="modules/Device_layer/NIDAQ/LIFT_NIDAQ.html#Testbench-Configuration">LIFT_NIDAQ Testbench-Configuration</a></td></tr>
<tr><td>LIFT_TRC</td><td>device</td><td><a href="modules/Device_layer/TRC/LIFT_TRC.html#SYNOPSIS">LIFT_TRC SYNOPSIS</a></td></tr>
<tr><td>LIFT_LCT</td><td>device</td><td><a href="modules/Device_layer/TSG4/LIFT_LCT.html#SYNOPSIS">LIFT_LCT SYNOPSIS</a></td></tr>
<tr><td>LIFT_DMM1</td><td>device</td><td><a href="modules/Device_layer/DMM1/LIFT_DMM1.html#DESCRIPTION">LIFT_DMM1 DESCRIPTION</a></td></tr>
<tr><td>LIFT_VOETSCH</td><td>device</td><td><a href="modules/Device_layer/VOETSCH/LIFT_VOETSCH.html#DESCRIPTION">LIFT_VOETSCH DESCRIPTION</a></td></tr>
<tr><td>DTM5080</td><td>device</td><td><a href="modules/Device_layer/DTM5080.html#DESCRIPTION">DTM5080 DESCRIPTION</a></td></tr>
<tr><td>LIFT_ACUROT</td><td>device</td><td><a href="modules/Device_layer/ACUROT/LIFT_ACUROT.html#DESCRIPTION">LIFT_ACUROT DESCRIPTION</a></td></tr>
<tr><td>LIFT_RAT</td><td>device</td><td><a href="modules/Device_layer/RAT/LIFT_RAT.html#DESCRIPTION">LIFT_RAT DESCRIPTION</a></td></tr>
<tr><td>LIFT_MDSRESULT</td><td>device</td><td><a href="modules/Device_layer/MDSRESULT/LIFT_MDSRESULT.html#DESCRIPTION">LIFT_MDSRESULT DESCRIPTION</a></td></tr>
<tr><td>LIFT_QuaTe</td><td>device</td><td><a href="modules/Device_layer/QuaTe/LIFT_QuaTe.html#ProjectDefaults">LIFT_QuaTe ProjectDefaults</a></td></tr>
<tr><td>LIFT_CANoeCtrl</td><td>device</td><td><a href="modules/Device_layer/CANoeCtrl/LIFT_CANoeCtrl.html#DESCRIPTION">LIFT_CANoeCtrl DESCRIPTION</a></td></tr>
</table>

=end html


=head1 Run TurboLIFT

=head2 SETUP TEST BENCH FOR TurboLIFT

=for html
<UL>
<LI>Install TurboLIFT and all necessary hardware drivers (for e.g. GPIB, transient recorder) on the test bench PCs</LI>
<LI>Make sure that the cable connections are correct</LI>
<LI>Set country settings on all testbench PCs to English</LI>
<LI>The same user has to be logged on at every PC used by TurboLIFT for one Testbench</LI>
</UL>

B<Have fun!>

=head2 EXECUTE TurboLIFT WITH A BATCH FILE

 cd /d %~dp0
 call .\Engine\LIFT_exec_engine.pl -testlist .\Testlists\TL_example.txt -conf .\config\CFG_EL.pm -IC IC_ExtendedLine.TSG4
 pause

or

 cd /d %~dp0
 call .\Engine\LIFT_exec_engine.pl -server_mode -conf .\config\CFG_EL.pm -IC IC_ExtendedLine.TSG4
 pause

=for html
<B>Command line arguments for LIFT_exec_engine.pl:</B><br>
<ul>
    <li><B>-testlist &lt;path to test list file&gt;</B> : (one of <B>-testlist</B> or <B>-server_mode</B> has to be given) Defines which test list (*.txt) is going to be executed.</li>
    <li><B>-server_mode</B> : (one of <B>-testlist</B> or <B>-server_mode</B> has to be given) This option will put TurboLIFT into server mode after execution of the init campaign. In server mode TurboLIFT will listen for REST API requests, see <a href="modules/REST_API_description.html">REST API description</a></li>
    <li><B>-conf &lt;path to main config file&gt;</B> : (mandatory) Defines which main config file (*.pm, usually *_CFG.pm) is going to be used.</li>
    <li><B>-exec_options_file &lt;file with exec_options&gt;</B> : (optional) See Docu of LIFT_general::S_get_exec_option</li>
    <li><B>-use_exec_options &lt;name of exec_options to be used&gt;</B> : (optional) See Docu of LIFT_general::S_get_exec_option</li>
    <li><B>-IC &lt;name of init campaign package&gt;</B> : (optional) Defines which init campaign is going to be used and has priority over what is defined in the main config file. The path for the init campaign is defined in the main config file.</li>
    <li><B>-EC &lt;name of end campaign package&gt;</B> : (optional) Defines which end campaign is going to be used and has priority over what is defined in the main config file. The path for the end campaign is defined in the main config file.</li>
    <li><B>-tc_para &lt;path to test case parameter folder&gt;</B> : (optional) Defines where the test case parameter files (*.par) will be searched.</li>
    <li><B>-minimalsnapshot</B> : (optional) When given the snapshot will not contain the zipped config folder. This will save disk space and is useful for test case development.</li>
    <li><B>-polite</B> : (optional) When given the html report will not automatically be opened.</li>
    <li><B>-offline</B> : (optional) Runs the tests in offline mode. Offline mode means that low level functions with test device access will not be executed. This is useful to check quickly if test cases are syntactically correct and if config/mapping data are consistent.</li>
    <li><B>-report_overview</B> : (optional) When given a report overview html file (Reports.html) will be generated in the report folder.</li>
    <li><B>-keep_last_SCCM_state</B> : (optional) When given then after the test is finished SCCM is switched to the state before the test was started instead of enabling SCCM by default. This is useful for Jenkins tests where SCCM should be disabled permanently.<br />Alternatively if a text file <B>C:\TurboLIFT\option_keep_SCCM_state.txt</B> exists then it has the same effect. The contents of the file option_keep_SCCM_state.txt does not matter. So SCCM is switched to the state before the test was started if either -keep_last_SCCM_state is given as argument <B>OR</B> C:\TurboLIFT\option_keep_SCCM_state.txt exists.</li>
    <li><B>-simulation</B> : (optional) Runs the tests in simulation mode. Simulation mode means that low level functions with test device access will be replaced by stub functions. This is useful for engine development.</li>
    <li><B>-silent</B> : (optional) Suppresses console output. This is useful for .t testing of engine modules.</li>
    <li><B>-beep</B> : (optional) Makes a beep after every test case and 3 beeps after the test list is finished.</li>
</ul>
<br>
Note: cd /d %~dp0 makes sure that the subsequent commands are executed in the path of the batch file (%~dp0 will expand to the drive letter and path of the batch file).<br>
<br>
<B>If you run a long testlist which creates a huge log file, split up to several smaller lists.<br>
Unfortunately Windows can't handle big logfiles.</B><br>
<br>

=head2 CALL SEVERAL TEST LISTS WITHIN A BATCH FILE

 cd /d %~dp0
 call .\Engine\LIFT_exec_engine.pl -testlist .\Testlists\my_list.txt -conf .\config\CFG_xxx.pm -offline
 call .\Engine\LIFT_exec_engine.pl -testlist .\Testlists\my_other_list.txt -conf .\config\CFG_xxx.pm -offline -IC ICdefault.normal
 pause

If you call several test lists, a new logfile is created for each test list. 

B<WARNING:> If you leave the 'call' command, only the first list will be executed !

=head1 TurboLIFT ARCHITECTURE

=head2
TurboLIFT software architecture

=for html
<IMG SRC='../pics\Engine1.png' width="100%" alt='Engine1.png'>

=head2
TurboLIFT configuration files

=for html
<IMG SRC='../pics\Engine2.png' width="80%" alt='Engine2.png'>

=head2
TurboLIFT parameter examples

=for html
<IMG SRC='../pics\Testlist.png' width="100%" alt='Testlist.png'><br>

=head2
TurboLIFT exception handling

=for html
<IMG SRC='../pics\test_run.png' width="60%" alt='test_run.png'><br>

=head1 History

=for html
TurboLIFT is heavily based on:<br> 
<a href="http://abt-ismtwiki.de.bosch.com/twiki/bin/view/Tools/STEPSOverView" target="blank">
<IMG SRC='../pics/STEPS_logo.jpg' width="30%" alt="STEPS Homepage" border="0"></a>.

=cut