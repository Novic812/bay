#!/bin/dash -e
if [ "$#" = 0 ]
then
  echo 'git-all.sh <path> [command-line]'
  exit 1
fi
q=$1
shift

for z in "$q"/*/
do
  cd "$z"
  if [ -e .git ]
  then
    printf '\33[1;32m%s:\33[m\n' "$PWD"
    "$@"
  fi
done
