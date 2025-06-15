{ default_username, pkgs, ... }: {
  services.displayManager = {
    sddm.enable = true;
    autoLogin = {
      enable = true;
      user = default_username;
    };
    defaultSession = if pkgs.stdenv.isx86_64 then "hyprland" else "plasma";
  };
}
