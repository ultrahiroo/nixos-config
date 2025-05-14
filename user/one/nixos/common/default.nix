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

  services = {
    dbus.packages = with pkgs; [ gcr ];
    geoclue2.enable = true;
    udev.packages = with pkgs; [ gnome-settings-daemon ];
    printing.enable = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
}
