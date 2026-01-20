{ pkgs, ... }:
{
  imports = [
    ./audio
    ./boot
    ./font
    ./keyboard
    ./locale
    ./networking
    ./nix
    ./printing
    ./user

    ./home-manager
    ./nixos-generators

    ./auto-upgrade
    ./display_manager
    ./plymouth
    ./ydotool
    ./nix-ld
    ./v4l2loopback
    ./mumble
    ./overlay

    ./appimage
    ./flatpak

    ./android

    ./fcitx5
    ./gnome-keyring
    ./gnupg
    ./keyd
    ./openssh
    ./caddy
    ./obs-studio

    ./hyprland
    ./plasma
    ./niri
    ./mango
    ./i3

    ./distrobox
    ./podman
    ./virt-manager

    ./partition-manager
  ];

  environment.systemPackages = with pkgs; [
    clang
    gcc
    gparted
  ];
  environment.sessionVariables = rec {
    # XDG_CACHE_HOME  = "$HOME/.cache";
    # XDG_CONFIG_HOME = "$HOME/.config";
    # XDG_DATA_HOME   = "$HOME/.local/share";
    # XDG_STATE_HOME  = "$HOME/.local/state";

    # XDG_BIN_HOME    = "$HOME/.local/bin";
    # PATH = [
    #   "${XDG_BIN_HOME}"
    # ];
  };
}
