{ ... }: {
  imports = [
    ./brave
    ./chromium
    ./firefox
  ];
  systemd.user.sessionVariables = {
    BROWSER  = "firefox";
  };
}
