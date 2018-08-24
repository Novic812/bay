#!/bin/dash -e
if [ "$#" = 0 ]
then
  echo 'include.sh <infile> [mapfile]'
  exit 1
fi
pa=$1
xr=$2

# decorate
zu=$(mktemp "$LOCALAPPDATA"/temp/XXX)
printf '#include "%s"\n' "$zu" >> "$pa"

# transform
include-what-you-use -w -ferror-limit=1 \
-isystem C:/cygwin64/usr/x86_64-w64-mingw32/sys-root/mingw/include \
-Xiwyu --no_default_mappings ${xr:+-Xiwyu --mapping_file "$xr"} "$pa" 2>&1 |
awk '
{
  if (index($0, "should remove these lines")) {
    print "\33[1;31m"
  }
  if (index($0, "has correct") || index($0, "should add these lines")) {
    print "\33[1;32m"
  }
  if (index($0, "full include-list for")) {
    print "\33[1;33m"
  }
  if ($0 == "" || index($0, "make") || index($0, "---")) {
    print "\33[m"
  }
  print
}
'

# undecorate
ex -s -c 'd|x' "$pa"
