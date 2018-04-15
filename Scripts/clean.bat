::
:: Tips   : Clean build files
:: Author : shiyunfeng
:: Date   : 20170929
::

@echo off
@echo ------------------------
@echo    Clean Starts...
@echo ------------------------

@echo ------------------------
call ndk-build -v
@echo ------------------------

call ^
	ndk-build ^
    NDK_PROJECT_PATH=. ^
    APP_BUILD_SCRIPT=./Android.mk ^
    APP_ABI=armeabi ^
    APP_PLATFORM=android-23 ^
    APP_ALLOW_MISSING_DEPS=true ^
    -B -k -j8 clean
	
@echo ------------------------
@echo    clean Finished!
@echo ------------------------

pause
