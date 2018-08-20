#!/bin/dash -e
if [ "$#" != 1 ]
then
  echo 'synopsis: prefix.sh <compiler>

compiler:
- gcc
- x86_64-w64-mingw32-gcc

packages:
- gcc-core
- mingw64-x86_64-gcc-core'
  exit 1
fi

# /dev/null fails with build=mingw32
"$1" -E -v -x c - <<eof 2>&1 |
eof
awk '
BEGIN {
  FS = "[ =\42]+"
}
/^ [^ ]+$/
$1 == "LIBRARY_PATH" {
  if (index($2, ";")) {
    gsub(/;/, "\n", $2)
  }
  else {
    gsub(/:/, "\n", $2)
  }
  print $2
}
$2 == "nonexistent" {
  print $4
}
' |
xargs realpath -m |
sort -u
