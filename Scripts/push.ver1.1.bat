::
:: Tips   : Push library source files to mobile phone.
:: Author : shiyunfeng
:: Date   : 20170929
::

REM TCP Connections
adb wait-for-device
adb root
adb wait-for-device
adb remount

set dir=%~dp0
for /r %dir% %%s in (*.so) do (
:echo %%s
adb push %%s /system/vendor/lib/
)


adb shell am force-stop com.asus.camera
adb shell am force-stop org.codeaurora.snapcam
adb shell stop media
adb shell start media
adb shell stop qcamerasvr
adb shell start qcamerasvr
adb shell sync
adb shell sync
adb shell sync

