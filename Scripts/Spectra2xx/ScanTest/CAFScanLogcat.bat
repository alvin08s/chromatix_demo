adb logcat -c
adb logcat -vtime > %1
REM Timeout for log to finish writing
timeout 10
exit