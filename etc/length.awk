#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC == 1) {
    print "length.awk <asc | desc>"
    exit
  }
  br = arr_shift(ARGV)
  while (getline) {
    qu = length
    xr[qu] = xr[qu] ? xr[qu] RS $0 : $0
  }
  for (qu in xr) {
    ya = arr_push(zu, xr[qu])
  }
  for (qu in zu) {
    print zu[math_mod(br == "asc" ? qu : -qu, ya + 1)]
  }
}
