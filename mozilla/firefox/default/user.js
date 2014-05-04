/*
newtab.url                        disable new tab page
places.smartBookmarksVersion      do not generate smart bookmarks
startup.homepage_override.mstone  disable first run page
startup.page                      show windows and tabs from last time
syncPromoViewsLeftMap             disable sync promo
tabs.drawInTitlebar               title bar
urlbar.autoFill                   disable URL autocomplete
urlbar.trimURLs                   do not trim URLs
*/
user_pref('browser.newtab.url', 'about:blank');
user_pref('browser.places.smartBookmarksVersion', 1);
user_pref('browser.startup.homepage_override.mstone', 'ignore');
user_pref('browser.startup.page', 3);
user_pref('browser.syncPromoViewsLeftMap', '{"addons":0}');
user_pref('browser.tabs.drawInTitlebar', false);
user_pref('browser.urlbar.autoFill', false);
user_pref('browser.urlbar.trimURLs', false);

/*
currentVersion        this is required after install
frameobjects          do not show tabs on flash
hideContributeButton  hide contribute button
*/
user_pref('extensions.adblockplus.currentVersion', '2');
user_pref('extensions.adblockplus.frameobjects', false);
user_pref('extensions.adblockplus.hideContributeButton', true);

/*
dimensionlist.outer  current sizes
*/
user_pref('extensions.firesizer.dimensionlist.outer', '1050x750');

/*
fullZoomLevel  default full page zoom level
textZoomLevel  default text-only zoom level
hideStatus     current zoom levels in status bar
prefsVersion   required
version        thanks for installing nosquint
rememberSites  forget all per-site settings when firefox closes
*/
user_pref('extensions.nosquint.fullZoomLevel', 95);
user_pref('extensions.nosquint.textZoomLevel', 95);
user_pref('extensions.nosquint.hideStatus', true);
user_pref('extensions.nosquint.prefsVersion', '2.0');
user_pref('extensions.nosquint.version', '2');
user_pref('extensions.nosquint.rememberSites', false);

/*
minimum-size.x-western    minimum font size
name.monospace.x-western  monospace font
*/
user_pref('font.minimum-size.x-western', 14);
user_pref('font.name.monospace.x-western', 'Lucida Console');

/*
smoothScroll       disable smooth scrolling
warnOnAboutConfig  about:config warning
*/
user_pref('general.smoothScroll', false);
user_pref('general.warnOnAboutConfig', false);

/*
css.devPixelsPerPx  display scaling
*/
user_pref('layout.css.devPixelsPerPx', '1.19');

/*
rememberSignons  do not remember passwords
*/
user_pref('signon.rememberSignons', false);

/*
status                      do not show status in toolbar
status.linkOver.delay.show  disable status bar delay
*/
user_pref("status4evar.status", 0);
user_pref('status4evar.status.linkOver.delay.show', 0);
