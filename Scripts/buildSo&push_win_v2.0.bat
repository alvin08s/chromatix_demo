::
:: Tips   : For windows build library source files
:: Author : shiyunfeng
:: Date   : 20180123
::

@echo off
@echo ------------------------
@echo    Build Starts...
@echo ------------------------
@echo.
@echo ndk-build version:
@echo ------------------------
call ndk-build -v
@echo ------------------------

:: Defined by user
set INCLUDES_ROOT=C:\mm-camerasdk\includes
set BOARD_PLATFORM=msm8953
set HEADER_VERSION=0309

:: Do not modify !!!
set CURR_DIR=%~dp0
set is-vendor-board-platform=true

call ^
    ndk-build ^
    APP_ABI=armeabi-v7a ^
    APP_PLATFORM=android-24 ^
    APP_ALLOW_MISSING_DEPS=true ^
    LOCAL_C_INCLUDES=%INCLUDES_ROOT%\%BOARD_PLATFORM%\%HEADER_VERSION% ^
    NDK_PROJECT_PATH=%CURR_DIR% ^
    APP_BUILD_SCRIPT=%CURR_DIR%\Android.mk ^
    -B -k %1 -j8

@echo.
@echo ------------------------
@echo    Build Finished!
@echo ------------------------

echo wait-for-device...
adb wait-for-device
adb root
adb wait-for-device
adb remount

timeout /t 1

@echo.
@echo ------------------------
@echo    Start push libs to the device...
@echo ------------------------


set dir=%~dp0
for /r %dir%\libs\ %%s in (*.so) do (
::echo %%s
adb push %%s /system/vendor/lib/
)

::Get by adb shell ps -A | grep camera
adb shell "am force-stop org.codeaurora.snapcam"
adb shell "am force-stop com.huawei.camera"
adb shell "am force-stop mm-qcamera-daemon"

echo Push finished,waiting...

adb shell stop media
adb shell start media
adb shell stop qcamerasvr
adb shell start qcamerasvr
adb shell sync
adb shell sync
adb shell sync

pause
