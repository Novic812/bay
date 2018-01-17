#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC == 1) {
    print "printf.awk <input>"
    exit 1
  }
  br["%c", "%d", "%03d", "%\47d", "%e", "%E", "%.0f", "%.8f", "%.8g", "%G",
  "%i", "%o", "%s", "%40s", "%u", "%x", "%X", "%#x", "%#X"]
  while (ch = ar_fpop(br, 1)) {
    printf "%" ch "\t" ch "\n", ARGV[1]
  }
}
