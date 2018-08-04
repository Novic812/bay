#!/usr/local/bin/velour -f
# Set thumbnail for MP4 video

BEGIN {
  a_new(dc, "Careful, screencaps will dump in current directory.",
  "Drag video here, then press enter (backslashes ok):")
  io_puts(dc)

  ch = s_chomp(io_gets("-"))
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
    a_new(dc, "ffmpeg", "-y", "-v", "error", "-ss", xr, "-i", ch,
    "-frames", 1, xr ".jpg")
    ka_trace(dc)
    xr += ya
  }

  print "Drag picture here, then press enter (backslashes ok):"
  zu = s_chomp(io_gets("-"))
  if (!zu) {
    exit 1
  }
  a_new(dc, "tageditor", "-s", "cover=" zu, "--max-padding", 100000, "-f", ch)
  ka_trace(dc)
}