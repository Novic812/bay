#!/usr/bin/awk -f
BEGIN {
  if (ARGC < 3) {
    print "comb.awk <cardinality> <element>..."
    exit 1
  }
  for (q = 0; q < ARGV[1]; q++) {
    z[q] = q
  }
  while (1) {
    for (q in z) {
      printf "%s%s", ARGV[z[q] + 2], q == ARGV[1] - 1 ? "\n" : " "
    }
    if (z[ARGV[1] - 1]++ < ARGC - 3) {
      continue
    }
    q = ARGV[1] - 2
    while (q >= 0 && z[q] >= q - ARGV[1] + ARGC - 2) {
      q--
    }
    if (q < 0) {
      break
    }
    z[q]++
    while (++q < ARGV[1]) {
      z[q] = z[q - 1] + 1
    }
  }
}
