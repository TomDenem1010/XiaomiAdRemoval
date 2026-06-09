@echo off
setlocal

set ADB=%~dp0platform-tools\adb.exe

if not exist "%ADB%" (
    echo HIBA: Nem talalhato az adb.exe
    echo Elvart hely: %ADB%
    pause
    exit /b 1
)

echo.
echo ===== Xiaomi Bloatware Remover =====
echo.

"%ADB%" devices

echo.
echo ===== START =====
echo.

call :REMOVE com.google.android.apps.tachyon "Google Meet"
call :REMOVE com.google.android.apps.subscriptions.red "Google One"
call :REMOVE com.google.android.apps.youtube.music "Youtube Music"
call :REMOVE com.google.android.videos "Google TV"

echo ----------------------------------------
echo.
echo ===== END =====
echo.
pause
exit /b

:REMOVE
echo ----------------------------------------
echo %~2
echo Package: %~1
"%ADB%" shell pm uninstall --user 0 %~1
exit /b