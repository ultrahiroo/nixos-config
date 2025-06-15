{ pkgs, ... }: {
  imports = [
    ./auto-upgrade
    ./common
    ./display_manager
    ./plymouth
    ./ydotool
    ./nix-ld
    ./v4l2loopback
    ./mumble

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
    ./maomaowm

    ./distrobox
    ./virt-manager
  ];

  environment.systemPackages = with pkgs; [
    clang
    gcc
    gparted
    kdePackages.partitionmanager
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
