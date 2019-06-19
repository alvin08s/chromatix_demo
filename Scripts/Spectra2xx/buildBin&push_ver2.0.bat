::
:: Tips   : For windows build bin files, when pushed done, the device will be reboot after 3 seconds
:: Author : shiyunfeng
:: Date   : 20190108
::

@echo off
@echo ------------------------
@echo    Build Starts...
@echo ------------------------
@echo.

set CURR_DIR=%~dp0

:: Defined by user >>> must change!!!!!!
:: set ParameterParser programe's location
set ParameterParser_POS=D:\Qualcomm\ParameterParser\x64
:: set sensor name, which can be found like this : com.qti.tuned.xxx.bin (xxx is the characters set here)
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

echo Push finished,waiting...

adb shell sync
adb shell sync
adb shell sync

timeout /t 3

adb reboot
