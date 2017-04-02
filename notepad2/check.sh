#!/usr/local/bin/shlib
sh_trace "$EDITOR"
sh_trace "$EDITOR" ''
sh_trace "$EDITOR" /etc/wgetrc
sh_trace "$EDITOR" 'C:\cygwin64\etc\shells'
sh_trace "$EDITOR" "$(mktemp /tmp/\'XXX.txt)"
sh_trace git clone --depth 1 git://github.com/svnpenn/a
sh_trace cd a
echo EDITOR >> readme.md
sh_trace git commit -a
sh_trace hub pull-request
