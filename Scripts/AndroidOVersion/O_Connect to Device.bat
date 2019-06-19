REM TCP Connections
adb wait-for-device
adb root
adb wait-for-device
adb remount
REM Enable sockets
adb shell setenforce 0
REM Enable eztune
adb shell setprop persist.camera.eztune.enable 1
adb shell setprop persist.vendor.camera.eztune.enable 1
REM Enable Raw snapshot
REM Forward EzTune ports
adb forward tcp:55555 tcp:55555
adb forward tcp:55556 tcp:55556
pause