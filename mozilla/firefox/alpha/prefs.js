/*
user.js is bad because it will trash any changes you have made on restart
*/

/*
download.dir
  save files to
download.folderList
  always ask me where to save files
migration.version
  disable sync promo
newtab.url
  disable new tab page
places.smartBookmarksVersion
  do not generate smart bookmarks
startup.homepage_override.mstone
  disable first run page
startup.page
  show windows and tabs from last time
syncPromoViewsLeftMap
  disable sync promo
tabs.drawInTitlebar
  title bar
taskbar.lists.enabled
  jumplist setting
urlbar.autoFill
  disable URL autocomplete
urlbar.trimURLs
  do not trim URLs
*/

user_pref('browser.download.dir', 'c:\\home\\local\\desktop');
user_pref('browser.download.folderList', 0);
user_pref("browser.migration.version", 22);
user_pref('browser.newtab.url', 'about:blank');
user_pref('browser.places.smartBookmarksVersion', 1);
user_pref('browser.startup.homepage_override.mstone', 'ignore');
user_pref('browser.startup.page', 3);
user_pref('browser.syncPromoViewsLeftMap', '{"addons":0}');
user_pref('browser.tabs.drawInTitlebar', false);
user_pref('browser.taskbar.lists.enabled', false);
user_pref('browser.urlbar.autoFill', false);
user_pref('browser.urlbar.trimURLs', false);

/*
cloudflare.com
  alternativeto.net explainshell.com
*/
user_pref('capability.policy.maonoscript.sites', ' \
  alternativeto.net http://alternativeto.net msecnd.net jsdelivr.net \
    algolia.net \
  blogspot.com blogger.com \
  chocolatey.org https://chocolatey.org \
  cloudflare.com \
  disqus.com https://disqus.com disquscdn.com \
  facebook.com akamaihd.net \
  followshows.com http://followshows.com jquery.com bootstrapcdn.com \
  explainshell.com http://explainshell.com \
  github.com https://github.com githubusercontent.com \
  gmane.org \
  google.com gstatic.com googleapis.com \
  hulu.com huluim.com \
  imgur.com http://imgur.com https://imgur.com \
  jottit.com \
  kickass.so kastatic.com \
  liveleak.com \
  microsoft.com s-microsoft.com aspnetcdn.com asp.net \
  mozilla.org mozilla.net \
  owncloud.org http://owncloud.org \
  reddit.com redditstatic.com \
  sleepyti.me http://sleepyti.me \
  soundcloud.com https://soundcloud.com sndcdn.com \
  sourceforge.net https://sourceforge.net fsdn.com \
  stackoverflow.com http://stackoverflow.com https://stackoverflow.com \
    http://superuser.com https://superuser.com http://serverfault.com \
    stackexchange.com http://stackexchange.com askubuntu.com \
    http://askubuntu.com sstatic.net mathjax.org \
  vimeo.com http://vimeo.com vimeocdn.com \
  wikipedia.org wikimedia.org \
  youtube.com ytimg.com allow-any-origin.appspot.com \
');

/*
dataSubmissionPolicyAcceptedVersion
dataSubmissionPolicyNotifiedTime
  dxr.mozilla.org/mozilla-central/source/services/datareporting/policy.jsm
*/
user_pref('datareporting.policy.dataSubmissionPolicyAcceptedVersion', 2);
user_pref('datareporting.policy.dataSubmissionPolicyNotifiedTime',
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
animation_mode
  fuck gifs once and for all
*/
user_pref('image.animation_mode', 'none');

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
