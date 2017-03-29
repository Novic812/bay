#!/usr/local/bin/awklib -f
{
  for (x = 0; x < 2 ^ NF; x++) {
    y = 0
    for (z = 0; z < NF; z++)
      if (trunc(x / 2 ^ z) % 2) {
        printf "%s%s", y++ ? OFS : "", $(z + 1)
      }
    print ""
  }
}
