#!/usr/local/bin/velour -f
# cant store values in indices because sorting will break if threshold >= 6251
BEGIN {
   if (ARGC != 2)
   {
      print "not-for-threes.awk <threshold>"
      exit 1
   }
   for (de = 1; 5 ^ de < ARGV[1]; de++);
   while (de >= 0)
   {
      ta = de ? 0 : 1
      do
      {
         xr = 5 ^ de * 2 ^ ta++
         a_push(zu, xr)
      }
      while (xr < ARGV[1])
      de--
   }
   a_sort(zu)
   for (de in zu)
   {
      printf "%'d\n", zu[de]
   }
}
