::
:: Tips   : Push library source files to mobile phone.
:: Author : shiyunfeng
:: Date   : 20171220
::

@echo off

REM TCP Connections
echo wait-for-device...
adb wait-for-device
adb root
adb wait-for-device
adb remount

timeout /t 3

set d=%date:~,10%
set d=%d:-=%
set d=%d:/=%
set t=%time:~,8%
set t=%t::=%
set t=%t: =0%

adb logcat -c
echo Recording...
adb logcat -vtime > LOG-CAT-[%d%-%t%].log

adb shell sync
adb shell sync
adb shell sync


