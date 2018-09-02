REM https://lists.ffmpeg.org/pipermail/ffmpeg-user/2012-July/007980.html
REM https://stackoverflow.com/questions/3921464/ffmpeg-how-do-i-know-what-audio-rate-to-use

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
		REM ffmpeg.exe -i %%x -vcodec libx264 -acodec aac "%%~nx_output_AAC.mp4"
		REM ffmpeg.exe -i %%x -vcodec libx264 -acodec ac3 "%%~nx_output_AC3.mp4"
		REM -acodec libfaac -ac 2 -ar 44100 -ab 80k -vcodec libx264 -s 640x480 -b 670k -g 30 -r 15 output.mov
		REM ffmpeg.exe -i %%x -an -c:v mjpeg -s 320x240 -f mov "%%~nx_output_AC3.mov"
		
		REM FOR PANASONIC
		ffmpeg.exe -i %%x -acodec pcm_u8 -map_channel 0.1.0 -ar 8000 -q:a 30 -r 10 -c:v mjpeg -s 320x240 "%%~nx_output_AC3.mov"
		REM ffmpeg -ss 00:30:50 -i %%x -acodec pcm_u8 -map_channel 0.1.0 -ar 8000 -q:a 30 -r 10 -c:v mjpeg -s 320x240 "%%~nx_output_CUT.mov"
		REM ffmpeg.exe -i %%x -acodec pcm_u8 -map_channel 0.1.0 -ar 8000 -q:a 30 -r 10 -c:v mjpeg -q:v 30 -s 320x240 "%%~nx_output_AC3.mov"
		REM ffmpeg.exe -i %%x -acodec pcm_u8 -map_channel 0.1.0 -ar 8000 -r 10 -c:v mjpeg -s 320x240 -f mov "%%~nx_output_AC3.mov"
		REM ffmpeg.exe -i %%x -acodec pcm_u8 -map_channel 0.1.0 -ar 8000 -r 10 -c:v mjpeg -s 320x240 -f mov -metadata creation_time="2018-01-27 19:07:26" "%%~nx_output_AC3.mov"
		REM ffmpeg.exe -i %%x -an -pix_fmt yuv420p -c:v mjpeg -q:v 3 -s 320x240 "%%~nx_output_AC3.mov"
		REM ffmpeg.exe -i %1 -vcodec libx264 -crf 30 output.mp4 
		
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause