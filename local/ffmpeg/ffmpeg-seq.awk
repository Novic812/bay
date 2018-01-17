#!/usr/local/bin/awklib -f

BEGIN {
  if (ARGC != 4) {
    z["SYNOPSIS", "ff-seq.awk <start> <duration> <file>", "",
    "DESCRIPTION", "Make an image sequence from a video"]
    print ar_join(z, RS, 1)
    exit 1
  }
  z["ffmpeg", "-hide_banner", "-ss", ARGV[1], "-i", ARGV[3], "-t", ARGV[2],
  "-vf", "select='eq(pict_type, I)'", "-vsync", "vfr", "-q", 1, "%d.jpg"]
  sh_trace(ar_begin(z))
}
