Disable HTTP referrer
---------------------

~~~js
Services.prefs.setIntPref('network.http.sendRefererHeader', 0);
~~~

[Start with Profile Manager][clo]
---------------------------------

~~~
firefox -P
~~~

[Bypass Profile Manager and launch application with a profile][855899]
----------------------------------------------------------------------

~~~
firefox -no-remote -P November
~~~

[Services.jsm][srvc]
--------------------
- Services.io
- Services.perms
- Services.prefs

[nsIPrefService][pref]
----------------------------
- Services.prefs.getPrefType
- Services.prefs.prefHasUserValue
- Services.prefs.resetUserPrefs
- Services.prefs.setBoolPref
- Services.prefs.setCharPref
- Services.prefs.setIntPref

[nsIPermissionManager][perm]
----------------------------
Services.perms.add

[nsIIOService][iosr]
--------------------
Services.io.newURI

[855899]:
//bugzilla.mozilla.org/show_bug.cgi?id=855899
[clo]:
//developer.mozilla.org/docs/mozilla/command_line_options
[iosr]:
//developer.mozilla.org/docs/Mozilla/Tech/XPCOM/Reference/Interface/nsIIOService
[perm]:
//developer.mozilla.org/docs/mozilla/tech/xpcom/reference/interface/nsipermissionmanager
[pref]:
//developer.mozilla.org/docs/mozilla/tech/xpcom/reference/interface/nsiprefservice
[srvc]:
//developer.mozilla.org/docs/Mozilla/JavaScript_code_modules/Services.jsm
