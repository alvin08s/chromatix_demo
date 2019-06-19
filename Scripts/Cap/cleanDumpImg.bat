:: #########################################################################
:: # File Name: simulation.sh
:: # Author: Alvin
:: # mail: shiyunfeng@huaqin.com
:: # Created Time: Tue 20 Jun 2017 03:46:02 PM CST
:: #########################################################################

REM TCP Connections
adb wait-for-device
adb root
adb wait-for-device
adb remount

adb shell rm -rf /sdcard/DCIM/Camera/
adb shell ls -l /sdcard/DCIM/Camera/

adb shell rm -rf /data/misc/camera/*.raw
adb shell rm -rf /data/misc/camera/*.bin
adb shell rm -rf /data/misc/camera/*.jp
adb shell ls -l /data/misc/camera/

adb shell sync
adb shell sync
adb shell sync

pause