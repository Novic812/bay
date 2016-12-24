qu = {
  // always ask me where to save files
  'browser.download.folderList': 0,
  // disable new tab page
  'browser.newtabpage.enabled': false,
  // disable new tab page
  'browser.newtabpage.introShown': true,
  // keep ‘most visited’ from reappearing
  'browser.places.smartBookmarksVersion': 1,
  // do not provide search suggestions
  'browser.search.suggest.enabled': false,
  // Firefox is not currently set as your default browser
  'browser.shell.checkDefaultBrowser': false,
  // disable first run page
  'browser.startup.homepage_override.mstone': 'ignore',
  // show windows and tabs from last time
  'browser.startup.page': 3,
  // title bar
  'browser.tabs.drawInTitlebar': false,
  // multiprocess windows
  'browser.tabs.remote.autostart.2': false,
  // jumplist setting
  'browser.taskbar.lists.enabled': false,
  // disable URL autocomplete
  'browser.urlbar.autoFill': false,
  // switch to tab
  'browser.urlbar.suggest.openpage': false,
  // trim URLs
  'browser.urlbar.trimURLs': false,
  // Firefox automatically sends some data to Mozilla
  'datareporting.policy.dataSubmissionPolicyBypassNotification': true,
  // browser console
  'devtools.chrome.enabled': true,
  // disable pocket
  'extensions.pocket.enabled': false,
  // congratulations, you've installed stylish
  'extensions.stylish.firstRun': 1,
  // about:config warning
  'general.warnOnAboutConfig': false,
  // share your location
  'geo.enabled': false,
  // play gifs
  'image.animation_mode': 'once',
  // reader view
  'reader.parse-on-load.enabled': false,
  // need this to use bookmarklets @ github.com
  'security.csp.enable': false,
  // remember passwords
  'signon.rememberSignons': false
};

xr = Services.prefs;
xr.resetUserPrefs();

for (ya in qu) {
  switch (typeof qu[ya]) {
  case 'number':
    zu = 'Int';
    break;
  case 'boolean':
    zu = 'Bool';
    break;
  case 'string':
    zu = 'Char';
  }
  if (!xr.getPrefType(ya)) {
    console.log(ya + ': PREF_INVALID');
  }
  xr[`set${zu}Pref`](ya, qu[ya]);
  if (!xr.prefHasUserValue(ya)) {
    console.log(ya + ': PREF_DEFAULT');
  }
}
