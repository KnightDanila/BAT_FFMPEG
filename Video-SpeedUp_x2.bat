REM https://superuser.com/questions/1261678/how-do-i-speed-up-a-video-by-60x-in-ffmpeg
REM https://superuser.com/questions/1407833/using-ffmpeg-apply-audio-filter-dynaudnorm-to-multiple-audiostreams-in-avi


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
		REM -filter:v "setpts=0.5*PTS"
		REM ffmpeg -i %%x -vf "setpts=0.5*PTS" -af "" -map_metadata 0 -map 0 -copyts "%%~nx_output_SpeedUp_X2%%~xx"

		ffmpeg -i %%x -map 0 -vf "setpts=PTS/1.5" -af "atempo=1.5" -map_metadata 0 "%%~nx_output_SpeedUp_X2%%~xx"

		REM TESTS
		REM ffmpeg -i %%x -filter_complex "setpts=PTS/1.5;atempo=1.5" -map_metadata 0 -map 0 -copyts "%%~nx_output_SpeedUp_X2_v0_MapAfter%%~xx"
		REM ffmpeg -i %%x -filter_complex "[0:v]setpts=PTS/1.5[v];[0:a]atempo=1.5[a]" -map "[v]" -map "[a]" "%%~nx_output_SpeedUp_X2_v1%%~xx"
		REM ffmpeg -i %%x  -vf "setpts=PTS/1.5" -af "atempo=1.5" -map_metadata 0 -map 0  "%%~nx_output_SpeedUp_X2_v2%%~xx"
		REM ffmpeg -i %%x -filter_complex "[0:v]setpts=PTS/1.5[v];[0:a]atempo=1.5[a]" -map "[0:v]" -map "[0:a]" "%%~nx_output_SpeedUp_X2_v3%%~xx"
		REM ffmpeg -i %%x -filter_complex "setpts=PTS/1.5;atempo=1.5" "%%~nx_output_SpeedUp_X2_v4_NOMAP%%~xx"
		REM ffmpeg -i %%x -map_metadata 0 -map 0 -vf "setpts=PTS/1.5" -af "atempo=1.5" "%%~nx_output_SpeedUp_X2_V5%%~xx" REM YESSSS
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause


