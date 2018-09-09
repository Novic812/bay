#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC == 1)
   {
      print "include.awk <infile> <mapfile>"
      exit 1
   }

   # decorate
   "mktemp $LOCALAPPDATA/temp/XXX" | getline zu
   printf "#include \"%s\"\n", zu >> ARGV[1]

   # transform
   a_new(q, "include-what-you-use", "-w", "-ferror-limit=1",
   "-isystem", "C:/cygwin64/usr/x86_64-w64-mingw32/sys-root/mingw/include",
   "-Xiwyu", "--no_default_mappings", "-Xiwyu", "--mapping_file", ARGV[2],
   ARGV[1], "2>&1")
   while (a_join(q, " ") | getline)
   {
      if (index($0, "should remove these lines"))
      {
         print "\33[1;31m"
      }
      if (index($0, "has correct") || index($0, "should add these lines"))
      {
         print "\33[1;32m"
      }
      if (index($0, "full include-list for"))
      {
         print "\33[1;33m"
      }
      if ($0 == "" || index($0, "make") || index($0, "---"))
      {
         print "\33[m"
      }
      print
   }

   # undecorate
   system("ex -s -c 'd|x' " ARGV[1])
}
