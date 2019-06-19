::
:: Tips   : For windows build bin files
:: Author : shiyunfeng
:: Date   : 20181102
::

@echo off
@echo ------------------------
@echo    Build Starts...
@echo ------------------------
@echo.

:: Defined by user
set ParameterParser_POS=D:\Qualcomm\ParameterParser\x64
set CURR_DIR=%~dp0
set BIN_NAME=sunny_ov8856

call ^
	%ParameterParser_POS%\ParameterParser.exe com.qti.tuned.%BIN_NAME%.bin p %CURR_DIR%

@echo.
@echo ------------------------
@echo    Build Finished!
@echo ------------------------

timeout /t 3

echo wait-for-device...
adb wait-for-device
adb root
adb wait-for-device
adb remount

set dir=%~dp0
for /r %dir% %%s in (*.bin) do (
::echo %%s
adb push %%s /system/vendor/lib/camera/
adb push %%s /system/vendor/lib64/camera/
)

::Get by adb shell ps -A | grep camera
adb shell "am force-stop org.codeaurora.snapcam"
adb shell "am force-stop mm-qcamera-daemon"

echo Push finished,waiting...

adb shell stop media
adb shell start media
adb shell stop qcamerasvr
adb shell start qcamerasvr
adb shell sync
adb shell sync
adb shell sync

pause
adb reboot
