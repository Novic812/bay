cerberus.sh
-----------------------------
http://superuser.com/q/812018

~~~sh
find '(' -name '*.exe' -o -name '*.dll' ')' |
xargs -I % -P 5 cygstart sh '-c "upx --brute %; read z"'
~~~
