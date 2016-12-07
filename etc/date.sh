#!/bin/dash -e
if [ "$#" != 1 ]
then
  cat <<'br'
NAME
  date.sh

SYNOPSIS
  date.sh [date]

EXAMPLE
  date.sh 2015-5-15
br
  exit
fi

ch=$1

while read de
do
  printf '%-11s' "$de"
  date -d "$ch" +"$de"
done <<'br'
%a
%b
%c
%c %z
%d
%e
%g
%h
%j
%k
%l
%m
%p
%r
%s
%u
%w
%x
%y
%z
%A
%B
%C
%D
%F
%G
%H
%I
%M
%N
%P
%R
%S
%T
%U
%V
%W
%X
%Y
%Z
%:z
%::z
%:::z
%Y%m%d
%H%M%S
%b %-d %Y
br
