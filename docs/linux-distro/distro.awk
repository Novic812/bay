#!/usr/local/bin/velour -f
# note not all distro have "Full Package List"
BEGIN {
   FS = "\""
   x = "https://distrowatch.com"
   while ("curl " x | getline)
   {
      if (/phr2/)
      {
         z = $4
         while ("curl " x "/table.php?distribution=" z | getline)
         {
            if (/pkglist/)
            {
               a_new(kc, "curl", "-o", z, x "/" $2)
               kv_trace(kc)
               break
            }
         }
      }
   }
}
