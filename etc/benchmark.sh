#!/bin/dash
if [ "$#" = 0 ]
then
  echo 'benchmark.sh <command-line>'
  exit 1
fi

strace "$@" | wc -l
