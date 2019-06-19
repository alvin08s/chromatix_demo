::
:: Tips   : Restart mediaserver when pushed library source files to mobile phone.
:: Author : shiyunfeng
:: Date   : 20170929
::

adb wait-for-device
adb root
adb wait-for-device
adb remount

::Get by adb shell ps -A | grep camera
adb shell "am force-stop org.codeaurora.snapcam"
adb shell "am force-stop com.huawei.camera"
adb shell "am force-stop mm-qcamera-daemon"
adb shell "am force-stop com.zui.camera"

adb shell stop media
adb shell start media
adb shell stop qcamerasvr
adb shell start qcamerasvr
adb shell sync
adb shell sync
adb shell sync



