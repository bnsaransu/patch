@echo off
setlocal

if not exist %SystemRoot%\system32\bcdedit.exe goto withoutbcdedit

:withbcdedit
bcdedit /deletevalue increaseUserVa
if %ERRORLEVEL% == 0 (
	echo Disable Success
	set result = 0
) else (
	echo Disable Failure
	set result = 1
)
goto exit

:withoutbcdedit
echo Disable Failure
set result = 1
goto exit

:exit
exit /b %result%