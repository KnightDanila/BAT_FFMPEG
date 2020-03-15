@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

REM For first file
REM %1
REM For multiple files
echo %*

echo.
ffmpeg.exe -version
echo.
ffplay.exe -version
echo.
ffprobe.exe -version

pause