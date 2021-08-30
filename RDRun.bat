@echo off
reg Query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server"

set /p resp="Do you need to change remote desktop settings? press Y for yes or N for no: "
if "%resp%"=="-" (goto test)
goto continue

:continue
if "%resp%"=="y" (goto yes)
goto no

:test
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
echo changed value for Remote Desktop to off
goto eof

:yes
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
echo changed value for Remote Desktop to on
goto eof

:no
echo No changes were made
goto eof2

:eof
shutdown.exe /r /t 00

:eof2
pause