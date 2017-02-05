#!/usr/local/bin/stdlib awk
# github.com/svnpenn/stdlib
# Set thumbnail for MP4 video

BEGIN {
  OFS = RS
  print "Careful, screencaps will dump in current directory.",
  "Drag video here, then press enter (backslashes ok):"

  getline br < "-"
  if (!br) exit
  FS = "[=\42]+"
  while ("ffprobe -v 0 -show_streams -of flat=h=0 " quote(br) | getline) {
    ch[$1] = $2
  }
  ki = ch["stream.0.width"] / ch["stream.0.height"] > 2 ? 36 : 30
  xr = .09 * ch["stream.0.duration"]
  ya = (ch["stream.0.duration"] - 2 * xr) / (ki - 1)
  while (ki--) {
    printf "%g\r", xr
    system(sprintf("ffmpeg -y -v error -ss %s -i %s -frames 1 %s.jpg",
    quote(xr), quote(br), quote(xr)))
    xr += ya
  }

  printf "\33[1;32m%s\33[m\n",
  "Drag picture here, then press enter (backslashes ok):"
  getline zu < "-"
  if (!zu) exit
  system(sprintf("tageditor -s cover=%s --max-padding 100000 -f %s",
  quote(zu), quote(br)))
}
