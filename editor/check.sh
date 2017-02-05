#!/usr/local/bin/stdlib sh
xtrace "$EDITOR"
xtrace "$EDITOR" ''
xtrace "$EDITOR" /etc/wgetrc
xtrace "$EDITOR" 'C:\cygwin64\etc\shells'
xtrace "$EDITOR" "$(mktemp /tmp/\'XXX.txt)"
xtrace git clone --depth 1 git://github.com/svnpenn/a
xtrace cd a
echo EDITOR >> readme.md
xtrace git commit -a
xtrace hub pull-request
