# chromatix_demo
Qualcomm Camera Effect Project

# Use method 

*  Download this project to your own computer

* unzip mm-camerasdk.zip and copy these files to disk C  root

* copy "buildSo&push_win_v2.2.bat" script to chromatix project and change below variables: 
<pre>
set BOARD_PLATFORM=msm8937
set HEADER_VERSION=0309
set INCLUDES_ROOT=C:\mm-camerasdk\includes
</pre> 
with your setting. 

And also, you may change the
<pre>
APP_PLATFORM=android-23 
</pre>
to meet you android version.

* run the script, the final source file located in libs\armeabi-v7a



