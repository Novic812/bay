#!/usr/bin/awk -f
BEGIN {
   while ("curl -I -L " ARGV[1] | getline)
   {
      if (index(tolower($1), "content-length"))
      {
         $2 = sprintf("%'d", $2)
      }
      if (index($1, ":"))
      {
         $1 = sprintf("\33[1;33m%s\33[m", $1)
      }
      print
   }
}
