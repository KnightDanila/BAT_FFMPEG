@echo off

echo %1
echo For multiple files
echo %*

set COUNTER=0
echo FOR_START
for %%x in (%*) do (
	echo %%x
	set /A COUNTER+=1
)
echo %COUNTER%
echo FOR_END

if %COUNTER% GTR 0 (
	if %COUNTER% EQU 1 (
		echo "get one file"
	) else (
		echo "get multi files: %COUNTER% files"
	)
) else (
	echo "get no one files"
)

pause