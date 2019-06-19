REM TCP Connections
adb wait-for-device
adb devices
adb disable-verity

timeout /t 1

adb reboot

timeout /t 3
echo waiting devices rebooting down...
adb wait-for-device
adb root
adb wait-for-device
adb remount

adb shell "echo enable3ADebugData=TRUE >> /vendor/etc/camera/camxoverridesettings.txt"
adb shell "echo enableTuningMetadata=TRUE >> /vendor/etc/camera/camxoverridesettings.txt"

:: Confirm data was properly set
adb shell cat /vendor/etc/camera/camxoverridesettings.txt

timeout /t 3
adb reboot