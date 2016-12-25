#!/bin/dash -e
xc() {
  awk 'BEGIN{d = "\47"; printf "\33[36m"; while (++j < ARGC) {
  k = split(ARGV[j], q, d); q[1]; for (x in q) printf "%s%s",
  q[x] ~ /^[[:alnum:]%+,./:=@_-]+$/ ? q[x] : d q[x] d, x < k ? "\\" d : ""
  printf j == ARGC - 1 ? "\33[m\n" : FS}}' "$@" | fmt -80
  "$@"
}

if [ "$#" != 3 ]
then
  cat <<'br'
SYNOPSIS
  ff-sequence.sh [start] [duration] [file]

DESCRIPTION
  Make an image sequence from a video
br
  exit
fi

xc ffmpeg -hide_banner -ss "$1" -i "$3" -t "$2" \
-vf "select='eq(pict_type,I)'" -vsync vfr -q 1 %d.jpg
