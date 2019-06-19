:: #########################################################################
:: # File Name: simulation.sh
:: # Author: Alvin
:: # mail: shiyunfeng@huaqin.com
:: # Created Time: Thu 20 Feb 2019 09:46:02 AM CST
:: #########################################################################

@echo off

setlocal EnableDelayedExpansion
:: If you want to change other format file name,just change below variable 
set imageFormat=yuv

:: Do not change below message
set /p fileName=Input user-defined file name:
set /a var=0

if defined fileName (
	for /f %%i in ('dir /b *.%imageFormat%') do (
		::call echo ren %%i !fileName!_!var!.%imageFormat%
		call ren %%i !fileName!_!var!.%imageFormat%
		set /a var += 1
	)
) else echo "Just rename the files"
)

timeout /t 1
