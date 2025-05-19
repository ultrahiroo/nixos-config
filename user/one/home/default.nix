{ inputs, pkgs, username, ... }: {
  imports = [
    ./common
    ./btop
    ./gh
    ./git
    ./yash
    ./font

    ./i3
    ./plasma
    ./hyprland
    ./waybar

    ./brave
    ./chromium
    ./firefox

    ./kate
    ./neovim

    ./alacritty

    ./mydns
    # ./wireproxy
    ./web_server

    ./virt-manager
  ];
  home = {
    packages = with pkgs; [
      cleanPackage.clean
      codonPackage.codon
      # davinci-resolvePackage.davinci-resolve

      alacritty
      appimage-run
      baobab
      bat
      blender
      caddy
      cmake
      cpu-x
      curl
      devenv
      eza
      fd
      gimp
      gg
      gnumake
      hyprpaper
      looking-glass-client
      meson
      neofetch
      nodejs_23
      nvtopPackages.full
      kdePackages.filelight
      kdePackages.kate
      kdePackages.kdeconnect-kde
      kdePackages.kdenlive
      obs-studio
      python3
      python3Packages.pip
      python3Packages.virtualenv
      ripgrep
      scc
      tmux
      unityhub
      unixtools.quota
      unzip
      vlc
      vscode
      waybar
      wget
      wireproxy
      wl-clipboard
      xclip
      yash

      bottles
      # heroic
      # lutris
      mangohud
      protonup-qt
      # rare
    ];
  };
}
