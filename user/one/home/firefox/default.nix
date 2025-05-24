{ ... }: {
  programs = {
    firefox = {
      enable = true;
      profiles = {
        default = {
          id = 1;
          settings = {
            "app.normandy.first_run" = false;
            "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
            "ui.key.menuAccessKeyFocuses" = false;
          };
        };
        one = {
          id = 0;
        };
      };
      languagePacks = [
        "ja"
      ];
    };
  };
}
