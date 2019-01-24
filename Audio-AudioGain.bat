@echo off
REM https://stackoverflow.com/questions/3255674/convert-audio-files-to-mp3-using-ffmpeg
REM https://superuser.com/questions/332347/how-can-i-convert-mp4-video-to-mp3-audio-with-ffmpeg

echo %CD%
echo %~dp0
cd /d %~dp0
ECHO. & ECHO ******* BAT FILE ******* 
ECHO %~nx0 
ECHO ************************ & ECHO.

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
		REM https://trac.ffmpeg.org/wiki/AudioVolume
		ffmpeg -i %%x -filter:a "volume=1.5" -ar 44100 -ac 2 -q:a 0 -map_metadata 0 -id3v2_version 3 "%%~nx_output_GAIN%%~xx"

	)
) else (
	echo _____GET NO ONE FILES_____
)

pause