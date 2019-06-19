:: #########################################################################
:: # File Name: 
:: # Author: Alvin
:: # mail: shiyunfeng@huaqin.com
:: # Created Time: Tue 26 Jul 2018 05:46:02 PM CST
:: #########################################################################

REM TCP Connections
adb wait-for-device
adb root
adb wait-for-device
adb remount
adb shell "echo logVerboseMask=0x2 >> /vendor/etc/camera/camxoverridesettings.txt"
adb shell "echo logInfoMask=0x2 >> /vendor/etc/camera/camxoverridesettings.txt" 
pause
adb reboot


