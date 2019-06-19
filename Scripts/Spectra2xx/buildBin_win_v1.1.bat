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

pause
