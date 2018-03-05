#!/usr/local/bin/velour -f
# Set thumbnail for MP4 video

BEGIN {
  sb["Careful, screencaps will dump in current directory.",
  "Drag video here, then press enter (backslashes ok):"]
  print ab_join(sb, RS)

  ch = str_trim(io_gets("-"))
  if (!ch) {
    exit 1
  }
  FS = "[=\42]+"
  while ("ffprobe -show_streams -of flat=h=0 " k_shellesc(ch) | getline) {
    fo[$1] = $2
  }
  qu = fo["stream.0.width"] / fo["stream.0.height"] > 2 ? 36 : 30
  xr = .09 * fo["stream.0.duration"]
  ya = (fo["stream.0.duration"] - 2 * xr) / (qu - 1)
  while (qu--) {
    sb["ffmpeg", "-y", "-v", "error", "-ss", xr, "-i", ch,
    "-frames", 1, xr ".jpg"]
    kb_trace(sb)
    xr += ya
  }

  print "Drag picture here, then press enter (backslashes ok):"
  zu = str_trim(io_gets("-"))
  if (!zu) {
    exit 1
  }
  sb["tageditor", "-s", "cover=" zu, "--max-padding", 100000, "-f", ch]
  kb_trace(sb)
}
