#!/bin/dash -e
if [ "$#" = 0 ]
then
   echo 'mm-subtitle.sh <MP4> [SRT]'
   exit 1
fi
wh=$1

if [ "$2" ]
then
   xr=$2
else
   xr=$(mktemp XXX.srt)
   ffmpeg -y -v warning -i "$wh" "$xr"
fi

zu=$(mktemp "XXX $wh")
mp4box -add "$wh"'#video' -add "$wh"'#audio' \
-add "$xr":txtflags=0xC0000000 -new "$zu"
