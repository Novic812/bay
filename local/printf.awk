#!/usr/local/bin/velour -f
BEGIN {
  if (ARGC == 1) {
    print "printf.awk <input>"
    exit 1
  }
  a_new(q, "%c", "%d", "%03d", "%\47d", "%e", "%E", "%.0f", "%.8f", "%.8g",
  "%G", "%i", "%o", "%s", "%40s", "%u", "%x", "%X", "%#x", "%#X")
  for (z in q) {
    printf "%" q[z] "\t" q[z] "\n", ARGV[1]
  }
}
