#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

LOGFILE=$SCRIPT_DIR/nohup.out
if [ -e $LOGFILE ]; then
   TIMESTAMP=$(date -r $LOGFILE "+%Y-%m-%d_%H_%M_%S")
   mv $LOGFILE $LOGFILE.$TIMESTAMP
fi

rm -f $LOGFILE
nohup $SCRIPT_DIR/yocto-build.sh $1 &
