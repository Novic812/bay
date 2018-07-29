#!/bin/dash -e
k-trace "$EDITOR"
k-trace "$EDITOR" ''
k-trace "$EDITOR" /etc/DIR_COLORS
k-trace "$EDITOR" 'C:\cygwin64\etc\shells'
k-trace "$EDITOR" "$(mktemp /tmp/\'XXX.txt)"
k-trace git clone --depth 1 git://github.com/punnet/bay
k-trace cd a
echo EDITOR >> readme.md
k-trace git commit -a
