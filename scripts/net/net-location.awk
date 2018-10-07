#!/usr/local/bin/velour -f
# the shorter "q" format does not work for page 2 answers
BEGIN {
   if (ARGC != 2)
   {
      print "net-location.awk <file>"
      exit 1
   }
   while (getline < ARGV[1] > 0)
   {
      qu[++NR] = $NF
   }
   for (xr in qu)
   {
      "curl -I -L -o /dev/null -w %{url_effective} " qu[xr] | getline qu[xr]
   }
   for (xr in qu)
   {
      s_split(qu[xr], zu, "/")
      qu[xr] = sprintf("http://%s/questions/%s%s",
      zu[3], zu[5], zu[7] ? "/-/" zu[7] : "")
   }
   k_puts(qu)
}
