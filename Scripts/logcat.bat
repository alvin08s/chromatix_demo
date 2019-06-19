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

adb logcat -c
echo Recording...
adb logcat -vtime > LOG-CAT-[%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%-%time:~3,2%-%time:~6,2%].log

adb shell sync
adb shell sync
adb shell sync


