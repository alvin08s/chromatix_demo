:: #########################################################################
:: # File Name: 
:: # Author: Alvin
:: # mail: shiyunfeng@huaqin.com
:: # Created Time: Mon 20 Aug 2018 07:12:02 PM CST
:: #########################################################################

REM TCP Connections

:: @
:: How To enable Dump only for MFNR offline pipeline intermediate buffers
:: @
adb wait-for-device
adb root
adb wait-for-device
adb remount

echo backup camxoverridesettings file
adb pull /vendor/etc/camera/camxoverridesettings.txt ..\

timeout 1 > nul
notepad++.exe ..\camxoverridesettings.txt
pause
adb root
adb remount
adb push ..\camxoverridesettings.txt /vendor/etc/camera/

:: kill media sv, and then you need not to reboot the device

adb shell "ps -A | grep  cameraserver | awk '{print $2}' | xargs kill -9"

adb shell sync
adb shell sync
adb shell sync




