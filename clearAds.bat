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
echo ===== Xiaomi reklam es bloat eltavolito =====
echo.

"%ADB%" devices

echo.
echo ===== Eltavolitas indul =====
echo.

call :REMOVE com.miui.analytics "Analytics"
call :REMOVE com.miui.android.fashiongallery "Wallpaper Carousel"
call :REMOVE com.miui.bugreport "Bugreport"
call :REMOVE com.miui.daemon "Daemon"
call :REMOVE com.miui.msa.global "MSA"

call :REMOVE com.xiaomi.discover "Discover"
call :REMOVE com.xiaomi.mipicks "GetApps"
call :REMOVE com.xiaomi.ugd "Xiaomi User Growth"

echo ----------------------------------------
echo.
echo ===== Kesz =====
echo.
pause
exit /b

:REMOVE
echo ----------------------------------------
echo %~2
echo Package: %~1
"%ADB%" shell pm uninstall --user 0 %~1
exit /b