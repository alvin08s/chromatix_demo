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

adb pull /sdcard/DCIM/Camera/ .
SLEEP 30
adb shell rm -rf /sdcard/DCIM/Camera/*.*
adb shell ls -l /sdcard/DCIM/Camera/

adb shell sync
adb shell sync
adb shell sync

