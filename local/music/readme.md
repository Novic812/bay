
~~~sh
rsync -vv --delete-excluded --omit-dir-times --recursive --times \
--modify-window 2 --exclude '*.flac' /Music/ /cygdrive/f
~~~

When adding musicbrainz release, make sure to include:

- release title
- artist
- type
- status
- date
- country
- release link
- format
- track titles
- track lengths
