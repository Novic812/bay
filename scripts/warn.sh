#!/bin/dash -e
if [ "$#" != 3 ]
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
# "-o" will not work with "/dev/clipboard"
set -- -s -static -Wall -Wextra -Wconversion -pedantic "$3"

case $z in
'mingw32 g++')
   k-trace x86_64-w64-mingw32-g++ -x c++ -std=c++14 "$@"
   ;;
'mingw32 gcc')
   k-trace x86_64-w64-mingw32-gcc -x c -std=c11 "$@"
   ;;
'cygwin g++')
   k-trace x86_64-pc-cygwin-g++ -x c++ -std=c++14 "$@"
   ;;
'cygwin gcc')
   k-trace x86_64-pc-cygwin-gcc -x c -std=c11 "$@"
esac
