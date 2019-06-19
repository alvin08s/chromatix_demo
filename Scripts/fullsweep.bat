::
:: Tips   : af_fullsweep
:: Author : shiyunfeng
:: Date   : 20170929
::

adb wait-for-device
adb root
adb wait-for-device
adb remount

::adb shell setprop persist.camera.stats.disablehaf 7

::Far --> near
adb shell setprop debug.camera.af_fullsweep 1
::Far --> near --> far
::adb shell setprop debug.camera.af_fullsweep 3 

adb shell sync
adb shell sync
adb shell sync



