#!/bin/dash -e
if [ "$#" != 4 ]
then
  echo 'header.sh <source> <dest> <header> <depth>'
  exit 1
fi

q=0
until [ "$q" = "$4" ]  
do
  if [ "$q" != 0 ]
  then echo
  fi
  z=$((q + 1))

  printf 'building %d\n' "$z"
  cd "$1"
  if [ "$z" = 1 ]
  then echo "$3"
  else grep -r -l -f /tmp/"$q"
  fi |
  sed 's/^/[<"]/' > /tmp/"$z"

  printf 'trying %d\n' "$z"
  cd "$2"
  if ! grep --color -r -f /tmp/"$z"
  then echo 'no matches'
  fi

  q=$z
done
