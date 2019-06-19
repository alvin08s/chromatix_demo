::
:: Tips   : For windows build library source files
:: Author : shiyunfeng
:: Date   : 20180123
::

@echo off
@echo ------------------------
@echo    Init env Starts...
@echo ------------------------

:: Defined by user
set INCLUDES_ROOT=C:\mm-camerasdk\includes

mkdir C:\mm-camerasdk
xcopy includes C:\mm-camerasdk /s /e

@echo.
@echo ------------------------
@echo    Init env End...
@echo ------------------------

pause
