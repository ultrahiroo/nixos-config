{ lib, pkgs, ... }: {
  imports = [
    ./bat
    ./btop
    ./gh
    ./git
    ./yash
    ./xdg

    ./i3
    ./plasma
    ./hyprland
    ./waybar
    ./maomaowm

    ./terminal
    ./editor
    ./browser

    ./mydns
    ./web_server
    ./bottles
  ];

  home = {
    packages = with pkgs; [
      bcachefs-tools
      btrfs-progs
      e2fsprogs
      xfsprogs

      compsize
      killall

      cloc
      scc

      droidcam

      appimage-run
      baobab
      bat
      blender
      cargo
      curl
      custom.clean
      devenv
      disko
      eza
      fd
      file
      gimp3
      gnumake
      gptfdisk
      meson
      neofetch
      nodejs
      kdePackages.filelight
      kdePackages.kdeconnect-kde
      kdePackages.kdenlive
      python3
      python3Packages.pip
      python3Packages.virtualenv
      ripgrep
      shotcut
      tmux
      unixtools.quota
      unzip
      vlc
      waybar
      wget
      wireproxy
      wl-clipboard
      xclip
      yash

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
