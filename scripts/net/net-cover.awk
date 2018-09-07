#!/usr/local/bin/velour -f
BEGIN {
   if (!ENVIRON["BROWSER"])
   {
      print "BROWSER not set or not exported"
      exit 1
   }
   if (ARGC != 3)
   {
      print "net-cover.awk <artist> <album>"
      exit 1
   }
   wh = s_gsub(ARGV[1], " ", "+")
   xr = s_gsub(ARGV[2], " ", "+")
   a_new(zu, ENVIRON["BROWSER"],
      "-new-tab", "discogs.com/search?q=" wh "+" xr,
      "-new-tab", "fanart.tv/api/getdata.php?type=2&s=" wh,
      "-new-tab", "google.com/search?tbm=isch&q=" wh "+" xr,
      "-new-tab", "musicbrainz.org/search?type=release&query=" wh "+" xr,
      "-new-tab", "wikipedia.org/w/index.php?search=" wh "+" xr)
   kv_trace(zu)
}
