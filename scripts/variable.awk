#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC < 3)
   {
      print "variable.awk <length> <file>..."
      exit 1
   }
   var_len = a_shift(ARGV)
   a_new(ay, "alfa", "bravo", "charlie", "delta", "echo", "foxtrot", "golf",
      "hotel", "india", "juliet", "kilo", "lima", "mike", "november", "oscar",
      "papa", "quebec", "romeo", "sierra", "tango", "uniform", "victor",
      "whiskey", "xray", "yankee", "zulu")
   for (xr in ay)
   {
      npa[s_slice(ay[xr], 1, var_len)] = 0
   }
}
{
   for (xr in npa)
   {
      if (tolower($0) ~ xr)
      {
         npa[xr]++
      }
   }
}
END {
   for (xr in npa)
   {
      a_push(zu, sprintf("%2s %s", npa[xr], xr))
   }
   a_sort(zu)
   k_puts(zu)
}
