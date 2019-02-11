REM https://superuser.com/questions/499380/accurate-cutting-of-video-audio-with-ffmpeg
REM https://superuser.com/questions/138331/using-ffmpeg-to-cut-up-video
REM https://stackoverflow.com/questions/15629490/how-to-cut-part-of-mp4-video-using-ffmpeg-without-losing-quality
REM use it only if you know what are "Format settings, ReFrames : N frames" and keyframes


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
		REM -ss - start
		REM -to - duration
		REM hh:mm:ss.mss
					REM ffmpeg -i %%x -vcodec copy -acodec copy -ss 00:00:25 -to 00:25:33 "%%~nx_output_CUT.mp4"
					REM ffmpeg -ss 00:00:00 -i %%x -to 00:02:28.327 -acodec copy -vcodec copy -map_metadata 0 -map 0 "%%~nx_output_CUT.mkv"
					REM ffmpeg -ss 00:00:00 -i %%x -ss 00:00:00 -to 00:02:28.327 -acodec copy -vcodec copy -map_metadata 0 -map 0 "%%~nx_output_CUT.mkv"
		REM ffmpeg -ss 00:03:10.360 -i %%x -to 00:05:28.327 -acodec copy -vcodec copy -map_metadata 0 -map 0 "%%~nx_output_CUT.mkv"
		ffmpeg -ss 00:00:13.000 -i %%x -acodec copy -vcodec copy -map_metadata 0 -map 0 "%%~nx_output_CUT.%%~xx"
					REM ffmpeg -i %%x -vcodec copy -acodec copy -ss 00:00:11.2 -to 00:00:13.2 "%%~nx_output_CUT.mp4"
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause


