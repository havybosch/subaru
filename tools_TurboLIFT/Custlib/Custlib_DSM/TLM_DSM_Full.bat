cd /d %~dp0
SET PROJECT=Subaru_TG8
call .\..\..\Engine\LIFT_exec_engine.pl -testlist .\Testlists\TL_DSM_Full.txt -conf .\..\config\Common_Cfg\Subaru_AB12_CFG.pm -minimalsnapshot -offline
pause