#!/usr/local/bin/velour -f
# Set thumbnail for MP4 video
BEGIN {
   print a_create("Careful, screencaps will dump in current directory.",
      "Drag video here, then press enter (backslashes ok):")
   br = s_chomp(io_gets("-"))
   if (!br)
   {
      exit 1
   }
   FS = "[=\"]+"
   while ("ffprobe -show_streams -of flat=h=0 " k_se(br) | getline)
   {
      fo[$1] = $2
   }
   qu = fo["stream.0.width"] / fo["stream.0.height"] > 2 ? 36 : 30
   un = .09 * fo["stream.0.duration"]
   xr = (fo["stream.0.duration"] - 2 * un) / (qu - 1)
   while (qu--)
   {
      a_new(ay, "ffmpeg", "-y", "-v", "error", "-ss", un, "-i", br,
         "-frames", 1, un ".jpg")
      kv_trace(ay)
      un += xr
   }
   print "Drag picture here, then press enter (backslashes ok):"
   zu = s_chomp(io_gets("-"))
   if (!zu)
   {
      exit 1
   }
   a_new(ay, "tageditor", "-s", "cover=" zu, "--max-padding", 100000, "-f", br)
   kv_trace(ay)
}
