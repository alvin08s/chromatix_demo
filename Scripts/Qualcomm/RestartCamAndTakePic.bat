:: #########################################################################
:: # File Name: 
:: # Author: Alvin
:: # mail: shiyunfeng@huaqin.com
:: # Created Time: Tue 20 Jun 2017 03:46:02 PM CST
:: #########################################################################

adb wait-for-device
adb root
adb wait-for-device
adb remount

echo off

echo unlocking and starting camera app
adb shell input keyevent 82
timeout 2 >nul
adb shell input keyevent 82
timeout 2 >nul
adb shell svc power stayon true
REM Start camera 
REM adb shell "am start -n org.codeaurora.snapcam/com.android.camera.CameraLauncher"
adb shell "am start -a android.media.action.STILL_IMAGE_CAMERA --ei android.intent.extras.CAMERA_FACING 0"

pause

@echo.
@echo Take Picture and delete image
@echo.
adb shell input keyevent 27
timeout /t 3
adb pull /sdcard/dcim/camera .
adb shell rm -rf /sdcard/dcim/camera/*.jpg

SLEEP 10

@echo.
@echo Closing Camera Application
@echo.
adb shell "am force-stop org.codeaurora.snapcam"
SLEEP 10


