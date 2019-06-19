REM TCP Connections
adb wait-for-device
adb root
adb wait-for-device
adb remount
adb shell setprop persist.vendor.camera.mobicat 2
adb shell setprop persist.vendor.camera.global.debug 1
adb shell setprop persist.vendor.camera.stats.debug 4294967295
adb shell setprop persist.vendor.camera.stats.debugexif 4294967295
pause