#!/usr/local/bin/shlib
if [ "$#" = 0 ]
then
  cat <<'eof'
SYNOPSIS
  music-download.sh <targets>

TARGETS
  http://youtube.com/watch?v=qjgnOP8f5NU
  http://soundcloud.com/greco-roman/roosevelt-night-moves
  http://reddit.com/r/stationalpha/new
eof
  exit 1
fi

pa=$(date -d '-1 year' +%Y%m%d)
mkdir -p % %-new %-old
touch %/h.txt %/f.txt %/c.txt

{
  for each
  do
    case $each in
    *reddit*)
      music-reddit.awk ex "$each"
    ;;
    *)
      echo "$each"
    ;;
    esac
  done
} |
while read xr
do
  char=$((char+1))
  if [ "$char" -ge 2 ]
  then
    echo starting link "$char"
  fi
  if grep -Fq "$xr" %/h.txt
  then
    printf '%s\nhas already been recorded in archive\n' "$xr"
    continue
  fi

  # download
  rm -f *.info.json
  # FIXME -id3v2_version 3
  youtube-dl --add-metadata --format m4a/mp3 --output '%(title)s.%(ext)s' \
    --write-info-json --youtube-skip-dash-manifest "$xr"
  jq -r '
  {upload_date, _filename, ext} |
  to_entries |
  map("\(.key)=\(.value | @sh)") |
  .[]
  ' *.info.json > vars.sh
  . vars.sh
  rm *.info.json vars.sh

  # faststart
  if [ "$ext" = m4a ]
  then
    echo '[ffmpeg] moving the moov atom to the beginning of the file'
    tageditor set --index-pos front --force -f "$_filename"
  fi

  # gain
  aacgain -k -r -s s -m 10 "$_filename"
  if [ "$upload_date" -gt "$pa" ]
  then
    dest=1
    ya=%-new
  else
    dest=0
    ya=%-old
  fi
  mv "$_filename" "$ya"
  set "$xr" "$upload_date" "$dest" "$_filename"
  printf '%s\t%s\t%s\t%s\n' "$@" >> %/h.txt
done

while IFS="${IFS# }" read xr upload_date source _filename
do
  if [ ! -f %-new/"$_filename" ]
  then
    continue
  fi
  if [ "$upload_date" -gt "$pa" ]
  then
    dest=1
  else
    dest=0
  fi
  if [ "$source" = "$dest" ]
  then
    continue
  fi
  echo "$_filename"
  echo '[mv] file is now old, moving'
  mv %-new/"$_filename" %-old
  awk '
  BEGIN {
    ARGC--
    FS = OFS = "\t"
  }
  $1 == ARGV[2] {
    $3 = 0
  }
  1
  ' %/h.txt "$xr" | file_get %/h.txt
done < %/h.txt
