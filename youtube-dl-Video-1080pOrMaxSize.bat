REM youtube-dl.exe --config-location youtube-dl.conf URL


REM 	USE "@setlocal EDE (EnableDelayedExpansion )" -
REM	Because I cannot use "SET /p" - IN LOOP, 
REM 	Cannot use & Ampersand symbol in URL (I need it for list)
@setlocal EnableDelayedExpansion 


@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

ECHO. & ECHO ******************************************************
SET /p URL="Paste URL: "
ECHO URL=!URL!;
ECHO ****************************************************** & ECHO.

REM _________________MAIN_____________________
	youtube-dl.exe --config-location youtube-dl-Video-1080pOrMaxSize.conf !URL!
REM _______________END_MAIN___________________

ECHO.
ECHO ******************************************************
ECHO *        Downloads Are Ready :) Be Happy :)          *
ECHO ******************************************************
ECHO.

pause