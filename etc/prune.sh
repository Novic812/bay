#!/bin/dash -e
j=$(mktemp)
sage category Base | xargs sage depends | awk '$0=$NF' | sort -u > "$j"
sage list | grep -vxf "$j" | xargs sage remove
rm -rf /usr/x86_64-w64-mingw32
find /tmp -maxdepth 1 -mindepth 1 -exec rm -r {} +
