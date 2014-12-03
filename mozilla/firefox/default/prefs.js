/*
user.js is bad because it will trash any changes you have made on restart
*/

/*
download.dir
  save files to
download.folderList
  always ask me where to save files
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
user_pref('browser.download.dir', 'c:\\home\\local\\desktop');
user_pref('browser.download.folderList', 0);
user_pref('browser.newtab.url', 'about:blank');
user_pref('browser.places.smartBookmarksVersion', 1);
user_pref('browser.startup.homepage_override.mstone', 'ignore');
user_pref('browser.startup.page', 3);
user_pref('browser.tabs.drawInTitlebar', false);
user_pref('browser.urlbar.autoFill', false);
user_pref('browser.urlbar.trimURLs', false);

/*
policy.maonoscript.sites
  whitelist
*/
user_pref('capability.policy.maonoscript.sites', ' \
  facebook.com akamaihd.net \
  followshows.com http://followshows.com jquery.com bootstrapcdn.com \
  github.com https://github.com \
  gmane.org \
  google.com gstatic.com googleapis.com \
  hulu.com huluim.com \
  imgur.com http://imgur.com \
  jottit.com \
  liveleak.com \
  microsoft.com s-microsoft.com aspnetcdn.com asp.net \
  mozilla.org mozilla.net \
  owncloud.org http://owncloud.org \
  reddit.com redditstatic.com \
  stackoverflow.com http://stackoverflow.com http://superuser.com \
    http://serverfault.com stackexchange.com http://stackexchange.com \
    http://askubuntu.com sstatic.net mathjax.org \
  wikipedia.org wikimedia.org \
  youtube.com ytimg.com \
');

/*
policy.dataSubmissionPolicyResponseTime
  dxr.mozilla.org/mozilla-central/source/services/datareporting/policy.jsm
*/
user_pref('datareporting.policy.dataSubmissionPolicyResponseTime',
  '1325397600000');

/*
currentVersion
  remember "allow some non-intrusive advertising" setting
frameobjects
  do not show tabs on flash
hideContributeButton
  hide contribute button
*/
user_pref('extensions.adblockplus.currentVersion', '2');
user_pref('extensions.adblockplus.frameobjects', false);
user_pref('extensions.adblockplus.hideContributeButton', true);

/*
warnOnAboutConfig
  about:config warning
*/
user_pref('general.warnOnAboutConfig', false);

/*
allowURLBarJS
  javascript: URIs typed or pasted in the address bar
firstRunRedirection
  do not display the release notes on updates
notify
  show message about blocked scripts
*/
user_pref('noscript.allowURLBarJS', true);
user_pref('noscript.firstRunRedirection', false);
user_pref('noscript.notify', false);

/*
rememberSignons
  do not remember passwords
*/
user_pref('signon.rememberSignons', false);
