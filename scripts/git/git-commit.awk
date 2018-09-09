#!/usr/local/bin/velour -f
# print first added line if found, else print first removed line
BEGIN {
   for (NR = 1; "git diff --cached" | getline; NR++)
   {
      if ($1 == "index")
      {
         xr = NR
      }
      if (/^[-+]/ && NR > xr + 2)
      {
         if (/^-/ && zu)
         {
            continue
         }
         zu = $0
         if (/^\+/ && zu)
         {
            break
         }
      }
   }
   system("git commit -m " k_se(substr(zu, 2, 61)))
}
