// remove stark white from new tab page
user_pref("browser.display.background_color", "#eef0ec");

// disable new tab page
user_pref("browser.newtab.url", "about:blank");

// know your rights
user_pref("browser.rights.3.shown", true);

// show windows and tabs from last time
user_pref("browser.startup.page", 3);

// tabs on top
user_pref("browser.tabs.onTop", false);

// warn before closing multiple tabs
user_pref("browser.tabs.warnOnClose", false);

// trim URLs
user_pref("browser.urlbar.trimURLs", false);

// do not show tabs on flash
user_pref("extensions.adblockplus.frameobjects", false);

// adblock plus
user_pref("extensions.adblockplus.hideContributeButton", true);

// FireSizer
user_pref("extensions.firesizer.dimensionlist.outer", "1200x850");

// minimum font size
user_pref("font.minimum-size.x-western", 14);

// disable smooth scrolling
user_pref("general.smoothScroll", false);

// about:config warning
user_pref("general.warnOnAboutConfig", false);

// disable spell check
user_pref("layout.spellcheckDefault", 0);

// security warning nag
user_pref("security.warn_viewing_mixed", false);

// remember passwords
user_pref("signon.rememberSignons", false);

// status bar delay
user_pref("status4evar.status.linkOver.delay.show", 0);

// help mozilla by sending information
user_pref("toolkit.telemetry.prompted", 2);
