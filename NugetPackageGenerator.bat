ECHO OFF

SET output_dir="C:\Personal\Projects\Engaze\local-nuget-server"

SET version_suffix=alpha

SET version_prefix=1.0.2

SET project_dir="C:\Personal\Projects\Engaze\Core"

SET curr_dir=%cd%"

SET version="%version_prefix%-%version_suffix%"


FOR /R %project_dir% %%G IN (*.csproj) DO (

dotnet pack %%G -p:PackageVersion=%version% -p:TargetFrameworks=netstandard2.0 --no-build --output %output_dir% --configuration Debug

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





