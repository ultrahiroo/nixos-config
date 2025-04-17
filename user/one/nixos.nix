{ username, pkgs, ... }: {
  imports = [
    ../../nixos/common
    ../../nixos/fcitx5
    ../../nixos/gnome-keyring
    ../../nixos/gnupg
    ../../nixos/hyprland
    ../../nixos/keyd
    ../../nixos/openssh
    ../../nixos/plasma
    ../../nixos/wireguard
  ];
  users.users.${username}.shell = pkgs.yash;
}
