#!/bin/dash -e
for q in /Git/*/
do
  cd "$q"
  if [ -e .git ]
  then
    printf '\33c'
    git status
    printf '\33[1;35m%s\33[m\n' "${q%/}"
    read x
  fi
done
