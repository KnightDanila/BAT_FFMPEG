REM https://ffmpeg.zeranoe.com/forum/viewtopic.php?p=16264
REM https://video.stackexchange.com/questions/23589/replace-black-frames-with-previous-frames
REM https://www.stellarinfo.com/blog/how-to-repair-missing-and-bad-frames-in-video/


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

		ffmpeg -i %%x -force_key_frames "expr:gte(t,n_forced*3)" "%%~nx_output_FixFrame_v1%%~xx"
		ffmpeg -i %%x -vf blackframe=0,metadata=select:key=lavfi.blackframe.pblack:value=99:function=less,minterpolate=mi_mode=mci:mc_mode=obmc:me_mode=bilat:vsbmc=0:me=tdls -c:a copy "%%~nx_output_FixFrame_v2%%~xx"

		REM TESTS
		REM 
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause


