{ default_username, ... }: {
  services.displayManager = {
    sddm.enable = true;
    autoLogin = {
      enable = true;
      user = default_username;
    };
    defaultSession = "mango";
  };
}
