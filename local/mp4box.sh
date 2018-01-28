#!/bin/dash -e
if [ "$#" = 0 ]
then
  echo 'mp4box.sh <MP4> [SRT]'
  exit 1
fi
xr=$1
if [ "$2" ]
then
  zu=$2
else
  zu=$(mktemp XXX.srt)
  sh-trace ffmpeg -y -v warning -i "$xr" "$zu"
fi
ya=$(mktemp "XXX $xr")
sh-trace mp4box -add "$xr"'#video' -add "$xr"'#audio' \
-add "$zu":txtflags=0xC0000000 -new "$ya"
