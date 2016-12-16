#!/bin/dash -e
if [ "$#" != 1 ]
then
  echo 'highlight.sh [file]'
  exit
fi
xr=$1
ya=$(mktemp /tmp/highlight-XXX.txt)

while read zu
do
  printf '%s\n\n<!-- language: %s -->\n\n' "$zu" "$zu"
  cat "$xr"
  echo
done > "$ya" <<'eof'
lang-sh
lang-c
lang-cs
lang-clj
lang-coffee
lang-css
lang-dart
lang-erlang
lang-go
lang-hs
lang-html
lang-java
lang-javascript
lang-json
lang-tex
lang-lisp
lang-lua
lang-fs
lang-matlab
lang-pascal
lang-perl
lang-proto
lang-python
lang-r
lang-regex
lang-ruby
lang-rust
lang-scala
lang-sql
lang-vhdl
lang-vb
eof

"$EDITOR" "$ya"
