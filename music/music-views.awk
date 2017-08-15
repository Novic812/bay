#!/usr/local/bin/awklib -f
function vpt(view, td, ts, prec) {
  printf("%\47.0f views / %\47.*f %ss = %\47.0f\n",
  view, prec, td, ts, view / td)
}
BEGIN {
  if (ARGC != 2) {
    print "music-views.awk <URL>"
    exit 1
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
  printf br / ch < 4400000 / tm_day(365.25) ? "\33[1;32m" : "\33[1;31m"
  vpt(br, ch / tm_day(365.25), "year", 3)
  vpt(br, ch / tm_day(1), "day")
  vpt(br, ch / tm_hour(1), "hour")
  vpt(br, ch / tm_minute(1), "minute")
  printf "\33[m"
}
