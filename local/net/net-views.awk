#!/usr/local/bin/velour -f
function vpt(view, td, ts, prec) {
  printf "%\47.0f views / %\47.*f %ss = %\47.0f\n",
  view, prec, td, ts, view / td
}
BEGIN {
  if (ARGC != 2) {
    print "net-views.awk <URL | check>"
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
      ch = t_now() - t_utc(html_attr("content", $0))
    }
  }
  printf br / ch < 4520000 / t_yearsec(1) ? "\33[1;32m" : "\33[1;31m"
  vpt(br, t_secyear(ch), "year", 3)
  vpt(br, t_secday(ch), "day")
  vpt(br, t_sechour(ch), "hour")
  vpt(br, t_secmin(ch), "minute")
  printf "\33[m"
}
