#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC != 3)
   {
      print a_create("bsa.awk <good> <bad>", "", "hex allowed - use 0x")
      exit 1
   }
   while (1)
   {
      ta = n_div(a_sum(ARGV), 2)
      if (xr[ta]++)
      {
         break
      }
      printf ARGV[1] ~ /[xX]/ ? "\n%X\n" : "\n%d\n", ta
      while (1)
      {
         printf "[g,b]? "
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
            print a_create("", "g - good", "b - bad")
            continue
         }
         break
      }
   }
}
