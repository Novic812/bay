// user.js is bad because it will trash any changes you have made on restart

// always ask me where to save files
user_pref('browser.download.folderList', 0);

// disable sync promo
user_pref('browser.migration.version', 22);

// disable new tab page
user_pref('browser.newtabpage.enabled', false);
user_pref('browser.newtabpage.introShown', true);

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

// reader view
user_pref('reader.parse-on-load.enabled', false);

// do not remember passwords
user_pref('signon.rememberSignons', false);
