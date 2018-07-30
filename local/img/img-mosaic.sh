#!/bin/dash -e
# A mosaic in digital imaging is a plurality of non-overlapping images, arranged
# in some tessellation.
if [ "$#" = 0 ]
then
  cat <<'eof'
img-mosaic.sh [options] <files>

-d     dry run, create pieces only

-s <s>     how much to shave
           example 6x6

-c <c>     comma separated list of crops
           example -300,0,+300,0

-g <g>     comma separated list of gravities
           example north,south,east,southeast

-m <m>     comma separated list of dimensions
           example 1920x1080,1280x1080,960x1080,640x1080

-r <r>     comma separated list of resize markers
           example y,y,y,n
eof
  exit 1
fi

mn() {
  awk '
  {
    for (; NF - 1; NF--) {
      if ($1 > $NF) {
        $1 = $NF
      }
    }
  }
  1
  '
}

xr() {
  tr , '\n' <<eof
$1
eof
}

eg=$(mktemp /tmp/crop-XXX)
gv=$(mktemp /tmp/gravity-XXX)
dm=$(mktemp /tmp/extent-XXX)
rz=$(mktemp /tmp/resize-XXX)
while getopts ds:c:g:r:m: name
do
  case $name in
  d)
    dry=1
  ;;
  s)
    sv=$OPTARG
  ;;
  c)
    xr "$OPTARG" > "$eg"
  ;;
  g)
    xr "$OPTARG" > "$gv"
  ;;
  m)
    xr "$OPTARG" > "$dm"
  ;;
  r)
    xr "$OPTARG" > "$rz"
  esac
done
shift $((OPTIND - 1))

sc=$(mktemp /tmp/file-XXX)
printf '%s\n' "$@" > "$sc"

if [ -s "$rz" ]
then
  ex -s -c '%s/n//|x' "$rz"
else
  yes | head -"$#" > "$rz"
fi
if [ ! -s "$gv" ]
then
  yes center | head -"$#" > "$gv"
fi
if [ ! -s "$eg" ]
then
  yes '' | head -"$#" > "$eg"
fi
if [ ! -s "$dm" ]
then
  ao=$(identify -format '%[fx:w/h>1]' "$@")
  awk '
  BEGIN {
    while (getline < "-") {
      if ($1 "" == ARGV[1]) {
        split($2, q, ",")
        for (z in q) {
          print q[z]
        }
      }
    }
    if (!z) {
      print "cannot automatically set dimensions" > "/dev/stderr"
      exit 1
    }
  }
  ' "$ao" > "$dm" <<'eof'
0 1920x1080
1 1920x1080
11 1920x1080,1920x1080
001 960x1080,960x1080,1920x1080
100 1920x1080,960x1080,960x1080
110 1920x1080,1280x1080,640x1080
0000 960x1080,960x1080,960x1080,960x1080
0001 640x1080,640x1080,640x1080,1920x1080
0101 640x1080,1280x1080,640x1080,1280x1080
0110 640x1080,1280x1080,1280x1080,640x1080
1000 1920x1080,640x1080,640x1080,640x1080
1001 1280x1080,640x1080,640x1080,1280x1080
1010 1280x1080,640x1080,1280x1080,640x1080
1111 960x1080,960x1080,960x1080,960x1080
0111 640x1080,1280x1080,960x1080,960x1080
1011 1280x1080,640x1080,960x1080,960x1080
1101 960x1080,960x1080,640x1080,1280x1080
1110 960x1080,960x1080,1280x1080,640x1080
00001 640x1080,640x1080,640x1080,640x1080,1280x1080
00010 640x1080,640x1080,640x1080,1280x1080,640x1080
01000 640x1080,1280x1080,640x1080,640x1080,640x1080
10000 1280x1080,640x1080,640x1080,640x1080,640x1080
00011 640x1080,640x1080,640x1080,960x1080,960x1080
11000 960x1080,960x1080,640x1080,640x1080,640x1080
000000 640x1080,640x1080,640x1080,640x1080,640x1080,640x1080
000011 640x1080,640x1080,640x1080,960x1080,960x540,960x540
000110 640x1080,640x1080,640x1080,960x540,960x540,960x1080
011011 960x1080,960x540,960x540,960x1080,960x540,960x540
110000 960x540,960x540,960x1080,640x1080,640x1080,640x1080
110011 960x540,960x540,960x1080,960x1080,960x540,960x540
110110 960x540,960x540,960x1080,960x540,960x540,960x1080
0000110 640x1080,640x1080,640x1080,640x1080,640x540,640x540,640x1080
11111111 960x540,960x540,960x540,960x540,960x540,960x540,960x540,960x540
eof
fi

paste -d '\n' "$dm" "$eg" "$gv" "$rz" "$sc" |
while
  read dme
  read ege
  read gve
  read rze
  read sce
do
  # extent must come after resize
  k-trace convert -quality 100 \
  ${sv+-shave "$sv"} \
  ${ege:+-crop "$ege"} \
  ${rze:+-resize "$dme"^} \
  -extent "$dme" \
  -gravity "$gve" \
  "$sce" ="$sce"
done

# combine
${dry+exit}
# this needs to be here otherwise you are measuring the wrong height
ju=$(identify -format '%h ' "$@" | mn)
br=$(mktemp XXX)
set =*

case $ao in
000011)
  k-trace convert "$1" "$2" "$3" \
  "$4" '(' "$5" "$6" -append ')' +append -quality 100 "$br"
;;
000110)
  k-trace convert "$1" "$2" "$3" \
  '(' "$4" "$5" -append ')' "$6" +append -quality 100 "$br"
;;
011011)
  k-trace convert "$1" '(' "$2" "$3" -append ')' \
  "$4" '(' "$5" "$6" -append ')' +append -quality 100 "$br"
;;
110000)
  k-trace convert '(' "$1" "$2" -append ')' "$3" \
  "$4" "$5" "$6" +append -quality 100 "$br"
;;
110011)
  k-trace convert '(' "$1" "$2" -append ')' "$3" \
  "$4" '(' "$5" "$6" -append ')' +append -quality 100 "$br"
;;
110110)
  k-trace convert '(' "$1" "$2" -append ')' "$3" \
  '(' "$4" "$5" -append ')' "$6" +append -quality 100 "$br"
;;
0000110)
  k-trace convert "$1" "$2" "$3" "$4" \
  '(' "$5" "$6" -append ')' "$7" +append -quality 100 "$br"
;;
11111111)
  k-trace convert '(' "$1" "$2" -append ')' '(' "$3" "$4" -append ')' \
  '(' "$5" "$6" -append ')' '(' "$7" "$8" -append ')' +append -quality 100 "$br"
;;
*)
  k-trace convert "$@" +append -quality 100 "$br"
esac

sn=$(basename "$PWD")
k-trace mv "$br" "s $sn h $ju".jpg
k-trace rm "$@"
