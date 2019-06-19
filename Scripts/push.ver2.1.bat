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
for /r %dir% %%s in (*.so) do (
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
