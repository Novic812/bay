#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC != 3)
   {
      print "tex.awk <tex input> <pdf output>"
      exit 1
   }
   "dirname " ARGV[2] | getline ta
   "basename " ARGV[2] " .pdf" | getline xr
   a_new(zu, "pdflatex", "-halt-on-error", "-output-directory", ta,
      "-jobname", xr, ARGV[1])
   while (a_join(zu, " ") | getline)
   {
      if (index($0, "Output"))
      {
         print "\33[1;32m" $0 "\33[m"
      }
      else if (index($0, "!") ||
      index($0, "Overfull")   ||
      index($0, "Underfull")  ||
      index($0, "Warning"))
      {
         print "\33[1;31m" $0 "\33[m"
      }
      else
      {
         print
      }
   }
}
