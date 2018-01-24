#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC != 2) {
    print "ff-split.awk <cue file>"
    exit 1
  }
}
$1 == "FILE" {
  str_split($0, pa, "\42")
  qu = pa[2]
}
$1 == "TRACK" {
  ro[++wh] = $2
}
$1 == "TITLE" && wh {
  str_split($0, pa, "\42")
  xr[wh] = pa[2]
}
$1 == "INDEX" && $2 {
  str_split($3, pa, ":")
  ya[wh] = sprintf("%d:%02d:%06.3f", pa[1] / 60, pa[1] % 60, pa[2] + pa[3] / 75)
}
END {
  for (wh in ro) {
    sb["ffmpeg", "-v", "warning", "-stats", "-i", qu, "-ss",
    ya[wh] (ya[wh + 1] ? "\34-to\34" ya[wh + 1] : ""), "-b:a", "256k",
    "-movflags", "faststart", "-metadata", "track=" ro[wh], "-metadata",
    "title=" xr[wh], ro[wh] FS rx_replace("\\?", "", xr[wh]) ".m4a"]
    shb_trace(sb)
  }
}
