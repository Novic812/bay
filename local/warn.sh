#!/bin/dash
if [ "$#" -lt 3 ]
then
  cat <<'eof'
SYNOPSIS
  warn.sh <machine> <compiler> <infile>

MACHINE
  mingw32
  cygwin

COMPILER
  g++
  gcc

PACKAGES
  mingw64-x86_64-gcc-g++
  mingw64-x86_64-gcc-core
  gcc-g++
  gcc-core
eof
  exit 1
fi

z="$1 $2"
shift 2
set -- -Wall -Wextra -Wconversion -pedantic "$@"

case $z in
'mingw32 g++')
  k-trace x86_64-w64-mingw32-g++ -std=c++14 "$@"
;;
'mingw32 gcc')
  k-trace x86_64-w64-mingw32-gcc -std=c11 "$@"
;;
'cygwin g++')
  k-trace x86_64-pc-cygwin-g++ -std=c++14 "$@"
;;
'cygwin gcc')
  k-trace x86_64-pc-cygwin-gcc -std=c11 "$@"
esac
