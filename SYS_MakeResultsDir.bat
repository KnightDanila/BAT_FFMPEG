REM Creating the Results Directory for GIFs, Movies, and other files using the argument %1.

@echo off

REM echo %CD%
REM echo %~dp0
cd /d %~dp0
REM ECHO. & ECHO ******* BAT FILE ******* 
REM ECHO %~nx0 
REM ECHO ************************ & ECHO.

REM For first file
REM %1
REM For multiple files
REM echo %*

set COUNTER=0
for %%x in (%*) do (
	REM echo %%x
	set /A COUNTER+=1
)

if %COUNTER% GTR 0 (
    set RESULTS_DIR=%1
    if not exist %RESULTS_DIR% (
    	mkdir %RESULTS_DIR%
    	if exist %RESULTS_DIR% (
    		echo A folder named %RESULTS_DIR% for results has been created.
    	) else (
    		echo Error: Unable to create the %RESULTS_DIR% folder for results.
    		echo Please create a folder with the name %RESULTS_DIR% manually, and then try again.
    	)
    ) else (
    		echo The Results Directory: %RESULTS_DIR%.
	 )
	 echo.
) else (
	echo COUNTER = %COUNTER%
	echo _____GET NO ONE ARGS_____
	echo.
)

REM pause