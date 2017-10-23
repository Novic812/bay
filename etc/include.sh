#!/bin/dash -e
if [ "$#" = 0 ]
then
  echo 'include.sh <infile> [mapfile]'
  exit 1
fi
xr=$1
ya=$2

# decorate
zu=$(mktemp "$LOCALAPPDATA"/temp/XXX)
printf '#include "%s"\n' "$zu" >> "$xr"

# transform
include-what-you-use -w -ferror-limit=1 \
-isystem C:/cygwin64/usr/x86_64-w64-mingw32/sys-root/mingw/include \
-Xiwyu --no_default_mappings ${ya:+-Xiwyu --mapping_file "$ya"} "$xr" 2>&1 |
awk '
/should add these lines|has correct/ {
  $0 = "\33[1;32m" $0
}
/should remove these lines/ {
  $0 = "\33[1;31m" $0
}
/full include-list for/ {
  $0 = "\33[1;33m" $0
}
/make|^$|---/ {
  $0 = "\33[m" $0
}
1
'

# undecorate
ex -sc 'd|x' "$xr"
