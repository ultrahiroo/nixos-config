{ lib, pkgs, ... }: {
  home.file.".mozilla/firefox/default/search.json.mozlz4" = {
    force = lib.mkForce true;
  };
  programs = {
    firefox = {
      enable = true;
      languagePacks = [
        "ja"
      ];
      profiles = {
        default = {
          id = 1;
          settings = {
            "app.normandy.first_run" = false;
            # "browser.laterrun.bookkeeping.sessionCount" = 1;
            "browser.newtabpage.enabled" = false;
            # "browser.sessionstore.max_resumed_crashes" = 3;
            # "browser.sessionstore.resume_from_crash" = true;
            # "browser.startup.couldRestoreSession.count" = 2;
            "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
            "browser.startup.page" = 3;
            "browser.toolbars.bookmarks.visibility" = "never";
            "browser.translations.mostRecentTargetLanguages" = "ja";
            "browser.translations.automaticallyPopup" = false;
            "browser.urlbar.quicksuggest.enabled" = true;
            "browser.urlbar.suggest.quicksuggest.nonsponsored" = true;
            # "browser.urlbar.showSearchSuggestionsFirst" = false;
            "browser.urlbar.suggest.recentsearches" = true;
            "browser.urlbar.suggest.topsites" = false;
            "browser.urlbar.suggest.trending" = false;
            "intl.locale.requested" = "ja,en-US";
            "sidebar.verticalTabs" = true;
            "sidebar.visibility" = "always-show";
            "ui.key.menuAccessKeyFocuses" = false;

            "extensions.webextensions.ExtensionStorageIDB.migrated.adguardadblocker@adguard.com" = true;

            "browser.uiCustomization.state" = {
              "placements" = {
                "widget-overflow-fixed-list" = [];
                "unified-extensions-area" = [];
                "nav-bar" = [
                  "back-button"
                  "forward-button"
                  "stop-reload-button"
                  "customizableui-special-spring1"
                  "vertical-spacer"
                  "urlbar-container"
                  "customizableui-special-spring2"
                  # "save-to-pocket-button"
                  "downloads-button"
                  # "fxa-toolbar-menu-button"
                  "unified-extensions-button"
                  "firefox-view-button"
                  # "new-tab-button"
                  "alltabs-button"
                  # "sidebar-button"
                ];
                "toolbar-menubar" = [
                    "menubar-items"
                ];
                "TabsToolbar" = [];
                "vertical-tabs" = [
                    "tabbrowser-tabs"
                ];
                "PersonalToolbar" = [
                    "import-button"
                    "personal-bookmarks"
                ];
              };
              "seen" = [
                "save-to-pocket-button"
                "developer-button"
              ];
              "dirtyAreaCache" = [
                  "nav-bar"
                  "vertical-tabs"
                  "PersonalToolbar"
                  "toolbar-menubar"
                  "TabsToolbar"
              ];
              "currentVersion" = 22;
              "newElementCount" = 2;
            };
          };
          search.engines = {
            "Nix Packages" = {
              definedAliases = [ "@np" ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
            };
            "Nix Options" = {
              definedAliases = [ "@no" ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
            };
          };
        };
        one = {
          id = 0;
        };
      };
    };
  };
}
