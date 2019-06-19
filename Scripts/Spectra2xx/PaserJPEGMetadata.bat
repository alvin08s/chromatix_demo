::
:: Tips   : Push library source files to mobile phone.
:: Author : shiyunfeng
:: Date   : 20170929
::

@echo off

set dir=%~dp0
for /r %dir% %%s in (*.jpg) do (
::echo %%s
::adb push %%s /system/vendor/lib/camera/
D:\Qualcomm\Chromatix7\Simulator\Spectra280\QualcommSpectraSim280.exe -metaparse %%s
)


pause




