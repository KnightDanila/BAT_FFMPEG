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
		ImageMagick_convert.exe %%x "GIFs/%%~nx_WebpToGif.gif"


)
) else (
	echo _____GET NO ONE FILES_____
)

pause