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

date --date="$ch" +'%%a = %a
%%b = %b
%%c = %c
%%d = %d
%%e = %e
%%g = %g
%%h = %h
%%j = %j
%%k = %k
%%l = %l
%%m = %m
%%p = %p
%%r = %r
%%s = %s
%%u = %u
%%w = %w
%%x = %x
%%y = %y
%%z = %z
%%A = %A
%%B = %B
%%C = %C
%%D = %D
%%F = %F
%%G = %G
%%H = %H
%%I = %I
%%M = %M
%%N = %N
%%P = %P
%%R = %R
%%S = %S
%%T = %T
%%U = %U
%%V = %V
%%W = %W
%%X = %X
%%Y = %Y
%%Z = %Z
%%:z = %:z
%%::z = %::z
%%:::z = %:::z
%%H%%M%%S = %H%M%S
%%Y%%m%%d = %Y%m%d
%%c %%z = %c %z
%%b %%-d %%Y = %b %-d %Y
%%a, %%-d %%b %%Y %%T %%z = %a, %-d %b %Y %T %z'
