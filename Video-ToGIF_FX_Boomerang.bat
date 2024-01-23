REM https://medium.com/@colten_jackson/doing-the-gif-thing-on-debian-82b9760a8483
REM http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html
REM https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality
REM https://gist.github.com/keijiro/b46d94f4cd1b159c59a72cd616f95017
REM https://superuser.com/questions/1231645/ffmpeg-generate-and-use-different-palette-for-every-frame


@echo off

echo %CD%
echo %~dp0
cd /d %~dp0
ECHO. & ECHO ******* BAT FILE ******* 
ECHO %~nx0 
ECHO ************************ & ECHO.

REM Creating the Results Directory - GIFs
set RESULTS_DIR="GIFs"
call SYS_MakeResultsDir.bat %RESULTS_DIR%

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

		
		REM Fast style :)
		REM For Full File (create palette.png - "Video-ToGIF_palette.png", then create gif - I am happy)

		REM ffmpeg.exe -i %%x -filter_complex "[0]reverse[r];[0][r]concat=n=2:v=1:a=0" "GIFs\%%~nx_output_Boomerang.gif"
		REM ffmpeg.exe -i %%x -filter_complex "[0]trim=start_frame=1:end_frame=29,setpts=PTS-STARTPTS,reverse[r];[0][r]concat=n=2:v=1:a=0,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "GIFs\%%~nx_output_Boomerang_v2.gif"
		REM ffmpeg.exe -i %%x -filter_complex "[0]fps=12,scale=256:-1:flags=lanczos,split[main][reverse];[reverse]reverse[r];[main][r]concat=n=2:v=1:a=0,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "GIFs\%%~nx_output_Boomerang.gif"
		ffmpeg.exe -i %%x -filter_complex "[0]scale=-1:320:flags=lanczos,split[main][reverse];[reverse]reverse[r];[main][r]concat=n=2:v=1:a=0,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "%RESULTS_DIR%\%%~nx_output_BoomerangV3.gif"

		REM TESTs
		REM ffmpeg.exe -ss 00:19:07 -t 1.3 -i %%x -vf fps=15,scale=320:-1:flags=lanczos,palettegen Video-ToGIF_palette.png -y
		REM ffmpeg.exe -ss 00:19:07 -t 1.3 -i %%x -i Video-ToGIF_palette.png -filter_complex "fps=15,scale=400:-1:flags=lanczos[x];[x][1:v] paletteuse" "%%~nx_output.gif"
		REM (create palette.png - "Video-ToGIF_palette.png", then create gif - I am happy)
		REM ffmpeg.exe -ss 00:19:07 -t 1.3 -i %%x -vf fps=15,scale=-1:-1:flags=lanczos,palettegen Video-ToGIF_palette.png -y
		REM ffmpeg.exe -ss 00:19:07 -t 1.3 -i %%x -i Video-ToGIF_palette.png -filter_complex "fps=15,scale=-1:-1:flags=lanczos[x];[x][1:v]paletteuse" "%%~nx_output.gif"



)
) else (
	echo _____GET NO ONE FILES_____
)

pause