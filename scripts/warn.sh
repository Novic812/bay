#!/bin/dash -e
if [ "$#" -lt 3 ]
then
  echo 'synopsis: warn.sh <machine> <compiler> <infile>

machine:
- cygwin
- mingw32

compiler:
- g++
- gcc

packages:
- gcc-core
- gcc-g++
- mingw64-x86_64-gcc-core
- mingw64-x86_64-gcc-g++'
  exit 1
fi

z="$1 $2"
shift 2
set -- -s -static -Wall -Wextra -Wconversion -pedantic "$@"

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
