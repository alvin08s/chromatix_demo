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

:: AEC log 	0x02000000
:: AWB log 	0x04000000
:: AF  log 	0x08000000
adb shell "echo enable3ADebugData=TRUE >> /vendor/etc/camera/camxoverridesettings.txt"
adb shell "echo logVerboseMask=0x08000000 >> /vendor/etc/camera/camxoverridesettings.txt"

pause

adb reboot
