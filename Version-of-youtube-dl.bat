@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

youtube-dl.exe --version

pause