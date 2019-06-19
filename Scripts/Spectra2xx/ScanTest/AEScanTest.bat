@echo off

echo PREREQUISITE: Display sleep > 5 min time out

echo switching to root priviledges
adb root
adb wait-for-device
adb remount
adb wait-for-device

echo remove existing csv if any for both 845 and 855 devices in two different folders
adb shell rm /data/vendor/camera/*.csv
adb shell rm /data/misc/camera/*.csv

echo enable AE scan
adb shell "echo enableAEScan=0x3F >> /vendor/etc/camera/camxoverridesettings.txt"
timeout 5 >nul

echo rebooting
adb reboot
timeout 5 >nul
adb wait-for-device

echo device back online; switching to root priviledges again
echo waiting before unlock: 12
timeout 1 >nul
echo waiting before unlock: 11
timeout 1 >nul
echo waiting before unlock: 10
timeout 1 >nul
echo waiting before unlock: 9
timeout 1 >nul
echo waiting before unlock: 8
timeout 1 >nul
echo waiting before unlock: 7
timeout 1 >nul
echo waiting before unlock: 6
timeout 1 >nul
echo waiting before unlock: 5
timeout 1 >nul
echo waiting before unlock: 4
timeout 1 >nul
echo waiting before unlock: 3
timeout 1 >nul
echo waiting before unlock: 2
timeout 1 >nul
echo waiting before unlock: 1
timeout 1 >nul

adb root
adb wait-for-device
adb remount
adb wait-for-device

echo unlocking and starting camera app
adb shell input keyevent 82
timeout 2 >nul
adb shell input keyevent 82
timeout 2 >nul
adb shell svc power stayon true
pause
adb shell am start -a android.media.action.IMAGE_CAPTURE
::adb shell "am start -a android.media.action.STILL_IMAGE_CAMERA"

echo waiting 2 minutes for test to complete. Keep an eye on the camera: is the exposure changing
timeout 60 >nul
echo still waiting; 1 minute to go
timeout 60 >nul

echo pulling csv file to computer
adb pull /data/vendor/camera/ .
adb pull /data/misc/camera/ .

echo removing custom setting file that triggered AE scan
adb shell rm /vendor/etc/camera/camxoverridesettings.txt
adb reboot


echo end of script
pause