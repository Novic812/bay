#!/bin/dash -e
sh-trace "$EDITOR"
sh-trace "$EDITOR" ''
sh-trace "$EDITOR" /etc/DIR_COLORS
sh-trace "$EDITOR" 'C:\cygwin64\etc\shells'
sh-trace "$EDITOR" "$(mktemp /tmp/\'XXX.txt)"
sh-trace git clone --depth 1 git://github.com/svnpenn/a
sh-trace cd a
echo EDITOR >> readme.md
sh-trace git commit -a
