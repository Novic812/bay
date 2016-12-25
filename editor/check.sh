#!/bin/dash -e
xc() {
  awk 'BEGIN {d = "\47"; printf "\33[36m"; while (++j < ARGC) {
  k = split(ARGV[j], q, d); q[1]; for (x in q) printf "%s%s",
  q[x] ~ /^[[:alnum:]%+,./:=@_-]+$/ ? q[x] : d q[x] d, x < k ? "\\" d : ""
  printf j == ARGC - 1 ? "\33[m\n" : FS}}' "$@"
  "$@"
}
xc "$EDITOR"
xc "$EDITOR" ''
xc "$EDITOR" /etc/wgetrc
xc "$EDITOR" 'C:\cygwin64\etc\shells'
xc "$EDITOR" "$(mktemp /tmp/\'XXX.txt)"
xc git clone --depth 1 git://github.com/svnpenn/a
xc cd a
echo EDITOR >> readme.md
xc git commit -a
xc hub pull-request
