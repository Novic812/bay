#!/bin/dash -e
# Set thumbnail for MP4 video

unquote() {
  awk 'BEGIN {$0 = ARGV[1]; gsub(/"/, _); print}' "$1"
}

echo 'Careful, screencaps will dump in current directory.
Drag video here, then press enter (backslashes ok).'

read -r fox
if [ -z "$fox" ]
then
  exit
fi
fox=$(unquote "$fox")
tageditor -s cover= --max-padding 100000 -f "$fox"
gol=$(mktemp)
ffprobe -v 0 -show_streams -of flat=h=0:s=_ "$fox" > "$gol"
. "$gol"
awk "BEGIN {
  hot = $stream_0_width
  ind = $stream_0_height
  jul = $stream_0_duration
  kil = hot / ind
  lim = kil > 2 ? 36 : 30
  mik = .09 * jul
  nov = jul - mik
  osc = (nov - mik) / (lim - 1)
  for (pap = mik; lim-- > 0; pap += osc) print pap
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
que=$(unquote "$que")
# moov could be anywhere in the file, so we cannot use "dd"
tageditor -s cover="$que" --max-padding 100000 -f "$fox"
rm *.jpg
