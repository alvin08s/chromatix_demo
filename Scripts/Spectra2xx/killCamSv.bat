::
:: Tips   : For windows only, Kill Camera Service and then you need not to reboot device
:: Author : shiyunfeng
:: Date   : 20190131
::

@echo off
@echo ------------------------
@echo    Kill Camera Service...
@echo ------------------------
@echo.


:: kill media sv, and then you need not to reboot the device

adb shell "ps -A | grep  cameraserver | awk '{print $2}' | xargs kill -9"

adb shell sync
adb shell sync
adb shell sync

