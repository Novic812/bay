`cerberus.sh`
-------------

~~~sh
find '(' -name '*.exe' -o -name '*.dll' ')' |
xargs -I % -P 5 cygstart sh '-c "upx --brute %; read z"'
~~~

Further reading
---------------

http://superuser.com/questions/812018
