#!/bin/dash -e
set "$APPDATA"/notepad2
mkdir -p "$1"
cp notepad2.ini "$1"
