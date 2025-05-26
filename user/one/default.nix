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
    ./maomaowm

    ./brave
    ./chromium
    ./firefox

    ./kate
    ./neovim

    ./alacritty

    ./mydns
    ./web_server
  ];

  home = {
    packages = with pkgs; [
      custom.terminal_emulator
      foot
      kdePackages.konsole
      kitty
      warp-terminal

      appimage-run
      baobab
      bat
      blender
      cargo
      curl
      custom.clean
      devenv
      eza
      fd
      file
      gimp3
      gnumake
      meson
      neofetch
      nodejs
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
      custom.codon
      davinci-resolve

      cpu-x
      looking-glass-client
      protonup-qt
      unityhub
    ]);
  };
}
