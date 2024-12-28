@echo off
:: Define the base directories
set "SOURCE_DIR=E:\WORK\PROJETS\WORKSPACE\kilian_flutter_export"
set "DEST_DIR=E:\WORK\PROJETS\WORKSPACE\kilian_flutter_export"

echo Source Directory: %SOURCE_DIR%
echo Destination Directory: %DEST_DIR%

cd /d %DEST_DIR%\kilian

git reset --hard HEAD
git pull
git log --oneline -5
 

:: Call the function for each directory
call :replace_directory "%SOURCE_DIR%\kilian_deploy\android\mipmap-hdpi" "%DEST_DIR%\kilian\android\app\src\main\res\mipmap-hdpi"
call :replace_directory "%SOURCE_DIR%\kilian_deploy\android\mipmap-mdpi" "%DEST_DIR%\kilian\android\app\src\main\res\mipmap-mdpi"
call :replace_directory "%SOURCE_DIR%\kilian_deploy\android\mipmap-xhdpi" "%DEST_DIR%\kilian\android\app\src\main\res\mipmap-xhdpi"
call :replace_directory "%SOURCE_DIR%\kilian_deploy\android\mipmap-xxhdpi" "%DEST_DIR%\kilian\android\app\src\main\res\mipmap-xxhdpi"
call :replace_directory "%SOURCE_DIR%\kilian_deploy\android\mipmap-xxxhdpi" "%DEST_DIR%\kilian\android\app\src\main\res\mipmap-xxxhdpi"




REM Build APK in release mode
flutter build apk --release

REM Build AppBundle in release mode
flutter build appbundle --release



REM Pause to see the output
pause


:: Function to replace directories
:replace_directory
REM Parameters: %1 = Source Directory, %2 = Destination Directory
set "source=%~1"
set "destination=%~2"

REM Debugging output
echo Source: "%source%"
echo Destination: "%destination%"

REM Check if source exists
if not exist "%source%" (
    echo Error: Source directory does not exist: "%source%"
    exit /b
)

REM Remove the destination directory
if exist "%destination%" (
    echo Removing existing destination: "%destination%"
    rmdir /S /Q "%destination%"
)

REM Copy source to destination
echo Copying files from "%source%" to "%destination%"...
xcopy "%source%" "%destination%" /E /H /C /I

if %ERRORLEVEL% EQU 0 (
    echo Directory replacement completed successfully!
) else (
    echo Error occurred during directory replacement!
)

exit /b

:: End of function

pause
