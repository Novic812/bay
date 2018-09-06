#!/bin/dash -e
if [ "$#" != 2 ]
then
  echo 'tex.sh <tex input> <pdf output>'
  exit 1
fi

xr=$1
ya=$(dirname "$2")
zu=$(basename "$2" .pdf)

pdflatex -halt-on-error -output-directory "$ya" -jobname "$zu" "$xr" |
awk '
if (index($0, "Output"))
{
  print "\33[1;32m" $0 "\33[m"
}
else if (index($0, "!") || index($0, "Overfull") ||
index($0, "Underfull") || index($0, "Warning"))
{
  print "\33[1;31m" $0 "\33[m"
}
else
{
  print
}
'
