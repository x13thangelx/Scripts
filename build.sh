#!/bin/bash
SCRIPTS="/home/x13thangelx/android/Scripts"


echo "make nightlies? (y/n)"
read INPUT
if [[ "$INPUT" =~ "y" ]] || [[ "$INPUT" =~ "Y" ]]
  then 
    $SCRIPTS/makenightlyd2g.sh
    $SCRIPTS/makenightlydpro.sh
  else
    $SCRIPTS/buildd2g.sh
    $SCRIPTS/builddpro.sh
fi
