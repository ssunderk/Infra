ECHO OFF

SETLOCAL=ENABLEDELAYEDEXPANSION

    REN NugetVersionNumber.txt text.tmp
    FOR /f %%a in (text.tmp) do (
        SET ver=%%a 			
        ) 
SET /A VersionNumber=!ver!+1
ECHO %VersionNumber% >> NugetVersionNumber.txt
DEL text.tmp


SET output_dir="local-nuget-repo"


SET version_suffix=alpha

SET version_prefix=1.0.%VersionNumber%

SET project_dir="..\..\Core"

SET curr_dir=%cd%"

SET version="%version_prefix%-%version_suffix%"


FOR /R %project_dir% %%G IN (*.csproj) DO (

dotnet pack %%G -p:PackageVersion=%version% --no-build --output %output_dir% --configuration Debug

)

ECHO %errorlevel%
IF %errorlevel% NEQ 0 GOTO ERROR

FOR %%G in ("%output_dir%\*.nupkg") DO (
nuget add %%G -source %output_dir%
)

ECHO %errorlevel%
IF %errorlevel% NEQ 0 ( GOTO ERROR )
GOTO OK

:ERROR
ECHO ON
ECHO "Program failed, please check this log file for errors ..."
ECHO OFF
GOTO END

:OK
ECHO ON
ECHO "Program successful"
ECHO OFF
GOTO END

:END
CD %curr_dir%





