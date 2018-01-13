#!/usr/bin/awk -f
BEGIN {
  if (ARGC < 3) {
    print "comb.awk <cardinality> <element>..."
    exit 1
  }
  for (q = 1; q <= ARGV[1]; q++) {
    z[q] = ARGV[1] - q + 1
  }
  while (1) {
    for (q = ARGV[1]; q;) {
      printf "%s%s", ARGV[z[q] + 1], --q ? " " : "\n"
    }
    for (q = 1; z[q] > ARGC - 2 - q;) {
      if (++q > ARGV[1]) {
        exit
      }
    }
    for (z[q]++; --q;) {
      z[q] = z[q + 1] + 1
    }
  }
}
