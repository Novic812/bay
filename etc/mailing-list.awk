#!/usr/bin/awk -f 
function quote(str,   d, m, x, y, z) {
  d = "\47"; m = split(str, x, d)
  for (y in x) z = z d x[y] d (y < m ? "\\" d : "")
  return z
}
BEGIN {
  if (ARGC != 5) {
    print "mailing-list.awk [from name] [user] [password] [URL]"
    exit
  }
  fro = ARGV[1]
  use = ARGV[2]
  pas = ARGV[3]
  url = ARGV[4]
  FS = OFS = ": "
  "mktemp" | getline uf
  while ("curl " quote(url) | getline) {
    if ($1 == "Date") {
      split($2, xr, / [-+]/)
    }
    if ($1 == "From") {
      split($2, ya, " <")
      $2 = fro
      print >> uf
    }
    if ($1 == "To") {
      sub(" at ", "@")
      sub(" dot ", ".")
      print >> uf
      mr = $2
    }
    if ($1 == "Subject") {
      if ($2 != "Re") $2 = "Re: " $2
      print >> uf
    }
    if (tolower($1) == "message-id") {
      $1 = "In-Reply-To"
      print >> uf
    }
    NR++
    if (!zu && !$0) {
      zu = NR
      print "User-Agent: mailing-list.awk" >> uf
    }
    if (zu && NR == zu + 1) {
      printf "On %s, %s wrote:\n", xr[1], ya[1] >> uf
    }
    if (zu && $0) {
      $0 = "> " $0
    }
    if (zu) {
      print >> uf
    }
  }
  system(ENVIRON["EDITOR"] " " uf)
  system(sprintf("curl --mail-from %s@gmail.com --mail-rcpt %s " \
  "--upload-file %s smtps://%s:%s@smtp.gmail.com",
  quote(use), mr, uf, quote(use), quote(pas)))
}
