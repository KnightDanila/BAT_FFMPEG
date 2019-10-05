REM 	USE "@setlocal EDE (EnableDelayedExpansion )" -
REM	Because I cannot use "SET /p" - IN LOOP, 
REM 	Cannot use & Ampersand symbol in URL (I need it for list)
@setlocal EnableDelayedExpansion 


@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

REM For first file
REM %1
REM For multiple files
echo %*

set COUNTER=0
for %%x in (%*) do (
	echo %%x
	set /A COUNTER+=1
)
echo COUNTER = %COUNTER%

if %COUNTER% GTR 0 (
	if %COUNTER% EQU 1 (
		echo _____GET ONE FILE_____
	) else (
		echo _____GET MULTI FILES: %COUNTER% files_____
	)
	for %%x in (%*) do (
REM //////////////////// MAIN \\\\\\\\\\\\\\\\\\\\\\\\\

		SET /p time="Enter time of frame (like hh:mm:ss.mss - 00:00:00.000): "
		ECHO time = !time!;
		ffmpeg.exe -ss !time! -i %%x -r 1 -q:v 1 -qmin 1 -qmax 1 -vframes 1 "%%~nx_output.jpg"

	)
) else (
	echo _____GET NO ONE FILES_____
)

pause