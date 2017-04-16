#!/usr/bin/awk -f
BEGIN {
  if (ARGC != 2) {
    print "not-for-threes.awk <threshold>"
    exit 1
  }
  while (5 ^ ++br < ARGV[1]);

  while (br >= 0) {
    ch = br ? 0 : 1
    do {
      de = 5 ^ br * 2 ^ ch++
      ec[de]
    } while (de < ARGV[1])
    br--
  }

  for (br in ec) {
    printf "%\47d\n", br
  }
}
