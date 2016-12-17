/*
- must use ‘false’ where appropriate; ‘0’ will not work
- user.js is bad. GUI changes get saved to prefs.js, which gets overwritten by
  user.js on restart
*/

/* always ask me where to save files */
user_pref('browser.download.folderList', 0);

/* provide search suggestions */
user_pref('browser.search.suggest.enabled', false);

/* disable sync promo */
user_pref('browser.syncPromoViewsLeftMap', '{"bookmarks":0}');

/* disable new tab page */
user_pref('browser.newtabpage.enabled', false);
user_pref('browser.newtabpage.introShown', true);

/* do not generate smart bookmarks */
user_pref('browser.places.smartBookmarksVersion', 1);

/* disable first run page */
user_pref('browser.startup.homepage_override.mstone', 'ignore');

/* show windows and tabs from last time */
user_pref('browser.startup.page', 3);

/* title bar */
user_pref('browser.tabs.drawInTitlebar', false);

/* multiprocess windows */
user_pref('browser.tabs.remote.autostart.2', false);

/* jumplist setting */
user_pref('browser.taskbar.lists.enabled', false);

/* disable URL autocomplete */
user_pref('browser.urlbar.autoFill', false);

/* disable switch to tab */
user_pref('browser.migration.version', 26);
user_pref('browser.urlbar.suggest.openpage', false);

/* do not trim URLs */
user_pref('browser.urlbar.trimURLs', false);

/* dxr.mozilla.org/mozilla-central/source/services/datareporting/policy.jsm */
user_pref('datareporting.policy.dataSubmissionPolicyAcceptedVersion', 2);
user_pref('datareporting.policy.dataSubmissionPolicyNotifiedTime',
  '1325397600000');

/* blocklist.xml */
user_pref('extensions.blocklist.enabled', false);

/* disable pocket */
user_pref('extensions.pocket.enabled', false);

/* about:config warning */
user_pref('general.warnOnAboutConfig', false);

/* share your location */
user_pref('geo.enabled', false);

/* play gifs once */
user_pref('image.animation_mode', 'once');

/* reader view */
user_pref('reader.parse-on-load.enabled', false);

/* need this to use bookmarklets @ github.com */
user_pref('security.csp.enable', false);

/* do not remember passwords */
user_pref('signon.rememberSignons', false);
