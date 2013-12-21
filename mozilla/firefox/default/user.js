// disable new tab page
user_pref("browser.newtab.url", "about:blank");

// do not generate smart Bookmarks
user_pref("browser.places.smartBookmarksVersion", 1);

// disable "know your rights" page
user_pref("browser.rights.3.shown", true);

// disable first run page
user_pref("browser.startup.homepage_override.mstone", "ignore");

// show windows and tabs from last time
user_pref("browser.startup.page", 3);

// disable sync promo
user_pref("browser.syncPromoViewsLeftMap", 0);

// tabs on top
user_pref("browser.tabs.onTop", false);

// warn before closing multiple tabs
user_pref("browser.tabs.warnOnClose", false);

// disable URL autocomplete
user_pref("browser.urlbar.autoFill", false);

// do not trim URLs
user_pref("browser.urlbar.trimURLs", false);

/*
http://dxr.mozilla.org/mozilla-central/source/services/datareporting/policy.jsm
*/
user_pref("datareporting.policy.dataSubmissionPolicyResponseTime",
          "1325397600000");

// do not ask to correct Typos
user_pref("extensions.adblockplus.correctTyposAsked", true);

// do not show tabs on flash
user_pref("extensions.adblockplus.frameobjects", false);

// hide Contribute Button
user_pref("extensions.adblockplus.hideContributeButton", true);

// do not show "Welcome to DownThemAll" page
user_pref("extensions.dta.version", 0);

// FireSizer
user_pref("extensions.firesizer.dimensionlist.outer", "1150x800;1150x946");

// minimum font size
user_pref("font.minimum-size.x-western", 14);

// monospace font
user_pref("font.name.monospace.x-western", "Lucida Console");

// display scaling options
user_pref("layout.css.devPixelsPerPx", "1.1");

// disable smooth scrolling
user_pref("general.smoothScroll", false);

// about:config warning
user_pref("general.warnOnAboutConfig", false);

// disable spell check
user_pref("layout.spellcheckDefault", 0);

// do not track
user_pref("privacy.donottrackheader.enabled", true);

// security warning nag
user_pref("security.warn_viewing_mixed", false);

// do not remember passwords
user_pref("signon.rememberSignons", false);

// disable status bar delay
user_pref("status4evar.status.linkOver.delay.show", 0);
