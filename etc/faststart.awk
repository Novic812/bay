#!/usr/bin/awk -f
/moov/ {
  print "faststart (moov before mdat)"
  exit
}
/mdat/ {
  print "not faststart (moov after mdat)"
  exit
}
