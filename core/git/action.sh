#!/bin/dash
if [ "$#" != 1 ]
then
   echo 'synopsis: action.sh <operation>
operations:
   -i: install
   -r: remove'
   exit 1
fi
case $1 in
-i)
   ln -f -s "$PWD"/.gitconfig ~
   ;;
-r)
   rm -f ~/.gitconfig
esac
