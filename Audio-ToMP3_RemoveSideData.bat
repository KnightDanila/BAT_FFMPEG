REM https://en.wikipedia.org/wiki/ReplayGain
REM https://github.com/FFmpeg/FFmpeg/blob/master/libavfilter/f_sidedata.c#L88
REM https://gist.github.com/tayvano/6e2d456a9897f55025e25035478a3a50
REM https://ffmpeg.org/ffmpeg-all.html#replaygain
REM https://ffmpeg.org/ffmpeg-all.html#mp3
REM https://eyed3.readthedocs.io/en/latest/plugins/lameinfo_plugin.html
REM https://trac.ffmpeg.org/ticket/4622
REM https://ffmpeg.org/ffmpeg-all.html#Audio-Filters

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
		REM MP3 to MP3 RemoveSideData
		ffmpeg -i %%x -c copy -write_xing 0 "Audio-ToMP3_RemoveSideData_Temp.mp3" -y
		ffmpeg -i "Audio-ToMP3_RemoveSideData_Temp.mp3" -c copy "%%~nx_output_MP3RSD.mp3"
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause