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
		REM Crop 80 pixels from the bottom:
		ffmpeg.exe -i %%x -qscale 1 -vf "crop=iw:ih-80:0:0" -acodec copy -map_metadata 0 -map 0 "%%~nx_output_Crop.%%~xx"

	)
) else (
	echo _____GET NO ONE FILES_____
)

pause