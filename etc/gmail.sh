#!/bin/dash -e
# turn on access for less secure apps
# https://www.google.com/settings/security/lesssecureapps
if [ "$#" != 7 ]
then
  echo 'gmail.sh [from] [user] [password]' \
  '[to] [subject] [references] [body file]'
  exit
fi
fro=$1 use=$2 pas=$3 to=$4 sub=$5 ref=$6 bod=$7
q=$(mktemp /tmp/gmail-XXX.txt)
cat - "$bod" > "$q" <<eof
from: $fro
to: $to
subject: $sub
references: $ref

eof
curl --mail-rcpt "$to" --upload-file "$q" --user "$use":"$pas" \
smtps://smtp.gmail.com
