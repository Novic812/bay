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
  printf '%19s  ' "$de"
  date -d "$ch" +"$de"
done <<'br'
%a
%b
%c
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
%H%M%S
%Y%m%d
%c %z
%b %-d %Y
%a, %-d %b %Y %T %z
br
