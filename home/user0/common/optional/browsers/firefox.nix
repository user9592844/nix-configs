{ lib, config, ... }:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in {
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontcheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      SearchBar = "unified";

      # Declare Extensions
      ExtensionSettings = {
        "*".installation_mode = "blocked";

        "{72b2e02b-3a71-4895-886c-fd12ebe36ba3}" = { # Bulk Media Downloader
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/bulk-media-downloader/";
          installation_mode = "force_installed";
        };
        "jid1-vs5odTmtIydjMg@jetpack" = { # Copy Selected Links
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/copy-selected-links/";
          installation_mode = "force_installed";
        };
        "{DDC359D1-844A-42a7-9AA1-88A850A938A8}" = { # DownThemAll!
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/downthemall/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search";
          installation_mode = "force_installed";
        };
        "exif_viewer@mozilla.doslash.org" = { # Exif Viewer
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/exif-viewer/";
          installation_mode = "force_installed";
        };
        "@testpilot-containers" = { # Multi-Account Containers
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search";
          installation_mode = "force_installed";
        };
        "{4a313247-8330-4a81-948e-b79936516f78}" = { # Image Search Options
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/image-search-options/";
          installation_mode = "force_installed";
        };
        "nimbusscreencaptureff@everhelper.me" = { # Nimbus Screen Capture
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/nimbus-screenshot/";
          installation_mode = "force_installed";
        };
        "extension@one-tab.com" = { # OneTab
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/onetab/";
          installation_mode = "force_installed";
        };
        "{0c8fbd76-bdeb-4c52-9b24-d587ce7b9dc3}" = { # Resurrect Pages
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/resurrect-pages/";
          installation_mode = "force_installed";
        };
        "{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}" = { # Search by Image
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/search_by_image/";
          installation_mode = "force_installed";
        };
        "{531906d3-e22f-4a6c-a102-8057b88a1a63}" = { # SingleFile
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/single-file/";
          installation_mode = "force_installed";
        };
        "{0b457cAA-602d-484a-8fe7-c1d894a011ba}" = { # FireShot
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/fireshot/";
          installation_mode = "force_installed";
        };
        "@m3u8link" = { # The Stream Detector
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/hls-stream-detector/";
          installation_mode = "force_installed";
        };
        "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}" =
          { # User-Agent Switcher and Manager
            install_url =
              "https://addons.mozilla.org/en-US/firefox/addon/user-agent-string-switcher/";
            installation_mode = "force_installed";
          };
        "{b9db16a4-6edc-47ec-a1f4-b86292ed211d}" = { # Video DownloadHelper
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/video-downloadhelper/";
          installation_mode = "force_installed";
        };
        "{d07ccf11-c0cd-4938-a265-2a4d6ad01189}" = { # Web Archives
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/view-page-archive/";
          installation_mode = "force_installed";
        };
        "uBlock0@raymondhill.net" = { # uBlock Origin
          install_url =
            "https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/";
          installation_mode = "force_installed";
        };
      };
      Preferences = {
        "browser.contentblocking.category" = {
          Value = "strict";
          Status = "locked";
        };
        "extensions.pocket.enabled" = lock-false;
        "browser.formfill.enable" = lock-false;
        "browser.search.suggest.enabled" = lock-false;
        "browser.search.suggest.enabled.private" = lock-false;
        "browser.urlbar.suggest.searches" = lock-false;
        "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" =
          lock-false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" =
          lock-false;

        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" =
          lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" =
          lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" =
          lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;

        "privacy.donottrackheader.enabled" = lock-true;
        "privacy.clearSiteData.historyFormDataAndDownloads" = lock-true;
        "privacy.clearSiteData.cache" = lock-true;
        "privacy.clearSiteData.cookiesAndStorage" = lock-true;
        "privacy.clearSiteData.siteSettings" = lock-true;
        "privacy.clearHistory.cache" = lock-true;
        "privacy.clearHistory.cookiesAndStorage" = lock-true;
        "privacy.clearHistory.historyFormDataAndDownloads" = lock-true;
        "privacy.clearHistory.siteSettings" = lock-true;
      };
    };
  };
}
