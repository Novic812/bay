
~~~sh
rsync -v -v --delete-excluded --omit-dir-times --recursive --times \
--modify-window 2 --exclude '*.flac' /Music/ /cygdrive/f
~~~
