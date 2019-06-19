adb root
SLEEP 15
adb remount
@echo.
@echo Closing Camera Application
@echo.
adb shell "am force-stop org.codeaurora.snapcam"
SLEEP 10
@echo.
@echo Deleting temporary tuning file
@echo.
adb shell "rm -rf /data/eztune_intermediate.dat"
adb shell "rm -rf /data/misc/camera/eztune_intermediate.dat"
SLEEP 5
@echo.
@echo Restarting Camera Application
@echo.
adb shell "am start -n org.codeaurora.snapcam/com.android.camera.CameraLauncher"