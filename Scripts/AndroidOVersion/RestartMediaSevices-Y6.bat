REM TCP Connections
adb wait-for-device
adb root
adb wait-for-device
adb remount

adb shell "am force-stop org.codeaurora.snapcam"
adb shell "am force-stop com.huawei.camera"
adb shell "am force-stop mm-qcamera-daemon"
adb shell stop media
adb shell start media
adb shell stop qcamerasvr
adb shell start qcamerasvr
adb shell sync
adb shell sync
adb shell sync

