#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC != 3) {
    print "length.awk <file> <asc | desc>"
    exit
  }
  ARGC = 2
  while (getline) {
    qu = length
    xr[qu] = xr[qu] ? xr[qu] RS $0 : $0
  }
  for (qu in xr) {
    ya[++zu] = xr[qu]
  }
  for (qu = zu; qu; qu--) {
    print ya[math_mod(ARGV[2] == "asc" ? -qu : qu, zu + 1)]
  }
}
