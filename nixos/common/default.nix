{ pkgs, ... }: {
  imports = [
    ./audio
    ./font
    ./locale
    ./nix
    ./user
    ./xserver
  ];

  programs.dconf.enable = true;
  security.polkit.enable = true;

  services = {
    dbus.packages = [pkgs.gcr];

    geoclue2.enable = true;

    udev.packages = with pkgs; [gnome-settings-daemon];

    openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };

    power-profiles-daemon = {
      enable = true;
    };

    printing.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    sysstat
    lm_sensors
    neofetch
    # scrot
    # xfce.thunar
    # nnn
  ];

  networking.firewall.enable = false;
}
