#!/bin/dash
if [ "$#" = 0 ]
then
  echo 'benchmark.sh <command> [arguments]'
  exit
fi

strace "$@" | wc -l
