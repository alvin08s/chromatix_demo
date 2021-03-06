::
:: Tips   : For windows build library source files
:: Author : shiyunfeng
:: Date   : 20180123
:: Version: v2.2
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
:: Start>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
:: Support MSM8937/MSM8953/SDM450/SDM636/SDM660
:: Usage : define platform and header version 
::         depend on you project(Lower case)
set BOARD_PLATFORM=sdm450
set HEADER_VERSION=0309
:: END<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

@echo ------------------------
@echo ">>>>>>>>Warning : Already modified the platform and header version???"
@echo ------------------------

set INCLUDES_ROOT=C:\mm-camerasdk\includes

:: Do not modify !!!
set CURR_DIR=%~dp0
set is-vendor-board-platform=true

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Select APP_PLATFORM:
:: API Level 24 - Android 7.0 Nougat
:: API Level 25 - Android 7.1 Nougat
:: API Level 26 - Android 8.0 Oreo
:: API Level 27 - Android 8.1 Oreo
:: API Level 28 - Android 9.0 Pie
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

call ^
    ndk-build ^
    APP_ABI=armeabi-v7a ^
    APP_PLATFORM=android-24 ^
    APP_ALLOW_MISSING_DEPS=true ^
    LOCAL_C_INCLUDES=%INCLUDES_ROOT%\%BOARD_PLATFORM%\%HEADER_VERSION% ^
    NDK_PROJECT_PATH=%CURR_DIR% ^
    APP_BUILD_SCRIPT=%CURR_DIR%\Android.mk ^
    -B -k %1 -j8

@rd /s /q obj
@echo.
@echo ------------------------
@echo    Build Finished!
@echo ------------------------

pause
