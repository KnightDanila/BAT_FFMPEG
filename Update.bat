@echo off
setlocal
set GIT_EXE=Apps\git\git.exe

:: Navigate to app folder
cd /d "%~dp0"

:: Pull latest changes
"%GIT_EXE%" pull

echo BAT_FFMPEG updated.
pause
