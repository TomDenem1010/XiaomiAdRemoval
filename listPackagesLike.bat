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
echo ===== Xiaomi Packages =====
echo.

"%ADB%" devices

echo.
echo ===== START =====
echo.

echo ----------------------------------------
set /p packageName="Enter package name: "
echo ----------------------------------------

"%ADB%" shell pm list packages | findstr /i "%packageName%"

echo ----------------------------------------
echo.
echo ===== END =====
echo.
pause
exit /b
