::
:: Tips   : Get sensor name(windows)
:: Author : shiyunfeng
:: Date   : 20180306
::

@echo off
adb wait-for-device
adb root
adb wait-for-device
adb remount
adb shell cat /sys/class/video4linux/v4l-subdev*/name | findstr /V "msm* | cpp | vfe"
pause

