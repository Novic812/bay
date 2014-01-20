# get cover art

type xdg-open &>/dev/null || xdg-open () {
  # there are one or more whitespace characters
  # between the two quote characters
  cmd /c start '' "$1 "
}

usage () {
  echo usage: $0 ARTIST ALBUM
  exit
}

(( $# < 2 )) && usage
ARTIST=$1
ALBUM=$2

xdg-open "http://google.com/search?tbm=isch&q=$ARTIST $ALBUM"
xdg-open "http://fanart.tv/api/getdata.php?type=2&s=$ARTIST"
xdg-open "http://discogs.com/search?q=$ARTIST $ALBUM"
xdg-open "http://wikipedia.org/w/index.php?search=${ARTIST// /+}+${ALBUM// /+}"
xdg-open "http://musicbrainz.org/search?type=release&query=$ARTIST $ALBUM"
