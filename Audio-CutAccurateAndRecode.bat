REM https://superuser.com/questions/499380/accurate-cutting-of-video-audio-with-ffmpeg
REM https://superuser.com/questions/138331/using-ffmpeg-to-cut-up-video
REM https://stackoverflow.com/questions/15629490/how-to-cut-part-of-mp4-video-using-ffmpeg-without-losing-quality


@echo off

echo %CD%
echo %~dp0
cd /d %~dp0
ECHO. & ECHO ******* BAT FILE ******* 
ECHO %~nx0 
ECHO ************************ & ECHO.

REM Creating the Results Directory - GIFs
set RESULTS_DIR="Audio"
call SYS_MakeResultsDir.bat %RESULTS_DIR%

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
		REM Audio
		REM ffmpeg -i %%x -ss 00:00:40.000 -to 00:01:20.000 -acodec copy -map_metadata 0 -map 0 "%%~nx_output_CUT%%~xx"
		ffmpeg -i %%x -to 00:00:23.200 -acodec copy -map_metadata 0 -map 0  "%RESULTS_DIR%\%%~nx_output_CUT%%~xx"
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause


