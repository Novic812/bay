#!/bin/dash -e
if [ "$#" = 0 ]
then
  cat <<'eof'
SYNOPSIS
  net-download.sh <targets>

TARGETS
  http://youtube.com/watch?v=qjgnOP8f5NU
  http://soundcloud.com/greco-roman/roosevelt-night-moves
eof
  exit 1
fi

pa=$(date -d '-1 year' +%Y%m%d)
mkdir -p % %-new %-old
touch %/h.txt %/f.txt %/c.txt

for each
do
  char=$((char + 1))
  if [ "$char" -ge 2 ]
  then
    printf 'starting link %s\n' "$char"
  fi
  if grep -F -q "$each" %/h.txt
  then
    printf '%s\nhas already been recorded in archive\n' "$each"
    continue
  fi

  # download
  rm -f *.info.json
  # FIXME -id3v2_version 3
  youtube-dl --add-metadata --format m4a/mp3 --output '%(title)s.%(ext)s' \
    --write-info-json --youtube-skip-dash-manifest "$each"
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
  set "$each" "$upload_date" "$dest" "$_filename"
  printf '%s\t%s\t%s\t%s\n' "$@" >> %/h.txt
done

while IFS="${IFS# }" read each upload_date source _filename
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
  printf '%s\n' "$_filename"
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
  ' %/h.txt "$each" | io-read %/h.txt
done < %/h.txt
