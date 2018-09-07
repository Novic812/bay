#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC != 5)
   {
      print a_create("synopsis:",
      "   mm-seq.awk <start> <duration> <frames> <file>", "",
      "description:", "   make an image sequence from a video", "",
      "frames:", "   key: i frames only", "   all: i, p and b frames")
      exit 1
   }
   a_new(z, "ffmpeg", "-ss", ARGV[1], "-i", ARGV[4], "-t", ARGV[2],
      "-vsync", "vfr", "-q", 1, "--", "--", "%d.jpg")
   if (ARGV[3] == "key")
   {
      z[12] = "-vf"
      z[13] = "select='eq(pict_type, I)'"
   }
   kv_trace(z)
}
