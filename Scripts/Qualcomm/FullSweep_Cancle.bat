::
:: Tips   : Restart mediaserver when pushed library source files to mobile phone.
:: Author : shiyunfeng
:: Date   : 20170929
::

adb wait-for-device
adb root
adb wait-for-device
adb remount

adb shell setprop debug.camera.af_fullsweep 0

adb shell sync
adb shell sync
adb shell sync



