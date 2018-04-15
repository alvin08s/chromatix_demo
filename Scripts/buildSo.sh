#########################################################################
# File Name: buildso.sh
# Author: Alvin
# mail: shiyunfeng@huaqin.com
# Created Time: Mon 02 Oct 2017 10:30:09 AM CST
#########################################################################
#!/bin/bash

x=1
if [ ${x} == 1 ];then
    time ndk-build -B -k $1 -j8
else
    ndk-build \
        NDK_PROJECT_PATH=. \
        APP_BUILD_SCRIPT=./Android.mk \
        APP_ABI=armeabi \
        APP_PLATFORM=android-23 \
        APP_ALLOW_MISSING_DEPS=true \
        -B -k $1 -j8
fi


echo "Status : $?"

