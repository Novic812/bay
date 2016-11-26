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
ffprobe -v 0 -show_streams -of flat=h=0 "$fox" |
awk '
BEGIN {FS = "[=\"]+"}
{gol[$1] = $2}
END {
  hot = gol["stream.0.width"] / gol["stream.0.height"]
  ind = hot > 2 ? 36 : 30
  jul = .09 * gol["stream.0.duration"]
  kil = (gol["stream.0.duration"] - 2 * jul) / (ind - 1)
  for (lim = jul; ind-- > 0; lim += kil) print lim
}
' |
while read lim
do
  printf '%g\r' "$lim"
  ffmpeg -nostdin -v error -ss "$lim" -i "$fox" -frames 1 "$lim".jpg
done

echo 'Drag picture here, then press enter (backslashes ok).'
read -r mik
if [ -z "$mik" ]
then
  exit
fi
mik=$(unquote "$mik")
# moov could be anywhere in the file, so we cannot use "dd"
tageditor -s cover="$mik" --max-padding 100000 -f "$fox"
rm *.jpg
