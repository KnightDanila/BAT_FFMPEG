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


		REM HD style :)
		REM For Full File (create palette.png - "Video-ToGIF_palette.png", then create gif - I am happy)
		REM scale=-1:-1 and scale=320:-1 = dispersion
		ffmpeg.exe -i %%x -vf fps=24,scale=-1:-1:flags=lanczos,palettegen Video-ToGIF_palette.png -y
		ffmpeg.exe -i %%x -i Video-ToGIF_palette.png -filter_complex "fps=24,scale=-1:720:flags=lanczos[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=5" "%%~nx_output_HD_720p.gif"

		REM TESTs
		REM ffmpeg.exe -ss 00:19:07 -t 1.3 -i %%x -vf fps=15,scale=320:-1:flags=lanczos,palettegen Video-ToGIF_palette.png -y
		REM ffmpeg.exe -ss 00:19:07 -t 1.3 -i %%x -i Video-ToGIF_palette.png -filter_complex "fps=15,scale=400:-1:flags=lanczos[x];[x][1:v] paletteuse" "%%~nx_output.gif"
		REM (create palette.png - "Video-ToGIF_palette.png", then create gif - I am happy)
		REM ffmpeg.exe -ss 00:19:07 -t 1.3 -i %%x -vf fps=15,scale=-1:-1:flags=lanczos,palettegen Video-ToGIF_palette.png -y
		REM ffmpeg.exe -ss 00:19:07 -t 1.3 -i %%x -i Video-ToGIF_palette.png -filter_complex "fps=15,scale=-1:-1:flags=lanczos[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=1" "%%~nx_output.gif"
		



)
) else (
	echo _____GET NO ONE FILES_____
)

pause