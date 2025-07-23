@ECHO OFF
ECHO -----------------------------------------------------------------------------------------------
ECHO    This batch %0 
ECHO    is running from folder CustLib\Jenkins_batch 
ECHO    (all given parameter relative to it)
ECHO -----------------------------------------------------------------------------------------------
@ECHO OFF
CALL ..\..\Engine\LIFT_exec_engine.pl ^
    -testlist ..\Testlists\empty.txt ^
	-conf ..\FLASH_config\AB12_Flash_CFG.pm ^
	-IC IC_flash ^
	-minimalsnapshot -polite -keep_last_SCCM_state
pause