Cover art add
-------------

~~~sh
# fast
operon image-set xr.jpg xr.m4a
~~~

~~~sh
# slow
mp4box -itags cover=xr.jpg xr.m4a
~~~

~~~sh
# 2 files
mp4tag --add Cover:JPEG:xr.jpg xr.m4a ya.m4a
~~~

Cover art remove
----------------

~~~
operon image-clear xr.m4a
~~~

~~~
mp4box -itags cover= xr.m4a
~~~

~~~
mp4tag --remove Cover xr.m4a ya.m4a
~~~

faststart read
--------------

~~~sh
ffprobe -v 56 xr.m4a 2>&1 | awk '/moov/{exit}/mdat/{exit 1}'
~~~

~~~sh
mp4box -info xr.m4a 2>&1 | grep -q moov
~~~

~~~sh
mp4info xr.m4a | grep -q 'fast start.*yes'
~~~

faststart write
---------------

~~~
ffmpeg -i xr.m4a -c copy -movflags faststart ya.m4a
~~~

~~~
mp4box -ipod xr.m4a
~~~

~~~
mp4edit xr.m4a ya.m4a
~~~

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

Issues
----------------------------------------------------------------
- http://ffmpeg.org/pipermail/ffmpeg-devel/2013-July/145365.html
- http://github.com/axiomatic-systems/Bento4/issues/104
- http://github.com/axiomatic-systems/Bento4/issues/248
- http://github.com/gpac/gpac/issues/693
- http://github.com/quodlibet/quodlibet/issues/2336
- http://github.com/quodlibet/quodlibet/issues/2337
- http://github.com/quodlibet/quodlibet/issues/2781
- http://trac.ffmpeg.org/ticket/2798
