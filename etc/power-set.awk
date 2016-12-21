#!/usr/bin/awk -f
{
  for (c = 0; c < 2 ^ NF; c++) {
    e = 0
    for (d = 0; d < NF; d++)
      if (int(c / 2 ^ d) % 2) {
        printf "%s%s", e++ ? OFS : "", $(d + 1)
      }
    print ""
  }
}
