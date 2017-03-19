#!/bin/dash -e
if [ "${1#/}" != "$1" ]
then k=$(cygpath -w "$1")
elif [ "$#" != 0 ]
then k=$1
fi
exec Notepad2 ${k+"$k"}
