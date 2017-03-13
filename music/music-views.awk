#!/usr/local/bin/awklib -f
function mktm(datespec,   xr) {
  split(datespec, xr, /[-T]/)
  return \
  (xr[1] - 1970) * 60 * 60 * 24 * 365.25 + \
  (xr[2] -    1) * 60 * 60 * 24 * 365.25 / 12 + \
  (xr[3] -    1) * 60 * 60 * 24
}
function prtf(viewdate, timestr, prec) {
  printf "%\47.0f views / %\47.*f %ss = %\47.0f\n",
  viewdate[1], prec, viewdate[2], timestr, viewdate[1] / viewdate[2]
}
BEGIN {
  if (ARGC != 2) {
    print "music-views.awk [URL]"
    exit
  }
  while ("curl -L " ARGV[1] | getline) {
    if (/interactionCount/) {
      split($0, xr, "\42")
      zu[1] = xr[4]
    }
    if (/datePublished/) {
      split($0, xr, "\42")
      zu[2] = time() - mktm(xr[4])
    }
    if (/playback_count/) {
      zu[1] = json($0, "playback_count")
    }
    if (/created_at/) {
      zu[2] = time() - mktm(json($0, "created_at"))
    }
  }
  zu[2] /= 60 * 60 * 24 * 365.25
  prtf(zu, "year", 3)
  zu[2] *= 365.25
  prtf(zu, "day")
  zu[2] *= 24
  prtf(zu, "hour")
  zu[2] *= 60
  prtf(zu, "minute")
}
