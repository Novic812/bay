#!/usr/bin/awk -f
BEGIN {
  if (ARGC == 1) {
    print "printf.awk [input]"
    exit
  }
  split("%a %b %d %03d %e %.0f %.7f %g %i %j %k %m %n %o %p %q %r %s %t %u " \
  "%v %w %x %X %y %z", br)
  for (ch in br) {
    printf "%" br[ch] "\t" br[ch] "\n", ARGV[1]
  }
}
