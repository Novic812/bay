#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC == 1) {
    print "printf.awk <input>"
    exit 1
  }
  sb["%c", "%d", "%03d", "%\47d", "%e", "%E", "%.0f", "%.8f", "%.8g", "%G",
  "%i", "%o", "%s", "%40s", "%u", "%x", "%X", "%#x", "%#X"]
  while (ch = arb_fpop(sb)) {
    printf "%" ch "\t" ch "\n", ARGV[1]
  }
}
