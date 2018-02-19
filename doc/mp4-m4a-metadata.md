Read faststart
--------------

~~~sh
ffprobe infile.m4a 2>&1 | awk '
/major_brand/ && /M4A/ && $0 = "TRUE"
/major_brand/ && /isom/ && $0 = "FALSE"
'
~~~

~~~sh
mp4box -info infile.m4a 2>&1 | awk '
/Brand M4A/ && $0 = "TRUE"
/Brand isom/ && $0 = "FALSE"
'
~~~

~~~
mp4info infile.m4a | awk '
/fast start/ && /yes/ && $0 = "TRUE"
/fast start/ && /no/ && $0 = "FALSE"
'
~~~

Read tags
---------

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

Write cover art
---------------

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

Write faststart
---------------

~~~
ffmpeg -i infile.m4a -c copy -movflags faststart outfile.m4a
~~~

~~~
mp4box -ipod infile.m4a
~~~

~~~
mp4edit infile.m4a outfile.m4a
~~~

Write subtitles
---------------

~~~
mp4box -add infile.mp4 -add infile.srt -new outfile.mp4
~~~

- http://ffmpeg.org/pipermail/ffmpeg-devel/2013-July/145365.html
- http://github.com/axiomatic-systems/Bento4/issues/104
- http://github.com/axiomatic-systems/Bento4/issues/248
- http://github.com/gpac/gpac/issues/693
- http://github.com/gpac/gpac/issues/990
- http://github.com/quodlibet/quodlibet/issues/2336
- http://github.com/quodlibet/quodlibet/issues/2337
- http://github.com/quodlibet/quodlibet/issues/2781
- http://trac.ffmpeg.org/ticket/2798
