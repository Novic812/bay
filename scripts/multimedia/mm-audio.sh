#!/bin/dash -e
if [ "$#" -lt 3 ]
then
  cat <<'eof'
SYNOPSIS
  mm-audio.sh <in format> <out format> <in file>...

FORMAT
  flac
  m4a
  mp3
eof
  exit 1
fi

qu=$1
wh=$2
shift 2

for xr
do
  zu=$(basename "$xr" "$qu")
  k-trace ffmpeg -v warning -stats -i "$xr" -vn -b:a 256k "$zu$wh"
done
