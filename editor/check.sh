#!/bin/dash -e
xc() {
  awk 'BEGIN {d = "\47"; printf "\33[36m"; while (++j < ARGC) {
  k = split(ARGV[j], q, d); q[1]; for (x in q) {
  printf q[x] ~ /^[[:alnum:]%+,./:=@_-]+$/ ? q[x] : d q[x] d
  if (x < k) printf "\\" d} printf j == ARGC - 1 ? "\33[m\n" : FS}}' "$@"
  "$@"
}
xc "$EDITOR"
xc "$EDITOR" ''
xc "$EDITOR" /etc/wgetrc
xc "$EDITOR" '' /etc/wgetrc
xc read br
xc "$EDITOR" 'C:\cygwin64\etc\shells'
xc read br
xc git clone --depth 1 git://github.com/svnpenn/a
xc cd a
echo EDITOR >> readme.txt
xc git commit -a
xc hub pull-request
