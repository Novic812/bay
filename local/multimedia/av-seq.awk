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
  "-vsync", "vfr", "-q", 1, "--", "--", "%d.jpg")

  if (ARGV[3] == "key") {
    dc[12] = "-vf"
    dc[13] = "select='eq(pict_type, I)'"
  }

  ka_trace(dc)
}
