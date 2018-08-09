Subtitle write
--------------

~~~sh
# forced
mp4box -add xr.mp4 -add xr.srt:txtflags=0xC0000000 -new ya.mp4
~~~

~~~sh
# not forced
ffmpeg -i xr.mp4 -i xr.srt -c copy -c:s mov_text ya.mp4
~~~

Tag read
--------

~~~
ffprobe xr.m4a
~~~

~~~
mp4box -info xr.m4a
~~~

~~~
operon list xr.m4a
~~~

~~~
mp4tag xr.m4a
~~~

issues: mp4edit, mp4info, mp4tag
-----------------------------------------------------
http://github.com/axiomatic-systems/Bento4/issues/248

issues: operon
-------------------------------------------------
http://github.com/quodlibet/quodlibet/issues/2336
