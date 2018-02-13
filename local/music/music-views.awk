#!/usr/local/bin/velour -f
function vpt(view, td, ts, prec) {
  printf "%\47.0f views / %\47.*f %ss = %\47.0f\n",
  view, prec, td, ts, view / td
}
BEGIN {
  if (ARGC != 2) {
    print "music-views.awk <URL | check>"
    exit 1
  }
  if (ARGV[1] == "check") {
    ARGV[1] = "https://www.youtube.com/watch?v=ZWmrfgj0MZI"
  }
  while ("curl -L " ARGV[1] | getline) {
    if (/interactionCount/) {
      br = html_attr("content", $0)
    }
    if (/datePublished/) {
      ch = tm_now() - tm_date(html_attr("content", $0))
    }
  }
  printf br / ch < 4500000 / tm_day(365.25) ? "\33[1;32m" : "\33[1;31m"
  vpt(br, ch / tm_day(365.25), "year", 3)
  vpt(br, ch / tm_day(1), "day")
  vpt(br, ch / tm_hour(1), "hour")
  vpt(br, ch / tm_minute(1), "minute")
  printf "\33[m"
}
