{ lib, pkgs, ... }: {
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
    ./web_server

    ./virt-manager
  ];
  home = {
    packages = with pkgs; [
      cleanPackage.clean

      alacritty
      appimage-run
      baobab
      bat
      blender
      caddy
      cargo
      cmake
      curl
      devenv
      eza
      fd
      file
      gimp
      gg
      gnumake
      hyprpaper
      libxml2
      meson
      neofetch
      nodejs_23
      nvtopPackages.full
      kdePackages.filelight
      kdePackages.kate
      kdePackages.kdeconnect-kde
      kdePackages.kdenlive
      killall
      obs-studio
      python3
      python3Packages.pip
      python3Packages.virtualenv
      ripgrep
      scc
      shotcut
      tmux
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
      # rare
    ] ++ lib.optionals stdenv.isx86_64 (with pkgs; [
      codonPackage.codon
      # davinci-resolvePackage.davinci-resolve
      davinci-resolve

      cpu-x
      looking-glass-client
      protonup-qt
      unityhub
    ]);
  };
}
