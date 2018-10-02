#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC != 4)
   {
      print a_create("synopsis: net-song.awk <type> <artist> <song>", "",
      "type:", "   1: initial search", "   2: upgrade search")
      exit 1
   }
   at = s_gsub(ARGV[2], "&", "%26")
   sg = s_gsub(ARGV[3], "&", "%26")
   yt = "youtube.com/results?q="
   gs = "google.com/search?q="

   # initial and upgrade
   a_new(z, ENVIRON["BROWSER"],
   "-new-tab",
   sprintf(yt "intext:\"%s - Topic\" intitle:\"%s\"", at, sg),
   "-new-tab",
   sprintf(yt "-intitle:\"%s\" \"%s\" intitle:\"%s\", hd", at, at, sg),
   "-new-tab",
   sprintf(gs "\"%s - Topic\" \"%s\"&tbm=vid", at, sg))
   kv_trace(z)

   # initial only
   if (ARGV[1] == 1)
   {
      a_new(z, ENVIRON["BROWSER"],
      "-new-tab", sprintf(yt "allintitle:%s %s, hd", at, sg),
      "-new-tab", sprintf(yt "allintitle:%s %s", at, sg),
      "-new-tab", sprintf(gs "allintitle:%s %s", at, sg))
      kv_trace(z)
   }
}
