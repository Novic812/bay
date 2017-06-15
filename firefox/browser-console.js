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
  // disable delay hiding mute tab
  'browser.tabs.delayHidingAudioPlayingIconMS': 0,
  // title bar
  'browser.tabs.drawInTitlebar': false,
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
  // disable HTTP referrer
  'network.http.sendRefererHeader': 0,
  // reader view
  'reader.parse-on-load.enabled': false,
  // need this to use bookmarklets @ github.com
  'security.csp.enable': false,
  // remember passwords
  'signon.rememberSignons': false
};

xr = {number: 'setIntPref', boolean: 'setBoolPref', string: 'setCharPref'};
ya = Services.prefs;
ya.resetUserPrefs();

for (zu in qu) {
  if (!ya.getPrefType(zu)) {
    console.log(zu + ': PREF_INVALID');
  }
  ya[xr[typeof qu[zu]]](zu, qu[zu]);
  if (!ya.prefHasUserValue(zu)) {
    console.log(zu + ': PREF_DEFAULT');
  }
}
