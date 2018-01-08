#!/usr/bin/awk -f
BEGIN {
  OFS = ""
  wh = ARGC - 1
  for (xr = 0; xr < 2 ^ wh; xr++) {
    NF = 0
    for (zu = 0; zu < wh; zu++) {
      if (int(xr / 2 ^ zu) % 2) {
        $(zu + 1) = (NF ? FS : "") ARGV[zu + 1]
      }
    }
    print
  }
}
