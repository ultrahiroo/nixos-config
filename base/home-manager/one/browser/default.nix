{ ... }: {
  imports = [
    ./brave
    ./chromium
    ./firefox
  ];
  home.sessionVariables = {
    BROWSER = "firefox";
  };
}
