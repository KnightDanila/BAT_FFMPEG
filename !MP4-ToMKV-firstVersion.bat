@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

echo %1
:: echo %* :: for multiple files

if NOT [%1]==[] (
	echo "get one file"
	REM ffmpeg.exe -i %1 -vcodec libx265 -acodec copy output_265.mkv
	REM ffmpeg.exe -i %1 -vcodec libx264 -acodec copy output_264.mkv
	REM ffmpeg.exe -i %1 -vcodec libx264 -acodec aac output.mkv
	REM AAC filesize = 70%
	ffmpeg.exe -i %1 -vcodec copy -acodec aac output_AAC.mkv 
	REM filesize = 90% -> aac < ac3
	REM ffmpeg.exe -i %1 -vcodec copy -acodec ac3 output_AC3.mkv
	REM ffmpeg -i %1 -vcodec copy -acodec copy output.avi
) else (
	echo "get no one files"
)


pause