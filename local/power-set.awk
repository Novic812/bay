#!/usr/bin/awk -f
BEGIN {
  if (ARGC == 1) {
    OFS = RS
    print \
    "SYNOPSIS",
    "  power-set.awk <cardinality> [element]...",
    "",
    "CARDINALITY",
    "  use -1 for all subsets"
    exit 1
  }
  wh = ARGV[1] == -1 ? ARGC - 2 : ARGV[1]
  for (xr = 0; xr < 2 ^ wh; xr++) {
    ya = 0
    for (zu = 0; zu < wh; zu++) {
      if (int(xr / 2 ^ zu) % 2) {
        printf "%s%s", ya++ ? OFS : "", ARGV[zu + 2]
      }
    }
    print ""
  }
}
