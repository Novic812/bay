#!/bin/dash -e
if [ "$#" != 2 ]
then
  echo 'ff-loop.sh <image> <audio>'
  exit 1
fi
xr=$(mktemp XXX.mp4)
ya=$(ffprobe -v 0 -of csv=p=0 -show_entries format=duration "$2" | tr -d '\r')

if [ "${2%m4a}" = "$2" ]
then zu=libfdk_aac
else zu=copy
fi

ffmpeg -y -hide_banner -loop 1 -r 1 -i "$1" -i "$2" -t "$ya" -c:a "$zu" \
-pix_fmt yuv420p -vf 'scale=-2:min(1080\,ih)' "$xr"
