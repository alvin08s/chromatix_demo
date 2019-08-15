::
:: Tips   : For windows build library source files
:: Author : shiyunfengchn@126.com
:: Date   : 20180123
::

:: 版本更新记录
:: =============================================================================================
:: 版本号：V3.0
:: 更新日期：2019-07-29 
:: 更新内容：1、修改描述为中文；2、修改大版本号为3.0(此版本以及之后均为中文描述)
::

:: 版本号：V3.1
:: 更新日期：2019-08-09 
:: 更新内容：1、添加ABI的相关说明
::
:: =============================================================================================

@echo off
REM 设置后续指令使用的编码为：UTF-8编码
chcp 65001

:: 使用前提：ndk-build配置成功并能成功运行
:: 具体配置参考文档：https://blog.csdn.net/alvin08/article/details/87884888
@echo ------------------------
@echo    Build Starts...
@echo ------------------------
@echo.
@echo ndk-build version:
@echo ------------------------
call ndk-build -v
@echo ------------------------

:: 【用户定义部分】【开始】
:: =============================================================================================
:: 目前支持平台列表：MSM8937/MSM8953/msm8976/SDM450/SDM636/SDM660

:: 定义当前使用的平台，具体支持的平台，可在mm-camerasdk\includes下查看
set BOARD_PLATFORM=sdm450

:: 定义当前使用的头文件版本，具体支持的头文件版本，可在mm-camerasdk\includes\PLATFORM\下查看
set HEADER_VERSION=0309

:: 定义当前头文件所放的位置，根据自己所放的位置修改
set INCLUDES_ROOT=C:\mm-camerasdk\includes

:: 定义当前项目使用的Android版本，这部分需要如实填写，若使用了较低的Android版本编译，可能会导致相机Crash
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Select APP_PLATFORM:
:: API Level 24 - Android 7.0 Nougat    - android-24
:: API Level 25 - Android 7.1 Nougat    - android-25
:: API Level 26 - Android 8.0 Oreo      - android-26
:: API Level 27 - Android 8.1 Oreo      - android-27
:: API Level 28 - Android 9.0 Pie       - android-28
:: API Level 29 - Android 10.0 Q        - android-29
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set ANDROID_VERSION=android-24

:: 修改当前平台的ARM版本，这部分通过编译Android代码的时候查看TARGET_2ND_ARCH_VARIANT获得
:: 可选择如下：
::    for abi in armeabi-v7a arm64-v8a x86 x86_64; do
::        ndk-build APP_ABI=$abi
::    done
:: 注：armeabi-v7a向下兼容armeabi，并且罪行NDK已经不支持armeabi了
set APP_ABI=armeabi-v7a
:: =============================================================================================
:: 【用户定义部分】【结束】



:: 【如下部分代码请勿修改，除非能明白具体含义】

@echo ------------------------
@echo 提醒 : 是否确实已经修改好了对应的变量？否则错误的库文件可能导致相机打开出错。。。
@echo ------------------------

rem timeout /t 3

set CURR_DIR=%~dp0
set is-vendor-board-platform=true

call ^
    ndk-build ^
    APP_ABI=%APP_ABI% ^
    APP_PLATFORM=%ANDROID_VERSION% ^
    APP_ALLOW_MISSING_DEPS=true ^
    LOCAL_C_INCLUDES=%INCLUDES_ROOT%\%BOARD_PLATFORM%\%HEADER_VERSION% ^
    NDK_PROJECT_PATH=%CURR_DIR% ^
    APP_BUILD_SCRIPT=%CURR_DIR%\Android.mk ^
    -B -k %1 -j24

@rd /s /q obj
@echo.
@echo ------------------------
@echo    Build Finished!
@echo ------------------------

pause
