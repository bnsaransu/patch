@echo off
setlocal

if defined ProgramW6432 goto 64bit

if not exist %SystemRoot%\system32\bcdedit.exe goto withoutbcdedit

:withbcdedit
bcdedit /set increaseUserVa 2560
if %ERRORLEVEL% == 0 (
	echo Enable Success
	set result = 0
) else (
	echo Enable Failure
	set result = 1
)
goto exit

:64bit
echo 3GB Option is not required for 64bit OS
set result = 1
goto exit

:withoutbcdedit
echo Enable Failure
set result = 1
goto exit

:exit
exit /b %result%