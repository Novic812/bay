#!/bin/dash -e
xc() {
  awk 'BEGIN {d = "\47"; printf "\33[36m"; while (++q < ARGC) {
  x = split(ARGV[q], y, d); y[1]; for (z in y) printf "%s%s",
  !x || y[z] ~ /[^[:alnum:]%+,./:=@_-]/ ? d y[z] d : y[z], z < x ? "\\" d : ""
  printf q == ARGC - 1 ? "\33[m\n" : FS}}' "$@"
  "$@"
}

if [ "$#" != 3 ]
then
  cat <<'eof'
SYNOPSIS
  ff-sequence.sh [start] [duration] [file]

DESCRIPTION
  Make an image sequence from a video
eof
  exit
fi

xc ffmpeg -hide_banner -ss "$1" -i "$3" -t "$2" \
-vf "select='eq(pict_type,I)'" -vsync vfr -q 1 %d.jpg
