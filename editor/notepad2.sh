#!/bin/dash -e
for j
do
  if [ "$j" ]
  then cygpath -w "$j"
  else echo
  fi
done |
xargs -d '\n' notepad2 +
