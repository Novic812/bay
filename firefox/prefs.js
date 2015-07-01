// user.js is bad because it will trash any changes you have made on restart

// always ask me where to save files
user_pref('browser.download.folderList', 0);

// disable sync promo
user_pref('browser.migration.version', 22);

// disable new tab page
user_pref('browser.newtab.url', 'about:blank');

// do not generate smart bookmarks
user_pref('browser.places.smartBookmarksVersion', 1);

// disable first run page
user_pref('browser.startup.homepage_override.mstone', 'ignore');

// show windows and tabs from last time
user_pref('browser.startup.page', 3);

// disable sync promo
user_pref('browser.syncPromoViewsLeftMap', '{"addons":0}');

// title bar
user_pref('browser.tabs.drawInTitlebar', false);

// jumplist setting
user_pref('browser.taskbar.lists.enabled', false);

// disable URL autocomplete
user_pref('browser.urlbar.autoFill', false);

// do not trim URLs
user_pref('browser.urlbar.trimURLs', false);

/*
cloudflare.com <- google.com musicvideomachine.com
googleapis.com <- google.com musicvideomachine.com
jquery.com     <- followshows.com radd.it
jsdelivr.net   <- alternativeto.net rottentomatoes.com
ytimg.com      <- radd.it youtube.com
*/
user_pref('capability.policy.maonoscript.sites', ' \
  alternativeto.net http://alternativeto.net https://alternativeto.net \
    msecnd.net http://msecnd.net https://msecnd.net \
    algolia.net http://algolia.net https://algolia.net \
  amazon.com http://amazon.com https://amazon.com \
    images-amazon.com http://images-amazon.com https://images-amazon.com \
  avclub.com http://avclub.com https://avclub.com \
    onionstatic.com http://onionstatic.com https://onionstatic.com \
  bandcamp.com http://bandcamp.com https://bandcamp.com \
    bcbits.com http://bcbits.com https://bcbits.com \
  cloudflare.com http://cloudflare.com https://cloudflare.com \
  facebook.com http://facebook.com https://facebook.com \
    akamaihd.net http://akamaihd.net https://akamaihd.net \
  followshows.com http://followshows.com https://followshows.com \
  github.com http://github.com https://github.com \
    amazonaws.com http://amazonaws.com https://amazonaws.com \
  google.com http://google.com https://google.com \
    gstatic.com http://gstatic.com https://gstatic.com \
  googleapis.com http://googleapis.com https://googleapis.com \
  imgur.com http://imgur.com https://imgur.com \
  jottit.com http://jottit.com https://jottit.com \
  jquery.com http://jquery.com https://jquery.com \
  jsdelivr.net http://jsdelivr.net https://jsdelivr.net \
  kat.cr http://kat.cr https://kat.cr \
    kastatic.com http://kastatic.com https://kastatic.com \
  liveleak.com http://liveleak.com https://liveleak.com \
  musicvideomachine.com http://musicvideomachine.com \
    https://musicvideomachine.com \
    audioscrobbler.com http://audio scrobbler.com https://audioscrobbler.com \
  radd.it http://radd.it https://radd.it \
    datatables.net http://datatables.net https://datatables.net \
    googlevideo.com http://googlevideo.com https://googlevideo.com \
  reddit.com http://reddit.com https://reddit.com \
    redditstatic.com http://redditstatic.com https://redditstatic.com \
  rottentomatoes.com http://rottentomatoes.com https://rottentomatoes.com \
    cloudfront.net http://cloudfront.net https://cloudfront.net \
    jwpsrv.com http://jwpsrv.com https://jwpsrv.com \
  shuffler.fm http://shuffler.fm https://shuffler.fm \
  sleepyti.me http://sleepyti.me https://sleepyti.me \
  soundcloud.com http://soundcloud.com https://soundcloud.com \
    sndcdn.com http://sndcdn.com https://sndcdn.com \
  stackoverflow.com http://stackoverflow.com https://stackoverflow.com \
    superuser.com http://superuser.com https://superuser.com \
    serverfault.com http://serverfault.com https://serverfault.com \
    stackexchange.com http://stackexchange.com https://stackexchange.com \
    askubuntu.com http://askubuntu.com https://askubuntu.com \
    sstatic.net http://sstatic.net https://sstatic.net \
    mathjax.org http://mathjax.org https://mathjax.org \
    stacksnippets.net http://stacksnippets.net https://stacksnippets.net \
  vimeo.com http://vimeo.com https://vimeo.com \
    vimeocdn.com http://vimeocdn.com https://vimeocdn.com \
  wikipedia.org http://wikipedia.org https://wikipedia.org \
    wikimedia.org http://wikimedia.org https://wikimedia.org \
  youtube.com http://youtube.com https://youtube.com \
    allow-any-origin.appspot.com \
    http://allow-any-origin.appspot.com https://allow-any-origin.appspot.com \
  ytimg.com http://ytimg.com https://ytimg.com \
');

// dxr.mozilla.org/mozilla-central/source/services/datareporting/policy.jsm
user_pref('datareporting.policy.dataSubmissionPolicyAcceptedVersion', 2);
user_pref('datareporting.policy.dataSubmissionPolicyNotifiedTime',
  '1325397600000');

// blocklist.xml
user_pref('extensions.blocklist.enabled', false);

// about:config warning
user_pref('general.warnOnAboutConfig', false);

// share your location
user_pref('geo.enabled', false);

// fuck gifs once and for all
user_pref('image.animation_mode', 'none');

// need for musicbrainz picard
user_pref('noscript.ABE.enabled', false);

// javascript: URIs typed or pasted in the address bar
user_pref('noscript.allowURLBarJS', true);

// noscript
user_pref('noscript.filterXPost', false);

// do not display the release notes on updates
user_pref('noscript.firstRunRedirection', false);

// noscript
user_pref('noscript.forbidFlash', false);

// noscript
user_pref('noscript.forbidFonts', false);

// noscript
user_pref('noscript.forbidMedia', false);

// noscript
user_pref('noscript.forbidPlugins', false);

// show message about blocked scripts
user_pref('noscript.notify', false);

// noscript
user_pref('noscript.showAbout', false);

// noscript
user_pref('noscript.showAllowPage', false);

// noscript
user_pref('noscript.showDistrust', false);

// noscript
user_pref('noscript.showGlobal', false);

// noscript
user_pref('noscript.showRecentlyBlocked', false);

// noscript
user_pref('noscript.showRevokeTemp', false);

// noscript
user_pref('noscript.showTemp', false);

// noscript
user_pref('noscript.showTempToPerm', false);

// noscript
user_pref('noscript.showUntrusted', false);

// reader view
user_pref('reader.parse-on-load.enabled', false);

// do not remember passwords
user_pref('signon.rememberSignons', false);
