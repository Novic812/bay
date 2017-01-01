#!/bin/dash -e
if [ "$#" = 0 ]
then
  cat <<'eof'
printf.sh [-e] [input]
-e    treat input as expression instead of string
eof
  exit
fi

if [ "$1" = -e ]
then
  ch=$(printf '{de=%s}' "$2")
else
  ch=$(printf '{de="%s"}' "$1")
fi

awk "$ch"'{printf "%" $0 "\t" $0 "\n", de}' <<'eof'
%a
%b
%d
%03d
%e
%.0f
%.7f
%g
%i
%j
%k
%m
%n
%o
%p
%q
%r
%s
%t
%u
%v
%w
%x
%y
%z
eof
