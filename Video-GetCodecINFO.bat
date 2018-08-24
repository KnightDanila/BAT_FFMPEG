REM https://stackoverflow.com/questions/2869281/how-to-recognize-video-codec-of-a-file-with-ffmpeg

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
		REM AAC filesize = 70%
		REM AC3 filesize = 90% 
		REM -> aac < ac3
		REM ffmpeg.exe -i %%x -vcodec copy -acodec aac "%%~nx_output_AAC.mkv"
		REM ffmpeg.exe -i %%x -vcodec copy -acodec ac3 "%%~nx_output_AC3.mkv"
		ffmpeg.exe -i %%x -hide_banner
		ffprobe.exe -i %%x -show_format -hide_banner
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause