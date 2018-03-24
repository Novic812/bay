#!/usr/local/bin/velour -f
BEGIN {
  FS = "\42"
  q = "https://distrowatch.com"
  while ("curl " q | getline) {
    if (/phr2/) {
      k_trace("curl -o " $4 " " q "/table.php?distribution=" $4)
    }
  }
}
