#!/usr/local/bin/velour -f
BEGIN {
  if (ARGC != 2) {
    print "av-split.awk <cue file>"
    exit 1
  }
}
$1 == "FILE" {
  s_split($0, q, "\42")
  file = q[2]
}
$1 == "TRACK" {
  tracks[++z] = $2
}
$1 == "TITLE" && z {
  s_split($0, q, "\42")
  titles[z] = q[2]
}
$1 == "INDEX" && $2 {
  s_split($3, q, ":")
  idxs[z] = sprintf("%d:%02d:%06.3f", q[1] / 60, q[1] % 60, q[2] + q[3] / 75)
}
END {
  for (z in tracks) {
    a_new(q, "ffmpeg", "-v", "warning", "-stats", "-i", file, "-ss", idxs[z],
    "-to", idxs[z + 1], "-b:a", "256k",
    tracks[z] " " s_gsub(titles[z], "\\?", "") ".m4a")
    if (!idxs[z + 1]) {
      a_delete(q, 9)
      a_delete(q, 9)
    }
    ka_trace(q)
  }
}
