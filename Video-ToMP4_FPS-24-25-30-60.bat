REM https://lists.ffmpeg.org/pipermail/ffmpeg-user/2013-July/016240.html
REM The frame rate of your source may be constant or variable. If frame rate of
REM your source is constant,
REM You can just type the following:

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
		REM ffmpeg -i %%x -r 24 -vcodec libx264 -acodec copy -map_metadata 0 -map 0 -threads 1 "%%~nx_output_FPS24.mp4"
		REM ffmpeg -r "25" -i %%x -vcodec libx264 -acodec copy -map_metadata 0 -map 0 -threads 1 "%%~nx_output_FPS25.mp4"
		ffmpeg -i %%x -r 30 -vcodec libx264 -acodec copy -map_metadata 0 -map 0 -threads 1 "%%~nx_output_FPS30.mp4"
		REM ffmpeg -r "60" -i %%x -vcodec copy -acodec copy -map_metadata 0 -map 0 -threads 1 "%%~nx_output_FPS60.mp4"
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause