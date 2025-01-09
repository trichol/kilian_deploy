@echo off



:: Store the argument
set "arg=%~1"


    echo Valid 2-digit number: %arg%

    set "SOURCE_DIR=E:\WORK\PROJETS\WORKSPACE\kilian_flutter_export"
    set "VERSION_DIR=E:\WORK\PROJETS\WORKSPACE\VERSION"

    :: Check if the file exists
    if exist "%VERSION_DIR%\%arg%.apk" (
        echo "%arg%.apk" exists.
    ) else (
        echo "%VERSION_DIR%\%arg%.apk" does not exist.
        exit /b 1
    )

    copy /y %VERSION_DIR%\%arg%.apk  %VERSION_DIR%\kilian.apk
    rem Path to WinSCP executable
    set WINSCP_PATH="C:\Program Files (x86)\WinSCP\WinSCP.com"
    rem Path to script file
    set SCRIPT_PATH=%SOURCE_DIR%\kilian_deploy\upload_script.txt

    rem Run WinSCP with the script
    %WINSCP_PATH% /script=%SCRIPT_PATH%

    rem Check if the upload was successful
    if %errorlevel% equ 0 (
        echo Upload succeeded.
    ) else (
        echo Upload failed.
    )
