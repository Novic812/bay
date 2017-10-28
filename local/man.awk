#!/usr/bin/awk -f
BEGIN {
  if (!ENVIRON["BROWSER"]) {
    print "BROWSER not set or not exported"
    exit 1
  }
  if (ARGC != 2) {
    print "man.awk <page>"
    exit 1
  }
  FS = "[/.]"
  "man -w " ARGV[1] | getline
  z = sprintf("man7.org/linux/man-pages/%s/%s.%s.html", $5, $6, $7)
  system(ENVIRON["BROWSER"] " " z)
}
