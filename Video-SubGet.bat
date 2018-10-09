REM https://trac.ffmpeg.org/ticket/7356#comment:4
REM https://ffmpeg.org/ffmpeg.html#Advanced-options

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
		REM ffmpeg.exe -i %%x -map 0:s:0 -sub_charenc CP1252 "%%~nx_output_subtitles.srt"

		REM (get all eng data - one video, one audio and one eng sub; then remove audio and video. and i get subs only, I am happy)
		ffmpeg.exe -i %%x -map 0:m:language:eng -map -0:a -map -0:v "%%~nx.srt"

		REM get eng (remove rus, ukr)
		REM ffmpeg.exe -i %%x -map 0:s -map -0:m:language:rus -map -0:m:language:ukr "%%~nx.srt"
		
		REM ffmpeg.exe -i %%x -map 0:s -map -0:m:language:rus "%%~nx_output_subtitles.srt"

		REM Audio get only eng 
		REM ffmpeg.exe -i %%x -map 0:a -map -0:m:language:rus -map -0:m:language:jpn -map -0:m:language:ukr -report "%%~nx_output.ac3"
		



)
) else (
	echo _____GET NO ONE FILES_____
)

pause