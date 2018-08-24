REM https://linuxconfig.org/ffmpeg-audio-format-conversions
REM ffmpeg.exe -i 1.aac -acodec ac3 11.ac3
@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

echo %1
:: echo %* :: for multiple files

if NOT [%1]==[] (
	echo "get one file"
	REM AAC filesize = 70% - ERROR1: incorrect time sometimes
	REM ffmpeg.exe -i %1 -acodec aac "%~n1_output_AAC.aac"
	REM filesize = 90% -> aac < ac3
	ffmpeg.exe -i %1 -acodec ac3 "%~n1_output_AC3.ac3"
) else (
	echo "get no one files"
)


pause