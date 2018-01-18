#!/usr/local/bin/awklib -f

BEGIN {
  if (ARGC != 4) {
    sb["SYNOPSIS", "ff-seq.awk <start> <duration> <file>", "",
    "DESCRIPTION", "Make an image sequence from a video"]
    print arb_join(sb, RS)
    exit 1
  }
  sb["ffmpeg", "-hide_banner", "-ss", ARGV[1], "-i", ARGV[3], "-t", ARGV[2],
  "-vf", "select='eq(pict_type, I)'", "-vsync", "vfr", "-q", 1, "%d.jpg"]
  shb_trace(sb)
}
