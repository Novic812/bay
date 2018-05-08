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

q=$1
v=$2
shift 2

for w
do
  z=$(basename "$w" "$q")
  k-trace ffmpeg -v warning -stats -i "$w" -b:a 256k "$z$v"
done
