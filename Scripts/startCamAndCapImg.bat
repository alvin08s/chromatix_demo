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


adb shell sync
adb shell sync
adb shell sync
adb shell input keyevent 82
adb shell sync
adb shell sync
adb shell sync
adb shell am start -a android.media.action.STILL_IMAGE_CAMERA --ei android.intent.extras.CAMERA_FACING 0

pause

adb shell sync
adb shell sync
adb shell sync
adb shell input keyevent 27
adb shell sync
adb shell sync
adb shell sync
timeout /t 3

adb pull /sdcard/DCIM/Camera/ .
adb shell rm -rf /sdcard/DCIM/Camera/*.*
adb shell ls -l /sdcard/DCIM/Camera/

adb shell sync
adb shell sync
adb shell sync
adb shell input keyevent 26
adb shell sync

