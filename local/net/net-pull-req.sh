#!/bin/dash
# need to fork first
# stackoverflow.com/a/4529172
if [ "$#" != 6 ]
then
cat <<'eof'
SYNOPSIS
  pr.sh <repo> <issue> <from user> <from branch> <to user> <to branch>

EXAMPLE
  pr.sh jq 1671 svnpenn patch-1 stedolan master
eof
  exit 1
fi
issue=$2
f_user=$3
f_branch=$4
t_branch=$6
url=https://api.github.com/repos/$5/$1/pulls

curl -u "$f_user" -d @- "$url" <<eof
{
  "base": "$t_branch",
  "head": "$f_user:$f_branch",
  "issue": $issue
}
eof
