#!/bin/dash -e
if [ "$#" != 6 ]
then
  echo 'img-circle.sh <in radius> <x> <y> <in file> <out radius> <out file>'
  exit 1
fi

inr=$1
cdx=$2
cdy=$3
inf=$4
otr=$5
otf=$6
ind=$((inr * 2))
otd=$((otr * 2))

convert "$inf" -extent "$ind"x"$ind"+"$cdx"+"$cdy" \
'(' +clone +alpha transparent -draw "circle $inr,$inr $inr,0" ')' \
-compose copyopacity -composite -resize "$otd"x"$otd" \
-define icon:auto-resize=256,48,16 -compress zip "$otf"

ie4uinit -ClearIconCache
