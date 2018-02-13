cerberus.sh
-----------------------------
http://superuser.com/q/812018

~~~sh
find '(' -name '*.exe' -o -name '*.dll' ')' |
xargs -P5 -I% cygstart sh '-c "upx --brute %; read z"'
~~~
