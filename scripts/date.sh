#!/bin/dash -e
if [ "$#" != 1 ]
then
   echo 'synopsis: date.sh <date>

examples:
- date.sh now
- date.sh 2015-5-15'
   exit 1
fi

date -d "$1" +'%%a = %a
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
%%x %%r = %x %r
%%Y-%%m-%%dT%%T = %Y-%m-%dT%T
%%Y%%m%%d%%H%%M.%%S = %Y%m%d%H%M.%S
%%a, %%d %%b %%Y %%T %%Z = %a, %d %b %Y %T %Z'
