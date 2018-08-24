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
	ffmpeg.exe -i %1 -acodec libvorbis -q:a 4 "%~n1_output_OGG.ogg"
	REM ffmpeg.exe -i %1 -acodec libvorbis "%~n1_output_OGG.ogg"
) else (
	echo "get no one files"
)


pause