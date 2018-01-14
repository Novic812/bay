#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC == 1) {
    print "length.awk <asc | desc>"
    exit 1
  }
  q = arr_splice(ARGV, 2, 1)
}
{
  y[NR] = length
  z[NR] = $0
}
END {
  arr_msort(y, z, q == "desc" ? 1 : 0)
  print arr_join(z, RS)
}
