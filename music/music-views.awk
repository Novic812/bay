#!/usr/local/bin/awklib -f
function vpt(view, td, ts, prec) {
  return sprintf("%\47.0f views / %\47.*f %ss = %\47.0f",
  view, prec, td, ts, view / td)
}
BEGIN {
  if (ARGC != 2) {
    print "music-views.awk <URL>"
    exit
  }
  while ("curl -L " ARGV[1] | getline) {
    if (/interactionCount/)
      br = html_attr("content", $0)
    if (/datePublished/)
      ch = tm_now() - tm_date(html_attr("content", $0))
    if (/playback_count/)
      br = json_parse($0, "playback_count")
    if (/created_at/) {
      ch = tm_now() - tm_date(json_parse($0, "created_at"))
    }
  }
  print vpt(br, ch / tm_day(365.25), "year", 3)
  print vpt(br, ch / tm_day(1), "day")
  print vpt(br, ch / tm_hour(1), "hour")
  print vpt(br, ch / time_min(1), "minute")
}
