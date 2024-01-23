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
		REM BEST QUALITY FOR
		REM ffmpeg.exe -i %%x -vcodec libx264 -acodec aac "%%~nx_output_AAC.mp4"
		REM ffmpeg.exe -i %%x -vcodec libx264 -acodec ac3 "%%~nx_output_x264_AC3.mp4"
		REM BEST QUALITY FOR - MOV Photocamera Lumix
		ffmpeg.exe -i %%x -vcodec libx264 -acodec aac -map_metadata 0 -map 0  "%%~nx_output_MP4_AC3_48KHz.mp4"	
		REM ffmpeg.exe -i %%x -vcodec libx264 -c:a ac3 -b:a 128k "%%~nx_output_CRF0.mp4"
		REM ffmpeg.exe -i %1 -vcodec libx264 -crf 20 output.mp4
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause