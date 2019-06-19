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
set BOARD_PLATFORM=msm8937
set HEADER_VERSION=0309

:: Do not modify !!!
set CURR_DIR=%~dp0
set is-vendor-board-platform=true

call ^
    ndk-build ^
    APP_ABI=armeabi ^
    APP_PLATFORM=android-23 ^
    APP_ALLOW_MISSING_DEPS=true ^
    LOCAL_C_INCLUDES=%INCLUDES_ROOT%\%BOARD_PLATFORM%\%HEADER_VERSION% ^
    NDK_PROJECT_PATH=%CURR_DIR% ^
    APP_BUILD_SCRIPT=%CURR_DIR%\Android.mk ^
    -B -k %1 -j8

@echo.
@echo ------------------------
@echo    Build Finished!
@echo ------------------------

pause
