::
:: Tips   : For windows create new folder based on local date and time
:: Author : shiyunfeng
:: Date   : 20181017
::

::set d=%date:~,10%
set year=%date:~6,4%
set month=%date:~0,2%
set day=%date:~3,2%

set t=%time:~,5%
set t=%t::=%
set t=%t: =0%
::pause

adb shell screenrecord /sdcard/%year%%month%%day%%t%.mp4

adb shell sync
adb shell sync
adb shell sync

adb pull /sdcard/%year%%month%%day%%t%.mp4 .

adb shell sync
adb shell sync
adb shell sync


