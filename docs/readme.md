Style Guide
===========

CSS
-----

~~~
style.css
~~~

http://developer.mozilla.org/docs/Learn/Getting_started_with_the_web/CSS_basics

Elements
-----------
1. `<head>`
2. `<link>`
3. `<meta>`
4. `<title>`
5. `<script>`

`og:image` requires protocol absolute URL

- http://developer.mozilla.org/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML
- http://iframely.com/debug
- http://github.com/itteco/iframely/issues/195

Files
--------------
1. `readme.md`
  - Author
  - Install
  - See also
2. `license.md`
3. `notes.md`
4. `examples.md`

- http://archlinux.org/pacman/pacman.8.html
- http://wikipedia.org/wiki/README
- http://wikipedia.org/wiki/Wikipedia:Manual_of_Style/Layout

Folders
---------
1. `core`
2. `docs`
3. `tests`
4. `scripts`
5. `extras`

- http://github.com/django/django
- http://ruby-doc.org/core

HTML
-----

~~~
index.html
~~~

http://developer.mozilla.org/docs/Learn/Getting_started_with_the_web/HTML_basics

Icon
-----

~~~
icon.ico
~~~

http://developer.mozilla.org/docs/Web/Manifest

Image
-----

~~~
image.jpg
~~~

http://developer.mozilla.org/docs/Learn/Getting_started_with_the_web/Dealing_with_files

-----

If you put an image into a `docs` folder, then turn on GitHub Pages, it gives
you this nice link:

http://cup.github.io/rosso/image.jpg

However if you try to use that link with a `readme.md`, it will turn into this:

http://camo.githubusercontent.com/a11027e72e00612c421b1cb0387c19e271b318b1/6...

-----

This URL is valid:

~~~
http://raw.githubusercontent.com/cup/rosso/master/hero.jpg
~~~

but this one is shorter:

~~~
http://github.com/cup/rosso/raw/master/hero.jpg
~~~

-----

This is a valid URL format for image:

~~~
//github.com/cup/rosso/raw/master/hero.jpg
~~~

but not for `readme.md`. This is another valid URL format for image:

~~~
http://github.com/cup/rosso/raw/master/hero.jpg
~~~

but not for mobile. Here is proper format:

~~~
https://github.com/cup/rosso/raw/master/hero.jpg
~~~

JavaScript
----------

~~~
main.js
~~~

http://developer.mozilla.org/docs/Learn/Getting_started_with_the_web/JavaScript_basics

JSON
-----

~~~
data.json
~~~

- http://github.com/stedolan/jq/blob/master/tests/modules/data.json
- http://hyperpolyglot.org/scripting2
- http://taniarascia.com/how-to-use-the-javascript-fetch-api-to-get-json

Padding newlines after blocks
---------------------------------------------------------------------
To save space, I thought about removing the newlines between function
definitions. However this is not recommended:

http://github.com/airbnb/javascript#whitespace--after-blocks
