@echo off

echo Start MacroToInfinity CAF Scan Test

echo Wait for device
adb wait-for-device root
adb wait-for-device remount

echo. 

echo SetProp for MacroToInfinity Fullsweep

REM Modify Fullsweep based on Need
REM Fullsweep instruction:
REM 0 - Disabled
REM 1 - InfinityToMacro
REM 2 - MacroToInfinity
REM 3 - BothDirection

adb shell "echo logInfoMask=0x8000000 >> /vendor/etc/camera/camxoverridesettings.txt" 
adb shell "echo afFullsweep=2 >> /vendor/etc/camera/camxoverridesettings.txt" 

REM SetProp
REM adb shell setprop vendor.debug.camera.af.fullsweep 1
REM adb shell setprop persist.vendor.camera.logInfoMask 0x8000000

echo Reboot
adb reboot

echo Start logcat in another process

REM Set desired log name here
set logName=CAFScanTest.log


START CMD /K CALL "CAFScanLogcat.bat" %logName%
adb wait-for-device root
adb wait-for-device remount

echo Turning on Device Open Camera
adb shell input keyevent 82
timeout 2 >nul
adb shell input keyevent 82
timeout 2 >nul
adb shell svc power stayon true
REM Start camera 
adb shell am start -a android.media.action.STILL_IMAGE_CAMERA --ei android.intent.extras.CAMERA_FACING 0

echo.
echo Once focus is finished, press any key to continue
echo.
echo.
pause

REM after focus
REM adb shell setprop vendor.debug.camera.af.fullsweep 0
REM adb shell setprop persist.vendor.camera.logInfoMask 0x0

adb shell input keyevent 4
timeout 2 >nul
adb shell rm /vendor/etc/camera/camxoverridesettings.txt
adb reboot