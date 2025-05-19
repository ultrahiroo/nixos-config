{ username, pkgs, ... }: {
  imports = [
    ./common
    ./display_manager
    ./appimage

    ./fcitx5
    ./gnome-keyring
    ./gnupg
    ./hyprland
    ./keyd
    ./openssh
    ./plasma
    ./steam
    ./caddy

    ./waydroid
    ./distrobox
    ./virtualbox
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

    EDITOR   = "nvim";
    BROWSER  = "brave";
    TERMINAL = "alacritty";
  };
}
