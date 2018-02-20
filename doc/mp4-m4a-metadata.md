Cover art add
-------------

~~~sh
# fast
operon image-set 1.jpg 1.m4a
~~~

~~~sh
# slow
mp4box -itags cover=1.jpg 1.m4a
~~~

~~~sh
# 2 files
mp4tag --add Cover:JPEG:1.jpg 1.m4a 2.m4a
~~~

Cover art remove
----------------

~~~
operon image-clear 1.m4a
~~~

~~~
mp4box -itags cover= 1.m4a
~~~

~~~
mp4tag --remove Cover 2.m4a 3.m4a
~~~

faststart read
--------------

~~~sh
ffprobe 2.m4a 2>&1 | grep -q M4A
~~~

~~~sh
mp4box -info 2.m4a 2>&1 | grep -q M4A
~~~

~~~sh
mp4info 2.m4a | grep -q M4A
~~~

faststart write
---------------

~~~
ffmpeg -i 1.m4a -c copy -movflags faststart 2.m4a
~~~

~~~
mp4box -ipod infile.m4a
~~~

~~~
mp4edit infile.m4a outfile.m4a
~~~

Subtitle write
--------------

~~~sh
# forced
mp4box -add 1.mp4 -add 1.srt:txtflags=0xC0000000 -new 2.mp4
~~~

~~~sh
# not forced
ffmpeg -i 1.mp4 -i 1.srt -c copy -c:s mov_text 2.mp4
~~~

tag read
--------

~~~
ffprobe infile.m4a
~~~

~~~
mp4box -info infile.m4a
~~~

~~~
operon list infile.m4a
~~~

~~~
mp4tag infile.m4a
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
