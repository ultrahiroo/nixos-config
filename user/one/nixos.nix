{ username, pkgs, ... }: {
  imports = [
    ../../nixos/common
    ../../nixos/keyd
    ../../nixos/fcitx5
    ../../nixos/plasma
    ../../nixos/gnupg
    ../../nixos/gnome-keyring
    ../../nixos/wireguard
  ];
  users.users.${username}.shell = pkgs.yash;
}
