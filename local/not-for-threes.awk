#!/usr/local/bin/velour -f
# cant store values in indices because sorting will break if threshold >= 6251
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
      a_push(ec, de)
    } while (de < ARGV[1])
    br--
  }

  ar_sort(ec)
  for (br in ec) {
    printf "%\47d\n", ec[br]
  }
}
