#!/usr/bin/awk -f
BEGIN {
  while (++br < ARGC)
    ch = ch " '" ARGV[br] "'"
  while ("cygpath -iw" ch | getline)
    de = de " '" $0 "'"
  system("Notepad2 +" de)
}
