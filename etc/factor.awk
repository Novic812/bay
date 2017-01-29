#!/usr/bin/awk -f
BEGIN {
  if (ARGC != 2) {
    print "factor.awk [threshold]"
    exit
  }
  y = ARGV[1]
  z = 1

  # fives
  while (z < y) {
    z *= 5
    printf "%\47d\n", z
  }

  # twos
  while (z % 5 == 0) {
    z *= 2 / 5
    printf "%\47d\n", z
  }
  while (z < y) {
    z *= 2
    printf "%\47d\n", z
  }
}
