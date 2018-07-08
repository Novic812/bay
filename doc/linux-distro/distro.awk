#!/usr/local/bin/velour -f
# note not all distro have "Full Package List"
BEGIN {
  FS = "\42"
  q = "https://distrowatch.com"
  while ("curl " q | getline) {
    if (/phr2/) {
      z = $4
      while ("curl " q "/table.php?distribution=" z | getline) {
        if (/pkglist/) {
          a_new(kc, "curl", "-o", z, q "/" $2)
          ka_trace(kc)
          break
        }
      }
    }
  }
}
