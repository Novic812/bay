#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC != 3) {
    OFS = RS
    print \
    "SYNOPSIS",
    "  music-reddit.awk <TYPE> <URL>",
    "",
    "TYPE",
    "  ex   external links",
    "  in   internal links",
    "",
    "URL",
    "  http://reddit.com/r/stationalpha",
    "  http://reddit.com/r/stationalpha?count=25&after=t3_7kqkqh"
    exit 1
  }
  sub(/(\?|$)/, ".json&", ARGV[2])
  if (ARGV[1] == "ex") {
    z = ".. | .data?.url // empty"
  }
  else {
    z = ".. | \42reddit.com\42 + (.permalink? // empty)"
  }
  system("curl -LA0 " sh_escape(ARGV[2]) "| jq -r '" z "' | tr -d '\r'")
}
