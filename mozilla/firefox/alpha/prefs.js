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
  alternativeto.net http://alternativeto.net https://alternativeto.net \
    msecnd.net http://msecnd.net https://msecnd.net \
    jsdelivr.net http://jsdelivr.net https://jsdelivr.net \
    algolia.net http://algolia.net https://algolia.net \
  amazon.com http://amazon.com https://amazon.com \
    images-amazon.com http://images-amazon.com https://images-amazon.com \
  avclub.com http://avclub.com https://avclub.com \
    onionstatic.com http://onionstatic.com https://onionstatic.com \
  bandcamp.com http://bandcamp.com https://bandcamp.com \
    bcbits.com http://bcbits.com https://bcbits.com \
  blogspot.com http://blogspot.com https://blogspot.com \
    blogger.com http://blogger.com https://blogger.com \
  chocolatey.org http://chocolatey.org https://chocolatey.org \
  cloudflare.com http://cloudflare.com https://cloudflare.com \
  disqus.com http://disqus.com https://disqus.com \
    disquscdn.com http://disquscdn.com https://disquscdn.com \
  facebook.com http://facebook.com https://facebook.com \
    akamaihd.net http://akamaihd.net https://akamaihd.net \
  followshows.com http://followshows.com https://followshows.com \
    jquery.com http://jquery.com https://jquery.com \
    bootstrapcdn.com http://bootstrapcdn.com https://bootstrapcdn.com \
  explainshell.com http://explainshell.com https://explainshell.com \
  github.com http://github.com https://github.com \
    githubusercontent.com http://githubusercontent.com \
    https://githubusercontent.com \
  gmane.org http://gmane.org https://gmane.org \
  google.com http://google.com https://google.com \
    gstatic.com http://gstatic.com https://gstatic.com \
    googleapis.com http://googleapis.com https://googleapis.com \
  hulu.com http://hulu.com https://hulu.com \
    huluim.com http://huluim.com https://huluim.com \
  imgur.com http://imgur.com https://imgur.com \
  jottit.com http://jottit.com https://jottit.com \
  kickass.to http://kickass.to https://kickass.to \
    kastatic.com http://kastatic.com https://kastatic.com \
  liveleak.com http://liveleak.com https://liveleak.com \
  microsoft.com http://microsoft.com https://microsoft.com \
    s-microsoft.com http://s-microsoft.com https://s-microsoft.com \
    aspnetcdn.com http://aspnetcdn.com https://aspnetcdn.com \
    asp.net http://asp.net https://asp.net \
  mozilla.org http://mozilla.org https://mozilla.org \
    mozilla.net http://mozilla.net https://mozilla.net \
  musicbrainz.org http://musicbrainz.org https://musicbrainz.org \
  owncloud.org http://owncloud.org https://owncloud.org \
  reddit.com http://reddit.com https://reddit.com \
    redditstatic.com http://redditstatic.com https://redditstatic.com \
  rottentomatoes.com http://rottentomatoes.com https://rottentomatoes.com \
    cloudfront.net http://cloudfront.net https://cloudfront.net \
  sleepyti.me http://sleepyti.me https://sleepyti.me \
  soundcloud.com http://soundcloud.com https://soundcloud.com \
    sndcdn.com http://sndcdn.com https://sndcdn.com \
  sourceforge.net http://sourceforge.net https://sourceforge.net \
    fsdn.com http://fsdn.com https://fsdn.com \
  stackoverflow.com http://stackoverflow.com https://stackoverflow.com \
    superuser.com http://superuser.com https://superuser.com \
    serverfault.com http://serverfault.com https://serverfault.com \
    stackexchange.com http://stackexchange.com https://stackexchange.com \
    askubuntu.com http://askubuntu.com https://askubuntu.com \
    sstatic.net http://sstatic.net https://sstatic.net \
    mathjax.org http://mathjax.org https://mathjax.org \
  vimeo.com http://vimeo.com https://vimeo.com \
    vimeocdn.com http://vimeocdn.com https://vimeocdn.com \
  wikipedia.org http://wikipedia.org https://wikipedia.org \
    wikimedia.org http://wikimedia.org https://wikimedia.org \
  youtube.com http://youtube.com https://youtube.com \
    ytimg.com http://ytimg.com https://ytimg.com \
    allow-any-origin.appspot.com \
    http://allow-any-origin.appspot.com https://allow-any-origin.appspot.com \
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
ABE.enabled
  need for musicbrainz picard
allowURLBarJS
  javascript: URIs typed or pasted in the address bar
firstRunRedirection
  do not display the release notes on updates
notify
  show message about blocked scripts
*/
user_pref('noscript.ABE.enabled', false);
user_pref('noscript.allowURLBarJS', true);
user_pref('noscript.firstRunRedirection', false);
user_pref('noscript.notify', false);

/*
rememberSignons
  do not remember passwords
*/
user_pref('signon.rememberSignons', false);
