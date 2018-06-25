#!/usr/local/bin/velour -f
# note not all distro have "Full Package List"
BEGIN {
  FS = "\42"
  q = "https://distrowatch.com"
  while ("curl " q | getline) {
    if (/phr2/) {
      x = $4
      while ("curl " q "/table.php?distribution=" x | getline) {
        if (/pkglist/) {
          a_new(kc, "curl", "-o", x, q "/" $2)
          ka_trace(kc)
          break
        }
      }
    }
  }
}
