#!/usr/bin/awk -f
BEGIN {
  while (++q < ARGC) x = x " '" ARGV[q] "'"
  while ("cygpath -iw" x | getline) z = z " '" $0 "'"
  system("Notepad2 +" z)
}
