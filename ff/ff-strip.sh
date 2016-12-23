#!/bin/dash -e
# strip metadata and chapters
xc() {
  awk 'BEGIN {d = "\47"; printf "\33[36m"; while (++j < ARGC) {
  k = split(ARGV[j], q, d); q[1]; for (x in q) {
  printf q[x] ~ /^[[:alnum:]%+,./:=@_-]+$/ ? q[x] : d q[x] d
  if (x < k) printf "\\" d} printf j == ARGC - 1 ? "\33[m\n" : FS}}' "$@"
  "$@"
}

if [ "$#" != 1 ]
then
  echo 'ff-strip.sh [file]'
  exit
fi

j=$1
k=strip.${1##*.}

# "-analyzeduration" doesnt do anything other than remove the warning
xc ffmpeg -hide_banner -i "$j" \
  -vn -c copy -map_metadata -1 -map_chapters -1 "$k"
