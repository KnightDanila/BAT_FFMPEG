:: http://askubuntu.com/questions/716424/how-to-convert-ts-file-into-main-stream-file-losslessly
:: http://superuser.com/questions/525928/ffmpeg-keeping-quality-during-conversion
:: http://quartz-net.co.uk/quartzwiki/index.php/TS_convert_using_ffmpeg
:: ffmpeg.exe -i input.ts -vcodec copy -sameq -acodec copy -f matroska output.mkv
:: Ўрек 1(2001=BD Remux) libx264 -crf 20
:: ffmpeg.exe -i "H:\1.ts" -crf 10 -acodec copy -threads 4 -f matroska output.mkv

@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

echo %1
:: echo %* :: for multiple files

if NOT [%1]==[] (
	echo "get one file"
	REM ffmpeg.exe -i %1 -crf 20 -acodec copy -threads 3 -f matroska output.mkv
	ffmpeg.exe -i %1 -crf 20 -vcodec libx264 -acodec copy -threads 3 output.mkv
	REM ffmpeg.exe -i %1 -vcodec libx264 -acodec aac output.mkv
	REM ffmpeg.exe -i %1 -vcodec copy -acodec aac output.mkv :: filesize = 70%
	REM ffmpeg.exe -i %1 -vcodec copy -acodec ac3 output.mkv :: filesize = 90% -> aac < ac3
) else (
	echo "get no one files"
)


pause