#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC == 1) {
    print "length.awk <asc | desc>"
    exit 1
  }
  q = ar_splice(ARGV, 2, 1)
}
{
  y[NR] = length
  z[NR] = $0
}
END {
  ar_msort(y, z, q == "desc" ? 1 : 0)
  print ar_join(z, RS)
}
