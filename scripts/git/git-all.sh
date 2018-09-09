#!/bin/dash
# cant use "-e", might be running "grep"
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
      printf '\33[1;36m%s\33[m\n' "$PWD"
      "$@"
   fi
done
