#!/bin/dash -e
if [ "$#" != 4 ]
then
  echo 'header.sh <source> <dest> <pattern file> <depth>'
  exit 1
fi

q=0
until [ "$q" = "$4" ]
do
  if [ "$q" != 0 ]
  then
    echo
  fi
  z=$((q + 1))

  printf 'building %d\n' "$z"
  if [ "$z" = 1 ]
  then
    cat "$3"
  else
    cd "$1"
    grep -r -l -f /tmp/"$q"
  fi |
  sed 's/^/[<"]/' > /tmp/"$z"

  printf 'trying %d\n' "$z"
  cd "$2"
  if ! grep -r --color --exclude-dir .git -f /tmp/"$z"
  then
    echo 'no matches'
  fi

  q=$z
done
