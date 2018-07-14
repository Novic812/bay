#!/usr/local/bin/velour -f
BEGIN {
  if (ARGC != 4) {
    a_new(z, "SYNOPSIS", "  net-song.awk <type> <artist> <song>", "", "TYPE",
    "  1   initial search", "  2   upgrade search")
    io_puts(z)
    exit 1
  }
  at = s_gsub(ARGV[2], "&", "%26")
  sg = s_gsub(ARGV[3], "&", "%26")
  yt = "youtube.com/results?q="
  gs = "google.com/search?q="

  # initial and upgrade
  a_new(z, ENVIRON["BROWSER"],
  "-new-tab", sprintf(yt "intext:\42%s - Topic\42 intitle:\42%s\42", at, sg),
  "-new-tab", sprintf(yt "-intitle:\42%s\42 \42%s\42 intitle:\42%s\42, hd", at, at, sg),
  "-new-tab", sprintf(gs "\42%s - Topic\42 \42%s\42&tbm=vid", at, sg))
  ka_trace(z)

  # initial only
  if (ARGV[1] == 1) {
    a_new(z, ENVIRON["BROWSER"],
    "-new-tab", sprintf(yt "allintitle:%s %s, hd", ar, sg),
    "-new-tab", sprintf(yt "allintitle:%s %s", at, sg),
    "-new-tab", sprintf(gs "allintitle:%s %s", at, sg))
    ka_trace(z)
  }
}
