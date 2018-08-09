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

issues: mp4edit, mp4info, mp4tag
-----------------------------------------------------
http://github.com/axiomatic-systems/Bento4/issues/248
