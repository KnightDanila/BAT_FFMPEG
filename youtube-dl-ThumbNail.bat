REM youtube-dl.exe --write-thumbnail --get-thumbnail URL

@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

ECHO. & ECHO ******************************************************
SET /p URL="Paste URL: "
ECHO URL=%URL%;
ECHO ****************************************************** & ECHO.

REM _________________MAIN_____________________
	youtube-dl.exe --write-thumbnail --skip-download %URL%
REM _______________END_MAIN___________________

ECHO.
ECHO ******************************************************
ECHO * If thumbnail does not save, download it from here: *
youtube-dl.exe --get-thumbnail %URL%
ECHO ******************************************************
ECHO.

pause