#!/usr/local/bin/awklib -f
# Set thumbnail for MP4 video

BEGIN {
  _ = OFS = RS
  print "Careful, screencaps will dump in current directory.",
  "Drag video here, then press enter (backslashes ok):"

  getline br < "-"
  if (!br) exit
  gsub("\42", "", br)
  FS = "[=\42]+"
  while ("ffprobe -v 0 -show_streams -of flat=h=0 " quote(br) | getline) {
    ch[$1] = $2
  }
  ki = ch["stream.0.width"] / ch["stream.0.height"] > 2 ? 36 : 30
  xr = .09 * ch["stream.0.duration"]
  ya = (ch["stream.0.duration"] - 2 * xr) / (ki - 1)
  while (ki--) {
    split("ffmpeg" _ "-y" _ "-v" _ "error" _ "-ss" _ xr _ "-i" _ br _ \
    "-frames" _ 1 _ xr ".jpg", ch, _)
    xtrace(ch)
    xr += ya
  }

  print "Drag picture here, then press enter (backslashes ok):"
  getline zu < "-"
  if (!zu) exit
  gsub("\42", "", zu)
  split("tageditor" _ "-s" _ "cover=" zu _ "--max-padding" _ 100000 _ \
  "-f" _ br, ch, _)
  xtrace(ch)
}
