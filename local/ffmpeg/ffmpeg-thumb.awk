#!/usr/local/bin/awklib -f
# Set thumbnail for MP4 video

BEGIN {
  ARGV["Careful, screencaps will dump in current directory.",
  "Drag video here, then press enter (backslashes ok):"]
  print arb_join(ARGV, RS)

  if ("" == br = str_gsub("\42", "", file_gets("-"))) {
    exit 1
  }
  FS = "[=\42]+"
  while ("ffprobe -show_streams -of flat=h=0 " sh_escape(br) | getline) {
    ch[$1] = $2
  }
  ki = ch["stream.0.width"] / ch["stream.0.height"] > 2 ? 36 : 30
  xr = .09 * ch["stream.0.duration"]
  ya = (ch["stream.0.duration"] - 2 * xr) / (ki - 1)
  while (ki--) {
    ARGV["ffmpeg", "-y", "-v", "error", "-ss", xr, "-i", br,
    "-frames", 1, xr ".jpg"]
    shb_trace(ARGV)
    xr += ya
  }

  print "Drag picture here, then press enter (backslashes ok):"
  if ("" == zu = str_gsub("\42", "", file_gets("-"))) {
    exit 1
  }
  ARGV["tageditor", "-s", "cover=" zu, "--max-padding", 100000, "-f", br]
  shb_trace(ARGV)
}
