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
    ../../nixos/steam
  ];
  users.users.${username}.shell = pkgs.yash;
}
