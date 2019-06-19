::
:: Tips   : For windows create new folder based on local date and time
:: Author : shiyunfeng
:: Date   : 20181017
::

:: below used to debug
::echo %date:~,10%

:: set data , this parameters depends on windows time format.
set year=%date:~0,4%
set month=%date:~5,2%
set day=%date:~8,2%

set t=%time:~,5%
set t=%t::=%
set t=%t: =0%

:: make dir with data and time
mkdir %year%%month%%day%%t%

