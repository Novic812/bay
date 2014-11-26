/*
newtab.url
  disable new tab page
places.smartBookmarksVersion
  do not generate smart bookmarks
startup.homepage_override.mstone
  disable first run page
startup.page
  show windows and tabs from last time
tabs.drawInTitlebar
  title bar
urlbar.autoFill
  disable URL autocomplete
urlbar.trimURLs
  do not trim URLs
*/
user_pref('browser.newtab.url', 'about:blank');
user_pref('browser.places.smartBookmarksVersion', 1);
user_pref('browser.startup.homepage_override.mstone', 'ignore');
user_pref('browser.startup.page', 3);
user_pref('browser.tabs.drawInTitlebar', false);
user_pref('browser.urlbar.autoFill', false);
user_pref('browser.urlbar.trimURLs', false);

/*
capability.policy.maonoscript.sites
  whitelist
noscript.notify
  show message about blocked scripts
noscript.version
  this is required after install
*/
user_pref('capability.policy.maonoscript.sites',
  ' \
  facebook.com akamaihd.net \
  github.com https://github.com \
  google.com gstatic.com googleapis.com \
  imgur.com http://imgur.com \
  jottit.com \
  reddit.com redditstatic.com \
  http://stackoverflow.com http://superuser.com http://serverfault.com \
    http://stackexchange.com stackexchange.com sstatic.net \
  youtube.com ytimg.com \
  '
);
user_pref('noscript.notify', false);
user_pref('noscript.version', '2.6.9.5');

/*
currentVersion
  remember "allow some non-intrusive advertising" setting
hideContributeButton
  hide contribute button
*/
user_pref('extensions.adblockplus.currentVersion', '2');
user_pref('extensions.adblockplus.hideContributeButton', true);

/*
rememberSignons
  do not remember passwords
*/
user_pref('signon.rememberSignons', false);
