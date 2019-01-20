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
		REM ffmpeg.exe -i %%x -vcodec copy -acodec copy "%%~nx_output_AC3.mkv"
		REM ffmpeg.exe -i %%x -vcodec libx264 -acodec copy "%%~nx_output_AC3.mkv"
		REM BEST QUALITY FOR - MOV Photocamera Lumix
		REM ffmpeg.exe -i %%x -vcodec libx264 -acodec ac3 -ar 48000 "%%~nx_output_MKV_AC3_48KHz.mkv"
		ffmpeg.exe -i %%x -vcodec libx264 -acodec aac "%%~nx_output_MKV_AAC.mkv"
		REM ffmpeg.exe -i %%x -vcodec libx264 -acodec copy "%%~nx_output_PCM.mkv"
		REM ffmpeg.exe -i %%x -vcodec libx264 -acodec ac3 "%%~nx_AC3.mkv"
		REM ffmpeg.exe -i %%x -vcodec libx264 -crf 20 -acodec copy "%%~nx_output_PCM.mkv"
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause