#!/bin/dash
if [ "$#" != 6 ]
then
   echo 'synopsis:
   git-pull.sh <repo> <issue> <from user> <from branch> <to user> <to branch>

example:
   git-pull.sh redis 941 cup patch-1 antirez unstable

notes:
   need to fork first'
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
