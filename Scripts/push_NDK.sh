#########################################################################
# Author: Alvin
# mail: shiyunfeng@huaqin.com
# Created Time: Tue 13 Sep 2016 03:50:50 PM CST
#########################################################################
#!/bin/bash

set -e

if [ $# != 1 ];then
    echo "++++++++++++++++++++++++++++++++++"
    echo "Usage : $0 SensorName(lower-case)"
    echo "Example : $0 hi846"
    echo "++++++++++++++++++++++++++++++++++"
    exit 1;
fi

pTargetSo=system/vendor/lib

#MSM_VERSION=`find ./out/ -maxdepth 4 -type f -name system.img | cut -d '/' -f 5`
#pTarget=out/target/product/$MSM_VERSION/system/vendor/lib
pTarget=libs/armeabi

#cd $pTarget

files=`ls $pTarget/libchromatix_$1*.so`

echo "wait device connect..."
adb wait-for-device
#adb kill-server
adb wait-for-device
adb root
adb remount


for i in $files
do
    adb push $i $pTargetSo
    echo "Pushing >>>>> $i"
done

echo "Restart media service..."

set -x
adb shell "am force-stop com.asus.camera"
adb shell "am force-stop org.codeaurora.snapcam"
adb shell "am force-stop com.huawei.camera"
adb shell stop media
adb shell start media
adb shell stop qcamerasvr
adb shell start qcamerasvr
adb shell sync
adb shell sync
adb shell sync

echo -e "\nRestart media service done , reboot[y/n] ?"
#read x
if [ "$x" == "y" ] || [ "$x" == "Y" ];then
    adb reboot
fi

