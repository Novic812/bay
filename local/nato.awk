#!/usr/local/bin/velour -f
BEGIN {
  if (ARGC < 3) {
    print "nato.awk <variable length> <file>..."
    exit 1
  }
  var_len = ar_fpop(ARGV)
  sb["alfa", "bravo", "charlie", "delta", "echo", "foxtrot", "golf", "hotel",
  "india", "juliet", "kilo", "lima", "mike", "november", "oscar", "papa",
  "quebec", "romeo", "sierra", "tango", "uniform", "victor", "whiskey",
  "xray", "yankee", "zulu"]
  while (each = arb_fpop(sb)) {
    nfa[str_slice(each, 1, var_len)] = 0
  }
}
{
  for (each in nfa) {
    if (tolower($0) ~ each) {
      nfa[each]++
    }
  }
}
END {
  for (each in nfa) {
    ar_bpush(m, sprintf("%2d", nfa[each]) FS each)
  }
  print arn_join(ar_sort(m), RS)
}
