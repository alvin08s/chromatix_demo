REM TCP Connections
adb wait-for-device
adb root
adb wait-for-device
adb remount
adb shell setprop persist.camera.mobicat 2
adb shell setprop persist.camera.global.debug 1
adb shell setprop persist.camera.stats.debug 4294901760
adb shell setprop persist.camera.stats.debugexif 4294901760

adb shell setprop persist.camera.sensor.debug 5 

adb shell setprop persist.camera.global.debug 1 
adb shell setprop persist.camera.stats.aec.debug 5

adb shell setprop persist.camera.global.debug 1 
adb shell setprop persist.camera.stats.awb.debug 5

adb shell setprop persist.camera.global.debug 1 
adb shell setprop persist.camera.stats.af.debug 5

pause