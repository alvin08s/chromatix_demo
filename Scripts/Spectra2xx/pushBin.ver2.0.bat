::
:: Tips   : Push library source files to mobile phone.
:: Author : shiyunfeng
:: Date   : 20170929
::

@echo off

REM TCP Connections
echo wait-for-device...
adb wait-for-device
adb root
adb wait-for-device
adb remount

timeout /t 3

set dir=%~dp0
for /r %dir% %%s in (*.bin) do (
::echo %%s
adb push %%s /system/vendor/lib/camera/
adb push %%s /system/vendor/lib64/camera/
)

echo "Push so ..."
for /r %dir% %%s in (*.so) do (
::echo %%s
adb push %%s /system/vendor/lib/camera/
adb push %%s /system/vendor/lib64/camera/
)

::Get by adb shell ps -A | grep camera
adb shell "am force-stop org.codeaurora.snapcam"
adb shell "am force-stop mm-qcamera-daemon"

echo Push finished,waiting...

:: kill media sv, and then you need not to reboot the device
adb shell sync
adb shell sync
adb shell sync
adb shell "ps -A | grep  cameraserver | awk '{print $2}' | xargs kill -9"
adb shell sync
adb shell sync
adb shell sync


