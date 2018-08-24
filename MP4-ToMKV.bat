@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

echo %1
:: echo %* :: for multiple files

if NOT [%1]==[] (
	echo "get one file"
	ffmpeg.exe -i %1 -crf 20 -vcodec libx264 -acodec copy -threads 3 output.mkv
	REM ffmpeg.exe -i %1 -vcodec libx264 -acodec aac output.mkv
	REM ffmpeg.exe -i %1 -vcodec copy -acodec aac output.mkv :: filesize = 70%
	REM ffmpeg.exe -i %1 -vcodec copy -acodec ac3 output.mkv :: filesize = 90% -> aac < ac3
) else (
	echo "get no one files"
)


pause