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
      policies = {
        ExtensionSettings = with builtins;
          let extension = shortId: uuid: {
            name = uuid;
            value = {
              install_url = (
                "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi"
              );
              installation_mode = "normal_installed";
            };
          };
          in listToAttrs [
            (extension "adguard-adblocker" "adguardadblocker@adguard.com")
            (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
            (extension "deepl-translate" "firefox-extension@deepl.com")
            (extension "onetab" "extension@one-tab.com")
            (extension "raindropio" "jid0-adyhmvsP91nUO8pRv0Mn2VKeB84@jetpack")
            # (extension "ublock-origin" "uBlock0@raymondhill.net")
            (extension "vimium-c" "vimium-c@gdh1995.cn")
          ];
      };
      profiles = {
        default = {
          id = 0;
          extensions = {
            # packages = with pkgs.firefox-addons; [
            #   raindropio
            #   vimium-c
            # ];
          };
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
          id = 1;
        };
      };
    };
  };
}
