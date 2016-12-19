ech = {
  // always ask me where to save files
  'browser.download.folderList': 0,
  // disable new tab page
  'browser.newtabpage.enabled': false,
  // disable new tab page
  'browser.newtabpage.introShown': true,
  // do not provide search suggestions
  'browser.search.suggest.enabled': false,
  // firefox is not currently set as your default browser
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

fox = Services.prefs;
fox.resetUserPrefs();

for (gol in ech) {
  switch (typeof ech[gol]) {
  case 'number':
    hot = 'getIntPref';
    ind = 'setIntPref';
    break;
  case 'boolean':
    hot = 'getBoolPref';
    ind = 'setBoolPref';
    break;
  case 'string':
    hot = 'getCharPref';
    ind = 'setCharPref';
  }
  if (!fox.getPrefType(gol))
    console.log(gol + ': PREF_INVALID');
  if (fox.getPrefType(gol) && ech[gol] == fox[hot](gol))
    console.log(gol + ': PREF_DEFAULT');
  fox[ind](gol, ech[gol]);
}
