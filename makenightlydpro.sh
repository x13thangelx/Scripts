#!/bin/bash
source /etc/profile
FILENAME="CM4DPro-nightly-`date +%F`.zip"
OUTPUT="/home/x13thangelx/android/cm4d2g/out/target/product/venus2"
SCRIPTS="/home/x13thangelx/android/Scripts/"
HOME="/home/x13thangelx"
OPTIMIZED="update-cm-7.1.0-RC1-venus2-KANG-signed.zip"
NONOPTIMIZED="cyanogen_venus2-ota-eng.x13thangelx.zip"
FILEURL="http://x13thangelx.synik4l.net/$FILENAME"

cd /home/x13thangelx/android/cm4d2g

function build {
#repo sync -j16
bash $SCRIPTS/applycmpatchs.sh
source build/envsetup.sh
export CYANOGEN_NIGHTLY=true
make clobber
CYANOGEN_NIGHTLY=true 
brunch venus2
}

build

function fuckit {
    $HOME/twitter "#cm4dpro nightly failed to build :( @RevNumbers or @x13thangelx will fix when they can"
    source $SCRIPTS/log.sh
}

function upload {
    mv $OUTPUT/$CORRECTFILENAME $OUTPUT/$FILENAME
     MD5="$(md5sum $FILENAME)"
    lftp -c "
    open (insert ftp information here)
    put $FILENAME
    "
    $HOME/twitter "#cm4dpro nightly available at http://x13thangelx.synik4l.net/$FILENAME"
    $SCRIPTS/twitter "#cm4dpro md5sum: $MD5"
    source $SCRIPTS/log.sh
}

#TURN IT INTO A FUNCTION

function uploadandtweet {
if [ -f $OUTPUT/$CORRECTFILENAME ]
  then
    upload
  else
    fuckit
fi
}
cd $OUTPUT

if [ -f $OUTPUT/$OPTIMIZED ]
  then
    CORRECTFILENAME=$OPTIMIZED
    uploadandtweet
  elif [ -f $OUTPUT/$NONOPTIMIZED ]
   then 
    CORRECTFILENAME=$NONOPTIMIZED
    uploadandtweet
  else
    echo "fuckin' A, something went wrong hoss"
    fuckit
fi

