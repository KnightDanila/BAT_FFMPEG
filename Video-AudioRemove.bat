REM https://trac.ffmpeg.org/wiki/AudioVolume
REM https://superuser.com/questions/323119/how-can-i-normalize-audio-using-ffmpeg
REM http://breakthebit.org/post/53570840966/how-to-increase-volume-in-a-video-without
REM https://superuser.com/questions/31176/increase-volume-of-an-mkv-video-from-linux-terminal
REM https://www.maketecheasier.com/ffmpeg-commands-media-file-conversions/

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
		REM
		ffmpeg.exe -i %%x -vcodec copy -an -map_metadata 0 -map 0 "%%~nx_output_AUDIO_ReM.%%~xx"
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause