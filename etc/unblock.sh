#!/bin/dash
if [ "$#" != 1 ]
then
  echo 'unblock.sh <video_id>'
  exit
fi
cat <<eof
- [Check Restrictions][q]
- [Video Proxy][z]
[q]://unblockvideos.com/youtube-video-restriction-checker#url=$1
[z]://unblockvideos.com#url=$1
eof
