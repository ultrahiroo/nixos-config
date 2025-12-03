{ default_username, ... }: {
  services.displayManager = {
    sddm.enable = true;
    autoLogin = {
      enable = false;
      user = default_username;
    };
    defaultSession = "mango";
  };
}
