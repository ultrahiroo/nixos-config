{ pkgs, ... }: {
  imports = [
    ./audio
    ./font
    ./keyboard
    ./locale
    ./networking
    ./nix
    ./user
  ];

  programs.dconf.enable = true;
  security.polkit.enable = true;

  services = {
    dbus.packages = with pkgs; [ gcr ];
    geoclue2.enable = true;
    udev.packages = with pkgs; [ gnome-settings-daemon ];
    printing.enable = true;
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      fusePackages.fuse_2  # custom.davinci-resolve
    ];
  };

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
}
