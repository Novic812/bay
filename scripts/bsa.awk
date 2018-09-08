#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC != 3)
   {
      print a_create("synopsis: bsa.awk <good> <bad>", "",
      "notes:", "- for each step use 'g' or 'b'", "- for hex use '0x'")
      exit 1
   }
   while (1)
   {
      ta = n_div(a_sum(ARGV), 2)
      if (xr[ta]++)
      {
         break
      }
      while (1)
      {
         printf (ARGV[1] ~ /[xX]/ ? "%x" : "%d") ": ", ta
         zu = io_gets("-")
         if (zu == "g")
         {
            ARGV[1] = ta
         }
         else if (zu == "b")
         {
            ARGV[2] = ta
         }
         else
         {
            continue
         }
         break
      }
   }
}
