REM https://linuxconfig.org/ffmpeg-audio-format-conversions
REM https://linuxconfig.org/ffmpeg-audio-format-conversions
REM ffmpeg.exe -i input.mkv -codec copy -acodec ac3 output.mkv

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
		REM ffmpeg.exe -i %%x -vcodec copy -acodec ac3 -map_metadata 0 -map 0 "%%~nx_output_MKV_ AC3.%%~xx"
		ffmpeg.exe -i %%x -vcodec copy -acodec aac -map_metadata 0 -map 0 "%%~nx_output_MKV_AAC.%%~xx"
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause