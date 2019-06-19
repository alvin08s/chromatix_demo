:: #########################################################################
:: # File Name: 
:: # Author: Alvin
:: # mail: shiyunfeng@huaqin.com
:: # Created Time: Mon 20 Aug 2018 07:12:02 PM CST
:: #########################################################################

REM TCP Connections

:: @
:: How To enable Dump only for MFNR offline pipeline intermediate buffers
:: @
adb wait-for-device
adb root
adb wait-for-device
adb remount

echo backup camxoverridesettings file
adb pull /vendor/etc/camera/camxoverridesettings.txt .
SLEEP 10
adb shell "echo reprocessDump=TRUE >> /vendor/etc/camera/camxoverridesettings.txt"
adb shell "echo autoImageDump=TRUE >> /vendor/etc/camera/camxoverridesettings.txt"

::0x1: IFE outputs
::0x2: IPE outputs
::0x4: BPS outputs
::0x8: jPEG outputs
adb shell "echo autoImageDumpMask=0x1 >> /vendor/etc/camera/camxoverridesettings.txt"

:: Dump offline processing output images for all enabled nodes.
adb shell "echo offlineImageDumpOnly=TRUE >> /vendor/etc/camera/camxoverridesettings.txt"
pause
adb reboot


