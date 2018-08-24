@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

echo %1
:: echo %* :: for multiple files

if NOT [%1]==[] (
	ffmpeg.exe -i %1 -qscale 1 -vf "transpose=1" output.avi
	
	REM 0 = 90CounterCLockwise and Vertical Flip (default)
	REM 1 = 90Clockwise
	REM 2 = 90CounterClockwise
	REM 3 = 90Clockwise and Vertical Flip	
	REM Use -vf "transpose=2,transpose=2" for 180 degrees.

) else (
	echo "get no one files"
)


pause