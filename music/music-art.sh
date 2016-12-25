#!/bin/dash
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit
fi
if [ "$#" != 2 ]
then
  echo 'music-art [artist] [album]'
  exit
fi

awk '
function d(h, j) {
  k = "\47"; q = split(h, x, k); for (z in x) {
    j = j (x[z] ~ /[^[:alnum:]%+,./:=@_-]/ ? k x[z] k : x[z])
    if (z < q) j = j "\\" k
  } return j
}
{
  gsub(" ", "+")
  system(d(ENVIRON["BROWSER"]) FS d($0))
}
' <<eof
discogs.com/search?q=$1 $2
fanart.tv/api/getdata.php?type=2&s=$1
google.com/search?tbm=isch&q=$1 $2
musicbrainz.org/search?type=release&query=$1 $2
wikipedia.org/w/index.php?search=$1 $2
eof
