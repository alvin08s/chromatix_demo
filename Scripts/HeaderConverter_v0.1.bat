::
:: Tips   : For windows build bin files
:: Author : shiyunfeng
:: Date   : 20181102
::

@echo off
@echo ------------------------
@echo    HeaderConverting...
@echo.

:: Defined by user
set HeaderConverter_POS="C:\Program Files\Qualcomm\Chromatix\HeaderConverter\"
set CURR_DIR=%~dp0
set INPUT_FILE=3a_309.h
set OUTPUT_FILE=3a_310.h

:: Optional input/output header data version in hex notation (ie 0x308, 0x309, ...).
set INPUT_HEADER=0x309
set OUTPUT_HEADER=0x310

:: Must be one of 'default', 'common', 'cpp', 'swpostproc' or '3a'
set HEADER_TYPE=3a

call ^
	%HeaderConverter_POS%\HeaderConverter.exe -i %INPUT_HEADER% -o %OUTPUT_HEADER% -t %HEADER_TYPE% %INPUT_FILE% %OUTPUT_FILE%

@echo.
@echo    HeaderConverter Finished!
@echo ------------------------

pause
