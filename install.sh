#!/bin/dash
find "$PWD" -mindepth 2 -maxdepth 2 '(' -name '*.sh' -o -name '*.awk' ')' \
-exec ln -sft /usr/local/bin {} +
find /usr/local/bin -type l -! -exec test -e {} ';' -print
