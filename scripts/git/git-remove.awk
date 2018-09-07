#!/usr/local/bin/velour -f
# Git remove sensitive data
BEGIN {
   if (ARGC != 2)
   {
      print "git-remove.awk <file>"
      exit 1
   }
   a_new(q, "git", "filter-branch", "-f", "--prune-empty",
   "--tag-name-filter", "cat",
   "--index-filter", "git rm --cached --ignore-unmatch " k_se(ARGV[1]),
   "--", "--all")
   kv_trace(q)

   # Cleanup and reclaming space
   system("rm -r .git/refs/original")
   system("git reflog expire --expire=now --all")
   system("git gc --prune=now")
   system("git gc --aggressive --prune=now")
}
