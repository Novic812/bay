#!/bin/dash -e
# Git remove sensitive data
# help.github.com/articles/remove-sensitive-data
if [ "$#" != 1 ]
then
  echo 'git remove.sh <file>'
  exit 1
fi

git filter-branch --index-filter "git rm --cached --ignore-unmatch '$1'" \
  --prune-empty --tag-name-filter cat -- --all

# Cleanup and reclaming space
rm -r .git/refs/original
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now
