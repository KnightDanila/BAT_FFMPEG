REM https://wiki.multimedia.cx/index.php/FFmpeg_Metadata

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
		REM FOR PANASONIC
		ffmpeg.exe -i %%x -vcodec copy -acodec copy -map 0 ^
-metadata title="___input_title___" ^
-metadata:s:v:0 title="___input_name___" ^
-metadata:s:a:0 title="___Audio_1_Russian___" ^
-metadata:s:a:1 title="___Audio_0_Russian___" ^
-metadata:s:a:2 title="___Audio_0_Russian___" ^
-metadata:s:a:3 title="___Audio_2_Ukrainian___" ^
-metadata:s:a:4 title="___Audio_3_English___" ^
-metadata:s:s:0 title="___Sub_1_Russian_Forced___" ^
-metadata:s:s:1 title="___Sub_2_Ukrainian___" ^
-metadata:s:s:2 title="___Sub_0_Russian___" ^
-metadata:s:s:3 title="___Sub_3_English___" ^
"%%~nx_output.mkv"
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause