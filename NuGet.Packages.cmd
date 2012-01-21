:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: NuGet packages are not in git so update all if build fails              ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF
SETLOCAL
CLS

GOTO Main

ECHO nuget install packages.config -o ..\packages

:Directory
	PUSHD "%~1"
	IF EXIST ".\packages.config" (
		nuget install packages.config -o ..\packages
	)
	
	FOR /f "tokens=*" %%d IN ('DIR /AD /B .') DO (
		CALL :Directory "%%~d"
	)
	POPD
EXIT /B 0

:Main
	CALL :Directory "%~dp0"
	TIMEOUT 3
EXIT /B 0