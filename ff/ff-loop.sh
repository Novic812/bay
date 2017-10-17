#!/bin/dash -e
if [ "$#" != 2 ]
then
  echo 'ff-loop.sh <image> <audio>'
  exit 1
fi
q=$(mktemp XXX.mp4)
z=$(ffprobe -v 0 -of csv=p=0 -show_entries format=duration "$2" | tr -d '\r')
ffmpeg -y -hide_banner -loop 1 -r 1 -i "$1" -i "$2" -t "$z" -c:a copy \
-pix_fmt yuv420p -vf 'scale=-2:min(1080\,ih)' "$q"
