#!/bin/dash
find "$PWD" -mindepth 2 -maxdepth 2 \
'(' -name '*.sh' -o -name '*.awk' -o -name '*.vim' ')' \
-exec ln -sft /usr/local/bin {} +
