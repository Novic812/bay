#!/bin/dash -e
if [ "$#" != 2 ]
then
  echo 'tex.sh <tex input> <pdf output>'
  exit
fi

pa=$1
qu=$(dirname "$2")
ro=$(basename "$2")

pdflatex -halt-on-error -output-directory "$qu" -jobname "$ro" "$pa" |
awk '
/Output/ {
  $0 = "\33[1;32m" $0 "\33[m"
}
/!|Overfull|Underfull|Warning/ {
  $0 = "\33[1;31m" $0 "\33[m"
}
1
'
