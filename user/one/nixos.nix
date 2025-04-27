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
    ../../nixos/steam
    ../../nixos/caddy
    # ../../nixos/web_server
    ../../nixos/waydroid
    ../../nixos/distrobox
    # ../../nixos/virtualbox
    ../../nixos/virt-manager
  ];
  users.users.${username}.shell = pkgs.yash;
  environment.systemPackages = with pkgs; [
    virtiofsd
  ];
}
