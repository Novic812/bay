#!/usr/local/bin/awklib -f
# Set thumbnail for MP4 video

BEGIN {
  OFS = RS
  print "Careful, screencaps will dump in current directory.",
  "Drag video here, then press enter (backslashes ok):"

  getline br
  if (!br)
    exit 1
  gsub("\42", "", br)
  FS = "[=\42]+"
  while ("ffprobe -v 0 -show_streams -of flat=h=0 " sh_escape(br) | getline) {
    ch[$1] = $2
  }
  ki = ch["stream.0.width"] / ch["stream.0.height"] > 2 ? 36 : 30
  xr = .09 * ch["stream.0.duration"]
  ya = (ch["stream.0.duration"] - 2 * xr) / (ki - 1)
  while (ki--) {
    ch["ffmpeg", "-y", "-v", "error", "-ss", xr, "-i", br,
    "-frames", 1, xr ".jpg"]
    sh_trace(arr_index(ch))
    xr += ya
  }

  print "Drag picture here, then press enter (backslashes ok):"
  getline zu
  if (!zu)
    exit 1
  gsub("\42", "", zu)
  ch["tageditor", "-s", "cover=" zu, "--max-padding", 100000, "-f", br]
  sh_trace(arr_index(ch))
}
