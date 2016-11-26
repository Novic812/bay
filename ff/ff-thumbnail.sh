#!/bin/bash -e
# Set thumbnail for MP4 video

unquote() {
  # need quotes for github
  read -r "$1" <<< "${!1//\"}"
}

echo 'Careful, screencaps will dump in current directory.
Drag video here, then press enter (backslashes ok).'

read -r fox
if [ -z "$fox" ]
then
  exit
fi
unquote fox
tageditor -s cover= --max-padding 100000 -f "$fox"
. <(ffprobe -v 0 -show_streams -of flat=h=0:s=_ "$fox")
awk "BEGIN {
  gol = $stream_0_width
  hot = $stream_0_height
  ind = $stream_0_duration
  jul = gol / hot
  kil = jul > 2 ? 36 : 30
  lim = .09 * ind
  mik = ind - lim
  nov = (mik - lim) / (kil - 1)
  for (osc = lim; kil-- > 0; osc += nov) print osc
}" |
while read pap
do
  printf '%g\r' "$pap"
  ffmpeg -nostdin -v error -ss "$pap" -i "$fox" -frames 1 "$pap".jpg
done

echo 'Drag picture here, then press enter (backslashes ok).'
read -r que
if [ -z "$que" ]
then
  exit
fi
unquote que
# moov could be anywhere in the file, so we cannot use "dd"
tageditor -s cover="$que" --max-padding 100000 -f "$fox"
rm *.jpg
