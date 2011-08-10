#!/bin/bash
LOG="/home/$USER/nightly"
FILENAME="CM4D2G-nightly-`date +%F`.zip"
OUTPUT="/home/x13thangelx/android/cm4d2g/out/target/product/droid2we"
SCRIPTS="/home/x13thangelx/android/Scripts/cyanogenmod"
FILEURL=http://x13thangelx.synik4l.net/$FILENAME

cd $OUTPUT
MD5="$(md5sum $FILENAME)"

if [ -e $OUTPUT/$FILENAME ]
  then
    echo "$FILENAME -- $FILEURL" >> $LOG/urls
    echo "$FILENAME -- $MD5" >> $LOG/md5
  else
    echo "`date +%F` nightly failed" >> $LOG/urls
    echo "`date +%F` nightly failed" >> $LOG/md5
fi