@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

echo %1
:: echo %* :: for multiple files

if NOT [%1]==[] (
	echo "get one file"
	ffmpeg.exe -i %1 -vcodec libx264 -acodec copy -threads 1 output.mkv
	REM AAC filesize = 70%
	REM ffmpeg.exe -i %1 -vcodec libx264 -acodec aac -threads 1 output.mkv

) else (
	echo "get no one files"
)


pause