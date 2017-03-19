#!/bin/dash
if [ "$#" != 1 ]
then
  echo 'unblock.sh <video_id>'
  exit
fi

cat <<eof
- [$1 restrictions][q]
- [$1 proxy][z]
[q]://unblockvideos.com/youtube-video-restriction-checker#url=$1
[z]://unblockvideos.com#url=$1
eof
