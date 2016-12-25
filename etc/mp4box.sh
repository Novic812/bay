#!/bin/dash -e
xc() {
  awk 'BEGIN {d = "\47"; printf "\33[36m"; while (++j < ARGC) {
  k = split(ARGV[j], q, d); q[1]; for (x in q) printf "%s%s",
  q[x] ~ /^[[:alnum:]%+,./:=@_-]+$/ ? q[x] : d q[x] d, x < k ? "\\" d : ""
  printf j == ARGC - 1 ? "\33[m\n" : FS}}' "$@" | fmt -80
  "$@"
}
if [ "$#" = 0 ]
then
  echo 'mp4box.sh [MP4] [SRT]'
  exit
fi
xr=$1
if [ "$2" ]
then
  zu=$2
else
  zu=$(mktemp XXX.srt)
  xc ffmpeg -y -v warning -i "$xr" "$zu"
fi
ya=$(mktemp "XXX $xr")
xc mp4box -add "$xr"'#video' -add "$xr"'#audio' -add "$zu":txtflags=0xC0000000 \
-new "$ya"
