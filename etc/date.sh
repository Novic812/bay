#!/bin/dash -e
if [ "$#" != 1 ]
then
  cat <<'eof'
NAME
  date.sh

SYNOPSIS
  date.sh [date]

EXAMPLES
  date.sh now
  date.sh 2015-5-15
eof
  exit
fi

ch=$1

date -d "$ch" +'%%a = %a
%%b = %b
%%c = %c
%%d = %d
%%e = %e
%%h = %h
%%j = %j
%%m = %m
%%p = %p
%%r = %r
%%u = %u
%%w = %w
%%x = %x
%%y = %y
%%A = %A
%%B = %B
%%C = %C
%%D = %D
%%H = %H
%%I = %I
%%M = %M
%%S = %S
%%T = %T
%%U = %U
%%V = %V
%%W = %W
%%X = %X
%%Y = %Y
%%Z = %Z
%%Y-%%m-%%dT%%T = %Y-%m-%dT%T
%%Y%%m%%d%%H%%M.%%S = %Y%m%d%H%M.%S
%%a, %%d %%b %%Y %%T %%Z = %a, %d %b %Y %T %Z'
