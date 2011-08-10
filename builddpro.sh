#!/bin/bash
source /etc/profile
FILENAME="CM4DPro-nightly-`date +%F`.zip"
OUTPUT="/home/x13thangelx/android/cm4d2g/out/target/product/venus2"
SCRIPTS="/home/x13thangelx/android/Scripts/"
OPTIMIZED="update-cm-7.1.0-RC1-venus2-KANG-signed.zip"
NONOPTIMIZED="cyanogen_venus2-ota-eng.x13thangelx.zip"
FILEURL="http://x13thangelx.synik4l.net/$FILENAME"

cd /home/x13thangelx/android/cm4d2g

function build {
repo sync -j16
bash $SCRIPTS/applycmpatchs.sh
source build/envsetup.sh
export CYANOGEN_NIGHTLY=true
make clobber
CYANOGEN_NIGHTLY=true brunch venus2
}

build
