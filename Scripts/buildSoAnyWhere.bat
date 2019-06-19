::
:: Tips  :For windows build library source files
:: Author:shiyunfeng
:: Date  :20170929
::

@echo off
@echo ------------------------
@echo    Build Starts...
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
    -B -k %1 -j8
	
@echo ------------------------
@echo    Build Finished!
@echo ------------------------

pause
