:: #########################################################################
:: # File Name: simulation.sh
:: # Author: Alvin
:: # mail: shiyunfeng@huaqin.com
:: # Created Time: Tue 20 Jun 2017 03:46:02 PM CST
:: #########################################################################

@echo off

REM TCP Connections
adb wait-for-device
adb root
adb wait-for-device
adb remount

adb shell sync
adb shell sync
adb shell sync

echo "Input Cycle Num:"
set /p MAX_NUM=

:str
set /a n=%n%+1
adb shell input keyevent 27
timeout /t 1
if "%n%"=="%MAX_NUM%" goto end
goto str
:end

pause
