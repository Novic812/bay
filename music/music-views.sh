#!/bin/dash -e
if [ "$#" != 1 ]
then
  echo 'music-views.sh [URL]'
  exit
fi

case $1 in
*soundcloud*)
  de='
  BEGIN {
    RS = "\42?,\42"
    FS = "\42:\42?"
  }
  /created_at/ {
    qu = gensub(/[[:alpha:][:punct:]]/, " ", "g", $2)
  }
  /playback_count/ {
    pa = $2
    exit
  }
  '
;;
*youtube*)
  de='
  BEGIN {
    FS = "\42"
  }
  /interactionCount/ {
    pa = $4
  }
  /datePublished/ {
    qu = gensub("-", " ", "g", $4) " 0 0 0"
  }
  '
;;
esac

ro=$(mktemp)
wget -O "$ro" "$1"
printf '\33[1;33m'

awk "$de"'
function wh(xr, ya) {
  printf "%\47.0f views / %\47.*f %s = %\47.0f\n", pa, ya, zu, xr, pa / zu
}
END {
  zu = systime() - mktime(qu)
  zu /= 60 * 60 * 24 * 365
  wh("years", 3)
  zu *= 365
  wh("days")
  zu *= 24
  wh("hours")
  zu *= 60
  wh("minutes")
}
' "$ro"

printf '\33[m'
