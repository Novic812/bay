#!/bin/dash
find "$PWD"/local '(' -name '*.sh' -o -name '*.awk' ')' \
-exec ln -sfvt /usr/local/bin {} +
