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
function quote(str,   d, m, x, y, z) {
  d = "\47"; m = split(str, x, d)
  for (y in x) z = z d x[y] (y < m ? d "\\" d : d)
  return z
}
{
  gsub(" ", "+")
  system(quote(ENVIRON["BROWSER"]) FS quote($0))
}
' <<eof
discogs.com/search?q=$1 $2
fanart.tv/api/getdata.php?type=2&s=$1
google.com/search?tbm=isch&q=$1 $2
musicbrainz.org/search?type=release&query=$1 $2
wikipedia.org/w/index.php?search=$1 $2
eof
