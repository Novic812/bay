#!/usr/bin/awk -f
# www.google.com/settings/security/lesssecureapps
function quote(str,   d, m, x, y, z) {
  d = "\47"; m = split(str, x, d)
  for (y in x) z = z d x[y] (y < m ? d "\\" d : d)
  return z
}
BEGIN {
  if (ARGC != 6) {
    print "mailing-list.awk [from name] [user] [password] [to] [URL]"
    exit
  }
  fro = ARGV[1]
  use = ARGV[2]
  pas = ARGV[3]
  to = ARGV[4]
  url = ARGV[5]
  FS = OFS = ": "
  "mktemp" | getline uf
  while ("curl " quote(url) | getline) {
    NR++
    if (zu) {
      if (NR == zu + 1)
        printf "On %s, %s wrote:\n", xr[1], ya[1] >> uf
      print $0 ? "> " $0 : "" >> uf
    }
    else if ($1 == "Date")
      split($2, xr, / [-+]/)
    else if ($1 == "From") {
      split($2, ya, " <")
      $2 = fro
      print >> uf
      print "To", to >> uf
    }
    else if ($1 == "Subject") {
      if ($2 != "Re") $2 = "Re: " $2
      print >> uf
    }
    else if (tolower($1) == "message-id") {
      $1 = "References"
      print >> uf
    }
    else if (!$0) {
      zu = NR
      print "Content-Type: text; charset=UTF-8" >> uf
      printf "User-Agent: mailing-list.awk 1.0.0\n\n" >> uf
    }
  }
  system(ENVIRON["EDITOR"] " " uf)
  print "Press Enter to continue..."
  getline < "-"
  system(sprintf("curl --mail-from %s@gmail.com --mail-rcpt %s " \
  "--upload-file %s smtps://%s:%s@smtp.gmail.com",
  quote(use), quote(to), quote(uf), quote(use), quote(pas)))
}
