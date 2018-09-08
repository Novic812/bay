#!/usr/local/bin/velour -f
BEGIN {
   if (ARGC != 2)
   {
      print "mm-split.awk <cue file>"
      exit 1
   }
}
$1 == "FILE" {
   split($0, q, "\"")
   file = q[2]
}
$1 == "TRACK" {
   tracks[++z] = $2
}
$1 == "TITLE" && z {
   split($0, q, "\"")
   titles[z] = q[2]
}
$1 == "INDEX" && $2 {
   split($3, q, ":")
   idxs[z] = sprintf("%d:%02d:%06.3f", q[1] / 60, q[1] % 60, q[2] + q[3] / 75)
}
END {
   for (z in tracks)
   {
      a_new(q, "ffmpeg", "-v", "warning", "-stats", "-ss", idxs[z],
      "-i", file, "-b:a", "256k", "-copyts", "--", "--",
      tracks[z] " " s_gsub(titles[z], "[:?]", "") ".m4a")
      if (idxs[z + 1])
      {
         q[12] = "-to"
         q[13] = idxs[z + 1]
      }
      kv_trace(q)
   }
}
