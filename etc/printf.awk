#!/usr/bin/awk -f
BEGIN {
  if (ARGC == 1) {
    print "printf.awk [input]"
    exit
  }
  split("%c %d %03d %e %E %.0f %.7f %g %G %i %o %s %u %x %X %#x %#X", br)
  for (ch in br) {
    printf "%" br[ch] "\t" br[ch] "\n", ARGV[1]
  }
}
