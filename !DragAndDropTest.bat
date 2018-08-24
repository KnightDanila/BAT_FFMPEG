@echo off

echo %1
:: echo %* :: for multiple files

if NOT [%1]==[] (
	echo "get one file"
) else (
	echo "get no one files"
)

pause