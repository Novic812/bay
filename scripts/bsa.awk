#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC != 3)
   {
      print a_new(dc, "bsa.awk <good> <bad>", "", "hex allowed - use 0x")
      exit 1
   }
   while (1)
   {
      xr = n_div(a_sum(ARGV), 2)
      if (ya[xr]++)
      {
         break
      }
      printf ARGV[1] ~ /[xX]/ ? "\n%X\n" : "\n%d\n", xr
      while (1)
      {
         printf "[g,b]? "
         zu = io_gets("-")
         if (zu == "g")
         {
            ARGV[1] = xr
         }
         else if (zu == "b")
         {
            ARGV[2] = xr
         }
         else
         {
            print a_new(dc, "", "g - good", "b - bad")
            continue
         }
         break
      }
   }
}
