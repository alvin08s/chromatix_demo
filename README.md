# chromatix_demo
本文主要介绍使用NDK来编译高通效果库文件的方法。

适用人群：Camera Tuning工程师
适用平台：MSM8953、SDM450、SDM660等使用库文件的平台
注：不适用于camx架构的平台。

# 使用方法

* 下载这个demo工程，里面包含了一个测试工程和需要的脚本已经头文件

* 解压mm-camerasdk.zip文件，然后拷贝到C盘根目录下

* 复制脚本"buildSo&push_win_v2.2.bat"到chromatix project然后根据项目实际配置修改如下信息：
<pre>
set BOARD_PLATFORM=msm8937
set HEADER_VERSION=0309
set INCLUDES_ROOT=C:\mm-camerasdk\includes
</pre> 

同时，还需要根据当前项目使用的Android版本修改如下变量：
<pre>
APP_PLATFORM=android-23 
</pre>

* 双击脚本执行，如果不出错，会在目录libs\armeabi-v7a下生成对应的库文件



