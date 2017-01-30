#!/usr/bin/awk -f
function ceil(x,   y) {
  y = int(x)
  return y < x ? y + 1 : y
}

BEGIN {
  if (ARGC != 2) {
    print "not-for-threes.awk [threshold]"
    exit
  }
  br = ceil(log(ARGV[1]) / log(5))

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
