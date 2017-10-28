#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC == 1) {
    print "length.awk <asc | desc>"
    exit 1
  }
  br = arr_splice(ARGV, 2, 1)
  while (getline) {
    qu = length
    xr[qu] = xr[qu] ? xr[qu] RS $0 : $0
  }
  for (qu in xr) {
    ya = arr_bpush(zu, xr[qu])
  }
  for (qu in zu) {
    print zu[br == "asc" ? qu : ya - qu + 1]
  }
}
