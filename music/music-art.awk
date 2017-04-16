#!/usr/local/bin/awklib -f
BEGIN {
  if (!ENVIRON["BROWSER"]) {
    print "BROWSER not set or not exported"
    exit 1
  }
  if (ARGC != 3) {
    print "music-art.awk <artist> <album>"
    exit 1
  }

  _ = RS
  split("discogs.com/search?q=" ARGV[1] "+" ARGV[2] _ \
  "fanart.tv/api/getdata.php?type=2&s=" ARGV[1] _ \
  "google.com/search?tbm=isch&q=" ARGV[1] "+" ARGV[2] _ \
  "musicbrainz.org/search?type=release&query=" ARGV[1] "+" ARGV[2] _ \
  "wikipedia.org/w/index.php?search=" ARGV[1] "+" ARGV[2], xr, _)
  for (ya in xr) {
    gsub(" ", "+", xr[ya])
    system(ENVIRON["BROWSER"] FS sh_escape(xr[ya]))
  }
}
