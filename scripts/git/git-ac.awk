#!/usr/bin/awk -f
BEGIN {
   if (!system("git diff --cached --quiet"))
   {
      system("git add --all " a_join(ARGV, " "))
   }
   # print first added line if found, else print first removed line
   while ("git diff --cached" | getline)
   {
      if (index($0, "i") == 1)
      {
         xr = NR
      }
      if (/^[-+]/ && NR > xr + 2)
      {
         if (/^-/ && zu)
         {
            next
         }
         zu = $0
         if (/^\+/ && zu)
         {
            exit
         }
      }
   }
   system("git commit -m " substr(zu, 2, 61))
}
