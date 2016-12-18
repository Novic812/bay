#!/bin/dash -e
xc() {
  awk 'BEGIN {
    x = "\47"; printf "\33[36m"; while (++i < ARGC) {
      y = split(ARGV[i], z, x); for (j in z) {
        printf z[j] ~ /[^[:alnum:]%+,./:=@_-]/ ? x z[j] x : z[j]
        if (j < y) printf "\\" x
      } printf i == ARGC - 1 ? "\33[m\n" : FS
    }
  }' "$@"
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
