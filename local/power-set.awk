#!/usr/bin/awk -f
{
  for (x = 0; x < 2 ^ NF; x++) {
    y = 0
    for (z = 0; z < NF; z++) {
      if (int(x / 2 ^ z) % 2) {
        printf "%s%s", y++ ? OFS : "", $(z + 1)
      }
    }
    print ""
  }
}
