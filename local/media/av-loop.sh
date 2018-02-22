#!/bin/dash -e
if [ "$#" != 2 ]
then
  echo 'av-loop.sh <image> <audio>'
  exit 1
fi
xr=$(mktemp XXX.mp4)
ya=$(ffprobe -v 0 -of csv=p=0 -show_entries format=duration "$2" | tr -d '\r')

case $2 in
*.m4a|*.mp3) zu=copy ;;
*) zu=libfdk_aac ;;
esac

ffmpeg -y -hide_banner -loop 1 -r 1 -i "$1" -i "$2" -t "$ya" -c:a "$zu" \
-pix_fmt yuv420p -vf 'setsar,scale=-2:min(720\,trunc(ih/2)*2)' "$xr"
