#!/bin/dash -e
# turn on access for less secure apps
# https://www.google.com/settings/security/lesssecureapps
if [ "$#" != 4 ]
then
  echo 'mailing-list.sh [from name] [user] [password] [URL]'
  exit
fi
fro=$1 use=$2 pas=$3 url=$4
uf=$(mktemp /tmp/upload-file-XXX.txt)
mr=$(mktemp /tmp/mail-rcpt-XXX.txt)

curl "$url" |
awk '
BEGIN {
  ARGC = 0
  FS = OFS = ": "
}
$1 == "Date" {
  split($2, wh, / [-+]/)
}
$1 == "From" {
  split($2, xr, " <")
  $2 = ARGV[1]
  print
}
$1 == "To" {
  sub(" at ", "@")
  sub(" dot ", ".")
  print
  print $2 > ARGV[2]
}
$1 == "Subject" {
  if ($2 != "Re") $2 = "Re: " $2
  print
}
tolower($1) == "message-id" {
  $1 = "In-Reply-To"
  print
}
!ya && !$0 {
  ya = NR
}
ya && NR == ya + 1 {
  printf "On %s, %s wrote:\n", wh[1], xr[1]
}
ya && $0 {
  $0 = "> " $0
}
ya
' "$fro" "$mr" > "$uf"

"$EDITOR" "$uf"
read mr < "$mr"
curl --mail-from "$use"@gmail.com --mail-rcpt "$mr" --upload-file "$uf" \
smtps://"$use":"$pas"@smtp.gmail.com
