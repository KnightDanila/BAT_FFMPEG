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
		REM -ss - start
		REM -to - duration
		REM hh:mm:ss.mss

		ffmpeg.exe -i %%x -qscale 1 -vf "crop=iw/3:ih/3:50:50" -acodec copy -map_metadata 0 -map 0 "%%~nx_output_ZOOM.%%~xx"
		REM ffmpeg.exe -i %1 -vf "scale=2*iw:-1, crop=iw/2:ih/2:0:0" -c:a copy output.mp4
		REM -qscale 1
		REM 0 = 90CounterCLockwise and Vertical Flip (default)
		REM 1 = 90Clockwise
		REM 2 = 90CounterClockwise
		REM 3 = 90Clockwise and Vertical Flip	
		REM Use -vf "transpose=2,transpose=2" for 180 degrees.
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause