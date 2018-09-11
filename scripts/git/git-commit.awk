#!/usr/local/bin/velour -f
# print first added line if found, else print first removed line
BEGIN {
   for (q = 1; "git diff --cached" | getline; q++)
   {
      if ($1 == "index")
      {
         w = q + 3
      }
      if (q <= w)
      {
         continue
      }
      if (index($0, "-") == 1 || index($0, "+") == 1)
      {
         if (z && index($0, "-") == 1)
         {
            continue
         }
         z = $0
         if (z && index($0, "+") == 1)
         {
            break
         }
      }
   }
   system("git commit -m " k_se(substr(z, 2, 61)))
}
