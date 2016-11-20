#!/bin/dash -e
j=$(mktemp)
sage category Base | xargs sage depends | awk '$0=$NF' | sort -u > "$j"
sage list | grep -vf "$j" | xargs echo sage remove
