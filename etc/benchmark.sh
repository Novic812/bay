#!/bin/dash
if [ "$#" = 0 ]
then
  echo 'strace.sh <command> [arguments]'
  exit
fi

strace "$@" | wc -l
