#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC == 1)
   {
      print "printf.awk <input>"
      exit 1
   }
   a_new(h, "%c", "%d", "%03d", "%'d", "%e", "%E", "%f", "%.0f", "%.8f", "%g",
      "%.8g", "%G", "%i", "%o", "%s", "%40s", "%u", "%x", "%X", "%#x", "%#X")
   for (z in h)
   {
      printf "%" h[z] "\t" h[z] "\n", ARGV[1]
   }
}
