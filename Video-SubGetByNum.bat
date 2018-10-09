REM https://trac.ffmpeg.org/ticket/7356#comment:4
REM https://ffmpeg.org/ffmpeg.html#Advanced-options
REM https://superuser.com/questions/78496/variables-in-batch-file-not-being-set-when-inside-if/78509


REM BECAUSE I CANNOT USE "SET /p" - IN LOOP
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
		
		REM (get all file data)
		ffmpeg.exe -i %%x
		SET /p streamNumber="Select sub Stream Number: "
		ECHO streamNumber = !streamNumber!;
		REM (get all sub data and select which you like)
		ffmpeg.exe -i %%x -map 0:!StreamNumber! "%%~nx.srt"

)
) else (
	echo _____GET NO ONE FILES_____
)

pause