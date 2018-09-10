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
   install -D -t "$APPDATA"/mozilla/firefox/profiles/mike/chrome userchrome.css
   ;;
-r)
   rm -f "$APPDATA"/mozilla/firefox/profiles/mike/chrome/userchrome.css
esac
