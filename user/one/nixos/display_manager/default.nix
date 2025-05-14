{ username, ... }: {
  services.displayManager = {
    sddm.enable = true;
    autoLogin = {
      enable = true;
      user = username;
    };
    defaultSession = "hyprland";
  };
}
