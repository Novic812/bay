#!/bin/dash -e
xc() {
  awk 'BEGIN {
    x = "\47"; printf "\33[36m"; while (++i < ARGC) {
      y = split(ARGV[i], z, x); for (j in z) {
        printf z[j] ~ /[^[:alnum:]%+,./:=@_-]/ ? x z[j] x : z[j]
        if (j < y) printf "\\" x
      } printf i == ARGC - 1 ? "\33[m\n" : FS
    }
  }' "$@" | fmt -80
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
