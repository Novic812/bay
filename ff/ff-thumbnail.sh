#!/bin/dash -e
# Set thumbnail for MP4 video

unquote() {
  awk 'BEGIN {$0 = ARGV[1]; gsub(/"/, _); print}' "$1"
}

xc() {
  awk 'BEGIN {d = "\47"; printf "\33[36m"; while (++j < ARGC) {
  k = split(ARGV[j], q, d); q[1]; for (x in q) printf "%s%s",
  q[x] ~ /^[[:alnum:]%+,./:=@_-]+$/ ? q[x] : d q[x] d, x < k ? "\\" d : ""
  printf j == ARGC - 1 ? "\33[m\n" : FS}}' "$@" | fmt -80
  "$@"
}

echo 'Careful, screencaps will dump in current directory.
Drag video here, then press enter (backslashes ok):'

read -r br
if [ -z "$br" ]
then
  exit
fi
br=$(unquote "$br")
ffprobe -v 0 -show_streams -of flat=h=0 "$br" |
awk '
BEGIN {
  FS = "[=\"]+"
}
{
  ju[$1] = $2
}
END {
  ki = ju["stream.0.width"] / ju["stream.0.height"]
  mi = ki > 2 ? 36 : 30
  si = .09 * ju["stream.0.duration"]
  xr = (ju["stream.0.duration"] - 2 * si) / (mi - 1)
  for (ya = si; mi-- > 0; ya += xr) print ya
}
' |
while read ya
do
  printf '%g\r' "$ya"
  ffmpeg -nostdin -v error -ss "$ya" -i "$br" -frames 1 "$ya".jpg
done

printf '\33[1;32m%s\33[m\n' \
'Drag picture here, then press enter (backslashes ok):'
read -r zu
if [ -z "$zu" ]
then
  exit
fi
zu=$(unquote "$zu")
# moov could be anywhere in the file, so we cannot use "dd"
xc tageditor -s cover="$zu" --max-padding 100000 -f "$br"
rm *.jpg
