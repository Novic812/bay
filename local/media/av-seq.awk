#!/usr/local/bin/velour -f

BEGIN {
  if (ARGC != 5) {
    a_new(dc, "SYNOPSIS", "av-seq.awk <start> <duration> <frames> <file>", "",
    "DESCRIPTION", "Make an image sequence from a video", "", "FRAMES",
    "key   I frames only", "all   I, P and B frames")
    print a_join(dc, RS)
    exit 1
  }

  a_new(dc, "ffmpeg", "-ss", ARGV[1], "-i", ARGV[4], "-t", ARGV[2],
  "-vf", "select='eq(pict_type, I)'", "-vsync", "vfr", "-q", 1, "%d.jpg")

  if (ARGV[3] == "all") {
    a_delete(dc, 8)
    a_delete(dc, 8)
  }

  ka_trace(dc)
}
