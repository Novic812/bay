#!/bin/dash -e
if [ "$#" != 1 ]
then
cat <<'eof'
SYNOPSIS
  prefix.sh <compiler>

COMPILER
  x86_64-w64-mingw32-gcc
  gcc

PACKAGES
  mingw64-x86_64-gcc-core
  gcc-core
eof
  exit 1
fi

"$1" -E -v -x c /dev/null 2>&1 |
awk '
BEGIN {
  FS = "[ =\42]+"
}
/^ [^ ]+$/
$1 == "LIBRARY_PATH" {
  gsub(":", "\n", $2)
  print $2
}
$2 == "nonexistent" {
  print $4
}
' |
xargs realpath -m |
sort -u
