{ pkgs, ... }: {
  imports = [
    ./audio
    ./font
    ./keyboard
    ./locale
    ./network
    ./nix
    ./user
  ];

  programs.dconf.enable = true;
  security.polkit.enable = true;

  security.pam.services.login.enableGnomeKeyring = true;
  services = {
    dbus.packages = with pkgs; [ gcr ];
    geoclue2.enable = true;
    udev.packages = with pkgs; [ gnome-settings-daemon ];
    printing.enable = true;
  };
}
