@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

ImageMagick_convert.exe -version

pause