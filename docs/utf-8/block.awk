#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC != 3)
   {
      print "block.awk <from> <to>"
      exit 1
   }
   xr = s_rjust(tolower(ARGV[1]), 6)
   zu = s_rjust(tolower(ARGV[2]), 6)
   while ("fc-list -v : charset postscriptname" | getline)
   {
      if (NF > 6 && $1 > xr && $1 < zu)
      {
         z = 1
      }
      if (z && /postscriptname/)
      {
         print $NF
         z = 0
      }
   }
}
