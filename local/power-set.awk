#!/usr/bin/awk -f
BEGIN {
  wh = ARGC - 1
  for (xr = 0; xr < 2 ^ wh; xr++) {
    NF = 0
    for (zu = 0; zu < wh; zu++) {
      if (int(xr / 2 ^ zu) % 2) {
        $(zu + 1) = ARGV[zu + 1]
      }
    }
    print
  }
}
