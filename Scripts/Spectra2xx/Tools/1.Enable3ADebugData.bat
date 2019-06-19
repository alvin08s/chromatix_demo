REM TCP Connections
adb wait-for-device
adb root
adb wait-for-device
adb remount

adb shell "echo enable3ADebugData=TRUE >> /vendor/etc/camera/camxoverridesettings.txt"
adb shell "echo enableTuningMetadata=TRUE >> /vendor/etc/camera/camxoverridesettings.txt"

:: Confirm data was properly set
adb shell cat /vendor/etc/camera/camxoverridesettings.txt

pause
adb reboot