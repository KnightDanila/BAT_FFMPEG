https://stackoverflow.com/questions/3255674/convert-audio-files-to-mp3-using-ffmpeg
https://superuser.com/questions/332347/how-can-i-convert-mp4-video-to-mp3-audio-with-ffmpeg

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
		REM https://trac.ffmpeg.org/wiki/Encode/MP3
		REM ffmpeg -i %%x -codec:a libmp3lame -qscale:a 2 "%%~nx_output_MP3.mp3"
		REM ffmpeg -i %%x -ab 320k -map_metadata 0 -id3v2_version 3 output.mp3
		REM ffmpeg.exe -i %%x "%%~nx_output_MP3.mp3"
		REM ffmpeg -i %%x -ab 320k -map_metadata 0 -id3v2_version 3 output.mp3
		REM ERROR -vn - delete video - but delete cover icon too :D
		REM ffmpeg -i %%x -vn -ar 44100 -ac 2 -q:a 0 -map_metadata 0 -id3v2_version 3 "%%~nx_output_MP3.mp3"
		REM OLD
		REM ffmpeg -i %%x -ab 320k "%%~nx_output_MP3.mp3"
		REM ffmpeg -i %%x -vn -ar 44100 -ac 2 ab 320k "%%~nx_output_MP3.mp3"
		REM NEW
		ffmpeg -i %%x -ar 44100 -ac 2 -q:a 0 -map_metadata 0 -id3v2_version 3 "%%~nx_output_MP3.mp3"

	)
) else (
	echo _____GET NO ONE FILES_____
)

pause