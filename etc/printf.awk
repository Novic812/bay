#!/usr/bin/awk -f
BEGIN {
  if (ARGC == 1) {
    print "printf.awk <input>"
    exit 1
  }
  split("%c %d %03d %\47d %e %E %.0f %.7f %g %G %i %o %s %40s %u %x %X %#x %#X",
  br)
  for (ch in br) {
    printf "%" br[ch] "\t" br[ch] "\n", ARGV[1]
  }
}
