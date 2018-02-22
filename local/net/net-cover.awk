#!/usr/local/bin/velour -f
BEGIN {
  if (!ENVIRON["BROWSER"]) {
    print "BROWSER not set or not exported"
    exit 1
  }
  if (ARGC != 3) {
    print "net-cover.awk <artist> <album>"
    exit 1
  }

  xr = str_gsub(FS, "+", ARGV[1])
  ya = str_gsub(FS, "+", ARGV[2])

  sb[ENVIRON["BROWSER"], "-new-tab", "discogs.com/search?q=" xr "+" ya,
  "-new-tab", "fanart.tv/api/getdata.php?type=2&s=" xr,
  "-new-tab", "google.com/search?tbm=isch&q=" xr "+" ya,
  "-new-tab", "musicbrainz.org/search?type=release&query=" xr "+" ya,
  "-new-tab", "wikipedia.org/w/index.php?search=" xr "+" ya]

  shb_trace(sb)
}
