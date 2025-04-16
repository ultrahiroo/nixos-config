{ pkgs, ... }: {
  imports = [
    ./audio
    ./font
    ./keyboard
    ./locale
    ./nix
    ./user
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

    printing.enable = true;
  };

  environment.systemPackages = with pkgs; [
  ];

  networking.firewall.enable = false;
}
