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

REM Creating the Results Directory - ICONs
set RESULTS_DIR="ICONs"
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


		REM Basic sizes :)
		REM Use 1024 png as source for other sizes:
		ImageMagick_convert.exe %%x -scale 20x20 "%RESULTS_DIR%\%%~nx_20x20.png"
		ImageMagick_convert.exe %%x -scale 29x29 "%RESULTS_DIR%\%%~nx_29x29.png"
		ImageMagick_convert.exe %%x -scale 40x40 "%RESULTS_DIR%\%%~nx_40x40.png"
		ImageMagick_convert.exe %%x -scale 58x58 "%RESULTS_DIR%\%%~nx_58x58.png"
		ImageMagick_convert.exe %%x -scale 60x60 "%RESULTS_DIR%\%%~nx_60x60.png"
		ImageMagick_convert.exe %%x -scale 76x76 "%RESULTS_DIR%\%%~nx_76x76.png"
		ImageMagick_convert.exe %%x -scale 80x80 "%RESULTS_DIR%\%%~nx_80x80.png"
		ImageMagick_convert.exe %%x -scale 87x87 "%RESULTS_DIR%\%%~nx_87x87.png"
		ImageMagick_convert.exe %%x -scale 114x114 "%RESULTS_DIR%\%%~nx_114x114.png"
		ImageMagick_convert.exe %%x -scale 120x120 "%RESULTS_DIR%\%%~nx_120x120.png"
		ImageMagick_convert.exe %%x -scale 120x120 "%RESULTS_DIR%\%%~nx_128x128.png"
		ImageMagick_convert.exe %%x -scale 120x120 "%RESULTS_DIR%\%%~nx_136x136.png"
		ImageMagick_convert.exe %%x -scale 152x152 "%RESULTS_DIR%\%%~nx_152x152.png"
		ImageMagick_convert.exe %%x -scale 167x167 "%RESULTS_DIR%\%%~nx_167x167.png"
		ImageMagick_convert.exe %%x -scale 180x180 "%RESULTS_DIR%\%%~nx_180x180.png"
		ImageMagick_convert.exe %%x -scale 180x180 "%RESULTS_DIR%\%%~nx_192x192.png"
		ImageMagick_convert.exe %%x -scale 1024x1024 "%RESULTS_DIR%\%%~nx_1024x1024.png"

)
) else (
	echo _____GET NO ONE FILES_____
)

pause