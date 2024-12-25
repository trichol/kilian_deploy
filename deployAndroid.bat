@echo off
:: Define the function to replace directories
set SOURCE_DIR=E:\WORK\PROJETS\WORKSPACE\kilian_flutter_export
set DEST_DIR=E:\WORK\PROJETS\WORKSPACE


:replace_directory
REM Parameters: %1 = Source Directory, %2 = Destination Directory
set "source=%1"
set "destination=%2"

echo Replacing %destination% with %source%...

REM Remove the destination directory and its contents
if exist "%destination%" (
    rmdir /S /Q "%destination%"
)

REM Copy the source directory to the destination
xcopy "%source%" "%destination%" /E /H /C /I

if %ERRORLEVEL% EQU 0 (
    echo Directory replacement completed successfully!
) else (
    echo Error occurred during directory replacement!
)

exit /b
:: End of function

:: Call the function
call :replace_directory "%SOURCE_DIR%\kilian_deploy\android\mipmap-hdpi" "%DEST_DIR%\kilian\android\app\src\main\res\mipmap-hdpi"
call :replace_directory "%SOURCE_DIR%\kilian_deploy\android\mipmap-mdpi" "%DEST_DIR%\kilian\android\app\src\main\res\mipmap-mdpi"
call :replace_directory "%SOURCE_DIR%\kilian_deploy\android\mipmap-xhdpi" "%DEST_DIR%\kilian\android\app\src\main\res\mipmap-xhdpi"
call :replace_directory "%SOURCE_DIR%\kilian_deploy\android\mipmap-xxhdpi" "%DEST_DIR%\kilian\android\app\src\main\res\mipmap-xxhdpi"
call :replace_directory "%SOURCE_DIR%\kilian_deploy\android\mipmap-xxxhdpi" "%DEST_DIR%\kilian\android\app\src\main\res\mipmap-xxxhdpi"

pause
