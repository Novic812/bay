#!/bin/dash
find "$PWD" -mindepth 2 -maxdepth 2 '(' -name '*.sh' -o -name '*.awk' ')' \
-exec ln -sfvt /usr/local/bin {} +
