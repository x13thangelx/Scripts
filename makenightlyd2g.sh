#!/bin/bash
source /etc/profile
FILENAME="CM4D2G-nightly-`date +%F`.zip"
OUTPUT="/home/x13thangelx/android/cm4d2g/out/target/product/droid2we"
SCRIPTS="/home/x13thangelx/android/Scripts/"
HOME="/home/x13thangelx/"
OPTIMIZED="update-cm-7.1.0-RC1-DROID2WE-KANG-signed.zip"
NONOPTIMIZED="cyanogen_droid2we-ota-eng.x13thangelx.zip"
FILEURL="http://x13thangelx.synik4l.net/$FILENAME"

cd /home/x13thangelx/android/cm4d2g

function build {
#repo sync -j16
bash $SCRIPTS/applycmpatchs.sh
source build/envsetup.sh
export CYANOGEN_NIGHTLY=true
make clobber
CYANOGEN_NIGHTLY=true brunch droid2we
}

build

function fuckit {
    $HOME/twitter "#cm4d2g nightly failed to build :( @RevNumbers or @x13thangelx will fix when they can"
    source $SCRIPTS/log.sh
}

function upload {
    mv $OUTPUT/$CORRECTFILENAME $OUTPUT/$FILENAME
     MD5="$(md5sum $FILENAME)"
    lftp -c "
    open (insert ftp information here)
    put $FILENAME
    "
    $HOME/twitter "#cm4d2g nightly available at http://x13thangelx.synik4l.net/$FILENAME"
    $HOME/twitter "#cm4d2g md5sum: $MD5"
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

