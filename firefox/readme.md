
Start with Profile Manager
--------------------------

~~~
firefox -P
~~~

http://developer.mozilla.org/docs/Mozilla/Command_Line_Options

Bypass Profile Manager and launch application with a profile
------------------------------------------------------------

~~~
firefox -no-remote -P November
~~~

http://bugzilla.mozilla.org/show_bug.cgi?id=855899

http://developer.mozilla.org/docs/Mozilla/JavaScript_code_modules/Services.jsm
------------------------------------------------------------------------------
- Services.io
- Services.perms
- Services.prefs

http://developer.mozilla.org/docs/Mozilla/Tech/XPCOM/Reference/Interface/nsIPrefService
--------------------------------------------------------------------------------
- Services.prefs.getPrefType
- Services.prefs.prefHasUserValue
- Services.prefs.resetUserPrefs
- Services.prefs.setBoolPref
- Services.prefs.setCharPref
- Services.prefs.setIntPref

http://developer.mozilla.org/docs/Mozilla/Tech/XPCOM/Reference/Interface/nsIPermissionManager
--------------------------------------------------------------------------------
Services.perms.add

http://developer.mozilla.org/docs/Mozilla/Tech/XPCOM/Reference/Interface/nsIIOService
--------------------------------------------------------------------------------
Services.io.newURI
