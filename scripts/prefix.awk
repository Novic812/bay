#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC != 2)
   {
     print a_create("synopsis: prefix.sh <compiler>", "", "compiler:",
     "- gcc", "- x86_64-w64-mingw32-gcc", "", "packages:", "- gcc-core",
     "- mingw64-x86_64-gcc-core")
     exit 1
   }   
   FS = "[ =\"]+"
   while (ARGV[1] " -E -v -x c /dev/null 2>&1" | getline)
   {
      if (/^ [^ ]+$/)
      {
         a_push(ec, $0)
      }
      if ($1 == "LIBRARY_PATH")
      {
         if (index($2, ";"))
         {
            split($2, ta, /;/)
         }
         else
         {
            split($2, ta, /:/)
         }
         a_concat(ec, ta)
      }
      if ($2 == "nonexistent")
      {
         a_push(ec, $4)
      }
   }
   while ("realpath -m " a_join(ec, " ") | getline)
   {
      if ($0 in xr == 0)
      {
         print
         xr[$0]
      }
   }
}
