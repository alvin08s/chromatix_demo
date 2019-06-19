::
:: Tips   : Restart mediaserver when pushed library source files to mobile phone.
:: Author : shiyunfeng
:: Date   : 20170929
::

adb wait-for-device
adb root
adb wait-for-device
adb remount

::adb shell setprop persist.vendor.camera.stats.disablehaf 7

::Far --> near
::adb shell setprop debug.camera.af_fullsweep 1
adb shell setprop vendor.debug.camera.af_fullsweep 1
::Far --> near --> far
::adb shell setprop debug.camera.af_fullsweep 3 

adb shell sync
adb shell sync
adb shell sync



